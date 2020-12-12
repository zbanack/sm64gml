// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bbh_model_2_define(){
/// <pygml?v=1.0&h=aad321469>
// 0x0700BA50 - 0x0700BB50
bbh_seg7_vertex_0700BA50 = vList(
    Vtx([  2739,    819,   2166], 0, [     0,    172], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2739,   1203,   2550], 0, [     0,    786], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2739,   1459,   2550], 0, [     0,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2739,      0,   2268], 0, [     0,    212], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2739,    282,   2550], 0, [     0,    746], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2739,    538,   2550], 0, [     0,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2739,      0,   2012], 0, [     0,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2995,      0,   2268], 0, [   990,    212], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2995,    282,   2550], 0, [   990,    746], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2995,    538,   2550], 0, [   990,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2995,      0,   2012], 0, [   990,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2739,    819,   1910], 0, [     0,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2995,    819,   2166], 0, [   990,    172], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2995,    819,   1910], 0, [   990,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2995,   1459,   2550], 0, [   990,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  2995,   1203,   2550], 0, [   990,    786], [0xff, 0xec, 0x40, 0x50]),
);

// 0x0700BB50 - 0x0700BBF8
bbh_seg7_dl_0700BB50 = dList(
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900B000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700BA50, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  4,  3, 0x0),
    gsSP2Triangles( 7,  8,  4, 0x0,  6,  5,  9, 0x0),
    gsSP2Triangles( 6,  9, 10, 0x0, 10,  8,  7, 0x0),
    gsSP2Triangles(10,  9,  8, 0x0,  0,  2, 11, 0x0),
    gsSP2Triangles(12,  1,  0, 0x0, 13, 14, 15, 0x0),
    gsSP2Triangles(12, 15,  1, 0x0, 11,  2, 14, 0x0),
    gsSP2Triangles(11, 14, 13, 0x0, 13, 15, 12, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700BBF8 - 0x0700BC68
bbh_seg7_dl_0700BBF8 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATEIA, G_CC_MODULATEIA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700BB50),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=222372eea>
// 0x0700BC68 - 0x0700BC80
bbh_seg7_lights_0700BC68 = gdSPDefLights1(
    0x20, 0x20, 0x20,
    0x50, 0x50, 0x50, 0x28, 0x28, 0x28
);

// 0x0700BC80 - 0x0700BC98
bbh_seg7_lights_0700BC80 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700BC98 - 0x0700BD18
bbh_seg7_vertex_0700BC98 = vList(
    Vtx([ -2098,      0,   1126], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1945,      0,   1075], 0, [   478,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2098,      0,   1075], 0, [   478,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1945,      0,   1126], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -101,      0,   1536], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -50,      0,   1382], 0, [   478,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -101,      0,   1382], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -50,      0,   1536], 0, [   478,    990], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700BD18 - 0x0700BE18
bbh_seg7_vertex_0700BD18 = vList(
    Vtx([  -101,    717,   2048], 0, [   334,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,    717,   2048], 0, [   334,    650], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -101,    717,   1126], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1330,    717,   1638], 0, [   626,    406], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1330,    717,   1126], 0, [   990,    406], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,    717,   2048], 0, [   332,    650], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2252,    819,   2048], 0, [   334,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1842,    819,   2150], 0, [   260,    162], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2047,    819,   2355], 0, [   114,     66], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2252,    819,   1126], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1842,    819,   1126], 0, [   990,    162], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2252,   1638,   2048], 0, [   334,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,   1638,   2048], 0, [   334,    650], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1228,   1638,   2560], 0, [     0,    454], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,   1638,   1126], 0, [   990,    650], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1842,   1638,   2560], 0, [     0,    162], [0x00, 0x81, 0x00, 0xff]),
);

// 0x0700BE18 - 0x0700BEF8
bbh_seg7_vertex_0700BE18 = vList(
    Vtx([ -2252,   1638,   2048], 0, [   334,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2252,   1638,   1126], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,   1638,   1126], 0, [   990,    650], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -101,    256,   1382], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -50,    256,   1382], 0, [   480,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -50,    256,   1536], 0, [   480,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1945,    256,   1075], 0, [   478,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2098,    256,   1126], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2098,    256,   1075], 0, [   478,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1945,    256,   1126], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1893,   1280,   1075], 0, [   480,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1893,   1280,   1126], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2047,   1280,   1126], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2047,   1280,   1075], 0, [   480,    990], [0x00, 0x81, 0x00, 0xff]),
);

// 0x0700BEF8 - 0x0700BFD8
bbh_seg7_vertex_0700BEF8 = vList(
    Vtx([  -101,    256,   1536], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -50,    256,   1536], 0, [   480,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -50,      0,   1536], 0, [   480,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -101,      0,   1536], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,   1075,   1485], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -767,    819,   1485], 0, [   478,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,    819,   1485], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -101,    256,   1382], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -50,    256,   1536], 0, [   480,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -101,    256,   1536], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -50,    256,   1382], 0, [   480,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -101,      0,   1382], 0, [     0,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   -50,      0,   1382], 0, [   480,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -101,    256,   1382], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x0700BFD8 - 0x0700C088
bbh_seg7_vertex_0700BFD8 = vList(
    Vtx([  -767,   1075,   1331], 0, [   480,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,   1075,   1331], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,    819,   1331], 0, [     0,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -767,    819,   1331], 0, [   480,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,   1075,   1485], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -767,   1075,   1485], 0, [   478,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -767,    819,   1485], 0, [   478,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,   1075,   1331], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -767,   1075,   1331], 0, [   480,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -767,   1075,   1485], 0, [   480,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,   1075,   1485], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
);

// 0x0700C088 - 0x0700C188
bbh_seg7_vertex_0700C088 = vList(
    Vtx([ -1330,    819,   1638], 0, [     0,      0], [0xb1, 0x00, 0x63, 0xff]),
    Vtx([ -1330,    717,   1638], 0, [     0,    990], [0xb1, 0x00, 0x63, 0xff]),
    Vtx([  -818,    717,   2048], 0, [  4330,    990], [0xb1, 0x00, 0x63, 0xff]),
    Vtx([  -818,    819,   2048], 0, [  4330,      0], [0xb1, 0x00, 0x63, 0xff]),
    Vtx([ -1330,    819,   1638], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1330,    717,   1126], 0, [ -2414,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1330,    717,   1638], 0, [   990,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1330,    819,   1126], 0, [ -2414,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -2047,   1024,   2355], 0, [  -158,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -2047,    819,   2355], 0, [  -158,    990], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -1842,   1024,   2150], 0, [   990,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -1842,    819,   2150], 0, [   990,    990], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -1842,    819,   1126], 0, [  5078,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1842,   1024,   1126], 0, [  5078,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1842,   1024,   2150], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1842,    819,   2150], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700C188 - 0x0700C268
bbh_seg7_vertex_0700C188 = vList(
    Vtx([ -1279,   1382,   1126], 0, [  2268,   1372], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,   1638,   1126], 0, [  4566,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,   1638,   1126], 0, [ -2584,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -869,   1382,   1126], 0, [  4312,   1372], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,    819,   1126], 0, [  4566,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -869,    922,   1126], 0, [  4312,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1279,    922,   1126], 0, [  2268,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1842,    819,   1126], 0, [  -540,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1228,   1638,   2560], 0, [     0,   2012], [0x9d, 0x00, 0xb1, 0xff]),
    Vtx([  -818,    819,   2048], 0, [ -2074,      0], [0x9d, 0x00, 0xb1, 0xff]),
    Vtx([ -1228,    819,   2560], 0, [     0,      0], [0x9d, 0x00, 0xb1, 0xff]),
    Vtx([  -818,   1638,   2048], 0, [ -3606,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1075,   1485], 0, [  -796,    608], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,    819,   2048], 0, [ -3606,      0], [0x81, 0x00, 0x00, 0xff]),
);

// 0x0700C268 - 0x0700C358
bbh_seg7_vertex_0700C268 = vList(
    Vtx([ -2252,   1638,   2048], 0, [ -3606,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,    819,   2048], 0, [ -3606,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,    819,   1126], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,   1638,   1126], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,      0,   1126], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,      0,   2048], 0, [ -3606,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1228,   1638,   2560], 0, [     0,   2012], [0x9d, 0x00, 0xb1, 0xff]),
    Vtx([  -818,   1638,   2048], 0, [ -2074,   2012], [0x9d, 0x00, 0xb1, 0xff]),
    Vtx([  -818,    819,   2048], 0, [ -2074,      0], [0x9d, 0x00, 0xb1, 0xff]),
    Vtx([  -818,      0,   2048], 0, [ -2074,   2012], [0x9d, 0x00, 0xb1, 0xff]),
    Vtx([ -1228,    819,   2560], 0, [     0,      0], [0x9d, 0x00, 0xb1, 0xff]),
    Vtx([ -1228,      0,   2560], 0, [     0,   2012], [0x9d, 0x00, 0xb1, 0xff]),
    Vtx([ -1228,    819,   2560], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1228,      0,   2560], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1842,      0,   2560], 0, [  3034,   2012], [0x00, 0x00, 0x81, 0xff]),
);

// 0x0700C358 - 0x0700C458
bbh_seg7_vertex_0700C358 = vList(
    Vtx([ -1842,   1638,   2560], 0, [  3034,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1228,   1638,   2560], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1228,    819,   2560], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1842,    819,   2560], 0, [  3034,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1842,      0,   2560], 0, [  3034,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2252,   1638,   2048], 0, [  5078,   2012], [0x63, 0x00, 0xb1, 0xff]),
    Vtx([ -1842,    819,   2560], 0, [  3034,      0], [0x63, 0x00, 0xb1, 0xff]),
    Vtx([ -2252,    819,   2048], 0, [  5078,      0], [0x63, 0x00, 0xb1, 0xff]),
    Vtx([ -1842,   1638,   2560], 0, [  3034,   2012], [0x63, 0x00, 0xb1, 0xff]),
    Vtx([ -1842,    819,   2560], 0, [     0,      0], [0x63, 0x00, 0xb1, 0xff]),
    Vtx([ -1842,      0,   2560], 0, [     0,   2012], [0x63, 0x00, 0xb1, 0xff]),
    Vtx([ -2252,      0,   2048], 0, [  3240,   2012], [0x63, 0x00, 0xb1, 0xff]),
    Vtx([ -2252,    819,   2048], 0, [  3240,      0], [0x63, 0x00, 0xb1, 0xff]),
    Vtx([ -2252,   1024,   1126], 0, [ -2584,    480], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2047,   1024,   1126], 0, [ -1562,    480], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,   1638,   1126], 0, [ -2584,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x0700C458 - 0x0700C548
bbh_seg7_vertex_0700C458 = vList(
    Vtx([ -2047,   1024,   1126], 0, [ -1562,    480], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2047,   1280,   1126], 0, [ -1562,   1116], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,   1638,   1126], 0, [ -2584,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1893,   1280,   1126], 0, [  -796,   1116], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1279,   1382,   1126], 0, [  2268,   1372], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1893,   1024,   1126], 0, [  -796,    480], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1842,    819,   1126], 0, [  -540,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1279,    922,   1126], 0, [  2268,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,    717,   1126], 0, [  7122,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,    819,   1126], 0, [  7122,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,    819,   1126], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2098,    256,   1126], 0, [   734,   1372], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1945,    256,   1126], 0, [  1502,   1372], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,      0,   1126], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2098,      0,   1126], 0, [   734,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x0700C548 - 0x0700C648
bbh_seg7_vertex_0700C548 = vList(
    Vtx([ -1945,      0,   1126], 0, [  1502,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -101,    717,   1126], 0, [ 10700,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1945,    256,   1126], 0, [  1502,   1372], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1893,   1280,   1126], 0, [  -796,   1116], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1279,    922,   1126], 0, [  2266,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1279,   1382,   1126], 0, [  2268,   1372], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,   1075,   1331], 0, [     0,    608], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1075,   1485], 0, [  -796,    608], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1638,   2048], 0, [ -3606,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,    717,   2048], 0, [ -2074,    224], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -101,      0,   2048], 0, [ -5650,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,      0,   2048], 0, [ -2074,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,    819,   1485], 0, [  -796,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,    819,   2048], 0, [ -3606,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1638,   1126], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,    819,   1126], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
);

