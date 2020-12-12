// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function coin_bhv_define(){
/// <pygml?v=1.0&h=ab09117e7>
bhvYellowCoin = [
    [BCMD_BEGIN,  OBJ_LIST_LEVEL],
    // Yellow coin - common:
    [BCMD_CYCL],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_CALL, bhv_yellow_coin_init],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_yellow_coin_loop],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=647ee4e78>
bhvSingleCoinGetsSpawned = [
    [BCMD_BEGIN, OBJ_LIST_LEVEL],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_CYCL],
    [BCMD_CALL, bhv_coin_init],
    [BCMD_PHY, /*Wall hitbox radius*/ 30, /*Gravity*/ -400, /*Bounciness*/ -70, /*Drag strength*/ 1000, /*Friction*/ 1000, /*Buoyancy*/ 200, /*Unused*/ 0, 0],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_coin_loop],
        [BCMD_ADD_INT, oAnimState, 1],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=ddbacdc77>
bhvGoldenCoinSparkles = [ // @z changed
    [BCMD_BEGIN, OBJ_LIST_DEFAULT],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_REPEAT_BEGIN, 3],
        [BCMD_CALL, bhv_golden_coin_sparkles_loop],
    [BCMD_REPEAT_END],
    [BCMD_DEACTIVATE],
];

/// <pygml?v=1.0&h=5245ceb2e>
bhvCoinSparkles = [
    [BCMD_BEGIN, OBJ_LIST_DEFAULT],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_CYCL],
    [BCMD_SET_FLOAT, oGraphYOffset, 25],
    [BCMD_SET_INT, oAnimState, -1],
    [BCMD_REPEAT_BEGIN, 8],
        [BCMD_ADD_INT, oAnimState, 1],
    [BCMD_REPEAT_END],
    [BCMD_REPEAT_BEGIN, 2],
        [BCMD_CALL, bhv_coin_sparkles_loop],
    [BCMD_REPEAT_END],
    [BCMD_DEACTIVATE],
];

/// <pygml?v=1.0&h=ee2a4b84d>
bhvRedCoin = [
    [BCMD_BEGIN, OBJ_LIST_LEVEL],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_CYCL],
    [BCMD_SET_INT, oIntangibleTimer, 0],
    [BCMD_SET_INT, oAnimState, -1],
    [BCMD_CALL, bhv_init_room],
    [BCMD_CALL, bhv_red_coin_init],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_red_coin_loop],
        [BCMD_ADD_INT, oAnimState, 1],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=8d7b50711>
bhvCoinFormation = [
    [BCMD_BEGIN, OBJ_LIST_SPAWNER],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_CALL, bhv_coin_formation_init],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_coin_formation_loop],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=158ec362d>
bhvCoinFormationSpawn = [
    [BCMD_BEGIN, OBJ_LIST_LEVEL],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_CYCL],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_coin_formation_spawn_loop],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=36885ffff>
bhvHiddenBlueCoin = [
    [BCMD_BEGIN, OBJ_LIST_LEVEL],
    [BCMD_SET_INT, oInteractType, INTERACT_COIN],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_ACTIVE_FROM_AFAR | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_CYCL],
    [BCMD_HITBOX, /*Radius*/ 100, /*Height*/ 64],
    [BCMD_SET_INT, oDamageOrCoinValue, 5],
    [BCMD_SET_INT, oIntangibleTimer, 0],
    [BCMD_SET_INT, oAnimState, -1],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_hidden_blue_coin_loop],
        [BCMD_ADD_INT, oAnimState, 1],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=3a40da653>
bhvSingleCoinGetsSpawned = [
    [BCMD_BEGIN, OBJ_LIST_LEVEL],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_CYCL],
    [BCMD_CALL, bhv_coin_init],
    [BCMD_PHY, /*Wall hitbox radius*/ 30, /*Gravity*/ -400, /*Bounciness*/ -70, /*Drag strength*/ 1000, /*Friction*/ 1000, /*Buoyancy*/ 200, /*Unused*/ 0, 0],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_coin_loop],
        [BCMD_ADD_INT, oAnimState, 1],
    [BCMD_LOOP_END],
];


}