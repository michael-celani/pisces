/// @description 
if focused
{
	cursor_blink += delta_time;
	cursor_alpha = smootherstep(0, 1000000 * .25, cursor_blink);
	curr_string = keyboard_string;
	
	draw_set_font(fnt_segoe);
	cursor_next_x = x + 15 + string_width(curr_string);
	cursor_x = (2 * cursor_x + cursor_next_x) / 3.0;
}
else
{
	cursor_alpha = 0;
	cursor_blink = 0;
	cursor_x = x + room_width;
}


event_inherited();

