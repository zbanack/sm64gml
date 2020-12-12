// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_rotating_platform_bhv_define(){
/// <pygml?v=1.0&h=12696e4ff>
bhvRotatingPlatform = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_HOME],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_rotating_platform_loop],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];


}