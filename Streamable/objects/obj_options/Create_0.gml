/// @description Options for the card game.

var roll2 = new RightClickMenuOption("Roll d2", roll_dice(2, spr_d2_logo), noop, noop, spr_d2);
var roll4 = new RightClickMenuOption("Roll d4", roll_dice(4, spr_d4_logo), noop, noop, spr_d4);
var roll6 = new RightClickMenuOption("Roll d6", roll_dice(6, spr_d6_logo), noop, noop, spr_d6);
var roll8 = new RightClickMenuOption("Roll d8", roll_dice(8, spr_d8_logo), noop, noop, spr_d8);
var roll10 = new RightClickMenuOption("Roll d10", roll_dice(10, spr_d10_logo), noop, noop, spr_d10);
var roll12 = new RightClickMenuOption("Roll d12", roll_dice(12, spr_d12_logo), noop, noop, spr_d12);
var roll20 = new RightClickMenuOption("Roll d20", roll_dice(20, spr_d20_logo), noop, noop, spr_d20);
roll_menu = new RightClickMenu();
roll_menu.AddOption(roll2);
roll_menu.AddOption(roll6);
roll_menu.AddOption(roll20);
roll_menu.AddSeparator();
roll_menu.AddOption(roll4);
roll_menu.AddOption(roll8);
roll_menu.AddOption(roll10);
roll_menu.AddOption(roll12);

var roll_submenu = new RightClickSubMenu("Roll >", roll_menu, spr_dice);
var options = new RightClickMenuOption("Open Options", open_options, noop, noop, spr_gear, "O");
var load_deck = new RightClickMenuOption("Load Decklist...", load_decklist, noop, noop, spr_listul);
var scry_search = new RightClickMenuOption("Search Scryfall...", search_scryfall, noop, noop, spr_scryfall);

var save = new RightClickMenuOption("Save State", save_state, noop, noop, spr_save, "F7");
var load = new RightClickMenuOption("Load State", load_state, noop, noop, spr_load, "F8");


menu = new RightClickMenu();
menu.AddOption(roll_submenu);
menu.AddSeparator();
menu.AddOption(save);
menu.AddOption(load);
menu.AddSeparator();
menu.AddOption(load_deck);
menu.AddOption(scry_search);
menu.AddSeparator();
menu.AddOption(options);



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
card_back_sprite = spr_card_bad;

since_last = 0;
since_last_delta = 0;
since_last_time = game_get_speed(gamespeed_microseconds);

if not file_exists("background.img") return;
background_sprite = sprite_add("background.img", 1, false, true, 0, 0);