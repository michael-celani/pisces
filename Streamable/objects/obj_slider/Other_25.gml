/// @description Drawing

var draw_x_start = x_start;
var draw_x = x;
var draw_y = y;

if parent_component != noone
{
	draw_x_start -= parent_component.x;
	draw_x -= parent_component.x;
	draw_y -= parent_component.y;
}


draw_set_color(line_color);
draw_line(draw_x_start, draw_y, draw_x_start + width, draw_y);
draw_set_color(c_white);

var draw_color = slider_color;

if (dragging)
{
	draw_color = slider_clicked_color;
}
else if instance_position(mouse_x, mouse_y, self)
{
	draw_color = slider_hover_color;
}


draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, image_xscale, image_yscale, image_angle, draw_color, image_alpha);