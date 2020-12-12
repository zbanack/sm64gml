// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sparkle_model_define(){
/// <pygml?v=1.0&h=5e442be99>
// Sparkles

// 0x04027450
sparkles_seg4_vertex_04027450 = vList(
    Vtx([   -32,      0,      0], 0, [     0,   1984], [0x00, 0x00, 0x7f, 0x00]),
    Vtx([    32,      0,      0], 0, [  1984,   1984], [0x00, 0x00, 0x7f, 0x00]),
    Vtx([    32,     64,      0], 0, [  1984,      0], [0x00, 0x00, 0x7f, 0x00]),
    Vtx([   -32,     64,      0], 0, [     0,      0], [0x00, 0x00, 0x7f, 0x00]),
);

// 0x0402A490 - 0x0402A4F8
sparkles_seg4_dl_0402A490 = dList(
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsSPTexture(0x8000, 0x8000, 0, G_TX_RENDERTILE, G_ON),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPVertex(sparkles_seg4_vertex_04027450, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPTexture(0x0001, 0x0001, 0, G_TX_RENDERTILE, G_OFF),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);

// 0x0402A4F8 - 0x0402A510
sparkles_seg4_dl_0402A4F8 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04027490),
    gsSPBranchList(sparkles_seg4_dl_0402A490),
);

// 0x0402A510 - 0x0402A528
sparkles_seg4_dl_0402A510 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04027C90),
    gsSPBranchList(sparkles_seg4_dl_0402A490),
);

// 0x0402A528 - 0x0402A540
sparkles_seg4_dl_0402A528 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04028490),
    gsSPBranchList(sparkles_seg4_dl_0402A490),
);

// 0x0402A540 - 0x0402A558
sparkles_seg4_dl_0402A540 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04028C90),
    gsSPBranchList(sparkles_seg4_dl_0402A490),
);

// 0x0402A558 - 0x0402A570
sparkles_seg4_dl_0402A558 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04029490),
    gsSPBranchList(sparkles_seg4_dl_0402A490),
);

// 0x0402A570 - 0x0402A588
sparkles_seg4_dl_0402A570 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sparkles_seg4_texture_04029C90),
    gsSPBranchList(sparkles_seg4_dl_0402A490),
);

}