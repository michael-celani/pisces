/// @description Dragging

var min_depth = 0;
var me = id;
with (obj_card)
{
	if (parent_stack == noone and id != me) {
		min_depth = min(depth, min_depth);	
	}
}
	
if is_selected and obj_selector.lowest_object != noone and obj_selector.lowest_object.object_index == obj_card
{
	is_dragged = true;
	offset_drag = true;
	
	offset_x = x;
	offset_y = y;
	
	depth -= 1000;
	remove_from_card_stack(self);
}
else if id == obj_selector.lowest_object
{
	is_dragged = true;
	offset_drag = false;

	next_x = mouse_x;
	next_y = mouse_y;

	depth = min_depth - 1001;
	remove_from_card_stack(self);
}
