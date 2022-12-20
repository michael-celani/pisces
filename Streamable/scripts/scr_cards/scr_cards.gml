// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_card_counters(card_inst, num = 1) {
	card_inst.counters += num;
}

function sub_card_counters(card_inst, num = 1) {
	card_inst.counters = max(0, card_inst.counters - num)
}

function tap_card(card_inst) 
{
	if (!card_inst.is_tapping)
	{
		card_inst.is_tapping = true;	
	}
	else
	{
		card_inst.tapped = !card_inst.tapped;
		card_inst.is_tapping = obj_options.tap_length - card_inst.is_tapping
	}
}

function flip_card(card_inst)
{
	card_inst.is_flipped = !card_inst.is_flipped;
}

function toggle_upsidedown_card(card_inst) {
	if (card_inst.front_sprite_upsidedown == -1) {
		get_or_create_upsidedown_sprites(card_inst)
	}
	
	card_inst.is_upsidedown = !card_inst.is_upsidedown;
}

function get_or_create_upsidedown_sprites(card_inst) {
	with (obj_card) {
		if (id != card_inst.id) {
			if (front_sprite == card_inst.front_sprite && front_sprite_upsidedown != -1) {
				show_debug_message("found sprite " + string(front_sprite_upsidedown) +
					" from search " + string(card_inst.front_sprite));
				show_debug_message("found sprite " + string(back_sprite_upsidedown) +
					" from search " + string(card_inst.back_sprite));
				card_inst.front_sprite_upsidedown = front_sprite_upsidedown;
				card_inst.back_sprite_upsidedown = back_sprite_upsidedown;
				return;
			}
		}
	}
	
	card_inst.front_sprite_upsidedown = create_upsidedown_sprite(card_inst.front_sprite);
	card_inst.back_sprite_upsidedown = create_upsidedown_sprite(card_inst.back_sprite);
}

function create_upsidedown_sprite(spr) {
	if !sprite_exists(spr) return -1;
	
	var w = sprite_get_width(spr);
	var h = sprite_get_height(spr);
	var temp_surf = surface_create(w, h);
	surface_set_target(temp_surf);
	// these coordinates do a 180 degree turn
	draw_sprite_pos(spr, 0, w, h, 0, h, 0, 0, w, 0, 1);
	surface_reset_target();
	var new_sprite = sprite_create_from_surface(temp_surf, 0, 0, w, h, false, true, w / 2, h / 2);
	surface_free(temp_surf);
	show_debug_message("created new sprite " + string(new_sprite) + " from orig " + string(spr));
	return new_sprite;
}

function get_card_sprite(card_inst)
{
	if card_inst.is_flipped
	{
		if card_inst.back_sprite == -1
		{
			return card_inst.is_upsidedown
				? obj_options.card_back_sprite_upsidedown
				: obj_options.card_back_sprite;
		}
		
		return card_inst.is_upsidedown
			? card_inst.back_sprite_upsidedown
			: card_inst.back_sprite;
	}
	else
	{
		return card_inst.is_upsidedown
			? card_inst.front_sprite_upsidedown
			: card_inst.front_sprite;
	}
}

function duplicate_card(card_inst)
{
	instance_create_layer(card_inst.x + card_inst.sprite_width / 9, card_inst.y + card_inst.sprite_height / 9, "Battlefield", obj_card, 
	{ 
		"name": card_inst.name, 
		sprite_index: card_inst.front_sprite, 
		"front_sprite": card_inst.front_sprite, 
		"back_sprite": card_inst.back_sprite,
		"front_sprite_upsidedown": card_inst.front_sprite_upsidedown,
		"back_sprite_upsidedown": card_inst.back_sprite_upsidedown,
		"is_upsidedown": card_inst.is_upsidedown,
		"is_revealed": card_inst.is_revealed,
		"is_flipped": card_inst.is_flipped,
		"all_parts": card_inst.all_parts
	});
}

function create_spawner(card_inst)
{
	instance_create_layer(card_inst.sprite_width / 2, card_inst.sprite_height / 2, "LowUI", obj_card_spawner, 
	{ 
		"name": card_inst.name, 
		sprite_index: card_inst.front_sprite, 
		"front_sprite": card_inst.front_sprite, 
		"back_sprite": card_inst.back_sprite,
		"all_parts": card_inst.all_parts
	});
}

function move_to_deck_top(card_inst)
{
	add_to_card_stack_beginning(card_inst, obj_deck);	
}

function move_to_deck_bottom(card_inst)
{
	add_to_card_stack(card_inst, obj_deck);
}

function move_to_hand(card_inst)
{
	add_to_card_stack(card_inst, obj_hand);
}

function move_to_graveyard(card_inst)
{
	add_to_card_stack_beginning(card_inst, obj_graveyard);
}

function move_to_exile(card_inst)
{
	add_to_card_stack(card_inst, obj_exile);
}

function move_to_command(card_inst)
{
	add_to_card_stack(card_inst, obj_command);
}

function add_to_card_stack(card_inst, stack_inst) {
	add_to_card_stack_location(card_inst, stack_inst, array_length(stack_inst.stack_list))
}

function add_to_card_stack_beginning(card_inst, stack_inst) {
	add_to_card_stack_location(card_inst, stack_inst, 0);
}

function add_to_card_stack_location(card_inst, stack_inst, pos)
{
	remove_from_card_stack(card_inst);
	
	card_inst.parent_stack = stack_inst;
	card_inst.is_revealed = stack_inst.hidden_zone;
	array_insert(stack_inst.stack_list, pos, card_inst.id);
	
	// Untap the card:
	card_inst.is_tapping = false;
	card_inst.tapped = false;
	card_inst.image_angle = 0;
	
	// other things to reset:
	card_inst.is_upsidedown = false;
	if stack_inst.hidden_zone {
		card_inst.counters = 0;
	}
	
	layer_add_instance(stack_inst.zone_layer, card_inst);
	obj_height_manager.height_modified = true;
	
	card_inst.is_selected = false;
}

function remove_from_card_stack(card_inst) {
	if card_inst.parent_stack != noone {
		var index = array_find_indexEx(card_inst.parent_stack.stack_list, card_inst.id);
		array_delete(card_inst.parent_stack.stack_list, index, 1);
		parent_stack = noone;
		
		layer_add_instance("Battlefield", card_inst);
		obj_height_manager.height_modified = true;
		
		card_inst.is_selected = false;
	}
}

function clear_all_menus()
{
	with (obj_menu)
	{
		clearing = true;
		ticker = 30;
	}
}

function clear_menus(card_inst)
{
	with (obj_menu)
	{
		if owner == card_inst {
			instance_destroy();	
		}
	}
}


function update_note(card_inst)
{
	if instance_exists(obj_card_annotation) return;
			
	instance_create_layer(card_inst.x, card_inst.y, "UI", obj_card_annotation, {"card": card_inst});
}

function card_destroy(card_inst)
{
	if card_inst.save_struct == undefined
	{
		instance_destroy(card_inst);
		return;
	}

	card_inst.save_struct.destroyed = true;
	
	remove_from_card_stack(card_inst);
	next_x = -10000;
	next_y = -10000;
	x = next_x;
	y = next_y;
}