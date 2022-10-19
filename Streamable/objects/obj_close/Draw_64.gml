/// @description 

var c = c_dkgray;

if (pressing)
{
	c = c_red;	
}
else if (instance_position(mouse_x, mouse_y, self))
{
	c = c_maroon;
}


draw_sprite_stretched_ext(spr_close, 0, x, y, image_xscale, image_yscale, c, 0.35);
