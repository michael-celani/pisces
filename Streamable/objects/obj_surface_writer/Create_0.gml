/// @description Create buffer

var surface_width = surface_get_width(application_surface);
var surface_height = surface_get_height(application_surface);
display_surface = surface_create(surface_width, surface_height);

num_buffers = 3
buffer_size = surface_width * surface_height * 4 * num_buffers;

// Create shared memory:
buff_num = 0
buffer = buffer_create(buffer_size, buffer_fast, 1);
flag_buffer = buffer_create(8, buffer_fast, 1);
file = open_file("Local\\MyFileMappingObject", buffer_size);
flag = open_file("Local\\FrameFlag", 8);