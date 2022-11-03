/// @description Insert description here
var final_location = obj_deck;

if keyboard_check(vk_shift) final_location = obj_graveyard;
else if keyboard_check(vk_tab) final_location = obj_exile;
else array_shuffle(stack_list);

for (var i = array_length(stack_list) - 1; i >= 0; i--)
{
	add_to_card_stack(stack_list[i], final_location);
}