// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function exclamation_box_model_define(){
/// <pygml?v=1.0&h=d9882c031>
// Exclamation Box

// 0x08012E10
exclamation_box_seg8_lights_08012E10 = gdSPDefLights1(
    0x3f, 0x3f, 0x3f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x08018E28
exclamation_box_seg8_vertex_08018E28 = vList(
    Vtx([   -25,      1,    -25], 0, [   992,    992], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,     52,    -25], 0, [   992,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([    26,     52,    -25], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,      1,     26], 0, [     0,    992], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([    26,      1,     26], 0, [   992,    992], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([    26,     52,     26], 0, [   992,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   -25,     52,     26], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([    26,     52,    -25], 0, [   992,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([    26,      1,     26], 0, [     0,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([    26,      1,    -25], 0, [   992,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([    26,     52,     26], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,      1,    -25], 0, [     0,    992], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -25,      1,     26], 0, [   992,    992], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -25,     52,     26], 0, [   992,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -25,     52,    -25], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([    26,      1,    -25], 0, [     0,    992], [0x00, 0x00, 0x81, 0xff]),
);

// 0x08018F28
exclamation_box_seg8_vertex_08018F28 = vList(
    Vtx([    26,      1,    -25], 0, [   992,   2014], [0x00, 0x81, 0x00, 0xff]),
    Vtx([    26,      1,     26], 0, [   992,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -25,      1,     26], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -25,      1,    -25], 0, [     0,   2014], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -25,     52,    -25], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,     52,     26], 0, [     0,   2014], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([    26,     52,     26], 0, [   992,   2014], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([    26,     52,    -25], 0, [   992,      0], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x08018FA8 - 0x08019008
exclamation_box_seg8_dl_08018FA8 = dList(
    gsSPLight(exclamation_box_seg8_lights_08012E10.l[0], 1),
    gsSPLight(exclamation_box_seg8_lights_08012E10.a, 2),
    gsSPVertex(exclamation_box_seg8_vertex_08018E28, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 13, 14, 0x0,  0,  2, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x08019008 - 0x08019058
exclamation_box_seg8_dl_08019008 = dList(
    gsSPVertex(exclamation_box_seg8_vertex_08018F28, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);

// 0x08019058 - 0x080190A0
exclamation_box_seg8_dl_08019058 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPEndDisplayList(),
);

// 0x080190A0
exclamation_box_seg8_vertex_080190A0 = vList(
    Vtx([   -25,      1,     26], 0, [   992,    992], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -25,     52,     26], 0, [   992,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -25,     52,    -25], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([    26,      1,     26], 0, [   992,    992], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([    26,     52,     26], 0, [   992,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   -25,     52,     26], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   -25,      1,     26], 0, [     0,    992], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([    26,      1,    -25], 0, [   992,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([    26,     52,    -25], 0, [   992,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([    26,     52,     26], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([    26,      1,     26], 0, [     0,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,      1,    -25], 0, [   992,    992], [0x00, 0x00, 0x81, 0xff]),
    Vtx([    26,     52,    -25], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([    26,      1,    -25], 0, [     0,    992], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,     52,    -25], 0, [   992,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,      1,    -25], 0, [     0,    992], [0x81, 0x00, 0x00, 0xff]),
);

// 0x080191A0
exclamation_box_seg8_vertex_080191A0 = vList(
    Vtx([   -25,     52,     26], 0, [     0,    992], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([    26,     52,     26], 0, [  2014,    992], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([    26,     52,    -25], 0, [  2014,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,     52,    -25], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,      1,     26], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -25,      1,    -25], 0, [     0,    992], [0x00, 0x81, 0x00, 0xff]),
    Vtx([    26,      1,    -25], 0, [  2014,    992], [0x00, 0x81, 0x00, 0xff]),
    Vtx([    26,      1,     26], 0, [  2014,      0], [0x00, 0x81, 0x00, 0xff]),
);

// 0x08019220 - 0x08019280
exclamation_box_seg8_dl_08019220 = dList(
    gsSPLight(exclamation_box_seg8_lights_08012E10.l[0], 1),
    gsSPLight(exclamation_box_seg8_lights_08012E10.a, 2),
    gsSPVertex(exclamation_box_seg8_vertex_080190A0, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 14, 12, 0x0,  0,  2, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x08019280 - 0x080192D0
exclamation_box_seg8_dl_08019280 = dList(
    gsSPVertex(exclamation_box_seg8_vertex_080191A0, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);

// 0x080192D0 - 0x08019318
exclamation_box_seg8_dl_080192D0 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPEndDisplayList(),
);

// 0x08019318 - 0x08019378
exclamation_box_seg8_dl_08019318 = dList(
    gsSPDisplayList(exclamation_box_seg8_dl_08019058),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08015E28),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(exclamation_box_seg8_dl_08018FA8),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08016628),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPBranchList(exclamation_box_seg8_dl_08019008),
);

// 0x08019378 - 0x080193D8
exclamation_box_seg8_dl_08019378 = dList(
    gsSPDisplayList(exclamation_box_seg8_dl_080192D0),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08014628),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(exclamation_box_seg8_dl_08019220),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08014E28),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPBranchList(exclamation_box_seg8_dl_08019280),
);

// 0x080193D8 - 0x08019438
exclamation_box_seg8_dl_080193D8 = dList(
    gsSPDisplayList(exclamation_box_seg8_dl_08019058),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08012E28),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(exclamation_box_seg8_dl_08018FA8),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08013628),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPBranchList(exclamation_box_seg8_dl_08019008),
);

// 0x08019438 - 0x08019498
exclamation_box_seg8_dl_08019438 = dList(
    gsSPDisplayList(exclamation_box_seg8_dl_080192D0),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08017628),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPDisplayList(exclamation_box_seg8_dl_08019220),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_seg8_texture_08017E28),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPBranchList(exclamation_box_seg8_dl_08019280),
);

/// <pygml?v=1.0&h=d54c92aa9>
// Exclamation Box Outline

// 0x08024CB8
exclamation_box_outline_seg8_lights_08024CB8 = gdSPDefLights1(
    0x7f, 0x00, 0x00,
    0xff, 0x00, 0x00, 0x28, 0x28, 0x28
);

// 0x08024CD0
exclamation_box_outline_seg8_lights_08024CD0 = gdSPDefLights1(
    0x00, 0x7f, 0x00,
    0x00, 0xff, 0x00, 0x28, 0x28, 0x28
);

// 0x08024CE8
exclamation_box_outline_seg8_lights_08024CE8 = gdSPDefLights1(
    0x00, 0x00, 0x7f,
    0x00, 0x00, 0xff, 0x28, 0x28, 0x28
);

// 0x08024D00
exclamation_box_outline_seg8_lights_08024D00 = gdSPDefLights1(
    0x7f, 0x6a, 0x00,
    0xff, 0xd4, 0x00, 0x28, 0x28, 0x28
);

// 0x08024D18
exclamation_box_outline_seg8_vertex_08024D18 = vList(
    Vtx([    26,      1,    -25], 0, [     0,      0], [0x7f, 0x00, 0x00, 0x50]),
    Vtx([    26,     52,     26], 0, [     0,      0], [0x7f, 0x00, 0x00, 0x50]),
    Vtx([    26,      1,     26], 0, [     0,      0], [0x7f, 0x00, 0x00, 0x50]),
    Vtx([    26,      1,     26], 0, [     0,      0], [0x00, 0x81, 0x00, 0x50]),
    Vtx([   -25,      1,     26], 0, [     0,      0], [0x00, 0x81, 0x00, 0x50]),
    Vtx([   -25,      1,    -25], 0, [     0,      0], [0x00, 0x81, 0x00, 0x50]),
    Vtx([    26,      1,    -25], 0, [     0,      0], [0x00, 0x81, 0x00, 0x50]),
    Vtx([    26,      1,     26], 0, [     0,      0], [0x00, 0x00, 0x7f, 0x50]),
    Vtx([    26,     52,     26], 0, [     0,      0], [0x00, 0x00, 0x7f, 0x50]),
    Vtx([   -25,     52,     26], 0, [     0,      0], [0x00, 0x00, 0x7f, 0x50]),
    Vtx([   -25,      1,     26], 0, [     0,      0], [0x00, 0x00, 0x7f, 0x50]),
    Vtx([   -25,      1,     26], 0, [     0,      0], [0x81, 0x00, 0x00, 0x50]),
    Vtx([   -25,     52,     26], 0, [     0,      0], [0x81, 0x00, 0x00, 0x50]),
    Vtx([   -25,     52,    -25], 0, [     0,      0], [0x81, 0x00, 0x00, 0x50]),
    Vtx([   -25,      1,    -25], 0, [     0,      0], [0x81, 0x00, 0x00, 0x50]),
);

// 0x08024E08
exclamation_box_outline_seg8_vertex_08024E08 = vList(
    Vtx([   -25,      1,    -25], 0, [     0,      0], [0x00, 0x00, 0x81, 0x50]),
    Vtx([   -25,     52,    -25], 0, [     0,      0], [0x00, 0x00, 0x81, 0x50]),
    Vtx([    26,     52,    -25], 0, [     0,      0], [0x00, 0x00, 0x81, 0x50]),
    Vtx([    26,      1,    -25], 0, [     0,      0], [0x00, 0x00, 0x81, 0x50]),
    Vtx([    26,      1,    -25], 0, [     0,      0], [0x7f, 0x00, 0x00, 0x50]),
    Vtx([    26,     52,    -25], 0, [     0,      0], [0x7f, 0x00, 0x00, 0x50]),
    Vtx([    26,     52,     26], 0, [     0,      0], [0x7f, 0x00, 0x00, 0x50]),
    Vtx([   -25,     52,     26], 0, [     0,      0], [0x00, 0x7f, 0x00, 0x50]),
    Vtx([    26,     52,     26], 0, [     0,      0], [0x00, 0x7f, 0x00, 0x50]),
    Vtx([    26,     52,    -25], 0, [     0,      0], [0x00, 0x7f, 0x00, 0x50]),
    Vtx([   -25,     52,    -25], 0, [     0,      0], [0x00, 0x7f, 0x00, 0x50]),
);

// 0x08024EB8 - 0x08024F30
exclamation_box_outline_seg8_dl_08024EB8 = dList(
    gsSPVertex(exclamation_box_outline_seg8_vertex_08024D18, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(exclamation_box_outline_seg8_vertex_08024E08, 11, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP1Triangle( 7,  9, 10, 0x0),
    gsSPEndDisplayList(),
);

// 0x08024F30 - 0x08024F58
exclamation_box_outline_seg8_dl_08024F30 = dList(
    //gsDPPipeSync(),
    gsDPSetEnvColor(255, 255, 255, 80),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetCombineMode(G_CC_SHADEFADEA, G_CC_SHADEFADEA),
    gsSPEndDisplayList(),
);

// 0x08024F58 - 0x08024F88
exclamation_box_outline_seg8_dl_08024F58 = dList(
    gsSPDisplayList(exclamation_box_outline_seg8_dl_08024EB8),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsSPEndDisplayList(),
);

// 0x08024F88 - 0x08024FA8
exclamation_box_outline_seg8_dl_08024F88 = dList(
    gsSPDisplayList(exclamation_box_outline_seg8_dl_08024F30),
    gsSPLight(exclamation_box_outline_seg8_lights_08024CB8.l[0], 1),
    gsSPLight(exclamation_box_outline_seg8_lights_08024CB8.a, 2),
    gsSPBranchList(exclamation_box_outline_seg8_dl_08024F58),
);

// 0x08024FA8 - 0x08024FC8
exclamation_box_outline_seg8_dl_08024FA8 = dList(
    gsSPDisplayList(exclamation_box_outline_seg8_dl_08024F30),
    gsSPLight(exclamation_box_outline_seg8_lights_08024CD0.l[0], 1),
    gsSPLight(exclamation_box_outline_seg8_lights_08024CD0.a, 2),
    gsSPBranchList(exclamation_box_outline_seg8_dl_08024F58),
);

// 0x08024FC8 - 0x08024FE8
exclamation_box_outline_seg8_dl_08024FC8 = dList(
    gsSPDisplayList(exclamation_box_outline_seg8_dl_08024F30),
    gsSPLight(exclamation_box_outline_seg8_lights_08024CE8.l[0], 1),
    gsSPLight(exclamation_box_outline_seg8_lights_08024CE8.a, 2),
    gsSPBranchList(exclamation_box_outline_seg8_dl_08024F58),
);

// 0x08024FE8 - 0x08025008
exclamation_box_outline_seg8_dl_08024FE8 = dList(
    gsSPDisplayList(exclamation_box_outline_seg8_dl_08024F30),
    gsSPLight(exclamation_box_outline_seg8_lights_08024D00.l[0], 1),
    gsSPLight(exclamation_box_outline_seg8_lights_08024D00.a, 2),
    gsSPBranchList(exclamation_box_outline_seg8_dl_08024F58),
);

// 0x08025008
exclamation_box_outline_seg8_vertex_08025008 = vList(
    Vtx([   -25,     52,     26], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    26,     52,     26], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    26,     52,    -25], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -25,     52,    -25], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    26,      1,     26], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -25,     52,     26], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -25,      1,     26], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    26,      1,    -25], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    26,     52,    -25], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    26,     52,     26], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    26,      1,     26], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -25,      1,    -25], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    26,      1,    -25], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -25,     52,    -25], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
);

// 0x080250E8
exclamation_box_outline_seg8_vertex_080250E8 = vList(
    Vtx([   -25,      1,     26], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -25,     52,     26], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -25,     52,    -25], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -25,      1,    -25], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -25,      1,     26], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -25,      1,    -25], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    26,      1,    -25], 0, [   996,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    26,      1,     26], 0, [   -26,      0], [0xff, 0xff, 0xff, 0xff]),
);

