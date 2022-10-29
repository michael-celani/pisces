/// @description Drawing
var draw_x = x;
var draw_y = y;

if parent_component != noone
{
	draw_x -= parent_component.x;
	draw_y -= parent_component.y;
}

draw_set_color(accent_color);
draw_rectangle(draw_x, draw_y, draw_x + width, draw_y + 10, false);

draw_set_color(c_white);
draw_set_font(fnt_beleren);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_color(draw_x + 12, draw_y + 22, title_text, c_black, c_black, c_black, c_black, 1);
draw_text(draw_x + 10, draw_y + 20, title_text);
var text_height = string_height(title_text);

draw_set_color(line_color);
gpu_set_colorwriteenable(true, true, true, false);
draw_line(draw_x + 10, draw_y + 30 + text_height, draw_x + width - 10, draw_y + 30 + text_height);
gpu_set_colorwriteenable(true, true, true, true);
draw_set_color(c_white);