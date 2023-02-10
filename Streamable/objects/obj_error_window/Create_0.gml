/// @description
event_inherited();

var title = instance_create_layer(x, y, "UI", obj_title_bar, 
{
	"parent_component": id, 
	"title_text": title_text
});

instance_create_layer(x + width - 60, y + 20, "UI", obj_close, {"parent_component": title});

var warning_img = instance_create_layer(x + 20, y + 95, "UI", obj_icon, {
	"parent_component": id,
	sprite_index: spr_warning,
	image_xscale: .2,
	image_yscale: .2
});

var check_label = instance_create_layer(warning_img.x + warning_img.sprite_width + 20, warning_img.y + warning_img.sprite_height / 2, "UI", obj_label, {
	"parent_component": id,
	"label_font": fnt_segoe,
	"label_text": error_text,
	"label_valign": fa_middle
});

var button = instance_create_layer(x + 20, y + 150, "UI", obj_button,
{
	"parent_component": id,
	"on_click": close_top_component,
	"button_text": "Ok"
});
		
button.x = x + width - button.image_xscale - 10;