/// @description
image_xscale = 3 - 2 * smootherstep(total_time, total_time - 30, alarm[0]);
image_yscale = image_xscale;

if alarm[0] > 30
{
	image_alpha = smootherstep(total_time, total_time - 30, alarm[0]);
}
else
{
	image_alpha = 1 - smootherstep(30, 0, alarm[0]);	
}

y = lerp(start_y, final_y, 1 - (alarm[0] / total_time))