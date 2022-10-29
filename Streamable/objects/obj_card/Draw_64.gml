/// @description
with owning_canvas
{
	if !surface_exists(surf)
	{
		surf = surface_create(1920, 1080);	
	}
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0)
}

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

var skewing = image_angle == 0 and is_dragged;

// Rotation:
if (image_angle != 0)
{
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
}

// Skew effect:
if skewing {
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
if (time_hovering != 0 and !is_zoomed)
{
	var spent = sin(degtorad(time_hovering)) * sprite_height / 32;
	y1 += spent
	y2 += spent
	y3 += spent
	y4 += spent
}

var off = sprite_width * (image_xscale - obj_options.default_scaling);

if is_zoomed
{
	off = 0
}

if (skewing)
{
	draw_sprite_pos_fixed(spr_card_shadow, image_index, x1 + off, y1 + off, x2 + off, y2 + off, x3 + off, y3 + off, x4 + off, y4 + off, c_white, 0.25);
	draw_sprite_pos_fixed(sprite_index, image_index, x1, y1, x2, y2, x3, y3, x4, y4, c_white, 1);
}
else
{
	draw_sprite_pos(spr_card_shadow, image_index, x1 + off, y1 + off, x2 + off, y2 + off, x3 + off, y3 + off, x4 + off, y4 + off, 0.25);
	draw_sprite_pos(sprite_index, image_index, x1, y1, x2, y2, x3, y3, x4, y4, 1);
}

if is_zoomed and not is_dragged and note_content != ""
{
	var side_screen = 1 - 2 * (x < room_width / 2);

	var box_x1 = x + side_screen * .52 * sprite_width
	var box_x2 = x + side_screen * .77 * sprite_width + side_screen * string_width(note_content);
	var box_y1 = y - 0.05 * sprite_height;
	var box_y2 = y + 0.05 * sprite_height;

	draw_set_valign(fa_center);
	draw_set_halign(fa_center);

	draw_set_alpha(0.4);
	draw_roundrect_color_ext(box_x1,box_y1,box_x2,box_y2,10,10,c_black,c_black,false);
	
	///text
	draw_set_color(c_white);
	draw_set_alpha(0.90);
	draw_text((box_x1 + box_x2) / 2, (box_y1 + box_y2) / 2, note_content);
		
	///reset for the other menus
	draw_set_alpha(1.0);
}

if (is_hovering or is_dragged or is_selected) and !is_zoomed
{
	draw_sprite_pos_fixed(spr_border, image_index, x1, y1, x2, y2, x3, y3, x4, y4, c_white, 1);
}

if (note_content != "" and !is_zoomed and !is_tapping)
	{
		var lx4 = x4 + 0.05*sprite_width;
		var ly4 = y4 - 0.05*sprite_height;
		var lx3 = x3 - 0.05*sprite_width;
		var ly3 = y3 - 0.20*sprite_height;
		var x_note_center =x4 + (lx3 - lx4)*0.5;
		var y_note_center =y4 + (ly3 - ly4)*0.75;
		if tapped{
			/// if this is tapped update the above values to move the note appropriately
			lx4 = x3 + 0.05*sprite_height;
			ly4 = y3 - 0.05*sprite_width;
			lx3 = x2 - 0.05*sprite_height;
			ly3 = y2 - 0.30*sprite_width;
			x_note_center =x3 + (lx3 - lx4)*0.5;
			y_note_center =y3 + (ly3 - ly4)*0.75;
		
		}	
		///this version is for notes just on board
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		///box
		if is_hovering{
			draw_set_alpha(0.4);
		}
		else{
			draw_set_alpha(0.15);
		}
		draw_roundrect_color_ext(lx4,ly4,lx3,ly3,10,10,c_black,c_black,false);
	
		///text
		draw_set_color(c_white);
		if is_hovering{
			draw_set_alpha(0.90);
		}
		else{
			draw_set_alpha(0.50);
		}
		
		var text_scale_factor = 1/(0.5 - 0.15);
		var text_scale = 0.25+0.5*(obj_options.default_scaling - 0.15)*text_scale_factor;
		draw_text_transformed(x_note_center,y_note_center,string(note_content),text_scale,text_scale,0.0);
		///reset for the other menus
		draw_set_alpha(1.0);
	}

if (counters != 0)
{
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		
		draw_set_alpha(0.85);
		draw_roundrect_color_ext(x4 - 20, y4 - 20, x4 + 20, y4 + 20, 5, 5, c_black, c_black, false);
		
		draw_set_color(c_white);
		draw_set_alpha(1.0);
		draw_text(x4, y4, string(counters));
}

with (owning_canvas)
{
	surface_reset_target();
	draw_surface_part(surf, box_left, box_top, box_right - box_left, box_bottom - box_top, box_left, box_top);
}

// Write to webcam surface:
if camera_mirroring_enabled()
{
	var spr = spr_card_bad;
	
	if is_revealed
	{
		spr = sprite_index;	
	}
	
	surface_set_target(obj_surface_writer.display_surface);
	
	if (skewing)
	{
		draw_sprite_pos_fixed(spr_card_shadow, image_index, x1 + off, y1 + off, x2 + off, y2 + off, x3 + off, y3 + off, x4 + off, y4 + off, c_white, 0.25);
		draw_sprite_pos_fixed(spr, image_index, x1, y1, x2, y2, x3, y3, x4, y4, c_white, 1);
	}
	else
	{
		draw_sprite_pos(spr_card_shadow, image_index, x1 + off, y1 + off, x2 + off, y2 + off, x3 + off, y3 + off, x4 + off, y4 + off, 0.25);
		draw_sprite_pos(spr, image_index, x1, y1, x2, y2, x3, y3, x4, y4, 1);
	}
	
	if is_zoomed and not is_dragged and note_content != ""
	{
		var side_screen = 1 - 2 * (x < room_width / 2);

		var box_x1 = x + side_screen * .52 * sprite_width
		var box_x2 = x + side_screen * .77 * sprite_width + side_screen * string_width(note_content);
		var box_y1 = y - 0.05 * sprite_height;
		var box_y2 = y + 0.05 * sprite_height;

		draw_set_valign(fa_center);
		draw_set_halign(fa_center);

		draw_set_alpha(0.4);
		draw_roundrect_color_ext(box_x1,box_y1,box_x2,box_y2,10,10,c_black,c_black,false);
	
		///text
		draw_set_color(c_white);
		draw_set_alpha(0.90);
		draw_text((box_x1 + box_x2) / 2, (box_y1 + box_y2) / 2, note_content);
		
		///reset for the other menus
		draw_set_alpha(1.0);
	}

	if (counters != 0 and !is_zoomed)
	{
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		
		draw_set_alpha(0.85);
		draw_roundrect_color_ext(x4 - 20, y4 - 20, x4 + 20, y4 + 20, 5, 5, c_black, c_black, false);

		draw_set_color(c_white);
		draw_set_alpha(1.0);
		draw_text(x4, y4, string(counters));
	}
	if (note_content != "" and !is_zoomed and !is_tapping and is_revealed)
	{
		var lx4 = x4 + 0.05*sprite_width;
		var ly4 = y4 - 0.05*sprite_height;
		var lx3 = x3 - 0.05*sprite_width;
		var ly3 = y3 - 0.20*sprite_height;
		var x_note_center =x4 + (lx3 - lx4)*0.5;
		var y_note_center =y4 + (ly3 - ly4)*0.75;
		if tapped{
			/// if this is tapped update the above values to move the note appropriately
			lx4 = x3 + 0.05*sprite_height;
			ly4 = y3 - 0.05*sprite_width;
			lx3 = x2 - 0.05*sprite_height;
			ly3 = y2 - 0.30*sprite_width;
			x_note_center =x3 + (lx3 - lx4)*0.5;
			y_note_center =y3 + (ly3 - ly4)*0.75;
		
		}	
		///this version is for notes just on board
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		///box
		if is_hovering{
			draw_set_alpha(0.4);
		}
		else{
			draw_set_alpha(0.15);
		}
		draw_roundrect_color_ext(lx4,ly4,lx3,ly3,10,10,c_black,c_black,false);
	
		///text
		draw_set_color(c_white);
		if is_hovering{
			draw_set_alpha(0.90);
		}
		else{
			draw_set_alpha(0.50);
		}
		var text_scale_factor = 1/(0.5 - 0.15);
		var text_scale = 0.25+0.5*(obj_options.default_scaling - 0.15)*text_scale_factor;
		draw_text_transformed(x_note_center,y_note_center,string(note_content),text_scale,text_scale,0.0);
		///reset for the other menus
		draw_set_alpha(1.0);
	}
	
	surface_reset_target();
}
