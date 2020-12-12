// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function castle_inside_model_area_1B_init(){
/// <pygml?v=1.0&h=c31d970a9>
// 0x07031608 - 0x070316C8
inside_castle_seg7_vertex_07031608 = vList(
    Vtx([  2001,   1024,  -2688], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1857,   1024,  -2833], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2001,    691,  -2688], 0, [   990,   2012], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1857,    691,  -2833], 0, [     0,   2012], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1857,   1024,  -2037], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2001,   1024,  -2182], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1857,    691,  -2037], 0, [   990,   2012], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  2001,    691,  -2182], 0, [     0,   2012], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1205,    691,  -2688], 0, [     0,   2012], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1350,   1024,  -2833], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1205,   1024,  -2688], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  1350,    691,  -2833], 0, [   990,   2012], [0xff, 0xff, 0xff, 0xff]),
);

// 0x070316C8 - 0x07031720
inside_castle_seg7_dl_070316C8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07002000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_07031608, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  1,  3,  2, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  5,  7,  6, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSPEndDisplayList(),
);

// 0x07031720 - 0x07031790
inside_castle_seg7_dl_07031720 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_070316C8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=d73abddd3>
// 0x07031790 - 0x070317A8
inside_castle_seg7_lights_07031790 = gdSPDefLights1(
    0x5f, 0x5f, 0x5f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x070317A8 - 0x070317E8
inside_castle_seg7_vertex_070317A8 = vList(
    Vtx([  1179,    819,  -2510], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1179,    819,  -2356], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1179,    666,  -2356], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1179,    666,  -2510], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x070317E8 - 0x07031830
inside_castle_seg7_dl_070317E8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07003000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(inside_castle_seg7_lights_07031790.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_07031790.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_070317A8, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x07031830 - 0x070318A0
inside_castle_seg7_dl_07031830 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_070317E8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=a33e00782>
// 0x070318A0 - 0x070318B8
inside_castle_seg7_lights_070318A0 = gdSPDefLights1(
    0x52, 0x52, 0x52,
    0xdd, 0xdd, 0xdd, 0x28, 0x28, 0x28
);

// 0x070318B8 - 0x070318D0
inside_castle_seg7_lights_070318B8 = gdSPDefLights1(
    0x5f, 0x5f, 0x5f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x070318D0 - 0x070319D0
inside_castle_seg7_vertex_070318D0 = vList(
    Vtx([ -4121,    282,   -613], 0, [  3034,    326], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4121,    282,   -306], 0, [     0,    326], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4121,    256,   -306], 0, [     0,    530], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4146,    282,   -613], 0, [  3034,    172], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4146,    307,   -613], 0, [  3034,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4146,    307,   -306], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4146,    282,   -306], 0, [     0,    172], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4069,    230,   -613], 0, [  3034,   1040], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4069,    205,   -306], 0, [     0,   1244], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4069,    205,   -613], 0, [  3034,   1244], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4069,    230,   -306], 0, [     0,   1040], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4095,    256,   -613], 0, [  3034,    684], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4095,    256,   -306], 0, [     0,    684], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4095,    230,   -306], 0, [     0,    888], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4095,    230,   -613], 0, [  3034,    888], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4121,    256,   -613], 0, [  3034,    530], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x070319D0 - 0x07031AB0
inside_castle_seg7_vertex_070319D0 = vList(
    Vtx([ -5221,    205,  -1484], 0, [  5078,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -5221,    205,   -869], 0, [  2012,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4402,    205,   -869], 0, [  2012,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -3173,    205,  -1484], 0, [  5078,   7120], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4197,    205,   -665], 0, [   990,   2010], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -3173,    205,    563], 0, [ -5140,   7120], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4197,    205,   -255], 0, [ -1052,   2010], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4402,    205,    -50], 0, [ -2074,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -5221,    205,    563], 0, [ -5140,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -5221,    205,    -50], 0, [ -2074,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -3173,    205,   -716], 0, [  2012,    734], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -3122,    205,   -869], 0, [  2268,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -3173,    205,   -869], 0, [  2012,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -3122,    205,   -716], 0, [  2268,    734], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07031AB0 - 0x07031B70
inside_castle_seg7_vertex_07031AB0 = vList(
    Vtx([ -4095,    230,   -613], 0, [  3034,    888], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4095,    230,   -306], 0, [     0,    888], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4069,    230,   -306], 0, [     0,   1040], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4069,    230,   -613], 0, [  3034,   1040], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4121,    256,   -613], 0, [  3034,    530], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4121,    256,   -306], 0, [     0,    530], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4095,    256,   -306], 0, [     0,    684], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4095,    256,   -613], 0, [  3034,    684], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4146,    282,   -613], 0, [  3034,    172], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4121,    282,   -306], 0, [     0,    326], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4121,    282,   -613], 0, [  3034,    326], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4146,    282,   -306], 0, [     0,    172], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07031B70 - 0x07031C70
inside_castle_seg7_vertex_07031B70 = vList(
    Vtx([ -3173,   1126,  -1177], 0, [  3546,  -6164], [0xcb, 0x9b, 0x36, 0xff]),
    Vtx([ -3650,   1434,  -1074], 0, [  3034,  -3784], [0xcb, 0x9b, 0x36, 0xff]),
    Vtx([ -3481,   1126,  -1484], 0, [  5078,  -4630], [0xcb, 0x9b, 0x36, 0xff]),
    Vtx([ -4812,   1434,    154], 0, [ -3096,   2010], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -4812,   1434,  -1074], 0, [  3034,   2010], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -3583,   1434,  -1074], 0, [  3034,  -4120], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -3583,   1434,    154], 0, [ -3096,  -4120], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -4402,    307,   -869], 0, [  2012,   2010], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -5221,    307,   -869], 0, [  2012,  -2076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -5221,    307,    -50], 0, [ -2074,  -2076], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4402,    307,    -50], 0, [ -2074,   2010], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4197,    307,   -255], 0, [ -1052,   3032], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4197,    307,   -665], 0, [   990,   3032], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -3481,   1126,  -1484], 0, [  5078,  -4630], [0x00, 0x9b, 0x4c, 0xff]),
    Vtx([ -4745,   1434,  -1074], 0, [  3034,   1674], [0x00, 0x9b, 0x4c, 0xff]),
    Vtx([ -4914,   1126,  -1484], 0, [  5078,   2522], [0x00, 0x9b, 0x4c, 0xff]),
);

// 0x07031C70 - 0x07031D70
inside_castle_seg7_vertex_07031C70 = vList(
    Vtx([ -3481,   1126,  -1484], 0, [  5078,  -4630], [0x00, 0x9b, 0x4c, 0xff]),
    Vtx([ -3650,   1434,  -1074], 0, [  3034,  -3784], [0x00, 0x9b, 0x4c, 0xff]),
    Vtx([ -4745,   1434,  -1074], 0, [  3034,   1674], [0x00, 0x9b, 0x4c, 0xff]),
    Vtx([ -4914,   1126,    563], 0, [ -5140,   2520], [0x00, 0x9b, 0xb4, 0xff]),
    Vtx([ -3650,   1434,    154], 0, [ -3096,  -3784], [0x00, 0x9b, 0xb4, 0xff]),
    Vtx([ -3481,   1126,    563], 0, [ -5140,  -4630], [0x00, 0x9b, 0xb4, 0xff]),
    Vtx([ -3173,   1126,  -1177], 0, [  3546,  -6164], [0xcb, 0x9b, 0x35, 0xff]),
    Vtx([ -3583,   1434,  -1007], 0, [  2698,  -4120], [0xcb, 0x9b, 0x35, 0xff]),
    Vtx([ -3650,   1434,  -1074], 0, [  3034,  -3784], [0xcb, 0x9b, 0x35, 0xff]),
    Vtx([ -4914,   1126,  -1484], 0, [  5078,   2522], [0x35, 0x9b, 0x35, 0xff]),
    Vtx([ -4745,   1434,  -1074], 0, [  3034,   1674], [0x35, 0x9b, 0x35, 0xff]),
    Vtx([ -4812,   1434,  -1007], 0, [  2698,   2010], [0x35, 0x9b, 0x35, 0xff]),
    Vtx([ -5221,   1126,  -1177], 0, [  3546,   4054], [0x35, 0x9b, 0x35, 0xff]),
    Vtx([ -5221,   1126,  -1177], 0, [  3546,   4054], [0x4c, 0x9b, 0x00, 0xff]),
    Vtx([ -4812,   1434,  -1007], 0, [  2698,   2010], [0x4c, 0x9b, 0x00, 0xff]),
    Vtx([ -4812,   1434,     86], 0, [ -2760,   2010], [0x4c, 0x9b, 0x00, 0xff]),
);

// 0x07031D70 - 0x07031E60
inside_castle_seg7_vertex_07031D70 = vList(
    Vtx([ -5221,   1126,  -1177], 0, [  3546,   4054], [0x4c, 0x9b, 0x00, 0xff]),
    Vtx([ -4812,   1434,     86], 0, [ -2760,   2010], [0x4c, 0x9b, 0x00, 0xff]),
    Vtx([ -5221,   1126,    256], 0, [ -3608,   4054], [0x4c, 0x9b, 0x00, 0xff]),
    Vtx([ -5221,   1126,    256], 0, [ -3608,   4054], [0x36, 0x9b, 0xcb, 0xff]),
    Vtx([ -4812,   1434,     86], 0, [ -2760,   2010], [0x36, 0x9b, 0xcb, 0xff]),
    Vtx([ -4745,   1434,    154], 0, [ -3096,   1674], [0x36, 0x9b, 0xcb, 0xff]),
    Vtx([ -5221,   1126,    256], 0, [ -3608,   4054], [0x36, 0x9b, 0xca, 0xff]),
    Vtx([ -4745,   1434,    154], 0, [ -3096,   1674], [0x36, 0x9b, 0xca, 0xff]),
    Vtx([ -4914,   1126,    563], 0, [ -5140,   2520], [0x36, 0x9b, 0xca, 0xff]),
    Vtx([ -4914,   1126,    563], 0, [ -5140,   2520], [0x00, 0x9b, 0xb4, 0xff]),
    Vtx([ -4745,   1434,    154], 0, [ -3096,   1674], [0x00, 0x9b, 0xb4, 0xff]),
    Vtx([ -3650,   1434,    154], 0, [ -3096,  -3784], [0x00, 0x9b, 0xb4, 0xff]),
    Vtx([ -3481,   1126,    563], 0, [ -5140,  -4630], [0xcb, 0x9b, 0xca, 0xff]),
    Vtx([ -3650,   1434,    154], 0, [ -3096,  -3784], [0xcb, 0x9b, 0xca, 0xff]),
    Vtx([ -3173,   1126,    256], 0, [ -3608,  -6164], [0xcb, 0x9b, 0xca, 0xff]),
);

// 0x07031E60 - 0x07031F10
inside_castle_seg7_vertex_07031E60 = vList(
    Vtx([ -3650,   1434,    154], 0, [ -3096,  -3784], [0xca, 0x9b, 0xcb, 0xff]),
    Vtx([ -3583,   1434,     86], 0, [ -2760,  -4120], [0xca, 0x9b, 0xcb, 0xff]),
    Vtx([ -3173,   1126,    256], 0, [ -3608,  -6164], [0xca, 0x9b, 0xcb, 0xff]),
    Vtx([ -3173,   1126,    256], 0, [ -3608,  -6164], [0xb4, 0x9b, 0x00, 0xff]),
    Vtx([ -3583,   1434,     86], 0, [ -2760,  -4120], [0xb4, 0x9b, 0x00, 0xff]),
    Vtx([ -3583,   1434,  -1007], 0, [  2698,  -4120], [0xb4, 0x9b, 0x00, 0xff]),
    Vtx([ -3173,   1126,  -1177], 0, [  3546,  -6164], [0xb4, 0x9b, 0x00, 0xff]),
    Vtx([ -4197,    307,   -306], 0, [  -796,   3032], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4146,    307,   -613], 0, [   734,   3288], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4197,    307,   -613], 0, [   734,   3032], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4146,    307,   -306], 0, [  -796,   3288], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07031F10 - 0x07032000
