// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tumbling_bridges_bhv_define(){
	/// <pygml?v=1.0&h=aa19353dc>
	bhvWfTumblingBridge = [
	    [BCMD_BEGIN, OBJ_LIST_SPAWNER],
	    [BCMD_OR_INT, oFlags,  OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_HOME],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_tumbling_bridge_loop],
	    [BCMD_LOOP_END],
	];
	
	/// <pygml?v=1.0&h=026fcb93b>
	bhvBbhTumblingBridge = [
	    [BCMD_BEGIN, OBJ_LIST_SPAWNER],
	    [BCMD_OR_INT, oFlags,  OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_HOME],
	    [BCMD_SET_INT, oBehParams2ndByte, 1],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_tumbling_bridge_loop],
	    [BCMD_LOOP_END],
	];
	
	/// <pygml?v=1.0&h=04b6c583d>
	bhvLllTumblingBridge = [
	    [BCMD_BEGIN, OBJ_LIST_SPAWNER],
	    [BCMD_OR_INT, oFlags,  OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_HOME],
	    [BCMD_SET_INT, oBehParams2ndByte, 2],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_tumbling_bridge_loop],
	    [BCMD_LOOP_END],
	];

	/// <pygml?v=1.0&h=31d69a8c4>
	bhvTumblingBridgePlatform = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_OR_INT, oFlags,  OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_SET_FLOAT, oCollisionDistance, 300],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_tumbling_bridge_platform_loop],
	        [BCMD_CALL, load_object_collision_model],
	    [BCMD_LOOP_END],
	];


}