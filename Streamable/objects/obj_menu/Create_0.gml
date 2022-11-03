/// @description Set bounding box
draw_options = min(6, array_length(options));
image_xscale = width + 2 * padding;
image_yscale = height * draw_options + 2 * padding + divider_height * array_length(dividers);
surf_height = height * array_length(options) + 2 * padding + divider_height * array_length(dividers);
image_alpha = 0;

if (x + image_xscale) > room_width
{
	x = room_width - image_xscale;	
}


if (y + image_yscale) > room_height
{
	y = room_height - image_yscale;	
}

bounding_x_start = x;
bounding_x_end = x + width + padding + padding;
bounding_y_start = y + padding;
bounding_y_end = y + padding + height;

draw_surf = surface_create(image_xscale, surf_height);
option_surf = surface_create(width + 2 * padding, height);
alarm[0] = 20;
offset = 0;
next_offset = 0;
scroll_alpha = 0;

click_option = -1;
click_point_x = 0;
click_point_y = 0;