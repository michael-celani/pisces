/// @description Move cards

var num_cards = array_length(stack_list);


width = num_cards * 745 * obj_options.default_scaling;

for (var index = 0; index < num_cards; index++) {
	var card_id = stack_list[index]
	card_id.next_x = x + (745 / 2 * obj_options.default_scaling) + (((index) / num_cards) * width);
	card_id.is_revealed = false;
	
	
	if card_id.is_hovering {
		layer_add_instance("Dragging", card_id);
		obj_height_manager.height_modified = true;
		card_id.next_y = room_height - card_id.sprite_height / 2
	}
	else
	{
		layer_add_instance("Hand", card_id);
		obj_height_manager.height_modified = true;
		card_id.next_y = room_height;
	}
}

x = (room_width - width) / 2;

if (width < room_width)
{
	scroll_offset = 0;	
}
else
{
	scroll_offset = clamp(scroll_offset, (room_width - width) / 2, (width - room_width) / 2)
}

x += scroll_offset;