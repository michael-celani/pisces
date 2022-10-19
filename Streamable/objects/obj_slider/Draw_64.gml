/// @description Insert description here

draw_set_color(line_color);
draw_line(x_start, y, x_start + width, y);
draw_set_color(c_white);

var draw_color = slider_color;

if (dragging)
{
	draw_color = slider_clicked_color;
}
else if (instance_position(mouse_x, mouse_y, self))
{
	draw_color = slider_hover_color;
}


draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, draw_color, image_alpha);