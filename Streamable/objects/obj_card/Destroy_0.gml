/// @description
remove_from_card_stack(self)

var uniq_front = true;
var uniq_back = back_sprite != -1;

var front = front_sprite;
var back = back_sprite;
var my_id = id;

with (obj_card)
{
	if my_id != id {
		if uniq_front && front_sprite == front {
			uniq_front = false;		
		}
		if uniq_back && back_sprite == back {
			uniq_back = false;
		}
	}
}

with (obj_card_spawner)
{
	if my_id != id {
		if uniq_front && front_sprite == front {
			uniq_front = false;		
		}
		if uniq_back && back_sprite == back {
			uniq_back = false;
		}
	}
}

if uniq_front {
	show_debug_message("destroying unique sprite " + string(front_sprite));
	sprite_delete(front_sprite);
}

if uniq_back {
	show_debug_message("destroying unique sprite " + string(back_sprite));
	sprite_delete(back_sprite);	
}

clear_menus(self);
my_menu.Destroy();
my_submenu.Destroy();
my_partsmenu.Destroy();
delete my_partsmenu;
delete my_submenu;
delete my_menu;