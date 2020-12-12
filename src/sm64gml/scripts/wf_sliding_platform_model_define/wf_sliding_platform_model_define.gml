// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wf_sliding_platform_model_define(){
/// <pygml?v=1.0&h=3116eeaaf>
// 0x0700EA28 - 0x0700EA40
wf_seg7_lights_0700EA28 = gdSPDefLights1(
    0x66, 0x66, 0x66,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700EA40 - 0x0700EA80
wf_seg7_vertex_0700EA40 = vList(
    Vtx([   256,      0,    256], 0, [     0,   -236], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   256,    -50,    256], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   256,    -50,   -255], 0, [  2012,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   256,      0,   -255], 0, [  2012,   -236], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x0700EA80 - 0x0700EAC0
wf_seg7_vertex_0700EA80 = vList(
    Vtx([   256,      0,    256], 0, [     0,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -255,      0,   -255], 0, [  2012,  -1054], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -255,      0,    256], 0, [     0,  -1054], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   256,      0,   -255], 0, [  2012,    990], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700EAC0 - 0x0700EB08
wf_seg7_dl_0700EAC0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09000800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(wf_seg7_lights_0700EA28.l[0], 1),
    gsSPLight(wf_seg7_lights_0700EA28.a, 2),
    gsSPVertex(wf_seg7_vertex_0700EA40, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700EB08 - 0x0700EB40
wf_seg7_dl_0700EB08 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, grass_09001000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(wf_seg7_vertex_0700EA80, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700EB40 - 0x0700EBB8
wf_seg7_dl_0700EB40 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(wf_seg7_dl_0700EAC0),
    gsSPDisplayList(wf_seg7_dl_0700EB08),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);

}