// 0x0700C648 - 0x0700C748
bbh_seg7_vertex_0700C648 = vList(
    Vtx([  -818,    819,   1126], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,    819,   1331], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1075,   1331], 0, [     0,    608], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1945,      0,   1126], 0, [  1502,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -101,      0,   1126], 0, [ 10700,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -101,    717,   1126], 0, [ 10700,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,    717,   2048], 0, [ -2074,    224], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -101,    717,   2048], 0, [ -5650,    224], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -101,      0,   2048], 0, [ -5650,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,    717,   1126], 0, [  7122,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1945,    256,   1126], 0, [  1502,   1372], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -101,    256,   1382], 0, [  -286,   1372], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,    717,   2048], 0, [ -3606,    224], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,    717,   1126], 0, [   990,    224], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,    256,   1536], 0, [ -1052,   1372], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,      0,   1382], 0, [  -286,   2012], [0x81, 0x00, 0x00, 0xff]),
);

// 0x0700C748 - 0x0700C838
bbh_seg7_vertex_0700C748 = vList(
    Vtx([  -101,    717,   2048], 0, [ -3606,    224], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,      0,   1536], 0, [ -1052,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,      0,   2048], 0, [ -3606,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,    256,   1536], 0, [ -1052,   1372], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,      0,   1382], 0, [  -286,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,    717,   1126], 0, [   990,    224], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,      0,   1126], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -2252,      0,   2048], 0, [  3240,   2012], [0xf5, 0x00, 0x82, 0xff]),
    Vtx([ -2068,    256,   2032], 0, [  2728,   1244], [0xf5, 0x00, 0x82, 0xff]),
    Vtx([ -2068,      0,   2032], 0, [  2728,   2012], [0xf5, 0x00, 0x82, 0xff]),
    Vtx([ -2252,    256,   2048], 0, [  3240,   1244], [0xf5, 0x00, 0x82, 0xff]),
    Vtx([ -1786,      0,   2384], 0, [   478,   2012], [0x79, 0x00, 0x26, 0xff]),
    Vtx([ -1842,    256,   2560], 0, [     0,   1244], [0x79, 0x00, 0x26, 0xff]),
    Vtx([ -1842,      0,   2560], 0, [     0,   2012], [0x79, 0x00, 0x26, 0xff]),
    Vtx([ -1786,    256,   2384], 0, [   478,   1244], [0x79, 0x00, 0x26, 0xff]),
);

// 0x0700C838 - 0x0700C878
bbh_seg7_vertex_0700C838 = vList(
    Vtx([ -1842,    256,   2560], 0, [   990,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1786,    256,   2384], 0, [     0,   1696], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2068,    256,   2032], 0, [     0,    312], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,    256,   2048], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700C878 - 0x0700C978
bbh_seg7_vertex_0700C878 = vList(
    Vtx([ -2047,   1280,   1126], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2047,   1024,   1126], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2047,   1024,   1075], 0, [   480,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2098,    256,   1126], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2098,      0,   1126], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2098,      0,   1075], 0, [   478,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2098,    256,   1075], 0, [   478,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1945,      0,   1075], 0, [   478,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1945,    256,   1126], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1945,    256,   1075], 0, [   478,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1945,      0,   1126], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1893,   1024,   1075], 0, [   480,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1893,   1024,   1126], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1893,   1280,   1126], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1893,   1280,   1075], 0, [   480,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -2047,   1280,   1075], 0, [   480,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700C978 - 0x0700C9B8
bbh_seg7_vertex_0700C978 = vList(
    Vtx([ -2068,      0,   2032], 0, [  3034,   2012], [0x63, 0x00, 0xb1, 0xff]),
    Vtx([ -2068,    256,   2032], 0, [  3034,      0], [0x63, 0x00, 0xb1, 0xff]),
    Vtx([ -1786,    256,   2384], 0, [     0,      0], [0x63, 0x00, 0xb1, 0xff]),
    Vtx([ -1786,      0,   2384], 0, [     0,   2012], [0x63, 0x00, 0xb1, 0xff]),
);

// 0x0700C9B8 - 0x0700CAA8
bbh_seg7_vertex_0700C9B8 = vList(
    Vtx([ -2252,      0,   1126], 0, [ -7180,  -5142], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,      0,   2048], 0, [  7120,   4054], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -101,      0,   1126], 0, [ 14276,  -5142], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,      0,   2048], 0, [ -7180,   4054], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1842,      0,   2560], 0, [ -3092,   9164], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1228,      0,   2560], 0, [  3032,   9164], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -101,      0,   2048], 0, [ 14276,   4054], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2047,   1024,   1126], 0, [ -1052,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1893,   1024,   1126], 0, [ -1052,  -1566], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1893,   1024,   1075], 0, [ -1560,  -1566], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1842,   1024,   1126], 0, [ -1052,  -2076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,   1024,   2048], 0, [  8144,   2010], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2047,   1024,   2355], 0, [ 11212,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1842,   1024,   2150], 0, [  9168,  -2076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,   1024,   1126], 0, [ -1052,   2010], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700CAA8 - 0x0700CB58
bbh_seg7_vertex_0700CAA8 = vList(
    Vtx([ -1330,    819,   1126], 0, [ -2072,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1330,    819,   1638], 0, [ -2072,   5076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,   2048], 0, [  3036,   9164], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,   1126], 0, [  3032,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2047,   1024,   1126], 0, [ -1052,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1893,   1024,   1075], 0, [ -1560,  -1566], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2047,   1024,   1075], 0, [ -1560,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,   1485], 0, [  3032,   3542], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -767,    819,   1331], 0, [  3544,   2010], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,   1331], 0, [  3032,   2010], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -767,    819,   1485], 0, [  3544,   3542], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700CB58 - 0x0700CCB0
bbh_seg7_dl_0700CB58 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_0700BC68.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700BC68.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700BC98, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPLight(bbh_seg7_lights_0700BC80.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700BC80.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700BD18, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  2,  3,  4, 0x0),
    gsSP2Triangles( 2,  5,  3, 0x0,  6,  7,  8, 0x0),
    gsSP2Triangles( 6,  9, 10, 0x0,  6, 10,  7, 0x0),
    gsSP2Triangles(11, 12, 13, 0x0, 11, 14, 12, 0x0),
    gsSP1Triangle(11, 13, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700BE18, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700BEF8, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700BFD8, 11, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP1Triangle( 7,  9, 10, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700CCB0 - 0x0700CD18
bbh_seg7_dl_0700CCB0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09004800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700C088, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  9, 11, 10, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700CD18 - 0x0700CF40
bbh_seg7_dl_0700CD18 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07000000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700C188, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 3,  4,  1, 0x0,  3,  5,  4, 0x0),
    gsSP2Triangles( 5,  6,  4, 0x0,  6,  7,  4, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700C268, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 1,  4,  2, 0x0,  1,  5,  4, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  8,  9, 10, 0x0),
    gsSP2Triangles( 9, 11, 10, 0x0, 12, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700C358, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 2,  4,  3, 0x0,  5,  6,  7, 0x0),
    gsSP2Triangles( 5,  8,  6, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 9, 11, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700C458, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  1,  3,  2, 0x0),
    gsSP2Triangles( 3,  4,  2, 0x0,  5,  6,  7, 0x0),
    gsSP2Triangles( 3,  5,  7, 0x0,  8,  9, 10, 0x0),
    gsSP2Triangles(11, 12, 10, 0x0, 12,  8, 10, 0x0),
    gsSP2Triangles(10, 13, 14, 0x0, 10, 14, 11, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700C548, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 7, 12, 13, 0x0,  6,  8, 14, 0x0),
    gsSP1Triangle(15,  6, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700C648, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  5,  9, 10, 0x0),
    gsSP2Triangles(11, 12, 13, 0x0, 11, 14, 12, 0x0),
    gsSP1Triangle(15, 11, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700C748, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700C838, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700CF40 - 0x0700CFA8
bbh_seg7_dl_0700CF40 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09003800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700C878, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 13, 14, 0x0,  0,  2, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700CFA8 - 0x0700CFE0
bbh_seg7_dl_0700CFA8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09002800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700C978, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700CFE0 - 0x0700D080
bbh_seg7_dl_0700CFE0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09009000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700C9B8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 0,  3,  1, 0x0,  3,  5,  1, 0x0),
    gsSP2Triangles( 1,  6,  2, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle(10, 14, 11, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700CAA8, 11, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP1Triangle( 7, 10,  8, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700D080 - 0x0700D178
bbh_seg7_dl_0700D080 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700CB58),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700CCB0),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700CD18),
    gsSPDisplayList(bbh_seg7_dl_0700CF40),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700CFA8),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700CFE0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=b79256c02>
// 0x0700D178 - 0x0700D278
bbh_seg7_vertex_0700D178 = vList(
    Vtx([ -2037,   1024,   2316], 0, [ -1470,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1863,   1126,   2142], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -2037,   1126,   2316], 0, [ -1470,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1310,    819,   1126], 0, [  4980,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1310,    922,   1126], 0, [  4980,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1310,    922,   1629], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1310,    819,   1629], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1310,    922,   1629], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -805,    922,   2032], 0, [ -5454,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -805,    819,   2032], 0, [ -5454,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1310,    819,   1629], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1863,   1024,   1126], 0, [ 10104,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1863,   1126,   2142], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1863,   1024,   2142], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1863,   1126,   1126], 0, [ 10104,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([ -1863,   1024,   2142], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
);

// 0x0700D278 - 0x0700D2E0
bbh_seg7_dl_0700D278 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700D178, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 14, 12, 0x0,  0, 15,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700D2E0 - 0x0700D350
bbh_seg7_dl_0700D2E0 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700D278),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=5ffc12609>
// 0x0700D350 - 0x0700D368
bbh_seg7_lights_0700D350 = gdSPDefLights1(
    0x3f, 0x51, 0x66,
    0x9e, 0xcc, 0xff, 0x28, 0x28, 0x28
);

