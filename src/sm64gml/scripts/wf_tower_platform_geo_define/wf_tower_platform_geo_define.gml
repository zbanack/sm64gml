// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_tower_platform_geo_define(){
/// <pygml?v=1.0&h=cb0caec86>
// 0x0700FB94 - 0x0700FC0C
wf_seg7_collision_platform = [
    COL_INIT(),
    COL_VERTEX_INIT(0x8),
    COL_VERTEX(-214, 102, -204),
    COL_VERTEX(-214, 0, -204),
    COL_VERTEX(-214, 0, 205),
    COL_VERTEX(-214, 102, 205),
    COL_VERTEX(215, 102, -204),
    COL_VERTEX(215, 0, 205),
    COL_VERTEX(215, 102, 205),
    COL_VERTEX(215, 0, -204),
    COL_TRI_INIT(SURFACE_DEFAULT, 10),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI(4, 0, 3),
    COL_TRI(5, 2, 1),
    COL_TRI(3, 2, 5),
    COL_TRI(3, 5, 6),
    COL_TRI(4, 3, 6),
    COL_TRI(5, 1, 7),
    COL_TRI(6, 5, 7),
    COL_TRI(6, 7, 4),
    COL_TRI_STOP(),
    COL_END(),
];

/// <pygml?v=1.0&h=55b2fcffb>
// 0x0E000B10
wf_geo_000B10 = [
   [GCMD_CULL, 650],
   [GCMD_OPEN],
      [GCMD_SHADOW, SHADOW_SQUARE_PERMANENT, 0x96, 420],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700F018],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

// 0x0E000B38
wf_geo_000B38 = [
   [GCMD_CULL, 650],
   [GCMD_OPEN],
      [GCMD_SHADOW, SHADOW_SQUARE_PERMANENT, 0x96, 420],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700F018],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

// 0x0E000B60
wf_geo_000B60 = [
   [GCMD_CULL, 650],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700F018],
   [GCMD_CLOSE],
   [GCMD_END],
];

}