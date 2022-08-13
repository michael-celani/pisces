/// @description
var x_offset = sprite_width / 2;
var y_offset = sprite_height / 2;

var x1 = x - x_offset;
var y1 = y - y_offset;
var x2 = x + x_offset;
var y2 = y - y_offset;
var x3 = x + x_offset;
var y3 = y + y_offset;
var x4 = x - x_offset;
var y4 = y + y_offset;

// Rotation:
var xo = x;
var yo = y;
var s = sin(degtorad(image_angle));
var c = cos(degtorad(image_angle));

x1 = x1 - xo;
y1 = y1 - yo;
var nx1 = x1 * c - y1 * s;
var ny1 = x1 * s + y1 * c;
x1 = nx1;
y1 = ny1;
x1 = x1 + xo;
y1 = y1 + yo;

x2 = x2 - xo;
y2 = y2 - yo;
var nx2 = x2 * c - y2 * s;
var ny2 = x2 * s + y2 * c;
x2 = nx2;
y2 = ny2;
x2 = x2 + xo;
y2 = y2 + yo;

x3 = x3 - xo;
y3 = y3 - yo;
var nx3 = x3 * c - y3 * s;
var ny3 = x3 * s + y3 * c;
x3 = nx3;
y3 = ny3;
x3 = x3 + xo;
y3 = y3 + yo;

x4 = x4 - xo;
y4 = y4 - yo;
var nx4 = x4 * c - y4 * s;
var ny4 = x4 * s + y4 * c;
x4 = nx4;
y4 = ny4;
x4 = x4 + xo;
y4 = y4 + yo;

// Skew effect:
if image_angle == 0 and is_dragged {
	var sinX = sin(skew_x);
	var sinY = sin(skew_y);
	var cosX = cos(skew_x);
	var cosY = cos(skew_y);
	var xcoord_diff = sprite_width - x_offset * cosX;
	var ycoord_diff = sprite_height - y_offset * cosY;
	var depth_ratio_r = 6 / (6 + sinX);
	var depth_ratio_l = 6 / (6 - sinX);
	var depth_ratio_t = 6 / (6 - sinY);
	var depth_ratio_b = 6 / (6 + sinY);
	x1 += (abs(xcoord_diff) - x_offset) + (x_offset - (x_offset * depth_ratio_t));
	x2 -= (abs(xcoord_diff) - x_offset) + (x_offset - (x_offset * depth_ratio_t));
	x3 -= (abs(xcoord_diff) - x_offset) + (x_offset - (x_offset * depth_ratio_b));
	x4 += (abs(xcoord_diff) - x_offset) + (x_offset - (x_offset * depth_ratio_b));
	y1 += (abs(ycoord_diff) - y_offset) + (y_offset - (y_offset * depth_ratio_l));
	y2 += (abs(ycoord_diff) - y_offset) + (y_offset - (y_offset * depth_ratio_r));
	y3 -= (abs(ycoord_diff) - y_offset) + (y_offset - (y_offset * depth_ratio_r));
	y4 -= (abs(ycoord_diff) - y_offset) + (y_offset - (y_offset * depth_ratio_l));
}

// Hovering animation:
var spent = sin(degtorad(time_hovering)) * sprite_height / 32;
y1 += spent
y2 += spent
y3 += spent
y4 += spent

var off = sprite_width * (image_xscale -  obj_options.default_scaling);

// Write to webcam surface:
if surface_exists(obj_surface_writer.display_surface)
{
	var spr = spr_card_bad;
	
	if is_revealed
	{
		spr = sprite_index;	
	}
	
	surface_set_target(obj_surface_writer.display_surface);
	draw_sprite_pos_fixed(spr_card_shadow, image_index, x1 + off, y1 + off, x2 + off, y2 + off, x3 + off, y3 + off, x4 + off, y4 + off, c_white, 0.25);
	draw_sprite_pos_fixed(spr, image_index, x1, y1, x2, y2, x3, y3, x4, y4, c_white, 1);
	surface_reset_target();
}

draw_sprite_pos_fixed(spr_card_shadow, image_index, x1 + off, y1 + off, x2 + off, y2 + off, x3 + off, y3 + off, x4 + off, y4 + off, c_white, 0.25);
draw_sprite_pos_fixed(sprite_index, image_index, x1, y1, x2, y2, x3, y3, x4, y4, c_white, 1);

if is_hovering or is_dragged
{
	draw_sprite_pos_fixed(spr_border, image_index, x1, y1, x2, y2, x3, y3, x4, y4, c_white, 1);
}

//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)