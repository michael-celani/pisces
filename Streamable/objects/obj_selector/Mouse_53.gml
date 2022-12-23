/// @description
if lowest_object != noone {
	if lowest_object.object_index == obj_card && keyboard_check(vk_control) {
		lowest_object.is_selected = true;
	}
	return;
}
if keyboard_check(vk_control) return;
with (obj_card) is_selected = false;