// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bitdw_square_platform(){
/// <pygml?v=1.0&h=b842f5ab3>
// 0x0700B290 - 0x0700B380
bitdw_seg7_vertex_0700B290 = vList(
    Vtx([     0,    102,      0], 0, [   990,    -40], [0xb4, 0xee, 0xfe, 0xff]),
    Vtx([   307,      0,    307], 0, [     0,   2012], [0xb4, 0xee, 0xfe, 0xff]),
    Vtx([   307,      0,   -306], 0, [  2012,   2012], [0xb4, 0xee, 0xfe, 0xff]),
    Vtx([     0,    102,      0], 0, [  2012,    -44], [0xb4, 0xee, 0xfe, 0xff]),
    Vtx([   307,      0,   -306], 0, [     0,   2012], [0xb4, 0xee, 0xfe, 0xff]),
    Vtx([  -306,      0,   -306], 0, [  4056,   2012], [0xb4, 0xee, 0xfe, 0xff]),
    Vtx([     0,   -306,      0], 0, [   990,      0], [0x52, 0x77, 0x8d, 0xff]),
    Vtx([  -306,      0,    307], 0, [  1994,   2012], [0x52, 0x77, 0x8d, 0xff]),
    Vtx([  -306,      0,   -306], 0, [     0,   2012], [0x52, 0x77, 0x8d, 0xff]),
    Vtx([  -306,      0,    307], 0, [     0,   2012], [0x55, 0x86, 0x97, 0xff]),
    Vtx([     0,   -306,      0], 0, [  2032,    -44], [0x55, 0x86, 0x97, 0xff]),
    Vtx([   307,      0,    307], 0, [  4138,   2012], [0x55, 0x86, 0x97, 0xff]),
    Vtx([   307,      0,   -306], 0, [  2012,   2012], [0x67, 0x9b, 0xb0, 0xff]),
    Vtx([   307,      0,    307], 0, [     0,   2012], [0x67, 0x9b, 0xb0, 0xff]),
    Vtx([     0,   -306,      0], 0, [   990,    -40], [0x67, 0x9b, 0xb0, 0xff]),
);

// 0x0700B380 - 0x0700B410
bitdw_seg7_vertex_0700B380 = vList(
    Vtx([  -306,      0,   -306], 0, [  4056,   2012], [0x67, 0x9b, 0xb0, 0xff]),
    Vtx([   307,      0,   -306], 0, [     0,   2012], [0x67, 0x9b, 0xb0, 0xff]),
    Vtx([     0,   -306,      0], 0, [  2012,    -44], [0x67, 0x9b, 0xb0, 0xff]),
    Vtx([  -306,      0,   -306], 0, [     0,   2012], [0x8c, 0xbf, 0xd8, 0xff]),
    Vtx([  -306,      0,    307], 0, [  1994,   2012], [0x8c, 0xbf, 0xd8, 0xff]),
    Vtx([     0,    102,      0], 0, [   990,      0], [0x8c, 0xbf, 0xd8, 0xff]),
    Vtx([   307,      0,    307], 0, [  4138,   2012], [0x8c, 0xbf, 0xd8, 0xff]),
    Vtx([     0,    102,      0], 0, [  2032,    -44], [0x8c, 0xbf, 0xd8, 0xff]),
    Vtx([  -306,      0,    307], 0, [     0,   2012], [0x8c, 0xbf, 0xd8, 0xff]),
);

// 0x0700B410 - 0x0700B480
bitdw_seg7_dl_0700B410 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, sky_09002000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(bitdw_seg7_vertex_0700B290, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(bitdw_seg7_vertex_0700B380, 9, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP1Triangle( 6,  7,  8, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700B480 - 0x0700B4F0
bitdw_seg7_dl_0700B480 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(bitdw_seg7_dl_0700B410),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPEndDisplayList(),
);

/// <pygml?v=1.0&h=f21732dab>
// 0x0700F790 - 0x0700F7F0
bitdw_seg7_collision_moving_pyramid = [
    COL_INIT(),
    COL_VERTEX_INIT(0x6),
    COL_VERTEX(0, 102, 0),
    COL_VERTEX(307, 0, -306),
    COL_VERTEX(-306, 0, -306),
    COL_VERTEX(307, 0, 307),
    COL_VERTEX(0, -306, 0),
    COL_VERTEX(-306, 0, 307),
    COL_TRI_INIT(SURFACE_DEFAULT, 8),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 3, 1),
    COL_TRI(1, 3, 4),
    COL_TRI(2, 1, 4),
    COL_TRI(3, 0, 5),
    COL_TRI(5, 4, 3),
    COL_TRI(4, 5, 2),
    COL_TRI(2, 5, 0),
    COL_TRI_STOP(),
    COL_END(),
];

/// <pygml?v=1.0&h=bb62d078e>
// 0x0E000558
geo_bitdw_000558 = [
   [GCMD_CULL, 600],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, bitdw_seg7_dl_0700B480],
   [GCMD_CLOSE],
   [GCMD_END],
];



}