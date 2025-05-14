/// @description 
if obj_selector.lowest_object != noone and obj_selector.lowest_object.object_index == obj_menu return;
if !keyboard_check(vk_control) return;

default_scaling = clamp(default_scaling + 0.02, 0.15, 0.5);