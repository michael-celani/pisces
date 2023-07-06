/// @description Insert description here
// You can write your code in this editor

arrow_instance_ids = [];

array_push(arrow_instance_ids, instance_create_layer(x, y - 45, "ManaCounter", obj_mana_arrow, {
	parent_mana_obj_id : id, arrow_type : INCREMENT
}));
array_push(arrow_instance_ids, instance_create_layer(x, y + 45, "ManaCounter", obj_mana_arrow,  {
	parent_mana_obj_id : id, arrow_type : DECREMENT
}))



