/// @description Coalesce
show_debug_message("cardid: " + string(id) + " received coalesce event");
show_debug_message("Q cardid: " + string(id) + " d:" + string(is_dragged) + " s:" + string(is_selected) + " h:" + string(is_hovering))
if !is_dragged return;
if !keys_are_active() return;

clear_menus(self);

//var cards = [];
var me = id;

var priority = ds_priority_create();

with (obj_card)
{
	if id == me continue;
	if !is_dragged continue;
	
	ds_priority_add(priority, self, height_priority); 
}

var nums = 0;
var delta_x = sprite_width / 9;
var delta_y = sprite_height / 9;
var my_card = self;

var x_delta_mult = keyboard_check(vk_shift) ? 0 : 1;
var y_delta_mult = keyboard_check(vk_control) ? 0 : 1;

while my_card != undefined
{
	var prev_next_x = my_card.next_x;
	var prev_next_y = my_card.next_y;
	my_card.next_x = mouse_x + delta_x * nums * x_delta_mult;
	my_card.next_y = mouse_y + delta_y * nums * y_delta_mult;
	my_card.offset_x += (my_card.next_x - prev_next_x);
	my_card.offset_y += (my_card.next_y - prev_next_y);
	my_card.height_priority = next_height_priority();

	if ds_priority_size(priority) == 0
	{
		my_card.subscribed_events = during_drag_events;
		next_card = undefined;
	}
	else
	{
		var next_card = ds_priority_delete_min(priority)
	}
	
	my_card = next_card;
	nums++
}

subscribed_events = {}
ds_priority_destroy(priority);