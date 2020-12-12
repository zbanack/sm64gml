// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_kickable_board_model_define(){
/// <pygml?v=1.0&h=3f286ed91>
// 0x0700F3B8 - 0x0700F3D0
wf_seg7_lights_0700F3B8 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700F3D0 - 0x0700F4C0
wf_seg7_vertex_0700F3D0 = vList(
    Vtx([   -96,      0,      0], 0, [   990,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -96,   1178,     77], 0, [     0,    -54], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -96,   1178,      0], 0, [   990,    -54], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -96,   1178,      0], 0, [     0,    -54], [0x00, 0x00, 0x81, 0xff]),
    Vtx([    95,   1178,      0], 0, [   990,    -54], [0x00, 0x00, 0x81, 0xff]),
    Vtx([    95,      0,      0], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -96,      0,      0], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([    95,   1178,      0], 0, [   990,    -54], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([    95,   1178,     77], 0, [     0,    -54], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([    95,      0,     77], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([    95,      0,      0], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([    95,   1178,     77], 0, [   990,    -54], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   -96,   1178,     77], 0, [     0,    -54], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   -96,      0,     77], 0, [     0,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([    95,      0,     77], 0, [   990,    990], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x0700F4C0 - 0x0700F570
wf_seg7_vertex_0700F4C0 = vList(
    Vtx([    95,      0,      0], 0, [  -152,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -96,      0,     77], 0, [  1122,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -96,      0,      0], 0, [  1122,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -96,      0,      0], 0, [   990,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -96,      0,     77], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -96,   1178,     77], 0, [     0,    -54], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -96,   1178,      0], 0, [  1122,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -96,   1178,     77], 0, [  1122,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([    95,   1178,     77], 0, [  -152,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([    95,   1178,      0], 0, [  -152,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([    95,      0,     77], 0, [  -152,    990], [0x00, 0x81, 0x00, 0xff]),
);

// 0x0700F570 - 0x0700F610
wf_seg7_dl_0700F570 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09006800),
    //gsDPLoadSync(),
    //gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(wf_seg7_lights_0700F3B8.l[0], 1),
    gsSPLight(wf_seg7_lights_0700F3B8.a, 2),
    gsSPVertex(wf_seg7_vertex_0700F3D0, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(wf_seg7_vertex_0700F4C0, 11, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
    gsSP1Triangle( 0, 10,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700F610 - 0x0700F680
wf_seg7_dl_0700F610 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(wf_seg7_dl_0700F570),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);

/// <pygml?v=1.0&h=8acb5724e>
// 0x0700F680 - 0x0700F6C0
wf_seg7_vertex_0700F680 = vList(
    Vtx([   -96,      0,    300], 0, [  -480,   -480], [0x00, 0x00, 0x00, 0x96]),
    Vtx([    95,      0,    300], 0, [   480,   -480], [0x00, 0x00, 0x00, 0x96]),
    Vtx([    95,      0,      0], 0, [   480,    480], [0x00, 0x00, 0x00, 0x96]),
    Vtx([   -96,      0,      0], 0, [  -480,    480], [0x00, 0x00, 0x00, 0x96]),
);

/// <pygml?v=1.0&h=78240a4dd>
// 0x0700F6C0 - 0x0700F758
wf_seg7_dl_0700F6C0 = dList(
    //gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_MODULATEIA, G_CC_MODULATEIA),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsDPLoadTextureBlock(wf_seg7_texture_07002800, G_IM_FMT_IA, G_IM_SIZ_8b, 16, 16, 0, G_TX_WRAP | G_TX_MIRROR, G_TX_WRAP | G_TX_MIRROR, 4, 4, G_TX_NOLOD, G_TX_NOLOD),
    gsSPVertex(wf_seg7_vertex_0700F680, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPEndDisplayList(),
);

}