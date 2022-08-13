// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function round_to_nearest(val, multiple){
	val = int64(val);
	multiple = int64(multiple);
	
	var rem = val % multiple;
	var res = val - rem;
	
	if rem >= (multiple / 2) {
		res += multiple
	}
	
	return res;
}