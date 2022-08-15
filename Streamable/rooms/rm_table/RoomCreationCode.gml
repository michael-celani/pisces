vertex_format_begin();
vertex_format_add_colour();
vertex_format_add_position();
vertex_format_add_normal();
global.format_perspective = vertex_format_end();

global.min_depth = 0;

var noop = function() {};

global.menu = new RightClickMenu();
global.submenu = new RightClickMenu();

var to_hand = new RightClickMenuOption("Hand", move_to_hand, noop, noop);
var to_top = new RightClickMenuOption("Top of Deck", move_to_deck_top, noop, noop);
var to_bottom = new RightClickMenuOption("Bottom of Deck", move_to_deck_bottom, noop, noop);
var to_graveyard = new RightClickMenuOption("Graveyard", move_to_graveyard, noop, noop);
var to_exile = new RightClickMenuOption("Exile", move_to_exile, noop, noop);
var to_command = new RightClickMenuOption("Command Zone", move_to_command, noop, noop);
global.submenu.AddOption(to_hand);
global.submenu.AddOption(to_top);
global.submenu.AddOption(to_bottom);
global.submenu.AddOption(to_graveyard);
global.submenu.AddOption(to_exile);
global.submenu.AddOption(to_command);


var tap = new RightClickMenuOption("Tap", tap_card, noop, noop);
var flip = new RightClickMenuOption("Flip", flip_card, noop, noop);
var send_to = new RightClickMenuOption("Send To >", noop, function(owner, menu) {
	submenu_obj = global.submenu.CreateMenu(menu.x + menu.width + 2 * menu.padding, menu.bounding_y_start - menu.padding, owner);
}, function() {
	instance_destroy(submenu_obj)
});

var duplicate = new RightClickMenuOption("Duplicate", duplicate_card, noop, noop);

global.menu.AddOption(tap);
global.menu.AddOption(flip);
global.menu.AddOption(send_to);
global.menu.AddOption(duplicate);


var increase_ui = new RightClickMenuOption("Increase Size", increase_game_size, noop, noop);
var decrease_ui = new RightClickMenuOption("Decrease Size", decrease_game_size, noop, noop);
var load_deck = new RightClickMenuOption("Load Decklist", load_decklist, noop, noop);
var scry_search = new RightClickMenuOption("Search Scryfall", search_scryfall, noop, noop);

global.options = new RightClickMenu();
global.options.AddOption(increase_ui);
global.options.AddOption(decrease_ui);
global.options.AddOption(load_deck);
global.options.AddOption(scry_search);