// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function camera_mirroring_enabled()
{
	return instance_exists(obj_surface_writer) and surface_exists(obj_surface_writer.display_surface);
}

function enable_camera_mirroring()
{
	if !camera_exists()
	{
		return false;	
	}
	
	if camera_mirroring_enabled()
	{
		return false;	
	}
	
	instance_create_layer(x, y, "Instances", obj_surface_writer);
	return true;
}

function disable_camera_mirroring()
{
	instance_destroy(obj_surface_writer);
}

function toggle_camera_mirroring()
{
	if camera_mirroring_enabled()
	{
		disable_camera_mirroring();	
	}
	else
	{
		enable_camera_mirroring();	
	}
}