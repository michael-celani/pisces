/// @description 
// You can write your code in this editor
if(!is_visible) return;
var _x_change = event_data[?"posX"] + drag_offset_x;
var _y_change = event_data[?"posY"] + drag_offset_y;

x = _x_change;
y = _y_change;

// move the mana objects as well
var _tmp = 0;
for(var _i = 0; _i < 6; _i ++){
	variable_instance_set(mana_instance_ids[_i], "x", _x_change + 38 + _tmp);
	variable_instance_set(mana_instance_ids[_i], "y", _y_change + 70);
	_tmp += 70;
}