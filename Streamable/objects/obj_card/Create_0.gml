offset_drag = false;

is_tapping = false;
tapped = false;

next_x = x
next_y = y

x_vel = 0;
y_vel = 0;

skew_x = 0;
skew_y = 0;

parent_stack = noone;

image_xscale = obj_options.default_scaling;
image_yscale = obj_options.default_scaling;
time_hovering = 0;

offset_x = x;
offset_y = y;

counters = 0;


my_submenu = new RightClickMenu();
my_partsmenu = new RightClickMenu();

var to_hand = new RightClickMenuOption("Hand", move_to_hand, noop, noop, spr_hand);
var to_top = new RightClickMenuOption("Top of Library", move_to_deck_top, noop, noop, spr_book);
var to_bottom = new RightClickMenuOption("Bottom of Library", move_to_deck_bottom, noop, noop, spr_book_bookmark);
var to_graveyard = new RightClickMenuOption("Graveyard", move_to_graveyard, noop, noop, spr_skull_crossbones);
var to_exile = new RightClickMenuOption("Exile", move_to_exile, noop, noop, spr_exile);
var to_command = new RightClickMenuOption("Command Zone", move_to_command, noop, noop, spr_crown);
my_submenu.AddOption(to_hand);
my_submenu.AddOption(to_top);
my_submenu.AddOption(to_bottom);
my_submenu.AddOption(to_graveyard);
my_submenu.AddOption(to_exile);
my_submenu.AddOption(to_command);


var tap = new RightClickMenuOption("Tap", tap_card, noop, noop, spr_tap);
var flip = new RightClickMenuOption("Flip", flip_card, noop, noop, spr_flip);
var send_to = new RightClickSubMenu("Send To >", my_submenu, spr_envelope);
var duplicate = new RightClickMenuOption("Duplicate", duplicate_card, noop, noop, spr_copy);
var note = new RightClickMenuOption("Update Note", update_note,noop,noop, spr_note_sticky);
var spawn = new RightClickMenuOption("Make Spawner", create_spawner, noop, noop);
var add_counter = new RightClickMenuOption("Add Counter", function(card_inst) { card_inst.counters++ }, noop, noop, spr_counter_add);
var rem_counter = new RightClickMenuOption("Remove Counter", function(card_inst) { card_inst.counters = max(0, card_inst.counters - 1) }, noop, noop, spr_counter_rem);
var destroy = new RightClickMenuOption("Delete", function(card_inst) {instance_destroy(card_inst)}, noop, noop, spr_trash);
destroy.draw_color = c_red;

my_menu = new RightClickMenu();
my_menu.AddOption(tap);
my_menu.AddOption(flip);
my_menu.AddSeparator();
my_menu.AddOption(duplicate);


if array_length(all_parts) > 0
{
	for (var i = 0; i < array_length(all_parts); i++)
	{
		var curr_card = all_parts[i];
		
		var func = method(curr_card, function(card_inst)
		{
			instance_create_layer(card_inst.x + card_inst.sprite_width / 9, card_inst.y + card_inst.sprite_height / 9, "Instances", obj_id_request, { "req": self.internal_id, "spawn_number": 1 })
		})
		var menu_opt = new RightClickMenuOption(curr_card.internal_name, func, noop, noop, spr_shapes);
		my_partsmenu.AddOption(menu_opt)
	}
	
	var create_parts = new RightClickSubMenu("Tokens >", my_partsmenu, spr_shapes);
	create_parts.draw_color = c_yellow;
	
	my_menu.AddOption(create_parts);
}

my_menu.AddSeparator();
my_menu.AddOption(add_counter);
my_menu.AddOption(rem_counter);
//my_menu.AddOption(spawn);
my_menu.AddOption(note);
my_menu.AddSeparator();
my_menu.AddOption(send_to);
my_menu.AddOption(destroy);

height_priority = next_height_priority();
owning_canvas = noone;

event_inherited();
