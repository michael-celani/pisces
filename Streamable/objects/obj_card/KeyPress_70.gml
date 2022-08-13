/// @description Flip
if !is_hovering && !is_dragged {
	return;
}

is_flipped = !is_flipped;

if (is_flipped)
{
	sprite_index = back_sprite	
}
else
{
	sprite_index = front_sprite	
}