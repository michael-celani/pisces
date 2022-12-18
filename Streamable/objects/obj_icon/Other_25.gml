/// @description Insert description here

var draw_x = x;
var draw_y = y;

if parent_component != noone
{
	draw_x -= parent_component.x;
	draw_y -= parent_component.y;
}

draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, image_xscale, image_yscale, image_angle, c_white, image_alpha);