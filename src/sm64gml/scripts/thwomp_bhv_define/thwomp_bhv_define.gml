function thwomp_bhv_define(){
	
/// <pygml?v=1.0&h=27b1d010a>
bhvThwomp = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_COLLISION_DATA, thwomp_seg5_collision_0500B7D0],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_DROP_TO_FLOOR],
    [BCMD_ADD_FLOAT, oPosY, 1],
    [BCMD_SCALE, /*Unused*/ 0, /*Field*/ 140],
    [BCMD_HOME],
    [BCMD_SET_FLOAT, oDrawingDistance, 4000],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_grindel_thwomp_loop],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=c343d8f92>
bhvThwomp2 = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_COLLISION_DATA, thwomp_seg5_collision_0500B92C],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_DROP_TO_FLOOR],
    [BCMD_ADD_FLOAT, oPosY, 1],
    [BCMD_HOME],
    [BCMD_SCALE, /*Unused*/ 0, /*Field*/ 140],
    [BCMD_SET_FLOAT, oDrawingDistance, 4000],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_grindel_thwomp_loop],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];

}