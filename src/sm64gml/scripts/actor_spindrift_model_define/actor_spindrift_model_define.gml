// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function actor_spindrift_model_define(){
/// <pygml?v=1.0&h=28c5df102>
// 0x050026D0
spindrift_seg5_vertex_050026D0 = vList(
    Vtx([   -54,    -54,      0], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    56,     56,      0], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -54,     56,      0], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    56,    -54,      0], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
);

// 0x05002710 - 0x05002748
spindrift_seg5_dl_05002710 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_05001ED0),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(spindrift_seg5_vertex_050026D0, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x05002748 - 0x050027B8
spindrift_seg5_dl_05002748 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(spindrift_seg5_dl_05002710),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPEndDisplayList(),
);

// 0x050027B8
spindrift_seg5_vertex_050027B8 = vList(
    Vtx([    27,   -112,    -47], 0, [   -36,    520], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    27,   -112,     48], 0, [   990,    520], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -32,   -112,    -47], 0, [   -36,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -32,   -112,     48], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
);

// 0x050027F8 - 0x05002830
spindrift_seg5_dl_050027F8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_050006D0),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(spindrift_seg5_vertex_050027B8, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  2,  1,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x05002830 - 0x050028A0
spindrift_seg5_dl_05002830 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(spindrift_seg5_dl_050027F8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPEndDisplayList(),
);

// 0x050028A0
spindrift_seg5_vertex_050028A0 = vList(
    Vtx([    36,   -109,    -44], 0, [   -30,    572], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    83,    -79,      0], 0, [   480,   1092], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    36,   -109,     45], 0, [   990,    572], [0xff, 0xff, 0xff, 0xff]),
);

// 0x050028D0 - 0x05002900
spindrift_seg5_dl_050028D0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_050006D0),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(spindrift_seg5_vertex_050028A0, 3, 0),
    gsSP1Triangle( 0,  1,  2, 0x0),
    gsSPEndDisplayList(),
);

// 0x05002900 - 0x05002970
spindrift_seg5_dl_05002900 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(spindrift_seg5_dl_050028D0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPEndDisplayList(),
);

// 0x05002970
spindrift_seg5_lights_05002970 = gdSPDefLights1(
    0x7f, 0x7f, 0x7f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x05002988
spindrift_seg5_vertex_05002988 = vList(
    Vtx([    19,     22,    102], 0, [   196,   1200], [0x90, 0x25, 0x2e, 0xff]),
    Vtx([    13,     -6,      4], 0, [  1032,    456], [0x92, 0x3e, 0xf5, 0xff]),
    Vtx([   -20,    -53,     69], 0, [   250,   -194], [0x90, 0x25, 0x2e, 0xff]),
    Vtx([    34,    -56,    120], 0, [   -62,    330], [0xa9, 0x04, 0x5c, 0xff]),
);

// 0x050029C8 - 0x05002A20
spindrift_seg5_dl_050029C8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_050016D0),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPClearGeometryMode(G_CULL_BACK),
    gsSPLight(spindrift_seg5_lights_05002970.l[0], 1),
    gsSPLight(spindrift_seg5_lights_05002970.a, 2),
    gsSPVertex(spindrift_seg5_vertex_05002988, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPSetGeometryMode(G_CULL_BACK),
    gsSPEndDisplayList(),
);

// 0x05002A20 - 0x05002A80
spindrift_seg5_dl_05002A20 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(spindrift_seg5_dl_050029C8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);

