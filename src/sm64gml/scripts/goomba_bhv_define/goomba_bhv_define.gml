function goomba_bhv_define(){
	
/// <pygml?v=1.0&h=36f144f50>
bhvGoomba = [
    [BCMD_BEGIN, OBJ_LIST_PUSHABLE],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_DROP_TO_FLOOR],
    [BCMD_ANIMATION, oAnimations, goomba_seg8_anims_0801DA4C],
    [BCMD_HOME],
    [BCMD_PHY, /*Wall hitbox radius*/ 40, /*Gravity*/ -400, /*Bounciness*/ -50, /*Drag strength*/ 1000, /*Friction*/ 1000, /*Buoyancy*/ 0, /*Unused*/ 0, 0],
    [BCMD_CALL, bhv_goomba_init],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_goomba_update],
    [BCMD_LOOP_END],
];



}