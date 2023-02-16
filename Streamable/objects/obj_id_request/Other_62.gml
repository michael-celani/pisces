var success = card.HandleDataPopulation()

if (!success) {
	show_debug_message("Error");
	instance_destroy();
	return;
}

if (card.CanCreate())
{
	var new_card = card.Create(x, y, spawn_number)[0];
	new_card.is_revealed = true;
	instance_destroy();
}