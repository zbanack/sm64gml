// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bomp_model_define(){
/// <pygml?v=1.0&h=401bad44c>
// 0x0700D370 - 0x0700D388
wf_seg7_lights_0700D370 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700D388 - 0x0700D488
wf_seg7_vertex_0700D388 = vList(
    Vtx([  -252,    261,     75], 0, [     0,  -3138], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   136,    261,    -77], 0, [  1194,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -252,    261,    -77], 0, [  1194,  -3138], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   136,    261,    -77], 0, [   582,    -72], [0x30, 0x75, 0x00, 0xff]),
    Vtx([   136,    261,     75], 0, [  -644,    -72], [0x30, 0x75, 0x00, 0xff]),
    Vtx([   259,    210,     95], 0, [  -796,    990], [0x30, 0x75, 0x00, 0xff]),
    Vtx([   259,    210,    -96], 0, [   734,    990], [0x30, 0x75, 0x00, 0xff]),
    Vtx([  -252,    210,   -128], 0, [   762,   -146], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   259,      5,   -128], 0, [ -2074,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -252,      5,   -128], 0, [   762,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   195,    210,   -128], 0, [ -1720,   -146], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -252,    261,    -77], 0, [  4056,    412], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([   195,    210,   -128], 0, [   478,    990], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([  -252,    210,   -128], 0, [  4056,    990], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([   136,    261,    -77], 0, [   950,    412], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([   136,    261,     75], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700D488 - 0x0700D568
wf_seg7_vertex_0700D488 = vList(
    Vtx([   195,    210,    127], 0, [   480,    990], [0x00, 0x5a, 0x58, 0xff]),
    Vtx([   136,    261,     75], 0, [     8,    412], [0x00, 0x5a, 0x58, 0xff]),
    Vtx([  -252,    261,     75], 0, [ -3096,    412], [0x00, 0x5a, 0x58, 0xff]),
    Vtx([  -252,    210,    127], 0, [ -3096,    990], [0x00, 0x5a, 0x58, 0xff]),
    Vtx([  -252,      5,    127], 0, [ -2074,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   259,      5,    127], 0, [   762,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   195,    210,    127], 0, [   408,   -146], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -252,    210,    127], 0, [ -2074,   -146], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   259,    210,     95], 0, [   990,    990], [0x20, 0x68, 0x41, 0xff]),
    Vtx([   136,    261,     75], 0, [   990,   -352], [0x20, 0x68, 0x41, 0xff]),
    Vtx([   195,    210,    127], 0, [   520,    452], [0x20, 0x68, 0x41, 0xff]),
    Vtx([   259,      5,   -128], 0, [   540,   1116], [0x38, 0x11, 0x90, 0xff]),
    Vtx([   195,    210,   -128], 0, [   540,    -72], [0x38, 0x11, 0x90, 0xff]),
    Vtx([   259,    210,    -96], 0, [   156,     34], [0x38, 0x11, 0x90, 0xff]),
);

// 0x0700D568 - 0x0700D5C8
wf_seg7_vertex_0700D568 = vList(
    Vtx([   259,    210,     95], 0, [   764,   -144], [0x38, 0x11, 0x70, 0xff]),
    Vtx([   195,    210,    127], 0, [   368,   -116], [0x38, 0x11, 0x70, 0xff]),
    Vtx([   259,      5,    127], 0, [   764,   1004], [0x38, 0x11, 0x70, 0xff]),
    Vtx([   195,    210,   -128], 0, [   364,    990], [0x20, 0x67, 0xbf, 0xff]),
    Vtx([   136,    261,    -77], 0, [   530,    500], [0x20, 0x67, 0xbf, 0xff]),
    Vtx([   259,    210,    -96], 0, [     0,    990], [0x20, 0x67, 0xbf, 0xff]),
);

// 0x0700D5C8 - 0x0700D608
wf_seg7_vertex_0700D5C8 = vList(
    Vtx([   259,      5,   -128], 0, [  1118,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   259,    210,     95], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   259,      5,    127], 0, [  -158,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   259,    210,    -96], 0, [   958,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700D608 - 0x0700D6D0
wf_seg7_dl_0700D608 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09008000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(wf_seg7_lights_0700D370.l[0], 1),
    gsSPLight(wf_seg7_lights_0700D370.a, 2),
    gsSPVertex(wf_seg7_vertex_0700D388, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 14, 12, 0x0,  0, 15,  1, 0x0),
    gsSPVertex(wf_seg7_vertex_0700D488, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  2, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(wf_seg7_vertex_0700D568, 6, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700D6D0 - 0x0700D708
wf_seg7_dl_0700D6D0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wf_seg7_texture_07002000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(wf_seg7_vertex_0700D5C8, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700D708 - 0x0700D780
wf_seg7_dl_0700D708 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(wf_seg7_dl_0700D608),
    gsSPDisplayList(wf_seg7_dl_0700D6D0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);

/// <pygml?v=1.0&h=4b4c9cbdb>
// 0x0700D780 - 0x0700D798
wf_seg7_lights_0700D780 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700D798 - 0x0700D898
wf_seg7_vertex_0700D798 = vList(
    Vtx([  -252,    261,     75], 0, [     0,  -3138], [0x0c, 0x7e, 0x00, 0xff]),
    Vtx([   259,    210,    -96], 0, [  1194,      0], [0x0c, 0x7e, 0x00, 0xff]),
    Vtx([  -252,    261,    -77], 0, [  1194,  -3138], [0x0c, 0x7e, 0x00, 0xff]),
    Vtx([   259,    210,     95], 0, [     0,      0], [0x0c, 0x7e, 0x00, 0xff]),
    Vtx([  -252,    210,   -128], 0, [  2522,    -34], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   259,      5,   -128], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -252,      5,   -128], 0, [  2520,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -252,    210,   -128], 0, [  2522,    -34], [0x07, 0x13, 0x83, 0xff]),
    Vtx([   259,    210,    -96], 0, [   468,    -34], [0x07, 0x13, 0x83, 0xff]),
    Vtx([   259,      5,   -128], 0, [     0,    990], [0x07, 0x13, 0x83, 0xff]),
    Vtx([  -252,    261,    -77], 0, [  4056,    412], [0x05, 0x59, 0xa7, 0xff]),
    Vtx([   259,    210,    -96], 0, [   478,    990], [0x05, 0x59, 0xa7, 0xff]),
    Vtx([  -252,    210,   -128], 0, [  4056,    990], [0x05, 0x59, 0xa7, 0xff]),
    Vtx([  -252,    210,    127], 0, [ -3096,    990], [0x05, 0x5a, 0x58, 0xff]),
    Vtx([   259,    210,     95], 0, [   480,    990], [0x05, 0x5a, 0x58, 0xff]),
    Vtx([  -252,    261,     75], 0, [ -3096,    412], [0x05, 0x5a, 0x58, 0xff]),
);

// 0x0700D898 - 0x0700D8F8
wf_seg7_vertex_0700D898 = vList(
    Vtx([  -252,      5,    127], 0, [     0,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   259,      5,    127], 0, [  2012,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -252,    210,    127], 0, [     0,    182], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   259,      5,    127], 0, [  2012,    990], [0x07, 0x13, 0x7d, 0xff]),
    Vtx([   259,    210,     95], 0, [  2012,    162], [0x07, 0x13, 0x7d, 0xff]),
    Vtx([  -252,    210,    127], 0, [     0,    182], [0x07, 0x13, 0x7d, 0xff]),
);

// 0x0700D8F8 - 0x0700D938
wf_seg7_vertex_0700D8F8 = vList(
    Vtx([   259,      5,   -128], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   259,    210,     95], 0, [    96,    172], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   259,      5,    127], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   259,    210,    -96], 0, [   862,    172], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700D938 - 0x0700D9B8
wf_seg7_dl_0700D938 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09008000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(wf_seg7_lights_0700D780.l[0], 1),
    gsSPLight(wf_seg7_lights_0700D780.a, 2),
    gsSPVertex(wf_seg7_vertex_0700D798, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(wf_seg7_vertex_0700D898, 6, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700D9B8 - 0x0700D9F0
wf_seg7_dl_0700D9B8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wf_seg7_texture_07002000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(wf_seg7_vertex_0700D8F8, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700D9F0 - 0x0700DA68
wf_seg7_dl_0700D9F0 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(wf_seg7_dl_0700D938),
    gsSPDisplayList(wf_seg7_dl_0700D9B8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);

/// <pygml?v=1.0&h=293c20e97>
// 0x0700DA68 - 0x0700DA70
wf_seg7_lights_0700DA68 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700DA80 - 0x0700DB70
wf_seg7_vertex_0700DA80 = vList(
    Vtx([  -252,      5,    253], 0, [ -2074,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   259,      5,    253], 0, [   762,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   195,    210,    253], 0, [   408,   -146], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   259,      5,   -258], 0, [   540,   1116], [0x57, 0x1b, 0xa9, 0xff]),
    Vtx([   195,    210,   -258], 0, [   540,    -72], [0x57, 0x1b, 0xa9, 0xff]),
    Vtx([   259,    210,   -194], 0, [   156,     34], [0x57, 0x1b, 0xa9, 0xff]),
    Vtx([   195,    210,   -258], 0, [   364,    990], [0x24, 0x74, 0xdc, 0xff]),
    Vtx([   136,    261,   -155], 0, [   530,    500], [0x24, 0x74, 0xdc, 0xff]),
    Vtx([   259,    210,   -194], 0, [     0,    990], [0x24, 0x74, 0xdc, 0xff]),
    Vtx([   259,    210,    189], 0, [   764,   -144], [0x57, 0x1b, 0x57, 0xff]),
    Vtx([   195,    210,    253], 0, [   368,   -116], [0x57, 0x1b, 0x57, 0xff]),
    Vtx([   259,      5,    253], 0, [   764,   1004], [0x57, 0x1b, 0x57, 0xff]),
    Vtx([   259,    210,    189], 0, [   990,    990], [0x24, 0x73, 0x24, 0xff]),
    Vtx([   136,    261,    151], 0, [   990,   -352], [0x24, 0x73, 0x24, 0xff]),
    Vtx([   195,    210,    253], 0, [   520,    452], [0x24, 0x73, 0x24, 0xff]),
);

// 0x0700DB70 - 0x0700DC60
wf_seg7_vertex_0700DB70 = vList(
    Vtx([  -252,    261,   -155], 0, [  4056,    412], [0x00, 0x71, 0xc8, 0xff]),
    Vtx([   136,    261,   -155], 0, [   950,    412], [0x00, 0x71, 0xc8, 0xff]),
    Vtx([   195,    210,   -258], 0, [   478,    990], [0x00, 0x71, 0xc8, 0xff]),
    Vtx([  -252,      5,    253], 0, [ -2074,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   195,    210,    253], 0, [   408,   -146], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -252,    210,    253], 0, [ -2074,   -146], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -252,    210,    253], 0, [ -3096,    990], [0x00, 0x71, 0x38, 0xff]),
    Vtx([   195,    210,    253], 0, [   480,    990], [0x00, 0x71, 0x38, 0xff]),
    Vtx([  -252,    261,    151], 0, [ -3096,    412], [0x00, 0x71, 0x38, 0xff]),
    Vtx([   136,    261,    151], 0, [     8,    412], [0x00, 0x71, 0x38, 0xff]),
    Vtx([  -252,    261,    151], 0, [     0,  -3138], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   136,    261,   -155], 0, [  1194,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -252,    261,   -155], 0, [  1194,  -3138], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   136,    261,    151], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -252,    210,   -258], 0, [  4056,    990], [0x00, 0x71, 0xc8, 0xff]),
);

