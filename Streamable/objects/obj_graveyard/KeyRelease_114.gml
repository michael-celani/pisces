/// @description Activate

if active {
	active = false;
}
else {
	///find if there is an active zone. if not, just set true. if so, swap visibility.
	var active_stack = find_active_stack();

	if (active_stack == noone){
		active = true;
	}
	else if (active_stack != self) {
		swap_stack_visibility(self, active_stack);
	}
}
