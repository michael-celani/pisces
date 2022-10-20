/// @description
if !dragging return;

drag_curr_x = mouse_x;
drag_curr_y = mouse_y;

var list = ds_list_create()

collision_rectangle_list(drag_start_x, drag_start_y, drag_curr_x, drag_curr_y, obj_card, false, false, list, false);

with (obj_card) is_selected = false;
for (var i = 0; i < ds_list_size(list); i++)
{
	list[| i].is_selected = true;	
}


ds_list_destroy(list);