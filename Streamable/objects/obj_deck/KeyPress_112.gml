/// @description Activate

if active {
	active = false;	
	keyboard_string = "";
}
else {
	///find if there is an active zone. if not, just set true. if so, swap visibility.
	if (!any_stack_active()){
		active = true;
	}
	else {
		///there is an active stack, swap with it
		with(obj_vertical_stack)
		{
			if(active){
				swap_stack_visibility(self,obj_deck);
			}
		}
	}
}
