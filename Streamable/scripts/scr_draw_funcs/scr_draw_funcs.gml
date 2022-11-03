// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rotate_around_point(px, py, angle, point_struct) {
	var angle_rad = degtorad(angle);
	var s = sin(angle_rad);
	var c = cos(angle_rad);
	
	var nx = 0;
	var ny = 0;

	with point_struct
	{
		x1 -= px;
		y1 -= py;
		nx = x1 * c - y1 * s;
		ny = x1 * s + y1 * c;
		x1 = nx + px;
		y1 = ny + py;

		x2 -= px;
		y2 -= py;
		nx = x2 * c - y2 * s;
		ny = x2 * s + y2 * c;
		x2 = nx + px;
		y2 = ny + py;

		x3 -= px;
		y3 -= py;
		nx = x3 * c - y3 * s;
		ny = x3 * s + y3 * c;
		x3 = nx + px;
		y3 = ny + py;

		x4 -= px;
		y4 -= py;
		nx = x4 * c - y4 * s;
		ny = x4 * s + y4 * c;
		x4 = nx + px;
		y4 = ny + py;
	}
}

function skew_points_around_center(skew_x, skew_y, width, height, point_struct)
{
	var sinX = sin(skew_x);
	var sinY = sin(skew_y);
	var cosX = cos(skew_x);
	var cosY = cos(skew_y);
	
	var x_offset = width / 2;
	var y_offset = height / 2;
	
	var xcoord_diff = width - x_offset * cosX;
	var ycoord_diff = height - y_offset * cosY;
	
	var depth_ratio_r = 6 / (6 + sinX);
	var depth_ratio_l = 6 / (6 - sinX);
	var depth_ratio_t = 6 / (6 - sinY);
	var depth_ratio_b = 6 / (6 + sinY);
	
	var xcoord_diff_dist = abs(xcoord_diff);
	var ycoord_diff_dist = abs(ycoord_diff);
	
	with point_struct
	{
		x1 += xcoord_diff_dist - x_offset * depth_ratio_t;
		x2 -= xcoord_diff_dist - x_offset * depth_ratio_t;
		x3 -= xcoord_diff_dist - x_offset * depth_ratio_b;
		x4 += xcoord_diff_dist - x_offset * depth_ratio_b;
		y1 += ycoord_diff_dist - y_offset * depth_ratio_l;
		y2 += ycoord_diff_dist - y_offset * depth_ratio_r;
		y3 -= ycoord_diff_dist - y_offset * depth_ratio_r;
		y4 -= ycoord_diff_dist - y_offset * depth_ratio_l;
	}
}