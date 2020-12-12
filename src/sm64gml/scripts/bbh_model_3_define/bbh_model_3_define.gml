// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bbh_model_3_define(){
/// <pygml?v=1.0&h=0c996b11c>
// 0x07012318 - 0x07012330
bbh_seg7_lights_07012318 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x07012330 - 0x07012430
bbh_seg7_vertex_07012330 = vList(
    Vtx([ -1100,   1382,   1075], 0, [   308,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1100,   1178,   1075], 0, [   308,    152], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1074,   1152,   1075], 0, [   138,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1100,   1126,   1075], 0, [     0,    152], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1100,    922,   1075], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1049,    922,   1075], 0, [   308,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1049,   1126,   1075], 0, [   308,    152], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1279,   1178,   1075], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1279,   1126,   1075], 0, [   308,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1100,   1126,   1075], 0, [   308,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1100,   1178,   1075], 0, [     0,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1049,   1178,   1075], 0, [     0,    152], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1049,   1382,   1075], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1049,   1178,   1075], 0, [   308,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -869,   1126,   1075], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -869,   1178,   1075], 0, [   308,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07012430 - 0x07012470
bbh_seg7_vertex_07012430 = vList(
    Vtx([ -1049,   1178,   1075], 0, [   308,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1074,   1152,   1075], 0, [   138,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -1049,   1126,   1075], 0, [     0,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -869,   1126,   1075], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07012470 - 0x07012510
bbh_seg7_dl_07012470 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07000000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_07012318.l[0], 1),
    gsSPLight(bbh_seg7_lights_07012318.a, 2),
    gsSPVertex(bbh_seg7_vertex_07012330, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  3,  6,  2, 0x0),
    gsSP2Triangles( 7,  8,  9, 0x0,  7,  9,  2, 0x0),
    gsSP2Triangles( 7,  2, 10, 0x0,  0,  2, 11, 0x0),
    gsSP2Triangles( 0, 11, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_07012430, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x07012510 - 0x07012580
bbh_seg7_dl_07012510 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_CULL_BACK | G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07012470),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_CULL_BACK | G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=8c0a16726>
// 0x07012580 - 0x07012680
bbh_seg7_vertex_07012580 = vList(
    Vtx([ -1049,   1178,   1075], 0, [   542,    536], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([  -869,   1382,   1075], 0, [   990,    990], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([ -1049,   1382,   1075], 0, [   542,    990], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([ -1279,    922,   1075], 0, [     0,      0], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([ -1100,    922,   1075], 0, [   416,      0], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([ -1100,   1126,   1075], 0, [   416,    422], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([ -1279,   1126,   1075], 0, [     0,    422], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([ -1049,    922,   1075], 0, [   542,      0], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([  -869,    922,   1075], 0, [   990,      0], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([  -869,   1126,   1075], 0, [   990,    422], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([ -1049,   1126,   1075], 0, [   542,    422], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([ -1279,   1178,   1075], 0, [     0,    536], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([ -1100,   1382,   1075], 0, [   416,    990], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([ -1279,   1382,   1075], 0, [     0,    990], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([ -1100,   1178,   1075], 0, [   416,    536], [0x09, 0xb3, 0xff, 0x80]),
    Vtx([  -869,   1178,   1075], 0, [   990,    536], [0x09, 0xb3, 0xff, 0x80]),
);

// 0x07012680 - 0x070126E8
bbh_seg7_dl_07012680 = dList(
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900B000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07012580, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 14, 12, 0x0,  0, 15,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x070126E8 - 0x07012758
bbh_seg7_dl_070126E8 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATEIA, G_CC_MODULATEIA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07012680),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=b192729de>
// 0x07012758 - 0x07012770
bbh_seg7_lights_07012758 = gdSPDefLights1(
    0x3c, 0x3c, 0x3c,
    0x96, 0x96, 0x96, 0x28, 0x28, 0x28
);

// 0x07012770 - 0x07012788
bbh_seg7_lights_07012770 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x07012788 - 0x070127C8
bbh_seg7_vertex_07012788 = vList(
    Vtx([  3584,    819,  -1535], 0, [ -5140,   8142], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2253,    819,  -1535], 0, [  8144,   8142], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2253,    819,   -101], 0, [  8144,  -6164], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3584,    819,   -101], 0, [ -5140,  -6164], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x070127C8 - 0x07012848
bbh_seg7_vertex_070127C8 = vList(
    Vtx([  3584,   1638,   -101], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1126,   1638,  -1535], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3584,   1638,  -1535], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1126,   1638,   -101], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2253,    819,  -1535], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1126,    819,  -1535], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1126,    819,   -101], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2253,    819,   -101], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07012848 - 0x070128A8
bbh_seg7_vertex_07012848 = vList(
    Vtx([  1331,    922,  -1228], 0, [     0,    990], [0x41, 0x57, 0x41, 0xff]),
    Vtx([  1331,   1075,  -1433], 0, [   990,      0], [0x41, 0x57, 0x41, 0xff]),
    Vtx([  1229,   1075,  -1330], 0, [     0,      0], [0x41, 0x57, 0x41, 0xff]),
    Vtx([  1331,    922,  -1228], 0, [     0,    990], [0x40, 0x57, 0x41, 0xff]),
    Vtx([  1434,    922,  -1330], 0, [   990,    990], [0x40, 0x57, 0x41, 0xff]),
    Vtx([  1331,   1075,  -1433], 0, [   990,      0], [0x40, 0x57, 0x41, 0xff]),
);

// 0x070128A8 - 0x070129A8
bbh_seg7_vertex_070128A8 = vList(
    Vtx([  1331,    819,  -1433], 0, [   990,   2012], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1331,    922,  -1433], 0, [   990,    844], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1434,    922,  -1330], 0, [     0,    844], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1434,    819,  -1330], 0, [     0,   2012], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1434,    819,  -1330], 0, [  1414,   2012], [0x59, 0x00, 0x5a, 0xff]),
    Vtx([  1434,    922,  -1330], 0, [  1414,    648], [0x59, 0x00, 0x5a, 0xff]),
    Vtx([  1331,    922,  -1228], 0, [     0,    648], [0x59, 0x00, 0x5a, 0xff]),
    Vtx([  1331,    819,  -1228], 0, [     0,   2012], [0x59, 0x00, 0x5a, 0xff]),
    Vtx([  1331,    819,  -1228], 0, [     0,   2012], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  1331,    922,  -1228], 0, [     0,    844], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  1229,    922,  -1330], 0, [   990,    844], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  1229,    819,  -1330], 0, [   990,   2012], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  1690,   1075,   -101], 0, [   862,   1372], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1331,   1638,   -101], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1946,   1638,   -101], 0, [  1500,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1536,   1075,   -101], 0, [   478,   1372], [0x00, 0x00, 0x81, 0xff]),
);

// 0x070129A8 - 0x07012A88
bbh_seg7_vertex_070129A8 = vList(
    Vtx([  2253,    819,   -613], 0, [  1756,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2150,    819,   -613], 0, [  1756,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2150,   1126,   -613], 0, [  1756,   1244], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,   1126,   -613], 0, [  1756,   1244], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,   1126,   -613], 0, [  1756,   1244], [0x00, 0xa7, 0xa7, 0xff]),
    Vtx([  2150,   1126,   -613], 0, [  1756,   1244], [0x00, 0xa7, 0xa7, 0xff]),
    Vtx([  2150,   1229,   -716], 0, [  1502,    988], [0x00, 0xa7, 0xa7, 0xff]),
    Vtx([  2150,   1126,   -613], 0, [  1756,   1244], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,    819,   -613], 0, [  1756,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,    819,   -306], 0, [  2524,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,   1229,   -716], 0, [  1502,    988], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,   1638,   -306], 0, [  2524,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,   1229,   -921], 0, [   990,    988], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,   1638,  -1330], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07012A88 - 0x07012B88
bbh_seg7_vertex_07012A88 = vList(
    Vtx([  2253,   1638,   -306], 0, [  2524,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1126,   -613], 0, [  1756,   1244], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1229,   -716], 0, [  1502,    988], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1229,   -716], 0, [  1502,    988], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2150,   1229,   -716], 0, [  1502,    988], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2150,   1229,   -921], 0, [   990,    988], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2253,   1126,   -613], 0, [  1756,   1244], [0x00, 0xa7, 0xa7, 0xff]),
    Vtx([  2150,   1229,   -716], 0, [  1502,    988], [0x00, 0xa7, 0xa7, 0xff]),
    Vtx([  2253,   1229,   -716], 0, [  1502,    988], [0x00, 0xa7, 0xa7, 0xff]),
    Vtx([  2253,   1229,   -921], 0, [   990,    988], [0x00, 0xa7, 0x5a, 0xff]),
    Vtx([  2150,   1229,   -921], 0, [   990,    988], [0x00, 0xa7, 0x5a, 0xff]),
    Vtx([  2150,   1126,  -1023], 0, [   734,   1244], [0x00, 0xa7, 0x5a, 0xff]),
    Vtx([  2253,   1229,   -921], 0, [   990,    988], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2150,   1126,  -1023], 0, [   734,   1244], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,   1229,   -921], 0, [   990,    988], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,   1638,  -1330], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07012B88 - 0x07012C78
