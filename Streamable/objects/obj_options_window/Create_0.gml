/// @description Create options window
event_inherited();

var title = instance_create_layer(x, y, "UI", obj_title_bar, {"parent_component": id});
var close = instance_create_layer(x + width - 60, y + 20, "UI", obj_close, {"parent_component": title});

var ylevel = 95;
var yldiff = 70;

var check_label = instance_create_layer(x + 20, y + ylevel, "UI", obj_label, {
	"parent_component": id,
	"label_font": fnt_beleren,
	"label_text": "Card Size:"
});

var slider = instance_create_layer(x + 230, y + ylevel + 20, "UI", obj_slider, 
{ 
	"parent_component": id,
	"value_low": 0.15,
	"value_high": 0.5,
	"value": obj_options.default_scaling,
	"on_drag": function(new_value) { obj_options.default_scaling = new_value; }
});

ylevel += yldiff;
var checkboxDraw = instance_create_layer(x + 20, y + ylevel, "UI", obj_checkbox,
{
	"parent_component": id,
	"checked": obj_options.draw_on_turn,
	"on_click": function() { toggle_draw_on_turn(obj_options) }
});

var check_labelDraw = instance_create_layer(
	checkboxDraw.x + checkboxDraw.image_xscale + 10,
	checkboxDraw.y + checkboxDraw.image_yscale / 2,
	"UI",
	obj_label,
	{
		"parent_component": id,
		"label_font": fnt_beleren,
		"label_text": "Draw a card when starting a new turn",
		"label_valign": fa_center
	}
);

ylevel += yldiff;
var checkboxTapDeselect = instance_create_layer(x + 20, y + ylevel, "UI", obj_checkbox,
{
	"parent_component": id,
	"checked": obj_options.deselect_after_tap,
	"on_click": function() { toggle_deselect_after_tap(obj_options) }
});

var labelTapDeselect = instance_create_layer(
	checkboxTapDeselect.x + checkboxTapDeselect.image_xscale + 10,
	checkboxTapDeselect.y + checkboxTapDeselect.image_yscale / 2,
	"UI",
	obj_label,
	{
		"parent_component": id,
		"label_font": fnt_beleren,
		"label_text": "Deselect cards after Tap/Untap",
		"label_valign": fa_center
	}
);

ylevel += yldiff;
var checkboxDragEndDeselect = instance_create_layer(x + 20, y + ylevel, "UI", obj_checkbox,
{
	"parent_component": id,
	"checked": obj_options.deselect_after_drag,
	"on_click": function() { toggle_deselect_after_drag(obj_options) }
});

var labelTapDeselect = instance_create_layer(
	checkboxDragEndDeselect.x + checkboxDragEndDeselect.image_xscale + 10,
	checkboxDragEndDeselect.y + checkboxDragEndDeselect.image_yscale / 2,
	"UI",
	obj_label,
	{
		"parent_component": id,
		"label_font": fnt_beleren,
		"label_text": "Deselect cards after dragging",
		"label_valign": fa_center
	}
);

ylevel += yldiff;
var buttonCamToggle = instance_create_layer(x + 20, y + ylevel, "UI", obj_button,
{
	"parent_component": id,
	"active": camera_exists(),
	"on_click": toggle_camera_mirroring,
	//"button_text": "Toggle Camera Mirroring",
	"get_button_text": function () { return "Turn Camera Mirroring " + (camera_mirroring_enabled() ? "OFF" : "ON"); }
});

ylevel += yldiff;
var buttonLoadBG = instance_create_layer(x + 20, y + ylevel, "UI", obj_button,
{
	"parent_component": id,
	"on_click": function() { load_background(obj_options) },
	"button_text": "Load Background"
});

var buttonLoadSleeves = instance_create_layer(buttonLoadBG.x + buttonLoadBG.image_xscale + 20, buttonLoadBG.y, "UI", obj_button,
{
	"parent_component": id,
	"on_click": function() { load_sleeves(obj_options) },
	"button_text": "Load Sleeves"
});