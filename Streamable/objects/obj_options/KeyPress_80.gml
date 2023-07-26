/// @description Open mana counter
if !keys_are_active() return;

if (!instance_exists(obj_mana_counter))
{
	instance_create_layer(
		20,
		20,
		"UI", obj_mana_counter);
}
else
{
	instance_destroy(obj_mana_counter);
}