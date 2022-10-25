/// @description

draw_color = button_inactive_color;

if (active)
{
	draw_color = button_active_color;
	
	var hovering = instance_position(mouse_x, mouse_y, self);
	
	if hovering
	{
		draw_color = button_hover_color;
		
		if mouse_check_button(mb_left)
		{
			draw_color = button_clicked_color;	
		}
	}
}





// Inherit the parent event
event_inherited();

