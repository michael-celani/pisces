/// @description Drag End
if !is_dragged return;

is_dragged = false;
subscribed_events = default_subbed_events;

if obj_options.deselect_after_drag {
	is_selected = false;
}

if obj_scry.active
{
	var pos = 0;
	
	// find the first where difference between the two is positive,
	// or we're holding the card below it
	for (var i = array_length(obj_scry.stack_list) - 1; i >= 0; i--)
	{
		if (x - obj_scry.stack_list[i].x) > 0
		{
			pos = i + 1;
			break;
		}
	}
	
	add_to_card_stack_location(self, obj_scry, pos);
	return;
}



var active_stack = find_active_stack()

if (active_stack != noone && mouse_x > active_stack.x - sprite_width / 2)
{
	var pos = 0;
	
	// find the first where difference between the two is positive,
	// or we're holding the card below it
	for (var i = array_length(active_stack.stack_list) - 1; i >= 0; i--)
	{
		if (y - active_stack.stack_list[i].y) > 0
		{
			pos = i + 1;
			break;
		}
	}
	
	add_to_card_stack_location(self, active_stack, pos);
	return;
}


if (mouse_y > room_height - sprite_height / 2 - 50)
{
	var pos = 0;
	
	// find the first where difference between the two is positive,
	// or we're holding the card below it
	for (var i = array_length(obj_hand.stack_list) - 1; i >= 0; i--)
	{
		if (x - obj_hand.stack_list[i].x) > 0
		{
			pos = i + 1;
			break;
		}
	}
	
	add_to_card_stack_location(self, obj_hand, pos);
	return;
}

show_debug_message("add to battlefield: " + string(id) + " (" + name + ")");
layer_add_instance("Battlefield", self);
obj_height_manager.height_modified = true;
sticky_is_revealed = false;
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

if obj_options.snap_to_grid and not offset_drag
{
	next_x = round_to_nearest(next_x, obj_options.grid_size);
	next_y = round_to_nearest(next_y, obj_options.grid_size);
}

