/// @description
ticker = max(ticker - obj_options.since_last, -1);

if ticker <= 0
{
	instance_destroy();
	return;
}

x = approach_point(x, 10, obj_options.since_last, 3);