// 0x0700D368 - 0x0700D428
bbh_seg7_vertex_0700D368 = vList(
    Vtx([ -1740,   1536,   2550], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1330,   1536,   2550], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1330,   1126,   2550], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1740,   1126,   2550], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1740,    614,   2550], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1330,    614,   2550], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1330,    205,   2550], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1740,    205,   2550], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -613,    614,   2038], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -204,    614,   2038], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -204,    205,   2038], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -613,    205,   2038], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
);

// 0x0700D428 - 0x0700D490
bbh_seg7_dl_0700D428 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09006000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_0700D350.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700D350.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700D368, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700D490 - 0x0700D500
bbh_seg7_dl_0700D490 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700D428),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=2c6cab8e8>
// 0x0700D500 - 0x0700D600
bbh_seg7_vertex_0700D500 = vList(
    Vtx([  -537,      0,   1756], 0, [     0,    212], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  -537,    282,   2038], 0, [     0,    746], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  -537,    538,   2038], 0, [     0,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1663,   1357,   2447], 0, [   734,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1407,   1459,   2550], 0, [   990,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1407,   1357,   2447], 0, [   734,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1663,   1459,   2550], 0, [   990,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1663,   1101,   2447], 0, [    96,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1663,   1203,   2550], 0, [   352,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1407,   1203,   2550], 0, [   352,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1407,   1101,   2447], 0, [    96,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  -281,      0,   1756], 0, [   990,    212], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  -537,      0,   1500], 0, [     0,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1663,      0,   2268], 0, [     0,    212], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1663,    282,   2550], 0, [     0,    746], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1663,    538,   2550], 0, [     0,    990], [0xff, 0xec, 0x40, 0x50]),
);

// 0x0700D600 - 0x0700D6F0
bbh_seg7_vertex_0700D600 = vList(
    Vtx([  -281,      0,   1756], 0, [   990,    212], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  -281,    282,   2038], 0, [   990,    746], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  -537,    282,   2038], 0, [     0,    746], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  -537,      0,   1500], 0, [     0,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  -537,    538,   2038], 0, [     0,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  -281,    538,   2038], 0, [   990,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([  -281,      0,   1500], 0, [   990,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1663,      0,   2012], 0, [     0,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1407,    538,   2550], 0, [   990,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1407,      0,   2012], 0, [   990,      0], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1663,    538,   2550], 0, [     0,    990], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1663,      0,   2268], 0, [     0,    212], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1407,    282,   2550], 0, [   990,    746], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1407,      0,   2268], 0, [   990,    212], [0xff, 0xec, 0x40, 0x50]),
    Vtx([ -1663,    282,   2550], 0, [     0,    746], [0xff, 0xec, 0x40, 0x50]),
);

// 0x0700D6F0 - 0x0700D7E0
bbh_seg7_dl_0700D6F0 = dList(
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900B000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700D500, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  6,  3, 0x0),
    gsSP2Triangles( 7,  8,  6, 0x0,  5,  4,  9, 0x0),
    gsSP2Triangles( 5,  9, 10, 0x0, 10,  9,  8, 0x0),
    gsSP2Triangles(10,  8,  7, 0x0, 11,  1,  0, 0x0),
    gsSP2Triangles( 0,  2, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700D600, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  6,  5,  1, 0x0),
    gsSP2Triangles( 6,  1,  0, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 10,  7, 0x0),
    gsSP2Triangles( 9,  8, 12, 0x0,  9, 12, 13, 0x0),
    gsSP2Triangles(13, 12, 14, 0x0, 13, 14, 11, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700D7E0 - 0x0700D850
bbh_seg7_dl_0700D7E0 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATEIA, G_CC_MODULATEIA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700D6F0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=4d4aed959>
// 0x0700D850 - 0x0700D868
bbh_seg7_lights_0700D850 = gdSPDefLights1(
    0x20, 0x20, 0x20,
    0x50, 0x50, 0x50, 0x28, 0x28, 0x28
);

// 0x0700D868 - 0x0700D880
bbh_seg7_lights_0700D868 = gdSPDefLights1(
    0x3c, 0x3c, 0x3c,
    0x96, 0x96, 0x96, 0x28, 0x28, 0x28
);

// 0x0700D880 - 0x0700D898
bbh_seg7_lights_0700D880 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700D898 - 0x0700D918
bbh_seg7_vertex_0700D898 = vList(
    Vtx([  3430,      0,   1075], 0, [   478,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3277,      0,   1024], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3277,      0,   1075], 0, [   478,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3430,      0,   1024], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1690,      0,    -50], 0, [   478,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1536,      0,   -101], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1536,      0,    -50], 0, [   478,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1690,      0,   -101], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700D918 - 0x0700D9B8
bbh_seg7_vertex_0700D918 = vList(
    Vtx([  1126,      0,  -1535], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1126,      0,   -101], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2150,      0,   -101], 0, [   504,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3277,      0,  -1228], 0, [     0,    772], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3277,      0,  -1535], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2150,      0,  -1228], 0, [   504,    772], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3584,      0,   1024], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2662,      0,   -306], 0, [   458,    352], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2662,      0,   1024], 0, [   990,    352], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3584,      0,   -306], 0, [   458,      0], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700D9B8 - 0x0700DA98
bbh_seg7_vertex_0700D9B8 = vList(
    Vtx([  3584,    717,  -1535], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3584,    717,   1024], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2150,    717,   1024], 0, [   394,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2150,    717,   -101], 0, [   394,    418], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1126,    717,   -101], 0, [     0,    418], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1126,    717,  -1535], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1536,    256,   -101], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1690,    256,    -50], 0, [   478,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1536,    256,    -50], 0, [   478,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1690,    256,   -101], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1690,    256,   -101], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1690,      0,    -50], 0, [   480,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1690,    256,    -50], 0, [   480,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1690,      0,   -101], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
);

// 0x0700DA98 - 0x0700DB98
bbh_seg7_vertex_0700DA98 = vList(
    Vtx([  3277,    256,   1024], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3430,    256,   1024], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3430,    256,   1075], 0, [   480,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1536,      0,    -50], 0, [   478,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1536,    256,   -101], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1536,    256,    -50], 0, [   478,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1536,      0,   -101], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3277,      0,   1075], 0, [   478,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3277,    256,   1024], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3277,    256,   1075], 0, [   478,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3277,      0,   1024], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3430,    256,   1024], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3430,      0,   1024], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3430,      0,   1075], 0, [   480,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3430,    256,   1075], 0, [   480,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3277,    256,   1075], 0, [   480,      0], [0x00, 0x81, 0x00, 0xff]),
);

// 0x0700DB98 - 0x0700DC88
bbh_seg7_vertex_0700DB98 = vList(
    Vtx([  3174,    102,   -347], 0, [   478,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3174,    102,   -245], 0, [   840,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3174,   -101,   -245], 0, [   840,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3174,      0,   -347], 0, [   478,   1500], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3174,   -101,   -245], 0, [   840,   2012], [0x00, 0xa6, 0xa7, 0xff]),
    Vtx([  3072,   -101,   -245], 0, [   480,   2012], [0x00, 0xa6, 0xa7, 0xff]),
    Vtx([  3174,      0,   -347], 0, [   480,   1500], [0x00, 0xa6, 0xa7, 0xff]),
    Vtx([  3072,      0,   -347], 0, [   118,   1500], [0x00, 0xa6, 0xa7, 0xff]),
    Vtx([  2867,   -101,   -245], 0, [  -242,   2012], [0x00, 0xa6, 0xa7, 0xff]),
    Vtx([  2765,   -101,   -245], 0, [  -602,   2012], [0x00, 0xa6, 0xa7, 0xff]),
    Vtx([  2867,      0,   -347], 0, [  -602,   1500], [0x00, 0xa6, 0xa7, 0xff]),
    Vtx([  2765,      0,   -347], 0, [  -964,   1500], [0x00, 0xa6, 0xa7, 0xff]),
    Vtx([  3174,      0,   -347], 0, [   478,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3072,      0,   -347], 0, [   118,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3072,    102,   -347], 0, [   118,    988], [0x00, 0x00, 0x81, 0xff]),
);

// 0x0700DC88 - 0x0700DD78
bbh_seg7_vertex_0700DC88 = vList(
    Vtx([  3072,      0,   -347], 0, [   118,   1500], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3072,   -101,   -245], 0, [   478,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3072,    102,   -245], 0, [   478,    992], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3072,    102,   -347], 0, [   118,    988], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3174,      0,   -347], 0, [   478,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3072,    102,   -347], 0, [   118,    988], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3174,    102,   -347], 0, [   478,    992], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3072,      0,   -245], 0, [   478,   1500], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3174,    102,   -245], 0, [   840,    992], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3072,    102,   -245], 0, [   478,    992], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3174,      0,   -245], 0, [   840,   1500], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2867,    102,   -347], 0, [  -602,    988], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2867,   -101,   -245], 0, [  -242,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2867,      0,   -347], 0, [  -602,   1500], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2867,    102,   -245], 0, [  -242,    988], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700DD78 - 0x0700DE68
bbh_seg7_vertex_0700DD78 = vList(
    Vtx([  2765,      0,   -245], 0, [  -602,   1500], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2867,      0,   -245], 0, [  -242,   1500], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2867,    102,   -245], 0, [  -242,    988], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2765,    102,   -245], 0, [  -602,    988], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2765,      0,   -347], 0, [  -964,   1500], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2765,   -101,   -245], 0, [  -602,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2765,    102,   -245], 0, [  -602,    988], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2765,    102,   -347], 0, [  -964,    988], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2867,      0,   -347], 0, [  -602,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2765,    102,   -347], 0, [  -964,    988], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2867,    102,   -347], 0, [  -602,    988], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2765,      0,   -347], 0, [  -964,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3174,    102,   -347], 0, [   478,   1756], [0x00, 0x58, 0xa6, 0xff]),
    Vtx([  3072,    102,   -347], 0, [   118,   1756], [0x00, 0x58, 0xa6, 0xff]),
    Vtx([  3123,    154,   -296], 0, [   478,   1244], [0x00, 0x58, 0xa6, 0xff]),
);