inside_castle_seg7_vertex_07031F10 = vList(
    Vtx([ -4018,    205,   -665], 0, [  -240,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4197,    205,   -665], 0, [ -1506,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4197,    358,   -665], 0, [ -1506,   -544], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4018,    205,   -255], 0, [ -3132,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4146,    358,   -255], 0, [ -4034,   -542], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4197,    358,   -255], 0, [ -4396,   -542], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4197,    205,   -255], 0, [ -4396,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4018,    282,   -255], 0, [ -3132,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4069,    282,   -255], 0, [ -3492,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4018,    205,   -306], 0, [ -2770,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4197,    205,   -306], 0, [ -4034,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4197,    358,   -306], 0, [ -4034,   -542], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4069,    282,   -306], 0, [ -3132,    224], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4018,    282,   -306], 0, [ -2770,    224], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4146,    358,   -306], 0, [ -3674,   -542], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07032000 - 0x070320F0
inside_castle_seg7_vertex_07032000 = vList(
    Vtx([ -4197,    307,   -613], 0, [   480,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -4197,    358,   -665], 0, [     0,   -542], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -4197,    307,   -665], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -4018,    205,   -665], 0, [  -240,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4197,    358,   -665], 0, [ -1506,   -544], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4146,    358,   -665], 0, [ -1144,   -544], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4069,    282,   -665], 0, [  -602,    224], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4018,    282,   -665], 0, [  -240,    224], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4018,    205,   -613], 0, [  -602,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4146,    358,   -613], 0, [ -1506,   -544], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4197,    358,   -613], 0, [ -1866,   -544], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4197,    205,   -613], 0, [ -1866,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4069,    282,   -613], 0, [  -964,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4018,    282,   -613], 0, [  -602,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4197,    358,   -613], 0, [   480,   -542], [0x81, 0x00, 0x00, 0xff]),
);

// 0x070320F0 - 0x070321F0
inside_castle_seg7_vertex_070320F0 = vList(
    Vtx([ -4018,    282,   -665], 0, [  3546,    224], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4018,    282,   -613], 0, [  3034,    224], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4018,    205,   -613], 0, [  3034,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4018,    205,   -665], 0, [  3546,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4018,    282,   -665], 0, [  3546,    224], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4069,    282,   -613], 0, [  3034,    224], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4018,    282,   -613], 0, [  3034,    224], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4069,    282,   -665], 0, [  3546,    224], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4146,    358,   -665], 0, [  3546,   -544], [0x59, 0x5a, 0x00, 0xff]),
    Vtx([ -4146,    358,   -613], 0, [  3034,   -544], [0x59, 0x5a, 0x00, 0xff]),
    Vtx([ -4069,    282,   -613], 0, [  3034,    224], [0x59, 0x5a, 0x00, 0xff]),
    Vtx([ -4069,    282,   -665], 0, [  3546,    224], [0x59, 0x5a, 0x00, 0xff]),
    Vtx([ -4197,    358,   -665], 0, [  3546,   -544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4146,    358,   -613], 0, [  3034,   -544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4146,    358,   -665], 0, [  3546,   -544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4197,    358,   -613], 0, [  3034,   -544], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x070321F0 - 0x070322F0
inside_castle_seg7_vertex_070321F0 = vList(
    Vtx([ -4197,    307,   -255], 0, [  4056,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -4197,    358,   -255], 0, [  4056,   -542], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -4197,    358,   -306], 0, [  3544,   -542], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -4197,    307,   -306], 0, [  3544,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -4069,    282,   -306], 0, [     0,    224], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4069,    282,   -255], 0, [  -542,    224], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4018,    282,   -306], 0, [     0,    224], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4018,    282,   -306], 0, [     0,    224], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4018,    205,   -255], 0, [  -542,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4018,    205,   -306], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4018,    282,   -255], 0, [  -542,    224], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4018,    282,   -255], 0, [  -542,    224], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4146,    358,   -306], 0, [     0,   -544], [0x59, 0x5a, 0x00, 0xff]),
    Vtx([ -4146,    358,   -255], 0, [  -542,   -544], [0x59, 0x5a, 0x00, 0xff]),
    Vtx([ -4069,    282,   -255], 0, [  -542,    224], [0x59, 0x5a, 0x00, 0xff]),
    Vtx([ -4069,    282,   -306], 0, [     0,    224], [0x59, 0x5a, 0x00, 0xff]),
);

// 0x070322F0 - 0x070323F0
inside_castle_seg7_vertex_070322F0 = vList(
    Vtx([ -4197,    358,   -306], 0, [     0,   -544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4146,    358,   -255], 0, [  -542,   -544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4146,    358,   -306], 0, [     0,   -544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4197,    358,   -255], 0, [  -542,   -544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([ -4402,    307,   -869], 0, [ -1506,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -5221,    205,   -869], 0, [ -7286,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -5221,    307,   -869], 0, [ -7286,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4402,    205,   -869], 0, [ -1506,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4197,    307,   -665], 0, [  3546,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -4197,    205,   -665], 0, [  3546,    990], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -4402,    205,   -869], 0, [  5590,    990], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -4402,    307,   -869], 0, [  5590,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -4402,    307,    -50], 0, [ -2586,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -4197,    205,   -255], 0, [  -540,    990], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -4197,    307,   -255], 0, [  -540,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([ -4402,    205,    -50], 0, [ -2586,    990], [0x59, 0x00, 0x59, 0xff]),
);

// 0x070323F0 - 0x07032430
inside_castle_seg7_vertex_070323F0 = vList(
    Vtx([ -5221,    307,    -50], 0, [-13068,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4402,    205,    -50], 0, [ -7286,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4402,    307,    -50], 0, [ -7286,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -5221,    205,    -50], 0, [-13068,    990], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07032430 - 0x07032530
inside_castle_seg7_vertex_07032430 = vList(
    Vtx([ -4914,   1126,    563], 0, [  3544,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -3481,    205,    563], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -4914,    205,    563], 0, [  3544,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -3481,   1126,    563], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -3481,   1126,  -1484], 0, [  3546,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4914,   1126,  -1484], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -4914,    205,  -1484], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -3481,    205,  -1484], 0, [  3546,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -3173,   1126,  -1177], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3173,    205,  -1177], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3173,    461,   -869], 0, [   734,   1444], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3173,    205,   -869], 0, [   734,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3173,    205,   -869], 0, [   734,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -3122,    461,   -869], 0, [   734,   1444], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -3173,    461,   -869], 0, [   734,   1444], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -3122,    205,   -869], 0, [   734,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07032530 - 0x07032630
inside_castle_seg7_vertex_07032530 = vList(
    Vtx([ -5221,   1024,   -153], 0, [   990,    196], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -5221,   1024,   -767], 0, [  2522,    196], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -5221,   1126,  -1177], 0, [  3544,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -3173,    461,   -869], 0, [   734,   1444], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -3122,    461,   -716], 0, [  1118,   1444], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -3173,    461,   -716], 0, [  1118,   1444], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -3122,    461,   -869], 0, [   734,   1444], [0x00, 0x81, 0x00, 0xff]),
    Vtx([ -3173,   1126,  -1177], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3173,    461,   -869], 0, [   734,   1444], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3173,    461,   -716], 0, [  1118,   1444], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3173,   1126,    256], 0, [  3546,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3173,    205,   -716], 0, [  1118,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3173,    205,    256], 0, [  3546,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3173,    461,   -716], 0, [  1118,   1444], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -3122,    205,   -716], 0, [  1118,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -3173,    205,   -716], 0, [  1118,   2012], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07032630 - 0x070326E0
inside_castle_seg7_vertex_07032630 = vList(
    Vtx([ -3173,    461,   -716], 0, [  1118,   1444], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -3122,    461,   -716], 0, [  1118,   1444], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -3122,    205,   -716], 0, [  1118,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -5221,    410,   -767], 0, [  2522,   1556], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -5221,    410,   -153], 0, [   990,   1556], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -5221,    205,    256], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -5221,   1024,   -153], 0, [   990,    196], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -5221,   1126,    256], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -5221,   1024,   -767], 0, [  2522,    196], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -5221,    205,  -1177], 0, [  3544,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -5221,   1126,  -1177], 0, [  3544,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x070326E0 - 0x070327E0
inside_castle_seg7_vertex_070326E0 = vList(
    Vtx([ -3378,   1235,    256], 0, [   308,     52], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([ -3378,    205,    256], 0, [   308,   2012], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([ -3481,    205,    358], 0, [   650,   2012], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([ -3481,   1235,    358], 0, [   650,     52], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([ -3173,   1126,    256], 0, [     0,    260], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -3173,    205,    256], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -3378,    205,    256], 0, [   308,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -3378,   1235,    256], 0, [   308,     52], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -3481,   1235,    358], 0, [   650,     52], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3481,    205,    358], 0, [   650,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3481,    205,    563], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3481,   1126,    563], 0, [   990,    260], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -5017,   1235,    256], 0, [   650,    144], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -5017,    205,    256], 0, [   650,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -5221,    205,    256], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([ -5221,   1126,    256], 0, [   990,    340], [0x00, 0x00, 0x81, 0xff]),
);

// 0x070327E0 - 0x070328D0
inside_castle_seg7_vertex_070327E0 = vList(
    Vtx([ -3481,   1235,  -1279], 0, [   308,     52], [0xa7, 0x00, 0x5a, 0xff]),
    Vtx([ -3481,    205,  -1279], 0, [   308,   2012], [0xa7, 0x00, 0x5a, 0xff]),
    Vtx([ -3378,    205,  -1177], 0, [   650,   2012], [0xa7, 0x00, 0x5a, 0xff]),
    Vtx([ -4914,   1235,    358], 0, [   308,    144], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -5017,    205,    256], 0, [   650,   2012], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -5017,   1235,    256], 0, [   650,    144], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -4914,    205,    358], 0, [   308,   2012], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([ -4914,   1126,    563], 0, [     0,    340], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4914,    205,    563], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4914,    205,    358], 0, [   308,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4914,   1235,    358], 0, [   308,    144], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -3481,   1126,  -1484], 0, [     0,    260], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3481,    205,  -1484], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3481,    205,  -1279], 0, [   308,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3481,   1235,  -1279], 0, [   308,     52], [0x81, 0x00, 0x00, 0xff]),
);

// 0x070328D0 - 0x070329C0
inside_castle_seg7_vertex_070328D0 = vList(
    Vtx([ -5017,   1235,  -1177], 0, [   308,     52], [0x59, 0x00, 0x5a, 0xff]),
    Vtx([ -4914,    205,  -1279], 0, [   650,   2012], [0x59, 0x00, 0x5a, 0xff]),
    Vtx([ -4914,   1235,  -1279], 0, [   650,     52], [0x59, 0x00, 0x5a, 0xff]),
    Vtx([ -3481,   1235,  -1279], 0, [   308,     52], [0xa7, 0x00, 0x5a, 0xff]),
    Vtx([ -3378,    205,  -1177], 0, [   650,   2012], [0xa7, 0x00, 0x5a, 0xff]),
    Vtx([ -3378,   1235,  -1177], 0, [   650,     52], [0xa7, 0x00, 0x5a, 0xff]),
    Vtx([ -3378,   1235,  -1177], 0, [   650,     52], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -3378,    205,  -1177], 0, [   650,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -3173,    205,  -1177], 0, [   990,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -3173,   1126,  -1177], 0, [   990,    260], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -5221,   1126,  -1177], 0, [     0,    260], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -5017,    205,  -1177], 0, [   308,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -5017,   1235,  -1177], 0, [   308,     52], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -5221,    205,  -1177], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([ -5017,    205,  -1177], 0, [   308,   2012], [0x59, 0x00, 0x5a, 0xff]),
);

