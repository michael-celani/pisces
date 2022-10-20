/// @description Flip
if !is_hovering return;
if !keys_are_active() return;

clear_menus(self);
flip_card(self);