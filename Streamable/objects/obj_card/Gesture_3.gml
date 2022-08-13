/// @description Dragging

if is_dragged
{
	if offset_drag {
		next_x = mouse_x + (offset_x - event_data[? "rawstartposX"])
		next_y = mouse_y + (offset_y - event_data[? "rawstartposY"])
	}
	else
	{
		next_x = mouse_x
		next_y = mouse_y
	}
}
