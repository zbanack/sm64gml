// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bobomb_bhv_define() {
	
	Object1.bhvBobombBuddy = [
	    [BCMD_BEGIN, OBJ_LIST_GENACTOR],
	    [BCMD_HITBOX, oFlags, (OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE) ],
	    [BCMD_ANIMATION, oAnimations, Object1.bobomb_seg8_anims_0802396C ],
	   // [BCMD_INTERACT, INTERACT_TEXT),
	    [BCMD_DROP_TO_FLOOR],
	    [BCMD_HITBOX, /*Radius*/ 100, /*Height*/ 60 ],
	    [BCMD_ANIMATE, 0 ],
	    [BCMD_SET_INT, oBobombBuddyRole, 0 ],
	    [BCMD_HOME ],
	    [BCMD_CALL, bhv_bobomb_buddy_init ],
	    [BCMD_LOOP_BEGIN ],
	        [BCMD_SET_INT, oIntangibleTimer, 0 ],
	        [BCMD_CALL, bhv_bobomb_buddy_loop ],
	    [BCMD_LOOP_END ],
	];
	
	Object1.bhvBobomb = [
	    [BCMD_BEGIN, OBJ_LIST_DESTRUCTIVE],
	    [BCMD_HITBOX, oFlags, (OBJ_FLAG_PERSISTENT_RESPAWN | OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_HOLDABLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE) ],
	    [BCMD_ANIMATION, oAnimations, Object1.bobomb_seg8_anims_0802396C ],
	   // [BCMD_INTERACT, INTERACT_TEXT),
	    [BCMD_DROP_TO_FLOOR],
	    [BCMD_ANIMATE, 0 ],
	    [BCMD_SET_INT, oIntangibleTimer, 0 ],
	    [BCMD_HOME ],
	    [BCMD_CALL, bhv_bobomb_init ],
	    [BCMD_LOOP_BEGIN ],
	        [BCMD_CALL, bhv_bobomb_loop ],
	    [BCMD_LOOP_END ],
	];
	
}