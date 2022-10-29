/// @description Draw Options


var bounding_x_start = 0;
var bounding_x_end = width; 
var bounding_y_start = 0;
var bounding_y_end = height;
var num_options = array_length(options);
var radius = 15;
var pressing = mouse_check_button(mb_left);
draw_set_font(fnt_segoe);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

// Draw the menu edges:
bounding_y_start += padding;
bounding_y_end += padding;

if !surface_exists(draw_surf)
{
	draw_surf = surface_create(image_xscale, image_yscale);
}

surface_set_target(draw_surf);
draw_clear_alpha(c_white, 0);
var num_dividers = 0;
for (var i = offset; i < min(offset+draw_options, array_length(options)); i++)
{
	var middle_y = mean(bounding_y_start, bounding_y_end);
	
	if array_contains(dividers, i)
	{
		var divider_y = bounding_y_start + divider_height / 2;
		draw_set_color(divider_color);
		draw_rectangle(bounding_x_start + padding, divider_y, bounding_x_end + padding, divider_y, false);
		bounding_y_start += divider_height;
		bounding_y_end += divider_height;
		middle_y = mean(bounding_y_start, bounding_y_end);
		num_dividers++;
	}
	
	var option = options[i];
	
	
	if hovered == i
	{
		draw_set_color(hover_color);
		draw_rectangle(bounding_x_start + 1, bounding_y_start, bounding_x_end + 2 * padding - 1, bounding_y_end, false);
	}
	
	if click_option == i
	{
		if !surface_exists(option_surf) {
			option_surf = surface_create(width + 2 * padding, height);
		}
		
		surface_set_target(option_surf);
		draw_set_color(click_color);
		draw_circle(click_point_x, click_point_y, 300 - 10 * alarm[0], false);
		surface_reset_target();
		
		draw_surface(option_surf, bounding_x_start + 1, bounding_y_start);
	}
	
	draw_sprite_stretched_ext(option.icon, 0, bounding_x_start + padding, middle_y - 20, 40, 40, option.draw_color, 1);

	draw_set_alpha(0.25);
	draw_set_color(c_black);
	draw_text(bounding_x_start + padding + 60 + 2, middle_y + 2, option.name);

	if pressing and hovered == i and is_in and not clearing {
		draw_set_color(c_gray);
	}
	else
	{
		draw_set_color(option.draw_color);
	}
	
	draw_set_alpha(1);
	draw_text(bounding_x_start + padding + 60, middle_y, option.name);

	bounding_y_start += height;
	bounding_y_end += height;
}


surface_reset_target();

var percentage = smootherstep(15, 0, alarm[0])
var alpha = percentage;
if (clearing) {
	alpha = 1 - alpha;
	percentage = 1;
}

draw_set_alpha(alpha);
draw_set_color(menu_color);

var menu_width = (width + 2.0 * padding) * percentage;
var menu_height = (height * draw_options + 2.0 * padding + divider_height * array_length(dividers)) * percentage

draw_roundrect_ext(
	x, 
	y + y_padding, 
	x + menu_width, 
	y + menu_height, 
	radius, radius, false);
	
draw_surface_stretched(draw_surf, x, y, image_xscale * percentage, image_yscale * percentage);

// Draw scrollbar
if draw_options < array_length(options) and is_in and not clearing
{
	draw_set_color(c_gray);
	draw_set_alpha(scroll_alpha * percentage / 3);
	var options_percentage = draw_options / array_length(options)
	
	var scroll_x1 = menu_width - 1;
	var scroll_x2 = menu_width - 6;
	var scroll_y1 = (menu_height - menu_height * options_percentage) * offset / (array_length(options) - draw_options);
	var scroll_y2 = scroll_y1 + options_percentage * menu_height;
	draw_roundrect(x + scroll_x1, y + scroll_y1, x + scroll_x2, y + scroll_y2, false);
}

draw_set_alpha(1);
