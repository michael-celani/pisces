var response_id = async_load[? "id"];
var response_status = async_load[? "status"];
	
if response_id == decklist_request.req
{
	if response_status == -1
	{
		// Some sort of HTTP error occurred
		instance_destroy();
	}

	if response_status != 0 return;

	try
	{
		if decklist_request.type == "moxfield"
		{
			var json = async_load[? "result"];
			var export_pos = string_pos("\"exportId\":", json);
			var export_id = string_copy(json, export_pos + 12, 36);
			var export_url = "https://api2.moxfield.com/v2/decks/all/" + decklist_request.deck_id + "/export?arenaOnly=false&format=full&indicateFoils=true&exportId=" + export_id;
			
			//var split_json = string_split(json,",")		
			var parsed_json = json_parse(json)
			
			//var deck_format_str1 = string_delete(split_json[3],1,10)
			//show_debug_message("CBTT")
			var deck_format = parsed_json.format// string_delete(deck_format_str1,(string_length(deck_format_str1)),1)
			decklist_request.format = deck_format
			//show_debug_message(deck_format)			
			var ref_commander_string = "commander"
			//decklist_request.deck_format = deck_format;
			if deck_format == ref_commander_string
			{
				//identify how many commanders to set aside
				var commander_count = parsed_json.commandersCount
				decklist_request.commander_count = commander_count
			}
			
			
			decklist_request.export_req = http_get(export_url);
		}
		else if decklist_request.type == "archidekt"
		{
			var json = async_load[? "result"];
			var json_obj = json_parse(json);
			
			for (var i = 0; i < array_length(json_obj.cards); i++)
			{
				instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_id_request, { "req": json_obj.cards[i].card.uid, "spawn_number": json_obj.cards[i].quantity })
			}
		}
	}
	catch (_exception)
	{
		show_debug_message(_exception)//CBTT
		instance_create_layer(-500, 10, "UI", obj_notification, {
			notification_text: "An error occurred trying to load the decklist."
		});
	
		instance_destroy();
	}
}
else if response_id == decklist_request.export_req
{
	if response_status == -1
	{
		// Some sort of HTTP error occurred
		instance_destroy();
	}

	if response_status != 0 return;

	try
	{
		var resp = async_load[? "result"];
		var lines = string_split(resp, "\n");
		
		if decklist_request.format == "commander"
		{
			load_decklist_lines(lines,true,decklist_request.commander_count);
		}
		else
		{
			load_decklist_lines(lines);
		}
	}
	catch (_exception)
	{
		instance_create_layer(-500, 10, "UI", obj_notification, {
			notification_text: "An error occurred trying to load the decklist."
		});
	
		instance_destroy();
	}
}




