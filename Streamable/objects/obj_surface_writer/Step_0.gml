/// @description
if !camera_on return;

time_since_frame += delta_time

// Read the values
buffer_seek(flag_buffer, buffer_seek_start, curr_buff);
if (buffer_read(flag_buffer, buffer_u8) == 1) {
	return;
}

if (surface_exists(display_surface) && time_since_frame > 8000) {
	buffer_seek(flag_buffer, buffer_seek_start, curr_buff);
	buffer_write(flag_buffer, buffer_u8, 1);
	
	buffer_get_surface(buffer, display_surface, indv_size * curr_buff);
	send_frame(buffer_addr, flag_buffer_addr, curr_buff);
	
	curr_buff = (curr_buff + 1) % num_buffers;
	time_since_frame = 0;
}