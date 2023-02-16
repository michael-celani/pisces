function CardSearch(_name = "", _quantity = 1) constructor
{
	name = _name;
	quantity = _quantity;
	set = "";
	collector_number = "";
	
	static CreateRequest = function()
	{
		var search = "!\"" + name + "\"";
		var search_type = "name";
		
		if set != ""
		{
			search = search + " set:\"" + set + "\"";
			search_type = "search";
		}
	
		if collector_number != ""
		{
			search = search + " cn:\"" + collector_number + "\"";
			search_type = "search";
		}
		
		show_debug_message(search);
		
		instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_card_request, { "req": search, "spawn_number": real(quantity), "searchType": search_type })
	}
}

function parse_decklist_line(content, index)
{
	// Extract the quantity:
	content = string_trim(content);
	var str_temp = string_split(content, " ", false, 1);
	var quantity_str = string_digits(str_temp[0]);
	var quantity = real(quantity_str);
	
	content = str_temp[1];
	
	// Delete anything in [], **, or ^^
	var bracket_start = string_pos_any(content, "[", "*", "^")
	
	if bracket_start != 0
	{
		content = string_copy(content, 1, bracket_start - 1);
	}
	// Split to find the parameters:
	var split_content = string_split_ext(content, ["(", ")"], true);
	
	// Create the card search object:
	var name = string_trim(split_content[0]);
	
	card = new CardSearch(name, quantity);
	
	if array_length(split_content) > 1
	{
		card.set = string_trim(split_content[1]);
	}
	
	if array_length(split_content) > 2
	{
		card.collector_number = string_trim(split_content[2]);	
	}
	
	return card;
}

function load_decklist_file(options_inst)
{
	var file = get_open_filename("decklists (.txt)|*.txt", "deck.txt");
	if file == "" return;

	var lines = file_text_open_readall(file);
	load_decklist_lines(lines);
}

function load_decklist_clip(options_inst)
{
	if !clipboard_has_text() return;

	str = clipboard_get_text();
	clipboard_set_text("");

	var lines = string_split(str, "\n");
	load_decklist_lines(lines);
}

function load_decklist_website(deck_url)
{
	if string_pos("moxfield", deck_url) != 0
	{
		// Moxfield
		var deck_id = array_last(string_split(deck_url, "/"))
		var api_url = "https://api2.moxfield.com/v2/decks/all/" + deck_id;
		return {
			"req": http_get(api_url),
			"type": "moxfield",
			"export_req": -1,
			"deck_id": deck_id
		};
	}
	else if string_pos("archidekt", deck_url) != 0
	{
		var deck_id = string_digits(deck_url);
		var api_url = "https://archidekt.com/api/decks/" + deck_id + "/"
		return {
			"req": http_get(api_url),
			"type": "archidekt",
			"export_req": -1,
			"deck_id": deck_id
		}
	}

	// Unsupported
	return -1;
}


function load_decklist_lines(lines)
{
	var trimmed_lines = array_map(lines, function (elem) {
		return string_trim(elem);	
	});
	
	var filtered_lines = array_filter(trimmed_lines, function (elem) {
		return elem != ""	
	});
	
	var searches = array_map(filtered_lines, parse_decklist_line);

	for (var i = 0; i < array_length(searches); i++)
	{
		searches[i].CreateRequest();
	}
}