// 0x0700DE68 - 0x0700DF58
bbh_seg7_vertex_0700DE68 = vList(
    Vtx([  3123,    154,   -296], 0, [   478,   1244], [0x5a, 0x58, 0x00, 0xff]),
    Vtx([  3174,    102,   -245], 0, [   840,   1756], [0x5a, 0x58, 0x00, 0xff]),
    Vtx([  3174,    102,   -347], 0, [   478,   1756], [0x5a, 0x58, 0x00, 0xff]),
    Vtx([  3072,    102,   -245], 0, [   478,   1756], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  3123,    154,   -296], 0, [   478,   1244], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  3072,    102,   -347], 0, [   118,   1756], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  3174,    102,   -245], 0, [   840,   1756], [0x00, 0x58, 0x5a, 0xff]),
    Vtx([  3123,    154,   -296], 0, [   478,   1244], [0x00, 0x58, 0x5a, 0xff]),
    Vtx([  3072,    102,   -245], 0, [   478,   1756], [0x00, 0x58, 0x5a, 0xff]),
    Vtx([  2867,    102,   -245], 0, [  -242,   1756], [0x00, 0x58, 0x5a, 0xff]),
    Vtx([  2816,    154,   -296], 0, [  -602,   1244], [0x00, 0x58, 0x5a, 0xff]),
    Vtx([  2765,    102,   -245], 0, [  -602,   1756], [0x00, 0x58, 0x5a, 0xff]),
    Vtx([  2816,    154,   -296], 0, [  -602,   1244], [0x5a, 0x58, 0x00, 0xff]),
    Vtx([  2867,    102,   -245], 0, [  -242,   1756], [0x5a, 0x58, 0x00, 0xff]),
    Vtx([  2867,    102,   -347], 0, [  -602,   1756], [0x5a, 0x58, 0x00, 0xff]),
);

// 0x0700DF58 - 0x0700E058
bbh_seg7_vertex_0700DF58 = vList(
    Vtx([  1126,      0,  -1330], 0, [  2524,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    717,  -1330], 0, [  2524,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    717,   -306], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2867,    102,   -347], 0, [  -602,   1756], [0x00, 0x58, 0xa6, 0xff]),
    Vtx([  2765,    102,   -347], 0, [  -964,   1756], [0x00, 0x58, 0xa6, 0xff]),
    Vtx([  2816,    154,   -296], 0, [  -602,   1244], [0x00, 0x58, 0xa6, 0xff]),
    Vtx([  2765,    102,   -245], 0, [  -602,   1756], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  2816,    154,   -296], 0, [  -602,   1244], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  2765,    102,   -347], 0, [  -964,   1756], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  3430,    256,   1024], 0, [   352,   1284], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2355,    717,   1024], 0, [  3034,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3584,    717,   1024], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3584,      0,   1024], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3430,      0,   1024], 0, [   352,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3277,    256,   1024], 0, [   734,   1284], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2355,      0,   1024], 0, [  3034,   2012], [0x00, 0x00, 0x81, 0xff]),
);

// 0x0700E058 - 0x0700E158
bbh_seg7_vertex_0700E058 = vList(
    Vtx([  2355,      0,   1024], 0, [  3034,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3277,    256,   1024], 0, [   734,   1284], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3277,      0,   1024], 0, [   734,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3584,    717,  -1535], 0, [  3546,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1331,      0,  -1535], 0, [ -2074,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3584,      0,  -1535], 0, [  3546,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,      0,  -1330], 0, [  2524,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    717,   -306], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,      0,   -306], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2150,      0,      0], 0, [  2012,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2150,    717,      0], 0, [  2012,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2150,    717,    819], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2150,      0,    819], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3584,      0,   1024], 0, [  4312,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,    717,  -1535], 0, [ -2074,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,      0,  -1535], 0, [ -2074,   2012], [0x81, 0x00, 0x00, 0xff]),
);

// 0x0700E158 - 0x0700E258
bbh_seg7_vertex_0700E158 = vList(
    Vtx([  3584,      0,   1024], 0, [  4312,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,    717,   1024], 0, [  4312,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,    717,  -1535], 0, [ -2074,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,    717,  -1535], 0, [  3546,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1331,    717,  -1535], 0, [ -2074,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1331,      0,  -1535], 0, [ -2074,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3174,    102,  -1187], 0, [   478,    992], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3072,    102,  -1187], 0, [   118,    988], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3072,      0,  -1187], 0, [   118,   1500], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1690,    256,   -101], 0, [   352,   1280], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1536,    256,   -101], 0, [   734,   1280], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1331,    717,   -101], 0, [  1246,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1946,    717,   -101], 0, [  -286,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1690,      0,   -101], 0, [   352,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1536,      0,   -101], 0, [   734,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1331,      0,   -101], 0, [  1246,   2012], [0x00, 0x00, 0x81, 0xff]),
);

// 0x0700E258 - 0x0700E338
bbh_seg7_vertex_0700E258 = vList(
    Vtx([  1690,      0,   -101], 0, [   352,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1946,    717,   -101], 0, [  -286,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1946,      0,   -101], 0, [  -286,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2867,      0,  -1187], 0, [  -602,   1500], [0x00, 0xa6, 0x59, 0xff]),
    Vtx([  2765,      0,  -1187], 0, [  -964,   1500], [0x00, 0xa6, 0x59, 0xff]),
    Vtx([  2765,   -101,  -1289], 0, [  -602,   2012], [0x00, 0xa6, 0x59, 0xff]),
    Vtx([  2867,   -101,  -1289], 0, [  -242,   2012], [0x00, 0xa6, 0x59, 0xff]),
    Vtx([  2867,      0,  -1187], 0, [  -602,   1500], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2867,   -101,  -1289], 0, [  -242,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2867,    102,  -1289], 0, [  -242,    988], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3072,    102,  -1187], 0, [   118,    988], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3072,    102,  -1289], 0, [   478,    992], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3072,   -101,  -1289], 0, [   478,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3072,      0,  -1187], 0, [   118,   1500], [0x81, 0x00, 0x00, 0xff]),
);

// 0x0700E338 - 0x0700E418
bbh_seg7_vertex_0700E338 = vList(
    Vtx([  3174,    102,  -1187], 0, [   478,    992], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3072,      0,  -1187], 0, [   118,   1500], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3174,      0,  -1187], 0, [   478,   1500], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3072,    102,  -1289], 0, [   478,    992], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3174,      0,  -1289], 0, [   840,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3072,      0,  -1289], 0, [   478,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3174,    102,  -1289], 0, [   840,    992], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3174,      0,  -1187], 0, [   478,   1500], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3174,   -101,  -1289], 0, [   840,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3174,    102,  -1289], 0, [   840,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3174,    102,  -1187], 0, [   478,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3174,      0,  -1187], 0, [   480,   1500], [0x00, 0xa6, 0x59, 0xff]),
    Vtx([  3072,   -101,  -1289], 0, [   480,   2012], [0x00, 0xa6, 0x59, 0xff]),
    Vtx([  3174,   -101,  -1289], 0, [   840,   2012], [0x00, 0xa6, 0x59, 0xff]),
);

// 0x0700E418 - 0x0700E508
bbh_seg7_vertex_0700E418 = vList(
    Vtx([  2765,    102,  -1289], 0, [  -602,    988], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2867,      0,  -1289], 0, [  -242,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2765,      0,  -1289], 0, [  -602,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2867,      0,  -1187], 0, [  -602,   1500], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2867,    102,  -1289], 0, [  -242,    988], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2867,    102,  -1187], 0, [  -602,    988], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2867,    102,  -1187], 0, [  -602,    988], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2765,    102,  -1187], 0, [  -964,    988], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2765,      0,  -1187], 0, [  -964,   1500], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2765,    102,  -1187], 0, [  -964,    988], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2765,    102,  -1289], 0, [  -602,    988], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2765,   -101,  -1289], 0, [  -602,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2765,      0,  -1187], 0, [  -964,   1500], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2867,      0,  -1187], 0, [  -602,   1500], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2867,    102,  -1289], 0, [  -242,    988], [0x00, 0x00, 0x81, 0xff]),
);

// 0x0700E508 - 0x0700E5F8
bbh_seg7_vertex_0700E508 = vList(
    Vtx([  3174,      0,  -1187], 0, [   480,   1500], [0x00, 0xa6, 0x59, 0xff]),
    Vtx([  3072,      0,  -1187], 0, [   118,   1500], [0x00, 0xa6, 0x59, 0xff]),
    Vtx([  3072,   -101,  -1289], 0, [   480,   2012], [0x00, 0xa6, 0x59, 0xff]),
    Vtx([  3174,    102,  -1187], 0, [   478,   1756], [0x5a, 0x58, 0x00, 0xff]),
    Vtx([  3174,    102,  -1289], 0, [   840,   1756], [0x5a, 0x58, 0x00, 0xff]),
    Vtx([  3123,    154,  -1238], 0, [   478,   1244], [0x5a, 0x58, 0x00, 0xff]),
    Vtx([  3123,    154,  -1238], 0, [   478,   1244], [0x00, 0x58, 0x5a, 0xff]),
    Vtx([  3072,    102,  -1187], 0, [   118,   1756], [0x00, 0x58, 0x5a, 0xff]),
    Vtx([  3174,    102,  -1187], 0, [   478,   1756], [0x00, 0x58, 0x5a, 0xff]),
    Vtx([  3072,    102,  -1187], 0, [   118,   1756], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  3123,    154,  -1238], 0, [   478,   1244], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  3072,    102,  -1289], 0, [   478,   1756], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  3072,    102,  -1289], 0, [   478,   1756], [0x00, 0x58, 0xa6, 0xff]),
    Vtx([  3123,    154,  -1238], 0, [   478,   1244], [0x00, 0x58, 0xa6, 0xff]),
    Vtx([  3174,    102,  -1289], 0, [   840,   1756], [0x00, 0x58, 0xa6, 0xff]),
);

// 0x0700E5F8 - 0x0700E6B8
bbh_seg7_vertex_0700E5F8 = vList(
    Vtx([  2765,    102,  -1289], 0, [  -602,   1756], [0x00, 0x58, 0xa6, 0xff]),
    Vtx([  2816,    154,  -1238], 0, [  -602,   1244], [0x00, 0x58, 0xa6, 0xff]),
    Vtx([  2867,    102,  -1289], 0, [  -242,   1756], [0x00, 0x58, 0xa6, 0xff]),
    Vtx([  2765,    102,  -1187], 0, [  -964,   1756], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  2816,    154,  -1238], 0, [  -602,   1244], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  2765,    102,  -1289], 0, [  -602,   1756], [0xa6, 0x58, 0x00, 0xff]),
    Vtx([  2867,    102,  -1187], 0, [  -602,   1756], [0x5a, 0x58, 0x00, 0xff]),
    Vtx([  2867,    102,  -1289], 0, [  -242,   1756], [0x5a, 0x58, 0x00, 0xff]),
    Vtx([  2816,    154,  -1238], 0, [  -602,   1244], [0x5a, 0x58, 0x00, 0xff]),
    Vtx([  2816,    154,  -1238], 0, [  -602,   1244], [0x00, 0x58, 0x5a, 0xff]),
    Vtx([  2765,    102,  -1187], 0, [  -964,   1756], [0x00, 0x58, 0x5a, 0xff]),
    Vtx([  2867,    102,  -1187], 0, [  -602,   1756], [0x00, 0x58, 0x5a, 0xff]),
);