bbh_seg7_vertex_07012B88 = vList(
    Vtx([  2150,   1126,  -1023], 0, [   734,   1244], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,   1638,  -1330], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,    819,  -1330], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,    819,  -1023], 0, [   734,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1229,   -921], 0, [   990,    988], [0x00, 0xa7, 0x5a, 0xff]),
    Vtx([  2150,   1126,  -1023], 0, [   734,   1244], [0x00, 0xa7, 0x5a, 0xff]),
    Vtx([  2253,   1126,  -1023], 0, [   734,   1244], [0x00, 0xa7, 0x5a, 0xff]),
    Vtx([  2253,   1126,  -1023], 0, [   734,   1244], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2150,   1126,  -1023], 0, [   734,   1244], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2150,    819,  -1023], 0, [   734,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2253,    819,  -1023], 0, [   734,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2253,    819,   -306], 0, [  2524,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,    819,   -613], 0, [  1756,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1126,   -613], 0, [  1756,   1244], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1638,   -306], 0, [  2524,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07012C78 - 0x07012D68
bbh_seg7_vertex_07012C78 = vList(
    Vtx([  1946,    819,   -101], 0, [  1500,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1690,    819,   -101], 0, [   862,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1690,   1075,   -101], 0, [   862,   1372], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,   1638,  -1330], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1638,   -306], 0, [  2524,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1229,   -716], 0, [  1502,    988], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1229,   -921], 0, [   990,    988], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,    819,  -1330], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1126,  -1023], 0, [   734,   1244], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,    819,  -1023], 0, [   734,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1536,   1075,   -101], 0, [   478,   1372], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1536,    819,   -101], 0, [   478,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1331,    819,   -101], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1331,   1638,   -101], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1946,   1638,   -101], 0, [  1500,      0], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07012D68 - 0x07012E58
bbh_seg7_vertex_07012D68 = vList(
    Vtx([  1536,   1075,   -101], 0, [   478,   1372], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1690,   1075,    -50], 0, [   862,   1372], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1536,   1075,    -50], 0, [   478,   1372], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1331,    819,  -1535], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1946,    819,  -1535], 0, [  1500,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1946,   1638,  -1535], 0, [  1500,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1331,   1638,  -1535], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,   1638,   -306], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    819,  -1330], 0, [  2522,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,   1638,  -1330], 0, [  2522,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    819,   -306], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1690,   1075,   -101], 0, [   862,   1372], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1690,    819,   -101], 0, [   862,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1690,    819,    -50], 0, [   862,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1690,   1075,    -50], 0, [   862,   1372], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07012E58 - 0x07012F38
bbh_seg7_vertex_07012E58 = vList(
    Vtx([  1536,    819,    -50], 0, [   478,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1536,   1075,   -101], 0, [   478,   1372], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1536,   1075,    -50], 0, [   478,   1372], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1536,   1075,   -101], 0, [   478,   1372], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1690,   1075,   -101], 0, [   862,   1372], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1690,   1075,    -50], 0, [   862,   1372], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1690,    819,    -50], 0, [   862,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1690,    819,   -101], 0, [   862,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1536,    819,   -101], 0, [   478,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1536,    819,    -50], 0, [   478,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1536,    819,   -101], 0, [   478,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,    922,  -1433], 0, [   990,    844], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1331,   1075,  -1433], 0, [   990,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1434,    922,  -1330], 0, [     0,    844], [0x59, 0x00, 0xa7, 0xff]),
);

// 0x07012F38 - 0x07012F68
bbh_seg7_vertex_07012F38 = vList(
    Vtx([  1331,    922,  -1228], 0, [     0,    844], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  1229,   1075,  -1330], 0, [   990,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  1229,    922,  -1330], 0, [   990,    844], [0xa7, 0x00, 0x59, 0xff]),
);

// 0x07012F68 - 0x07013028
bbh_seg7_vertex_07012F68 = vList(
    Vtx([  3584,   1638,  -1535], 0, [  5590,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2458,    819,  -1535], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3584,    819,  -1535], 0, [  5590,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2458,   1638,  -1535], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3584,    819,   -101], 0, [  5590,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2458,    819,   -101], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2458,   1638,   -101], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3584,   1638,   -101], 0, [  5590,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3584,    819,   -101], 0, [  7122,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,   1638,   -101], 0, [  7122,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,   1638,  -1535], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3584,    819,  -1535], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07013028 - 0x07013118
bbh_seg7_vertex_07013028 = vList(
    Vtx([  2458,   1638,   -204], 0, [   224,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2458,    819,   -204], 0, [   224,   2012], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2355,    819,   -306], 0, [   734,   2012], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2253,   1638,  -1330], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2355,    819,  -1330], 0, [   224,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2355,   1638,  -1330], 0, [   224,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2355,   1638,  -1330], 0, [   224,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2355,    819,  -1330], 0, [   224,   2012], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2458,    819,  -1433], 0, [   734,   2012], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2458,   1638,  -1433], 0, [   734,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2458,   1638,  -1433], 0, [   734,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2458,    819,  -1433], 0, [   734,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2458,    819,  -1535], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2458,   1638,  -1535], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,    819,  -1330], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07013118 - 0x07013208
bbh_seg7_vertex_07013118 = vList(
    Vtx([  2458,   1638,   -101], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2458,    819,   -204], 0, [   224,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2458,   1638,   -204], 0, [   224,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2458,    819,   -101], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1946,   1638,  -1535], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,    819,  -1535], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,    819,  -1433], 0, [   224,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2458,   1638,   -204], 0, [   224,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2355,    819,   -306], 0, [   734,   2012], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2355,   1638,   -306], 0, [   734,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2355,   1638,   -306], 0, [   734,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2355,    819,   -306], 0, [   734,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,    819,   -306], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,   1638,   -306], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1946,   1638,  -1433], 0, [   224,      0], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07013208 - 0x070132F8
bbh_seg7_vertex_07013208 = vList(
    Vtx([  1946,   1638,  -1433], 0, [   224,      0], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  1946,    819,  -1433], 0, [   224,   2012], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  2048,    819,  -1330], 0, [   734,   2012], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  2048,   1638,  -1330], 0, [   734,      0], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  2048,   1638,  -1330], 0, [   734,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2048,    819,  -1330], 0, [   734,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2150,    819,  -1330], 0, [   990,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2150,   1638,  -1330], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1331,   1638,   -204], 0, [   224,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1229,    819,   -306], 0, [   734,   2012], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1229,   1638,   -306], 0, [   734,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  2048,   1638,   -306], 0, [   224,      0], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  1946,    819,   -204], 0, [   734,   2012], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  1946,   1638,   -204], 0, [   734,      0], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  2048,    819,   -306], 0, [   224,   2012], [0xa7, 0x00, 0xa7, 0xff]),
);

// 0x070132F8 - 0x070133E8
bbh_seg7_vertex_070132F8 = vList(
    Vtx([  2150,   1638,   -306], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,    819,   -306], 0, [   224,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   1638,   -306], 0, [   224,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1946,   1638,   -204], 0, [   734,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,    819,   -204], 0, [   734,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,    819,   -101], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,   1638,   -101], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2150,    819,   -306], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1229,   1638,   -306], 0, [   734,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1126,    819,   -306], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1126,   1638,   -306], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1229,    819,   -306], 0, [   734,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1126,   1638,  -1330], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,    819,  -1330], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1229,    819,  -1330], 0, [   224,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x070133E8 - 0x070134D8
bbh_seg7_vertex_070133E8 = vList(
    Vtx([  1331,   1638,   -204], 0, [   224,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1331,    819,   -204], 0, [   224,   2012], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1229,    819,   -306], 0, [   734,   2012], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1331,   1638,   -101], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,    819,   -204], 0, [   224,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,   1638,   -204], 0, [   224,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,    819,   -101], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,   1638,  -1330], 0, [   224,      0], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  1331,    819,  -1433], 0, [   734,   2012], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  1331,   1638,  -1433], 0, [   734,      0], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  1331,   1638,  -1433], 0, [   734,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,    819,  -1433], 0, [   734,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,    819,  -1535], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1331,   1638,  -1535], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,    819,  -1330], 0, [   224,   2012], [0x5a, 0x00, 0x59, 0xff]),
);

