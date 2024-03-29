/// @description
event_inherited();

var title = instance_create_layer(x, y, "UI", obj_title_bar, 
{
	"parent_component": id, 
	"title_text": "Import Cards From Website"
});

instance_create_layer(x + width - 60, y + 20, "UI", obj_close, {"parent_component": title});

draw_set_font(fnt_segoe);
var field_height = string_height("|");

var search_field = instance_create_layer(x + 10, y + 95, "UI", obj_text_field, {
	"parent_component": id,
	"width": width - 20,
	"height": field_height + 10,
	"default_text": "Supported: Archidekt, Moxfield"
});

var import_decklist = method(
	{
		"search_bar": search_field, 
		"parent_component": id
	}, function() { 
		instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_import_request, {"req": search_bar.curr_string});
		close_top_component();
	});
	
search_field.on_enter = import_decklist;
keyboard_string = "";

var button = instance_create_layer(x + 20, y + 170, "UI", obj_button,
{
	"parent_component": id,
	"on_click": import_decklist,
	"button_text": "Import"
});
		
var button2 = instance_create_layer(button.x + button.image_xscale + 10, button.y, "UI", obj_button,
{
	"parent_component": id,
	"on_click": close_top_component,
	"button_text": "Cancel"
});

button2.x = x + width - button2.image_xscale - 10;
button.x = button2.x - button.image_xscale - 10;