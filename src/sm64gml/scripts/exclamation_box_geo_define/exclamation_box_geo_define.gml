// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function exclamation_box_geo_define(){
	
	exclamation_box_outline_seg8_collision_08025F78 = [
	    COL_INIT(),
	    COL_VERTEX_INIT(0x8),
	    COL_VERTEX(-26, 30, -26),
	    COL_VERTEX(-26, 30, 26),
	    COL_VERTEX(-26, 52, 26),
	    COL_VERTEX(26, 30, 26),
	    COL_VERTEX(26, 52, 26),
	    COL_VERTEX(26, 30, -26),
	    COL_VERTEX(26, 52, -26),
	    COL_VERTEX(-26, 52, -26),

	    COL_TRI_INIT(SURFACE_DEFAULT, 12),
	    COL_TRI(0, 1, 2),
	    COL_TRI(1, 3, 4),
	    COL_TRI(1, 4, 2),
	    COL_TRI(5, 3, 1),
	    COL_TRI(5, 1, 0),
	    COL_TRI(6, 4, 3),
	    COL_TRI(6, 3, 5),
	    COL_TRI(7, 4, 6),
	    COL_TRI(7, 2, 4),
	    COL_TRI(0, 2, 7),
	    COL_TRI(7, 6, 5),
	    COL_TRI(7, 5, 0),
	    COL_TRI_STOP(),
	    COL_END(),
	];

/// <pygml?v=1.0&h=971dabf39>
// 0x0F000694
exclamation_box_geo = [
   [GCMD_CULL, 300],
   [GCMD_OPEN],
      [GCMD_SHADOW, SHADOW_SQUARE_PERMANENT, 0xB4, 70],
      [GCMD_OPEN],
         [GCMD_SWITCH, 4, geo_switch_anim_state],
         [GCMD_OPEN],
            [GCMD_DLIST, LAYER_OPAQUE, exclamation_box_seg8_dl_08019318],
            [GCMD_DLIST, LAYER_OPAQUE, exclamation_box_seg8_dl_08019378],
            [GCMD_DLIST, LAYER_OPAQUE, exclamation_box_seg8_dl_080193D8],
            [GCMD_DLIST, LAYER_OPAQUE, exclamation_box_seg8_dl_08019438],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

/// <pygml?v=1.0&h=1142b5c69>
exclamation_box_outline_geo = [
   [GCMD_CULL, 300],
   [GCMD_OPEN],
      [GCMD_SHADOW, SHADOW_SQUARE_PERMANENT, 0xB4, 70],
      [GCMD_OPEN],
         [GCMD_SWITCH, 4, geo_switch_anim_state],
         [GCMD_OPEN],
            [GCMD_DLIST, LAYER_TRANSPARENT, exclamation_box_outline_seg8_dl_08024F88],
            [GCMD_DLIST, LAYER_TRANSPARENT, exclamation_box_outline_seg8_dl_08024FA8],
            [GCMD_DLIST, LAYER_TRANSPARENT, exclamation_box_outline_seg8_dl_08024FC8],
            [GCMD_DLIST, LAYER_TRANSPARENT, exclamation_box_outline_seg8_dl_08024FE8],
         [GCMD_CLOSE],
         [GCMD_DLIST, LAYER_ALPHA, exclamation_box_outline_seg8_dl_080259F8],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];


}