// 0x070134D8 - 0x07013508
bbh_seg7_vertex_070134D8 = vList(
    Vtx([  1126,   1638,  -1330], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1229,    819,  -1330], 0, [   224,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1229,   1638,  -1330], 0, [   224,      0], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07013508 - 0x07013550
bbh_seg7_dl_07013508 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_0900A000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_07012758.l[0], 1),
    gsSPLight(bbh_seg7_lights_07012758.a, 2),
    gsSPVertex(bbh_seg7_vertex_07012788, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x07013550 - 0x070135A8
bbh_seg7_dl_07013550 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_07012770.l[0], 1),
    gsSPLight(bbh_seg7_lights_07012770.a, 2),
    gsSPVertex(bbh_seg7_vertex_070127C8, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSPEndDisplayList(),
);

// 0x070135A8 - 0x070135E0
bbh_seg7_dl_070135A8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09004800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07012848, 6, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x070135E0 - 0x070137E0
bbh_seg7_dl_070135E0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09003800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_070128A8, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 15, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_070129A8, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10,  7, 11, 0x0,  7,  9, 11, 0x0),
    gsSP2Triangles(12, 10, 11, 0x0, 12, 11, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_07012A88, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 3,  5, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_07012B88, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  2, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(14, 11, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_07012C78, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  3,  8, 0x0),
    gsSP2Triangles( 3,  6,  8, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 13, 10, 12, 0x0),
    gsSP1Triangle( 0,  2, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07012D68, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07012E58, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
    gsSP2Triangles( 0, 10,  1, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_07012F38, 3, 0),
    gsSP1Triangle( 0,  1,  2, 0x0),
    gsSPEndDisplayList(),
);

// 0x070137E0 - 0x07013838
bbh_seg7_dl_070137E0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07000000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07012F68, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSPEndDisplayList(),
);

// 0x07013838 - 0x070139A8
bbh_seg7_dl_07013838 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09001800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07013028, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 3, 14,  4, 0x0),
    gsSPVertex(bbh_seg7_vertex_07013118, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 4,  6, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07013208, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(bbh_seg7_vertex_070132F8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  0,  7,  1, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_070133E8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 7, 14,  8, 0x0),
    gsSPVertex(bbh_seg7_vertex_070134D8, 3, 0),
    gsSP1Triangle( 0,  1,  2, 0x0),
    gsSPEndDisplayList(),
);

// 0x070139A8 - 0x07013AA0
bbh_seg7_dl_070139A8 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07013508),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07013550),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_070135A8),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_070135E0),
    gsSPDisplayList(bbh_seg7_dl_070137E0),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07013838),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=d24432867>
// 0x07013AA0 - 0x07013B80
bbh_seg7_vertex_07013AA0 = vList(
    Vtx([  2140,   1126,   -306], 0, [   990,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  2140,   1536,   -716], 0, [     0,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  2140,   1126,   -716], 0, [     0,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1432,   1280,  -1519], 0, [   990,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1142,   1280,  -1229], 0, [     0,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1142,   1075,  -1229], 0, [     0,    480], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1432,   1075,  -1519], 0, [   990,    480], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1243,    928,  -1129], 0, [     0,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1533,    928,  -1418], 0, [   990,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  2140,   1126,   -921], 0, [   990,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  2140,   1536,  -1330], 0, [     0,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  2140,   1126,  -1330], 0, [     0,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  2140,   1536,   -921], 0, [   990,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  2140,   1536,   -306], 0, [   990,      0], [0xff, 0x00, 0x00, 0x9a]),
);

// 0x07013B80 - 0x07013BE8
bbh_seg7_dl_07013B80 = dList(
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900A800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07013AA0, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  5,  7,  8, 0x0),
    gsSP2Triangles( 5,  8,  6, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 9, 12, 10, 0x0,  0, 13,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x07013BE8 - 0x07013C58
bbh_seg7_dl_07013BE8 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATEIA, G_CC_MODULATEIA),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07013B80),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=d5863ec1b>
// 0x07013C58 - 0x07013C70
bbh_seg7_lights_07013C58 = gdSPDefLights1(
    0x20, 0x20, 0x20,
    0x50, 0x50, 0x50, 0x28, 0x28, 0x28
);

// 0x07013C70 - 0x07013C88
bbh_seg7_lights_07013C70 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x07013C88 - 0x07013D08
bbh_seg7_vertex_07013C88 = vList(
    Vtx([   512,      0,    -50], 0, [   480,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   358,      0,   -101], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   358,      0,    -50], 0, [   480,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   512,      0,   -101], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   256,    819,    -50], 0, [   480,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   102,    819,   -101], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   102,    819,    -50], 0, [   480,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   256,    819,   -101], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07013D08 - 0x07013DC8
bbh_seg7_vertex_07013D08 = vList(
    Vtx([  1024,   1638,   -101], 0, [   -98,   1074], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -716,   1638,   -101], 0, [  1058,   1074], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -716,   1638,  -1535], 0, [  1058,   -118], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1024,   1638,  -1535], 0, [   -98,   -118], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   358,    256,   -101], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   512,    256,    -50], 0, [   480,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   358,    256,    -50], 0, [   480,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   512,    256,   -101], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   102,   1075,   -101], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   256,   1075,   -101], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   256,   1075,    -50], 0, [   480,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   102,   1075,    -50], 0, [   480,    990], [0x00, 0x81, 0x00, 0xff]),
);

// 0x07013DC8 - 0x07013E08
bbh_seg7_vertex_07013DC8 = vList(
    Vtx([  1024,      0,  -1535], 0, [ -7184,  10186], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -716,      0,  -1535], 0, [ 10188,  10186], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -716,      0,   -101], 0, [ 10188,  -4120], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1024,      0,   -101], 0, [ -7184,  -4120], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07013E08 - 0x07013E48
bbh_seg7_vertex_07013E08 = vList(
    Vtx([  -511,    205,  -1228], 0, [     0,    990], [0x41, 0x57, 0x41, 0xff]),
    Vtx([  -511,    358,  -1433], 0, [   990,      0], [0x41, 0x57, 0x41, 0xff]),
    Vtx([  -613,    358,  -1330], 0, [     0,      0], [0x41, 0x57, 0x41, 0xff]),
    Vtx([  -409,    205,  -1330], 0, [   990,    990], [0x41, 0x57, 0x41, 0xff]),
);

// 0x07013E48 - 0x07013F38
bbh_seg7_vertex_07013E48 = vList(
    Vtx([  -511,      0,  -1228], 0, [     0,   2012], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  -613,    205,  -1330], 0, [   990,    844], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  -613,      0,  -1330], 0, [   990,   2012], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  -511,    205,  -1228], 0, [     0,    844], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  -409,      0,  -1330], 0, [  1414,   2012], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  -409,    205,  -1330], 0, [  1414,    648], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  -511,    205,  -1228], 0, [     0,    648], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  -511,      0,  -1228], 0, [     0,   2012], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  -511,      0,  -1433], 0, [   990,   2012], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  -511,    205,  -1433], 0, [   990,    844], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  -409,      0,  -1330], 0, [     0,   2012], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  -409,    205,  -1330], 0, [     0,    844], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([   358,      0,    -50], 0, [   478,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   358,    256,   -101], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   358,    256,    -50], 0, [   478,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07013F38 - 0x07014028
bbh_seg7_vertex_07013F38 = vList(
    Vtx([   512,    256,   -101], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   512,      0,    -50], 0, [   478,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   512,    256,    -50], 0, [   478,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   512,      0,   -101], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   256,   1075,   -101], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   256,    819,   -101], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   256,    819,    -50], 0, [   478,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   256,   1075,    -50], 0, [   478,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,    819,    -50], 0, [   478,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   1075,   -101], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   1075,    -50], 0, [   478,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,    819,   -101], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   358,      0,    -50], 0, [   478,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   358,      0,   -101], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   358,    256,   -101], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07014028 - 0x07014088
bbh_seg7_vertex_07014028 = vList(
    Vtx([  -511,    205,  -1433], 0, [   990,    844], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  -511,    358,  -1433], 0, [   990,      0], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  -409,    205,  -1330], 0, [     0,    844], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  -511,    205,  -1228], 0, [     0,    844], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  -613,    358,  -1330], 0, [   990,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  -613,    205,  -1330], 0, [   990,    844], [0xa7, 0x00, 0x59, 0xff]),
);