// 0x070329C0 - 0x07032A00
inside_castle_seg7_vertex_070329C0 = vList(
    Vtx([ -4914,   1235,  -1279], 0, [   650,     52], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4914,    205,  -1279], 0, [   650,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4914,    205,  -1484], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([ -4914,   1126,  -1484], 0, [   990,    260], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07032A00 - 0x07032B18
inside_castle_seg7_dl_07032A00 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09005000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(inside_castle_seg7_lights_070318A0.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_070318A0.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_070318D0, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 13, 14, 0x0,  0,  2, 15, 0x0),
    gsSPLight(inside_castle_seg7_lights_070318B8.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_070318B8.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_070319D0, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  2, 0x0),
    gsSP2Triangles( 3,  2,  4, 0x0,  5,  3,  4, 0x0),
    gsSP2Triangles( 5,  4,  6, 0x0,  5,  6,  7, 0x0),
    gsSP2Triangles( 8,  5,  7, 0x0,  9,  8,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07031AB0, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSPEndDisplayList(),
);

// 0x07032B18 - 0x07032C18
inside_castle_seg7_dl_07032B18 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09004000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_07031B70, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0,  7, 10, 11, 0x0),
    gsSP2Triangles( 7, 11, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07031C70, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 9, 11, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07031D70, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07031E60, 11, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP1Triangle( 7, 10,  8, 0x0),
    gsSPEndDisplayList(),
);

// 0x07032C18 - 0x07032DC8
inside_castle_seg7_dl_07032C18 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09003800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_07031F10, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 5,  6,  3, 0x0,  3,  7,  8, 0x0),
    gsSP2Triangles( 3,  8,  4, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 9, 12, 13, 0x0,  9, 11, 14, 0x0),
    gsSP1Triangle( 9, 14, 12, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07032000, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  7, 0x0,  3,  5,  6, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 10, 11,  8, 0x0),
    gsSP2Triangles( 8, 12,  9, 0x0,  8, 13, 12, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070320F0, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  5,  4, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 15, 13, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070321F0, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0,  6,  5, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070322F0, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 15, 13, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070323F0, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x07032DC8 - 0x07032EC0
inside_castle_seg7_dl_07032DC8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_0900A000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_07032430, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  9, 11, 10, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 15, 13, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07032530, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0,  9, 11, 12, 0x0),
    gsSP2Triangles(10,  9, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07032630, 11, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 5,  4,  6, 0x0,  5,  6,  7, 0x0),
    gsSP2Triangles( 8,  3,  9, 0x0,  8,  9, 10, 0x0),
    gsSP2Triangles( 6, 10,  7, 0x0,  3,  5,  9, 0x0),
    gsSPEndDisplayList(),
);

// 0x07032EC0 - 0x07032FC0
inside_castle_seg7_dl_07032EC0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09007000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_070326E0, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070327E0, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070328D0, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070329C0, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x07032FC0 - 0x07033068
inside_castle_seg7_dl_07032FC0 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_07032A00),
    gsSPDisplayList(inside_castle_seg7_dl_07032B18),
    gsSPDisplayList(inside_castle_seg7_dl_07032C18),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_07032DC8),
    gsSPDisplayList(inside_castle_seg7_dl_07032EC0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=705bf5116>
// 0x07033068 - 0x07033080
inside_castle_seg7_lights_07033068 = gdSPDefLights1(
    0x5f, 0x5f, 0x5f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x07033080 - 0x07033100
inside_castle_seg7_vertex_07033080 = vList(
    Vtx([ -3184,    410,   -127], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3184,    256,   -127], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3184,    256,     26], 0, [   990,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3184,    410,     26], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3184,    410,   -485], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3184,    256,   -332], 0, [   990,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3184,    410,   -332], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([ -3184,    256,   -485], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07033100 - 0x07033158
inside_castle_seg7_dl_07033100 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07003000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(inside_castle_seg7_lights_07033068.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_07033068.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_07033080, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x07033158 - 0x070331C8
inside_castle_seg7_dl_07033158 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_07033100),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=186fca1fb>
// 0x070331C8 - 0x070331E0
inside_castle_seg7_lights_070331C8 = gdSPDefLights1(
    0x52, 0x52, 0x52,
    0xdd, 0xdd, 0xdd, 0x28, 0x28, 0x28
);

// 0x070331E0 - 0x070331F8
inside_castle_seg7_lights_070331E0 = gdSPDefLights1(
    0x5f, 0x5f, 0x5f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x070331F8 - 0x070332F8
inside_castle_seg7_vertex_070331F8 = vList(
    Vtx([   -25,      0,  -1842], 0, [  3544,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,      0,  -1842], 0, [ -2074,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,    -25,  -1842], 0, [ -2074,    172], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,    -76,  -1919], 0, [  3544,   1040], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,    -76,  -1919], 0, [ -2074,   1040], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,   -101,  -1919], 0, [ -2074,   1244], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,   -101,  -1919], 0, [  3544,   1244], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,    -50,  -1893], 0, [  3544,    684], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,    -76,  -1893], 0, [ -2074,    888], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,    -76,  -1893], 0, [  3544,    888], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,    -50,  -1893], 0, [ -2074,    684], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,    -25,  -1868], 0, [  3544,    326], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,    -50,  -1868], 0, [ -2074,    530], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,    -50,  -1868], 0, [  3544,    530], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,    -25,  -1868], 0, [ -2074,    326], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,    -25,  -1842], 0, [  3544,    172], [0x00, 0x00, 0x81, 0xff]),
);

// 0x070332F8 - 0x070333F8
inside_castle_seg7_vertex_070332F8 = vList(
    Vtx([   -25,      0,  -1125], 0, [   990,   2776], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,      0,  -1842], 0, [ -2584,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,      0,  -1842], 0, [ -2584,   2776], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,      0,  -1125], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,   -101,  -2559], 0, [  2012,   2010], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([    77,   -101,  -2713], 0, [  2778,   -288], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,   -101,  -2559], 0, [  2012,   -798], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   435,   -101,  -2713], 0, [  2778,   1500], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1050,   -101,  -1740], 0, [ -2074,   4564], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1050,   -101,  -2661], 0, [  2524,   4564], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   742,   -101,  -2559], 0, [  2012,   3032], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   742,   -101,  -2661], 0, [  2522,   3032], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1050,   -101,  -2661], 0, [  2524,   4564], [0x00, 0x7c, 0xe8, 0xff]),
    Vtx([  1050,   -306,  -3685], 0, [  7632,   4564], [0x00, 0x7c, 0xe8, 0xff]),
    Vtx([   742,   -306,  -3685], 0, [  7632,   3032], [0x00, 0x7c, 0xe8, 0xff]),
    Vtx([   742,   -101,  -2661], 0, [  2522,   3032], [0x00, 0x7c, 0xe8, 0xff]),
);

// 0x070333F8 - 0x070334F8
inside_castle_seg7_vertex_070333F8 = vList(
    Vtx([   -25,    -76,  -1893], 0, [  3544,    888], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,    -76,  -1893], 0, [ -2074,    888], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,    -76,  -1919], 0, [ -2074,   1040], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -229,   -101,  -2661], 0, [  2522,  -1820], [0x00, 0x7c, 0xe8, 0xff]),
    Vtx([  -229,   -306,  -3685], 0, [  7632,  -1820], [0x00, 0x7c, 0xe8, 0xff]),
    Vtx([  -537,   -306,  -3685], 0, [  7632,  -3354], [0x00, 0x7c, 0xe8, 0xff]),
    Vtx([  -537,   -101,  -2661], 0, [  2522,  -3354], [0x00, 0x7c, 0xe8, 0xff]),
    Vtx([  -229,   -101,  -2559], 0, [  2012,  -1820], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -229,   -101,  -2661], 0, [  2522,  -1820], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -537,   -101,  -2661], 0, [  2522,  -3354], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -537,   -101,  -1740], 0, [ -2074,  -3354], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   742,   -101,  -2559], 0, [  2012,   3032], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1050,   -101,  -1740], 0, [ -2074,   4564], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   333,      0,  -1125], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   179,      0,  -1074], 0, [  1246,   1754], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   333,      0,  -1074], 0, [  1246,    990], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x070334F8 - 0x070335D8
inside_castle_seg7_vertex_070334F8 = vList(
    Vtx([   333,      0,  -1125], 0, [   990,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   179,      0,  -1125], 0, [   990,   1754], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   179,      0,  -1074], 0, [  1246,   1754], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,    -25,  -1842], 0, [  3544,    172], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,    -25,  -1842], 0, [ -2074,    172], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,    -25,  -1868], 0, [ -2074,    326], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,    -76,  -1893], 0, [  3544,    888], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,    -76,  -1919], 0, [ -2074,   1040], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,    -76,  -1919], 0, [  3544,   1040], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,    -50,  -1893], 0, [  3544,    684], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,    -50,  -1868], 0, [ -2074,    530], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,    -50,  -1893], 0, [ -2074,    684], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,    -50,  -1868], 0, [  3544,    530], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,    -25,  -1868], 0, [  3544,    326], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x070335D8 - 0x070336C8
inside_castle_seg7_vertex_070335D8 = vList(
    Vtx([  -229,    512,  -2047], 0, [ -2074,  -5142], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   742,    512,  -2047], 0, [  2778,  -5142], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1050,    512,  -1740], 0, [  4312,  -6676], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -229,   -306,  -3685], 0, [     0,  -1820], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -229,   -306,  -2559], 0, [ -5650,  -1820], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   742,   -306,  -2559], 0, [ -5650,   3032], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1050,   -306,  -4505], 0, [  4056,   4566], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -537,   -306,  -4505], 0, [  4056,  -3354], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   742,   -306,  -3685], 0, [     0,   3032], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -537,   -306,  -3685], 0, [     0,  -3354], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1050,   -306,  -3685], 0, [     0,   4566], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,    666,  -3993], 0, [ -1052,   4566], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   538,    666,  -3993], 0, [  1756,   4566], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   538,    666,  -2252], 0, [  1756,  -4120], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   -25,    666,  -2252], 0, [ -1052,  -4120], [0x00, 0x81, 0x00, 0xff]),
);

// 0x070336C8 - 0x07033748
inside_castle_seg7_vertex_070336C8 = vList(
    Vtx([  -537,    512,  -4505], 0, [ -3606,   7120], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   742,    512,  -4197], 0, [  2778,   5588], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -229,    512,  -4197], 0, [ -2074,   5588], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -537,    512,  -1740], 0, [ -3606,  -6676], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -229,    512,  -2047], 0, [ -2074,  -5142], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1050,    512,  -4505], 0, [  4312,   7120], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1050,    512,  -1740], 0, [  4312,  -6676], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   742,    512,  -2047], 0, [  2778,  -5142], [0x00, 0x81, 0x00, 0xff]),
);

// 0x07033748 - 0x07033838
inside_castle_seg7_vertex_07033748 = vList(
    Vtx([   -25,   -101,  -1740], 0, [   990,   2010], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,     77,  -1842], 0, [  2012,    224], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,     77,  -1740], 0, [   990,    224], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   589,   -101,  -1740], 0, [   990,   2010], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   589,     77,  -1842], 0, [  2012,    224], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   589,     77,  -1740], 0, [   990,    224], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   589,      0,  -1919], 0, [  2778,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   589,      0,  -1970], 0, [  3290,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   589,   -101,  -1970], 0, [  3290,   2010], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -76,      0,  -1970], 0, [  3290,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -76,   -101,  -1970], 0, [  3290,   2010], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -76,   -101,  -1740], 0, [   990,   2010], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -76,      0,  -1919], 0, [  2778,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -76,     77,  -1740], 0, [   990,    224], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   -76,     77,  -1842], 0, [  2012,    224], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07033838 - 0x07033928
inside_castle_seg7_vertex_07033838 = vList(
    Vtx([   -25,   -101,  -1740], 0, [   990,   2010], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,   -101,  -1970], 0, [  3290,   2010], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,      0,  -1970], 0, [  3290,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,      0,  -1919], 0, [  2778,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,     77,  -1842], 0, [  2012,    224], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   538,   -101,  -1740], 0, [   990,   2010], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   538,      0,  -1919], 0, [  2778,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   538,      0,  -1970], 0, [  3290,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   538,   -101,  -1970], 0, [  3290,   2010], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   538,     77,  -1842], 0, [  2012,    224], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   538,     77,  -1740], 0, [   990,    224], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -229,   -101,  -2559], 0, [ -5140,  -1054], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -229,   -306,  -2559], 0, [ -5140,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -229,   -101,  -2661], 0, [ -4118,  -1054], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -229,   -306,  -3685], 0, [  6100,    990], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07033928 - 0x07033A18
