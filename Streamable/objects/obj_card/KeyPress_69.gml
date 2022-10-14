/// @description Put in Exile
if !is_hovering return;
if !keys_are_active() return;

clear_menus(self);
move_to_exile(self);

