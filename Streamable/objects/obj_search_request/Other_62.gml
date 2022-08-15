var success = card.HandleDataPopulation()

if (!success) {
	show_debug_message("Error");
	instance_destroy();
}

if (card.CanCreate())
{
	card.Create(room_width / 2, room_height / 2, 1);
	instance_destroy();
}