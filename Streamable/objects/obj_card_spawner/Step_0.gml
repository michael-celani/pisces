// Motion
var total_inertia = obj_options.default_inertia;
var total_scaling = obj_options.default_scaling;

is_hovering = id == obj_selector.lowest_object

x = approach_point(x, next_x, obj_options.since_last, total_inertia);
y = approach_point(y, next_y, obj_options.since_last, total_inertia);
image_xscale = approach_point(image_xscale, total_scaling, obj_options.since_last, 10);
image_xscale = approach_point(image_yscale, total_scaling, obj_options.since_last, 10);

event_inherited();