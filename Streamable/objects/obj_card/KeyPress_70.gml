/// @description Flip
if !is_hovering && !is_dragged return;
if !keys_are_active() return;

clear_menus(self);
flip_card(self);