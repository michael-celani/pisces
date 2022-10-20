/// @description
if !dragging return;

draw_set_alpha(0.25);
draw_set_color(drag_fill_color)
draw_rectangle(drag_start_x, drag_start_y, drag_curr_x, drag_curr_y, false);
draw_set_alpha(0.5);
draw_set_color(drag_outline_color)
draw_rectangle(drag_start_x, drag_start_y, drag_curr_x, drag_curr_y, true);
draw_set_color(c_white);
draw_set_alpha(1);