// 0x05002A80
spindrift_seg5_lights_05002A80 = gdSPDefLights1(
    0x7f, 0x7f, 0x7f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x05002A98
spindrift_seg5_vertex_05002A98 = vList(
    Vtx([     0,    -33,    -69], 0, [   514,   1102], [0xa0, 0x40, 0xcd, 0xff]),
    Vtx([    13,     -2,      0], 0, [  1070,    398], [0x9c, 0x4c, 0xf1, 0xff]),
    Vtx([    53,     33,    -86], 0, [   138,   -146], [0xa0, 0x40, 0xcd, 0xff]),
    Vtx([    62,    -15,   -122], 0, [  -146,    482], [0xac, 0x2e, 0xae, 0xff]),
);

// 0x05002AD8 - 0x05002B30
spindrift_seg5_dl_05002AD8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_050016D0),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPClearGeometryMode(G_CULL_BACK),
    gsSPLight(spindrift_seg5_lights_05002A80.l[0], 1),
    gsSPLight(spindrift_seg5_lights_05002A80.a, 2),
    gsSPVertex(spindrift_seg5_vertex_05002A98, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  2, 0x0),
    gsSPSetGeometryMode(G_CULL_BACK),
    gsSPEndDisplayList(),
);

// 0x05002B30 - 0x05002B90
spindrift_seg5_dl_05002B30 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(spindrift_seg5_dl_05002AD8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);

// 0x05002B90
spindrift_seg5_lights_05002B90 = gdSPDefLights1(
    0x7f, 0x7f, 0x7f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x05002BA8
spindrift_seg5_vertex_05002BA8 = vList(
    Vtx([    28,     -6,     21], 0, [   474,   1104], [0x7e, 0xfd, 0x0b, 0xff]),
    Vtx([    42,    -20,   -134], 0, [  -192,      0], [0x7e, 0xfd, 0x0b, 0xff]),
    Vtx([    42,     98,    -96], 0, [  1152,      0], [0x7e, 0xfd, 0x0b, 0xff]),
    Vtx([    28,    -21,      0], 0, [   474,   1104], [0x7e, 0xf4, 0x00, 0xff]),
    Vtx([    42,    122,    -61], 0, [  -192,      0], [0x7e, 0xf4, 0x00, 0xff]),
    Vtx([    42,    122,     63], 0, [  1152,      0], [0x7e, 0xf4, 0x00, 0xff]),
    Vtx([    28,     -6,    -20], 0, [   474,   1104], [0x7e, 0xfd, 0xf5, 0xff]),
    Vtx([    42,     97,     97], 0, [  -192,      0], [0x7e, 0xfd, 0xf5, 0xff]),
    Vtx([    42,    -21,    135], 0, [  1152,      0], [0x7e, 0xfd, 0xf5, 0xff]),
    Vtx([    28,     18,    -12], 0, [   474,   1104], [0x7e, 0x09, 0xf9, 0xff]),
    Vtx([    42,    -61,    122], 0, [  -192,      0], [0x7e, 0x09, 0xf9, 0xff]),
    Vtx([    42,   -135,     21], 0, [  1152,      0], [0x7e, 0x09, 0xf9, 0xff]),
    Vtx([    28,     18,     13], 0, [   474,   1104], [0x7e, 0x0a, 0x07, 0xff]),
    Vtx([    42,   -134,    -21], 0, [  -192,      0], [0x7e, 0x0a, 0x07, 0xff]),
    Vtx([    42,    -61,   -122], 0, [  1152,      0], [0x7e, 0x0a, 0x07, 0xff]),
);

// 0x05002C98 - 0x05002D08
spindrift_seg5_dl_05002C98 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spindrift_seg5_texture_05000ED0),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPClearGeometryMode(G_CULL_BACK),
    gsSPLight(spindrift_seg5_lights_05002B90.l[0], 1),
    gsSPLight(spindrift_seg5_lights_05002B90.a, 2),
    gsSPVertex(spindrift_seg5_vertex_05002BA8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPSetGeometryMode(G_CULL_BACK),
    gsSPEndDisplayList(),
);

// 0x05002D08 - 0x05002D68
spindrift_seg5_dl_05002D08 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(spindrift_seg5_dl_05002C98),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);


/// <pygml?v=1.0&h=e18d072ec>
// Spindrift

