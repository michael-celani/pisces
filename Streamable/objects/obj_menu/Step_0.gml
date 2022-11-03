/// @description Hovered
if clearing return;

var prev_hovered = hovered;
bounding_x_start = x;
bounding_x_end = x + width + padding + padding;
bounding_y_start = y + padding - offset;
bounding_y_end = y + padding + height - offset;

is_in = point_in_rectangle(
	mouse_x, 
	mouse_y, 
	bbox_left, 
	bbox_top, 
	bbox_right, 
	bbox_bottom)

for (var i = 0; i < array_length(options); i++)
{
	if array_contains(dividers, i)
	{
		bounding_y_start += divider_height;
		bounding_y_end += divider_height;
	}
	
	var in_rect = point_in_rectangle(
		mouse_x, 
		mouse_y, 
		bounding_x_start, 
		bounding_y_start, 
		bounding_x_end, 
		bounding_y_end) and is_in;
		
	if (in_rect) {
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
	next_offset = next_offset - mouse_wheel_up() * height + mouse_wheel_down() * height;
	next_offset = clamp(next_offset, 0, surf_height - image_yscale);
}

offset = floor(mean(offset, offset, offset, offset, next_offset));

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