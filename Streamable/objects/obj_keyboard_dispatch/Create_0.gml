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
}

events = {};
events[$ string(ord("D"))] = draw_event;
events[$ string(ord("M"))] = mill_event;
events[$ string(ord("R"))] = scry_event;
events[$ string(ord("Q"))] = coalesce_event;