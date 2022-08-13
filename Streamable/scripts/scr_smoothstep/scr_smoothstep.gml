// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function smoothstep(edge0, edge1, val){
	if (val < edge0) {
		return 0;	
	}
	
	if (val > edge1) {
		return 1;	
	}
	
	val = (val - edge0) / (edge1 - edge0)
	return val * val * (3 - 2 * val)
}

function smootherstep(edge0, edge1, val){
  val = clamp((val - edge0) / (edge1 - edge0), 0.0, 1.0);
  return val * val * val * (val * (val * 6 - 15) + 10);
}