// Unreferenced light group
spindrift_lights_unused1 = gdSPDefLights1(
    0x3f, 0x08, 0x1b,
    0xff, 0x22, 0x6d, 0x28, 0x28, 0x28
);

// Unreferenced light group
spindrift_lights_unused2 = gdSPDefLights1(
    0x3f, 0x3f, 0x3f,
    0xfd, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x05000030
spindrift_seg5_lights_05000030 = gdSPDefLights1(
    0x12, 0x2c, 0x00,
    0x49, 0xb2, 0x00, 0x28, 0x28, 0x28
);

// 0x05000048
spindrift_seg5_lights_05000048 = gdSPDefLights1(
    0x37, 0x3f, 0x00,
    0xdd, 0xff, 0x01, 0x28, 0x28, 0x28
);

// Unreferenced light group
spindrift_lights_unused3 = gdSPDefLights1(
    0x00, 0x15, 0x00,
    0x00, 0x56, 0x00, 0x28, 0x28, 0x28
);

// 0x05000078
spindrift_seg5_lights_05000078 = gdSPDefLights1(
    0x3f, 0x38, 0x00,
    0xff, 0xe2, 0x00, 0x28, 0x28, 0x28
);

// 0x05000090
spindrift_seg5_lights_05000090 = gdSPDefLights1(
    0x00, 0x0f, 0x00,
    0x00, 0x3f, 0x00, 0x28, 0x28, 0x28
);

// Unreferenced light group
spindrift_lights_unused4 = gdSPDefLights1(
    0x3f, 0x00, 0x00,
    0xff, 0x00, 0x00, 0x28, 0x28, 0x28
);

// 0x050000C0
spindrift_seg5_vertex_050000C0 = vList(
    Vtx([    34,     40,     30], 0, [     0,      0], [0x7b, 0x17, 0x11, 0x00]),
    Vtx([    34,    -16,     46], 0, [     0,      0], [0x7b, 0xf7, 0x1c, 0x00]),
    Vtx([    46,      0,      0], 0, [     0,      0], [0x7f, 0x00, 0x00, 0x00]),
    Vtx([    34,    -50,      0], 0, [     0,      0], [0x7b, 0xe3, 0x00, 0xff]),
    Vtx([    34,    -16,    -46], 0, [     0,      0], [0x7b, 0xf7, 0xe3, 0xff]),
    Vtx([    34,     40,    -28], 0, [     0,      0], [0x7b, 0x18, 0xee, 0xff]),
);

// 0x05000120
spindrift_seg5_vertex_05000120 = vList(
    Vtx([     6,      0,      0], 0, [     0,      0], [0x81, 0x00, 0x00, 0x00]),
    Vtx([    34,    -16,    -46], 0, [     0,      0], [0x92, 0xee, 0xc4, 0x00]),
    Vtx([    34,    -50,      0], 0, [     0,      0], [0x92, 0xc2, 0x00, 0x00]),
    Vtx([    34,    -16,     46], 0, [     0,      0], [0x92, 0xec, 0x3b, 0xff]),
    Vtx([    34,     40,    -28], 0, [     0,      0], [0x92, 0x32, 0xdb, 0xff]),
    Vtx([    34,     40,     30], 0, [     0,      0], [0x92, 0x31, 0x25, 0xff]),
);

// 0x05000180
spindrift_seg5_vertex_05000180 = vList(
    Vtx([    70,     50,      0], 0, [     0,      0], [0xcb, 0x73, 0x00, 0x00]),
    Vtx([    24,    -12,     56], 0, [     0,      0], [0xa9, 0x22, 0x54, 0x00]),
    Vtx([   128,     -2,     94], 0, [     0,      0], [0xda, 0x45, 0x63, 0x00]),
    Vtx([     0,     -5,      0], 0, [     0,      0], [0x8e, 0x37, 0x00, 0xff]),
    Vtx([    24,    -12,    -56], 0, [     0,      0], [0xa8, 0x22, 0xac, 0xff]),
    Vtx([     0,    -57,      0], 0, [     0,      0], [0x87, 0xdd, 0x00, 0xff]),
    Vtx([    55,   -113,     57], 0, [     0,      0], [0xa5, 0xce, 0x48, 0xff]),
    Vtx([   128,     -2,    -94], 0, [     0,      0], [0xda, 0x45, 0x9d, 0xff]),
    Vtx([    55,   -113,    -57], 0, [     0,      0], [0xa5, 0xce, 0xb8, 0xff]),
);

// 0x05000210
spindrift_seg5_vertex_05000210 = vList(
    Vtx([    55,   -113,    -57], 0, [     0,      0], [0xa5, 0xce, 0xb8, 0x00]),
    Vtx([    55,   -113,     57], 0, [     0,      0], [0xa5, 0xce, 0x48, 0x00]),
    Vtx([     0,    -57,      0], 0, [     0,      0], [0x87, 0xdd, 0x00, 0x00]),
    Vtx([   128,     -2,    -94], 0, [     0,      0], [0xda, 0x45, 0x9d, 0xff]),
    Vtx([    24,    -12,    -56], 0, [     0,      0], [0xa8, 0x22, 0xac, 0xff]),
    Vtx([   128,     -2,     94], 0, [     0,      0], [0xda, 0x45, 0x63, 0xff]),
    Vtx([    24,    -12,     56], 0, [     0,      0], [0xa9, 0x22, 0x54, 0xff]),
    Vtx([   138,     66,      0], 0, [     0,      0], [0xe3, 0x7b, 0x00, 0xff]),
    Vtx([    70,     50,      0], 0, [     0,      0], [0xcb, 0x73, 0x00, 0xff]),
);

// 0x050002A0 - 0x05000328
spindrift_seg5_dl_050002A0 = dList(
    gsSPLight(spindrift_seg5_lights_05000048.l[0], 1),
    gsSPLight(spindrift_seg5_lights_05000048.a, 2),
    gsSPVertex(spindrift_seg5_vertex_050000C0, 6, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  2, 0x0),
    gsSP2Triangles( 1,  3,  2, 0x0,  4,  5,  2, 0x0),
    gsSP1Triangle( 5,  0,  2, 0x0),
    gsSPLight(spindrift_seg5_lights_05000030.l[0], 1),
    gsSPLight(spindrift_seg5_lights_05000030.a, 2),
    gsSPVertex(spindrift_seg5_vertex_05000120, 6, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 1,  0,  4, 0x0,  4,  0,  5, 0x0),
    gsSP1Triangle( 5,  0,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x05000328 - 0x050003D8
spindrift_seg5_dl_05000328 = dList(
    gsSPClearGeometryMode(G_CULL_BACK),
    gsSPLight(spindrift_seg5_lights_05000090.l[0], 1),
    gsSPLight(spindrift_seg5_lights_05000090.a, 2),
    gsSPVertex(spindrift_seg5_vertex_05000180, 9, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  1,  0,  3, 0x0),
    gsSP2Triangles( 0,  4,  3, 0x0,  1,  5,  6, 0x0),
    gsSP2Triangles( 7,  4,  0, 0x0,  5,  4,  8, 0x0),
    gsSP2Triangles( 5,  1,  3, 0x0,  4,  5,  3, 0x0),
    gsSPLight(spindrift_seg5_lights_05000078.l[0], 1),
    gsSPLight(spindrift_seg5_lights_05000078.a, 2),
    gsSPVertex(spindrift_seg5_vertex_05000210, 9, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  4, 0x0),
    gsSP2Triangles( 1,  5,  6, 0x0,  5,  7,  8, 0x0),
    gsSP1Triangle( 8,  7,  3, 0x0),
    gsSPSetGeometryMode(G_CULL_BACK),
    gsSPEndDisplayList(),
);

}