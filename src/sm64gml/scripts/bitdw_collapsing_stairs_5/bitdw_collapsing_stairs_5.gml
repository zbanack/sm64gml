// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bitdw_collapsing_stairs_5(){
/// <pygml?v=1.0&h=6c8c718b4>
// 0x0700D208 - 0x0700D308
bitdw_seg7_vertex_0700D208 = vList(
    Vtx([  -716,    256,    307], 0, [  1948,      0], [0x65, 0xff, 0xb2, 0xff]),
    Vtx([ -1023,      0,   -306], 0, [    32,    926], [0x65, 0xff, 0xb2, 0xff]),
    Vtx([ -1023,      0,    307], 0, [  1948,    926], [0x65, 0xff, 0xb2, 0xff]),
    Vtx([  -716,    256,   -306], 0, [    32,      0], [0x65, 0xff, 0xb2, 0xff]),
    Vtx([  -409,    512,   -306], 0, [    32,      0], [0x65, 0xff, 0xcc, 0xff]),
    Vtx([  -716,    256,   -306], 0, [    32,    926], [0x65, 0xff, 0xcc, 0xff]),
    Vtx([  -716,    256,    307], 0, [  1948,    926], [0x65, 0xff, 0xcc, 0xff]),
    Vtx([  -409,    512,    307], 0, [  1948,      0], [0x65, 0xff, 0xcc, 0xff]),
    Vtx([  -101,    768,    307], 0, [  1948,      0], [0x65, 0xff, 0xe5, 0xff]),
    Vtx([  -409,    512,   -306], 0, [    32,    926], [0x65, 0xff, 0xe5, 0xff]),
    Vtx([  -409,    512,    307], 0, [  1948,    926], [0x65, 0xff, 0xe5, 0xff]),
    Vtx([  -101,    768,   -306], 0, [    32,      0], [0x65, 0xff, 0xe5, 0xff]),
    Vtx([   205,   1024,    307], 0, [  1948,      0], [0x65, 0xe5, 0xff, 0xff]),
    Vtx([   205,   1024,   -306], 0, [    32,      0], [0x65, 0xe5, 0xff, 0xff]),
    Vtx([  -101,    768,   -306], 0, [    32,    926], [0x65, 0xe5, 0xff, 0xff]),
    Vtx([  -101,    768,    307], 0, [  1948,    926], [0x65, 0xe5, 0xff, 0xff]),
);

// 0x0700D308 - 0x0700D348
bitdw_seg7_vertex_0700D308 = vList(
    Vtx([ -1023,      0,    307], 0, [     0,      0], [0xb7, 0xcd, 0xba, 0xff]),
    Vtx([ -1023,      0,   -306], 0, [ -1052,    990], [0xb7, 0xcd, 0xba, 0xff]),
    Vtx([ -1637,      0,   -306], 0, [ -2074,      0], [0xb7, 0xcd, 0xba, 0xff]),
    Vtx([ -1637,      0,    307], 0, [ -1052,  -1054], [0xb7, 0xcd, 0xba, 0xff]),
);

// 0x0700D348 - 0x0700D3B0
bitdw_seg7_dl_0700D348 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09008000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bitdw_seg7_vertex_0700D208, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700D3B0 - 0x0700D3E8
bitdw_seg7_dl_0700D3B0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09007000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bitdw_seg7_vertex_0700D308, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700D3E8 - 0x0700D460
bitdw_seg7_dl_0700D3E8 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bitdw_seg7_dl_0700D348),
    gsSPDisplayList(bitdw_seg7_dl_0700D3B0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPEndDisplayList(),
);

/// <pygml?v=1.0&h=f0928bc34>
// 0x0700FD9C - 0x0700FE30
bitdw_seg7_collision_0700FD9C = [
    COL_INIT(),
    COL_VERTEX_INIT(0xC),
    COL_VERTEX(-101, 768, 307),
    COL_VERTEX(-101, 768, -306),
    COL_VERTEX(-409, 512, -306),
    COL_VERTEX(-409, 512, 307),
    COL_VERTEX(-716, 256, -306),
    COL_VERTEX(-716, 256, 307),
    COL_VERTEX(205, 1024, 307),
    COL_VERTEX(205, 1024, -306),
    COL_VERTEX(-1023, 0, -306),
    COL_VERTEX(-1023, 0, 307),
    COL_VERTEX(-1637, 0, -306),
    COL_VERTEX(-1637, 0, 307),
    COL_TRI_INIT(SURFACE_DEFAULT, 2),
    COL_TRI(9, 8, 10),
    COL_TRI(9, 10, 11),
    COL_TRI_INIT(SURFACE_VERY_SLIPPERY, 8),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI(2, 4, 5),
    COL_TRI(2, 5, 3),
    COL_TRI(6, 1, 0),
    COL_TRI(6, 7, 1),
    COL_TRI(5, 4, 8),
    COL_TRI(5, 8, 9),
    COL_TRI_STOP(),
    COL_END(),
];

/// <pygml?v=1.0&h=e5f85a429>
// 0x0E000600
geo_bitdw_000600 = [
   [GCMD_CULL, 2000],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, bitdw_seg7_dl_0700D3E8],
   [GCMD_CLOSE],
   [GCMD_END],
];

}