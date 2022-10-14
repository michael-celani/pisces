/// @description Hovered
animation = (animation * 2 + 1) / 3
var prev_hovered = hovered;
bounding_x_start = x;
bounding_x_end = x + width + padding + padding;
bounding_y_start = y + padding;
bounding_y_end = y + padding + height;
is_in = false;

for (var i = 0; i < ds_list_size(options); i++)
{
	is_in = point_in_rectangle(
		mouse_x, 
		mouse_y, 
		bounding_x_start, 
		bounding_y_start, 
		bounding_x_end, 
		bounding_y_end);
		
	if (is_in) {
		hovered = i;
		
		if (i != prev_hovered)
		{
			options[| hovered].onhover(owner, self)
			
			if prev_hovered != -1 {
				options[| prev_hovered].onunhover()
			}
		}

		break;
	}
		
	bounding_y_start += height;
	bounding_y_end += height;
}



if (mouse_check_button_released(mb_left))
{
	if (hovered == -1 || !is_in)
	{
		instance_destroy();	
	}
	else
	{
		options[| hovered].Perform(owner, self)
	}
}