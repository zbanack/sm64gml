// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ssl_geo_define(){
/// <pygml?v=1.0&h=4452517de>
// 0x0E0005C0
ssl_geo_0005C0 = gList(
   [GCMD_CULL, 2000],
   [GCMD_OPEN],
      //[GCMD_ASM, 0x801, geo_movtex_draw_colored_2_no_update],
   [GCMD_CLOSE],
   [GCMD_END],
);
/// <pygml?v=1.0&h=5859eba78>
// 0x0E000648
ssl_geo_000648 = gList(
   [GCMD_SCREEN, 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2],
   [GCMD_OPEN],
      [GCMD_ZBUFFER, 0],
      [GCMD_OPEN],
         [GCMD_ORTHO, 100],
         [GCMD_OPEN],
            [GCMD_BACKGROUND, BACKGROUND_DESERT, geo_skybox_main],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
      [GCMD_ZBUFFER, 1],
      [GCMD_OPEN],
         [GCMD_PERSP, 45, 100, 20000, geo_camera_fov],
         [GCMD_OPEN],
            [GCMD_CAMERA, 1, 0, 2000, 6000, -2048, 0, -1024, geo_camera_main],
            [GCMD_OPEN],
               [GCMD_DLIST, LAYER_OPAQUE, ssl_seg7_dl_07009F48],
               [GCMD_DLIST, LAYER_OPAQUE, ssl_seg7_dl_0700BA78],
               [GCMD_DLIST, LAYER_ALPHA, ssl_seg7_dl_0700BC18],
               [GCMD_DLIST, LAYER_TRANSPARENT_DECAL, ssl_seg7_dl_0700BD00],
               //[GCMD_ASM, 0x0801, geo_movtex_update_horizontal],
               //[GCMD_ASM,    0, geo_movtex_pause_control],
               //[GCMD_ASM, 0x0801, geo_movtex_draw_water_regions],
               //[GCMD_ASM, 0x0851, geo_movtex_draw_water_regions],
               //[GCMD_ASM, 0x0801, geo_movtex_draw_colored],
               //[GCMD_ASM, 0x0802, geo_movtex_draw_colored],
               //[GCMD_ASM, 0x0803, geo_movtex_draw_colored],
               [GCMD_PARENT],
               //[GCMD_ASM,    0, geo_envfx_main],
            [GCMD_CLOSE],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
      [GCMD_ZBUFFER, 0],
      [GCMD_OPEN],
         //[GCMD_ASM, 0, geo_cannon_circle_base],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);

}