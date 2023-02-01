/// @description Remaining cards action
var final_move_fn = move_to_deck_bottom;

if keyboard_check(vk_shift) final_move_fn = move_to_graveyard
else if keyboard_check(vk_tab) final_move_fn = move_to_exile
else array_shuffleEx(stack_list);

for (var i = array_length(stack_list) - 1; i >= 0; i--)
{
	final_move_fn(stack_list[i]);
}