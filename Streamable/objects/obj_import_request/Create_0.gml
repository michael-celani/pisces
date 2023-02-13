/// @description Run request
decklist_request = load_decklist_website(req);

// Invalid request:
if decklist_request == -1 {
	instance_create_layer(-500, 10, "UI", obj_notification, {
		notification_text: "Invalid deck list request."
	});
	
	instance_destroy();
}