// 0x07014088 - 0x07014178
bbh_seg7_vertex_07014088 = vList(
    Vtx([  -511,   1638,   -101], 0, [     0,   2688], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,   1075,   -101], 0, [  3034,    820], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -511,    819,   -101], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,      0,   -101], 0, [     0,   2688], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   512,    256,   -101], 0, [  1502,   1840], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,    819,   -101], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   512,      0,   -101], 0, [  1502,   2688], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   256,    819,   -101], 0, [  2778,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,    819,   -101], 0, [  6612,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   256,    819,   -101], 0, [  3800,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   256,   1075,   -101], 0, [  3800,    820], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,   1638,   -101], 0, [  6612,   2688], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -511,      0,   -101], 0, [  6610,   2688], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -511,    819,   -101], 0, [  6610,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,    819,   -101], 0, [  3544,      0], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07014178 - 0x07014268
bbh_seg7_vertex_07014178 = vList(
    Vtx([  -716,    819,  -1330], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,   1638,  -1330], 0, [     0,   2688], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,   1638,   -306], 0, [  5078,   2688], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   1075,   -101], 0, [  3034,    820], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,    819,   -101], 0, [  3034,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -511,    819,   -101], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1024,    819,   -306], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1024,   1638,   -306], 0, [     0,   2688], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1024,   1638,  -1330], 0, [  5078,   2688], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1024,    819,  -1330], 0, [  5078,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1024,      0,   -306], 0, [  5078,   2688], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1024,    819,  -1330], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1024,      0,  -1330], 0, [     0,   2688], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1024,    819,   -306], 0, [  5078,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -716,    819,   -306], 0, [  5078,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07014268 - 0x07014368
bbh_seg7_vertex_07014268 = vList(
    Vtx([   512,    256,   -101], 0, [  1502,   1840], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   358,    256,   -101], 0, [  2268,   1840], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   256,    819,   -101], 0, [  2778,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -716,      0,  -1330], 0, [  5078,   2688], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,    819,  -1330], 0, [  5078,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,    819,   -306], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,      0,   -306], 0, [     0,   2688], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   819,   1638,  -1535], 0, [     0,   2688], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -511,   1638,  -1535], 0, [  6612,   2688], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -511,    819,  -1535], 0, [  6612,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   819,    819,  -1535], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   819,    819,  -1535], 0, [  6612,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -511,      0,  -1535], 0, [     0,   2688], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   819,      0,  -1535], 0, [  6612,   2688], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -511,    819,  -1535], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   102,    819,   -101], 0, [  3544,      0], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07014368 - 0x07014458
bbh_seg7_vertex_07014368 = vList(
    Vtx([   358,    256,   -101], 0, [  2268,   1840], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   358,      0,   -101], 0, [  2268,   2688], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -511,      0,   -101], 0, [  6610,   2688], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,    819,   -101], 0, [  3544,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   256,   1075,   -101], 0, [  3800,    820], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,   1075,   -101], 0, [  3034,    820], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -511,   1638,   -101], 0, [     0,   2688], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,   1638,   -101], 0, [  6612,   2688], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,   1638,  -1535], 0, [   990,   2680], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,    819,  -1433], 0, [   734,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,   1638,  -1433], 0, [   734,   2684], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,   1638,  -1433], 0, [   734,   2684], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   819,    819,  -1433], 0, [   734,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   922,    819,  -1330], 0, [   224,    -28], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   922,   1638,  -1330], 0, [   224,   2684], [0xa7, 0x00, 0x59, 0xff]),
);

// 0x07014458 - 0x07014538
bbh_seg7_vertex_07014458 = vList(
    Vtx([   922,    819,  -1330], 0, [   734,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   922,      0,  -1330], 0, [   734,   2684], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1024,      0,  -1330], 0, [   990,   2684], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   922,   1638,  -1330], 0, [   224,   2684], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   922,    819,  -1330], 0, [   224,    -28], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1024,    819,  -1330], 0, [     0,    -28], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1024,   1638,  -1330], 0, [     0,   2688], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   819,   1638,  -1535], 0, [   990,   2680], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,    819,  -1535], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,    819,  -1433], 0, [   734,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,    819,  -1433], 0, [   224,    -28], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   922,      0,  -1330], 0, [   734,   2684], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   922,    819,  -1330], 0, [   734,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   819,      0,  -1433], 0, [   224,   2688], [0xa7, 0x00, 0x59, 0xff]),
);

// 0x07014538 - 0x07014638
bbh_seg7_vertex_07014538 = vList(
    Vtx([   819,    819,  -1535], 0, [     0,    -28], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,      0,  -1433], 0, [   224,   2688], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,    819,  -1433], 0, [   224,    -28], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,    819,   -204], 0, [   224,    -28], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,      0,   -101], 0, [     0,   2688], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,    819,   -101], 0, [     0,    -28], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   922,    819,  -1330], 0, [   734,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1024,      0,  -1330], 0, [   990,   2684], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1024,    819,  -1330], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   819,      0,  -1535], 0, [     0,   2688], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   922,    819,   -306], 0, [   734,      0], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([   922,      0,   -306], 0, [   734,   2684], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([   819,      0,   -204], 0, [   224,   2688], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([  1024,    819,   -306], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   922,      0,   -306], 0, [   734,   2684], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   922,    819,   -306], 0, [   734,      0], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07014638 - 0x07014738
bbh_seg7_vertex_07014638 = vList(
    Vtx([   922,    819,   -306], 0, [   734,      0], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([   819,      0,   -204], 0, [   224,   2688], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([   819,    819,   -204], 0, [   224,    -28], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([   819,    819,   -204], 0, [   224,    -28], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,      0,   -204], 0, [   224,   2688], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,      0,   -101], 0, [     0,   2688], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1024,    819,   -306], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1024,      0,   -306], 0, [   990,   2684], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   922,      0,   -306], 0, [   734,   2684], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   922,   1638,   -306], 0, [   224,   2684], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([   922,    819,   -306], 0, [   224,    -28], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([   819,    819,   -204], 0, [   734,      0], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([  1024,   1638,   -306], 0, [     0,   2688], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   922,    819,   -306], 0, [   224,    -28], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   922,   1638,   -306], 0, [   224,   2684], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,   1638,   -204], 0, [   734,   2684], [0xa7, 0x00, 0xa6, 0xff]),
);

// 0x07014738 - 0x07014838
bbh_seg7_vertex_07014738 = vList(
    Vtx([   819,   1638,   -204], 0, [   734,   2684], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,    819,   -204], 0, [   734,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,    819,   -101], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,   1638,   -101], 0, [   990,   2680], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1024,   1638,   -306], 0, [     0,   2688], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1024,    819,   -306], 0, [     0,    -28], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   922,    819,   -306], 0, [   224,    -28], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -613,    819,  -1330], 0, [   734,      0], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  -511,      0,  -1433], 0, [   224,   2688], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  -511,    819,  -1433], 0, [   224,    -28], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  -716,    819,  -1330], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -613,      0,  -1330], 0, [   734,   2684], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -613,    819,  -1330], 0, [   734,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -511,    819,  -1433], 0, [   224,    -28], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,      0,  -1433], 0, [   224,   2688], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,      0,  -1535], 0, [     0,   2688], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07014838 - 0x07014938
bbh_seg7_vertex_07014838 = vList(
    Vtx([  -613,    819,  -1330], 0, [   734,      0], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  -613,      0,  -1330], 0, [   734,   2684], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  -511,      0,  -1433], 0, [   224,   2688], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  -511,    819,  -1433], 0, [   224,    -28], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,      0,  -1535], 0, [     0,   2688], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,    819,  -1535], 0, [     0,    -28], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,    819,  -1330], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -716,      0,  -1330], 0, [   990,   2684], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -613,      0,  -1330], 0, [   734,   2684], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -613,   1638,  -1330], 0, [   224,   2684], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  -511,    819,  -1433], 0, [   734,      0], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  -511,   1638,  -1433], 0, [   734,   2684], [0x5a, 0x00, 0x59, 0xff]),
    Vtx([  -716,   1638,  -1330], 0, [     0,   2688], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -613,    819,  -1330], 0, [   224,    -28], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -613,   1638,  -1330], 0, [   224,   2684], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -613,    819,  -1330], 0, [   224,    -28], [0x5a, 0x00, 0x59, 0xff]),
);

// 0x07014938 - 0x07014A28
bbh_seg7_vertex_07014938 = vList(
    Vtx([  -511,   1638,   -204], 0, [   734,   2684], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  -511,    819,   -204], 0, [   734,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  -613,    819,   -306], 0, [   224,    -28], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  -511,   1638,  -1433], 0, [   734,   2684], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,    819,  -1433], 0, [   734,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,    819,  -1535], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,   1638,  -1535], 0, [   990,   2680], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,   1638,  -1330], 0, [     0,   2688], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -716,    819,  -1330], 0, [     0,    -28], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -613,    819,  -1330], 0, [   224,    -28], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -613,   1638,   -306], 0, [   224,   2684], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -613,    819,   -306], 0, [   224,    -28], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -716,    819,   -306], 0, [     0,    -28], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -613,   1638,   -306], 0, [   224,   2684], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  -716,   1638,   -306], 0, [     0,   2688], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07014A28 - 0x07014B28
