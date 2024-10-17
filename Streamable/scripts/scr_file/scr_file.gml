// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function file_text_open_readall(file)
{
	var file_id = file_text_open_read(file);
	
	file_lines = []
	
	while !file_text_eof(file_id)
	{
		array_push(file_lines, file_text_readln(file_id));
	}
	
	return file_lines;
}