// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_breakable_walls_geo_define(){
	// 0x0700FC44 - 0x0700FC7A
	wf_seg7_collision_breakable_wall_2 = [
	    COL_INIT(),
	    COL_VERTEX_INIT(0x4),
	    COL_VERTEX(0, -383, 128),
	    COL_VERTEX(0, 384, 128),
	    COL_VERTEX(-168, 384, -378),
	    COL_VERTEX(0, 384, -378),
	    COL_TRI_INIT(SURFACE_DEFAULT, 3),
	    COL_TRI(3, 2, 1),
	    COL_TRI(0, 1, 2),
	    COL_TRI(3, 1, 0),
	    COL_TRI_STOP(),
	    COL_END(),
	];
	

	// 0x0700FC0C - 0x0700FC42
	wf_seg7_collision_breakable_wall = [
	    COL_INIT(),
	    COL_VERTEX_INIT(0x4),
	    COL_VERTEX(0, 384, 128),
	    COL_VERTEX(184, 384, -378),
	    COL_VERTEX(0, 384, -378),
	    COL_VERTEX(0, -383, 128),
	    COL_TRI_INIT(SURFACE_DEFAULT, 3),
	    COL_TRI(3, 1, 0),
	    COL_TRI(0, 1, 2),
	    COL_TRI(3, 0, 2),
	    COL_TRI_STOP(),
	    COL_END(),
	];
	
	/// <pygml?v=1.0&h=c2f8c12a9>
	// 0x0E000B90
	wf_geo_000B90 = [
	   [GCMD_CULL, 690],
	   [GCMD_OPEN],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700F340],
	   [GCMD_CLOSE],
	   [GCMD_END],
	];
	
	/// <pygml?v=1.0&h=8b419eec9>
	// 0x0E000B78
	wf_geo_000B78 = [
	   [GCMD_CULL, 750],
	   [GCMD_OPEN],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700F1A8],
	   [GCMD_CLOSE],
	   [GCMD_END],
	];
}