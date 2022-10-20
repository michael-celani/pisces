// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_message_subscribers(message_name) {
	var subscribers = [];

	with (all)
	{
		if !variable_instance_exists(id, "subscribed_events") continue;
		if subscribed_events[$ message_name] == undefined continue;
		
		array_push(subscribers, {
			"obj": id,
			"ev": subscribed_events[$ message_name]
		});
	}
	
	return subscribers;
}