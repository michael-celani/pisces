// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function array_contains(array, value)
{
	var array_size = array_length(array);

	for (var i = 0; i < array_size; i++)
	{
		if array[i] == value return true;	
	}
	
	return false;
}