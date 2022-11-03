/// @description Add active.

event_inherited();

active = false;
y_offset = 0;
x = room_width;
y = room_height * 0.02;

x_active = 0;
x_inactive = 0;

draw_set_font(fnt_beleren);
draw_string = stack_name + " (" + string(array_length(stack_list)) + ")";
draw_string_width = string_width(draw_string);
draw_string_height = string_height(draw_string);