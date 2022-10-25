/// @description
var response_id = async_load[? "id"];
var response_status = async_load[? "status"];
	
if response_id == update and response_status == 0
{
	var json = async_load[? "result"];
	var data = json_parse(json);
		
	if data.revision > current
	{
		var width = 1200;
		var create_x = room_width / 2 - width/ 2;
		instance_create_layer(create_x, 10, "UI", obj_update_window);
	}
		
	instance_destroy();
}