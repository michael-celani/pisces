/// @description Dragging

if !is_dragged
{
	return;	
}

is_dragged = false;

if (mouse_y > room_height - sprite_height / 2 - 50)
{
	add_to_card_stack(self, obj_hand);
	return;
}

is_revealed = true;

if event_data[? "isflick"] {

	if offset_drag {
		next_x = 3 * (mouse_x + (offset_x - event_data[? "rawstartposX"]) - x) + x
		next_y = 3 * (mouse_y + (offset_y - event_data[? "rawstartposY"]) - y) + y
	}
	else
	{
		next_x = 3 * (mouse_x - x) + x
		next_y = 3 * (mouse_y - y) + y
	}
}

if (obj_options.snap_to_grid)
{
	next_x = round_to_nearest(next_x, obj_options.grid_size);
	next_y = round_to_nearest(next_y, obj_options.grid_size);
}