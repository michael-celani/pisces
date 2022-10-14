// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function camera_mirroring_enabled()
{
	return instance_exists(obj_surface_writer) && obj_surface_writer.camera_on && surface_exists(obj_surface_writer.display_surface);
}