// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_sliding_platform_geo_define(){
	wf_seg7_collision_sliding_brick_platform = [
	    COL_INIT(),
	    COL_VERTEX_INIT(0x6),
	    COL_VERTEX(256, 0, 256),
	    COL_VERTEX(256, -50, -255),
	    COL_VERTEX(256, 0, -255),
	    COL_VERTEX(256, -50, 256),
	    COL_VERTEX(-255, 0, -255),
	    COL_VERTEX(-255, 0, 256),
	    COL_TRI_INIT(SURFACE_DEFAULT, 4),
	    COL_TRI(0, 1, 2),
	    COL_TRI(0, 3, 1),
	    COL_TRI(0, 4, 5),
	    COL_TRI(0, 2, 4),
	    COL_TRI_STOP(),
	    COL_END(),
	];
	
	/// <pygml?v=1.0&h=8ac843fc7>
	// 0x0E000A98
	wf_geo_000A98 = [
	   [GCMD_CULL, 500],
	   [GCMD_OPEN],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700EB40],
	   [GCMD_CLOSE],
	   [GCMD_END],
	];
}