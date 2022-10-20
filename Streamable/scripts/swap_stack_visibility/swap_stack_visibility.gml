// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function swap_stack_visibility(currentStack,targetStack){
	///start by swapping the contents of the two stacks
	tempStackX = targetStack.x;
	targetStack.next_x = currentStack.x;
	currentStack.next_x = tempStackX;

	tempActiveState = targetStack.active;
	targetStack.active = currentStack.active;
	currentStack.active = tempActiveState

	with (obj_card) {
		if (self.parent_stack != noone and self.parent_stack != obj_hand){

			self.next_x = self.parent_stack.x;
		}
	}
}
