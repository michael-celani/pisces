// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function increase_game_size(options_inst)
{
	options_inst.default_scaling = clamp(options_inst.default_scaling + 0.05, 0.1, 0.5);
}

function decrease_game_size(options_inst)
{
	options_inst.default_scaling = clamp(options_inst.default_scaling - 0.05, 0.1, 0.5);
}

function load_decklist(options_inst)
{
	var file = get_open_filename("decklists (.txt)|*.txt", "deck.txt");

	if file != ""
	{
	    var file_id = file_text_open_read(file);
		while (!file_text_eof(file_id))
		{

			var num = file_text_read_real(file_id);
			var card = file_text_readln(file_id);
			card = string_replace(card, "\n", "");
			card = string_replace(card, "\r", "");
		    instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_card_request, { "req": card, "spawn_number": real(num) })
		}
	}	
}

function load_background(options_inst)
{
	var file = get_open_filename("images (.png)|*.png", "background.png");
	
	if file != ""
	{
		if (options_inst.background_sprite != spr_black)
		{
			sprite_delete(options_inst.background_sprite)	
		}
		
		options_inst.background_sprite = sprite_add(file, 1, false, true, 0, 0);
	}
}

function search_scryfall(options_inst)
{
	if instance_exists(obj_search_request) return;
	
	instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_search_request);
	keyboard_string = "";
}

function open_options(options_inst)
{
	if (!instance_exists(obj_window))
	{
		if !keys_are_active() return;
		var window = instance_create_layer(room_width / 2 - 640, room_height / 2 - 360, "UI", obj_window, { "height": 220 });
		var title = instance_create_layer(window.x, window.y, "UI", obj_title_bar, {"parent_component": window});
		var close = instance_create_layer(window.x + window.width - 60, window.y + 20, "UI", obj_close, {"parent_component": title});
	
		var check_label = instance_create_layer(window.x + 20, window.y + 95, "UI", obj_label, {
			"parent_component": window,
			"label_font": fnt_beleren,
			"label_text": "Card Size:"
		});
	
		var button = instance_create_layer(window.x + 20, window.y + 150, "UI", obj_button,
			{
				"parent_component": window,
				"active": camera_exists(),
				"on_click": toggle_camera_mirroring,
				"button_text": "Toggle Camera Mirroring"
			});
		
		var button2 = instance_create_layer(button.x + button.image_xscale + 10, button.y, "UI", obj_button,
			{
				"parent_component": window,
				"on_click": function() { load_background(obj_options) },
				"button_text": "Load Background"
			});
	
		var slider = instance_create_layer(window.x + window.width - 740, window.y + 115, "UI", obj_slider, 
			{ 
				"parent_component": window,
				"value_low": 0.15,
				"value_high": 0.5,
				"value": options_inst.default_scaling,
				"on_drag": function(new_value) { obj_options.default_scaling = new_value; }
			});
	}
	else
	{
		instance_destroy(obj_window);
	}	
}