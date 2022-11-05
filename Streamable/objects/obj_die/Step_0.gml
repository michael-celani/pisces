/// @description
ticker = max(ticker - obj_options.since_last, -1);

if ticker <= 0
{
	instance_destroy();
	return;
}

image_xscale = 3 - 2 * smootherstep(total_time, total_time - 30, ticker);
image_yscale = image_xscale;

if ticker > 30
{
	image_alpha = smootherstep(total_time, total_time - 30, ticker);
}
else
{
	image_alpha = 1 - smootherstep(30, 0, ticker);	
}

y = lerp(start_y, final_y, 1 - (ticker / total_time))