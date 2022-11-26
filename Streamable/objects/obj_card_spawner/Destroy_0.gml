/// @description
var uniq_front = true;
var uniq_back = true;

if back_sprite == -1 {
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

with (obj_card_spawner)
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

event_inherited();