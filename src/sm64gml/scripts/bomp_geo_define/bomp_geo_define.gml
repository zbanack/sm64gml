// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bomp_geo_define(){
	
	// 0x0700F868 - 0x0700F934
wf_seg7_collision_small_bomp = [
    COL_INIT(),
    COL_VERTEX_INIT(0xE),
    COL_VERTEX(259, 5, -128),
    COL_VERTEX(195, 210, -128),
    COL_VERTEX(259, 210, -96),
    COL_VERTEX(259, 210, 95),
    COL_VERTEX(259, 5, 127),
    COL_VERTEX(-252, 210, -128),
    COL_VERTEX(-252, 5, -128),
    COL_VERTEX(136, 261, -77),
    COL_VERTEX(195, 210, 127),
    COL_VERTEX(136, 261, 75),
    COL_VERTEX(-252, 5, 127),
    COL_VERTEX(-252, 261, 75),
    COL_VERTEX(-252, 261, -77),
    COL_VERTEX(-252, 210, 127),
    COL_TRI_INIT(SURFACE_WALL_MISC, 18),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 3, 4),
    COL_TRI(0, 2, 3),
    COL_TRI(5, 1, 0),
    COL_TRI(5, 0, 6),
    COL_TRI(1, 7, 2),
    COL_TRI(7, 3, 2),
    COL_TRI(3, 8, 4),
    COL_TRI(3, 9, 8),
    COL_TRI(7, 9, 3),
    COL_TRI(10, 4, 8),
    COL_TRI(11, 7, 12),
    COL_TRI(11, 9, 7),
    COL_TRI(12, 7, 1),
    COL_TRI(8, 9, 11),
    COL_TRI(12, 1, 5),
    COL_TRI(13, 8, 11),
    COL_TRI(10, 8, 13),
    COL_TRI_STOP(),
    COL_END(),
];

/// <pygml?v=1.0&h=41830bbc6>
// 0x0E000A00
wf_geo_000A00 = [
   [GCMD_CULL, 500],
   [GCMD_OPEN],
      [GCMD_RENDER_RANGE, -2048, 5000],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700D708],
      [GCMD_CLOSE],
      [GCMD_RENDER_RANGE, 5000, 32767],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700D9F0],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

wf_seg7_collision_large_bomp = [
    COL_INIT(),
    COL_VERTEX_INIT(0xE),
    COL_VERTEX(259, 5, -258),
    COL_VERTEX(195, 210, -258),
    COL_VERTEX(259, 210, -194),
    COL_VERTEX(259, 210, 189),
    COL_VERTEX(259, 5, 253),
    COL_VERTEX(-252, 210, -258),
    COL_VERTEX(-252, 5, -258),
    COL_VERTEX(136, 261, -155),
    COL_VERTEX(195, 210, 253),
    COL_VERTEX(136, 261, 151),
    COL_VERTEX(-252, 5, 253),
    COL_VERTEX(-252, 261, 151),
    COL_VERTEX(-252, 261, -155),
    COL_VERTEX(-252, 210, 253),
    COL_TRI_INIT(SURFACE_WALL_MISC, 18),
    COL_TRI(12, 1, 5),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 3, 4),
    COL_TRI(0, 2, 3),
    COL_TRI(5, 1, 0),
    COL_TRI(5, 0, 6),
    COL_TRI(1, 7, 2),
    COL_TRI(7, 3, 2),
    COL_TRI(3, 8, 4),
    COL_TRI(3, 9, 8),
    COL_TRI(7, 9, 3),
    COL_TRI(10, 4, 8),
    COL_TRI(11, 7, 12),
    COL_TRI(11, 9, 7),
    COL_TRI(12, 7, 1),
    COL_TRI(10, 8, 13),
    COL_TRI(13, 8, 9),
    COL_TRI(13, 9, 11),
    COL_TRI_STOP(),
    COL_END(),
];

/// <pygml?v=1.0&h=e37e67fee>
// 0x0E000A40
wf_geo_000A40 = [
   [GCMD_CULL, 700],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700DE20],
   [GCMD_CLOSE],
   [GCMD_END],
];

}