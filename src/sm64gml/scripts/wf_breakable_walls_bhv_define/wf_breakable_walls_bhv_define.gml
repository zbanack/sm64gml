function wf_breakable_walls_bhv_define() {
	/// <pygml?v=1.0&h=2de1ffcb4>
	bhvWfBreakableWallRight = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_COLLISION_DATA, wf_seg7_collision_breakable_wall],
	    [BCMD_OR_INT, oFlags,  OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_HITBOX, /*Radius*/ 300, /*Height*/ 400],
	    [BCMD_SET_INT, oIntangibleTimer, 0],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_wf_breakable_wall_loop],
	        [BCMD_CALL, load_object_collision_model],
	    [BCMD_LOOP_END],
	];

	/// <pygml?v=1.0&h=203afbe69>
	bhvWfBreakableWallLeft = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_COLLISION_DATA, wf_seg7_collision_breakable_wall_2],
	    // WF breakable walls - common:
	    [BCMD_OR_INT, oFlags,  OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_HITBOX, /*Radius*/ 300, /*Height*/ 400],
	    [BCMD_SET_INT, oIntangibleTimer, 0],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_wf_breakable_wall_loop],
	        [BCMD_CALL, load_object_collision_model],
	    [BCMD_LOOP_END],
	];


}