// 0x0700E6B8 - 0x0700E7A8
bbh_seg7_vertex_0700E6B8 = vList(
    Vtx([  3584,   -716,   -306], 0, [     0,   3540], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2662,   -716,   -306], 0, [  4566,   3540], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2662,      0,   -306], 0, [  4566,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3584,   -716,   -306], 0, [  3034,   3540], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,      0,  -1535], 0, [ -3096,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,   -716,  -1535], 0, [ -3096,   3540], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,      0,   -306], 0, [  3034,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,      0,  -1535], 0, [  1502,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3277,      0,  -1535], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3277,   -716,  -1535], 0, [     0,   3540], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3584,   -716,  -1535], 0, [  1502,   3540], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2150,   -716,  -1228], 0, [     0,   3540], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3277,   -716,  -1228], 0, [  5588,   3540], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3277,      0,  -1228], 0, [  5588,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2150,      0,  -1228], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x0700E7A8 - 0x0700E898
bbh_seg7_vertex_0700E7A8 = vList(
    Vtx([  3277,      0,  -1228], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3277,   -716,  -1535], 0, [  1500,   3540], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3277,      0,  -1535], 0, [  1502,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3584,   -716,   -306], 0, [     0,   3540], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2662,      0,   -306], 0, [  4566,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3584,      0,   -306], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2355,      0,   1024], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2662,   -716,   1024], 0, [  -540,   3540], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2355,   -716,   1024], 0, [   990,   3540], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2662,      0,   1024], 0, [  -542,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2662,      0,   -306], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2662,   -716,   -306], 0, [     0,   3540], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2662,   -716,   1024], 0, [  6612,   3540], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2662,      0,   1024], 0, [  6612,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3277,   -716,  -1228], 0, [     0,   3540], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700E898 - 0x0700E988
bbh_seg7_vertex_0700E898 = vList(
    Vtx([  2253,      0,   -204], 0, [   650,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2253,   -716,   -204], 0, [   650,   3540], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2150,   -716,   -306], 0, [   990,   3540], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2150,      0,    819], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2150,   -716,  -1228], 0, [ 10188,   3540], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2150,      0,  -1228], 0, [ 10188,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2150,   -716,    819], 0, [     0,   3540], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,      0,    922], 0, [   224,      0], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2253,   -716,    819], 0, [   734,   3536], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2253,      0,    819], 0, [   734,      0], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2253,      0,    819], 0, [   734,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2150,   -716,    819], 0, [   990,   3536], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2150,      0,    819], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,   -716,    819], 0, [   734,   3536], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2355,   -716,    922], 0, [   224,   3540], [0x5a, 0x00, 0xa7, 0xff]),
);

// 0x0700E988 - 0x0700EA78
bbh_seg7_vertex_0700E988 = vList(
    Vtx([  2355,      0,   1024], 0, [     0,    -28], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,   -716,    922], 0, [   224,   3540], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,      0,    922], 0, [   224,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,   -716,   1024], 0, [     0,   3540], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2150,      0,      0], 0, [     0,      0], [0x58, 0x00, 0x5a, 0xff]),
    Vtx([  2150,   -716,      0], 0, [     0,   3540], [0x58, 0x00, 0x5a, 0xff]),
    Vtx([  2253,   -716,   -101], 0, [   308,   3540], [0x58, 0x00, 0x5a, 0xff]),
    Vtx([  2253,      0,   -204], 0, [   650,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2150,   -716,   -306], 0, [   990,   3540], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2150,      0,   -306], 0, [   990,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2253,      0,   -101], 0, [   308,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   -716,   -204], 0, [   650,   3540], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,      0,   -204], 0, [   650,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   -716,   -101], 0, [   308,   3540], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,      0,   -101], 0, [   308,      0], [0x58, 0x00, 0x5a, 0xff]),
);

// 0x0700EA78 - 0x0700EB68
bbh_seg7_vertex_0700EA78 = vList(
    Vtx([  2253,    717,    819], 0, [   734,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2150,      0,    819], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2150,    717,    819], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1126,    717,  -1330], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1229,      0,  -1330], 0, [   734,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1229,    717,  -1330], 0, [   734,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1229,    717,  -1330], 0, [   734,      0], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  1331,      0,  -1433], 0, [   224,   2012], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  1331,    717,  -1433], 0, [   224,      0], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  1229,      0,  -1330], 0, [   734,   2012], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  1331,    717,  -1433], 0, [   224,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,      0,  -1433], 0, [   224,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,      0,  -1535], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,    717,  -1535], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,      0,  -1330], 0, [   990,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x0700EB68 - 0x0700EC48
bbh_seg7_vertex_0700EB68 = vList(
    Vtx([  2355,    717,    922], 0, [   224,      0], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2253,      0,    819], 0, [   734,   2012], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2253,    717,    819], 0, [   734,      0], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2253,    717,    819], 0, [   734,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,      0,    819], 0, [   734,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2150,      0,    819], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1331,    717,   -101], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,      0,   -101], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,      0,   -204], 0, [   224,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,      0,    922], 0, [   224,   2012], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2355,    717,   1024], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,      0,   1024], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,      0,    922], 0, [   224,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,    717,    922], 0, [   224,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700EC48 - 0x0700ED28
bbh_seg7_vertex_0700EC48 = vList(
    Vtx([  1229,    717,   -306], 0, [   734,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1229,      0,   -306], 0, [   734,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1126,      0,   -306], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1126,    717,   -306], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1331,    717,   -204], 0, [   224,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1229,      0,   -306], 0, [   734,   2012], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1229,    717,   -306], 0, [   734,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1331,      0,   -204], 0, [   224,   2012], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1331,    717,   -101], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,      0,   -204], 0, [   224,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,    717,   -204], 0, [   224,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,    717,   -101], 0, [   308,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,      0,   -204], 0, [   650,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,    717,   -204], 0, [   650,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700ED28 - 0x0700EE28
bbh_seg7_vertex_0700ED28 = vList(
    Vtx([  2048,    717,   -306], 0, [   224,      0], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  1946,      0,   -204], 0, [   734,   2012], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  1946,    717,   -204], 0, [   734,      0], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  1946,    717,   -204], 0, [   734,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,      0,   -204], 0, [   734,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,      0,   -101], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,    717,   -101], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,      0,   -306], 0, [   224,   2012], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  2150,    717,   -306], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,      0,   -306], 0, [   224,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,    717,   -306], 0, [   224,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2150,      0,   -306], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,    717,   -204], 0, [   650,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2150,      0,   -306], 0, [   990,   2012], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2150,    717,   -306], 0, [   990,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2253,      0,   -204], 0, [   650,   2012], [0x59, 0x00, 0xa6, 0xff]),
);

// 0x0700EE28 - 0x0700EE98
bbh_seg7_vertex_0700EE28 = vList(
    Vtx([  2150,    717,      0], 0, [     0,      0], [0x58, 0x00, 0x5a, 0xff]),
    Vtx([  2150,      0,      0], 0, [     0,   2012], [0x58, 0x00, 0x5a, 0xff]),
    Vtx([  2253,      0,   -101], 0, [   308,   2012], [0x58, 0x00, 0x5a, 0xff]),
    Vtx([  2253,    717,   -101], 0, [   308,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,      0,   -101], 0, [   308,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,      0,   -204], 0, [   650,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,    717,   -101], 0, [   308,      0], [0x58, 0x00, 0x5a, 0xff]),
);

// 0x0700EE98 - 0x0700EFD8
bbh_seg7_dl_0700EE98 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_0700D850.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700D850.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700D898, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPLight(bbh_seg7_lights_0700D868.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700D868.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700D918, 10, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  4, 0x0),
    gsSP2Triangles( 0,  5,  3, 0x0,  0,  2,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSPLight(bbh_seg7_lights_0700D880.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700D880.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700D9B8, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  4, 0x0),
    gsSP2Triangles( 4,  5,  0, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700DA98, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 13, 14, 0x0,  0,  2, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700EFD8 - 0x0700F2B8
bbh_seg7_dl_0700EFD8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09003800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700DB98, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  5,  7,  6, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  9, 11, 10, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700DC88, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700DD78, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700DE68, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700DF58, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles(12, 13,  9, 0x0, 12,  9, 11, 0x0),
    gsSP2Triangles( 9, 14, 10, 0x0, 15, 10, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700E058, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 9, 11, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700E158, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 9, 11, 12, 0x0, 13,  9, 12, 0x0),
    gsSP2Triangles(14, 11, 10, 0x0, 14, 15, 11, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700E258, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700E338, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700E418, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 9, 11, 12, 0x0,  6,  8, 13, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700E508, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700E5F8, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700F2B8 - 0x0700F3D8
bbh_seg7_dl_0700F2B8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09005000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700E6B8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700E7A8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700E898, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSP1Triangle( 7, 14,  8, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700E988, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSP1Triangle( 4,  6, 14, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700F3D8 - 0x0700F510
bbh_seg7_dl_0700F3D8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09001800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700EA78, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 3, 14,  4, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700EB68, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  0,  9,  1, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700EC48, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700ED28, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  0,  7,  1, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 15, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700EE28, 7, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP1Triangle( 0,  2,  6, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700F510 - 0x0700F5C8
bbh_seg7_dl_0700F510 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700EE98),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700EFD8),
    gsSPDisplayList(bbh_seg7_dl_0700F2B8),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700F3D8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=0376ea709>
// 0x0700F5C8 - 0x0700F6B8
bbh_seg7_vertex_0700F5C8 = vList(
    Vtx([  2130,      0,  -1248], 0, [  2216,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2130,    102,   -306], 0, [ -7184,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2130,      0,   -306], 0, [ -7184,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2683,      0,   1024], 0, [ 13050,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2683,    102,   1024], 0, [ 13050,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2683,    102,   -286], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2683,      0,   -286], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2683,    102,   -286], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2765,    102,   -286], 0, [   172,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2765,      0,   -286], 0, [   172,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2683,      0,   -286], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3174,    102,   -286], 0, [ -3914,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3584,    102,   -286], 0, [ -8002,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3584,      0,   -286], 0, [ -8002,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3174,      0,   -286], 0, [ -3914,    990], [0xff, 0xff, 0xff, 0xff]),
);

// 0x0700F6B8 - 0x0700F7A8
bbh_seg7_vertex_0700F6B8 = vList(
    Vtx([  2130,      0,  -1248], 0, [ -5344,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2765,    102,  -1248], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2130,    102,  -1248], 0, [ -5344,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2130,      0,  -1248], 0, [  2216,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2130,    102,  -1248], 0, [  2216,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2130,    102,   -306], 0, [ -7184,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3256,      0,  -1535], 0, [  5078,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3256,    102,  -1535], 0, [  5078,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3256,    102,  -1248], 0, [  2216,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3256,      0,  -1248], 0, [  2216,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3174,      0,  -1248], 0, [  5078,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3256,      0,  -1248], 0, [  5896,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3256,    102,  -1248], 0, [  5896,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  3174,    102,  -1248], 0, [  5078,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2765,      0,  -1248], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
);

