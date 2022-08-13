/// @description Top
var draw_x = x - 745 * obj_options.default_scaling * 0.6

var color = make_color_rgb(26, 24, 54)
draw_set_color(color);
draw_rectangle(draw_x, 0, room_width, room_height / 16, false)

draw_set_font(fnt_beleren);
draw_set_valign(fa_center);
draw_set_halign(fa_left);
draw_set_color(c_white);
var draw_string = stack_name + " (" + string(ds_list_size(stack_list)) + ")";
var draw_width = string_width(draw_string);

var center_point = (draw_x + room_width) / 2

var total_dist = x_inactive - x_active
var perc_dist = ((x - x_active) / total_dist)
draw_text(total_dist * perc_dist + center_point - draw_width / 2, room_height / 32, draw_string)

if surface_exists(obj_surface_writer.display_surface)
{
	surface_set_target(obj_surface_writer.display_surface);
	draw_set_color(color);
	draw_rectangle(draw_x, 0, room_width, room_height / 16, false)
	draw_set_color(c_white);
	draw_text(total_dist * perc_dist + center_point - draw_width / 2, room_height / 32, draw_string)
	surface_reset_target();
}
