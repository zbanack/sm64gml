// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function actor_whomp_bhv_define(){
		
	/// <pygml?v=1.0&h=4fb911e9e>
	bhvSmallWhomp = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_SET_INT, oNumLootCoins, 5],
	    // Whomp - common:
	    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_ANIMATION, oAnimations, whomp_seg6_anims_06020A04],
	    [BCMD_COLLISION_DATA, whomp_seg6_collision_06020A0C],
	    [BCMD_ANIMATE, 0],
	    [BCMD_PHY, /*Wall hitbox radius*/ 0, /*Gravity*/ -400, /*Bounciness*/ -50, /*Drag strength*/ 0, /*Friction*/ 0, /*Buoyancy*/ 200, /*Unused*/ 0, 0],
	    [BCMD_HOME],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_whomp_loop],
	    [BCMD_LOOP_END],
	];

}