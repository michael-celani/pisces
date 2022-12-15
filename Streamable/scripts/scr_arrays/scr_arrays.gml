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
