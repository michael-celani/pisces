surface_depth_disable(true);

vertex_format_begin();
vertex_format_add_colour();
vertex_format_add_position();
vertex_format_add_normal();
global.format_perspective = vertex_format_end();

var noop = function() {};
var increase_ui = new RightClickMenuOption("Increase Size", increase_game_size, noop, noop);
var decrease_ui = new RightClickMenuOption("Decrease Size", decrease_game_size, noop, noop);
var load_deck = new RightClickMenuOption("Load Decklist", load_decklist, noop, noop);
var load_back = new RightClickMenuOption("Change Background", load_background, noop, noop);
var scry_search = new RightClickMenuOption("Search Scryfall", search_scryfall, noop, noop);

global.options = new RightClickMenu();
global.options.AddOption(increase_ui);
global.options.AddOption(decrease_ui);
global.options.AddOption(load_deck);
global.options.AddOption(load_back);
global.options.AddOption(scry_search);