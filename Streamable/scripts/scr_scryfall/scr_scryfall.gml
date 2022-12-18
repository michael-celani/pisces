function scryfall_search(search)
{
	var api = "https://api.scryfall.com/cards/search?q=" + string_replace_all(string_replace_all(search, "\"", "%22")," ","+");
	return http_get(api);
}

function scryfall_named(name)
{
	var api = "https://api.scryfall.com/cards/named?fuzzy=" + string_replace_all(name, "\"", "%22");
	return http_get(api);
}

function scryfall_id(scry_id)
{
	var api = "https://api.scryfall.com/cards/" + scry_id;
	return http_get(api);
}

function CardFactory() constructor
{
	card_data_req = -1;
	image_front_req = -1;
	image_back_req = -1;
	
	card_data = -1;
	front_sprite = -1;
	back_sprite = -1;
	front_sprite_kamiflipped = -1;
	internal_id = "";
	internal_name = "";
	layout = "";
	
	static PopulateDataViaScryfallSearch = function(search)
	{
		
		card_data_req = scryfall_search(search);
	}
	
	static PopulateDataViaScryfallName = function(name)
	{
		card_data_req = scryfall_named(name);	
	}
	
	static PopulateDataViaScryfallId = function(scry_id)
	{
		card_data_req = scryfall_id(scry_id);
	}
	
	static PopulateDataViaInternalId = function()
	{
		card_data_req = scryfall_id(internal_id);
	}
	
	static LoadBackSprite = function()
	{
		var file_name = card_data.id + "-back.png";
		
		if file_exists(file_name)
		{
			show_debug_message("loading back sprite from file: " + file_name);
			back_sprite = sprite_add(file_name, 1, false, true, 745 / 2, 1040 / 2);
		}
		else
		{
			var back_face_url = "https://api.scryfall.com/cards/" + card_data.id + "?format=image&version=png&face=back"
			show_debug_message("loading back sprite from url: " + back_face_url);
			image_back_req = http_get_file(back_face_url, file_name);
		}
	}
	
	static LoadFrontSprite = function()
	{
		var file_name = card_data.id + "-front.png";
		
		if file_exists(file_name)
		{
			show_debug_message("loading front sprite from file: " + file_name);
			front_sprite = sprite_add(file_name, 1, false, true, 745 / 2, 1040 / 2);
		}
		else
		{
			var front_face_url = "https://api.scryfall.com/cards/" + card_data.id + "?format=image&version=png&face=front"
			show_debug_message("loading front sprite from url: " + front_face_url);
			image_front_req = http_get_file(front_face_url, file_name);
		}			
	}
	
	static HandleDataPopulation = function() {
		var response_id = async_load[? "id"];
		var response_status = async_load[? "status"];
	
		if response_id == card_data_req
		{
			if response_status == 0
			{
				var json = async_load[? "result"];
				//show_debug_message(json);
				var data = json_parse(json);
				
				switch (data.object)
				{
					case "list":
						card_data = data.data[0];
					break;
					
					case "card":
						card_data = data;
					break;
					
					default:
						return false;
				}

				layout = card_data.layout;
				
				// The card layout supports a backface:
				if (card_data.layout == "modal_dfc" or 
					card_data.layout == "transform" or 
					card_data.layout == "double_faced_token")
				{
					LoadBackSprite()
					
					// If the sprite was cached load the front sprite immediately:
					if back_sprite != -1 LoadFrontSprite();
				}
				else
				{
					LoadFrontSprite()	
				}
			}
			else if response_status == -1
			{
				// Some sort of HTTP error occurred
				return false
			}
		}
		
		else if response_id == image_back_req
		{
			if response_status == 0
			{
				var path = async_load[? "result"];
				back_sprite = sprite_add(path, 1, false, true, 745 / 2, 1040 / 2);
				LoadFrontSprite();
			}
			else if response_status == -1
			{
				// Some sort of HTTP error occurred
				return false
			}	
		}
		
		else if response_id == image_front_req
		{
			if response_status == 0
			{
				var path = async_load[? "result"];
				front_sprite = sprite_add(path, 1, false, true, 745 / 2, 1040 / 2);
			}
			else if response_status == -1
			{
				// Some sort of HTTP error occurred
				return false
			}	
		}
		
		return true;
	}
	
	
	
	static CanCreate = function()
	{
		return front_sprite != -1
	}
	
	static Create = function(create_x, create_y, number)
	{
		cards = array_create(number);
		
		if layout == "flip" {
			front_sprite_kamiflipped = create_kamiflip_sprite(front_sprite);
		}
		
		for (var j = 0; j < number; j++) {
			var data_struct = { 
				"name": card_data.name, 
				sprite_index: front_sprite, 
				"front_sprite": front_sprite, 
				"back_sprite": back_sprite,
				"front_sprite_kamiflipped": front_sprite_kamiflipped,
				"back_sprite_kamiflipped": -1,
				"all_parts": []
			}
			
			if variable_struct_exists(card_data, "all_parts")
			{
				for (var i = 0; i < array_length(card_data.all_parts); i++)
				{
					if (card_data.all_parts[i].component == "token")
					{
						var related_card = new CardFactory();
						related_card.internal_id = card_data.all_parts[i].id;
						related_card.internal_name = card_data.all_parts[i].name;
						array_insert(data_struct.all_parts, array_length(data_struct.all_parts), related_card)
					}
				}
			}
			
			cards[j] = instance_create_layer(create_x, create_y, "Battlefield", obj_card, data_struct);
		}
		
		return cards;
	}
}