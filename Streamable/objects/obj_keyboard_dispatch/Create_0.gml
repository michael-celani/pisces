/// @description Insert description here
// You can write your code in this editor

var draw_event = {
	"ev_name": "draw",
	"ev_repeats": true
};

var mill_event = {
	"ev_name": "mill",
	"ev_repeats": true
};

var scry_event = {
	"ev_name": "scry",
	"ev_repeats": true
};

var coalesce_event = {
	"ev_name": "coalesce",
	"ev_repeats": false
};

var counter_increment_event = {
	"ev_name": "counter_increment",
	"ev_repeats": true
};

var counter_decrement_event = {
	"ev_name": "counter_decrement",
	"ev_repeats": true
};

#macro vk_EqualPlus 187
#macro vk_Minus 189

events = {};
events[$ string(ord("D"))] = draw_event;
events[$ string(ord("M"))] = mill_event;
events[$ string(ord("R"))] = scry_event;
events[$ string(ord("Q"))] = coalesce_event;
events[$ string(vk_add)] = counter_increment_event;
events[$ string(vk_EqualPlus)] = counter_increment_event;
events[$ string(vk_subtract)] = counter_decrement_event;
events[$ string(vk_Minus)] = counter_decrement_event;
