/// @description Insert description here
if !is_hovering return;
if !keys_are_active() return;

clear_menus();
counters = max(0, counters - 1);