bbh_seg7_vertex_07014A28 = vList(
    Vtx([  -613,    819,   -306], 0, [   734,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -613,      0,   -306], 0, [   734,   2684], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -716,      0,   -306], 0, [   990,   2684], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -716,    819,   -306], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -511,    819,   -204], 0, [   224,    -28], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  -613,      0,   -306], 0, [   734,   2684], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  -613,    819,   -306], 0, [   734,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  -511,      0,   -204], 0, [   224,   2688], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  -511,   1638,   -101], 0, [   990,   2680], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,    819,   -101], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,    819,   -204], 0, [   734,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,   1638,   -204], 0, [   734,   2684], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,    819,   -101], 0, [     0,    -28], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,      0,   -204], 0, [   224,   2688], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,    819,   -204], 0, [   224,    -28], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -511,      0,   -101], 0, [     0,   2688], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07014B28 - 0x07014BC8
bbh_seg7_dl_07014B28 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_07013C58.l[0], 1),
    gsSPLight(bbh_seg7_lights_07013C58.a, 2),
    gsSPVertex(bbh_seg7_vertex_07013C88, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPLight(bbh_seg7_lights_07013C70.l[0], 1),
    gsSPLight(bbh_seg7_lights_07013C70.a, 2),
    gsSPVertex(bbh_seg7_vertex_07013D08, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSPEndDisplayList(),
);

// 0x07014BC8 - 0x07014C10
bbh_seg7_dl_07014BC8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_0900A000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_07013C58.l[0], 1),
    gsSPLight(bbh_seg7_lights_07013C58.a, 2),
    gsSPVertex(bbh_seg7_vertex_07013DC8, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x07014C10 - 0x07014C58
bbh_seg7_dl_07014C10 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09004800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_07013C70.l[0], 1),
    gsSPLight(bbh_seg7_lights_07013C70.a, 2),
    gsSPVertex(bbh_seg7_vertex_07013E08, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x07014C58 - 0x07014D10
bbh_seg7_dl_07014C58 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09003800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07013E48, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  9, 11, 10, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07013F38, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07014028, 6, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x07014D10 - 0x07014FD8
bbh_seg7_dl_07014D10 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09005000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07014088, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07014178, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSP1Triangle( 0,  2, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07014268, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 14, 12, 0x0,  1, 15,  2, 0x0),
    gsSPVertex(bbh_seg7_vertex_07014368, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07014458, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSPVertex(bbh_seg7_vertex_07014538, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  0,  9,  1, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_07014638, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0,  9, 11, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_07014738, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_07014838, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0,  9, 15, 10, 0x0),
    gsSPVertex(bbh_seg7_vertex_07014938, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0,  0,  2, 13, 0x0),
    gsSP1Triangle(10, 12, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07014A28, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 15, 13, 0x0),
    gsSPEndDisplayList(),
);

// 0x07014FD8 - 0x07015098
bbh_seg7_dl_07014FD8 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07014B28),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07014BC8),
    gsSPDisplayList(bbh_seg7_dl_07014C10),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07014C58),
    gsSPDisplayList(bbh_seg7_dl_07014D10),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=06710defa>
// 0x07015098 - 0x07015198
bbh_seg7_vertex_07015098 = vList(
    Vtx([  -306,    819,  -1125], 0, [ -2074,  -1564], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -204,    819,  -1330], 0, [ -1564,  -2588], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -306,    819,  -1535], 0, [ -2074,  -3610], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   819,    819,  -1330], 0, [  3546,  -2588], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1024,    819,  -1535], 0, [  4568,  -3610], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   819,    819,   -306], 0, [  3546,   2520], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1024,    819,   -101], 0, [  4568,   3542], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -204,    819,  -1023], 0, [ -1564,  -1054], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -716,    819,  -1125], 0, [ -4118,  -1564], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -306,    819,   -921], 0, [ -2074,   -542], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   102,    819,   -921], 0, [     0,   -544], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   614,    819,  -1023], 0, [  2524,  -1054], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -511,    819,   -511], 0, [ -3096,   1500], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -716,    819,   -101], 0, [ -4118,   3544], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -306,    819,   -613], 0, [ -2074,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -204,    819,   -511], 0, [ -1564,   1500], [0xff, 0xff, 0xff, 0xff]),
);

// 0x07015198 - 0x07015298
bbh_seg7_vertex_07015198 = vList(
    Vtx([  -716,    819,   -101], 0, [ -4118,   3544], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -511,    819,   -204], 0, [ -3096,   3032], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -511,    819,   -511], 0, [ -3096,   1500], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -204,    819,   -511], 0, [ -1564,   1500], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   512,    819,   -613], 0, [  2012,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -306,    819,   -613], 0, [ -2074,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1024,    819,   -101], 0, [  4568,   3542], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -204,    819,   -204], 0, [ -1564,   3032], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   512,    819,   -306], 0, [  2012,   2520], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   819,    819,   -306], 0, [  3546,   2520], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   102,    819,   -613], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   614,    819,   -818], 0, [  2524,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   102,    819,   -921], 0, [     0,   -544], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   819,    819,   -613], 0, [  3546,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   614,    819,  -1023], 0, [  2524,  -1054], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   819,    819,   -818], 0, [  3546,      0], [0xff, 0xff, 0xff, 0xff]),
);

// 0x07015298 - 0x07015398
bbh_seg7_dl_07015298 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09000000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07015098, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  2,  1,  3, 0x0),
    gsSP2Triangles( 2,  3,  4, 0x0,  4,  3,  5, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  0,  7,  1, 0x0),
    gsSP2Triangles( 8,  7,  0, 0x0,  7,  9, 10, 0x0),
    gsSP2Triangles(11,  7, 10, 0x0,  8,  9,  7, 0x0),
    gsSP2Triangles( 8, 12,  9, 0x0,  8, 13, 12, 0x0),
    gsSP2Triangles(12, 14,  9, 0x0, 12, 15, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07015198, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 0,  6,  7, 0x0,  0,  7,  1, 0x0),
    gsSP2Triangles( 3,  7,  8, 0x0,  6,  8,  7, 0x0),
    gsSP2Triangles( 6,  9,  8, 0x0,  3,  8,  4, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSP2Triangles(11, 14, 12, 0x0, 13, 15, 11, 0x0),
    gsSPEndDisplayList(),
);

// 0x07015398 - 0x07015408
bbh_seg7_dl_07015398 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07015298),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=4215e8f83>
// 0x07015408 - 0x07015508
bbh_seg7_vertex_07015408 = vList(
    Vtx([   358,   1434,  -1525], 0, [   990,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([   -50,   1024,  -1525], 0, [     0,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([   358,   1024,  -1525], 0, [   990,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -410,    563,  -1519], 0, [   990,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -700,    563,  -1229], 0, [     0,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -700,    358,  -1229], 0, [     0,    480], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -410,    358,  -1519], 0, [   990,    480], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -599,    211,  -1129], 0, [     0,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -310,    211,  -1418], 0, [   990,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([   358,    614,  -1525], 0, [   990,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([   -50,    205,  -1525], 0, [     0,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([   358,    205,  -1525], 0, [   990,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([   -50,    614,  -1525], 0, [     0,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1014,    205,   -613], 0, [   990,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1014,    614,  -1023], 0, [     0,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1014,    205,  -1023], 0, [     0,    990], [0xff, 0x00, 0x00, 0x9a]),
);

// 0x07015508 - 0x070155E8
bbh_seg7_vertex_07015508 = vList(
    Vtx([   358,   1434,  -1525], 0, [   990,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([   -50,   1434,  -1525], 0, [     0,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([   -50,   1024,  -1525], 0, [     0,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -706,    205,  -1023], 0, [   990,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -706,    614,   -613], 0, [     0,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -706,    205,   -613], 0, [     0,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -706,    614,  -1023], 0, [   990,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -706,   1024,  -1023], 0, [   990,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -706,   1434,  -1023], 0, [   990,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -706,   1434,   -613], 0, [     0,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  -706,   1024,   -613], 0, [     0,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1014,    205,   -613], 0, [   990,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1014,    614,   -613], 0, [   990,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1014,    614,  -1023], 0, [     0,      0], [0xff, 0x00, 0x00, 0x9a]),
);

// 0x070155E8 - 0x07015628
bbh_seg7_vertex_070155E8 = vList(
    Vtx([  1014,   1024,   -613], 0, [   990,    990], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1014,   1434,   -613], 0, [   990,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1014,   1434,  -1023], 0, [     0,      0], [0xff, 0x00, 0x00, 0x9a]),
    Vtx([  1014,   1024,  -1023], 0, [     0,    990], [0xff, 0x00, 0x00, 0x9a]),
);

// 0x07015628 - 0x070156E0
bbh_seg7_dl_07015628 = dList(
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, spooky_0900A800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07015408, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  5,  7,  8, 0x0),
    gsSP2Triangles( 5,  8,  6, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 9, 12, 10, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_07015508, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_070155E8, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x070156E0 - 0x07015750
bbh_seg7_dl_070156E0 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATEIA, G_CC_MODULATEIA),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07015628),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=a34b8be3d>
// 0x07015750 - 0x07015840
bbh_seg7_vertex_07015750 = vList(
    Vtx([  1014,    307,   -818], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1014,    410,   -716], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   963,    410,   -818], 0, [   478,    478], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1014,    512,   -818], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1014,    410,   -921], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1014,   1126,   -818], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1014,   1229,   -716], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   963,   1229,   -818], 0, [   478,    478], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1014,   1229,   -921], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1014,   1331,   -818], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -706,   1229,   -716], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -706,   1126,   -818], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -654,   1229,   -818], 0, [   480,    480], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -706,   1229,   -921], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -706,   1331,   -818], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
);

