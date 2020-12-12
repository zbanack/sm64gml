function scuttlebug_bhv_define(){
	
	Object1.bhvScuttlebug = [
	    [BCMD_BEGIN, OBJ_LIST_GENACTOR ],
		
		[BCMD_OR_INT, oFlags, (OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE) ],
	    [BCMD_ANIMATION, oAnimations, Object1.scuttlebug_seg6_anims_06015064],
	    [BCMD_ANIMATE, 0],
	    [BCMD_PHY, 80, -400, -50, 0, 0, 200, 0],
		[BCMD_HOME ],
		
		[BCMD_CALL, bhv_init_room ],
		[BCMD_LOOP_BEGIN ],
		[BCMD_CALL, bhv_scuttlebug_loop ],
		[BCMD_LOOP_END ],
	];
}