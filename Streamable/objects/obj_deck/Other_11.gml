/// @description Mill Card
if array_length(stack_list) != 0
{
	with stack_list[0]
	{
		add_to_card_stack_beginning(self, obj_graveyard);	
	}
}