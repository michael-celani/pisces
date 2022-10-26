/// @description Insert description here
var index = active;

draw_set_color(c_white);
draw_set_alpha(0.8);
draw_roundrect_ext(x, y, x + 49, y + 49, 25, 25, false);
if checked
{
	draw_set_color(c_black);
	draw_set_alpha(0.8);
	draw_sprite_stretched(spr_dot, index, x, y, 50, 50);
}
draw_set_alpha(1.0);

