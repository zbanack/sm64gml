// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function star_geo_define(){
	/// <pygml?v=1.0&h=12570c0dc>
	// 0x16000EA0
	star_geo = [
	   [GCMD_SHADOW, SHADOW_CIRCLE_4_VERTS, 0x9B, 100],
	   [GCMD_OPEN],
	      [GCMD_SCALE, 0x00, 16384],
	      [GCMD_OPEN],
	         [GCMD_DLIST, LAYER_OPAQUE, star_seg3_dl_0302B870],
	         [GCMD_DLIST, LAYER_ALPHA, star_seg3_dl_0302BA18],
	      [GCMD_CLOSE],
	   [GCMD_CLOSE],
	   [GCMD_END],
	];


}