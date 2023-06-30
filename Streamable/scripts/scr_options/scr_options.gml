// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ini_b2str(flag) { return flag ? "true" : "false"; }

function load_settings_ini() {
	ini_open("settings.ini");
	obj_options.draw_on_turn = bool(ini_read_string("behavior", "draw_on_turn", obj_options.draw_on_turn));
	obj_options.deselect_after_tap = bool(ini_read_string("behavior", "deselect_after_tap", obj_options.deselect_after_tap));
	obj_options.deselect_after_drag = bool(ini_read_string("behavior", "deselect_after_drag", obj_options.deselect_after_drag));
	obj_options.fullscreen = bool(ini_read_string("behavior", "fullscreen", obj_options.fullscreen));
	ini_close();
}

function save_settings_ini() {
	ini_open("settings.ini");
	ini_write_string("behavior", "draw_on_turn", ini_b2str(obj_options.draw_on_turn));
	ini_write_string("behavior", "deselect_after_tap", ini_b2str(obj_options.deselect_after_tap));
	ini_write_string("behavior", "deselect_after_drag", ini_b2str(obj_options.deselect_after_drag));
	ini_write_string("behavior", "fullscreen", ini_b2str(obj_options.fullscreen));
	ini_close();
}

function increase_game_size(options_inst)
{
	options_inst.default_scaling = clamp(options_inst.default_scaling + 0.05, 0.1, 0.5);
}

function decrease_game_size(options_inst)
{
	options_inst.default_scaling = clamp(options_inst.default_scaling - 0.05, 0.1, 0.5);
}

function load_background(options_inst)
{
	var new_sprite, error_struct;
	
	var file = get_open_filename("Images|*.png;*.jpg", "background.png");
	if file == "" return;

	// Try to add the new sprite from the file:
	new_sprite = sprite_add(file, 1, false, true, 0, 0);

	// There was an error
	if (new_sprite == -1)
	{
		instance_create_layer(room_width / 2 - 375, 20, "UI", obj_error_window, {"error_text": "An error occurred while loading the\nbackground." })
		return;
	}

	if (options_inst.background_sprite != spr_black)
	{
		sprite_delete(options_inst.background_sprite)
	}

	options_inst.background_sprite = new_sprite;
	
	// Duplicate the file:
	file_copy(file, "background.img");
}

function load_sleeves(options_inst)
{
	var file = get_open_filename("Images|*.png;*.jpg", "background.png");

	if file == ""
	{
		if options_inst.card_back_sprite != spr_card_bad
		{
			sprite_delete(options_inst.card_back_sprite);
		}
		
		options_inst.card_back_sprite = spr_card_bad;
		return;
	};

	var new_sprite = sprite_add(file, 1, false, true, 372, 520);

	// There was an error
	if (new_sprite == -1)
	{
		instance_create_layer(room_width / 2 - 375, 20, "UI", obj_error_window, {"error_text": "An error occurred while loading the\ncard sleeves." })
		return;
	}

	var temp_surf = surface_create(745, 1040);
	surface_set_target(temp_surf);
	draw_sprite_stretched(new_sprite, 0, 0, 0, 745, 1040);
	draw_sprite_stretched(spr_sleeve_mask, 0, 0, 0, 745, 1040);
	surface_reset_target();
				
	// Delete the uploaded sprite
	sprite_delete(new_sprite);
		
	// Save the resized sprite
	new_sprite = sprite_create_from_surface(temp_surf, 0, 0, 745, 1040, true, true, 372, 520);
	surface_free(temp_surf);
	
	if options_inst.card_back_sprite != spr_card_bad
	{
		sprite_delete(options_inst.card_back_sprite);
	}
	
	options_inst.card_back_sprite = new_sprite;
	
	// Duplicate the file:
	file_copy(file, "sleeves.img");
}

function search_scryfall(options_inst)
{
	var width = 1280;
	var create_x = room_width / 2 - width/ 2;
	var search_window = instance_create_layer(create_x, 50, "Instances", obj_scryfall_window, {"width": width, "height": 240});
}

function load_deck_from_website(options_inst)
{
	var width = 1280;
	var create_x = room_width / 2 - width/ 2;
	var search_window = instance_create_layer(create_x, 50, "Instances", obj_decklist_window, {"width": width, "height": 240});
}

function toggle_fullscreen(options_inst)
{
	options_inst.fullscreen = !options_inst.fullscreen;
	window_set_fullscreen(options_inst.fullscreen);
	save_settings_ini();
}

function open_options(options_inst)
{
	if (!instance_exists(obj_options_window))
	{
		if !keys_are_active() return;

		instance_create_layer(
			(room_width - 1000) / 2,
			(room_height - 520) / 2,
			"UI", obj_options_window);
	}
	else
	{
		instance_destroy(obj_options_window);
	}
}

function close_top_component()
{
	var component = parent_component;

	while (component.parent_component != noone)
	{
		component = component.parent_component;
	}

	instance_destroy(component);
}

function roll_dice(num, icon)
{
	return method({"num_max": num, "icon": icon}, function (options_inst) {
		instance_create_layer(
			mouse_x,
			mouse_y,
			"Instances",
			obj_die,
			{ roll: irandom_range(1, num_max), sprite_index: icon }
		);
	});
}

function toggle_draw_on_turn(options_inst)
{
	options_inst.draw_on_turn = !options_inst.draw_on_turn;
	save_settings_ini();
}

function toggle_deselect_after_tap(options_inst) {
	options_inst.deselect_after_tap = !options_inst.deselect_after_tap;
	save_settings_ini();
}

function toggle_deselect_after_drag(options_inst) {
	options_inst.deselect_after_drag = !options_inst.deselect_after_drag;
	save_settings_ini();
}

function draw_card(options_inst)
{
	with obj_deck
	{
		if array_length(stack_list) > 0
		{
			with stack_list[0]
			{
				x = room_width / 2;
				y = room_height + sprite_height;
				add_to_card_stack(self, obj_hand);
			}
		}
	}
}

function save_state(options_inst)
{
	with (obj_card)
	{
		if (save_struct != undefined and save_struct.destroyed)
		{
			instance_destroy();
			continue;
		}
		
		save_struct = {
			"saved_x": x,
			"saved_y": y,
			"saved_hp": height_priority,
			"is_flipped": is_flipped,
			"is_upsidedown": is_upsidedown,
			"tapped": tapped,
			"counters": counters,
			"note_content": note_content,
			"destroyed": false
		}	
	}

	with (obj_card_stack)
	{
		saved_list = []
		array_copy(saved_list, 0, stack_list, 0, array_length(stack_list))
	}
}

function load_state(options_inst)
{
	obj_height_manager.height_modified = true;

	with (obj_card)
	{
		if save_struct == undefined {
			instance_destroy();
		}
		else
		{
			remove_from_card_stack(self);
			layer_add_instance("Battlefield", self);
		
			next_x = save_struct.saved_x;
			next_y = save_struct.saved_y;
			
			if save_struct.destroyed
			{
				x = next_x;
				y = next_y;
				save_struct.destroyed = false;
			}
			
			height_priority = save_struct.saved_hp;
			is_flipped = save_struct.is_flipped;
			is_upsidedown = save_struct.is_upsidedown;
			is_tapping = tapped != save_struct.tapped;
			counters = save_struct.counters;
			note_content = save_struct.note_content;
		}
	}

	with (obj_card_stack)
	{
		for (var i = 0; i < array_length(saved_list); i++)
		{
			if not instance_exists(saved_list[i]) continue;
		
			add_to_card_stack(saved_list[i], self);
		}
	}
}