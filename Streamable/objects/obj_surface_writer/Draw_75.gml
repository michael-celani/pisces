// Copy all drawn things to the surface:
if !surface_exists(final_surface)
	final_surface = surface_create(1920, 1080);

if (surface_exists(display_surface)) {
	buffer_seek(flag_buffer, buffer_seek_start, curr_buff);
	if (buffer_read(flag_buffer, buffer_u8) != 0) {
		return;
	}

	buffer_seek(flag_buffer, buffer_seek_start, curr_buff);
	buffer_write(flag_buffer, buffer_u8, 1);
	
	surface_set_target(final_surface)
	draw_surface_stretched(display_surface, 0, 0, 1920, 1080);
	surface_reset_target();
	
	buffer_get_surface(buffer, final_surface, indv_size * curr_buff);
	
	buffer_seek(flag_buffer, buffer_seek_start, curr_buff);
	buffer_write(flag_buffer, buffer_u8, 2);
	
	curr_buff = (curr_buff + 1) % num_buffers;
}