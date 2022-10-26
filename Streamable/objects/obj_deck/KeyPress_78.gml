/// @description New Turn
if !keys_are_active() return;
if instance_exists(obj_card_annotation) return;

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
		///2022_10_19_woogachaka new turn should move to upkeep and not auto draw
		if obj_options.draw_on_turn
		{
			add_to_card_stack(self, obj_hand);	
		}
	}
}
