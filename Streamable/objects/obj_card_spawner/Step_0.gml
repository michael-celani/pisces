// Motion
var total_inertia = obj_options.default_inertia;
var total_scaling = obj_options.default_scaling;

is_hovering = id == obj_selector.lowest_object

x = (total_inertia * x + next_x) / (total_inertia + 1.0);
y = (total_inertia * y + next_y) / (total_inertia + 1.0);

// Scaling
image_xscale = (10.0 * image_xscale + total_scaling) / 11.0;
image_yscale = (10.0 * image_yscale + total_scaling) / 11.0;

event_inherited();