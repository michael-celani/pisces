/// @description
drag_offset_x = x - event_data[?"posX"];
drag_offset_y = y - event_data[?"posY"];

array_foreach(mana_instance_ids, function(_object){
	variable_instance_set(_object, "is_moving", true);
});
