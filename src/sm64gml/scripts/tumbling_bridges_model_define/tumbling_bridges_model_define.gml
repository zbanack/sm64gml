// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tumbling_bridges_model_define(){
/// <pygml?v=1.0&h=f27edac04>
// 0x0700DE98 - 0x0700DEB0
wf_seg7_lights_0700DE98 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700DEB0 - 0x0700DFA0
wf_seg7_vertex_0700DEB0 = vList(
    Vtx([  -127,    -63,     64], 0, [   990,   -542], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   215,    -63,    -63], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   215,    -63,     64], 0, [     0,   -542], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   215,    -63,     64], 0, [  5078,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   215,    -63,    -63], 0, [  6100,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   215,     64,    -63], 0, [  6100,    480], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   215,     64,     64], 0, [  5078,    480], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   215,     64,    -63], 0, [   880,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   215,    -63,    -63], 0, [   880,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -127,    -63,    -63], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -127,     64,    -63], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -127,     64,    -63], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -127,     64,     64], 0, [   990,   -542], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   215,     64,     64], 0, [     0,   -544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   215,     64,    -63], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700DFA0 - 0x0700E050
wf_seg7_vertex_0700DFA0 = vList(
    Vtx([  -127,     64,     64], 0, [     0,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   215,    -63,     64], 0, [   880,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   215,     64,     64], 0, [   880,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -127,    -63,     64], 0, [   990,   -542], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -127,    -63,    -63], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   215,    -63,    -63], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -127,    -63,    -63], 0, [  3034,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -127,    -63,     64], 0, [  4056,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -127,     64,     64], 0, [  4056,    480], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -127,     64,    -63], 0, [  3034,    480], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -127,    -63,     64], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x0700E050 - 0x0700E0F0
wf_seg7_dl_0700E050= dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09004000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(wf_seg7_lights_0700DE98.l[0], 1),
    gsSPLight(wf_seg7_lights_0700DE98.a, 2),
    gsSPVertex(wf_seg7_vertex_0700DEB0, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(wf_seg7_vertex_0700DFA0, 11, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
    gsSP1Triangle( 0, 10,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700E0F0 - 0x0700E160
wf_seg7_dl_0700E0F0 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(wf_seg7_dl_0700E050),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);

/// <pygml?v=1.0&h=0d1a9f7a1>
// 0x0700E160 - 0x0700E178
wf_seg7_lights_0700E160 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700E178 - 0x0700E278
wf_seg7_vertex_0700E178 = vList(
    Vtx([  -127,     64,   -575], 0, [     0,    480], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -127,    -63,   -575], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -127,    -63,    576], 0, [  9166,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -127,     64,    576], 0, [     0,    480], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -127,    -63,    576], 0, [     0,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   215,    -63,    576], 0, [   990,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   215,     64,    576], 0, [   990,    478], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   215,     64,   -575], 0, [     0,   1498], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -127,     64,   -575], 0, [   990,   1498], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -127,     64,    576], 0, [   990,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   215,     64,      0], 0, [     0,   -798], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   215,     64,    576], 0, [     0,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -127,     64,    576], 0, [  9166,    480], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   215,     64,   -575], 0, [     0,    478], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   215,    -63,   -575], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -127,    -63,   -575], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
);

// 0x0700E278 - 0x0700E328
wf_seg7_vertex_0700E278 = vList(
    Vtx([   215,     64,   -575], 0, [     0,    478], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -127,    -63,   -575], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -127,     64,   -575], 0, [   990,    478], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   215,    -63,    576], 0, [     0,  -3098], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -127,    -63,    576], 0, [   990,  -3098], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -127,    -63,   -575], 0, [   990,   1498], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   215,    -63,   -575], 0, [     0,   1498], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   215,     64,    576], 0, [     0,    478], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   215,    -63,    576], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   215,    -63,   -575], 0, [  9166,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   215,     64,   -575], 0, [  9166,    480], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700E328 - 0x0700E3D0
wf_seg7_dl_0700E328 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09004000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(wf_seg7_lights_0700E160.l[0], 1),
    gsSPLight(wf_seg7_lights_0700E160.a, 2),
    gsSPVertex(wf_seg7_vertex_0700E178, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 9, 10,  7, 0x0,  9, 11, 10, 0x0),
    gsSP2Triangles( 0,  2, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(wf_seg7_vertex_0700E278, 11, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP1Triangle( 7,  9, 10, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700E3D0 - 0x0700E440
wf_seg7_dl_0700E3D0 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(wf_seg7_dl_0700E328),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);


}