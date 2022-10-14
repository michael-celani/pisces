/// @description Dragging
if keyboard_check(vk_shift) return;

if (mouse_check_button(mb_right))
{
	is_dragged = true;
	offset_drag = true;
	
	offset_x = x;
	offset_y = y;
	
	remove_from_card_stack(self);
}
else if id == obj_options.lowest_object
{
	is_dragged = true;
	offset_drag = false;

	var min_depth = 0;

	with (obj_card)
	{
		if (parent_stack == noone) {
			min_depth = min(depth, min_depth);	
		}
	}
	
	depth = min_depth - 1
	
	remove_from_card_stack(self);
}