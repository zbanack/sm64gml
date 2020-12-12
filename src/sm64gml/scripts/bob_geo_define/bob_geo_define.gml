function bob_geo_define() {
	bob_geo_000488 = gList(
   [GCMD_SCREEN, 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2],
   [GCMD_OPEN],
     [GCMD_ZBUFFER, 0],
     [GCMD_OPEN],
         [GCMD_ORTHO, 100],
         [GCMD_OPEN],
            [GCMD_BACKGROUND, BACKGROUND_OCEAN_SKY, geo_skybox_main],
         [GCMD_CLOSE],
     [GCMD_CLOSE],
      [GCMD_ZBUFFER, 1],
      [GCMD_OPEN],
         [GCMD_PERSP, 45, 100, 20000, geo_camera_fov],
         [GCMD_OPEN],
            [GCMD_CAMERA, 16, 0, 2000, 6000, 3072, 0, -4608, geo_camera_main],
            [GCMD_OPEN],
               [GCMD_DLIST, LAYER_OPAQUE, bob_seg7_dl_07004390],
               [GCMD_DLIST, LAYER_OPAQUE, bob_seg7_dl_07009D80],
               [GCMD_DLIST, LAYER_TRANSPARENT_DECAL, bob_seg7_dl_0700A470],
               [GCMD_DLIST, LAYER_ALPHA, bob_seg7_dl_0700A920],
               [GCMD_DLIST, LAYER_OPAQUE, bob_seg7_dl_0700DD18],
               [GCMD_DLIST, LAYER_OPAQUE, bob_seg7_dl_0700E338],
               [GCMD_PARENT],
               //[GCMD_ASM(0, [GCMD_envfx_main)],
            [GCMD_CLOSE],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
      //[GCMD_ZBUFFER, 0],
     // [GCMD_OPEN],
        // [GCMD_ASM(0, [GCMD_cannon_circle_base)],
     // [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);
}