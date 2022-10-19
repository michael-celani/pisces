// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_from_parent_component()
{
	if (moved) return;
	if (parent_component == noone) return;
	
	if (!parent_component.moved)
	{
		with (parent_component)
		{
			move_from_parent_component();
		}
	}
	
	x += parent_component.x - parent_component.xprevious;
	y += parent_component.y - parent_component.yprevious;
	moved = true;
	
}