/// @description Insert description here
var window_width = window_get_width();
var window_height = window_get_height();

if window_width == prev_window_width and window_height == prev_window_height return;
if window_width == 0 or window_height == 0 return;

prev_window_width = window_width;
prev_window_height = window_height;

room_width = window_width;
room_height = window_height;
display_set_gui_size(window_width, window_height);

with (obj_surface_writer)
{
	if surface_exists(display_surface) surface_free(display_surface);
	
	display_surface = surface_create(room_width, room_height);
}