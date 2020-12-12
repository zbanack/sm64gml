// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function exclamation_box_bhv_define(){
	
	/// <pygml?v=1.0&h=7282996a4>
	sm64.bhvExclamationBox = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_OR_INT, oFlags,  OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_COLLISION_DATA, exclamation_box_outline_seg8_collision_08025F78],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_SET_FLOAT, oCollisionDistance, 300],
	    [BCMD_HOME],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_exclamation_box_loop],
	    [BCMD_LOOP_END],
	];
	
	/// <pygml?v=1.0&h=7e405b384>
	bhvSingleCoinGetsSpawned = [
	    [BCMD_BEGIN, OBJ_LIST_LEVEL],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_CYCL],
	    [BCMD_CALL, bhv_coin_init],
	    [BCMD_PHY, /*Wall hitbox radius*/ 30, /*Gravity*/ -400, /*Bounciness*/ -70, /*Drag strength*/ 1000, /*Friction*/ 1000, /*Buoyancy*/ 200, /*Unused*/ 0, 0],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_coin_loop],
	        [BCMD_ADD_INT, oAnimState, 1],
	    [BCMD_LOOP_END],
	];


	/// <pygml?v=1.0&h=a01aeae51>
	bhvThreeCoinsSpawn = [
	    [BCMD_BEGIN, OBJ_LIST_DEFAULT],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_REPEAT_BEGIN, 3],
	        [BCMD_SPAWN_CHILD, /*Model*/ MODEL_YELLOW_COIN, /*Behavior*/ bhvSingleCoinGetsSpawned],
	    [BCMD_REPEAT_END],
	    [BCMD_DEACTIVATE],
	];
	
	/// <pygml?v=1.0&h=035e731f1>
	bhvTenCoinsSpawn = [
	    [BCMD_BEGIN, OBJ_LIST_DEFAULT],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_REPEAT_BEGIN, 10],
	        [BCMD_SPAWN_CHILD, /*Model*/ MODEL_YELLOW_COIN, /*Behavior*/ bhvSingleCoinGetsSpawned],
	    [BCMD_REPEAT_END],
	    [BCMD_DEACTIVATE],
	];
	
	/// <pygml?v=1.0&h=008662013>
	bhvBreakBoxTriangle = [
	    [BCMD_BEGIN, OBJ_LIST_UNIMPORTANT],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_REPEAT_BEGIN, 18],
	        [BCMD_CALL, cur_obj_rotate_face_angle_using_vel],
	        [BCMD_CALL, cur_obj_move_using_fvel_and_gravity],
	    [BCMD_REPEAT_END],
	    [BCMD_DEACTIVATE],
	];



}