// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ccm_geo1_define(){
/// <pygml?v=1.0&h=cebc40f87>
// 0x0E00042C
ccm_geo_00042C = gList(
   [GCMD_CULL, 800],
   [GCMD_OPEN],
      [GCMD_RENDER_RANGE, -1000, 4000],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, ccm_seg7_dl_0700E708],
         [GCMD_DLIST, LAYER_ALPHA, ccm_seg7_dl_0700E970],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);
/// <pygml?v=1.0&h=98b5b14ec>
// 0x0E00045C
ccm_geo_00045C = gList(
   [GCMD_CULL, 900],
   [GCMD_OPEN],
      [GCMD_RENDER_RANGE, -1000, 7000],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, ccm_seg7_dl_0700F440],
         [GCMD_DLIST, LAYER_ALPHA, ccm_seg7_dl_0700F650],
         [GCMD_DLIST, LAYER_TRANSPARENT, ccm_seg7_dl_0700F780],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);
/// <pygml?v=1.0&h=970d5d631>
// 0x0E000494
ccm_geo_000494 = gList(
   [GCMD_CULL, 400],
   [GCMD_OPEN],
      [GCMD_RENDER_RANGE, -500, 7000],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, ccm_seg7_dl_0700FB00],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);
/// <pygml?v=1.0&h=970d5d631>
// 0x0E000494
ccm_geo_000494 = gList(
   [GCMD_CULL, 400],
   [GCMD_OPEN],
      [GCMD_RENDER_RANGE, -500, 7000],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, ccm_seg7_dl_0700FB00],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);
/// <pygml?v=1.0&h=bb516b19c>
// 0x0E0004BC
ccm_geo_0004BC = gList(
   [GCMD_CULL, 800],
   [GCMD_OPEN],
      [GCMD_RENDER_RANGE, -1000, 7000],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_TRANSPARENT, ccm_seg7_dl_0700FD08],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);
/// <pygml?v=1.0&h=b96430224>
// 0x0E0004E4
ccm_geo_0004E4 = gList(
   [GCMD_CULL, 3500],
   [GCMD_OPEN],
      [GCMD_RENDER_RANGE, -3000, 6000],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, ccm_seg7_dl_07010660],
         [GCMD_DLIST, LAYER_ALPHA, ccm_seg7_dl_070109D0],
         [GCMD_DLIST, LAYER_TRANSPARENT, ccm_seg7_dl_07010B50],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);

/// <pygml?v=1.0&h=6104de42d>
ccm_geo_00051C = gList(
   [GCMD_SCREEN, 10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2],
   [GCMD_OPEN],
      [GCMD_ZBUFFER, 0],
      [GCMD_OPEN],
         [GCMD_ORTHO, 100],
         [GCMD_OPEN],
            [GCMD_BACKGROUND, BACKGROUND_SNOW_MOUNTAINS, geo_skybox_main],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
      [GCMD_ZBUFFER, 1],
      [GCMD_OPEN],
         [GCMD_PERSP, 45, 100, 12800, geo_camera_fov],
         [GCMD_OPEN],
            [GCMD_CAMERA, 1, 0, 2000, 6000, 0, 0, 0, geo_camera_main],
            [GCMD_OPEN],
               [GCMD_DLIST, LAYER_OPAQUE, ccm_seg7_dl_0700B090],
               [GCMD_DLIST, LAYER_OPAQUE, ccm_seg7_dl_0700B1D8],
               [GCMD_DLIST, LAYER_OPAQUE, ccm_seg7_dl_0700C380],
               [GCMD_DLIST, LAYER_ALPHA, ccm_seg7_dl_0700D578],
               [GCMD_DLIST, LAYER_TRANSPARENT_DECAL, ccm_seg7_dl_0700DDF0],
               //[GCMD_ASM,    0, geo_movtex_pause_control],
               //[GCMD_ASM, 0x0501, geo_movtex_draw_water_regions],
               [GCMD_PARENT],
               //[GCMD_ASM,    1, geo_envfx_main],
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