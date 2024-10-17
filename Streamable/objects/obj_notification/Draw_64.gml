/// @description

draw_set_font(notification_font)
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_set_color(c_black);
draw_set_alpha(0.25);
draw_rectangle(x + 5, y + 5, x + draw_width + 25, y + draw_height + 15, false);

draw_set_alpha(min(ticker, 30) / 30);
draw_set_color(notification_color);
draw_rectangle(x, y, x + draw_width + 20, y + draw_height + 10, false);
draw_set_color(notification_border);
draw_rectangle(x, y, x + draw_width + 20, y + draw_height + 10, true);

draw_set_alpha((min(ticker, 30) / 30) / 2);
draw_set_color(c_black);
draw_text(x + 13, y + 3 + (draw_height + 10) / 2, notification_text);

draw_set_alpha(min(ticker, 30) / 30);
draw_set_color(notification_text_color);
draw_text(x + 10, y + (draw_height + 10) / 2, notification_text);

if camera_mirroring_enabled()
{
	surface_set_target(obj_surface_writer.display_surface);
	
	draw_set_color(c_black);
	draw_set_alpha(0.25);
	draw_rectangle(x + 5, y + 5, x + draw_width + 25, y + draw_height + 15, false);

	draw_set_alpha(min(ticker, 30) / 30);
	draw_set_color(notification_color);
	draw_rectangle(x, y, x + draw_width + 20, y + draw_height + 10, false);
	draw_set_color(notification_border);
	draw_rectangle(x, y, x + draw_width + 20, y + draw_height + 10, true);

	draw_set_alpha((min(ticker, 30) / 30) / 2);
	draw_set_color(c_black);
	draw_text(x + 13, y + 3 + (draw_height + 10) / 2, notification_text);

	draw_set_alpha(min(ticker, 30) / 30);
	draw_set_color(notification_text_color);
	draw_text(x + 10, y + (draw_height + 10) / 2, notification_text);
	
	surface_reset_target();
}

draw_set_alpha(1);
draw_set_color(c_white);