// 0x0700F7A8 - 0x0700F848
bbh_seg7_dl_0700F7A8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700F5C8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700F6B8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700F848 - 0x0700F8B8
bbh_seg7_dl_0700F848 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_0700F7A8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=f6c96e730>
// 0x0700F8B8 - 0x0700F8D0
bbh_seg7_lights_0700F8B8 = gdSPDefLights1(
    0x65, 0x65, 0x38,
    0xfe, 0xfe, 0x8c, 0x28, 0x28, 0x28
);

// 0x0700F8D0 - 0x0700F8E8
bbh_seg7_lights_0700F8D0 = gdSPDefLights1(
    0x20, 0x20, 0x20,
    0x50, 0x50, 0x50, 0x28, 0x28, 0x28
);

// 0x0700F8E8 - 0x0700F900
bbh_seg7_lights_0700F8E8 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700F900 - 0x0700F918
bbh_seg7_lights_0700F900 = gdSPDefLights1(
    0x33, 0x2c, 0x20,
    0x80, 0x70, 0x52, 0x28, 0x28, 0x28
);

// 0x0700F918 - 0x0700F9F8
bbh_seg7_vertex_0700F918 = vList(
    Vtx([  -818,    717,      0], 0, [     0,    650], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -101,    717,   1024], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2252,    717,   1024], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,      0,   -255], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,      0,   -255], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,      0,   1024], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,      0,      0], 0, [     0,    786], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -101,      0,      0], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,      0,      0], 0, [     0,    650], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -101,      0,   1024], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,    717,  -1535], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,    717,   -357], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2252,    717,   -357], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,    717,  -1535], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
);

// 0x0700F9F8 - 0x0700FA68
bbh_seg7_vertex_0700F9F8 = vList(
    Vtx([  -818,    717,      0], 0, [     0,    786], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2252,    717,   -255], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,    717,   -255], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,    717,      0], 0, [     0,    650], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -101,    717,      0], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -101,    717,   1024], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2252,    717,   1024], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
);

// 0x0700FA68 - 0x0700FAE8
bbh_seg7_vertex_0700FA68 = vList(
    Vtx([  -101,      0,    717], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -50,      0,    563], 0, [   478,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -101,      0,    563], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -50,      0,    717], 0, [   478,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1945,      0,   1075], 0, [   478,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2098,      0,   1024], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2098,      0,   1075], 0, [   478,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1945,      0,   1024], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700FAE8 - 0x0700FBA8
bbh_seg7_vertex_0700FAE8 = vList(
    Vtx([ -1125,    512,    922], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1740,    512,   1024], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1125,    512,   1024], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1740,    512,    922], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -101,    512,      0], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -716,    512,    102], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -101,    512,    102], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -716,    512,      0], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1637,      0,  -1535], 0, [   698,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1484,      0,  -1586], 0, [   624,   1008], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1637,      0,  -1586], 0, [   698,   1008], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1484,      0,  -1535], 0, [   624,    990], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700FBA8 - 0x0700FBE8
bbh_seg7_vertex_0700FBA8 = vList(
    Vtx([ -1740,     72,    614], 0, [  -332,   1680], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1330,    102,    614], 0, [   478,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1740,    102,    614], 0, [  -364,   1680], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1330,     72,    614], 0, [   512,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x0700FBE8 - 0x0700FCA8
bbh_seg7_vertex_0700FBE8 = vList(
    Vtx([ -1125,      0,    922], 0, [   480,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1125,    512,   1024], 0, [     0,    552], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1125,      0,   1024], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1125,    512,    922], 0, [   480,    552], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1740,      0,   1024], 0, [   480,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,    512,    922], 0, [     0,    552], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,      0,    922], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,    512,   1024], 0, [   478,    552], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -716,      0,    102], 0, [   480,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -716,    512,    102], 0, [   478,    552], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -716,    512,      0], 0, [     0,    552], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -716,      0,      0], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
);

// 0x0700FCA8 - 0x0700FD68
bbh_seg7_vertex_0700FCA8 = vList(
    Vtx([ -1689,     92,   -255], 0, [   608,    268], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1689,     -9,   -255], 0, [   716,    268], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1689,     -9,    563], 0, [    58,   1576], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1689,     92,    563], 0, [   -48,   1576], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1689,     92,    563], 0, [   -48,   1576], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1689,     -9,    563], 0, [    58,   1576], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1381,     -9,    563], 0, [   482,   1744], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1381,     92,    563], 0, [   372,   1744], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1381,     92,    563], 0, [   372,   1744], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1381,     -9,   -255], 0, [  1138,    436], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1381,     92,   -255], 0, [  1030,    436], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1381,     -9,    563], 0, [   482,   1744], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700FD68 - 0x0700FE28
bbh_seg7_vertex_0700FD68 = vList(
    Vtx([ -1330,     72,   -255], 0, [   274,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1330,    102,   -255], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1330,    102,    614], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1330,     72,    614], 0, [   274,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1740,     72,    614], 0, [   274,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,    102,   -255], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,     72,   -255], 0, [   274,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,    102,    614], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1330,    102,   -255], 0, [  2012,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1740,    102,   -255], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1740,    102,    614], 0, [     0,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1330,    102,    614], 0, [  2012,   2012], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700FE28 - 0x0700FF28
bbh_seg7_vertex_0700FE28 = vList(
    Vtx([ -2252,    102,  -1535], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1842,    102,  -1330], 0, [  4056,    552], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1842,    102,  -1535], 0, [  4056,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2047,    102,   -357], 0, [  2012,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2047,    102,  -1330], 0, [  2012,    552], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,    102,   -357], 0, [     0,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    102,  -1535], 0, [ 14276,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1023,    102,  -1330], 0, [ 12232,    552], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1023,    102,   -357], 0, [ 12232,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1228,    102,  -1330], 0, [ 10188,    552], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1228,    102,  -1535], 0, [ 10188,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    102,   -357], 0, [ 14276,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2149,    154,    717], 0, [   990,   1500], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2149,    154,    614], 0, [   990,    480], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,    154,    512], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,    154,    819], 0, [     0,   2012], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700FF28 - 0x07010018
bbh_seg7_vertex_0700FF28 = vList(
    Vtx([ -1228,      0,  -1330], 0, [  3034,    992], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1023,      0,  -1330], 0, [  4056,    992], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1023,    102,  -1330], 0, [  4056,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1842,      0,  -1535], 0, [ -1052,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1842,    102,  -1535], 0, [ -1052,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1842,    102,  -1330], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1842,      0,  -1330], 0, [     0,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1228,      0,  -1330], 0, [     0,    992], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1228,    102,  -1535], 0, [ -1052,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1228,      0,  -1535], 0, [ -1052,    992], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1228,    102,  -1330], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1842,    102,  -1330], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2047,    102,  -1330], 0, [ -1052,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2047,      0,  -1330], 0, [ -1052,    988], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1842,      0,  -1330], 0, [     0,    988], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07010018 - 0x070100C8
bbh_seg7_vertex_07010018 = vList(
    Vtx([ -1023,      0,   -357], 0, [  4822,    992], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1023,    102,  -1330], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1023,      0,  -1330], 0, [     0,    992], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1228,      0,  -1330], 0, [  3034,    992], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1023,    102,  -1330], 0, [  4056,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1228,    102,  -1330], 0, [  3034,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2047,      0,  -1330], 0, [     0,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2047,    102,   -357], 0, [  4822,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2047,      0,   -357], 0, [  4822,    992], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2047,    102,  -1330], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1023,    102,   -357], 0, [  4822,      0], [0x81, 0x00, 0x00, 0xff]),
);

// 0x070100C8 - 0x070101A8
bbh_seg7_vertex_070100C8 = vList(
    Vtx([ -1637,    256,  -1535], 0, [ -1734,   1280], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,    717,  -1535], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,    717,  -1535], 0, [ -3778,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1484,    256,  -1535], 0, [ -1222,   1280], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,      0,  -1535], 0, [ -3778,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1637,      0,  -1535], 0, [ -1734,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,      0,  -1535], 0, [   990,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1484,      0,  -1535], 0, [ -1222,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -101,    256,    563], 0, [  -540,   1280], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,    256,    717], 0, [     0,   1280], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,    717,   1024], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,    717,      0], 0, [ -2414,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,      0,      0], 0, [ -2414,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,      0,    563], 0, [  -540,   2012], [0x81, 0x00, 0x00, 0xff]),
);

// 0x070101A8 - 0x07010298
bbh_seg7_vertex_070101A8 = vList(
    Vtx([  -818,    717,  -1535], 0, [ -4118,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,      0,  -1535], 0, [ -4118,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,      0,      0], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,      0,    717], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,    717,   1024], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,    256,    717], 0, [     0,   1280], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -101,      0,   1024], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -2252,      0,  -1535], 0, [  8484,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,    717,   1024], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,      0,   1024], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,    717,  -1535], 0, [  8484,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -101,    717,      0], 0, [  2352,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,      0,      0], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -101,      0,      0], 0, [  2352,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,    717,      0], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07010298 - 0x07010388
bbh_seg7_vertex_07010298 = vList(
    Vtx([  -101,    256,    717], 0, [     0,   1280], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -50,    256,    717], 0, [     0,   1280], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -50,      0,    717], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,    717,  -1535], 0, [ -4118,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,      0,      0], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,    717,      0], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1945,      0,   1024], 0, [  6100,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1945,    256,   1024], 0, [  6100,   1280], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -101,      0,   1024], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -101,    717,   1024], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2252,    717,   1024], 0, [  7122,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2098,    256,   1024], 0, [  6610,   1280], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2252,      0,   1024], 0, [  7122,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2098,      0,   1024], 0, [  6610,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -101,      0,    717], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07010388 - 0x07010478
bbh_seg7_vertex_07010388 = vList(
    Vtx([ -2098,      0,   1075], 0, [  6610,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2098,    256,   1024], 0, [  6610,   1280], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2098,    256,   1075], 0, [  6610,   1280], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -50,    256,    563], 0, [  -542,   1280], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -101,      0,    563], 0, [  -542,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   -50,      0,    563], 0, [  -542,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -101,    256,    563], 0, [  -542,   1280], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2098,    256,   1024], 0, [  6610,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1945,    256,   1075], 0, [  6100,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2098,    256,   1075], 0, [  6610,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1945,    256,   1024], 0, [  6100,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1945,    256,   1024], 0, [  6100,   1280], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1945,      0,   1075], 0, [  6100,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1945,    256,   1075], 0, [  6100,   1280], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1945,      0,   1024], 0, [  6100,   2012], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07010478 - 0x07010568
bbh_seg7_vertex_07010478 = vList(
    Vtx([ -1637,    256,  -1535], 0, [ -1734,   1280], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1637,      0,  -1535], 0, [ -1734,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1637,      0,  -1586], 0, [ -1734,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2098,      0,   1075], 0, [  6610,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2098,      0,   1024], 0, [  6610,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2098,    256,   1024], 0, [  6610,   1280], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -101,    256,    563], 0, [  -542,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -50,    256,    563], 0, [  -542,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -50,    256,    717], 0, [     0,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -101,    256,    717], 0, [     0,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1484,    256,  -1586], 0, [ -1222,   1280], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1484,      0,  -1535], 0, [ -1222,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1484,    256,  -1535], 0, [ -1222,   1280], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1484,      0,  -1586], 0, [ -1222,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1637,    256,  -1586], 0, [ -1734,   1280], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07010568 - 0x07010668