// 0x07015840 - 0x07015930
bbh_seg7_vertex_07015840 = vList(
    Vtx([  -706,    512,   -818], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -706,    410,   -716], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -654,    410,   -818], 0, [   480,    480], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -706,    307,   -818], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -706,    410,   -921], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   256,    410,  -1525], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   154,    512,  -1525], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   154,    410,  -1474], 0, [   480,    478], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   154,    307,  -1525], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    51,    410,  -1525], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    51,   1229,  -1525], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   154,   1126,  -1525], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   154,   1229,  -1474], 0, [   480,    478], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   256,   1229,  -1525], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   154,   1331,  -1525], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
);

// 0x07015930 - 0x07015A20
bbh_seg7_dl_07015930 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09006800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07015750, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  1,  3,  2, 0x0),
    gsSP2Triangles( 3,  4,  2, 0x0,  4,  0,  2, 0x0),
    gsSP2Triangles( 5,  6,  7, 0x0,  8,  5,  7, 0x0),
    gsSP2Triangles( 6,  9,  7, 0x0,  9,  8,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 11, 13, 12, 0x0),
    gsSP2Triangles(13, 14, 12, 0x0, 14, 10, 12, 0x0),
    gsSPVertex(bbh_seg7_vertex_07015840, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  1,  3,  2, 0x0),
    gsSP2Triangles( 3,  4,  2, 0x0,  4,  0,  2, 0x0),
    gsSP2Triangles( 5,  6,  7, 0x0,  8,  5,  7, 0x0),
    gsSP2Triangles( 6,  9,  7, 0x0,  9,  8,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 11, 13, 12, 0x0),
    gsSP2Triangles(13, 14, 12, 0x0, 14, 10, 12, 0x0),
    gsSPEndDisplayList(),
);

// 0x07015A20 - 0x07015A90
bbh_seg7_dl_07015A20 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07015930),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=4e3f495eb>
// 0x07015A90 - 0x07015AA8
bbh_seg7_lights_07015A90 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x07015AA8 - 0x07015B98
bbh_seg7_vertex_07015AA8 = vList(
    Vtx([  1024,   1741,   1140], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1024,   1843,   1345], 0, [  2012,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1024,   1741,   1345], 0, [  2012,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   307,   1741,   1345], 0, [  2012,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   307,   1843,   1345], 0, [  2012,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   307,   1843,   1140], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   307,   1741,   1140], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   307,   1741,   1140], 0, [  6100,    990], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([   307,   1843,   1140], 0, [  6100,      0], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([   410,   1843,   1038], 0, [  5078,      0], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([   410,   1741,   1038], 0, [  5078,    990], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([   410,   1741,   1038], 0, [  5078,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   410,   1843,   1038], 0, [  5078,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   922,   1843,   1038], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   922,   1741,   1038], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07015B98 - 0x07015C08
bbh_seg7_vertex_07015B98 = vList(
    Vtx([   922,   1741,   1038], 0, [     0,    990], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([   922,   1843,   1038], 0, [     0,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1024,   1843,   1140], 0, [ -1052,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1024,   1741,   1140], 0, [ -1052,    990], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1024,   1741,   1140], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1024,   1843,   1140], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1024,   1843,   1345], 0, [  2012,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07015C08 - 0x07015C78
bbh_seg7_vertex_07015C08 = vList(
    Vtx([   102,   1741,    218], 0, [     0,    454], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   102,   1741,   -805], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -716,   1741,   -805], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -716,   1741,   1345], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2048,   1741,   1345], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2048,   1741,    218], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   102,   1741,    218], 0, [     0,    612], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07015C78 - 0x07015D68
bbh_seg7_vertex_07015C78 = vList(
    Vtx([  1229,   1922,   1843], 0, [  2454,    880], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1229,   2150,   1843], 0, [  2454,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1229,   2150,   1345], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -716,   1741,   -805], 0, [ -4118,   1604], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   205,   2150,   -805], 0, [   480,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -716,   2150,   -805], 0, [ -4118,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   205,   1741,   -805], 0, [   480,   1604], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -716,   2150,   -805], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,   1741,   1345], 0, [ -9740,   1604], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,   1741,   -805], 0, [   990,   1604], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,   2150,   1345], 0, [ -9740,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   2150,   1843], 0, [  2454,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   1922,   1345], 0, [     0,    880], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   2150,   1345], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   1922,   1843], 0, [  2454,    880], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07015D68 - 0x07015E58
bbh_seg7_vertex_07015D68 = vList(
    Vtx([  2048,   1997,    410], 0, [   922,    580], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   1997,    563], 0, [  1688,    580], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   2150,   1345], 0, [  5590,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1229,   1922,   1843], 0, [  2454,    880], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1229,   2150,   1345], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1229,   1922,   1345], 0, [     0,    880], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   1922,   1843], 0, [  3716,    880], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   512,   2150,   1843], 0, [  2352,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   512,   1922,   1843], 0, [  2352,    880], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,   2150,   1843], 0, [  3716,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1229,   1922,   1843], 0, [     0,    880], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,   1922,   1843], 0, [  1330,    880], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,   2150,   1843], 0, [  1330,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1229,   2150,   1843], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   2150,    218], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07015E58 - 0x07015F58
bbh_seg7_vertex_07015E58 = vList(
    Vtx([  -716,   2150,   1345], 0, [  6440,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,   1741,   1345], 0, [  3716,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -716,   1741,   1345], 0, [  6440,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   1997,    563], 0, [  1688,    580], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   1741,    563], 0, [  1688,   1604], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   1741,   1345], 0, [  5590,   1604], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   2150,   1345], 0, [  5590,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   1997,    410], 0, [   922,    580], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   2150,    218], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   1741,    218], 0, [     0,   1604], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   1741,    410], 0, [   922,   1604], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1229,   2150,   1345], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   1741,   1345], 0, [ -2756,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1229,   1741,   1345], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   2150,   1345], 0, [ -2756,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,   2150,   1345], 0, [  3716,      0], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07015F58 - 0x07016038
bbh_seg7_vertex_07015F58 = vList(
    Vtx([   512,   2150,   1894], 0, [  1246,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   512,   1922,   1843], 0, [  1500,    880], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   512,   2150,   1843], 0, [  1500,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   512,   1922,   1894], 0, [  1246,    880], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   819,   2150,   1843], 0, [  1500,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,   1922,   1894], 0, [  1246,    880], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,   2150,   1894], 0, [  1246,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,   1922,   1843], 0, [  1500,    880], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2099,   1741,    410], 0, [   -98,   1604], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2048,   1741,    563], 0, [   666,   1604], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2099,   1741,    563], 0, [   666,   1604], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2099,   1997,    563], 0, [   666,    580], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2048,   1997,    410], 0, [   -98,    580], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2099,   1997,    410], 0, [   -98,    580], [0x00, 0x81, 0x00, 0xff]),
);

// 0x07016038 - 0x07016118
bbh_seg7_vertex_07016038 = vList(
    Vtx([  2099,   1997,    410], 0, [   -98,    580], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2048,   1741,    410], 0, [   -98,   1604], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2099,   1741,    410], 0, [   -98,   1604], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2099,   1741,    563], 0, [   666,   1604], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   1741,    563], 0, [   666,   1604], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   1997,    563], 0, [   666,    580], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2099,   1741,    410], 0, [   -98,   1604], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2048,   1741,    410], 0, [   -98,   1604], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2048,   1741,    563], 0, [   666,   1604], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2099,   1997,    563], 0, [   666,    580], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   1997,    410], 0, [   -98,    580], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2099,   1997,    563], 0, [   666,    580], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2048,   1997,    563], 0, [   666,    580], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2048,   1997,    410], 0, [   -98,    580], [0x00, 0x81, 0x00, 0xff]),
);

