/// @description Search

if !instance_exists(obj_search_request) {
	instance_create_layer(0, 0, "Instances", obj_search_request);
	keyboard_string = "";
}