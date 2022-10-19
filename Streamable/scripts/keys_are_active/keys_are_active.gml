// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function keys_are_active() {
	return !instance_exists(obj_search_request) && !instance_exists(obj_window);
}