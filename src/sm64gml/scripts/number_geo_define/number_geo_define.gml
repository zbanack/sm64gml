// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function number_geo_define(){
/// <pygml?v=1.0&h=2401b106f>
// 0x16000E14
number_geo = [
   [GCMD_START],
   [GCMD_OPEN],
      [GCMD_SWITCH, 10, geo_switch_anim_state],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_ALPHA, dl_billboard_num_0],
         [GCMD_DLIST, LAYER_ALPHA, dl_billboard_num_1],
         [GCMD_DLIST, LAYER_ALPHA, dl_billboard_num_2],
         [GCMD_DLIST, LAYER_ALPHA, dl_billboard_num_3],
         [GCMD_DLIST, LAYER_ALPHA, dl_billboard_num_4],
         [GCMD_DLIST, LAYER_ALPHA, dl_billboard_num_5],
         [GCMD_DLIST, LAYER_ALPHA, dl_billboard_num_6],
         [GCMD_DLIST, LAYER_ALPHA, dl_billboard_num_7],
         [GCMD_DLIST, LAYER_ALPHA, dl_billboard_num_8],
         [GCMD_DLIST, LAYER_ALPHA, dl_billboard_num_9],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

}