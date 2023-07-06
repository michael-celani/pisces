/// @description 
// You can write your code in this editor

image_xscale = 0.7;
image_yscale = 0.7;

if(arrow_type == INCREMENT){
	sprite_index = spr_up_arrow;
}else if (arrow_type == DECREMENT){
	sprite_index = spr_down_arrow;	
}else{
	throw "arrow not given a valid type";	
}

draw_self();
