/// @description 
// You can write your code in this editor

#macro INCREMENT 0
#macro DECREMENT 1

if(arrow_type == INCREMENT){
	sprite_index = spr_up_arrow;	
}else if(arrow_type == DECREMENT){
	sprite_index = spr_down_arrow;
}else{
	throw "invalid arrow type"	
}
