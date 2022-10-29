/// @description Find the lowest object.
lowest_object = lowest_at_point(mouse_x, mouse_y);

if (keyboard_check(vk_f6))
{
	show_debug_message(lowest_object);	
}