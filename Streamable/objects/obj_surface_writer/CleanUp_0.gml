/// @description Remove buffers
stop_camera();
buffer_delete(buffer);
buffer_delete(flag_buffer);
surface_free(display_surface);
