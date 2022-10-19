/// @description Insert description here
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
x_start += parent_component.x - parent_component.xprevious;
moved = true;