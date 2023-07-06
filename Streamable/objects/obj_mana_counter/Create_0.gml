/// @description initialize sprites and bounding box

is_visible = false;
is_clicked = false;
drag_offset_x = 0;
drag_offset_y= 0;
mana_instance_ids = [];
var _sprite_vars = [spr_w, spr_u, spr_b, spr_r, spr_g, spr_c];
visible = is_visible;
count = 0;

function set_visibility(_object){
	variable_instance_set(_object, "visible", is_visible);	
	var _arrows = variable_instance_get(_object, "arrow_instance_ids");
	array_foreach(_arrows, function(_object){
		variable_instance_set(_object, "visible", is_visible);
	});
}


// create the mana objects
var _tmp = 70
for(var _i = 0; _i < 6; _i++){
	array_push(mana_instance_ids, instance_create_layer(_tmp, 70, "ManaCounter", obj_mana, 
	{sprite_index : _sprite_vars[_i], visible: is_visible}));
	_tmp += 70;
}


