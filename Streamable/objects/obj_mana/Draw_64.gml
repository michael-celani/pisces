/// @description 
// You can write your code in this editor
image_xscale = 0.1;
image_yscale = 0.1;

// counter display
draw_set_color(c_white);
draw_set_font(fnt_beleren_medium);
draw_set_halign(fa_center);

var _text = string(count);

draw_text(x, y + 90, count);


if(sprite_index != -1){
	draw_self();
}

