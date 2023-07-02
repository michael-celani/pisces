/// @description draw options
image_alpha = 0.5;
draw_self();
for(var i = 0; i < 6; i++){
	variable_instance_set(manaInstanceIDs[i], "visible", isVisible);
}