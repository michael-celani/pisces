// Copy all drawn things to the surface:

if (surface_exists(display_surface)) {
	buffer_seek(flag_buffer, buffer_seek_start, curr_buff);
	if (buffer_read(flag_buffer, buffer_u8) != 0) {
		return;
	}

	buffer_seek(flag_buffer, buffer_seek_start, curr_buff);
	buffer_write(flag_buffer, buffer_u8, 1);
	
	buffer_get_surface(buffer, display_surface, indv_size * curr_buff);
	
	buffer_seek(flag_buffer, buffer_seek_start, curr_buff);
	buffer_write(flag_buffer, buffer_u8, 2);
	
	curr_buff = (curr_buff + 1) % num_buffers;
}