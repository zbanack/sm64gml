// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function actor_spindrift_bhv_define(){
/// <pygml?v=1.0&h=d1471bd82>

bhvSpindrift = [
    [BCMD_BEGIN, OBJ_LIST_GENACTOR],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_ANIMATION, oAnimations, spindrift_seg5_anims_05002D68],
    [BCMD_ANIMATE, 0],
    [BCMD_PHY, /*Wall hitbox radius*/ 30, /*Gravity*/ -400, /*Bounciness*/ 0, /*Drag strength*/ 0, /*Friction*/ 0, /*Buoyancy*/ 200, /*Unused*/ 0, 0],
    [BCMD_HOME],
    [BCMD_SET_INT, oInteractionSubtype, INT_SUBTYPE_TWIRL_BOUNCE],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_spindrift_loop],
    [BCMD_LOOP_END],
];


}