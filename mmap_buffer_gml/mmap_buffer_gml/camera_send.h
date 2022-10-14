#pragma once
void send_frame_impl(unsigned char* buff, unsigned char* ready);
extern "C" __declspec(dllexport) double start_camera();
extern "C" __declspec(dllexport) double send_frame(unsigned char* buff, unsigned char* ready, double buff_num);