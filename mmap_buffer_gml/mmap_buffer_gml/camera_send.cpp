#define PY_SSIZE_T_CLEAN
#define BOOST_PYTHON_STATIC_LIB
#define BOOST_NUMPY_STATIC_LIB
#include <windows.h>
#include <stdio.h>
#include <conio.h>
#include <tchar.h>
#include <vector>
#include <iostream>
#include "virtual_output.h"
#include <thread>
#include "camera_send.h"

// File Pointers
VirtualOutput *camera;

extern "C" __declspec(dllexport) double camera_is_installed()
{
    LPCWSTR guid = L"CLSID\\{A3FCE0F5-3493-419F-958A-ABA1250EC20B}";
    HKEY key = nullptr;

    if (RegOpenKeyExW(HKEY_CLASSES_ROOT, guid, 0, KEY_READ, &key) != ERROR_SUCCESS) {
        return 0;
    }
    else
    {
        RegCloseKey(key);
        return 1;
    }
}

extern "C" __declspec(dllexport) double start_camera()
{
    camera = new VirtualOutput(1920, 1080, 120, libyuv::FOURCC_ABGR);
    return 0;
}

extern "C" __declspec(dllexport) double send_frame(unsigned char* buff, unsigned char* ready, double buff_num)
{
    int index = (int) buff_num;
    buff = &buff[index * 1920 * 1080 * 4];
    ready = &ready[index];

    std::thread(send_frame_impl, buff, ready).detach();
    return 0;
}

void send_frame_impl(unsigned char* buff, unsigned char* ready)
{
    camera->send(buff);
    *ready = 0;
}
