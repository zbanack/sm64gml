// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function blue_coin_switch_bhv_define(){
/// <pygml?v=1.0&h=820f7f509>
bhvBlueCoinSwitch = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, blue_coin_switch_seg8_collision_08000E98],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_blue_coin_switch_loop],
    [BCMD_LOOP_END],
];

}