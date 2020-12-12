// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_tower_door_geo_define(){
/// <pygml?v=1.0&h=272de80fe>
// 0x0700FD00 - 0x0700FD30
wf_seg7_collision_tower_door = [
    COL_INIT(),
    COL_VERTEX_INIT(0x4),
    COL_VERTEX(0, 0, -107),
    COL_VERTEX(0, 0, 108),
    COL_VERTEX(0, 205, 108),
    COL_VERTEX(0, 205, -107),
    COL_TRI_INIT(SURFACE_DEFAULT, 2),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI_STOP(),
    COL_END(),
];
/// <pygml?v=1.0&h=e698309d5>
// 0x0E000BE0
wf_geo_000BE0 = [
   [GCMD_CULL, 320],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, wf_seg7_dl_0700F7F8],
   [GCMD_CLOSE],
   [GCMD_END],
];

}