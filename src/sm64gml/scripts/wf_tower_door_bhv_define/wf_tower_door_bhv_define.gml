// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_tower_door_bhv_define(){
/// <pygml?v=1.0&h=6cfda58b7>
bhvTowerDoor = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, wf_seg7_collision_tower_door],
    [BCMD_HITBOX, /*Radius*/ 100, /*Height*/ 100],
    [BCMD_SET_INT, oIntangibleTimer, 0],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_tower_door_loop],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];

}