// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function increase_game_size(options_inst)
{
	options_inst.default_scaling = clamp(options_inst.default_scaling + 0.05, 0.3, 0.7);
}

function decrease_game_size(options_inst)
{
	options_inst.default_scaling = clamp(options_inst.default_scaling - 0.05, 0.3, 0.7);
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
		    instance_create_layer(0, 0, "Instances", obj_card_request, { "req": card, "spawn_number": real(num) })
		}
	}	
}

function search_scryfall(options_inst)
{
	if instance_exists(obj_search_request) return;
	
	instance_create_layer(0, 0, "Instances", obj_search_request);
	keyboard_string = "";
}

