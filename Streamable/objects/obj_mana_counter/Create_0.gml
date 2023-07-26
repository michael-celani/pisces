/// @description Insert description here
event_inherited();

dragging = false;

var mana_sprites = [spr_w, spr_u, spr_b, spr_r, spr_g, spr_c]

for (var i = 0; i < array_length(mana_sprites); i++)
{
	var x_loc = 40 + 60 * i;
	
	var mana_label = instance_create_layer (x + x_loc, y + 150, "UI", obj_label,
	{
		"parent_component": id,
		"label_font": fnt_beleren,
		"label_text": "0",
		"label_halign": fa_middle,
		"label_valign": fa_center
	});

	var mana_up = instance_create_layer(x + x_loc, y + 30, "UI", obj_mana_arrow,
	{
		"parent_component": id,
		"on_click": method({"mana_label": mana_label}, function() 
		{ 
			mana_label.label_text = string(int64(mana_label.label_text) + 1)
		})
	});

	var mana = instance_create_layer(x + x_loc, y + 70, "UI", obj_mana,
	{
		"parent_component": id,
		"on_click": method({"mana_label": mana_label}, function() 
		{ 
			if keyboard_check(vk_shift)
			{
				mana_label.label_text = string(max(0, int64(mana_label.label_text) - 1))
			}
			else
			{
				mana_label.label_text = string(int64(mana_label.label_text) + 1)
			}
		}),
		"sprite_index": mana_sprites[i]
	});

	var mana_down = instance_create_layer(x + x_loc, y + 110, "UI", obj_mana_arrow,
	{
		"parent_component": id,
		"image_angle": 180,
		"on_click": method({"mana_label": mana_label}, function() 
		{ 
			mana_label.label_text = string(max(0, int64(mana_label.label_text) - 1))
		})
	});
}


