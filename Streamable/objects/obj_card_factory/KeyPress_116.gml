/// @description Load Decklist

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