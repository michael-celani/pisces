// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function string_split(inputString, delim)
{
	/// string_split(:string, delimiter:string, ?list<string>):list<string>
	var s = inputString, d = delim, r;
	//r = ds_list_create();
	r = [];
	var p = string_pos(d, s), o = 1;
	var dl = string_length(d);
	if (dl) while (p) {
	    //ds_list_add(r, string_copy(s, o, p - o));
		array_push(r,string_copy(s,o,p - o));
	    o = p + dl;
	    p = string_pos_ext(d, s, o);
	}
	//ds_list_add(r, string_delete(s, 1, o - 1));
	array_push(r, string_delete(s, 1, o - 1));
	return r;
}



//function string_compose_from_ds_list(input,delim)
function string_compose_from_array(input,delim)
{
	//var arLen = ds_list_size(input);
	var arLen = array_length(input);
	var output_string = "";
	for (var i = 0; i< arLen; i+=1)
	{
		//output_string = output_string + string(input[| i]);
		output_string = output_string + string(input[i]);
		if i < arLen-1
		{
			output_string = output_string + string(delim);
		}
	}
	return output_string;
}