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
	back_sprite = spr_card_bad;
	internal_id = "";
	internal_name = "";
	
	
	
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
	
	static HandleDataPopulation = function() {
		var response_id = async_load[? "id"];
		var response_status = async_load[? "status"];
	
		if response_id == card_data_req
		{
			if response_status == 0
			{
				var json = async_load[? "result"];
				var data = json_parse(json);
				
				if data.object == "list"
				{
					card_data = data.data[0]
				}
				else if data.object = "card"
				{
					card_data = data
				}
				else if data.object = "error"
				{
					return false;
				}
				
				if card_data.layout == "modal_dfc" or card_data.layout == "transform" or card_data.layout == "double_faced_token"
				{
					if file_exists(card_data.id + "-back.png")
					{
						back_sprite = sprite_add(card_data.id + "-back.png", 1, false, true, 745 / 2, 1040 / 2);
						
						if file_exists(card_data.id + "-front.png")
						{
							front_sprite = sprite_add(card_data.id + "-front.png", 1, false, true, 745 / 2, 1040 / 2);
						}
						else
						{
							image_front_req = http_get_file(card_data.card_faces[0].image_uris.png, card_data.id + "-front.png");
						}
					}
					else
					{
						image_back_req = http_get_file(card_data.card_faces[1].image_uris.png, card_data.id + "-front.png");
					}
				}
				else
				{
					// Handle front
					if file_exists(card_data.id + "-front.png")
					{
						front_sprite = sprite_add(card_data.id + "-front.png", 1, false, true, 745 / 2, 1040 / 2);
					}
					else
					{
						image_front_req = http_get_file(card_data.image_uris.png, card_data.id + "-front.png");
					}
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
				image_front_req = http_get_file(card_data.card_faces[0].image_uris.png, card_data.id + "-front.png");
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
		
		for (var j = 0; j < number; j++) {
			var data_struct = { 
				"name": card_data.name, 
				sprite_index: front_sprite, 
				"front_sprite": front_sprite, 
				"back_sprite": back_sprite,
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