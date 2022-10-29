
function RightClickMenu(_dividers = []) constructor
{
	menu_options = [];
	dividers = _dividers;
	
	static CreateMenu = function(_x, _y, _owner)
	{		
		var draw_y = _y;
		
		var max_height = 0;
		var max_width = 0;
		
		draw_set_font(fnt_segoe);
		
		for (var i = 0; i < array_length(menu_options); i++)
		{
			var name_str = menu_options[i].name
			var max_height = max(max_height, string_height(name_str));
			var max_width = max(max_width, string_width(name_str));
		}
		
		max_width += 80;
		max_height = max(max_height, 60);
		
		return instance_create_layer(
				_x, 
				draw_y, 
				"UI", 
				obj_menu, 
				{ 
					owner: _owner,
					options: menu_options,
					dividers: dividers,
					height: max_height,
					width: max_width
				});
	}
	
	static AddSeparator = function()
	{
		array_push(dividers, array_length(menu_options));	
	}
	
	static AddOption = function(option)
	{
		array_push(menu_options, option);
	}
	
	static Destroy = function()
	{
		for (var i = 0; i < array_length(menu_options); i++)
		{
			delete menu_options[i];	
		}
	}
}

function RightClickMenuOption(_name, _action, _onhover, _onunhover, _icon = spr_close, _hotkey = "") constructor
{
	name = _name;
	action = _action;
	onhover = _onhover;
	onunhover = _onunhover;
	icon = _icon;
	hotkey = _hotkey;
	draw_color = c_white;
	
	static Perform = function(owner)
	{
		with (obj_menu)
		{
			clearing = true;
			alarm[0] = 30;
		}
		
		action(owner)
	}
}