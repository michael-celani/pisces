/// @description shift click subtracts, ctrl click resets
// You can write your code in this editor

if(keyboard_check(vk_shift)){
	count--;	
}else if(keyboard_check(vk_control)){
	count = 0;	
}else{
	count++;
}
