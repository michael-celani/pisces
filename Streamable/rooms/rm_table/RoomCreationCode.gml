surface_depth_disable(true);
gesture_drag_time(0.05);
gpu_set_tex_mip_enable(mip_on);
gpu_set_tex_mip_filter(tf_anisotropic);
randomize();

vertex_format_begin();
vertex_format_add_colour();
vertex_format_add_position();
vertex_format_add_normal();
global.format_perspective = vertex_format_end();

var window_width = window_get_width();
var window_height = window_get_height();
room_width = window_width;
room_height = window_height;
display_set_gui_size(window_width, window_height);