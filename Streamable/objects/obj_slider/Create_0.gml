/// @description Insert description here
x_start = x;
dragging = false;

var curr_per = (value - value_low) / (value_high - value_low)
x = lerp(x_start, x_start + width, curr_per);

// Inherit the parent event
event_inherited();