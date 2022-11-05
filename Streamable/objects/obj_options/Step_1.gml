/// @description Insert description here
var game_speed = game_get_speed(gamespeed_microseconds);
since_last_delta += delta_time;
since_last = 0;

if since_last_delta > game_speed
{
	since_last = floor(since_last_delta / game_speed)
	since_last_delta -= game_speed * since_last
}