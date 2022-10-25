/// @description
if !height_modified return;
height_modified = false;

var drag_priority = dragged_priority;
var battle_priority = battlefield_priority;

with (obj_card)
{
	if is_dragged
	{
		ds_priority_add(drag_priority, self, height_priority);
	}
	else if parent_stack == noone
	{
		ds_priority_add(battle_priority, self, height_priority);
	}
}

var curr_depth = layer_get_depth("Battlefield");
while ds_priority_size(battlefield_priority) != 0
{
	curr_depth -= 1;
	var next_card = ds_priority_delete_min(battlefield_priority);
	next_card.depth = curr_depth;
}

var curr_depth = layer_get_depth("Dragging");
while ds_priority_size(dragged_priority) != 0
{
	curr_depth -= 1;
	var next_card = ds_priority_delete_min(dragged_priority);
	next_card.depth = curr_depth;
}