/// @description
if !keys_are_active() return;

var pressed_key = string(keyboard_lastkey);
show_debug_message("pressed_key: " + pressed_key + " -- misc: " + chr(vk_EqualPlus) + chr(vk_numpad0) + chr(vk_numpad9))

// Key is 0-9:
var lc = ord(keyboard_lastchar)

if lc >= 48 && lc <= 57
{
	num_repeats *= 10;
	num_repeats += lc - 48;
	return;
}
/*
for (var i = 0; i < 10; ++i) {
	if (keyboard_lastchar == i)
	{
		num_repeats *= 10;
		num_repeats += i;
		return;
	}
}
*/

var num_times = max(1,  min(100, num_repeats));
num_repeats = 0;

// Find the event:
var event_def = events[$ pressed_key];
if event_def == undefined return;

// Set the number of repeats:
if !event_def.ev_repeats num_times = 1;

// Find the subscribers:
var subscribers = find_message_subscribers(event_def.ev_name);

for (var i = 0; i < array_length(subscribers); i++)
{
	repeat (num_times)
	{
		with (subscribers[i].obj) {
			event_user(subscribers[i].ev);
		}
	}
}