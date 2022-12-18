/// @description Flip
if !is_hovering return;
if !keys_are_active() return;

clear_menus(self);

if keyboard_check(vk_shift) {
	kamiflip_card(self);
} else {
	flip_card(self);
}