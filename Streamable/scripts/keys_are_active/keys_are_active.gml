// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function keys_are_active() {
	if text_is_focused() return false;
	if deck_is_searching() return false;
	return true;
}

function text_is_focused()
{
	with (obj_text_field)
	{
		if focused return true;	
	}
	
	return false;	
}

function deck_is_searching()
{
	with (obj_vertical_stack)
	{
		if searching return true;	
	}
	
	return false;
}
