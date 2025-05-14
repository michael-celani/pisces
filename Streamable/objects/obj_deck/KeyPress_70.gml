/// @description Insert description here
// You can write your code in this editor
if (!active)
{
	if !keyboard_check(vk_control) return;
	if !keys_are_active() return;
	if find_active_stack() != noone return;
	active = true;
}

// Inherit the parent event
event_inherited();

