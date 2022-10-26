// You can write your code in this editor
/// @description
event_inherited();

var title = instance_create_layer(x, y, "UI", obj_title_bar, 
{
	"parent_component": id, 
	"title_text": "Annotation for " + card.name
});

instance_create_layer(x + width - 60, y + 20, "UI", obj_close, {"parent_component": title});

draw_set_font(fnt_segoe);
var field_height = string_height("|");

var text_field = instance_create_layer(x + 10, y + 95, "UI", obj_text_field, {
	"parent_component": id,
	"width": width - 20,
	"height": field_height + 10,
});

var scry_search = method({"card": card, "text_field": text_field, "parent_component": id}, function() { 
		card.note_content = text_field.curr_string;
		close_top_component();
	});
	
text_field.on_enter = scry_search;
text_field.curr_string = card.note_content
keyboard_string = text_field.curr_string;

with (text_field)
{
	set_focused();
}

var button = instance_create_layer(x + 20, y + 170, "UI", obj_button,
{
	"parent_component": id,
	"on_click": scry_search,
	"button_text": "OK"
});
		
var button2 = instance_create_layer(button.x + button.image_xscale + 10, button.y, "UI", obj_button,
{
	"parent_component": id,
	"on_click": close_top_component,
	"button_text": "Cancel"
});

button2.x = x + width - button2.image_xscale - 10;
button.x = button2.x - button.image_xscale - 10;