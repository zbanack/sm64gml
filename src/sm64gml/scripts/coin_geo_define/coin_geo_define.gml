// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function coin_geo_define(){
/// <pygml?v=1.0&h=2273cc7bd>
// 0x1600013C
yellow_coin_geo = [
   [GCMD_SHADOW, SHADOW_CIRCLE_4_VERTS, 0xB4, 50],
   [GCMD_OPEN],
      [GCMD_SWITCH, 8, geo_switch_anim_state],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007800],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007800],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007828],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007828],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007850],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007850],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007878],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007878],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

// 0x160001A0
yellow_coin_no_shadow_geo = [
   [GCMD_START],
   [GCMD_OPEN],
      [GCMD_SWITCH, 8, geo_switch_anim_state],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007800],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007800],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007828],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007828],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007850],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007850],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007878],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007878],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

// 0x16000200
blue_coin_geo = [
   [GCMD_SHADOW, SHADOW_CIRCLE_4_VERTS, 0xB4, 80],
   [GCMD_OPEN],
      [GCMD_SWITCH, 8, geo_switch_anim_state],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078A0],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078A0],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078C8],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078C8],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078F0],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078F0],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007918],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007918],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

// 0x16000264
blue_coin_no_shadow_geo = [
   [GCMD_START],
   [GCMD_OPEN],
      [GCMD_SWITCH, 8, geo_switch_anim_state],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078A0],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078A0],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078C8],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078C8],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078F0],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030078F0],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007918],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007918],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

// 0x160002C4
red_coin_geo = [
   [GCMD_SHADOW, SHADOW_CIRCLE_4_VERTS, 0xB4, 80],
   [GCMD_OPEN],
      [GCMD_SWITCH, 8, geo_switch_anim_state],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007940],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007940],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007968],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007968],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007990],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007990],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030079B8],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030079B8],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

// 0x16000328
red_coin_no_shadow_geo = [
   [GCMD_START],
   [GCMD_OPEN],
      [GCMD_SWITCH, 8, geo_switch_anim_state],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007940],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007940],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007968],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007968],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007990],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_03007990],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030079B8],
         [GCMD_DLIST, LAYER_ALPHA, coin_seg3_dl_030079B8],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];


}