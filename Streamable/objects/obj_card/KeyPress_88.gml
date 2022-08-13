/// @description Destroy
if !is_hovering {
	return;
}

remove_from_card_stack(self)

var uniq_front = true;
var uniq_back = true;

if back_sprite = spr_card_bad {
	uniq_back = false;	
}

var front = front_sprite;
var back = back_sprite;
var my_id = id;

with (obj_card)
{
	if my_id != id {
		if front_sprite == front {
			uniq_front = false;		
		}
		if back_sprite == back {
			uniq_back = false;
		}
	}
}

if uniq_front {
	sprite_delete(front_sprite)	
}

if uniq_back {
	sprite_delete(back_sprite);	
}

instance_destroy();