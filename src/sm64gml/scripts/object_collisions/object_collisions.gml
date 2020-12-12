function clear_object_collision(startNode) {
	var sp4 = startNode.next;

	while (sp4 != startNode) {
	    var obj = sp4.wrapperObject;
	    obj.collidedObjs.clear();
	    obj.numCollidedObjs = 0;
	    obj.collidedObjInteractTypes = 0;
	    if (obj.rawData[oIntangibleTimer] > 0) {
			obj.rawData[oIntangibleTimer]--;
		}
	    sp4 = sp4.next;
	}
}
	
function detect_object_hitbox_overlap(a, b) {
	var sp3C = a.rawData[oPosY] - a.hitboxDownOffset;
	var sp38 = b.rawData[oPosY] - b.hitboxDownOffset;
	var dx = a.rawData[oPosX] - b.rawData[oPosX];
	var dz = a.rawData[oPosZ] - b.rawData[oPosZ];
	var collisionRadius = a.hitboxRadius + b.hitboxRadius;
	var distance = sqrt((dx * dx + dz * dz));

	if (collisionRadius > distance) {
	    var sp20 = a.hitboxHeight + sp3C;
	    var sp1C = b.hitboxHeight + sp38;

	    if (sp3C > sp1C) return 0;
	    if (sp20 < sp38) return 0;
	    if (a.numCollidedObjs >= 4) return 0;
	    if (b.numCollidedObjs >= 4) return 0;

	    a.collidedObjs.push(b);
	    b.collidedObjs.push(a);

	    a.numCollidedObjs++; //possibly unnecessary
	    b.numCollidedObjs++; //possibly unnecessary

	    a.collidedObjInteractTypes |= b.rawData[oInteractType];
	    b.collidedObjInteractTypes |= a.rawData[oInteractType];

	    return 1

	}
}
	
/// <pygml?v=1.0&h=ef5639485>
/// @function	detect_object_hurtbox_overlap(a, b)
/// @param		{struct}	a
/// @param		{struct}	b
/// @returns	s32
function detect_object_hurtbox_overlap(a, b) {
	var sp3C = a.rawData[oPosY] - a.hitboxDownOffset;
	var sp38 = b.rawData[oPosY] - b.hitboxDownOffset;
	var sp34 = a.rawData[oPosX] - b.rawData[oPosX];
	var sp30 = sp3C - sp38;
	var sp2C = a.rawData[oPosZ] - b.rawData[oPosZ];
	var sp28 = a.hurtboxRadius + b.hurtboxRadius;
	var sp24 = sqrt(sp34 * sp34 + sp2C * sp2C);

	if (a == gMarioObject[0]) {
	    b.rawData[oInteractionSubtype] |= INT_SUBTYPE_DELAY_INVINCIBILITY;
	}

	if (sp28 > sp24) {
	    var sp20 = a.hitboxHeight + sp3C;
	    var sp1C = b.hurtboxHeight + sp38;

	    if (sp3C > sp1C) {
	        return 0;
	    }
	    if (sp20 < sp38) {
	        return 0;
	    }
	    if (a == gMarioObject[0]) {
	        b.rawData[oInteractionSubtype] &= ~INT_SUBTYPE_DELAY_INVINCIBILITY;
	    }
	    return 1;
	}

	//! no return value
}


function check_collision_in_list(a, bStart) {
    
	if (a.rawData[oIntangibleTimer] == 0) {
	    var bNode = bStart.next;
	    while (bNode != bStart) {
	        var b = bNode.wrapperObject;
	        if (b.rawData[oIntangibleTimer] == 0) {
	            if (detect_object_hitbox_overlap(a, b) && b.hurtboxRadius != 0.0) {
	                detect_object_hurtbox_overlap(a, b)
	            }
	        }
	        bNode = bNode.next
	    }
	}
}
	
function check_player_object_collision() {
		
	var playerObjectList = gObjectLists[OBJ_LIST_PLAYER];
	var mario1Object = playerObjectList.next.wrapperObject;

	check_collision_in_list(mario1Object, gObjectLists[OBJ_LIST_POLELIKE]);
	check_collision_in_list(mario1Object, gObjectLists[OBJ_LIST_LEVEL]);
	check_collision_in_list(mario1Object, gObjectLists[OBJ_LIST_GENACTOR]);
	check_collision_in_list(mario1Object, gObjectLists[OBJ_LIST_PUSHABLE]);
	check_collision_in_list(mario1Object, gObjectLists[OBJ_LIST_SURFACE]);
	check_collision_in_list(mario1Object, gObjectLists[OBJ_LIST_DESTRUCTIVE]);

}
	
function detect_object_collisions() {
	clear_object_collision(gObjectLists[OBJ_LIST_POLELIKE]);
	clear_object_collision(gObjectLists[OBJ_LIST_PLAYER]);
	clear_object_collision(gObjectLists[OBJ_LIST_PUSHABLE]);
	clear_object_collision(gObjectLists[OBJ_LIST_GENACTOR]);
	clear_object_collision(gObjectLists[OBJ_LIST_LEVEL]);
	clear_object_collision(gObjectLists[OBJ_LIST_SURFACE]);
	clear_object_collision(gObjectLists[OBJ_LIST_DESTRUCTIVE]);
	check_player_object_collision();
}