/// @description Send the application surface to a buffer

// Read from shared memory
copy_from_file(flag, buffer_get_address(flag_buffer), num_buffers);

// Read the values
buffer_seek(flag_buffer, buffer_seek_start, 0);

var curr_buffer = 0;
for (curr_buffer = 0; curr_buffer < num_buffers; curr_buffer++) {
	if (buffer_read(flag_buffer, buffer_u8) == 0) {
		break;
	}
}

if (curr_buffer == num_buffers) {
	return;	
}

if (surface_exists(display_surface))
{
	// Write to the buffer:
	buffer_get_surface(buffer, display_surface, 0);
	var address = buffer_get_address(buffer);
	copy_to_file(file, address, buffer_size / num_buffers, 1920 * 1080 * 4 * curr_buffer);
	
	// Tell the script that it can update the frame:
	buffer_seek(flag_buffer, buffer_seek_start, 0);
	buffer_write(flag_buffer, buffer_u8, 1);
	copy_to_file(flag, buffer_get_address(flag_buffer), 1, curr_buffer);
}