/// @description
if not is_hovering return;

clear_all_menus();

if parent_stack == noone
{
	my_menu.CreateMenu(mouse_x + 15, mouse_y, self);
}
else if parent_stack == obj_scry
{
	my_submenu.CreateMenu(mouse_x + 15, mouse_y, self);	
}