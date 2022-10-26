/// @description 
image_xscale = width;
image_yscale = height;
window_surface = surface_create(width, height);
alarm[0] = 20;

var min_depth = depth;

with (obj_component)
{
	min_depth = min(depth, min_depth);	
}

depth = min_depth;


event_inherited();