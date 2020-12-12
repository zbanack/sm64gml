// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bitdw_wooden_bridge_and_fences(){
/// <pygml?v=1.0&h=75159b7d6>
// 0x07003370 - 0x07003460
bitdw_seg7_vertex_07003370 = vList(
    Vtx([    51,    410,  -1228], 0, [   912,    -30], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([ -1021,    492,  -1393], 0, [-10012,    -24], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([ -1021,    390,  -1393], 0, [ -9878,    990], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([    51,    410,  -1228], 0, [   990,      0], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([   256,    307,   -818], 0, [ -3578,    990], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([   264,    409,   -818], 0, [ -3614,    -28], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([    51,    307,  -1228], 0, [   990,    990], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([   264,    409,   -818], 0, [   786,      0], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([   162,    417,   -818], 0, [  -234,      0], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([   154,    315,   -818], 0, [  -234,    990], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([   256,    307,   -818], 0, [   786,    990], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([  -146,    441,   -818], 0, [   800,    -30], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([ -1074,    512,   -818], 0, [ -8488,    -28], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([ -1074,    410,   -818], 0, [ -8410,    990], [0xaf, 0xce, 0x16, 0xff]),
    Vtx([  -146,    338,   -818], 0, [   878,    990], [0xaf, 0xce, 0x16, 0xff]),
);

// 0x07003460 - 0x070034E0
bitdw_seg7_vertex_07003460 = vList(
    Vtx([  -153,    205,   -818], 0, [   990,    990], [0xdf, 0xbf, 0x1f, 0xff]),
    Vtx([  -153,   -442,   1090], 0, [ -9072,    990], [0xdf, 0xbf, 0x1f, 0xff]),
    Vtx([  -153,   -215,   1058], 0, [ -8900,    -86], [0xdf, 0xbf, 0x1f, 0xff]),
    Vtx([  -146,    441,   -818], 0, [   990,      0], [0xdf, 0xbf, 0x1f, 0xff]),
    Vtx([   154,   -215,   1058], 0, [ -8900,    -86], [0xdf, 0xbf, 0x1f, 0xff]),
    Vtx([   154,   -442,   1090], 0, [ -9070,    990], [0xdf, 0xbf, 0x1f, 0xff]),
    Vtx([   162,    417,   -818], 0, [   990,      0], [0xdf, 0xbf, 0x1f, 0xff]),
    Vtx([   154,    205,   -818], 0, [   990,    990], [0xdf, 0xbf, 0x1f, 0xff]),
);

// 0x070034E0 - 0x07003520
bitdw_seg7_vertex_070034E0 = vList(
    Vtx([   154,   -306,   1024], 0, [     0,      0], [0xff, 0xd4, 0x00, 0xff]),
    Vtx([   154,    315,   -818], 0, [  6440,      0], [0xff, 0xd4, 0x00, 0xff]),
    Vtx([  -146,    338,   -818], 0, [  6464,    972], [0xff, 0xd4, 0x00, 0xff]),
    Vtx([  -153,   -306,   1024], 0, [     0,    988], [0xff, 0xd4, 0x00, 0xff]),
);

// 0x07003520 - 0x07003588
bitdw_seg7_dl_07003520 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09005000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bitdw_seg7_vertex_07003370, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 13, 14, 0x0,  0,  2,  6, 0x0),
    gsSPEndDisplayList(),
);

// 0x07003588 - 0x070035D0
bitdw_seg7_dl_07003588 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09006000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bitdw_seg7_vertex_07003460, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  2, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  5,  7,  6, 0x0),
    gsSPEndDisplayList(),
);

// 0x070035D0 - 0x07003608
bitdw_seg7_dl_070035D0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09000000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bitdw_seg7_vertex_070034E0, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  2, 0x0),
    gsSPEndDisplayList(),
);

// 0x07003608 - 0x07003688
bitdw_seg7_dl_07003608 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bitdw_seg7_dl_07003520),
    gsSPDisplayList(bitdw_seg7_dl_07003588),
    gsSPDisplayList(bitdw_seg7_dl_070035D0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
);


/// <pygml?v=1.0&h=67b4623c4>
// 0x0E0003F0
geo_bitdw_0003F0 = [
   [GCMD_CULL, 2000],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_ALPHA, bitdw_seg7_dl_07003608],
   [GCMD_CLOSE],
   [GCMD_END],
];

}