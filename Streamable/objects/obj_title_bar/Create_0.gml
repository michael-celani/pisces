/// @description Insert description here
if (parent_component != noone)
{
	width = parent_component.width;
	height = 60;
	x = parent_component.x;
	y = parent_component.y;
	image_xscale = width;
	image_yscale = height;
}

drag_start_x = x;
drag_start_y = y;

event_inherited();