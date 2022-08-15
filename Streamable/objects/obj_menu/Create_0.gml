/// @description Set bounding box
image_xscale = width + 2 * padding;
image_yscale = height * ds_list_size(options) + 2 * padding;
image_alpha = 0;
depth = -1000;

bounding_x_start = x;
bounding_x_end = x + width + padding + padding;
bounding_y_start = y + padding;
bounding_y_end = y + padding + height;

draw_surf = surface_create(image_xscale, image_yscale);