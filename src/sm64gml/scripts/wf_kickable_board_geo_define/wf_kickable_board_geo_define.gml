// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_kickable_board_geo_define(){
/// <pygml?v=1.0&h=cfb8a0cc9>
// 0x0700FC7C - 0x0700FD00
wf_seg7_collision_kickable_board = [
    COL_INIT(),
    COL_VERTEX_INIT(0x8),
    COL_VERTEX(-96, 0, 0),
    COL_VERTEX(-96, 1178, 77),
    COL_VERTEX(-96, 1178, 0),
    COL_VERTEX(95, 1178, 77),
    COL_VERTEX(95, 1178, 0),
    COL_VERTEX(95, 0, 0),
    COL_VERTEX(95, 0, 77),
    COL_VERTEX(-96, 0, 77),
    COL_TRI_INIT(SURFACE_WALL_MISC, 12),
    COL_TRI(0, 1, 2),
    COL_TRI(2, 1, 3),
    COL_TRI(2, 3, 4),
    COL_TRI(2, 4, 5),
    COL_TRI(2, 5, 0),
    COL_TRI(4, 3, 6),
    COL_TRI(4, 6, 5),
    COL_TRI(0, 7, 1),
    COL_TRI(3, 1, 7),
    COL_TRI(3, 7, 6),
    COL_TRI(5, 6, 7),
    COL_TRI(5, 7, 0),
    COL_TRI_STOP(),
    COL_END(),
];

/// <pygml?v=1.0&h=d037a0e93>
// 0x0E000BA8
wf_geo_000BA8 = [
   [GCMD_CULL, 1300],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700F610],
      [GCMD_DLIST, LAYER_TRANSPARENT_DECAL, wf_seg7_dl_0700F6C0],
   [GCMD_CLOSE],
   [GCMD_END],
];

// 0x0E000BC8
wf_geo_000BC8 = [
   [GCMD_CULL, 1300],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700F610],
   [GCMD_CLOSE],
   [GCMD_END],
];

}