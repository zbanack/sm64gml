// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_sliding_platform_bhv_define(){

/// <pygml?v=1.0&h=c02165a2f>
bhvWfSlidingPlatform = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, wf_seg7_collision_sliding_brick_platform],
    [BCMD_CALL, bhv_wf_sliding_platform_init],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_wf_sliding_platform_loop],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];

}