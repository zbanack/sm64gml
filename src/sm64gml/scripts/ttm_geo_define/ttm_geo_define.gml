// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ttm_geo_define(){
/// <pygml?v=1.0&h=0e9bbd823>
// 0x0E000B5C
ttm_geo_000B5C = gList(
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
               [GCMD_DLIST, LAYER_OPAQUE, ttm_seg7_dl_0701D798],
               [GCMD_DLIST, LAYER_OPAQUE, ttm_seg7_dl_0701DBB8],
               [GCMD_PARENT],
               //[GCMD_ASM, 0, geo_envfx_main],
            [GCMD_CLOSE],
         [GCMD_CLOSE],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
);

}