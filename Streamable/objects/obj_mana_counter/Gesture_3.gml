/// @description Insert description here
// You can write your code in this editor

var _x_change = event_data[?"posX"] + drag_offset_x;
var _y_change = event_data[?"posY"] + drag_offset_y;

x = _x_change;
y = _y_change;

// move the mana objects as well
var _tmp = 0;
for(var _i = 0; _i < 6; _i ++){
	variable_instance_set(mana_instance_ids[_i], "x", _x_change + 60 + _tmp);
	variable_instance_set(mana_instance_ids[_i], "y", _y_change + 96);
	_tmp += 60;
}