function lowest_at_point(px, py){
	var _list = ds_list_create();
	var _num = instance_position_list(px, py, all, _list, false);
	
	var min_depth = infinity
	var min_elem = noone

	if _num > 0
	{
	    for (var i = 0; i < _num; ++i;)
	    {
	        var inst = _list[| i];
			
			if variable_instance_exists(inst, "owning_canvas") and inst.owning_canvas != noone
			{
				if !point_in_rectangle(px, py, inst.owning_canvas.box_left, inst.owning_canvas.box_top, inst.owning_canvas.box_right, inst.owning_canvas.box_bottom)
				{
					continue;
				}
			}
		
			if inst.depth < min_depth {
				min_depth = inst.depth;
				min_elem = inst;
			}
	    }
	}

	ds_list_destroy(_list);
	
	return min_elem
}

function next_height_priority()
{
	obj_height_manager.height_priority += 1;
	obj_height_manager.height_modified = true;
	return obj_height_manager.height_priority;
}