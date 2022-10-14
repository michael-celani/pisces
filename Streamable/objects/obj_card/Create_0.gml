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

var noop = function() {};

my_menu = new RightClickMenu();
my_submenu = new RightClickMenu();
my_partsmenu = new RightClickMenu();

var to_hand = new RightClickMenuOption("Hand", move_to_hand, noop, noop);
var to_top = new RightClickMenuOption("Top of Deck", move_to_deck_top, noop, noop);
var to_bottom = new RightClickMenuOption("Bottom of Deck", move_to_deck_bottom, noop, noop);
var to_graveyard = new RightClickMenuOption("Graveyard", move_to_graveyard, noop, noop);
var to_exile = new RightClickMenuOption("Exile", move_to_exile, noop, noop);
var to_command = new RightClickMenuOption("Command Zone", move_to_command, noop, noop);
my_submenu.AddOption(to_hand);
my_submenu.AddOption(to_top);
my_submenu.AddOption(to_bottom);
my_submenu.AddOption(to_graveyard);
my_submenu.AddOption(to_exile);
my_submenu.AddOption(to_command);


var tap = new RightClickMenuOption("Tap", tap_card, noop, noop);
var flip = new RightClickMenuOption("Flip", flip_card, noop, noop);
var send_to = new RightClickMenuOption("Send To >", noop, function(owner, menu) {
	submenu_obj = my_submenu.CreateMenu(menu.x + menu.width + 2 * menu.padding, menu.bounding_y_start - menu.padding, owner);
}, function() {
	instance_destroy(submenu_obj)
});

var duplicate = new RightClickMenuOption("Duplicate", duplicate_card, noop, noop);

my_menu.AddOption(tap);
my_menu.AddOption(flip);
my_menu.AddOption(duplicate);
my_menu.AddOption(send_to);

if array_length(all_parts) > 0
{
	for (var i = 0; i < array_length(all_parts); i++)
	{
		var curr_card = all_parts[i];
		
		var func = method(curr_card, function(card_inst)
		{
			instance_create_layer(card_inst.x + card_inst.sprite_width / 3, card_inst.y + card_inst.sprite_height / 3, "Instances", obj_id_request, { "req": self.internal_id, "spawn_number": 1 })
		})
		var menu_opt = new RightClickMenuOption(curr_card.internal_name, func, noop, noop);
		my_partsmenu.AddOption(menu_opt)
	}
	
	
	var create_parts = new RightClickMenuOption("Tokens >", noop, function(owner, menu) {
		partsmenu_obj = my_partsmenu.CreateMenu(menu.x + menu.width + 2 * menu.padding, menu.bounding_y_start - menu.padding, owner);
	}, function() {
		instance_destroy(partsmenu_obj)
	});
	
	my_menu.AddOption(create_parts);
}

event_inherited();
