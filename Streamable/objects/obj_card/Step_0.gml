visible = !(bbox_left > room_width || bbox_right < 0 || bbox_bottom < 0 || bbox_top > room_height)

// Motion
var total_inertia = obj_options.default_inertia;
var total_scaling = obj_options.default_scaling;

if (is_dragged)
{
	total_inertia += obj_options.dragging_inertia;
	total_scaling += obj_options.dragging_scaling;
}

is_hovering = id == obj_selector.lowest_object and not is_dragged
is_zoomed = (is_hovering or is_dragged) and keyboard_check(vk_alt);

if (is_hovering)
{
	total_scaling += obj_options.hovering_scaling;	
	time_hovering = (time_hovering + 1) % 360
}
else
{
	time_hovering = 0
}

if parent_stack == obj_vertical_stack && !parent_stack.active
{
	total_inertia = 0	
}


if obj_options.since_last > 0
{
	x = approach_point(x, next_x, obj_options.since_last, total_inertia);
	y = approach_point(y, next_y, obj_options.since_last, total_inertia);
	x_vel = ((x - xprevious) + 3 * x_vel) / 4;
	y_vel = ((y - yprevious) + 3 * y_vel) / 4;
	skew_x = (3 * skew_x + degtorad(clamp(x_vel * 2, -30, 30))) / 4.0;
	skew_y = (3 * skew_y + degtorad(clamp(y_vel * 2, -30, 30))) / 4.0;	
}


// Scaling
if is_zoomed
{
	image_xscale = 0.6
	image_yscale = 0.6
}
else if (image_xscale = 0.6)
{
	image_xscale = total_scaling
	image_yscale = total_scaling
}
else
{
	image_xscale = approach_point(image_xscale, total_scaling, obj_options.since_last, 10);
	image_yscale = approach_point(image_yscale, total_scaling, obj_options.since_last, 10);
}

if (is_tapping) {
	is_tapping += delta_time
	var angle_percentage = smootherstep(0, obj_options.tap_length, is_tapping)
	
	if (!tapped) {
		image_angle = obj_options.tapped_angle * angle_percentage
		
		if (abs(image_angle) >= abs(obj_options.tapped_angle)) {
			is_tapping = false;
			tapped = true;
			image_angle = obj_options.tapped_angle;
		}
	}
	else {
		image_angle = obj_options.tapped_angle * (1 - angle_percentage)
		
		if (image_angle == 0) {
			is_tapping = false;
			tapped = false;
		}
	}
}