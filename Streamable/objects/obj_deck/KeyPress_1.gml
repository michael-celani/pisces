/// @description Handle key presses
if !keys_are_active() return;
show_debug_message(keyboard_lastkey);
switch (keyboard_lastkey)
{
	case global.keys.draw:
		var num_draws = min(max(1, obj_options.num_repeats), ds_list_size(stack_list))
	
		repeat (num_draws)
		{
			with (stack_list[| 0])
			{
				x = room_width / 2;
				y = room_height + sprite_height;
				add_to_card_stack(self, obj_hand);	
			}
		}
	break;
	
	default:
	break;
}
