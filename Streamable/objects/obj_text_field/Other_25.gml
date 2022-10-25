// Draw field:
var draw_x = x;
var draw_y = y;
var cursor_draw_x = cursor_x;

if parent_component != noone
{
	draw_x -= parent_component.x;
	draw_y -= parent_component.y;
	cursor_draw_x -= parent_component.x;
}

draw_set_color(field_color);
draw_rectangle(draw_x, draw_y, draw_x + width, draw_y + height, false);

// Draw outline:
if focused
{
	draw_set_color(outline_focused_color);
}
else
{
	draw_set_color(outline_color);
}

draw_rectangle(draw_x, draw_y, draw_x + width, draw_y + height, true);
draw_set_color(c_white);

draw_set_font(fnt_segoe);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
gpu_set_colorwriteenable(true, true, true, false);
draw_text(draw_x + 10, draw_y + height / 2, curr_string);
gpu_set_colorwriteenable(true, true, true, true);

// Draw cursor:
draw_set_alpha(cursor_alpha);
draw_line(cursor_draw_x, draw_y + 5, cursor_draw_x, draw_y + height - 7.5);
draw_set_alpha(1);