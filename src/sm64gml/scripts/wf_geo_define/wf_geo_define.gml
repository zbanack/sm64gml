// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_geo_define(){
	wf_geo_000BF8 = gList(
	   [GCMD_SCREEN, 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2],
	   [GCMD_OPEN],
	      [GCMD_ZBUFFER, 0],
	      [GCMD_OPEN],
	         [GCMD_ORTHO, 100],
	         [GCMD_OPEN],
	            [GCMD_BACKGROUND, BACKGROUND_BELOW_CLOUDS, geo_skybox_main],
	         [GCMD_CLOSE],
	      [GCMD_CLOSE],
	      [GCMD_ZBUFFER, 1],
	      [GCMD_OPEN],
	         [GCMD_PERSP, 45, 100, 12800, geo_camera_fov],
	         [GCMD_OPEN ],
	            [GCMD_CAMERA, 14, 0, 2000, 6000, 0, 2000, 0, geo_camera_main],
	            [GCMD_OPEN ],
	               [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_070050C8],
	               [GCMD_DLIST, LAYER_OPAQUE_DECAL, wf_seg7_dl_070052B8],
	               [GCMD_DLIST, LAYER_TRANSPARENT_DECAL, wf_seg7_dl_07005538],
	               [GCMD_DLIST, LAYER_TRANSPARENT, wf_seg7_dl_07005690],
	               [GCMD_PARENT],
	               //GEO_ASM(   0, geo_movtex_pause_control],
	               //GEO_ASM(0x2401, geo_movtex_draw_water_regions],
	               //GEO_ASM(   0, geo_envfx_main],
	            [GCMD_CLOSE],
	         [GCMD_CLOSE],
	      [GCMD_CLOSE],
	      [GCMD_ZBUFFER, 0],
	      //[GCMD_OPEN,(],
	         //GEO_ASM(0, geo_cannon_circle_base],
	      //[GCMD_CLOSE, (],
	   [GCMD_CLOSE],
	   [GCMD_END],
	);
	
	wf_geo_0007E0 = gList(
	   [GCMD_CULL, 600],
	   [GCMD_OPEN, ],
	      [GCMD_RENDER_RANGE, -2048, 5000],
	      [GCMD_OPEN, ],
	         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_07005DD8],
	      [GCMD_CLOSE, ],
	      [GCMD_RENDER_RANGE, 5000, 32767],
	      [GCMD_OPEN, ],
	         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_07005EE8],
	      [GCMD_CLOSE, ],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E000820
	wf_geo_000820 = gList(
	   [GCMD_CULL, 1800],
	   [GCMD_OPEN, ],
	      [GCMD_RENDER_RANGE, -2048, 5000],
	      [GCMD_OPEN, ],
	         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_070064E8],
	      [GCMD_CLOSE, ],
	      [GCMD_RENDER_RANGE, 5000, 32767],
	      [GCMD_OPEN, ],
	         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_070065F8],
	      [GCMD_CLOSE, ],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E000860
	wf_geo_000860 = gList(
	   [GCMD_CULL, 1400],
	   [GCMD_OPEN, ],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_07006820],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E000878
	wf_geo_000878 = gList(
	   [GCMD_CULL, 9000],
	   [GCMD_OPEN, ],
	      [GCMD_DLIST, LAYER_ALPHA, wf_seg7_dl_07007220],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E000890
	wf_geo_000890 = gList(
	   [GCMD_CULL, 1000],
	   [GCMD_OPEN, ],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_07007518],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E0008A8
	wf_geo_0008A8 = gList(
	   [GCMD_CULL, 2700],
	   [GCMD_OPEN, ],
	      [GCMD_RENDER_RANGE, -2048, 5000],
	      [GCMD_OPEN, ],
	         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_070087B0],
	      [GCMD_CLOSE, ],
	      [GCMD_RENDER_RANGE, 5000, 32767],
	      [GCMD_OPEN, ],
	         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_07008FE8],
	      [GCMD_CLOSE, ],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E0008E8
	wf_geo_0008E8 = gList(
	   [GCMD_CULL, 400],
	   [GCMD_OPEN, ],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_07009278],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E000900
	wf_geo_000900 = gList(
	   [GCMD_CULL, 1600],
	   [GCMD_OPEN, ],
	      [GCMD_RENDER_RANGE, -2048, 5000],
	      [GCMD_OPEN, ],
	         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_07009780],
	      [GCMD_CLOSE, ],
	      [GCMD_RENDER_RANGE, 5000, 32767],
	      [GCMD_OPEN, ],
	         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_07009890],
	      [GCMD_CLOSE, ],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E000940
	wf_geo_000940 = gList(
	   [GCMD_CULL, 800],
	   [GCMD_OPEN, ],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_07009DB0],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E000AE0
	wf_geo_000AE0 = gList(
	   [GCMD_CULL, 2000],
	   [GCMD_OPEN, ],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700A170],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E000958
	wf_geo_000958 = gList(
	   [GCMD_CULL, 2000],
	   [GCMD_OPEN, ],
	      [GCMD_RENDER_RANGE, -2000, 8000],
	      [GCMD_OPEN, ],
	         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700ABA0],
	         [GCMD_DLIST, LAYER_TRANSPARENT_DECAL, wf_seg7_dl_0700AFB8],
	      [GCMD_CLOSE, ],
	      [GCMD_RENDER_RANGE, 8000, 20000],
	      [GCMD_OPEN, ],
	         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700AEC8],
	      [GCMD_CLOSE, ],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E0009A0
	wf_geo_0009A0 = gList(
	   [GCMD_CULL, 3000],
	   [GCMD_OPEN, ],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700BA28],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E0009B8
	wf_geo_0009B8 = gList(
	   [GCMD_CULL, 1100],
	   [GCMD_OPEN, ],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700BF50],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);

	// 0x0E0009D0
	wf_geo_0009D0 = gList(
	   [GCMD_CULL, 1200],
	   [GCMD_OPEN, ],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700D028],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);
  
	// 0x0E0009E8
	wf_geo_0009E8 = gList(
	   [GCMD_CULL, 2700],
	   [GCMD_OPEN, ],
	      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700D300],
	   [GCMD_CLOSE, ],
	   [GCMD_END, ],
	);
	



}
