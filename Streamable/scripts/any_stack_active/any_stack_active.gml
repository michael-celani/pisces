// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function any_stack_active(){
	with (obj_vertical_stack) {
		if (active) {
			return true;	
		}
	}
	
	return false;
}

function find_active_stack() {
	with (obj_vertical_stack)
	{
		if (active) return self;	
	}
	
	return noone;
}