bbh_seg7_vertex_07010568 = vList(
    Vtx([ -1637,    256,  -1586], 0, [ -1734,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1484,    256,  -1535], 0, [ -1222,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1637,    256,  -1535], 0, [ -1734,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1484,    256,  -1586], 0, [ -1222,   1280], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2252,      0,    512], 0, [  1672,   2012], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -2149,    154,    614], 0, [  1330,   1572], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -2149,      0,    614], 0, [  1330,   2012], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -2252,    154,    512], 0, [  1672,   1572], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -2149,      0,    614], 0, [  1330,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2149,    154,    614], 0, [  1330,   1572], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2149,    154,    717], 0, [   990,   1572], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2149,      0,    717], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2149,      0,    717], 0, [   990,   2012], [0x59, 0x00, 0x5a, 0xff]),
    Vtx([ -2149,    154,    717], 0, [   990,   1572], [0x59, 0x00, 0x5a, 0xff]),
    Vtx([ -2252,    154,    819], 0, [   650,   1572], [0x59, 0x00, 0x5a, 0xff]),
    Vtx([ -2252,      0,    819], 0, [   650,   2012], [0x59, 0x00, 0x5a, 0xff]),
);

// 0x07010668 - 0x07010768
bbh_seg7_vertex_07010668 = vList(
    Vtx([ -1279,    614,   -255], 0, [  4822,    260], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,      0,   -255], 0, [  7122,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,    717,   -255], 0, [  7122,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2047,    102,   -357], 0, [   990,   1720], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1791,    614,   -357], 0, [  -286,    260], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1791,    102,   -357], 0, [  -286,   1720], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2252,    717,   -357], 0, [  2012,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2252,    102,   -357], 0, [  2012,   1720], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2047,      0,   -357], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,    717,   -357], 0, [ -5140,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1279,    614,   -357], 0, [ -2840,    260], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1023,      0,   -357], 0, [ -4118,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1279,    102,   -357], 0, [ -2840,   1720], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1023,    102,   -357], 0, [ -4118,   1720], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,    102,   -357], 0, [ -5140,   1720], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1279,    102,   -255], 0, [  4822,   1720], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07010768 - 0x07010858
bbh_seg7_vertex_07010768 = vList(
    Vtx([  -818,      0,   -255], 0, [  7122,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1791,    102,   -255], 0, [  2268,   1720], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,      0,   -255], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1279,    102,   -255], 0, [  4822,   1720], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1791,    614,   -255], 0, [  2268,    260], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,    717,   -255], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1279,    614,   -255], 0, [  4822,    260], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,    717,   -255], 0, [  7122,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1791,    614,   -255], 0, [  2778,    260], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1791,    614,   -357], 0, [  2778,    260], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1279,    614,   -357], 0, [   224,    260], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1791,    102,   -255], 0, [  2778,   1720], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1791,    614,   -357], 0, [  2778,    260], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1791,    614,   -255], 0, [  2778,    260], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1279,    614,   -255], 0, [   224,    260], [0x00, 0x81, 0x00, 0xff]),
);

// 0x07010858 - 0x07010908
bbh_seg7_vertex_07010858 = vList(
    Vtx([ -1279,    102,   -255], 0, [   224,   1720], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1791,    102,   -357], 0, [  2778,   1720], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1791,    102,   -255], 0, [  2778,   1720], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1791,    102,   -255], 0, [  2778,   1720], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1791,    102,   -357], 0, [  2778,   1720], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1791,    614,   -357], 0, [  2778,    260], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1279,    614,   -255], 0, [   224,    260], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1279,    614,   -357], 0, [   224,    260], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1279,    102,   -357], 0, [   224,   1720], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1279,    102,   -255], 0, [   224,   1720], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1279,    102,   -357], 0, [   224,   1720], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07010908 - 0x07010988
bbh_seg7_vertex_07010908 = vList(
    Vtx([ -1125,      0,    922], 0, [  3034,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1740,      0,    922], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1740,    512,    922], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1125,    512,    922], 0, [  3034,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -101,    512,    102], 0, [  3034,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -716,    512,    102], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -716,      0,    102], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -101,      0,    102], 0, [  3034,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07010988 - 0x07010A08
bbh_seg7_vertex_07010988 = vList(
    Vtx([ -1791,    614,   -357], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1279,    102,   -357], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1791,    102,   -357], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1279,    614,   -357], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1279,    614,   -255], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1791,    614,   -255], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1791,    102,   -255], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1279,    102,   -255], 0, [   990,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07010A08 - 0x07010A48
bbh_seg7_vertex_07010A08 = vList(
    Vtx([  -818,      0,  -1535], 0, [  8144,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,      0,  -1535], 0, [ -6160,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,      0,   -306], 0, [ -6160,   5076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,      0,   -306], 0, [  8144,   5076], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07010A48 - 0x07010B58
bbh_seg7_dl_07010A48 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_0700F8B8.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700F8B8.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700F918, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 5,  6,  3, 0x0,  5,  7,  8, 0x0),
    gsSP2Triangles( 5,  9,  7, 0x0, 10, 11, 12, 0x0),
    gsSP1Triangle(10, 13, 11, 0x0),
    gsSPVertex(bbh_seg7_vertex_0700F9F8, 7, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP1Triangle( 0,  6,  1, 0x0),
    gsSPLight(bbh_seg7_lights_0700F8D0.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700F8D0.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700FA68, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPLight(bbh_seg7_lights_0700F8E8.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700F8E8.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700FAE8, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSPEndDisplayList(),
);

// 0x07010B58 - 0x07010C30
bbh_seg7_dl_07010B58 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09003800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_0700F8B8.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700F8B8.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700FBA8, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPLight(bbh_seg7_lights_0700F8E8.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700F8E8.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700FBE8, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSPLight(bbh_seg7_lights_0700F900.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700F900.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700FCA8, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSPEndDisplayList(),
);

// 0x07010C30 - 0x07010D00
bbh_seg7_dl_07010C30 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07000000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_0700F8B8.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700F8B8.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700FD68, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSPLight(bbh_seg7_lights_0700F8E8.l[0], 1),
    gsSPLight(bbh_seg7_lights_0700F8E8.a, 2),
    gsSPVertex(bbh_seg7_vertex_0700FE28, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  4, 0x0),
    gsSP2Triangles( 0,  5,  3, 0x0,  0,  4,  1, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles( 6, 10,  9, 0x0,  6,  8, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x07010D00 - 0x07010D90
bbh_seg7_dl_07010D00 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09005000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_0700FF28, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07010018, 11, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP1Triangle( 0, 10,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x07010D90 - 0x07011058
bbh_seg7_dl_07010D90 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09000800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_070100C8, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  0, 0x0,  4,  0,  2, 0x0),
    gsSP2Triangles( 6,  1,  3, 0x0,  7,  6,  3, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(12,  8, 11, 0x0, 12, 13,  8, 0x0),
    gsSPVertex(bbh_seg7_vertex_070101A8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(bbh_seg7_vertex_07010298, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  7,  9,  8, 0x0),
    gsSP2Triangles( 7, 10,  9, 0x0,  7, 11, 10, 0x0),
    gsSP2Triangles(12, 10, 11, 0x0, 12, 11, 13, 0x0),
    gsSP1Triangle( 0,  2, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07010388, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(bbh_seg7_vertex_07010478, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSP1Triangle( 0,  2, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07010568, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_07010668, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  3,  7,  6, 0x0),
    gsSP2Triangles( 8,  3,  5, 0x0,  9,  4,  6, 0x0),
    gsSP2Triangles( 9, 10,  4, 0x0, 11,  5, 12, 0x0),
    gsSP2Triangles(11,  8,  5, 0x0, 13, 11, 12, 0x0),
    gsSP2Triangles(13, 12, 10, 0x0,  9, 13, 10, 0x0),
    gsSP2Triangles( 9, 14, 13, 0x0,  0, 15,  1, 0x0),
    gsSPVertex(bbh_seg7_vertex_07010768, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 2,  1,  4, 0x0,  2,  4,  5, 0x0),
    gsSP2Triangles( 4,  6,  7, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle( 8, 10, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07010858, 11, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
    gsSP1Triangle( 0, 10,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x07011058 - 0x070110A0
bbh_seg7_dl_07011058 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09002800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07010908, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSPEndDisplayList(),
);

// 0x070110A0 - 0x070110E8
bbh_seg7_dl_070110A0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07002000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07010988, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSPEndDisplayList(),
);

// 0x070110E8 - 0x07011120
bbh_seg7_dl_070110E8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09009000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07010A08, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x07011120 - 0x07011228
bbh_seg7_dl_07011120 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07010A48),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07010B58),
    gsSPDisplayList(bbh_seg7_dl_07010C30),
    gsSPDisplayList(bbh_seg7_dl_07010D00),
    gsSPDisplayList(bbh_seg7_dl_07010D90),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07011058),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_070110A0),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_070110E8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=6bed5d58a>
// 0x07011228 - 0x07011240
bbh_seg7_lights_07011228 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x07011240 - 0x070112C0
bbh_seg7_vertex_07011240 = vList(
    Vtx([ -1074,    819,    819], 0, [  4056,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,    819], 0, [ -1052,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,    461], 0, [ -1052,   4054], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1074,    819,    461], 0, [  4056,   4054], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,    717], 0, [ -1052,  -1054], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -767,    819,    717], 0, [ -2074,  -1054], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -767,    819,    563], 0, [ -2074,   2010], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,    563], 0, [ -1052,   2010], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x070112C0 - 0x070113A0
bbh_seg7_vertex_070112C0 = vList(
    Vtx([  -818,   1075,    563], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -767,   1075,    563], 0, [   480,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -767,   1075,    717], 0, [   480,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,   1075,    717], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2252,   1331,  -1330], 0, [   990,    908], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2047,   1331,  -1535], 0, [   844,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,   1331,  -1535], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,   1331,  -1330], 0, [     0,    908], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,   1331,  -1535], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1023,   1331,  -1535], 0, [   114,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,   1638,  -1535], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,   1638,   1024], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2252,   1638,   1024], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -818,   1638,  -1535], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
);

// 0x070113A0 - 0x07011490
bbh_seg7_vertex_070113A0 = vList(
    Vtx([ -1279,   1382,   1024], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1279,    922,   1126], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1279,    922,   1024], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -869,   1382,   1024], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -869,   1382,   1126], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1279,   1382,   1126], 0, [     0,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1279,   1382,   1024], 0, [   990,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -869,    922,   1024], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -869,   1382,   1126], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -869,   1382,   1024], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -869,    922,   1126], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1279,    922,   1024], 0, [   990,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1279,    922,   1126], 0, [     0,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -869,    922,   1126], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -869,    922,   1024], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07011490 - 0x07011570