// 0x07016118 - 0x07016208
bbh_seg7_vertex_07016118 = vList(
    Vtx([   102,   1922,   1345], 0, [  3716,   1112], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1229,   1922,   1345], 0, [     0,   1112], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1229,   1741,   1345], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,   1741,   1345], 0, [  3716,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,   2150,    116], 0, [   480,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   1741,    218], 0, [   990,   1604], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   2150,    218], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -716,   1741,    116], 0, [  1500,   1604], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  -716,   2150,    116], 0, [  1500,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  -613,   2150,    218], 0, [   990,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  -613,   1741,    218], 0, [   990,   1604], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  -613,   1741,    218], 0, [   990,   1604], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -613,   2150,    218], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -613,   2150,    423], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -613,   1741,    423], 0, [     0,   1604], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07016208 - 0x070162F8
bbh_seg7_vertex_07016208 = vList(
    Vtx([  -613,   1741,    423], 0, [     0,   1604], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  -613,   2150,    423], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  -716,   2150,    526], 0, [  -540,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  -716,   1741,    526], 0, [  -542,   1604], [0x59, 0x00, 0x59, 0xff]),
    Vtx([   102,   2150,   -805], 0, [ -4118,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   1741,   -497], 0, [ -2586,   1604], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   2150,   -497], 0, [ -2586,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   1741,   -805], 0, [ -4118,   1604], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   1741,    218], 0, [  9678,   1604], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2048,   2150,    218], 0, [  9678,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   102,   2150,    218], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   102,   2150,    116], 0, [   480,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   1741,    116], 0, [   480,   1604], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   1741,    218], 0, [   990,   1604], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   1741,    218], 0, [     0,   1604], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x070162F8 - 0x070163F8
bbh_seg7_vertex_070162F8 = vList(
    Vtx([   205,   1741,   -805], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2048,   2150,   -805], 0, [  8144,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   205,   2150,   -805], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2048,   1741,   -805], 0, [  8144,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2048,   1741,    116], 0, [  4568,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   2150,   -805], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   1741,   -805], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   2150,    116], 0, [  4568,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   205,   2150,   -497], 0, [  -542,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   1741,   -805], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   2150,   -805], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   1741,   -497], 0, [  -540,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   1741,    116], 0, [  8144,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   205,   2150,    116], 0, [  8144,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   2150,    116], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   1741,    116], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
);

// 0x070163F8 - 0x070164D8
bbh_seg7_vertex_070163F8 = vList(
    Vtx([   102,   1922,   1345], 0, [    36,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   102,   1922,   1843], 0, [  2524,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1229,   1922,   1843], 0, [  2524,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1229,   1922,   1345], 0, [    36,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   410,   1843,   1038], 0, [  -540,   1720], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   307,   1843,   1140], 0, [     0,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   307,   1843,   1345], 0, [   990,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1024,   1843,   1345], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1024,   1843,   1140], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   922,   1843,   1038], 0, [  -540,    260], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -716,   2150,    116], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -716,   2150,    526], 0, [     0,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -613,   2150,    423], 0, [   990,   1400], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -613,   2150,    218], 0, [   990,    580], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x070164D8 - 0x07016558
bbh_seg7_vertex_070164D8 = vList(
    Vtx([   205,   2355,    116], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   1741,   -497], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   2355,   -497], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   1741,    116], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   2355,   -497], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   1741,    116], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   2355,    116], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   1741,   -497], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07016558 - 0x070165D8
bbh_seg7_vertex_07016558 = vList(
    Vtx([   819,   1922,   1843], 0, [     0,  -2076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   512,   1922,   1843], 0, [  3036,  -2076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   512,   1922,   1894], 0, [  3036,  -2588], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   819,   1922,   1894], 0, [     0,  -2588], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   102,   1741,    116], 0, [     0,   4564], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2048,   1741,   -805], 0, [ 10868,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   102,   1741,   -805], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2048,   1741,    116], 0, [ 10868,   4564], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x070165D8 - 0x070166B8
bbh_seg7_vertex_070165D8 = vList(
    Vtx([   819,   2150,   1843], 0, [ -1048,   2010], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,   2150,   1894], 0, [ -1048,   2010], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,   2178,   1894], 0, [ -1048,   1740], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   512,   2150,   1894], 0, [  2012,   2010], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   512,   2178,   1843], 0, [  2012,   1740], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   512,   2178,   1894], 0, [  2012,   1740], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   512,   2150,   1843], 0, [  2012,   2010], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   512,   2178,   1843], 0, [  2012,   1740], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   512,   2150,   1843], 0, [  2012,   2010], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,   2150,   1843], 0, [  6100,   2010], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,   2178,   1843], 0, [ -1048,   1740], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   717,   2765,   1843], 0, [     0,  -4120], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,   2253,   1843], 0, [  6100,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   614,   2765,   1843], 0, [   988,  -4120], [0x00, 0x00, 0x81, 0xff]),
);

// 0x070166B8 - 0x070167A8
bbh_seg7_vertex_070166B8 = vList(
    Vtx([   819,   2178,   1894], 0, [ -1048,   1740], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   512,   2178,   1894], 0, [  2012,   1740], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   512,   2178,   1843], 0, [  2012,   1740], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   819,   2150,   1843], 0, [ -1048,   2010], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,   2178,   1843], 0, [ -1048,   1740], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1229,   2150,   1843], 0, [ -5136,   2010], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   819,   2150,   1843], 0, [ -1048,   2010], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,   2178,   1894], 0, [ -1048,   1740], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   819,   2178,   1843], 0, [ -1048,   1740], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   2253,   1843], 0, [ -2072,      0], [0x59, 0xa7, 0x00, 0xff]),
    Vtx([   614,   2765,    792], 0, [  8416,  -5142], [0x59, 0xa7, 0x00, 0xff]),
    Vtx([   614,   2765,   1843], 0, [ -2072,  -5142], [0x59, 0xa7, 0x00, 0xff]),
    Vtx([   819,   2178,   1843], 0, [ -1048,   1740], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1229,   2253,   1843], 0, [ -5136,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   717,   2765,   1843], 0, [     0,  -4120], [0x00, 0x00, 0x81, 0xff]),
);

// 0x070167A8 - 0x07016888
bbh_seg7_vertex_070167A8 = vList(
    Vtx([   102,   2253,   1843], 0, [ -2072,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   2150,   1843], 0, [ -2072,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   2150,   1345], 0, [  2896,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   2253,   1253], 0, [  3816,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   2253,   1843], 0, [ -2072,      0], [0x59, 0xa7, 0x00, 0xff]),
    Vtx([   102,   2253,   1253], 0, [  3816,      0], [0x59, 0xa7, 0x00, 0xff]),
    Vtx([   614,   2765,    792], 0, [  8416,  -5142], [0x59, 0xa7, 0x00, 0xff]),
    Vtx([  1229,   2150,   1843], 0, [ -2072,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1229,   2253,   1843], 0, [ -2072,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1229,   2150,   1345], 0, [  2896,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1229,   2253,   1253], 0, [  3816,      0], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([  1229,   2253,   1843], 0, [ -2072,      0], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([   717,   2765,   1843], 0, [ -2072,  -5142], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([  1229,   2253,   1253], 0, [  3816,      0], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07016888 - 0x07016968
bbh_seg7_vertex_07016888 = vList(
    Vtx([  2048,   3174,    423], 0, [  2012,  -7186], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   3174,    116], 0, [ -1052,  -7186], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   2150,   -805], 0, [-10248,   3032], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   2150,   1345], 0, [ 11212,   3032], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   2253,   1253], 0, [ -2072,   4054], [0x00, 0xac, 0xa2, 0xff]),
    Vtx([   102,   2150,   1345], 0, [ -2072,   5076], [0x00, 0xac, 0xa2, 0xff]),
    Vtx([  -716,   2150,   1345], 0, [-10248,   5076], [0x00, 0xac, 0xa2, 0xff]),
    Vtx([  -716,   3174,    423], 0, [-10248,  -5142], [0x00, 0xac, 0xa2, 0xff]),
    Vtx([   614,   2765,    792], 0, [  3036,  -1054], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([   102,   2253,   1253], 0, [ -2072,   4054], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([  -716,   3174,    423], 0, [-10248,  -5142], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([   717,   2765,    792], 0, [  4056,  -1054], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([  2048,   3174,    423], 0, [ 17344,  -5142], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([  1229,   2253,   1253], 0, [  9168,   4054], [0x00, 0xab, 0xa2, 0xff]),
);

// 0x07016968 - 0x07016A58
bbh_seg7_vertex_07016968 = vList(
    Vtx([  2048,   2150,   1345], 0, [ 17344,   5076], [0x00, 0xac, 0xa2, 0xff]),
    Vtx([  1229,   2253,   1253], 0, [  9168,   4054], [0x00, 0xac, 0xa2, 0xff]),
    Vtx([  2048,   3174,    423], 0, [ 17344,  -5142], [0x00, 0xac, 0xa2, 0xff]),
    Vtx([  1229,   2150,   1345], 0, [  9168,   5076], [0x00, 0xac, 0xa2, 0xff]),
    Vtx([  1229,   2253,   1253], 0, [  3816,      0], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([   717,   2765,   1843], 0, [ -2072,  -5142], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([   717,   2765,    792], 0, [  8416,  -5142], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([   717,   2765,    792], 0, [  3936,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   614,   2765,   1843], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   614,   2765,    792], 0, [  3936,    570], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   717,   2765,   1843], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -716,   2150,   -805], 0, [-10248,   3032], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,   3174,    116], 0, [ -1052,  -7186], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,   3174,    423], 0, [  2012,  -7186], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -716,   2150,   1345], 0, [ 11212,   3032], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07016A58 - 0x07016B58
bbh_seg7_vertex_07016A58 = vList(
    Vtx([  2048,   2150,   -805], 0, [ 17344,   5076], [0x00, 0xac, 0x5e, 0xff]),
    Vtx([  -716,   3174,    116], 0, [-10248,  -5142], [0x00, 0xac, 0x5e, 0xff]),
    Vtx([  -716,   2150,   -805], 0, [-10248,   5076], [0x00, 0xac, 0x5e, 0xff]),
    Vtx([  2048,   3174,    116], 0, [ 17344,  -5142], [0x00, 0xac, 0x5e, 0xff]),
    Vtx([  2048,   3174,    423], 0, [-12292,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -716,   3174,    423], 0, [ 15300,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -716,   3174,    116], 0, [ 15300,  -2076], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2048,   3174,    116], 0, [-12292,  -2076], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   205,   2355,    116], 0, [ -3092,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   2355,   -497], 0, [  3032,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   3174,    116], 0, [ -3092,  -7186], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   2150,   -497], 0, [  3032,   3032], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   2150,   -805], 0, [  6100,   3032], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   205,   2150,    116], 0, [  9164,   6098], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   205,   3174,    116], 0, [  9168,  -4120], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   3174,    116], 0, [ -7180,  -4120], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07016B58 - 0x07016C58
