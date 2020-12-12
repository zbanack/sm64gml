// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_giant_pole_bhv_define(){
/// <pygml?v=1.0&h=f5e2b6a8e>
bhvYellowBall = [
    [BCMD_BEGIN, OBJ_LIST_DEFAULT],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_CYCL],
    [BCMD_BREAK],
];

/// <pygml?v=1.0&h=6431aaf70>
bhvGiantPole = [
    [BCMD_BEGIN, OBJ_LIST_POLELIKE],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_SET_INT, oInteractType, INTERACT_POLE],
    [BCMD_HITBOX, /*Radius*/ 80, /*Height*/ 2100],
    [BCMD_HOME],
    [BCMD_SET_INT, oIntangibleTimer, 0],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_giant_pole_loop],
    [BCMD_LOOP_END],
];


}