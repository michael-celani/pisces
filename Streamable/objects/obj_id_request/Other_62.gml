var success = card.HandleDataPopulation()

if (!success) {
	show_debug_message("Error");
	instance_destroy();
	return;
}

if (card.CanCreate())
{
	var new_card = card.Create(x, y, 1)[0];
	
	instance_destroy();
}