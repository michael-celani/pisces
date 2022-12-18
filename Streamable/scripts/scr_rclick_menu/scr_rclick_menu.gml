
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
			var name_str = menu_options[i].name;
			if menu_options[i].hotkey != "" {
				name_str = name_str + "m" + menu_options[i].hotkey;
			}
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

function RightClickMenuOption(_name, _action, _onhover, _onunhover, _icon = spr_close, _hotkey = "", _hotkey_same_color = false) constructor
{
	name = _name;
	action = _action;
	onhover = _onhover;
	onunhover = _onunhover;
	icon = _icon;
	hotkey = _hotkey;
	draw_color = c_white;
	hotkey_same_color = _hotkey_same_color;
	
	static Perform = function(owner)
	{
		with (obj_menu)
		{
			clearing = true;
			ticker = 30;
		}
		
		action(owner)
	}
}

function RightClickSubMenu(_name, _submenu, _icon = spr_close, _hotkey = "") constructor
{
	name = _name;
	action = noop;
	submenu = _submenu;
	
	onhover = function(owner, menu) {
		var create_x = menu.x + menu.width + menu.padding + menu.padding;
		var create_y = menu.bounding_y_start - menu.padding;
		submenu_obj = submenu.CreateMenu(
			create_x,
			create_y,
			owner
		);
		
		submenu_obj.depth = menu.depth - 1;
	};
	
	onunhover = function() {
		instance_destroy(submenu_obj);	
	}
	
	icon = _icon;
	hotkey = _hotkey;
	draw_color = c_white;
	hotkey_same_color = true
	
	static Perform = function(owner) { 
		with (obj_menu)
		{
			clearing = true;
			ticker = 30;
		}
	}
}