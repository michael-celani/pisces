/// @description
event_inherited();

var title = instance_create_layer(x, y, "UI", obj_title_bar, 
{
	"parent_component": id, 
	"title_text": "Update Available"
});

instance_create_layer(x + width - 60, y + 20, "UI", obj_close, {"parent_component": title});

var check_label = instance_create_layer(x + 20, y + 95, "UI", obj_label, {
	"parent_component": id,
	"label_font": fnt_segoe,
	"label_text": "An update for Pisces is available. Would you like to go to the Pisces website?"
});

var open_website = method({"parent_component": id}, function() { 
		url_open("https://gamesfreaksa.info/pisces/index.html");
		close_top_component();
	});

var button = instance_create_layer(x + 20, y + 150, "UI", obj_button,
{
	"parent_component": id,
	"on_click": open_website,
	"button_text": "Open"
});
		
var button2 = instance_create_layer(button.x + button.image_xscale + 10, button.y, "UI", obj_button,
{
	"parent_component": id,
	"on_click": close_top_component,
	"button_text": "Cancel"
});

button2.x = x + width - button2.image_xscale - 10;
button.x = button2.x - button.image_xscale - 10;