function add_to_card_stack(card_inst, stack_inst) {
	remove_from_card_stack(card_inst);
	
	card_inst.parent_stack = stack_inst;
	card_inst.is_revealed = stack_inst.hidden_zone;
	ds_list_add(stack_inst.stack_list, card_inst.id);
	
	// Untap the card:
	card_inst.is_tapping = false;
	card_inst.tapped = false;
	card_inst.image_angle = 0;
	card_inst.depth = 0;
}

function add_to_card_stack_beginning(card_inst, stack_inst) {
	remove_from_card_stack(card_inst);
	
	card_inst.parent_stack = stack_inst;
	card_inst.is_revealed = stack_inst.hidden_zone;
	ds_list_insert(stack_inst.stack_list, 0, card_inst.id);
	
	// Untap the card:
	card_inst.is_tapping = false;
	card_inst.tapped = false;
	card_inst.image_angle = 0;
	card_inst.depth = 0;
}