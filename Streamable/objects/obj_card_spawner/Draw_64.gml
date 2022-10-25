/// @description
with owning_canvas
{
	if !surface_exists(surf)
	{
		surf = surface_create(1920, 1080);	
	}
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0)
}

draw_self();

with (owning_canvas)
{
	surface_reset_target();
	draw_surface_part(surf, box_left, box_top, box_right - box_left, box_bottom - box_top, box_left, box_top);
}
