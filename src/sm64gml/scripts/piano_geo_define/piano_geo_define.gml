// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function piano_geo_define(){
/// <pygml?v=1.0&h=68caa278e>
// 0x0C0001B4
mad_piano_geo = gList(
   [GCMD_SHADOW, SHADOW_CIRCLE_4_VERTS, 0x96, 100],
   [GCMD_OPEN],
      [GCMD_SCALE, 0x00, 16384],
      [GCMD_OPEN],
         [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, null],
         [GCMD_OPEN],
            [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mad_piano_seg5_dl_050098E8],
            [GCMD_OPEN],
               [GCMD_ANIM, LAYER_OPAQUE, -141, -546, 218, null],
               [GCMD_OPEN],
                  [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mad_piano_seg5_dl_05008CB0],
               [GCMD_CLOSE],
            [GCMD_CLOSE],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
[GCMD_CLOSE], //! more close than open nodes
[GCMD_END],
);

}