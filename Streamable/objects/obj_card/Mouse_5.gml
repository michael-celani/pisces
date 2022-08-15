/// @description 
if is_hovering and parent_stack == noone
{
	clear_all_menus();
	global.menu.CreateMenu(mouse_x + 15, mouse_y, self)	
}