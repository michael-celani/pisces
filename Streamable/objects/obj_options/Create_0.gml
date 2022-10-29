/// @description Options for the card game.

var options = new RightClickMenuOption("Open Options", open_options, noop, noop, spr_gear);
var load_deck = new RightClickMenuOption("Load Decklist...", load_decklist, noop, noop, spr_listul);
var scry_search = new RightClickMenuOption("Search Scryfall...", search_scryfall, noop, noop, spr_scryfall);

menu = new RightClickMenu([1]);
menu.AddOption(options);
menu.AddOption(load_deck);
menu.AddOption(scry_search);

default_inertia = 10.0;
default_scaling = 0.3;
dragging_inertia = -8.0;
dragging_scaling = +0.1;
hovering_scaling = +0.05;

tapped_angle = 90;
tap_length = 1000000 * 0.33;

snap_to_grid = true;
grid_size = 64

multi_drag = false;

background_sprite = spr_black;