/// @description Wheel Up

var any_active = false;
	
with (obj_vertical_stack) {
	any_active = any_active || active	
}

if any_active {
	return;	
}

if width > room_width
{
	scroll_offset -= room_width / 3;
}