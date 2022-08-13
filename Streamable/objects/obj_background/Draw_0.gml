/// @description Insert description here
if surface_exists(obj_surface_writer.display_surface)
{
	surface_set_target(obj_surface_writer.display_surface);
	draw_sprite_tiled(spr_felt, image_index, 0, 0);
	surface_reset_target();
}

draw_sprite_tiled(spr_felt, image_index, 0, 0);