inside_castle_seg7_vertex_07033928 = vList(
    Vtx([   742,   -101,  -2661], 0, [ -4118,  -1054], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   742,   -306,  -2559], 0, [ -5140,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   742,   -101,  -2559], 0, [ -5140,  -1054], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   742,   -306,  -3685], 0, [  6100,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   538,    307,  -1740], 0, [  3034,  -2076], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([   538,    307,  -1125], 0, [     0,  -2076], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([   435,    410,  -1125], 0, [     0,  -3098], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([   538,      0,  -1740], 0, [  3034,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   538,    307,  -1125], 0, [     0,  -2076], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   538,    307,  -1740], 0, [  3034,  -2076], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   435,    410,  -1740], 0, [  3034,  -3098], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([   -25,    307,  -1740], 0, [  3034,  -2076], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,      0,  -1125], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,      0,  -1740], 0, [  3034,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   538,      0,  -1125], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07033A18 - 0x07033AF8
inside_castle_seg7_vertex_07033A18 = vList(
    Vtx([   435,    410,  -1740], 0, [     0,   2010], [0x00, 0x81, 0x00, 0xff]),
    Vtx([    77,    410,  -1125], 0, [  3034,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([    77,    410,  -1740], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   435,    410,  -1125], 0, [  3034,   2010], [0x00, 0x81, 0x00, 0xff]),
    Vtx([    77,    410,  -1740], 0, [  3034,  -3098], [0x5a, 0xa7, 0x00, 0xff]),
    Vtx([   -25,    307,  -1125], 0, [     0,  -2076], [0x5a, 0xa7, 0x00, 0xff]),
    Vtx([   -25,    307,  -1740], 0, [  3034,  -2076], [0x5a, 0xa7, 0x00, 0xff]),
    Vtx([    77,    410,  -1125], 0, [     0,  -3098], [0x5a, 0xa7, 0x00, 0xff]),
    Vtx([   -25,    307,  -1740], 0, [  3034,  -2076], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,    307,  -1125], 0, [     0,  -2076], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   -25,      0,  -1125], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   179,      0,  -1125], 0, [   734,   3032], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,      0,  -1125], 0, [  1756,   3032], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,    307,  -1125], 0, [  1756,      0], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07033AF8 - 0x07033BE8
inside_castle_seg7_vertex_07033AF8 = vList(
    Vtx([   179,    256,  -1074], 0, [   478,  -1566], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   179,      0,  -1125], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   179,    256,  -1125], 0, [   990,  -1566], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   179,      0,  -1074], 0, [   478,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   333,    256,  -1125], 0, [  -542,  -1564], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   333,      0,  -1074], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   333,    256,  -1074], 0, [     0,  -1564], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   333,      0,  -1125], 0, [  -542,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   179,    256,  -1125], 0, [  1500,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   333,    256,  -1074], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   179,    256,  -1074], 0, [  1500,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   333,    256,  -1125], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([    77,   -101,  -2713], 0, [ -3608,  -1054], [0x97, 0x00, 0xba, 0xff]),
    Vtx([    77,   -306,  -2713], 0, [ -3608,    990], [0x97, 0x00, 0xba, 0xff]),
    Vtx([   -25,   -306,  -2559], 0, [ -5140,    990], [0x97, 0x00, 0xba, 0xff]),
);

// 0x07033BE8 - 0x07033CD8
inside_castle_seg7_vertex_07033BE8 = vList(
    Vtx([   179,    256,  -1125], 0, [   734,    478], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,    307,  -1125], 0, [  1756,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,    307,  -1125], 0, [ -1052,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   179,      0,  -1125], 0, [   734,   3032], [0x00, 0x00, 0x81, 0xff]),
    Vtx([    77,    410,  -1125], 0, [  1246,  -1054], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   435,    410,  -1125], 0, [  -542,  -1054], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   333,    256,  -1125], 0, [     0,    478], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   333,      0,  -1125], 0, [     0,   3032], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,      0,  -1125], 0, [ -1052,   3032], [0x00, 0x00, 0x81, 0xff]),
    Vtx([    77,   -101,  -2713], 0, [ -3608,  -1054], [0x97, 0x00, 0xba, 0xff]),
    Vtx([   -25,   -306,  -2559], 0, [ -5140,    990], [0x97, 0x00, 0xba, 0xff]),
    Vtx([   -25,   -101,  -2559], 0, [ -5140,  -1054], [0x97, 0x00, 0xba, 0xff]),
    Vtx([   -25,   -306,  -2559], 0, [  4568,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -229,   -101,  -2559], 0, [  6612,  -1054], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,   -101,  -2559], 0, [  4568,  -1054], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07033CD8 - 0x07033DC8
inside_castle_seg7_vertex_07033CD8 = vList(
    Vtx([   435,   -101,  -2713], 0, [     0,  -1054], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   435,   -306,  -2713], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([    77,   -306,  -2713], 0, [  3546,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([    77,   -101,  -2713], 0, [  3546,  -1054], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,   -101,  -2559], 0, [ -5140,  -1054], [0x69, 0x00, 0xba, 0xff]),
    Vtx([   538,   -306,  -2559], 0, [ -5140,    990], [0x69, 0x00, 0xba, 0xff]),
    Vtx([   435,   -306,  -2713], 0, [ -3608,    990], [0x69, 0x00, 0xba, 0xff]),
    Vtx([   435,   -101,  -2713], 0, [ -3608,  -1054], [0x69, 0x00, 0xba, 0xff]),
    Vtx([   742,   -101,  -2559], 0, [ -3096,  -1054], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,   -306,  -2559], 0, [ -1052,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,   -101,  -2559], 0, [ -1052,  -1054], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   742,   -306,  -2559], 0, [ -3096,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,     77,  -1740], 0, [ -1562,   -798], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   589,     77,  -1740], 0, [ -2074,   -798], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   589,     77,  -1842], 0, [ -2074,   -798], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07033DC8 - 0x07033EB8
inside_castle_seg7_vertex_07033DC8 = vList(
    Vtx([   -25,   -306,  -2559], 0, [  4568,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -229,   -306,  -2559], 0, [  6612,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -229,   -101,  -2559], 0, [  6612,  -1054], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,      0,  -1919], 0, [ -1564,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   589,      0,  -1970], 0, [ -2074,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,      0,  -1970], 0, [ -1564,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,      0,  -1970], 0, [ -1564,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   589,      0,  -1970], 0, [ -2074,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   589,   -101,  -1970], 0, [ -2074,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,   -101,  -1970], 0, [ -1564,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   589,      0,  -1919], 0, [ -2074,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,     77,  -1842], 0, [ -1562,   -798], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([   589,      0,  -1919], 0, [ -2074,      0], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([   538,      0,  -1919], 0, [ -1564,      0], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([   589,     77,  -1842], 0, [ -2074,   -798], [0x00, 0x59, 0xa7, 0xff]),
);

// 0x07033EB8 - 0x07033FA8
inside_castle_seg7_vertex_07033EB8 = vList(
    Vtx([   538,     77,  -1740], 0, [ -1562,   -798], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   589,     77,  -1842], 0, [ -2074,   -798], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   538,     77,  -1842], 0, [ -1562,   -798], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -76,      0,  -1919], 0, [  4568,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,      0,  -1970], 0, [  4056,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -76,      0,  -1970], 0, [  4568,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -76,      0,  -1970], 0, [  4568,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,   -101,  -1970], 0, [  4056,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -76,   -101,  -1970], 0, [  4568,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,      0,  -1970], 0, [  4056,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,      0,  -1919], 0, [  4056,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -76,     77,  -1842], 0, [  4568,   -798], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([   -25,      0,  -1919], 0, [  4056,      0], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([   -76,      0,  -1919], 0, [  4568,      0], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([   -25,     77,  -1842], 0, [  4056,   -798], [0x00, 0x59, 0xa7, 0xff]),
);

// 0x07033FA8 - 0x07033FE8
inside_castle_seg7_vertex_07033FA8 = vList(
    Vtx([   -76,     77,  -1740], 0, [  4568,   -798], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,     77,  -1842], 0, [  4056,   -798], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -76,     77,  -1842], 0, [  4568,   -798], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   -25,     77,  -1740], 0, [  4056,   -798], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07033FE8 - 0x070340E8
inside_castle_seg7_vertex_07033FE8 = vList(
    Vtx([  -229,    512,  -4197], 0, [     0,      0], [0x4c, 0x9b, 0x00, 0xff]),
    Vtx([   -25,    666,  -2252], 0, [ 19386,   2010], [0x4c, 0x9b, 0x00, 0xff]),
    Vtx([  -229,    512,  -2047], 0, [ 21430,      0], [0x4c, 0x9b, 0x00, 0xff]),
    Vtx([   538,    666,  -3993], 0, [ -1564,  -7186], [0x00, 0x9b, 0x4c, 0xff]),
    Vtx([   -25,    666,  -3993], 0, [  4056,  -7186], [0x00, 0x9b, 0x4c, 0xff]),
    Vtx([  -229,    512,  -4197], 0, [  6100,  -9230], [0x00, 0x9b, 0x4c, 0xff]),
    Vtx([   742,    512,  -4197], 0, [ -3608,  -9230], [0x00, 0x9b, 0x4c, 0xff]),
    Vtx([   742,    512,  -2047], 0, [ 21430,   9676], [0xb4, 0x9b, 0x00, 0xff]),
    Vtx([   538,    666,  -3993], 0, [  2012,   7632], [0xb4, 0x9b, 0x00, 0xff]),
    Vtx([   742,    512,  -4197], 0, [     0,   9676], [0xb4, 0x9b, 0x00, 0xff]),
    Vtx([   538,    666,  -2252], 0, [ 19386,   7632], [0xb4, 0x9b, 0x00, 0xff]),
    Vtx([   -25,    666,  -2252], 0, [  4056,  10186], [0x00, 0x9b, 0xb4, 0xff]),
    Vtx([   538,    666,  -2252], 0, [ -1562,  10186], [0x00, 0x9b, 0xb4, 0xff]),
    Vtx([   742,    512,  -2047], 0, [ -3606,  12230], [0x00, 0x9b, 0xb4, 0xff]),
    Vtx([  -229,    512,  -2047], 0, [  6100,  12230], [0x00, 0x9b, 0xb4, 0xff]),
    Vtx([   -25,    666,  -3993], 0, [  2012,   2010], [0x4c, 0x9b, 0x00, 0xff]),
);

// 0x070340E8 - 0x070341D8
inside_castle_seg7_vertex_070340E8 = vList(
    Vtx([   947,    512,  -4300], 0, [   734,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1050,   -306,  -4300], 0, [   990,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1050,    512,  -4300], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -434,    512,  -4300], 0, [   224,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  -332,   -306,  -4402], 0, [   734,   2012], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  -332,    512,  -4402], 0, [   734,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  -332,    512,  -4402], 0, [   734,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -332,   -306,  -4505], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -332,    512,  -4505], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -332,   -306,  -4402], 0, [   734,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -434,   -306,  -4300], 0, [   224,   2012], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  -537,    512,  -4300], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -434,   -306,  -4300], 0, [   224,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -434,    512,  -4300], 0, [   224,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -537,   -306,  -4300], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x070341D8 - 0x070342B8
inside_castle_seg7_vertex_070341D8 = vList(
    Vtx([   845,    512,  -4402], 0, [   224,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   947,   -306,  -4300], 0, [   734,   2012], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   947,    512,  -4300], 0, [   734,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   947,    512,  -4300], 0, [   734,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   947,   -306,  -4300], 0, [   734,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1050,   -306,  -4300], 0, [   990,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   845,    512,  -1842], 0, [   734,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   845,   -101,  -1740], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   845,    512,  -1740], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   845,   -306,  -4402], 0, [   224,   2012], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   845,    512,  -4505], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   845,   -306,  -4402], 0, [   224,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   845,    512,  -4402], 0, [   224,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   845,   -306,  -4505], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
);

