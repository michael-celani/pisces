/// @description Insert description here
// You can write your code in this editor

var xChange = event_data[?"posX"] + drag_offsetX;
var yChange = event_data[?"posY"] + drag_offsetY;

x = xChange
y = yChange;

// move the mana objects as well
var tmp = 0;
for(var i = 0; i < 6; i ++){
	variable_instance_set(manaInstanceIDs[i], "x", xChange + 60 + tmp);
	variable_instance_set(manaInstanceIDs[i], "y", yChange + 96);
	tmp+= 60;
}