/// @description Hovered
if clearing return;

var prev_hovered = hovered;
bounding_x_start = x;
bounding_x_end = x + width + padding + padding;
bounding_y_start = y + padding;
bounding_y_end = y + padding + height;
is_in = false;

for (var i = offset; i < min(offset+draw_options, array_length(options)); i++)
{
	if array_contains(dividers, i)
	{
		bounding_y_start += divider_height;
		bounding_y_end += divider_height;
	}
	
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
			options[hovered].onhover(owner, self)
			
			if prev_hovered != -1 {
				options[prev_hovered].onunhover()
			}
		}

		break;
	}
		
	bounding_y_start += height;
	bounding_y_end += height;
}

if is_in
{
	offset = clamp(offset - mouse_wheel_up() + mouse_wheel_down(), 0, array_length(options) - draw_options);
}

if mouse_check_button_released(mb_left)
{
	if (hovered == -1 or not is_in)
	{
		alarm[0] = 30;
		clearing = true;
	}
	else
	{
		options[hovered].Perform(owner, self);
		click_option = hovered;
		click_point_x = mouse_x - bounding_x_start;
		click_point_y = mouse_y - bounding_y_start;
	}
}

scroll_alpha = mean(scroll_alpha, scroll_alpha, is_in);