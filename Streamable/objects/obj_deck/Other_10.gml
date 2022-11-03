/// @description Draw Card
if array_length(stack_list) != 0
{
	with stack_list[0]
	{
		x = room_width / 2;
		y = room_height + sprite_height;
		add_to_card_stack(self, obj_hand);	
	}
}