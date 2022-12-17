/// @description Insert description here
// You can write your code in this editor
if not is_hovering and not (is_selected and not is_dragged) return;
if !keys_are_active() return;

clear_menus(self);

#macro EqualPlus 187
#macro Minus 189
#macro NumAdd 107
#macro NumSub 109

var _key = keyboard_lastkey;

//counters up or down
if _key == EqualPlus or _key == NumAdd {
	counters++;
} else if _key == Minus or _key == NumSub {
	counters = max(0, counters - 1);
}