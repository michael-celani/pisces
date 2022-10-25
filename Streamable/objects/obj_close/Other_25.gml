/// @description Draw
var c = c_dkgray;

if (pressing)
{
	c = c_red;	
}
else if (instance_position(mouse_x, mouse_y, self))
{
	c = c_maroon;
}

var draw_x = x;
var draw_y = y;

if parent_component != noone
{
	draw_x -= parent_component.x;
	draw_y -= parent_component.y;
}

draw_sprite_stretched_ext(spr_close, 0, draw_x, draw_y, image_xscale, image_yscale, c, 1);
