/// @description Draw
var draw_x = x;
var draw_y = y;

if parent_component != noone
{
	draw_x -= parent_component.x;
	draw_y -= parent_component.y;
}

draw_set_color(draw_color);
draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, image_xscale, image_yscale, 0, draw_color, 1);
draw_set_color(c_white);

