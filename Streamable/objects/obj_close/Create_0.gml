/// @description Insert description here
on_click = function() {
	var component = parent_component;
	
	while (component.parent_component != noone)
	{
		component = component.parent_component;	
	}
	
	instance_destroy(component);
}

image_xscale = 40;
image_yscale = 40;

event_inherited();