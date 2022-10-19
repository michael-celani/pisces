/// @description 
components = [];

if (parent_component != noone)
{
	depth = parent_component.depth - 1;
	array_insert(parent_component.components, 0, id);
}
