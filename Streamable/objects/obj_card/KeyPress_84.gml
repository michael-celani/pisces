/// @description Tap
if !is_hovering and (!is_selected || is_dragged) return;
if !keys_are_active() return;
if parent_stack != noone return;

clear_menus(self);
tap_card(self);

//for deselect after tap
//is_selected = false;