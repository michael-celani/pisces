/// @description Regenerate surface

if !surface_exists(display_surface) {
	var surface_width = surface_get_width(application_surface);
	var surface_height = surface_get_height(application_surface);
	display_surface = surface_create(surface_width, surface_height);	
}

surface_set_target(obj_surface_writer.display_surface);

draw_set_color(c_black);
draw_rectangle(0, 0, surface_get_width(display_surface), surface_get_height(display_surface), false);
draw_set_color(c_white);

surface_reset_target();