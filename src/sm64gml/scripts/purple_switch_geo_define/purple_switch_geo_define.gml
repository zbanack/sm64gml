// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function purple_switch_geo_define(){
	
	/// <pygml?v=1.0&h=638ea2251>
// Purple Switch

// 0x0800C7A8 - 0x0800C820
purple_switch_seg8_collision_0800C7A8 = cList(
    COL_INIT(),
    COL_VERTEX_INIT(0x8),
    COL_VERTEX(61, 36, -60),
    COL_VERTEX(-60, 36, -60),
    COL_VERTEX(-60, 36, 61),
    COL_VERTEX(61, 36, 61),
    COL_VERTEX(-101, 0, -101),
    COL_VERTEX(102, 0, -101),
    COL_VERTEX(-101, 0, 102),
    COL_VERTEX(102, 0, 102),

    COL_TRI_INIT(SURFACE_SWITCH, 10),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI(4, 1, 0),
    COL_TRI(4, 0, 5),
    COL_TRI(6, 1, 4),
    COL_TRI(6, 2, 1),
    COL_TRI(7, 3, 2),
    COL_TRI(7, 2, 6),
    COL_TRI(5, 0, 3),
    COL_TRI(5, 3, 7),
    COL_TRI_STOP(),
    COL_END(),
);

/// <pygml?v=1.0&h=4890679e3>
// 0x0F0004CC
purple_switch_geo = gList(
   [GCMD_CULL, 300],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, purple_switch_seg8_dl_0800C718],
   [GCMD_CLOSE],
   [GCMD_END],
);



}