// 0x08025968 - 0x080259F8
exclamation_box_outline_seg8_dl_08025968 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_outline_seg8_texture_08025168),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(exclamation_box_outline_seg8_vertex_08025008, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  1,  5, 0x0,  4,  5,  6, 0x0),
    gsSP2Triangles( 7,  8,  9, 0x0,  7,  9, 10, 0x0),
    gsSP2Triangles(11,  8, 12, 0x0, 11, 13,  8, 0x0),
    gsSPVertex(exclamation_box_outline_seg8_vertex_080250E8, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSPEndDisplayList(),
);

// 0x080259F8 - 0x08025A68
exclamation_box_outline_seg8_dl_080259F8 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(exclamation_box_outline_seg8_dl_08025968),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
);

// 0x08025A68
exclamation_box_outline_seg8_lights_08025A68 = gdSPDefLights1(
    0x7f, 0x7f, 0x7f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);


// 0x08025E80
exclamation_box_outline_seg8_vertex_08025E80 = vList(
    Vtx([   -22,     49,      0], 0, [  -157,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   -22,      4,      0], 0, [  -157,   1048], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([    23,      4,      0], 0, [   605,   1048], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([    23,     49,      0], 0, [   605,      0], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x08025EC0 - 0x08025F08
exclamation_box_outline_seg8_dl_08025EC0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, exclamation_box_outline_seg8_texture_08025A80),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 16 * 32 - 1), //CALC_DXT(16, G_IM_SIZ_16b_BYTES)),
    gsSPLight(exclamation_box_outline_seg8_lights_08025A68.l[0], 1),
    gsSPLight(exclamation_box_outline_seg8_lights_08025A68.a, 2),
    gsSPVertex(exclamation_box_outline_seg8_vertex_08025E80, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x08025F08 - 0x08025F78
exclamation_box_outline_seg8_dl_08025F08 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsSPClearGeometryMode(G_CULL_BACK | G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 4, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 4, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (16 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(exclamation_box_outline_seg8_dl_08025EC0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_CULL_BACK | G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);


}