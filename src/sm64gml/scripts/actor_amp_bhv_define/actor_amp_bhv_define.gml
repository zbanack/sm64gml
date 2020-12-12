// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function actor_amp_bhv_define(){
/// <pygml?v=1.0&h=f418f1f41>
bhvHomingAmp = [
    [BCMD_BEGIN, OBJ_LIST_GENACTOR],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_ANIMATION, oAnimations, amp_seg8_anims_08004034],
    [BCMD_ANIMATE, 0],
    [BCMD_SET_FLOAT, oGraphYOffset, 40],
    [BCMD_SET_INT, oIntangibleTimer, 0],
    [BCMD_CALL, bhv_homing_amp_init],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_homing_amp_loop],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=f05ccfce1>
bhvCirclingAmp = [
    [BCMD_BEGIN, OBJ_LIST_GENACTOR],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_ANIMATION, oAnimations, amp_seg8_anims_08004034],
    [BCMD_ANIMATE, 0],
    [BCMD_SET_FLOAT, oGraphYOffset, 40],
    [BCMD_SET_INT, oIntangibleTimer, 0],
    [BCMD_CALL, bhv_circling_amp_init],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_circling_amp_loop],
    [BCMD_LOOP_END],
];

}