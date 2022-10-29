/// @description Top
var surf_width = room_width;
var surf_height = room_height;
var draw_x = x - 745 * obj_options.default_scaling * 0.6

draw_set_color(stack_header_color);
draw_rectangle(draw_x, 0, surf_width, draw_string_height * 2, false)

var center_point = (draw_x + surf_width) / 2

draw_set_color(c_white);
draw_set_valign(fa_center);
draw_set_halign(fa_left);
draw_set_font(fnt_beleren);
var total_dist = x_inactive - x_active
var perc_dist = ((x - x_active) / total_dist)
draw_text(total_dist * perc_dist + center_point - draw_string_width / 2, draw_string_height, draw_string)

if camera_mirroring_enabled()
{
	surface_set_target(obj_surface_writer.display_surface);
	draw_set_color(stack_header_color);
	draw_rectangle(draw_x, 0, surf_width, draw_string_height * 2, false);
	draw_set_color(c_white);
	draw_text(total_dist * perc_dist + center_point - draw_string_width / 2, draw_string_height, draw_string)
	surface_reset_target();
}