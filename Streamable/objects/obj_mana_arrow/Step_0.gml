/// @description check if moving and update pos
// You can write your code in this editor

if(variable_instance_get(parent_mana_obj_id, "is_moving")){
		x = variable_instance_get(parent_mana_obj_id, "x");
		if(arrow_type == INCREMENT){
			y = variable_instance_get(parent_mana_obj_id, "y") - 45;	
		}else if(arrow_type == DECREMENT){
			y = variable_instance_get(parent_mana_obj_id, "y") + 45;	
		}else{
			throw "invalid arrow type";	
		}
		
}