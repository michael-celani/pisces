/// @description Insert description here
// You can write your code in this editor
isVisible = !isVisible
visible = isVisible;

for(var i = 0; i < 6; i++){
	variable_instance_set(manaInstanceIDs[i], "visible", isVisible);	
}