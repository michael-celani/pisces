function array_contains(array, value)
{
	return array_find_index(array, value) != -1;
}

function array_shuffle(array)
{
	for (var i = array_length(array) - 1; i > 0; i--)
	{
		var j = irandom_range(0, i);
		var temp = array[j];
		array[j] = array[i];
		array[i] = temp;
	}	
}

function array_find_index(array, value)
{
	for (var i = 0; i < array_length(array); i++)
	{
		if array[i] == value return i;	
	}
	
	return -1;
}