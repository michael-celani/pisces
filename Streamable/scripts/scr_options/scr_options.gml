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
	var file = get_open_filename("Images|*.png;*.jpg", "background.png");
	
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
	var width = 1280;
	var create_x = room_width / 2 - width/ 2;
	var search_window = instance_create_layer(create_x, 50, "Instances", obj_scryfall_window, {"width": width, "height": 240});
}

function open_options(options_inst)
{
	if (!instance_exists(obj_options_window))
	{
		if !keys_are_active() return;
		
		instance_create_layer(room_width / 2 - 640, room_height / 2 - 360, "UI", obj_options_window);
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