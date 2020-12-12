// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bullet_bill_bhv_define(){
/// <pygml?v=1.0&h=b6a1679bf>
bhvBulletBillCannon = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, wf_seg7_collision_bullet_bill_cannon],
    [BCMD_SET_FLOAT, oCollisionDistance, 300],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=3d642ed35>
bhvBulletBill = [
    [BCMD_BEGIN, OBJ_LIST_GENACTOR],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_MOVE_XZ_USING_FVEL | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_HOME],
    [BCMD_HITBOX_WITH_OFFSET, /*Radius*/ 50, /*Height*/ 50, /*Downwards offset*/ 50],
    [BCMD_INTERACT_TYPE, INTERACT_DAMAGE],
    [BCMD_SET_INT, oDamageOrCoinValue, 3],
    [BCMD_SCALE, /*Unused*/ 0, /*Field*/ 40],
    [BCMD_SET_INT, oIntangibleTimer, 0],
    [BCMD_PHY, /*Wall hitbox radius*/ 30, /*Gravity*/ 0, /*Bounciness*/ 0, /*Drag strength*/ 0, /*Friction*/ 0, /*Buoyancy*/ 0, /*Unused*/ 0, 0],
    [BCMD_CALL, bhv_bullet_bill_init],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_bullet_bill_loop],
    [BCMD_LOOP_END],
];

}