bbh_seg7_vertex_07011490 = vList(
    Vtx([ -1279,    922,   1024], 0, [  1118,   1756], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -869,    922,   1024], 0, [    96,   1756], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,    819,   1024], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1279,   1382,   1024], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1279,   1382,   1126], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1279,    922,   1126], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,   1638,   1024], 0, [  3546,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,   1638,   1024], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1279,   1382,   1024], 0, [  1118,    608], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -869,   1382,   1024], 0, [    96,    608], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2252,    819,   1024], 0, [  3546,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2047,   1280,   1024], 0, [  3034,    864], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1893,   1280,   1024], 0, [  2650,    864], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1893,   1280,   1075], 0, [  2650,    864], [0x00, 0x81, 0x00, 0xff]),
);

// 0x07011570 - 0x07011660
bbh_seg7_vertex_07011570 = vList(
    Vtx([  -818,   1075,    717], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -767,   1075,    717], 0, [   478,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -767,    819,    717], 0, [   480,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,    819,    717], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -767,   1075,    563], 0, [   480,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,    819,    563], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -767,    819,    563], 0, [   480,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,   1075,    563], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1893,   1280,   1024], 0, [  2650,    864], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1893,   1024,   1075], 0, [  2650,   1500], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1893,   1280,   1075], 0, [  2650,    864], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1893,   1024,   1024], 0, [  2650,   1500], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -2252,    819,   1024], 0, [  3546,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1893,    973,   1024], 0, [  2650,   1628], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1279,    922,   1024], 0, [  1118,   1756], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07011660 - 0x07011740
bbh_seg7_vertex_07011660 = vList(
    Vtx([ -2047,   1280,   1024], 0, [  3034,    864], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -1893,   1280,   1075], 0, [  2650,    864], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2047,   1280,   1075], 0, [  3034,    864], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -2047,   1024,   1075], 0, [  3034,   1500], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2047,   1024,   1024], 0, [  3034,   1500], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2047,   1280,   1024], 0, [  3034,    864], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1893,   1024,   1075], 0, [  2650,   1500], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2047,   1024,   1024], 0, [  3034,   1500], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2047,   1024,   1075], 0, [  3034,   1500], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2047,   1280,   1075], 0, [  3034,    864], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1893,   1024,   1024], 0, [  2650,   1500], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,    819,   1024], 0, [  3546,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2047,    973,   1024], 0, [  3034,   1628], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1893,    973,   1024], 0, [  2650,   1628], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07011740 - 0x07011830
bbh_seg7_vertex_07011740 = vList(
    Vtx([  -818,    819,   1024], 0, [  3800,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1331,   1024], 0, [  3800,    736], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1075,    717], 0, [  3034,   1372], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,    819,    717], 0, [  3034,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1638,   1024], 0, [  3800,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1638,  -1535], 0, [ -2586,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1331,  -1535], 0, [ -2586,    736], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1638,  -1535], 0, [  3544,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,   1331,  -1535], 0, [     0,    736], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -818,   1331,  -1535], 0, [  3544,    736], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,   1638,  -1535], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,   1331,  -1535], 0, [  3546,    736], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,   1638,   1024], 0, [ -2840,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,   1331,   1024], 0, [ -2840,    736], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,   1638,  -1535], 0, [  3546,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07011830 - 0x07011930
bbh_seg7_vertex_07011830 = vList(
    Vtx([  -818,   1075,    563], 0, [  2650,   1372], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1331,    358], 0, [  2140,    736], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,    819,    358], 0, [  2140,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1893,   1280,   1024], 0, [  2650,    864], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2047,   1280,   1024], 0, [  3034,    864], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2252,   1638,   1024], 0, [  3546,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1279,   1382,   1024], 0, [  1118,    608], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1279,    922,   1024], 0, [  1118,   1756], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1893,    973,   1024], 0, [  2650,   1628], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2047,    973,   1024], 0, [  3034,   1628], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2252,    819,   1024], 0, [  3546,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -818,   1075,    717], 0, [  3034,   1372], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,    819,    563], 0, [  2650,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,   1638,  -1023], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1330,   1638,  -1023], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1330,    819,  -1023], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07011930 - 0x07011990
bbh_seg7_vertex_07011930 = vList(
    Vtx([  -818,   1075,    717], 0, [  3034,   1372], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1331,   1024], 0, [  3800,    736], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1331,    358], 0, [  2140,    736], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,   1638,  -1023], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1330,    819,  -1023], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1740,    819,  -1023], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07011990 - 0x07011A90
bbh_seg7_vertex_07011990 = vList(
    Vtx([ -1893,    819,    512], 0, [     0,    648], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1893,    922,    512], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1893,    922,    614], 0, [   480,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,   1024,    614], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1740,   1024,    614], 0, [ -1562,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1740,    819,    614], 0, [ -1562,   1332], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2252,    819,    614], 0, [   990,   1332], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2098,    922,    512], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1893,    819,    512], 0, [     0,    648], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2098,    819,    512], 0, [   990,    648], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -1893,    922,    512], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -2098,    922,    512], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -2098,    819,    512], 0, [     0,    648], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -2098,    819,    614], 0, [   480,    648], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -2098,    922,    614], 0, [   480,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1893,    819,    614], 0, [   480,    648], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07011A90 - 0x07011B80
bbh_seg7_vertex_07011A90 = vList(
    Vtx([ -2252,   1331,  -1330], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -2252,    819,  -1330], 0, [     0,   2012], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -2047,    819,  -1535], 0, [   990,   2012], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -1330,   1331,   1024], 0, [ -4628,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1330,    819,  -1023], 0, [  5588,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1330,   1331,  -1023], 0, [  5588,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1330,    819,   1024], 0, [ -4630,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1740,   1331,  -1023], 0, [ -4118,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,    819,   1024], 0, [  6100,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,   1331,   1024], 0, [  6100,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,    819,  -1023], 0, [ -4118,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1023,   1331,  -1535], 0, [     0,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([ -1023,    819,  -1535], 0, [     0,   2012], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  -818,    819,  -1330], 0, [   990,   2012], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  -818,   1331,  -1330], 0, [   990,      0], [0xa7, 0x00, 0x59, 0xff]),
);

// 0x07011B80 - 0x07011C70
bbh_seg7_vertex_07011B80 = vList(
    Vtx([  -818,   1331,  -1330], 0, [ -7440,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,    819,    358], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -818,   1331,    358], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -2252,   1331,  -1330], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -2047,    819,  -1535], 0, [   990,   2012], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -2047,   1331,  -1535], 0, [   990,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -1023,   1331,  -1535], 0, [  5078,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2047,    819,  -1535], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1023,    819,  -1535], 0, [  5078,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2047,   1331,  -1535], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -2252,    819,  -1330], 0, [  7122,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,   1331,  -1330], 0, [  7122,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,   1331,   1024], 0, [ -4630,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -2252,    819,   1024], 0, [ -4630,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -818,    819,  -1330], 0, [ -7440,   2012], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07011C70 - 0x07011CF0
bbh_seg7_vertex_07011C70 = vList(
    Vtx([ -1740,   1638,  -1023], 0, [     0,    580], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,   1331,   1024], 0, [ 10188,   1808], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,   1638,   1024], 0, [ 10188,    580], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1740,   1331,  -1023], 0, [     0,   1808], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -1330,   1638,   1024], 0, [ 10188,    580], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1330,   1331,  -1023], 0, [     0,   1808], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1330,   1638,  -1023], 0, [     0,    580], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -1330,   1331,   1024], 0, [ 10188,   1808], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07011CF0 - 0x07011DF0
bbh_seg7_vertex_07011CF0 = vList(
    Vtx([ -2252,    819,  -1535], 0, [-12292,  12230], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,    819,   1024], 0, [ 13256,  12230], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1074,    819,    461], 0, [  7632,    478], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,  -1535], 0, [-12292,  -2076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1074,    819,    819], 0, [ 11212,    478], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,    461], 0, [  7632,  -2076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,   1024], 0, [ 13256,  -2076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -818,    819,    819], 0, [ 11212,  -2076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,   1024,   1024], 0, [ -2072,   2010], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1740,   1024,   1024], 0, [ -2072,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1740,   1024,    614], 0, [ -6160,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2252,   1024,    614], 0, [ -6160,   2010], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2098,    922,    614], 0, [ -6160,    478], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1893,    922,    614], 0, [ -6160,  -1566], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -1893,    922,    512], 0, [ -7184,  -1564], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -2098,    922,    512], 0, [ -7184,    478], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07011DF0 - 0x07011E48
bbh_seg7_dl_07011DF0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_0900A000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_07011228.l[0], 1),
    gsSPLight(bbh_seg7_lights_07011228.a, 2),
    gsSPVertex(bbh_seg7_vertex_07011240, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSPEndDisplayList(),
);

// 0x07011E48 - 0x07011EA0
bbh_seg7_dl_07011E48 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_070112C0, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSPEndDisplayList(),
);

// 0x07011EA0 - 0x07012078
bbh_seg7_dl_07011EA0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09003800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_070113A0, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07011490, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  1,  7,  2, 0x0),
    gsSP2Triangles( 1,  9,  7, 0x0,  9,  8,  7, 0x0),
    gsSP2Triangles( 0,  2, 10, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_07011570, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07011660, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  3,  5,  9, 0x0),
    gsSP2Triangles( 6, 10,  7, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_07011740, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 1,  4,  5, 0x0,  1,  5,  6, 0x0),
    gsSP2Triangles( 7,  8,  9, 0x0,  7, 10,  8, 0x0),
    gsSP2Triangles(11, 12, 13, 0x0, 11, 14, 12, 0x0),
    gsSPVertex(bbh_seg7_vertex_07011830, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  3, 0x0),
    gsSP2Triangles( 7,  3,  6, 0x0,  5,  4,  9, 0x0),
    gsSP2Triangles( 5,  9, 10, 0x0,  0, 11,  1, 0x0),
    gsSP2Triangles( 2, 12,  0, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_07011930, 6, 0),
    gsSP1Triangle( 0,  1,  2, 0x0),
    gsSP1Triangle( 3,  4,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x07012078 - 0x070120E0
bbh_seg7_dl_07012078 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09005000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07011990, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 13, 14, 0x0,  0,  2, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x070120E0 - 0x070121A8
bbh_seg7_dl_070120E0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09002800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07011A90, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07011B80, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPVertex(bbh_seg7_vertex_07011C70, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x070121A8 - 0x07012220
bbh_seg7_dl_070121A8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09009000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07011CF0, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 1,  4,  2, 0x0,  2,  5,  3, 0x0),
    gsSP2Triangles( 1,  6,  4, 0x0,  6,  7,  4, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x07012220 - 0x07012318
bbh_seg7_dl_07012220 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07011DF0),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07011E48),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07011EA0),
    gsSPDisplayList(bbh_seg7_dl_07012078),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_070120E0),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_070121A8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);

}