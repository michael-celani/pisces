var percentage = smoothstep(0, active_max, active_time)
var alpha_percentage = percentage * 0.20;

// Darken the room:
draw_set_color(c_black);
draw_set_alpha(alpha_percentage)
draw_rectangle(0, 0, room_width, room_height, false);

// Draw the header:
var draw_x = room_width / 2;
var draw_y = lerp(room_height / 6, room_height / 6 + 20, percentage);
var draw_string = "Scrying";

if (is_revealing)
{
	draw_string = "Revealing";	
}


draw_set_font(fnt_beleren_large);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

draw_set_alpha(percentage * .95);
draw_text(draw_x + 5, draw_y + 5, draw_string);

draw_set_alpha(percentage);
draw_set_color(c_white);
draw_text(draw_x, draw_y, draw_string);

var loc = room_height / 2 - 745 * obj_options.default_scaling;
var draw_line_top = lerp(room_height / 2, loc - 20, percentage);

loc = room_height / 2 + 745 * obj_options.default_scaling;
var draw_line_bot = lerp(room_height / 2, loc + 20, percentage);

draw_set_color(c_black);
draw_set_alpha(percentage * 0.65);
draw_rectangle(0, draw_line_top, room_width, draw_line_bot, false);

draw_set_alpha(percentage);
draw_set_color(c_white);
draw_line(0, draw_line_top, room_width, draw_line_top);
draw_line(0, draw_line_bot, room_width, draw_line_bot);

draw_set_alpha(1);

