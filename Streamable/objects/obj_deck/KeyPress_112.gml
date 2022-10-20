/// @description Activate

if active {
	active = false;	
	keyboard_string = "";
}
else {
	var active_stack = find_active_stack();
	
	if (active_stack == noone){
		active = true;
	}
	else if (active_stack != self) {
		swap_stack_visibility(self, active_stack);
	}
}
