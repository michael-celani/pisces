/// @description Shift Dragging
if !keyboard_check(vk_shift) return;

multi_drag = true;

with (obj_card)
{
	offset_x = x;
	offset_y = y;
}
