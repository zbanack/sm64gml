// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function power_meter_model_define(){
/// <pygml?v=1.0&h=94c569d29>
// 0x03029400
vertex_power_meter_base = vList(
    Vtx([   -32,    -32,      0], 0, [     0,   2016], [0xff, 0xff, 0xff, 0xff]),
    Vtx([     0,    -32,      0], 0, [   992,   2016], [0xff, 0xff, 0xff, 0xff]),
    Vtx([     0,     32,      0], 0, [   992,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -32,     32,      0], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([     0,    -32,      0], 0, [     1,   2016], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    32,    -32,      0], 0, [  1024,   2016], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    32,     32,      0], 0, [  1024,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([     0,     32,      0], 0, [     1,      0], [0xff, 0xff, 0xff, 0xff]),
);

// 0x03029480 - 0x03029530
dl_power_meter_base = dList(
    //gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
    gsDPSetRenderMode(G_RM_AA_ZB_TEX_EDGE_NOOP2, G_RM_AA_ZB_TEX_EDGE_NOOP2),
    gsDPSetTextureFilter(G_TF_POINT),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsSPVertex(vertex_power_meter_base, 8, 0),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_power_meter_left_side),
	//gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSP2Triangles( 0,  1,  2, TRI_MODE_ORTHO,  0,  2,  3, TRI_MODE_ORTHO),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture_power_meter_right_side),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSP2Triangles( 4,  5,  6, TRI_MODE_ORTHO,  4,  6,  7, TRI_MODE_ORTHO),
    gsSPEndDisplayList(),
);

// 0x03029530
vertex_power_meter_health_segments = vList(
    Vtx([   -16,    -16,      0], 0, [     0,    992], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    15,    -16,      0], 0, [   992,    992], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    15,     16,      0], 0, [   992,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -16,     16,      0], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
);

// 0x03029570 - 0x030295A0
dl_power_meter_health_segments_begin = dList(
    //gsDPPipeSync(),
    gsSPVertex(vertex_power_meter_health_segments, 4, 0),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPEndDisplayList(),
);

// 0x030295A0 - 0x030295D8
dl_power_meter_health_segments_end = dList(
    //gsDPPipeSync(),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    gsSPSetGeometryMode(G_LIGHTING),
    gsDPSetRenderMode(G_RM_AA_OPA_SURF_SURF2, G_RM_AA_OPA_SURF_SURF2),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPSetTextureFilter(G_TF_BILERP),
    gsSPEndDisplayList(),
);

}