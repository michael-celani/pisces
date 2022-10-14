/// @description Shift Dragging
if !keyboard_check(vk_shift) return;
if !multi_drag return;

with (obj_card)
{
	if parent_stack != noone continue;
	
	next_x = mouse_x + (offset_x - event_data[? "rawstartposX"])
	next_y = mouse_y + (offset_y - event_data[? "rawstartposY"])
	x = next_x;
	y = next_y;
}

with (obj_background)
{
	offset_x = mouse_x - event_data[? "rawstartposX"]
	offset_y = mouse_y - event_data[? "rawstartposY"]
}