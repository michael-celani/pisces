/// @description New Turn

with (obj_card)
{
	if tapped
	{
		is_tapping = true;
	}
}

if ds_list_size(stack_list) != 0
{
	with (stack_list[| 0])
	{
		x = room_width / 2;
		y = room_height + sprite_height;
		add_to_card_stack(self, obj_hand);	
	}
}