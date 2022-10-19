if !dragging return;

var delta_x = event_data[? "diffX"];
var curr_per = (x + delta_x - x_start) / (width)
curr_per = clamp(curr_per, 0, 1);

value = lerp(value_low, value_high, curr_per);
x = lerp(x_start, x_start + width, curr_per);

on_drag(value);