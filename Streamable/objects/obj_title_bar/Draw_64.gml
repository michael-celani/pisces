/// @description
draw_set_color(accent_color);
draw_rectangle(x, y, x + width, y + 10, false);

draw_set_color(c_white);
draw_set_font(fnt_beleren);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(x + 10, y + 20, title_text);
var text_height = string_height(title_text);

draw_set_color(line_color);
draw_line(x + 10, y + 30 + text_height, x + width - 10, y + 30 + text_height);
draw_set_color(c_white);