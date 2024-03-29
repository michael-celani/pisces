/// @description Draw

var text = get_button_text() ?? button_text;

image_xscale = 20 + string_width(text);

var draw_box_left = bbox_left;
var draw_box_top = bbox_top;
var draw_box_right = bbox_right;
var draw_box_bottom = bbox_bottom;

if parent_component != noone
{
	draw_box_left -= parent_component.x;
	draw_box_top -= parent_component.y;
	draw_box_right -= parent_component.x;
	draw_box_bottom -= parent_component.y;	
}


draw_set_color(draw_color)
draw_rectangle(draw_box_left, draw_box_top, draw_box_right, draw_box_bottom, false);
draw_set_color(button_outline_color)
draw_rectangle(draw_box_left, draw_box_top, draw_box_right, draw_box_bottom, true);
draw_rectangle(draw_box_left + 2, draw_box_top + 2, draw_box_right - 2, draw_box_bottom - 2, true);

draw_set_font(button_font);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
gpu_set_colorwriteenable(true, true, true, false);
var draw_text_x = mean(draw_box_left, draw_box_right);
var draw_text_y = mean(draw_box_top, draw_box_bottom);
draw_set_color(c_black);
draw_text(draw_text_x + 2, draw_text_y + 2, text);
draw_set_color(c_white);
draw_text(draw_text_x, draw_text_y, text);
gpu_set_colorwriteenable(true, true, true, true);