// 0x0700DC60 - 0x0700DCE0
wf_seg7_vertex_0700DC60 = vList(
    Vtx([  -252,    210,   -258], 0, [   762,   -146], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   259,      5,   -258], 0, [ -2074,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -252,      5,   -258], 0, [   762,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   195,    210,   -258], 0, [ -1720,   -146], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   136,    261,   -155], 0, [   582,    -72], [0x30, 0x75, 0x00, 0xff]),
    Vtx([   259,    210,    189], 0, [  -796,    990], [0x30, 0x75, 0x00, 0xff]),
    Vtx([   259,    210,   -194], 0, [   734,    990], [0x30, 0x75, 0x00, 0xff]),
    Vtx([   136,    261,    151], 0, [  -644,    -72], [0x30, 0x75, 0x00, 0xff]),
);

// 0x0700DCE0 - 0x0700DD20
wf_seg7_vertex_0700DCE0 = vList(
    Vtx([   259,      5,   -258], 0, [  1118,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   259,    210,   -194], 0, [   958,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   259,    210,    189], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   259,      5,    253], 0, [  -158,    990], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700DD20 - 0x0700DDE8
wf_seg7_dl_0700DD20 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09008000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(wf_seg7_lights_0700DA68.l[0], 1),
    gsSPLight(wf_seg7_lights_0700DA68.a, 2),
    gsSPVertex(wf_seg7_vertex_0700DA80, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(wf_seg7_vertex_0700DB70, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  7,  9,  8, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSP1Triangle( 0,  2, 14, 0x0),
    gsSPVertex(wf_seg7_vertex_0700DC60, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700DDE8 - 0x0700DE20
wf_seg7_dl_0700DDE8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, wf_seg7_texture_07002000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(wf_seg7_vertex_0700DCE0, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700DE20 - 0x0700DE98
wf_seg7_dl_0700DE20 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(wf_seg7_dl_0700DD20),
    gsSPDisplayList(wf_seg7_dl_0700DDE8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);


}