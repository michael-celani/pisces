/// @description Insert description here

draw_set_alpha(.5)
draw_roundrect_color(room_width / 3, 0, room_width * 2 / 3, y * 2, c_dkgrey, c_dkgrey, false)
draw_set_alpha(1)

draw_set_font(fnt_beleren);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(room_width / 3 + 20, y, keyboard_string);
