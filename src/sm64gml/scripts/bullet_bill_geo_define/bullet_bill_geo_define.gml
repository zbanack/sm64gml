// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bullet_bill_geo_define(){
/// <pygml?v=1.0&h=683d12df9>
// 0x0C000264
bullet_bill_geo = [
   [GCMD_START],
   [GCMD_OPEN],
      [GCMD_SHADOW, SHADOW_SQUARE_PERMANENT, 0x96, 400],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, bullet_bill_seg5_dl_0500E8A8],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

}