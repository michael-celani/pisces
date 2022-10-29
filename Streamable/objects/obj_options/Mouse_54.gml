/// @description 
if !position_empty(mouse_x, mouse_y) return;

clear_all_menus();
menu.CreateMenu(mouse_x + 15, mouse_y, self)	
