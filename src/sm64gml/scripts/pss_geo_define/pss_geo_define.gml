function pss_geo_define(){
/// <pygml?v=1.0&h=860618a4b>
// 0x0E000100
pss_geo_000100 = gList(
   [GCMD_SCREEN, 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2],
   [GCMD_OPEN],
      [GCMD_ZBUFFER, 0],
      [GCMD_OPEN],
         [GCMD_ORTHO, 100],
         [GCMD_OPEN],
			[GCMD_BACKGROUND_COLOR, 0x0001],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
      [GCMD_ZBUFFER, 1],
      [GCMD_OPEN],
         [GCMD_PERSP, 45, 100, 12800, geo_camera_fov],
         [GCMD_OPEN],
            [GCMD_CAMERA, 9, 0, 2000, 6000, 0, 0, 0, geo_camera_main],
            [GCMD_OPEN],
               [GCMD_DLIST, LAYER_OPAQUE, pss_seg7_dl_0700A7C0],
               [GCMD_DLIST, LAYER_OPAQUE, pss_seg7_dl_0700AFA8],
               [GCMD_DLIST, LAYER_OPAQUE, pss_seg7_dl_0700B3F0],
               [GCMD_DLIST, LAYER_OPAQUE, pss_seg7_dl_0700D338],
               [GCMD_DLIST, LAYER_TRANSPARENT, pss_seg7_dl_0700DAD8],
               [GCMD_DLIST, LAYER_OPAQUE, pss_seg7_dl_0700E2B0],
               [GCMD_DLIST, LAYER_OPAQUE_DECAL, pss_seg7_dl_0700E3E8],
               [GCMD_PARENT],
               //[GCMD_ASM, 0, geo_envfx_main],
            [GCMD_CLOSE],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);

}