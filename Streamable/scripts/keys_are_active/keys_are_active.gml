// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function keys_are_active() {
	with (obj_text_field)
	{
		if focused return false;	
	}
	if instance_exists(obj_card_annotation) return false;
	
	return true;
}