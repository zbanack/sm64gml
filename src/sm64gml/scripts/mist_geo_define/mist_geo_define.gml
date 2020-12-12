// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mist_geo_define(){
/// <pygml?v=1.0&h=9152cda20>
// 0x16000000
mist_geo = [
   [GCMD_START],
   [GCMD_OPEN],
      //[GCMD_ASM, 0, geo_update_layer_transparency],
      [GCMD_DLIST, LAYER_TRANSPARENT, mist_seg3_dl_03000880],
   [GCMD_CLOSE],
   [GCMD_END],
];

/// <pygml?v=1.0&h=85f7fed38>
// 0x16000020
white_puff_geo = [
   [GCMD_START],
   [GCMD_OPEN],
      //[GCMD_ASM, 0, geo_update_layer_transparency],
      [GCMD_DLIST, LAYER_TRANSPARENT, mist_seg3_dl_03000920],
   [GCMD_CLOSE],
   [GCMD_END],
];

}