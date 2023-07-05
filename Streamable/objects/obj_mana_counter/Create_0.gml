/// @description initialize sprites and bounding box

is_visible = false;
drag_offset_x = 0;
drag_offset_y= 0;
mana_instance_ids = [];
var _sprite_vars = [spr_w, spr_u, spr_b, spr_r, spr_g, spr_c];
visible = is_visible;

function set_visibility(_object){
	variable_instance_set(_object, "visible", is_visible);	
}


// create the mana objects
var _tmp = 96
for(var _i = 0; _i < 6; _i++){
	array_push(mana_instance_ids, instance_create_layer(_tmp, 96, "ManaCounter", obj_mana, 
	{sprite_index : _sprite_vars[_i], visible: is_visible}));
	_tmp += 60;
}


