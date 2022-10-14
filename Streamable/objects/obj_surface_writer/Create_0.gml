/// @description Create buffer

var surface_width = surface_get_width(application_surface);
var surface_height = surface_get_height(application_surface);
display_surface = surface_create(surface_width, surface_height);

curr_buff = 0;
num_buffers = 3
indv_size = surface_width * surface_height * 4;
buffer_size = indv_size * num_buffers;

// Create shared memory:
buff_num = 0
buffer = buffer_create(buffer_size, buffer_fast, 1);
buffer_addr = buffer_get_address(buffer);
flag_buffer = buffer_create(8, buffer_fast, 1);
flag_buffer_addr = buffer_get_address(flag_buffer);
time_since_frame = 0;
camera_on = camera_exists();

if (camera_on)
{
	show_debug_message("Camera exists");
	start_camera();
}
