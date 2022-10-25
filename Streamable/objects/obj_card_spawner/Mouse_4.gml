/// @description Dragging
if !is_hovering return;

var new_card = instance_create_layer(x, y, "Dragging", obj_card, 
{ 
	"name": name, 
	sprite_index: front_sprite, 
	"front_sprite": front_sprite, 
	"back_sprite": back_sprite,
	"all_parts": all_parts,
	"is_revealed": false,
	"is_dragged": true,
	"next_x": mouse_x,
	"next_y": mouse_y
});	