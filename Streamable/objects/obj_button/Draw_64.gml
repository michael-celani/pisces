/// @description Insert description here
var color = button_inactive_color;

if (active)
{
	color = button_active_color;
	
	var hovering = instance_position(mouse_x, mouse_y, self);
	
	if (hovering)
	{
		color = button_hover_color;
		
		if (mouse_check_button(mb_left))
		{
			color = button_clicked_color;	
		}
	}

}
draw_set_color(color)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
draw_set_color(button_outline_color)
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
draw_rectangle(bbox_left + 2, bbox_top + 2, bbox_right - 2, bbox_bottom - 2, true);
draw_set_color(c_white);

draw_set_font(button_font);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text((bbox_left + bbox_right) / 2, (bbox_top + bbox_bottom) / 2, button_text);
