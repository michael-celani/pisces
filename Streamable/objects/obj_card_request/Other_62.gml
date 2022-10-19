var success = card.HandleDataPopulation()

if (!success) {
	show_debug_message("Error");
	instance_destroy();
	return;
}

if (card.CanCreate())
{
	card.Create(x, y, spawn_number);
	instance_destroy();
}