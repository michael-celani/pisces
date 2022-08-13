/// @description Dragging

if (mouse_check_button(mb_right))
{
	is_dragged = true;
	offset_drag = true;
	
	offset_x = x;
	offset_y = y;
	
	remove_from_card_stack(self);
}
else if lowest_at_point(mouse_x, mouse_y)
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