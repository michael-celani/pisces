/// @description Top
var surf_width = room_width;
var surf_height = room_height;
var draw_x = x - 745 * obj_options.default_scaling * 0.6;
var text_scale_factor = 1/(0.5 - 0.15);
var text_scale = 0.5 + 0.5*(obj_options.default_scaling - 0.15)*text_scale_factor;

draw_set_color(stack_header_color);
draw_rectangle(draw_x, 0, surf_width, surf_height / 16, false)

draw_set_font(fnt_beleren);
draw_set_valign(fa_center);
draw_set_halign(fa_left);
draw_set_color(c_white);
var draw_string = stack_name + " (" + string(ds_list_size(stack_list)) + ")";
var draw_width = string_width(draw_string)*text_scale;

var center_point = (draw_x + surf_width) / 2

var total_dist = x_inactive - x_active
var perc_dist = ((x - x_active) / total_dist)
draw_text_transformed(total_dist * perc_dist + center_point - draw_width / 2, surf_height / 32, draw_string,text_scale,text_scale,image_angle)

if camera_mirroring_enabled()
{
	surface_set_target(obj_surface_writer.display_surface);
	draw_set_color(stack_header_color);
	draw_rectangle(draw_x, 0, surf_width, surf_height / 16, false);
	draw_set_color(c_white);
	draw_text(total_dist * perc_dist + center_point - draw_width / 2, surf_height / 32, draw_string)
	surface_reset_target();
}
