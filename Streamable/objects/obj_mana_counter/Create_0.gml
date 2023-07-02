/// @description initialize sprites and bounding box

drag_offsetX = 0;
drag_offsetY = 0;
manaInstanceIDs = [];
var spriteVars = [spr_w, spr_u, spr_b, spr_r, spr_g, spr_c];
visible = isVisible;


// create the mana objects
var tmp = 96
for(var i = 0; i < 6; i++){
	array_push(manaInstanceIDs, instance_create_layer(tmp, 96, "ManaCounter", obj_mana, 
	{sprite_index : spriteVars[i], visible: isVisible}));
	tmp += 60;
}


