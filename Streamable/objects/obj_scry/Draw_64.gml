/// @description
event_perform(ev_other, ev_user0);

if camera_mirroring_enabled()
{
	surface_set_target(obj_surface_writer.display_surface);
	event_perform(ev_other, ev_user0);
	surface_reset_target();
}

// Visible only to player
var percentage = smoothstep(0, active_max, active_time)

draw_set_font(fnt_beleren);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

var draw_x = room_width / 2;
var draw_y = lerp(room_height + 30, room_height - 30, percentage);
var draw_string = "ESC: ";

if keyboard_check(vk_tab)
{
	draw_string += "Put the rest into exile"
}
else if keyboard_check(vk_shift)
{
	draw_string += "Put the rest into your graveyard"	
}
else
{
	draw_string += "Put the rest on the bottom of your library in a random order"	
}

draw_set_alpha(percentage * .95);
draw_set_color(c_black);
draw_text(draw_x + 5, draw_y + 5, draw_string);

draw_set_alpha(percentage);
draw_set_color(c_white);
draw_text(draw_x, draw_y, draw_string);

draw_set_alpha(1);