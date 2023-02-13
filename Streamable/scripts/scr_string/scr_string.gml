function string_pos_any()
{
	var str = argument0;
	
	for (var i = 1; i <= string_length(str); i++)
	{
		for (var j = 1; j < argument_count; j++)
		{
			if string_char_at(str, i) == argument[j]
			{
				return i;
			}
		}
	}

	return 0;
}