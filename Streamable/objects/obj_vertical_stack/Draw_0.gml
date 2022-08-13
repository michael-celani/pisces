/// @description Draw

var draw_x = x - 745 * obj_options.default_scaling * 0.6

var color = make_color_rgb(39, 35, 75)
draw_set_color(color);
draw_rectangle(draw_x, 0, room_width, room_height / 16, false)
draw_set_color(color);
draw_rectangle(draw_x, room_height / 16, room_width, room_height * 15 / 16, false);
draw_set_color(color);
draw_rectangle(draw_x, room_height * 15 / 16, room_width, room_height, false)

if surface_exists(obj_surface_writer.display_surface)
{
	surface_set_target(obj_surface_writer.display_surface);
	draw_set_color(color);
	draw_rectangle(draw_x, 0, room_width, room_height / 16, false)
	draw_set_color(color);
	draw_rectangle(draw_x, room_height / 16, room_width, room_height * 15 / 16, false);
	draw_set_color(color);
	draw_rectangle(draw_x, room_height * 15 / 16, room_width, room_height, false)
	surface_reset_target();
}

draw_set_color(c_white);