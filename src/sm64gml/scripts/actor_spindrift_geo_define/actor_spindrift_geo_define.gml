// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function actor_spindrift_geo_define(){
/// <pygml?v=1.0&h=16d6082ab>
// 0x0C000000
spindrift_geo = gList(
   [GCMD_SHADOW, SHADOW_CIRCLE_4_VERTS, 0x96, 100],
   [GCMD_OPEN],
      [GCMD_SCALE, 0x00, 32768],
      [GCMD_OPEN],
         [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, null],
         [GCMD_OPEN],
            [GCMD_ANIM, LAYER_ALPHA, 0, 0, 0, spindrift_seg5_dl_05002900],
            [GCMD_OPEN],
               [GCMD_ANIM, LAYER_OPAQUE, 100, 0, 0, spindrift_seg5_dl_05000328],
               [GCMD_ANIM, LAYER_ALPHA, 100, 0, 0, spindrift_seg5_dl_05002A20],
               [GCMD_ANIM, LAYER_ALPHA, 100, 0, 0, spindrift_seg5_dl_05002B30],
               [GCMD_ANIM, LAYER_OPAQUE, -88, -32, 0, null],
               [GCMD_OPEN],
                  [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, spindrift_seg5_dl_050002A0],
                  [GCMD_ANIM, LAYER_ALPHA, 0, 0, 0, spindrift_seg5_dl_05002D08],
                  [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, null],
                  [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, null],
                  [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, null],
                  [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, null],
               [GCMD_CLOSE],
            [GCMD_CLOSE],
            [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, null],
            [GCMD_OPEN],
               [GCMD_BILLBOARD],
               [GCMD_OPEN],
                  [GCMD_DLIST, LAYER_ALPHA, spindrift_seg5_dl_05002748],
               [GCMD_CLOSE],
            [GCMD_CLOSE],
            [GCMD_ANIM, LAYER_ALPHA, 0, 0, 0, spindrift_seg5_dl_05002830],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);

}