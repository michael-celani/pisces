x_active   = room_width - 745 * obj_options.default_scaling * 0.6;
x_inactive = room_width + 745 * obj_options.default_scaling * 0.6;

var num_cards = array_length(stack_list);
var curr_y = y;
var height = 0;

if !active { searching = false; }
if text_is_focused() { searching = false; }

if (searching)
{
	search_term = keyboard_string;	
}

for (var index = 0; index < num_cards; index++) {
	var card_id = stack_list[index]
	var matches = !searching or (string_pos(string_lower(search_term), string_lower(card_id.name)) != 0);
	
	if (active and matches)
	{
		card_id.next_x = x;
		card_id.next_y = draw_string_height + curr_y + card_id.sprite_height / 2;
	}
	else if (active and !matches)
	{
		card_id.x = max(card_id.x, room_width + 1000);
		card_id.y = draw_string_height + curr_y + card_id.sprite_height / 2;
		card_id.next_x = card_id.x;
		card_id.next_y = card_id.y;
	}
	else
	{
		card_id.x = max(card_id.x, x + 10);
		card_id.y = draw_string_height + curr_y + card_id.sprite_height / 2;
		card_id.next_x = card_id.x;
		card_id.next_y = card_id.y;
	}
	

	if (matches) {
		curr_y += card_id.sprite_height + 20;
		height += card_id.sprite_height + 20;
	}
	
	// Skip the last one
	if (index == num_cards - 1) {
		curr_y -= card_id.sprite_height + 20;
		height -= card_id.sprite_height + 20;
	}
	
	if !card_id.sticky_is_revealed {
		card_id.is_revealed = !hidden_zone;
	}
	
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


if (searching)
{
	draw_string = "> " + search_term;
}
else
{
	draw_string = stack_name + " (" + string(array_length(stack_list)) + ")";
}

draw_string_width = string_width(draw_string);
var next_x = 0;
var next_y = y;

if (active)
{
	next_x = x_active;
	y_offset = clamp(y_offset, 0, height);
	show_debug_message(string(height))
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

x = approach_point(x, next_x, obj_options.since_last, total_inertia);
y = draw_string_height * 2 - y_offset;