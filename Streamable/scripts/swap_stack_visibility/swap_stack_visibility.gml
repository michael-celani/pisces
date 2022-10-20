// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function swap_stack_visibility(targetStack, activeStack){
	///start by swapping the contents of the two stacks
	tempStackX = targetStack.x;
	targetStack.x = activeStack.x;
	activeStack.x = tempStackX;

	tempActiveState = targetStack.active;
	targetStack.active = activeStack.active;
	activeStack.active = tempActiveState

}
