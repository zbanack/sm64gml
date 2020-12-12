// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_rotating_wooden_platform_geo_define(){
/// <pygml?v=1.0&h=f50d2dee3>
// 0x0700FA00 - 0x0700FAA2
wf_seg7_collision_clocklike_rotation = [
    COL_INIT(),
    COL_VERTEX_INIT(0xA),
    COL_VERTEX(0, 0, -204),
    COL_VERTEX(-176, 0, -101),
    COL_VERTEX(-176, 0, 102),
    COL_VERTEX(0, 0, 205),
    COL_VERTEX(177, 0, 102),
    COL_VERTEX(177, 0, -101),
    COL_VERTEX(0, -127, 0),
    COL_VERTEX(768, -127, 0),
    COL_VERTEX(768, 0, -101),
    COL_VERTEX(768, 0, 102),
    COL_TRI_INIT(SURFACE_DEFAULT, 15),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI(0, 3, 4),
    COL_TRI(0, 4, 5),
    COL_TRI(3, 6, 4),
    COL_TRI(2, 6, 3),
    COL_TRI(1, 6, 2),
    COL_TRI(0, 6, 1),
    COL_TRI(8, 7, 5),
    COL_TRI(5, 6, 0),
    COL_TRI(6, 7, 9),
    COL_TRI(4, 6, 9),
    COL_TRI(5, 4, 9),
    COL_TRI(5, 9, 8),
    COL_TRI(7, 6, 5),
    COL_TRI_STOP(),
    COL_END(),
];

/// <pygml?v=1.0&h=448994518>
// 0x0E000A58
wf_geo_000A58 = [
   [GCMD_CULL, 1500],
   [GCMD_OPEN],
      [GCMD_RENDER_RANGE, -2048, 5000],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700E760],
      [GCMD_CLOSE],
      [GCMD_RENDER_RANGE, 5000, 32767],
      [GCMD_OPEN],
         [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700E9B8],
      [GCMD_CLOSE],
   [GCMD_CLOSE],
   [GCMD_END],
];

/// <pygml?v=1.0&h=226165401>
// 0x0700FD30 - 0x0700FE12
wf_seg7_collision_rotating_platform = [
    COL_INIT(),
    COL_VERTEX_INIT(0xD),
    COL_VERTEX(-442, 0, -255),
    COL_VERTEX(0, 0, 512),
    COL_VERTEX(256, 0, 443),
    COL_VERTEX(-255, 0, 443),
    COL_VERTEX(-442, 0, 256),
    COL_VERTEX(-511, 0, 0),
    COL_VERTEX(443, 0, 256),
    COL_VERTEX(0, 0, -511),
    COL_VERTEX(-255, 0, -442),
    COL_VERTEX(256, 0, -442),
    COL_VERTEX(443, 0, -255),
    COL_VERTEX(512, 0, 0),
    COL_VERTEX(0, -255, 0),
    COL_TRI_INIT(SURFACE_DEFAULT, 12),
    COL_TRI(8, 12, 0),
    COL_TRI(8, 7, 12),
    COL_TRI(10, 11, 12),
    COL_TRI(9, 10, 12),
    COL_TRI(7, 9, 12),
    COL_TRI(0, 12, 5),
    COL_TRI(11, 6, 12),
    COL_TRI(4, 5, 12),
    COL_TRI(3, 4, 12),
    COL_TRI(1, 3, 12),
    COL_TRI(2, 1, 12),
    COL_TRI(6, 2, 12),
    COL_TRI_INIT(SURFACE_NOISE_DEFAULT, 10),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 3, 1),
    COL_TRI(0, 4, 3),
    COL_TRI(0, 5, 4),
    COL_TRI(0, 2, 6),
    COL_TRI(0, 7, 8),
    COL_TRI(0, 9, 7),
    COL_TRI(0, 10, 9),
    COL_TRI(0, 11, 10),
    COL_TRI(0, 6, 11),
    COL_TRI_STOP(),
    COL_END(),
];


}