import pyvirtualcam
import numpy as np
import mmap
import time

with pyvirtualcam.Camera(width=1920, height=1080, fps=120) as cam:
    num_buffers = 3
    shm = mmap.mmap(-1, 1920*1080*4*num_buffers, "Local\\MyFileMappingObject")
    flag = mmap.mmap(-1, 8, "Local\\FrameFlag")
    frame = np.frombuffer(shm, np.uint8)
    frame = frame.reshape((num_buffers, 1080, 1920, 4))
    buff_num = 0

    print("Ready!")

    while True:
        next_buff = (buff_num + 1) % num_buffers

        if (flag[next_buff] == 1):
            buff_num = next_buff

        cam.send(frame[buff_num][:,:,:3])
        flag[buff_num] = 0
        cam.sleep_until_next_frame()
        
        