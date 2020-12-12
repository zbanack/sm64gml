// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_kickable_board_bhv_define(){
/// <pygml?v=1.0&h=7dbd90be4>
bhvKickableBoard = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, wf_seg7_collision_kickable_board],
    [BCMD_HITBOX, /*Radius*/ 100, /*Height*/ 1200],
    [BCMD_HURTBOX, /*Radius*/ 1, /*Height*/ 1],
    [BCMD_SET_FLOAT, oCollisionDistance, 1500],
    [BCMD_SET_INT, oIntangibleTimer, 0],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_kickable_board_loop],
    [BCMD_LOOP_END],
];


}