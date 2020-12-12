// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_tower_platform_bhv_define(){
/// <pygml?v=1.0&h=22a6efc15>
bhvWfSolidTowerPlatform = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, wf_seg7_collision_platform],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_wf_solid_tower_platform_loop],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=9b0308fe6>
bhvWfElevatorTowerPlatform = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, wf_seg7_collision_platform],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_wf_elevator_tower_platform_loop],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=d651be2f2>
bhvWfSlidingTowerPlatform = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, wf_seg7_collision_platform],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_wf_sliding_tower_platform_loop],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];
/// <pygml?v=1.0&h=90305c274>
bhvTowerPlatformGroup = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_DISABLE_RENDERING],
    [BCMD_ADD_FLOAT, oPosY, 300],
    [BCMD_HOME],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_tower_platform_group_loop],
    [BCMD_LOOP_END],
];


}