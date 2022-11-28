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
			var lineContent = file_text_readln(file_id);
			//var card = file_text_readln(file_id);
			lineContent = string_replace(lineContent, "\n", "");
			lineContent = string_replace(lineContent, "\r", "");

			//operating on the MTGA format (exportable with moxfield and archidekt.) (TESTED AND FAILED: MTGGOLDFISH <does not use correct set codes>)
			//Archidekt's verbose output includes some weirdness (#x, *F* and *E* for foiling treatments), just filter these if possible
			var collectorNum = -1;
			var setCode = "";

			var splitContents = string_split(lineContent," ");

			var arLen = array_length(splitContents);

			//filter out all "" instances
			var i = 0;
			while (i < arLen)
			{
				//scan through splitComponents and filter out all instances of ""

				if splitContents[i] == ""
				{
					array_delete(splitContents,i,1);
					arLen -=1;
				}
				else
				{
					i+=1;
				}
			}


			//check if its from archidekt

			if splitContents[0] == "x"
			{
				//  its an archidekt list! cull this and process the rest of the entry accordingly
				for (var i = 1; i<arLen; i+=1)
				{

					array_set(splitContents,i-1,splitContents[i]);
				}

				array_delete(splitContents,arLen-1,1);//get that duplicate last piece off
				arLen -=1;
				var trueEndFound = false;
				while not trueEndFound
				{
					//dual purpose, gets the array to the right size and reads the last bit, should be of type string

					var last_entry = string(splitContents[arLen-1]);
					//filter archidekt's foiling (**), categories ([]), and labels (^^)
					if (string_char_at(last_entry,0) == "*" or string_char_at(last_entry,0) == "[" or string_char_at(last_entry,0) == "^")
					{

						array_delete(splitContents,arLen-1,1);//get that duplicate last piece off
						arLen -=1;

					}
					else
					{
						trueEndFound=true;
					}
				}
				//at this point, this entry should be almost equivalent to the moxfield list
			}



			if string_length(string_digits(splitContents[arLen-1])) == string_length(splitContents[arLen-1])
			{
				// last entry is a collector number
				collectorNum = real(splitContents[arLen-1]);
				array_delete(splitContents,arLen-1,1);//get that duplicate last piece off
				arLen -=1;
			}

			if string_char_at(splitContents[arLen-1],0) == "("
			{

				var setCodePiece = splitContents[arLen-1];
				setCode = string_lower(string_replace(string_replace(setCodePiece,"(",""),")",""));

				array_delete(splitContents,arLen-1,1);//get that duplicate last piece off
				arLen -=1;
			}



			var cardName = "!\""+string_compose_from_array(splitContents," ")+"\"";
			splitContents = -1;// santitize and delete the array
			var card = cardName;
			var searchType = "name";
			if collectorNum != -1
			{
				card =card + " cn="+string(collectorNum);
				searchType = "search";
			}

			if setCode != ""
			{
				card =card + " set="+setCode;
				searchType = "search";
			}



		    instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_card_request, { "req": card, "spawn_number": real(num), "searchType": searchType })

		}
	}
}

function load_background(options_inst)
{
	var file = get_open_filename("Images|*.png;*.jpg", "background.png");

	if file == "" return;

	// Duplicate the file:
	file_copy(file, "background.img");

	if (options_inst.background_sprite != spr_black)
	{
		sprite_delete(options_inst.background_sprite)
	}

	options_inst.background_sprite = sprite_add(file, 1, false, true, 0, 0);
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

	// Duplicate the file:
	file_copy(file, "sleeves.img");

	var new_sprite = sprite_add(file, 1, false, true, 372, 520);
	
	if sprite_get_width(new_sprite) != 745 or sprite_get_height(new_sprite) != 1040
	{
		// Sprite has incorrect dimensions
		sprite_delete(new_sprite);
		
		// Create error window
		
		return;
	}
	
	if options_inst.card_back_sprite != spr_card_bad
	{
		sprite_delete(options_inst.card_back_sprite);
	}
	
	options_inst.card_back_sprite = new_sprite;
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