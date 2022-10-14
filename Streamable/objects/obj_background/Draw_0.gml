/// @description Draw the background
draw_sprite_tiled(obj_options.background_sprite, image_index, offset_x, offset_y);

if camera_mirroring_enabled()
{
	surface_set_target(obj_surface_writer.display_surface);
	draw_sprite_tiled(obj_options.background_sprite, image_index, offset_x, offset_y);
	surface_reset_target();
}
