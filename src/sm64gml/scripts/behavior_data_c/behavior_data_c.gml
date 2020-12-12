function behavior_data_c() {
	
	bhvMario = [
	    [BCMD_BEGIN, OBJ_LIST_PLAYER ],
	    [BCMD_SET_INT, oIntangibleTimer, 0],
	    [BCMD_SET_INT, oFlags, OBJ_FLAG_0100],
	    [BCMD_SET_INT, oUnk94, 0x0001],
	    [BCMD_HITBOX, 37, 160 ],
	    [BCMD_LOOP_BEGIN ],
	    [BCMD_CALL, bhv_mario_update ],
	    [BCMD_LOOP_END ],
	];
	
	bhvTree = [
		[BCMD_BEGIN, OBJ_LIST_POLELIKE  ],
	    [BCMD_BILLBOARD ],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE  ],
	    [BCMD_SET_INT, oInteractType, INTERACT_POLE ],
	    [BCMD_HITBOX, 80, 500 ],
	    [BCMD_SET_INT, oIntangibleTimer, 0  ],
	    [BCMD_LOOP_BEGIN ],
	    [BCMD_CALL, bhv_pole_base_loop  ],
		[BCMD_LOOP_END ],
	];

	bhvStaticObject = [
	    [BCMD_BEGIN, OBJ_LIST_DEFAULT],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE ],
	    [BCMD_BREAK],
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

	/// <pygml?v=1.0&h=82834f722>
	bhvAnimatesOnFloorSwitchPress = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_SET_FLOAT, oCollisionDistance, 8000],
	    [BCMD_CALL, bhv_animates_on_floor_switch_press_init],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_animates_on_floor_switch_press_loop],
	        [BCMD_CALL, load_object_collision_model],
	    [BCMD_LOOP_END],
	];
	
	/// <pygml?v=1.0&h=12a716cda>
	bhvFloorSwitchAnimatesObject = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_SET_INT, oBehParams2ndByte, 1],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_COLLISION_DATA, purple_switch_seg8_collision_0800C7A8],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_purple_switch_loop],
	        [BCMD_CALL, load_object_collision_model],
	    [BCMD_LOOP_END],
	];


}