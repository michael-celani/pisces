/// @description
draw_set_font(button_font);

var text = get_button_text() ?? button_text;
image_xscale = 20 + string_width(text);
image_yscale = 50;

draw_color = button_active_color;

// Inherit the parent event
event_inherited();