// 0x070342B8 - 0x070343A8
inside_castle_seg7_vertex_070342B8 = vList(
    Vtx([  1050,    512,  -1945], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1050,   -101,  -1945], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   947,   -101,  -1945], 0, [   224,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   947,    512,  -1945], 0, [   224,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   947,    512,  -1945], 0, [   224,      0], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([   947,   -101,  -1945], 0, [   224,   2012], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([   845,   -101,  -1842], 0, [   734,   2012], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([   845,    512,  -1842], 0, [   734,      0], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([   845,    512,  -1842], 0, [   734,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   845,   -101,  -1842], 0, [   734,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   845,   -101,  -1740], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -434,    512,  -1945], 0, [   734,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -434,   -101,  -1945], 0, [   734,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -537,   -101,  -1945], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -537,    512,  -1945], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
);

// 0x070343A8 - 0x07034428
inside_castle_seg7_vertex_070343A8 = vList(
    Vtx([  -332,    512,  -1842], 0, [   224,      0], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  -434,   -101,  -1945], 0, [   734,   2012], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  -434,    512,  -1945], 0, [   734,      0], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  -332,   -101,  -1842], 0, [   224,   2012], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  -332,    512,  -1740], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -332,   -101,  -1842], 0, [   224,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -332,    512,  -1842], 0, [   224,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -332,   -101,  -1740], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07034428 - 0x07034528
inside_castle_seg7_vertex_07034428 = vList(
    Vtx([  1050,    512,  -1945], 0, [  5844,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1050,    512,  -4300], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1050,   -306,  -4300], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1050,   -306,  -1945], 0, [  5844,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   589,     77,  -1740], 0, [  1118,   1052], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,     77,  -1740], 0, [  1246,   1052], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   538,    307,  -1740], 0, [  1246,    480], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   845,   -101,  -1740], 0, [   480,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   589,   -101,  -1740], 0, [  1118,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   845,    512,  -1740], 0, [   480,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,    307,  -1740], 0, [  2650,    480], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,     77,  -1740], 0, [  2650,   1052], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -76,     77,  -1740], 0, [  2778,   1052], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -332,   -101,  -1740], 0, [  3418,   1500], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -332,    512,  -1740], 0, [  3418,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -76,   -101,  -1740], 0, [  2778,   1500], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07034528 - 0x07034628
inside_castle_seg7_vertex_07034528 = vList(
    Vtx([   563,   -204,  -4505], 0, [  2076,   1756], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -332,   -306,  -4505], 0, [  -158,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   845,   -306,  -4505], 0, [  2778,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   563,    410,  -4505], 0, [  2076,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   -50,   -204,  -4505], 0, [   542,   1756], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   -50,    410,  -4505], 0, [   542,    224], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -332,    512,  -4505], 0, [  -158,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   845,    512,  -4505], 0, [  2778,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([    77,    410,  -1740], 0, [  2396,    224], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   -25,    307,  -1740], 0, [  2650,    480], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -332,    512,  -1740], 0, [  3418,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -537,    512,  -1945], 0, [  5844,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -537,   -306,  -4300], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -537,    512,  -4300], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   435,    410,  -1740], 0, [  1502,    224], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   845,    512,  -1740], 0, [   480,      0], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07034628 - 0x07034688
inside_castle_seg7_vertex_07034628 = vList(
    Vtx([   538,    307,  -1740], 0, [  1246,    480], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   435,    410,  -1740], 0, [  1502,    224], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   845,    512,  -1740], 0, [   480,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -537,    512,  -1945], 0, [  5844,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -537,   -306,  -1945], 0, [  5844,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -537,   -306,  -4300], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07034688 - 0x070347D8
inside_castle_seg7_dl_07034688 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09005000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(inside_castle_seg7_lights_070331C8.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_070331C8.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_070331F8, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 14, 12, 0x0,  0,  2, 15, 0x0),
    gsSPLight(inside_castle_seg7_lights_070331E0.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_070331E0.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_070332F8, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  9, 11, 10, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070333F8, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11,  7, 10, 0x0),
    gsSP2Triangles(11, 10, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070334F8, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles(12, 10,  9, 0x0,  3,  5, 13, 0x0),
    gsSPEndDisplayList(),
);

// 0x070347D8 - 0x07034888
inside_castle_seg7_dl_070347D8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09004000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_070335D8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  7, 0x0,  3,  8,  6, 0x0),
    gsSP2Triangles( 3,  7,  9, 0x0,  3,  5,  8, 0x0),
    gsSP2Triangles( 8, 10,  6, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070336C8, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  2,  4, 0x0),
    gsSP2Triangles( 5,  6,  7, 0x0,  5,  7,  1, 0x0),
    gsSP2Triangles( 4,  6,  3, 0x0,  3,  0,  2, 0x0),
    gsSP1Triangle( 0,  5,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x07034888 - 0x07034B28
inside_castle_seg7_dl_07034888 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09003800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_07033748, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  3,  7,  6, 0x0),
    gsSP2Triangles( 3,  8,  7, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles(11, 12,  9, 0x0, 11, 13, 14, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07033838, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 0,  3,  4, 0x0,  5,  6,  7, 0x0),
    gsSP2Triangles( 7,  8,  5, 0x0,  5,  9,  6, 0x0),
    gsSP2Triangles( 5, 10,  9, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(12, 14, 13, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07033928, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 4,  6, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle( 7, 14,  8, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07033A18, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07033AF8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07033BE8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 1,  4,  5, 0x0,  1,  5,  2, 0x0),
    gsSP2Triangles( 2,  6,  0, 0x0,  2,  7,  6, 0x0),
    gsSP2Triangles( 2,  8,  7, 0x0,  9, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07033CD8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07033DC8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
    gsSP2Triangles( 3, 10,  4, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07033EB8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles( 3, 10,  4, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07033FA8, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x07034B28 - 0x07034B90
inside_castle_seg7_dl_07034B28 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09003000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_07033FE8, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 13, 14, 0x0,  0, 15,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x07034B90 - 0x07034C90
inside_castle_seg7_dl_07034B90 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09007000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_070340E8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles( 3, 10,  4, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070341D8, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  0,  9,  1, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070342B8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070343A8, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x07034C90 - 0x07034D88
inside_castle_seg7_dl_07034C90 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_0900A000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_07034428, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  7,  8,  4, 0x0),
    gsSP2Triangles( 7,  4,  6, 0x0,  7,  6,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP2Triangles(10, 13, 14, 0x0, 12, 15, 13, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07034528, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  2, 0x0),
    gsSP2Triangles( 0,  4,  1, 0x0,  1,  4,  5, 0x0),
    gsSP2Triangles( 1,  5,  6, 0x0,  3,  2,  7, 0x0),
    gsSP2Triangles( 5,  3,  7, 0x0,  5,  7,  6, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(14,  8, 10, 0x0, 14, 10, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07034628, 6, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x07034D88 - 0x07034E50
inside_castle_seg7_dl_07034D88 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_07034688),
    gsSPDisplayList(inside_castle_seg7_dl_070347D8),
    gsSPDisplayList(inside_castle_seg7_dl_07034888),
    gsSPDisplayList(inside_castle_seg7_dl_07034B28),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_07034B90),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_07034C90),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=81df9cc0c>
// 0x07034E50 - 0x07034F40
inside_castle_seg7_vertex_07034E50 = vList(
    Vtx([    88,   -101,  -2692], 0, [ -1048,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -14,      0,  -2539], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    88,      0,  -2692], 0, [ -1048,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -250,      0,  -2661], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -250,   -101,  -2539], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -250,   -101,  -2661], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -250,      0,  -2539], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -250,   -204,  -3685], 0, [ 10084,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -250,   -101,  -2661], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -250,   -306,  -3685], 0, [ 10080,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -250,      0,  -2661], 0, [   -28,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -250,      0,  -2539], 0, [  6612,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -14,      0,  -2539], 0, [  4568,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -14,   -101,  -2539], 0, [  4568,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([  -250,   -101,  -2539], 0, [  6612,    990], [0xff, 0xff, 0xff, 0xff]),
);

// 0x07034F40 - 0x07035030
inside_castle_seg7_vertex_07034F40 = vList(
    Vtx([   763,   -101,  -2661], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   762,      0,  -2539], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   763,      0,  -2661], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    88,   -101,  -2692], 0, [ -1048,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -14,   -101,  -2539], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -14,      0,  -2539], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    88,      0,  -2692], 0, [  3546,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   424,   -101,  -2692], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    88,   -101,  -2692], 0, [  3546,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   424,      0,  -2692], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   424,      0,  -2692], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   526,      0,  -2539], 0, [ -1048,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   526,   -101,  -2539], 0, [ -1048,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   424,   -101,  -2692], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   762,   -101,  -2539], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
);

// 0x07035030 - 0x070350B0
inside_castle_seg7_vertex_07035030 = vList(
    Vtx([   526,      0,  -2539], 0, [ -1052,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   762,   -101,  -2539], 0, [ -3096,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   526,   -101,  -2539], 0, [ -1052,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   762,      0,  -2539], 0, [ -3096,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   763,   -306,  -3685], 0, [ 10080,    990], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   763,      0,  -2661], 0, [   -28,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   763,   -204,  -3685], 0, [ 10084,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   763,   -101,  -2661], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
);

// 0x070350B0 - 0x07035178
inside_castle_seg7_dl_070350B0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09008800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_07034E50, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07034F40, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07035030, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x07035178 - 0x070351E8
inside_castle_seg7_dl_07035178 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsSPClearGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_070350B0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING | G_CULL_BACK),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=8d85cdbdd>
// 0x070351E8 - 0x07035200
inside_castle_seg7_lights_070351E8 = gdSPDefLights1(
    0x5f, 0x5f, 0x5f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x07035200 - 0x07035240
inside_castle_seg7_vertex_07035200 = vList(
    Vtx([   512,     51,  -1136], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   358,     51,  -1136], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   358,    205,  -1136], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   512,    205,  -1136], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07035240 - 0x07035288
inside_castle_seg7_dl_07035240 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_castle_seg7_texture_07003000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(inside_castle_seg7_lights_070351E8.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_070351E8.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_07035200, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x07035288 - 0x070352F8
inside_castle_seg7_dl_07035288 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_07035240),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=a4896a55a>
// 0x070352F8 - 0x07035310
inside_castle_seg7_lights_070352F8 = gdSPDefLights1(
    0x19, 0x19, 0x19,
    0x44, 0x44, 0x44, 0x28, 0x28, 0x28
);

// 0x07035310 - 0x07035328
inside_castle_seg7_lights_07035310 = gdSPDefLights1(
    0x26, 0x26, 0x26,
    0x66, 0x66, 0x66, 0x28, 0x28, 0x28
);

// 0x07035328 - 0x07035340
inside_castle_seg7_lights_07035328 = gdSPDefLights1(
    0x1f, 0x1f, 0x1f,
    0x55, 0x55, 0x55, 0x28, 0x28, 0x28
);

// 0x07035340 - 0x07035358
inside_castle_seg7_lights_07035340 = gdSPDefLights1(
    0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x28, 0x28, 0x28
);

// 0x07035358 - 0x07035458
inside_castle_seg7_vertex_07035358 = vList(
    Vtx([  1971,    307,     51], 0, [  2778,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1971,    307,   -511], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1971,    282,   -511], 0, [     0,     70], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1894,    230,     51], 0, [  2778,    504], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1894,    230,   -511], 0, [     0,    504], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1894,    205,   -511], 0, [     0,    606], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1894,    205,     51], 0, [  2778,    606], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1920,    256,     51], 0, [  2778,    326], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1920,    256,   -511], 0, [     0,    326], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1920,    230,   -511], 0, [     0,    428], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1920,    230,     51], 0, [  2778,    428], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,    282,     51], 0, [  2778,    146], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,    282,   -511], 0, [     0,    146], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,    256,   -511], 0, [     0,    250], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1946,    256,     51], 0, [  2778,    250], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1971,    282,     51], 0, [  2778,     70], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07035458 - 0x07035548
