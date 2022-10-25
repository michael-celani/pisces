/// @description
if not surface_exists(window_surface)
{
	window_surface = surface_create(width, height);
}
	
surface_set_target(window_surface);

// Draw components and subcomponents:
var component_queue = ds_queue_create();
ds_queue_enqueue(component_queue, self);

while ds_queue_size(component_queue) > 0
{
	var component = ds_queue_dequeue(component_queue);

	with (component)
	{
		event_perform(ev_other, ev_user15);	
	}

	var num_components = array_length(component.components);
	
	for (var i = 0; i < num_components; i++)
	{
		ds_queue_enqueue(component_queue, component.components[i]);	
	}
}

ds_queue_destroy(component_queue);
surface_reset_target();

var percentage = smoothstep(0, 20, alarm[0]);
var draw_y = y + percentage * 15;

draw_set_color(c_black);
draw_set_alpha(0.1);
draw_rectangle(x + 20, draw_y + 20, x + width + 20, draw_y + height + 20, false);
draw_set_alpha(1);
draw_set_color(c_white);


draw_set_alpha(1 - percentage);
draw_surface(window_surface, x, draw_y)
draw_set_alpha(1);