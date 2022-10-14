/// @description Destroy
if !is_hovering return;
if !keys_are_active() return;

clear_menus();
instance_destroy();