inside_castle_seg7_vertex_07035458 = vList(
    Vtx([  1894,    205,   -511], 0, [  1118,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1126,    205,   -511], 0, [  -796,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1126,    205,     51], 0, [  -796,   1372], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1920,    230,     51], 0, [  2778,    428], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1894,    230,   -511], 0, [     0,    504], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1894,    230,     51], 0, [  2778,    504], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1920,    230,   -511], 0, [     0,    428], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1920,    256,     51], 0, [  2778,    326], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1946,    256,   -511], 0, [     0,    250], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1920,    256,   -511], 0, [     0,    326], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1946,    256,     51], 0, [  2778,    250], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1971,    282,     51], 0, [  2778,     70], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1971,    282,   -511], 0, [     0,     70], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1946,    282,   -511], 0, [     0,    146], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1946,    282,     51], 0, [  2778,    146], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07035548 - 0x070355B8
inside_castle_seg7_vertex_07035548 = vList(
    Vtx([  1126,    205,   -306], 0, [     0,   2520], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1075,    205,   -153], 0, [   734,   2776], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1126,    205,   -153], 0, [   734,   2520], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1894,    205,   -511], 0, [  1118,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1126,    205,     51], 0, [  -796,   1372], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1894,    205,     51], 0, [  1118,   1372], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1075,    205,   -306], 0, [     0,   2776], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x070355B8 - 0x070355F8
inside_castle_seg7_vertex_070355B8 = vList(
    Vtx([  1126,   1229,   -460], 0, [  1412,    954], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1229,   1229,   -460], 0, [  1410,   1012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1229,   1229,      0], 0, [  1590,   1024], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1126,   1229,      0], 0, [  1592,    966], [0x00, 0x81, 0x00, 0xff]),
);

// 0x070355F8 - 0x070356B8
inside_castle_seg7_vertex_070355F8 = vList(
    Vtx([  1229,    307,   -716], 0, [ -3608,   -544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1229,    307,   -511], 0, [ -3608,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1971,    307,   -511], 0, [ -1754,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2253,    307,  -1740], 0, [ -1052,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4301,    307,   -716], 0, [  4056,   -544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4301,    307,    256], 0, [  4056,   1882], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1971,    307,     51], 0, [ -1754,   1372], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3277,    307,  -1740], 0, [  1502,  -3098], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2253,    307,   1280], 0, [ -1052,   4438], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3277,    307,   1280], 0, [  1500,   4438], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1229,    307,    256], 0, [ -3608,   1882], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1229,    307,     51], 0, [ -3608,   1372], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x070356B8 - 0x070357B8
inside_castle_seg7_vertex_070356B8 = vList(
    Vtx([  4301,   1024,     77], 0, [  6866,  -6164], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4301,    410,     77], 0, [  6866,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4301,    307,    154], 0, [  7632,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4301,   1024,   -537], 0, [   734,  -6164], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4301,   1229,    154], 0, [  7632,  -8208], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4301,    410,   -537], 0, [   734,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4301,   1229,   -613], 0, [     0,  -8208], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4301,    307,   -613], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  1229,    307,   -511], 0, [  5590,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,    307,   -460], 0, [  5078,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,    205,   -460], 0, [  5078,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,    205,   -511], 0, [  5590,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,    205,      0], 0, [   480,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,    307,     51], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,    205,     51], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,    307,      0], 0, [   480,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x070357B8 - 0x070358A8
inside_castle_seg7_vertex_070357B8 = vList(
    Vtx([  1229,    205,   -460], 0, [  5078,    990], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1178,    307,   -409], 0, [  4568,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1178,    205,   -409], 0, [  4568,    990], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1229,    307,   -460], 0, [  5078,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1178,    205,   -409], 0, [  4568,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1178,    307,   -409], 0, [  4568,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,    307,   -409], 0, [  4568,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,    205,   -409], 0, [  4568,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,    205,    -50], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1126,    307,    -50], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1178,    307,    -50], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1178,    205,    -50], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1126,    461,   -306], 0, [  3546,  -1566], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    205,   -306], 0, [  3546,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,   1229,   -409], 0, [  4566,  -9230], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x070358A8 - 0x07035998
inside_castle_seg7_vertex_070358A8 = vList(
    Vtx([  1178,    205,    -50], 0, [   990,    990], [0x58, 0x00, 0xa6, 0xff]),
    Vtx([  1229,    307,      0], 0, [   478,      0], [0x58, 0x00, 0xa6, 0xff]),
    Vtx([  1229,    205,      0], 0, [   478,    990], [0x58, 0x00, 0xa6, 0xff]),
    Vtx([  1178,    307,    -50], 0, [   990,      0], [0x58, 0x00, 0xa6, 0xff]),
    Vtx([  1971,    307,   -511], 0, [ -6418,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1229,    205,   -511], 0, [   990,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1971,    205,   -511], 0, [ -6418,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1229,    307,   -511], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1971,    205,     51], 0, [ -6418,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1229,    205,     51], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1229,    307,     51], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1971,    307,     51], 0, [ -6418,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1126,    205,   -306], 0, [  3546,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    205,   -409], 0, [  4566,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,   1229,   -409], 0, [  4566,  -9230], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07035998 - 0x07035A98
inside_castle_seg7_vertex_07035998 = vList(
    Vtx([  1126,   1229,   -409], 0, [  4566,  -9230], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    205,    -50], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    461,   -153], 0, [  2012,  -1566], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    461,   -306], 0, [  3546,  -1566], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,   1229,    -50], 0, [   990,  -9230], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    205,   -153], 0, [  2012,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1126,    461,   -153], 0, [     0,  -1564], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1075,    461,   -306], 0, [   480,  -1564], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1126,    461,   -306], 0, [     0,  -1564], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1075,    461,   -153], 0, [   480,  -1564], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1126,    461,   -306], 0, [     0,  -1564], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1075,    205,   -306], 0, [   480,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,    205,   -306], 0, [     0,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,    205,   -153], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1075,    461,   -153], 0, [   480,  -1564], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1126,    461,   -153], 0, [     0,  -1564], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07035A98 - 0x07035AF8
inside_castle_seg7_vertex_07035A98 = vList(
    Vtx([  1126,    461,   -306], 0, [     0,  -1564], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1075,    461,   -306], 0, [   480,  -1564], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1075,    205,   -306], 0, [   480,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,    205,   -153], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1075,    205,   -153], 0, [   480,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1075,    461,   -153], 0, [   480,  -1564], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07035AF8 - 0x07035B98
inside_castle_seg7_vertex_07035AF8 = vList(
    Vtx([  4250,   1229,    154], 0, [   376,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4198,   1229,    205], 0, [   276,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4198,   1229,    358], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4301,   1229,    256], 0, [   172,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4301,   1229,    154], 0, [   376,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4301,   1229,   -716], 0, [   172,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4198,   1229,   -665], 0, [   276,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4250,   1229,   -613], 0, [   376,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4198,   1229,   -818], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4301,   1229,   -613], 0, [   376,      0], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07035B98 - 0x07035C98
inside_castle_seg7_vertex_07035B98 = vList(
    Vtx([  1229,    307,   -716], 0, [  2012,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,   1229,   -716], 0, [  2012,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,   1229,   -460], 0, [  1500,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,    307,   -460], 0, [  1500,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,    307,   -460], 0, [  1500,    990], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1229,   1229,   -460], 0, [  1500,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1178,   1229,   -409], 0, [  1400,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1178,    307,   -409], 0, [  1400,    990], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1178,    307,   -409], 0, [  1400,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1178,   1229,   -409], 0, [  1400,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,   1229,   -409], 0, [  1400,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,    307,   -409], 0, [  1400,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  1126,    307,    -50], 0, [  1400,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1126,   1229,    -50], 0, [  1400,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1178,   1229,    -50], 0, [  1400,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  1178,    307,    -50], 0, [  1400,    990], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07035C98 - 0x07035D98
inside_castle_seg7_vertex_07035C98 = vList(
    Vtx([  1178,    307,    -50], 0, [  1400,    990], [0x58, 0x00, 0xa6, 0xff]),
    Vtx([  1178,   1229,    -50], 0, [  1400,      0], [0x58, 0x00, 0xa6, 0xff]),
    Vtx([  1229,   1229,      0], 0, [  1500,      0], [0x58, 0x00, 0xa6, 0xff]),
    Vtx([  1229,    307,      0], 0, [  1500,    990], [0x58, 0x00, 0xa6, 0xff]),
    Vtx([  1229,    307,      0], 0, [  1500,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,   1229,      0], 0, [  1500,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,   1229,    256], 0, [  2012,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  1229,    307,    256], 0, [  2012,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2036,   1024,  -1523], 0, [  1080,    196], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1229,   1229,   -716], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1229,    307,   -716], 0, [     0,    990], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2253,   1229,  -1740], 0, [  1376,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2036,    819,  -1523], 0, [  1080,    422], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2180,   1024,  -1667], 0, [  1276,    196], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2180,    819,  -1667], 0, [  1276,    422], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2253,    307,  -1740], 0, [  1376,    990], [0x59, 0x00, 0x59, 0xff]),
);

// 0x07035D98 - 0x07035E88
inside_castle_seg7_vertex_07035D98 = vList(
    Vtx([  2036,    819,   1063], 0, [  1080,    422], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1229,    307,    256], 0, [     0,    990], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  1229,   1229,    256], 0, [     0,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  2253,    307,   1280], 0, [  1376,    990], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  2253,    307,   1280], 0, [  1376,    990], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2036,    819,   1063], 0, [  1080,    422], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2180,    819,   1208], 0, [  1276,    422], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2036,   1024,   1063], 0, [  1080,    196], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  2253,   1229,   1280], 0, [  1376,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  2253,   1229,   1280], 0, [  1376,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2253,    307,   1280], 0, [  1376,    990], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2180,    819,   1208], 0, [  1276,    422], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2253,   1229,   1280], 0, [  1376,      0], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2180,   1024,   1208], 0, [  1276,    196], [0x5a, 0x00, 0xa7, 0xff]),
    Vtx([  2036,   1024,   1063], 0, [  1080,    196], [0x5a, 0x00, 0xa7, 0xff]),
);

// 0x07035E88 - 0x07035F78
inside_castle_seg7_vertex_07035E88 = vList(
    Vtx([  2253,    307,   1280], 0, [  1376,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2355,    358,   1280], 0, [  1520,    934], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3174,    358,   1280], 0, [  2648,    934], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3277,    307,   1280], 0, [  2788,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,   1229,   1280], 0, [  1376,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2180,    819,   1208], 0, [  1276,    422], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2180,   1024,   1208], 0, [  1276,    196], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2253,   1229,   1280], 0, [  1376,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2355,    768,   1280], 0, [  1520,    478], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3277,   1229,   1280], 0, [  2788,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3277,   1229,   1280], 0, [  2788,      0], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([  3385,    768,   1171], 0, [  2936,    480], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([  3385,    358,   1171], 0, [  2936,    934], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([  3277,    307,   1280], 0, [  2788,    990], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([  3174,    768,   1280], 0, [  2648,    478], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07035F78 - 0x07036078
inside_castle_seg7_vertex_07035F78 = vList(
    Vtx([  4198,    307,    358], 0, [  4056,    990], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  3385,    358,   1171], 0, [  2936,    934], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  4109,    358,    447], 0, [  3932,    934], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  3385,    358,  -1631], 0, [  2936,    934], [0xa7, 0xff, 0x59, 0xff]),
    Vtx([  3277,    307,  -1740], 0, [  2788,    990], [0xa7, 0xff, 0x59, 0xff]),
    Vtx([  4198,    307,   -818], 0, [  4056,    990], [0xa7, 0xff, 0x59, 0xff]),
    Vtx([  3277,    307,  -1740], 0, [  2788,    990], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  3385,    768,  -1631], 0, [  2936,    480], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  3277,   1229,  -1740], 0, [  2788,      0], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  3385,    358,  -1631], 0, [  2936,    934], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  3174,    768,  -1740], 0, [  2648,    480], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3277,    307,  -1740], 0, [  2788,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3277,   1229,  -1740], 0, [  2788,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3174,    358,  -1740], 0, [  2648,    934], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2355,    358,  -1740], 0, [  1520,    934], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2253,    307,  -1740], 0, [  1376,    990], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07036078 - 0x07036168
