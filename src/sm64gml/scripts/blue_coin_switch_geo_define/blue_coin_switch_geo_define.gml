// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function blue_coin_switch_geo_define(){
	
	// 0x08000E98 - 0x08000F10
blue_coin_switch_seg8_collision_08000E98 = [
    COL_INIT(),
    COL_VERTEX_INIT(0x8),
    COL_VERTEX(26, 0, 26),
    COL_VERTEX(26, 26, 26),
    COL_VERTEX(-25, 26, 26),
    COL_VERTEX(-25, 0, 26),
    COL_VERTEX(26, 0, -25),
    COL_VERTEX(26, 26, -25),
    COL_VERTEX(-25, 26, -25),
    COL_VERTEX(-25, 0, -25),

    COL_TRI_INIT(SURFACE_DEFAULT, 10),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI(4, 5, 1),
    COL_TRI(5, 6, 2),
    COL_TRI(5, 2, 1),
    COL_TRI(7, 6, 5),
    COL_TRI(7, 5, 4),
    COL_TRI(3, 6, 7),
    COL_TRI(3, 2, 6),
    COL_TRI(4, 1, 0),
    COL_TRI_STOP(),
    COL_END(),
];

/// <pygml?v=1.0&h=c6cbc1c11>
// 0x0F000000
blue_coin_switch_geo = [
   [GCMD_CULL, 300],
   [GCMD_OPEN],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, blue_coin_switch_seg8_dl_08000E08],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

}