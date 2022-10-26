/// @description
if !dragging return;

with (parent_component)
{
	x += event_data[? "diffX"];
	y += event_data[? "diffY"];
}