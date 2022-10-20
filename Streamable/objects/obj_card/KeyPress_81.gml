/// @description Coalesce
if !is_dragged return;
if !keys_are_active() return;

clear_menus(self);

var cards = [];
var me = id;

with (obj_card)
{
	if id == me continue;
	if !is_dragged continue;
	
	array_push(cards, self);
}
array_push(cards, self);
array_sort(cards, function(elm1, elm2)
{
    return elm1.depth < elm2.depth;
});

var nums = 0;
var delta_x = sprite_width / 9;
var delta_y = sprite_height / 9;
var next_card = array_pop(cards);

while (next_card != undefined)
{
	var prev_next_x = next_card.next_x;
	var prev_next_y = next_card.next_y;
	next_card.next_x = mouse_x + delta_x * nums;
	next_card.next_y = mouse_y + delta_y * nums;
	next_card.offset_x += (next_card.next_x - prev_next_x);
	next_card.offset_y += (next_card.next_y - prev_next_y);
	next_card.depth = depth + nums;
	next_card = array_pop(cards);
	nums++
}