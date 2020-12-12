// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function jrb_geo_define(){
/// <pygml?v=1.0&h=453926d67>
// 0x0E000A18
jrb_geo_000A18 = gList(
   [GCMD_SCREEN, 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2],
   [GCMD_OPEN],
      [GCMD_ZBUFFER, 0],
      [GCMD_OPEN],
         [GCMD_ORTHO, 100],
         [GCMD_OPEN],
            [GCMD_BACKGROUND, BACKGROUND_ABOVE_CLOUDS, geo_skybox_main],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
      [GCMD_ZBUFFER, 1],
      [GCMD_OPEN],
         [GCMD_PERSP, 45, 100, 25000, geo_camera_fov],
         [GCMD_OPEN],
            [GCMD_CAMERA, 16, 0, 2000, 6000, 0, 0, 0, geo_camera_main],
            [GCMD_OPEN],
               [GCMD_DLIST, LAYER_ALPHA, jrb_seg7_dl_07002FD0],
               [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_07004940],
               [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_07004C78],
               [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_070058C8],
               [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_070069B0],
               [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_07007570],
               [GCMD_DLIST, LAYER_ALPHA, jrb_seg7_dl_07007718],
               //[GCMD_ASM,    0, geo_movtex_pause_control],
               //[GCMD_ASM, 0x1201, geo_movtex_draw_water_regions],
               //[GCMD_ASM, 0x1205, geo_movtex_draw_water_regions],
               [GCMD_PARENT],
               //[GCMD_ASM,   14, geo_enfvx_main],
            [GCMD_CLOSE],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
      [GCMD_ZBUFFER, 0],
      [GCMD_OPEN],
         //[GCMD_ASM, 0, Geo18_802CD1E8],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);

}