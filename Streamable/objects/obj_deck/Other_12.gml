/// @description Scry Card
if array_length(stack_list) != 0
{
	with stack_list[0]
	{
		add_to_card_stack(self, obj_scry);	
	}
}