
function RightClickMenu() constructor
{
	menu_options = ds_list_create()
	
	static CreateMenu = function(_x, _y, _owner)
	{		
		var draw_y = _y;
		
		var max_height = 0;
		var max_width = 0;
		
		draw_set_font(fnt_segoe);
		
		for (var i = 0; i < ds_list_size(menu_options); i++)
		{
			var name_str = menu_options[| i].name
			var max_height = max(max_height, string_height(name_str));
			var max_width = max(max_width, string_width(name_str));
		}
		
		max_width += 20;
		
		return instance_create_layer(
				_x, 
				draw_y, 
				"UI", 
				obj_menu, 
				{ 
					owner: _owner,
					options: menu_options,
					height: max_height,
					width: max_width
				});
	}
	
	static AddOption = function(option)
	{
		ds_list_add(menu_options, option);
	}
	
	static Destroy = function()
	{
		for (var i = 0; i < ds_list_size(menu_options); i++)
		{
			delete menu_options[| i];	
		}
		
		ds_list_destroy(menu_options);	
	}
}

function RightClickMenuOption(_name, _action, _onhover, _onunhover) constructor
{
	name = _name;
	action = _action;
	onhover = _onhover;
	onunhover = _onunhover;
	
	static Perform = function(owner)
	{
		with (obj_menu)
		{
			instance_destroy();	
		}
		
		action(owner)
	}
}