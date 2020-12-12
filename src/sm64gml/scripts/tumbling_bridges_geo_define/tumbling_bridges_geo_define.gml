// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tumbling_bridges_geo_define(){
/// <pygml?v=1.0&h=c0a03bd70>
// 0x0700FAEC - 0x0700FB1C
wf_seg7_collision_tumbling_bridge = [
    COL_INIT(),
    COL_VERTEX_INIT(0x4),
    COL_VERTEX(-127, 64, -63),
    COL_VERTEX(-127, 64, 64),
    COL_VERTEX(215, 64, 64),
    COL_VERTEX(215, 64, -63),
    COL_TRI_INIT(SURFACE_DEFAULT, 2),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI_STOP(),
    COL_END(),
];
/// <pygml?v=1.0&h=c9bde5e1f>
// 0x0E000AB0
wf_geo_000AB0 = [
   [GCMD_CULL, 400],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700E0F0],
   [GCMD_CLOSE],
   [GCMD_END],
];

/// <pygml?v=1.0&h=540126699>
// 0x0E000AC8
wf_geo_000AC8 = [
   [GCMD_CULL, 800],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700E3D0],
   [GCMD_CLOSE],
   [GCMD_END],
];


}