/// @description Create options window
event_inherited();

var title = instance_create_layer(x, y, "UI", obj_title_bar, {"parent_component": id});
var close = instance_create_layer(x + width - 60, y + 20, "UI", obj_close, {"parent_component": title});

var check_label = instance_create_layer(x + 20, y + 95, "UI", obj_label, {
	"parent_component": id,
	"label_font": fnt_beleren,
	"label_text": "Card Size:"
});
	
var button = instance_create_layer(x + 20, y + 150, "UI", obj_button,
{
	"parent_component": id,
	"active": camera_exists(),
	"on_click": toggle_camera_mirroring,
	"button_text": "Toggle Camera Mirroring"
});
		
var button2 = instance_create_layer(button.x + button.image_xscale + 10, button.y, "UI", obj_button,
{
	"parent_component": id,
	"on_click": function() { load_background(obj_options) },
	"button_text": "Load Background"
});
	
var slider = instance_create_layer(x + width - 740, y + 115, "UI", obj_slider, 
{ 
	"parent_component": id,
	"value_low": 0.25,
	"value_high": 0.5,
	"value": obj_options.default_scaling,
	"on_drag": function(new_value) { obj_options.default_scaling = new_value; }
});

var checkbox = instance_create_layer(button2.x + button2.image_xscale + 10, button.y,"UI",obj_checkbox,
{
	"parent_component": id,
	"checked": obj_options.draw_on_turn,
	"on_click": function() { toggle_draw_on_turn(obj_options)}
});

var check_label2 = instance_create_layer(checkbox.x + checkbox.image_xscale+10,checkbox.y,"UI", obj_label, {
	"parent_component": id,
	"label_font": fnt_beleren,
	"label_text": "Toggle 'Draw On Turn'"
});