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
			
			var arLen = ds_list_size(splitContents);
			
			//filter out all "" instances
			var i = 0;
			while (i < arLen)
			{
				//scan through splitComponents and filter out all instances of ""
				if splitContents[| i] == ""
				{
					ds_list_delete(splitContents,i);
					arLen -=1;
				}
				else
				{
					i+=1;
				}
			}
			
			
			//check if its from archidekt
			if splitContents[| 0] == "x"
			{
				//  its an archidekt list! cull this and process the rest of the entry accordingly
				for (var i = 1; i<arLen; i+=1)
				{
					ds_list_set(splitContents,i-1,splitContents[| i])
				}
				ds_list_delete(splitContents,arLen-1);//get that duplicate last piece off
				arLen -=1;
				var trueEndFound = false;
				while not trueEndFound
				{
					//dual purpose, gets the array to the right size and reads the last bit, should be of type string
					var last_entry = string(splitContents[| arLen-1]);
					//filter archidekt's foiling (**), categories ([]), and labels (^^)
					if (string_char_at(last_entry,0) == "*" or string_char_at(last_entry,0) == "[" or string_char_at(last_entry,0) == "^")
					{
						ds_list_delete(splitContents,arLen-1);//get that duplicate last piece off
						arLen -=1;
						
					}
					else
					{
						trueEndFound=true;
					}
				}
				//at this point, this entry should be almost equivalent to the moxfield list
			}
			
			
			
			if string_length(string_digits(splitContents[| arLen-1])) == string_length(splitContents[| arLen-1])
			{
				// last entry is a collector number
				collectorNum = real(splitContents[| arLen-1]);
				ds_list_delete(splitContents,arLen-1);//get that duplicate last piece off
				arLen -=1;
			}
				
			if string_char_at(splitContents[| arLen-1],0) == "("
			{
				var setCodePiece = splitContents[| arLen-1];
				setCode = string_lower(string_replace(string_replace(setCodePiece,"(",""),")",""));
				ds_list_delete(splitContents,arLen-1);//get that duplicate last piece off
				arLen -=1;
			}
				
			
			
			var cardName = "!\""+string_compose_from_ds_list(splitContents," ")+"\"";
			ds_list_destroy(splitContents);
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

function toggle_draw_on_turn(options_inst)
{
	options_inst.draw_on_turn = !options_inst.draw_on_turn;
}
