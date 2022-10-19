var success = card.HandleDataPopulation()

if (!success) {
	show_debug_message("Error");
	instance_destroy();
	return;
}

if (card.CanCreate())
{
	var new_card = card.Create(x, y, 1)[0];
	
	var min_depth = 0;

	with (obj_card)
	{
		if (parent_stack == noone) {
			min_depth = min(depth, min_depth);	
		}
	}
	
	new_card.depth = min_depth - 1
	instance_destroy();
}