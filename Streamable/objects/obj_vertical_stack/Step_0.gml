x_active = room_width - 745 * obj_options.default_scaling * 0.6;
x_inactive = room_width + 745 * obj_options.default_scaling * 0.6;

var num_cards = ds_list_size(stack_list);
var curr_y = y;
var height = 0;

for (var index = 0; index < num_cards; index++) {
	var card_id = stack_list[| index]
	
	if (active)
	{
		card_id.next_x = x;
		card_id.next_y = draw_string_height + curr_y + card_id.sprite_height / 2;
	}
	else
	{
		card_id.x = x;
		card_id.y = draw_string_height + curr_y + card_id.sprite_height / 2;
		card_id.next_x = card_id.x;
		card_id.next_y = card_id.y;
	}
	

	if (index != num_cards - 1) {
		curr_y += card_id.sprite_height + 20;
		height += card_id.sprite_height + 20;
	}
	
	card_id.is_revealed = !hidden_zone;
	
	if card_id.is_hovering {
		layer_add_instance("Dragging", card_id);
		obj_height_manager.height_modified = true;
	}
	else
	{
		layer_add_instance(zone_layer, card_id);
		obj_height_manager.height_modified = true;
	}
}

draw_string = stack_name + " (" + string(ds_list_size(stack_list)) + ")";
draw_string_width = string_width(draw_string);
var next_x = 0;
var next_y = y;

if (active)
{
	next_x = x_active;
	y_offset = clamp(y_offset, 0, height);
}
else
{
	next_x = x_inactive;
	
	if (abs(x - next_x) < 25)
	{
		y_offset = 0;	
	}
}

var total_inertia = 5.0
x = (total_inertia * x + next_x) / (total_inertia + 1.0);
y = draw_string_height * 2 - y_offset;