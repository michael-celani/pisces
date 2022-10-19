/// @description Dragging

if is_dragged
{
	if offset_drag {
		next_x += event_data[? "diffX"]
		next_y += event_data[? "diffY"]
	}
	else
	{
		next_x = mouse_x
		next_y = mouse_y
	}
}
