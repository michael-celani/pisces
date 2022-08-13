function remove_from_card_stack(card_inst) {
	
	if card_inst.parent_stack != noone {
		var index = ds_list_find_index(card_inst.parent_stack.stack_list, id)
		ds_list_delete(card_inst.parent_stack.stack_list, index);
		parent_stack = noone;
	}
	
}