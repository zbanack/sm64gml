// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mist_model_define(){
/// <pygml?v=1.0&h=e0129cf93>
// 0x03000000
mist_seg3_vertex_03000000 = vList(
    Vtx([   -25,    -25,      0], 0, [     0,    992], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    25,    -25,      0], 0, [   992,    992], [0xff, 0xff, 0xff, 0xff]),
    Vtx([    25,     25,      0], 0, [   992,      0], [0xff, 0xff, 0xff, 0xff]),
    Vtx([   -25,     25,      0], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
);

// 0x03000040
mist_seg3_vertex_03000040 = vList(
    Vtx([   -25,    -25,      0], 0, [     0,    992], [0x22, 0x1a, 0x1c, 0xff]),
    Vtx([    25,    -25,      0], 0, [   992,    992], [0x22, 0x1a, 0x1c, 0xff]),
    Vtx([    25,     25,      0], 0, [   992,      0], [0x22, 0x1a, 0x1c, 0xff]),
    Vtx([   -25,     25,      0], 0, [     0,      0], [0x22, 0x1a, 0x1c, 0xff]),
);


// 0x03000880 - 0x03000920
mist_seg3_dl_03000880 = dList(
    //gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    //gsDPLoadTextureBlock(mist_seg3_texture_03000080, G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 32, 0, G_TX_CLAMP, G_TX_CLAMP, 5, 5, G_TX_NOLOD, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsSPVertex(mist_seg3_vertex_03000000, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsSPEndDisplayList(),
);

// 0x03000920 - 0x030009C0
mist_seg3_dl_03000920 = dList(
    //gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    //gsDPLoadTextureBlock(mist_seg3_texture_03000080, G_IM_FMT_RGBA, G_IM_SIZ_16b, 32, 32, 0, G_TX_CLAMP, G_TX_CLAMP, 5, 5, G_TX_NOLOD, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    gsSPVertex(mist_seg3_vertex_03000040, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsSPEndDisplayList(),
);

}