inside_castle_seg7_vertex_07036078 = vList(
    Vtx([  2253,   1229,  -1740], 0, [  1376,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2355,    358,  -1740], 0, [  1520,    934], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2355,    768,  -1740], 0, [  1520,    480], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2253,    307,  -1740], 0, [  1376,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3174,    768,  -1740], 0, [  2648,    480], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3277,   1229,  -1740], 0, [  2788,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  4198,   1229,   -818], 0, [  4056,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  3277,   1229,  -1740], 0, [  2788,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  3385,    768,  -1631], 0, [  2936,    480], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4109,    768,   -907], 0, [  3932,    480], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4109,    358,   -907], 0, [  3932,    934], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4198,    307,    358], 0, [  4056,    990], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  4109,    358,    447], 0, [  3932,    934], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  4109,    768,    447], 0, [  3932,    478], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  4198,   1229,    358], 0, [  4056,      0], [0xa7, 0x00, 0xa7, 0xff]),
);

// 0x07036168 - 0x07036268
inside_castle_seg7_vertex_07036168 = vList(
    Vtx([  4198,    307,    358], 0, [  4056,    990], [0xa7, 0xff, 0xa7, 0xff]),
    Vtx([  3277,    307,   1280], 0, [  2788,    990], [0xa7, 0xff, 0xa7, 0xff]),
    Vtx([  3385,    358,   1171], 0, [  2936,    934], [0xa7, 0xff, 0xa7, 0xff]),
    Vtx([  4109,    768,    447], 0, [  3932,    478], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  3385,    768,   1171], 0, [  2936,    478], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  3277,   1229,   1280], 0, [  2788,      0], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  4198,   1229,    358], 0, [  4056,      0], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  4109,    358,   -907], 0, [  3932,    934], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  3385,    358,  -1631], 0, [  2936,    934], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4198,    307,   -818], 0, [  4056,    990], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4198,   1229,   -818], 0, [  4056,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  3385,    768,  -1631], 0, [  2936,    480], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4109,    768,   -907], 0, [  3932,    480], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4250,    307,    154], 0, [   376,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  4250,   1229,    154], 0, [   376,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  4301,   1229,    154], 0, [   376,      0], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07036268 - 0x07036368
inside_castle_seg7_vertex_07036268 = vList(
    Vtx([  4198,    307,   -665], 0, [   276,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4198,   1229,   -818], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4198,    307,   -818], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4198,   1229,   -665], 0, [   276,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4250,    307,   -613], 0, [   376,    990], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4198,   1229,   -665], 0, [   276,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4198,    307,   -665], 0, [   276,    990], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4250,   1229,   -613], 0, [   376,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4198,   1229,    358], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4198,    307,    205], 0, [   276,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4198,    307,    358], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4198,   1229,    205], 0, [   276,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4198,    307,    205], 0, [   276,    990], [0xa8, 0x00, 0xa6, 0xff]),
    Vtx([  4198,   1229,    205], 0, [   276,      0], [0xa8, 0x00, 0xa6, 0xff]),
    Vtx([  4250,   1229,    154], 0, [   376,      0], [0xa8, 0x00, 0xa6, 0xff]),
    Vtx([  4250,    307,    154], 0, [   376,    990], [0xa8, 0x00, 0xa6, 0xff]),
);

// 0x07036368 - 0x070363D8
inside_castle_seg7_vertex_07036368 = vList(
    Vtx([  4301,    307,   -613], 0, [   376,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  4250,   1229,   -613], 0, [   376,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  4250,    307,   -613], 0, [   376,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  4250,    307,    154], 0, [   376,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  4301,   1229,    154], 0, [   376,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  4301,    307,    154], 0, [   376,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  4301,   1229,   -613], 0, [   376,      0], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x070363D8 - 0x070364B8
inside_castle_seg7_vertex_070363D8 = vList(
    Vtx([  2180,   1024,   1208], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1891,   1024,   1208], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2036,   1024,   1063], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1891,    819,  -1667], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2036,    819,  -1812], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2036,   1024,  -1812], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1891,   1024,  -1667], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2180,    819,  -1667], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2036,    819,  -1812], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1891,    819,  -1667], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2036,    819,  -1523], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2036,    819,  -1523], 0, [     0,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  1891,    819,  -1667], 0, [     0,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  1891,   1024,  -1667], 0, [     0,      0], [0x59, 0x00, 0xa6, 0xff]),
);

// 0x070364B8 - 0x070365A8
inside_castle_seg7_vertex_070364B8 = vList(
    Vtx([  2180,   1024,  -1667], 0, [     0,      0], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  2036,   1024,  -1812], 0, [     0,      0], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  2036,    819,  -1812], 0, [     0,      0], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  2180,    819,  -1667], 0, [     0,      0], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  2036,   1024,  -1523], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1891,   1024,  -1667], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2036,   1024,  -1812], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2180,   1024,  -1667], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2036,    819,  -1523], 0, [     0,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  1891,   1024,  -1667], 0, [     0,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2036,   1024,  -1523], 0, [     0,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2036,   1024,   1063], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1891,    819,   1208], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  2036,    819,   1063], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  1891,   1024,   1208], 0, [     0,      0], [0x59, 0x00, 0x59, 0xff]),
);

// 0x070365A8 - 0x07036698
inside_castle_seg7_vertex_070365A8 = vList(
    Vtx([  2180,    819,   1208], 0, [     0,      0], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  2036,   1024,   1352], 0, [     0,      0], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  2180,   1024,   1208], 0, [     0,      0], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  1891,   1024,   1208], 0, [     0,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2036,    819,   1352], 0, [     0,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  1891,    819,   1208], 0, [     0,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2036,   1024,   1352], 0, [     0,      0], [0x59, 0x00, 0xa6, 0xff]),
    Vtx([  2180,   1024,   1208], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2036,   1024,   1352], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  1891,   1024,   1208], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2036,    819,   1063], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  1891,    819,   1208], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2036,    819,   1352], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2180,    819,   1208], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2036,    819,   1352], 0, [     0,      0], [0xa7, 0x00, 0xa7, 0xff]),
);

// 0x07036698 - 0x07036780
inside_castle_seg7_dl_07036698 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09005000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(inside_castle_seg7_lights_070352F8.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_070352F8.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_07035358, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 13, 14, 0x0,  0,  2, 15, 0x0),
    gsSPLight(inside_castle_seg7_lights_07035310.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_07035310.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_07035458, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10,  8,  7, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07035548, 7, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP1Triangle( 0,  6,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x07036780 - 0x070367C8
inside_castle_seg7_dl_07036780 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09008000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(inside_castle_seg7_lights_07035328.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_07035328.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_070355B8, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x070367C8 - 0x07036850
inside_castle_seg7_dl_070367C8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09004000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(inside_castle_seg7_lights_07035310.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_07035310.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_070355F8, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  2, 0x0),
    gsSP2Triangles( 4,  3,  2, 0x0,  5,  4,  2, 0x0),
    gsSP2Triangles( 5,  2,  6, 0x0,  4,  7,  3, 0x0),
    gsSP2Triangles( 8,  9,  5, 0x0,  8,  5,  6, 0x0),
    gsSP2Triangles(10,  8,  6, 0x0, 11, 10,  6, 0x0),
    gsSPEndDisplayList(),
);

// 0x07036850 - 0x070369B8
inside_castle_seg7_dl_07036850 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09003000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(inside_castle_seg7_vertex_070356B8, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  0,  4, 0x0),
    gsSP2Triangles( 0,  2,  4, 0x0,  2,  1,  5, 0x0),
    gsSP2Triangles( 3,  4,  6, 0x0,  7,  5,  3, 0x0),
    gsSP2Triangles( 7,  3,  6, 0x0,  2,  5,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 15, 13, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070357B8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070358A8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07035998, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 0,  4,  1, 0x0,  1,  5,  2, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07035A98, 6, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x070369B8 - 0x07036CB8
inside_castle_seg7_dl_070369B8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09001000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPLight(inside_castle_seg7_lights_07035328.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_07035328.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_07035AF8, 10, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  4, 0x0),
    gsSP2Triangles( 0,  2,  3, 0x0,  5,  6,  7, 0x0),
    gsSP2Triangles( 5,  8,  6, 0x0,  5,  7,  9, 0x0),
    gsSPLight(inside_castle_seg7_lights_07035310.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_07035310.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_07035B98, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07035C98, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  9,  8, 11, 0x0),
    gsSP2Triangles( 8, 10, 12, 0x0,  8, 13, 11, 0x0),
    gsSP2Triangles(13, 14, 11, 0x0, 14, 15, 11, 0x0),
    gsSP2Triangles(14, 12, 15, 0x0, 12, 10, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07035D98, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  1,  0, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  0,  2,  7, 0x0),
    gsSP2Triangles( 8,  7,  2, 0x0,  9, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07035E88, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  1,  0,  7, 0x0),
    gsSP2Triangles( 8,  7,  9, 0x0,  8,  1,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP2Triangles( 9,  3,  2, 0x0,  9, 14,  8, 0x0),
    gsSP1Triangle( 9,  2, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07035F78, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSP2Triangles(11, 14, 15, 0x0, 11, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07036078, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  0, 0x0,  0,  2,  4, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9, 10, 0x0),
    gsSP2Triangles(11, 12, 13, 0x0, 13, 14, 11, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07036168, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0,  7,  9, 10, 0x0),
    gsSP1Triangle(13, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07036268, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07036368, 7, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP1Triangle( 0,  6,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x07036CB8 - 0x07036D88
inside_castle_seg7_dl_07036CB8 = dList(
    gsSPLight(inside_castle_seg7_lights_07035340.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_07035340.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_070363D8, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070364B8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_070365A8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x07036D88 - 0x07036E68
inside_castle_seg7_dl_07036D88 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_07036698),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_07036780),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_070367C8),
    gsSPDisplayList(inside_castle_seg7_dl_07036850),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_070369B8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPDisplayList(inside_castle_seg7_dl_07036CB8),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=71b78e253>
// 0x07036E68 - 0x07036E80
inside_castle_seg7_lights_07036E68 = gdSPDefLights1(
    0xcc, 0xcc, 0xcc,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x07036E80 - 0x07036F70
inside_castle_seg7_vertex_07036E80 = vList(
    Vtx([  4109,    768,    447], 0, [ -3096,    480], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4182,    358,    520], 0, [   990,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4182,    768,    520], 0, [ -3096,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4109,    358,    447], 0, [     0,    478], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3385,    358,   1171], 0, [ 10188,    480], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3458,    358,   1244], 0, [ 10188,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4182,    358,    520], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4182,    768,    520], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3458,    768,   1244], 0, [ 10188,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3385,    768,   1171], 0, [ 10188,    480], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  4109,    768,    447], 0, [     0,    480], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3458,    768,   1244], 0, [ -3096,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  3458,    358,   1244], 0, [   990,      0], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  3385,    358,   1171], 0, [   990,    480], [0x59, 0x00, 0xa7, 0xff]),
    Vtx([  3385,    768,   1171], 0, [ -3096,    480], [0x59, 0x00, 0xa7, 0xff]),
);

// 0x07036F70 - 0x07037060
inside_castle_seg7_vertex_07036F70 = vList(
    Vtx([  4109,    768,   -907], 0, [  6100,    478], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3458,    768,  -1704], 0, [ -4118,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  4182,    768,   -980], 0, [  6100,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  4109,    768,    447], 0, [ -3096,    480], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4109,    358,    447], 0, [   990,    480], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4182,    358,    520], 0, [   990,      0], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([  4182,    768,   -980], 0, [ -3096,      0], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  4182,    358,   -980], 0, [   990,      0], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  4109,    358,   -907], 0, [   990,    480], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  4109,    768,   -907], 0, [ -3096,    480], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  3385,    768,  -1631], 0, [ -3096,    480], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  3385,    358,  -1631], 0, [   990,    480], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  3458,    358,  -1704], 0, [   990,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  3458,    768,  -1704], 0, [ -3096,      0], [0x59, 0x00, 0x59, 0xff]),
    Vtx([  3385,    768,  -1631], 0, [ -4118,    480], [0x00, 0x81, 0x00, 0xff]),
);