bbh_seg7_vertex_07016B58 = vList(
    Vtx([   205,   2150,    116], 0, [  9164,   6098], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   3174,    116], 0, [ -7180,  -4120], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2048,   2150,    116], 0, [ -7184,   6098], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,   2355,   -497], 0, [ -2072,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   2355,    116], 0, [  4056,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   3288,    218], 0, [  5076,  -8322], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   2150,    218], 0, [  5076,   3032], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   2150,    116], 0, [  4056,   3032], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   205,   2355,   -497], 0, [     0,  -5142], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   102,   1741,   -497], 0, [   992,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   205,   1741,   -497], 0, [     0,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   102,   2150,   -805], 0, [ -5136,   3032], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   102,   2150,   -497], 0, [ -2072,   3032], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  2048,   2150,    218], 0, [ 11208,   6098], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2048,   3288,    218], 0, [ 11208,  -5256], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   102,   3288,    218], 0, [ -8204,  -5256], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07016C58 - 0x07016D38
bbh_seg7_vertex_07016C58 = vList(
    Vtx([  2048,   2150,    218], 0, [ 11208,   6098], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   102,   3288,    218], 0, [ -8204,  -5256], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   102,   2150,    218], 0, [ -8204,   6098], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   205,   2355,    116], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   102,   2355,   -497], 0, [   988,   6098], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   205,   2355,   -497], 0, [     0,   6098], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   102,   2355,    116], 0, [   988,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   205,   1741,    116], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   102,   2355,    116], 0, [   992,  -5142], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   205,   2355,    116], 0, [     0,  -5142], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   205,   2355,   -497], 0, [     0,  -5142], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   102,   2355,   -497], 0, [   992,  -5142], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   102,   1741,   -497], 0, [   992,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   102,   1741,    116], 0, [   992,    990], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07016D38 - 0x07016DC8
bbh_seg7_dl_07016D38 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09004800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_07015A90.l[0], 1),
    gsSPLight(bbh_seg7_lights_07015A90.a, 2),
    gsSPVertex(bbh_seg7_vertex_07015AA8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07015B98, 7, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP1Triangle( 4,  5,  6, 0x0),
    gsSPEndDisplayList(),
);

// 0x07016DC8 - 0x07016E10
bbh_seg7_dl_07016DC8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09008800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07015C08, 7, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x07016E10 - 0x07016FE8
bbh_seg7_dl_07016E10 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09005000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07015C78, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(bbh_seg7_vertex_07015D68, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  7,  6,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 0,  2, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07015E58, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10,  7,  9, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 14, 12, 0x0,  0, 15,  1, 0x0),
    gsSPVertex(bbh_seg7_vertex_07015F58, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_07016038, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  3,  5,  9, 0x0),
    gsSP2Triangles( 0, 10,  1, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_07016118, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07016208, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle( 8, 10, 14, 0x0),
    gsSPEndDisplayList(),
);

// 0x07016FE8 - 0x07017050
bbh_seg7_dl_07016FE8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09000800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_070162F8, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x07017050 - 0x070170B8
bbh_seg7_dl_07017050 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07000000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_070163F8, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  8, 0x0),
    gsSP2Triangles( 4,  6,  7, 0x0,  4,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSPEndDisplayList(),
);

// 0x070170B8 - 0x07017100
bbh_seg7_dl_070170B8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bbh_seg7_texture_07002000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_070164D8, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x07017100 - 0x07017148
bbh_seg7_dl_07017100 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09009000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_07016558, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x07017148 - 0x07017378
bbh_seg7_dl_07017148 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09007000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bbh_seg7_vertex_070165D8, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10,  7, 11, 0x0, 12,  7,  9, 0x0),
    gsSP2Triangles(12, 13,  7, 0x0, 13, 11,  7, 0x0),
    gsSPVertex(bbh_seg7_vertex_070166B8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 0,  2, 12, 0x0,  4, 13,  5, 0x0),
    gsSP1Triangle( 4, 14, 13, 0x0),
    gsSPVertex(bbh_seg7_vertex_070167A8, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  2, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0,  8, 13,  9, 0x0),
    gsSPVertex(bbh_seg7_vertex_07016888, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  2, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11,  8, 10, 0x0),
    gsSP2Triangles(11, 10, 12, 0x0, 13, 11, 12, 0x0),
    gsSPVertex(bbh_seg7_vertex_07016968, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(bbh_seg7_vertex_07016A58, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  9, 11, 12, 0x0),
    gsSP2Triangles( 9, 12, 10, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_07016B58, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 4,  6,  5, 0x0,  4,  7,  6, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11,  3,  5, 0x0),
    gsSP2Triangles(11, 12,  3, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(bbh_seg7_vertex_07016C58, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0,  7, 13,  8, 0x0),
    gsSPEndDisplayList(),
);

// 0x07017378 - 0x07017480
bbh_seg7_dl_07017378 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07016D38),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07016DC8),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07016E10),
    gsSPDisplayList(bbh_seg7_dl_07016FE8),
    gsSPDisplayList(bbh_seg7_dl_07017050),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_070170B8),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07017100),
    gsSPDisplayList(bbh_seg7_dl_07017148),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=fe60fcb6e>
// 0x07017480 - 0x07017498
bbh_seg7_lights_07017480 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x07017498 - 0x07017518
bbh_seg7_vertex_07017498 = vList(
    Vtx([   102,   2372,   1132], 0, [     0,    990], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([  -306,   2676,    858], 0, [   990,      0], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([   102,   2676,    858], 0, [     0,      0], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([  -306,   2372,   1132], 0, [   990,    990], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([  1638,   2372,   1132], 0, [     0,    990], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([  1229,   2676,    858], 0, [   990,      0], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([  1638,   2676,    858], 0, [     0,      0], [0x00, 0xab, 0xa2, 0xff]),
    Vtx([  1229,   2372,   1132], 0, [   990,    990], [0x00, 0xab, 0xa2, 0xff]),
);

// 0x07017518 - 0x07017570
bbh_seg7_dl_07017518 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, spooky_09006000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(bbh_seg7_lights_07017480.l[0], 1),
    gsSPLight(bbh_seg7_lights_07017480.a, 2),
    gsSPVertex(bbh_seg7_vertex_07017498, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x07017570 - 0x070175E0
bbh_seg7_dl_07017570 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bbh_seg7_dl_07017518),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);

}