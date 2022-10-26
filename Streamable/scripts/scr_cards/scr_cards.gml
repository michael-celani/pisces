// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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
	
	if card_inst.is_flipped {
		card_inst.sprite_index = card_inst.back_sprite;
	} else {
		card_inst.sprite_index = card_inst.front_sprite;
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
		"is_revealed": card_inst.is_revealed,
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
	add_to_card_stack(card_inst, obj_graveyard);
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
	remove_from_card_stack(card_inst);
	
	card_inst.parent_stack = stack_inst;
	card_inst.is_revealed = stack_inst.hidden_zone;
	ds_list_add(stack_inst.stack_list, card_inst.id);
	
	// Untap the card:
	card_inst.is_tapping = false;
	card_inst.tapped = false;
	card_inst.image_angle = 0;
	layer_add_instance(stack_inst.zone_layer, card_inst);
	obj_height_manager.height_modified = true;
	
	card_inst.is_selected = false;
}

function add_to_card_stack_beginning(card_inst, stack_inst) {
	add_to_card_stack_location(card_inst, stack_inst, 0);
}

function add_to_card_stack_location(card_inst, stack_inst, pos)
{
	remove_from_card_stack(card_inst);
	
	card_inst.parent_stack = stack_inst;
	card_inst.is_revealed = stack_inst.hidden_zone;
	ds_list_insert(stack_inst.stack_list, pos, card_inst.id);
	
	// Untap the card:
	card_inst.is_tapping = false;
	card_inst.tapped = false;
	card_inst.image_angle = 0;
	layer_add_instance(stack_inst.zone_layer, card_inst);
	obj_height_manager.height_modified = true;
	
	card_inst.is_selected = false;
}

function remove_from_card_stack(card_inst) {
	if card_inst.parent_stack != noone {
		var index = ds_list_find_index(card_inst.parent_stack.stack_list, id)
		ds_list_delete(card_inst.parent_stack.stack_list, index);
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
		instance_destroy();	
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
			
		instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_card_annotation);
		obj_card_annotation.affiliated_card = card_inst;
		keyboard_string = card_inst.note_content;
}