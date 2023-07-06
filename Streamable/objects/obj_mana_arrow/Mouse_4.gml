/// @description Change mana count
// You can write your code in this editor

var _parent_count = variable_instance_get(parent_mana_obj_id, "count")
if(arrow_type == INCREMENT){
	variable_instance_set(parent_mana_obj_id,"count", _parent_count + 1);
}else if(arrow_type == DECREMENT){
	variable_instance_set(parent_mana_obj_id, "count", _parent_count - 1);	
}else{
	throw "arrow not given a valid type";	
}
