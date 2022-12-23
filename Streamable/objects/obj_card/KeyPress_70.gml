/// @description Flip
show_debug_message("cardid: " + string(id) + " - is_hovering: " + string(is_hovering) + " - is_selected:" + string(is_selected));
if !is_hovering && !is_selected return;
if !keys_are_active() return;

clear_menus(self);

if keyboard_check(vk_shift) {
	toggle_upsidedown_card(self);
} else {
	flip_card(self);
}