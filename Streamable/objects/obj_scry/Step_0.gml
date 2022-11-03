/// @description Move cards
var num_cards = array_length(stack_list);

active = num_cards > 0;

if not active
{
	image_xscale = 0;
	image_yscale = 0;
	active_time -= delta_time;
	return;
}

// Active
x = 0;
y = 0;
image_xscale = room_width;
image_yscale = room_height;
active_time = clamp(active_time + delta_time, 0, active_max);

var card_start = 745 * obj_options.default_scaling / 3 + 10;
var card_end = room_width - card_start;

for (var index = 0; index < num_cards; index++) {
	var card_id = stack_list[index];
	card_id.next_x = lerp(card_start, card_end, (index + 1) / (num_cards + 1));
	card_id.next_y = room_height / 2;
	card_id.is_revealed = false;
	
	layer_add_instance("InScry", card_id);
	card_id.depth += index;
}
