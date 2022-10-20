/// @description Tap
if not is_hovering and not (is_selected and not is_dragged) return;
if !keys_are_active() return;
if parent_stack != noone return;

clear_menus(self);
tap_card(self);