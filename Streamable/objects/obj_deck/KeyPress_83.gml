/// @description Shuffle
if !keys_are_active() return;

array_shuffleEx(stack_list);

instance_create_layer(-500, 10, "UI", obj_notification, {
	notification_text: "Deck shuffled!"
});