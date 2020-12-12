// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function piano_bhv_define(){
/// <pygml?v=1.0&h=3ac365a9e>
bhvMadPiano = [
    [BCMD_BEGIN, OBJ_LIST_GENACTOR],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_DROP_TO_FLOOR],
    [BCMD_ANIMATION, oAnimations, mad_piano_seg5_anims_05009B14],
    [BCMD_PHY, /*Wall hitbox radius*/ 40, /*Gravity*/ 0, /*Bounciness*/ -50, /*Drag strength*/ 1000, /*Friction*/ 1000, /*Buoyancy*/ 200, /*Unused*/ 0, 0],
	    [BCMD_ANIMATE, 0 ],
    [BCMD_HOME],
    [BCMD_ADD_INT, oMoveAngleYaw, 0x4000],
    [BCMD_CALL, bhv_init_room],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_mad_piano_update],
    [BCMD_LOOP_END],
];

}