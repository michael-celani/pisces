/// @description Insert description here
// You can write your code in this editor
if not is_hovering and not (is_selected and not is_dragged) return;
if !keys_are_active() return;

clear_menus(self);

// can't use ord() or vk_* for Equal/Plus or Minus buttons
#macro vk_EqualPlus 187
#macro vk_Minus 189

var _key = keyboard_lastkey;

//counters up or down
if _key == vk_EqualPlus or _key == vk_add {
	counters++;
} else if _key == vk_Minus or _key == vk_subtract {
	counters = max(0, counters - 1);
}