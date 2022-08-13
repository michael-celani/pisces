/// @description Activate

if active {
	active = false;	
	keyboard_string = "";
}
else {
	active = !any_stack_active();
}
