// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function goomba_geo_define(){

	/// <pygml?v=1.0&h=7cfec7a4c>
	// 0x0F0006E4
	goomba_geo = [
	   [GCMD_SHADOW, SHADOW_CIRCLE_PLAYER, 0x96, 100],
	   [GCMD_OPEN],
	      [GCMD_SCALE, 0x00, 16384],
	      [GCMD_OPEN],
	         [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, goomba_seg8_dl_0801D760],
	         [GCMD_OPEN],
	            [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, null],
	            [GCMD_OPEN],
	               [GCMD_BILLBOARD],
	               [GCMD_OPEN],
	                  [GCMD_DLIST, LAYER_ALPHA, goomba_seg8_dl_0801B690],
	               [GCMD_CLOSE],
	            [GCMD_CLOSE],
	            [GCMD_OPEN],
	               [GCMD_SWITCH, 2, geo_switch_anim_state],
	               [GCMD_OPEN],
	                  [GCMD_ANIM, LAYER_OPAQUE, 48, 0, 0, goomba_seg8_dl_0801B5C8],
	                  [GCMD_ANIM, LAYER_OPAQUE, 48, 0, 0, goomba_seg8_dl_0801B5F0],
	               [GCMD_CLOSE],
	               [GCMD_ANIM, LAYER_OPAQUE, -60, -16, 45, null],
	               [GCMD_OPEN],
	                  [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, goomba_seg8_dl_0801CE20],
	               [GCMD_CLOSE],
	               [GCMD_ANIM, LAYER_OPAQUE, -60, -16, -45, null],
	               [GCMD_OPEN],
	                  [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, goomba_seg8_dl_0801CF78],
	               [GCMD_CLOSE],
	            [GCMD_CLOSE],
	         [GCMD_CLOSE],
	      [GCMD_CLOSE],
	   [GCMD_CLOSE],
	   [GCMD_END],
	];

}