// 0x07037060 - 0x07037150
inside_castle_seg7_vertex_07037060 = vList(
    Vtx([  3174,    768,   1280], 0, [     0,    478], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2355,    768,   1382], 0, [  8144,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2355,    768,   1280], 0, [  8144,    480], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  4182,    358,   -980], 0, [  6100,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3458,    358,  -1704], 0, [ -4118,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3385,    358,  -1631], 0, [ -4118,    480], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4109,    358,   -907], 0, [  6100,    478], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3174,    768,  -1842], 0, [  8144,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3174,    768,  -1740], 0, [  8144,    478], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2355,    768,  -1740], 0, [     0,    480], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2355,    768,  -1842], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3174,    358,  -1740], 0, [  8144,    478], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3174,    358,  -1842], 0, [  8144,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2355,    358,  -1842], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2355,    358,  -1740], 0, [     0,    480], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07037150 - 0x07037240
inside_castle_seg7_vertex_07037150 = vList(
    Vtx([  3174,    358,  -1842], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3174,    768,  -1740], 0, [  4056,    478], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3174,    768,  -1842], 0, [  4056,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3174,    768,   1280], 0, [     0,    478], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3174,    768,   1382], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2355,    768,   1382], 0, [  8144,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3174,    358,   1382], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2355,    358,   1280], 0, [  8144,    480], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2355,    358,   1382], 0, [  8144,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3174,    358,   1280], 0, [     0,    478], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2355,    358,  -1740], 0, [     0,    480], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,    768,  -1842], 0, [  4056,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,    768,  -1740], 0, [  4056,    478], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,    358,  -1842], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3174,    358,  -1740], 0, [     0,    480], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07037240 - 0x07037320
inside_castle_seg7_vertex_07037240 = vList(
    Vtx([  2355,    358,   1382], 0, [  4056,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,    358,   1280], 0, [  4056,    480], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,    768,   1280], 0, [     0,    480], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2355,    768,   1382], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3174,    358,   1280], 0, [  4056,    480], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3174,    358,   1382], 0, [  4056,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3174,    768,   1382], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  3174,    768,   1280], 0, [     0,    480], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  4403,    307,   -767], 0, [ -8206,   1372], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3573,    307,  -2457], 0, [ -4062,   5586], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3319,    307,  -1842], 0, [ -2796,   4054], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4836,    307,  -1203], 0, [-10366,   2460], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2253,    307,  -2457], 0, [  2522,   5586], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2253,    307,  -1842], 0, [  2522,   4054], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07037320 - 0x07037420
inside_castle_seg7_vertex_07037320 = vList(
    Vtx([  4836,   1024,  -1203], 0, [  9688,  -2588], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([  4836,    307,  -1203], 0, [  9688,    990], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([  4403,    307,   -767], 0, [  7510,    990], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([  2253,   1024,  -1842], 0, [  2522,   4054], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2253,   1024,  -2457], 0, [  2522,   5586], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3573,   1024,  -2457], 0, [ -4062,   5586], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3319,   1024,  -1842], 0, [ -2796,   4054], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  4836,   1024,  -1203], 0, [-10366,   2460], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  4403,   1024,   -767], 0, [ -8206,   1372], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2253,   1024,  -2457], 0, [ -6672,  -2588], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3573,    307,  -2457], 0, [   -86,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3573,   1024,  -2457], 0, [   -86,  -2588], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3573,   1024,  -2457], 0, [   -86,  -2588], [0xa7, 0x00, 0x5a, 0xff]),
    Vtx([  3573,    307,  -2457], 0, [   -86,    990], [0xa7, 0x00, 0x5a, 0xff]),
    Vtx([  4836,    307,  -1203], 0, [  6216,    990], [0xa7, 0x00, 0x5a, 0xff]),
    Vtx([  4836,   1024,  -1203], 0, [  6216,  -2588], [0xa7, 0x00, 0x5a, 0xff]),
);

// 0x07037420 - 0x07037520
inside_castle_seg7_vertex_07037420 = vList(
    Vtx([  2253,   1024,  -2457], 0, [ -6672,  -2588], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  2253,    307,  -2457], 0, [ -6672,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  3573,    307,  -2457], 0, [   -86,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  4836,   1024,    743], 0, [  6216,  -2588], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([  4836,    307,    743], 0, [  6216,    990], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([  3573,    307,   1997], 0, [   -86,    990], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([  4836,   1024,  -1203], 0, [  9688,  -2588], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([  4403,    307,   -767], 0, [  7510,    990], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([  4403,   1024,   -767], 0, [  7510,  -2586], [0xa6, 0x00, 0xa7, 0xff]),
    Vtx([  2253,   1024,  -1842], 0, [ 12876,  -2588], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,    307,  -1842], 0, [ 12876,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,    307,  -2457], 0, [ 15942,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1024,  -2457], 0, [ 15942,  -2588], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  3573,   1024,   1997], 0, [   -86,  -2588], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  3573,    307,   1997], 0, [   -86,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,    307,   1997], 0, [ -6672,    990], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07037520 - 0x07037620
inside_castle_seg7_vertex_07037520 = vList(
    Vtx([  3573,   1024,   1997], 0, [   -86,  -2588], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,    307,   1997], 0, [ -6672,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  2253,   1024,   1997], 0, [ -6672,  -2588], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  4836,   1024,    743], 0, [  6216,  -2588], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([  3573,    307,   1997], 0, [   -86,    990], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([  3573,   1024,   1997], 0, [   -86,  -2588], [0xa7, 0x00, 0xa6, 0xff]),
    Vtx([  3319,   1024,   1382], 0, [ -4330,   1500], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3573,   1024,   1997], 0, [ -5596,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2253,   1024,   1997], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2253,   1024,   1997], 0, [ -6284,  -2586], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,    307,   1997], 0, [ -6284,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,    307,   1382], 0, [ -3218,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  2253,   1024,   1382], 0, [ -3218,  -2586], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  4403,   1024,    307], 0, [  2144,  -2586], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  4403,    307,    307], 0, [  2144,    990], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  4836,    307,    743], 0, [     0,    990], [0xa6, 0x00, 0x59, 0xff]),
);

// 0x07037620 - 0x07037710
inside_castle_seg7_vertex_07037620 = vList(
    Vtx([  4403,   1024,    307], 0, [  2144,  -2586], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  4836,    307,    743], 0, [     0,    990], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  4836,   1024,    743], 0, [     0,  -2586], [0xa6, 0x00, 0x59, 0xff]),
    Vtx([  4403,   1024,    307], 0, [ -9740,   4182], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  4836,   1024,    743], 0, [-11898,   3094], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3573,   1024,   1997], 0, [ -5596,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3319,   1024,   1382], 0, [ -4330,   1500], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2253,    307,   1382], 0, [   990,   1498], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2253,    307,   1997], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  3573,    307,   1997], 0, [ -5596,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  2253,   1024,   1997], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  2253,   1024,   1382], 0, [   990,   1498], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  3319,    307,   1382], 0, [ -4330,   1500], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4836,    307,    743], 0, [-11898,   3094], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  4403,    307,    307], 0, [ -9740,   4182], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07037710 - 0x07037988
inside_castle_seg7_dl_07037710 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09003000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(inside_castle_seg7_lights_07036E68.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_07036E68.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_07036E80, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07036F70, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07037060, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 13, 14, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07037150, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07037240, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 11,  9, 0x0),
    gsSP2Triangles(10,  9, 12, 0x0, 10, 12, 13, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07037320, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  6,  5,  7, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07037420, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 9, 11, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07037520, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles( 9, 11, 12, 0x0, 13, 14, 15, 0x0),
    gsSPVertex(inside_castle_seg7_vertex_07037620, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 6, 10, 11, 0x0, 12,  9, 13, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0,  7,  9, 12, 0x0),
    gsSPEndDisplayList(),
);

// 0x07037988 - 0x070379F8
inside_castle_seg7_dl_07037988 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_07037710),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
/// <pygml?v=1.0&h=02262d0fc>
// 0x070379F8 - 0x07037A10
inside_castle_seg7_lights_070379F8 = gdSPDefLights1(
    0x5f, 0x5f, 0x5f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x07037A10 - 0x07037B10
inside_castle_seg7_vertex_07037A10 = vList(
    Vtx([  4301,   1229,   -716], 0, [  1204,   2804], [0xbf, 0x9b, 0x26, 0xff]),
    Vtx([  3789,   1638,   -504], 0, [  1304,   2510], [0xd3, 0x8b, 0x0b, 0xff]),
    Vtx([  3065,   1638,  -1228], 0, [  1046,   2070], [0xe9, 0x8b, 0x28, 0xff]),
    Vtx([  1229,   1229,    256], 0, [  1688,   1030], [0x41, 0x9b, 0xda, 0xff]),
    Vtx([  1741,   1638,     44], 0, [  1588,   1324], [0x19, 0x84, 0xfa, 0xff]),
    Vtx([  2465,   1638,    768], 0, [  1846,   1764], [0x1d, 0x90, 0xce, 0xff]),
    Vtx([  1229,   1229,   -716], 0, [  1310,   1006], [0x49, 0x9b, 0x13, 0xff]),
    Vtx([  1741,   1638,   -504], 0, [  1374,   1312], [0x32, 0x90, 0x1d, 0xff]),
    Vtx([  3789,   1638,     44], 0, [  1518,   2522], [0xdc, 0x88, 0xf2, 0xff]),
    Vtx([  3065,   1638,    768], 0, [  1826,   2114], [0xed, 0x8d, 0xd0, 0xff]),
    Vtx([  2465,   1638,  -1228], 0, [  1068,   1718], [0x0b, 0x8b, 0x2d, 0xff]),
    Vtx([  2253,   1229,  -1740], 0, [   874,   1582], [0x26, 0x9b, 0x41, 0xff]),
    Vtx([  3277,   1229,  -1740], 0, [   840,   2182], [0xed, 0x9b, 0x49, 0xff]),
    Vtx([  2253,   1229,   1280], 0, [  2054,   1652], [0x13, 0x9b, 0xb7, 0xff]),
    Vtx([  4301,   1229,    256], 0, [  1584,   2826], [0xbb, 0x9a, 0xe4, 0xff]),
    Vtx([  3277,   1229,   1280], 0, [  2018,   2250], [0xe4, 0x9a, 0xbb, 0xff]),
);

// 0x07037B10 - 0x07037BF8
inside_castle_seg7_dl_07037B10 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, inside_09008000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(inside_castle_seg7_lights_070379F8.l[0], 1),
    gsSPLight(inside_castle_seg7_lights_070379F8.a, 2),
    gsSPVertex(inside_castle_seg7_vertex_07037A10, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  4,  3, 0x0,  6,  7,  4, 0x0),
    gsSP2Triangles( 4,  8,  9, 0x0,  4,  1,  8, 0x0),
    gsSP2Triangles( 4,  2,  1, 0x0,  4, 10,  2, 0x0),
    gsSP2Triangles( 4,  7, 10, 0x0,  4,  9,  5, 0x0),
    gsSP2Triangles(11,  7,  6, 0x0, 11, 10,  7, 0x0),
    gsSP2Triangles(12, 10, 11, 0x0, 12,  2, 10, 0x0),
    gsSP2Triangles( 0,  2, 12, 0x0,  3,  5, 13, 0x0),
    gsSP2Triangles(14,  1,  0, 0x0, 14,  8,  1, 0x0),
    gsSP2Triangles( 9,  8, 14, 0x0, 13,  5,  9, 0x0),
    gsSP2Triangles(15,  9, 14, 0x0, 13,  9, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x07037BF8 - 0x07037C58
inside_castle_seg7_dl_07037BF8 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(inside_castle_seg7_dl_07037B10),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);

}