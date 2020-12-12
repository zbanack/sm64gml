function rock_init() {
/// <pygml?v=1.0&h=1a8ab0f0a>
// 0x0700C758 - 0x0700C824
jrb_seg7_collision_rock_solid = cList(
    COL_INIT(),
    COL_VERTEX_INIT(0xC),
    COL_VERTEX(305, -409, 0),
    COL_VERTEX(216, -808, -53),
    COL_VERTEX(32, -409, -338),
    COL_VERTEX(32, -409, 264),
    COL_VERTEX(28, -675, 134),
    COL_VERTEX(-66, -822, -143),
    COL_VERTEX(8, -822, -218),
    COL_VERTEX(-108, -9, -53),
    COL_VERTEX(28, -142, -182),
    COL_VERTEX(-306, -409, 0),
    COL_VERTEX(84, 29, 7),
    COL_VERTEX(8, 29, 82),
    COL_TRI_INIT(SURFACE_DEFAULT, 20),
    COL_TRI(7, 11, 10),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 3, 4),
    COL_TRI(1, 0, 4),
    COL_TRI(5, 1, 4),
    COL_TRI(5, 6, 1),
    COL_TRI(2, 1, 6),
    COL_TRI(7, 8, 2),
    COL_TRI(2, 9, 7),
    COL_TRI(5, 2, 6),
    COL_TRI(5, 9, 2),
    COL_TRI(4, 9, 5),
    COL_TRI(4, 3, 9),
    COL_TRI(8, 7, 10),
    COL_TRI(7, 9, 11),
    COL_TRI(0, 2, 8),
    COL_TRI(11, 3, 10),
    COL_TRI(9, 3, 11),
    COL_TRI(3, 0, 10),
    COL_TRI(10, 0, 8),
    COL_TRI_STOP(),
    COL_END(),
);
	
// 0x07007808 - 0x07007908
jrb_seg7_vertex_07007808 = vList(
    Vtx([    32,   -409,   -338], 0, [  3096,      0], [0xf9, 0x0a, 0x82, 0xff]),
    Vtx([   216,   -808,    -53], 0, [  3896,  -1028], [0x4e, 0x9c, 0xfd, 0xff]),
    Vtx([     8,   -822,   -218], 0, [  3060,  -1064], [0xfd, 0xa7, 0xa7, 0xff]),
    Vtx([  -108,     -9,    -53], 0, [  2308,    964], [0xc5, 0x5e, 0xc4, 0xff]),
    Vtx([  -306,   -409,      0], 0, [  2012,      0], [0x87, 0xfd, 0x23, 0xff]),
    Vtx([     8,     29,     82], 0, [   924,   1060], [0xdc, 0x5a, 0x51, 0xff]),
    Vtx([    28,   -142,   -182], 0, [  3132,    632], [0x2c, 0x46, 0xa0, 0xff]),
    Vtx([   305,   -409,      0], 0, [  4056,      0], [0x7d, 0x0b, 0x0a, 0xff]),
    Vtx([    84,     29,      7], 0, [  4108,   1060], [0x4a, 0x66, 0xff, 0xff]),
    Vtx([   -66,   -822,   -143], 0, [  2752,  -1064], [0xb3, 0x9d, 0xf4, 0xff]),
    Vtx([  -108,     -9,    -53], 0, [  1592,    210], [0xc5, 0x5e, 0xc4, 0xff]),
    Vtx([     8,     29,     82], 0, [   808,   -332], [0xdc, 0x5a, 0x51, 0xff]),
    Vtx([    84,     29,      7], 0, [   308,      0], [0x4a, 0x66, 0xff, 0xff]),
    Vtx([    28,   -675,    134], 0, [   860,   -696], [0xfe, 0xb5, 0x66, 0xff]),
    Vtx([    32,   -409,    264], 0, [   912,      0], [0x1c, 0x07, 0x7b, 0xff]),
    Vtx([    84,     29,      7], 0, [    20,   1060], [0x4a, 0x66, 0xff, 0xff]),
);

// 0x07007908 - 0x070079E8
jrb_seg7_vertex_07007908 = vList(
    Vtx([    32,   -409,    264], 0, [   912,      0], [0x1c, 0x07, 0x7b, 0xff]),
    Vtx([   305,   -409,      0], 0, [     0,      0], [0x7d, 0x0b, 0x0a, 0xff]),
    Vtx([    84,     29,      7], 0, [    20,   1060], [0x4a, 0x66, 0xff, 0xff]),
    Vtx([    28,   -142,   -182], 0, [   680,    724], [0x2c, 0x46, 0xa0, 0xff]),
    Vtx([  -108,     -9,    -53], 0, [  1592,    210], [0xc5, 0x5e, 0xc4, 0xff]),
    Vtx([    84,     29,      7], 0, [   308,      0], [0x4a, 0x66, 0xff, 0xff]),
    Vtx([    28,   -675,    134], 0, [   860,   -696], [0xfe, 0xb5, 0x66, 0xff]),
    Vtx([   216,   -808,    -53], 0, [  3896,  -1028], [0x4e, 0x9c, 0xfd, 0xff]),
    Vtx([   305,   -409,      0], 0, [  4056,      0], [0x7d, 0x0b, 0x0a, 0xff]),
    Vtx([    28,   -675,    134], 0, [  4948,   -696], [0xfe, 0xb5, 0x66, 0xff]),
    Vtx([   -66,   -822,   -143], 0, [  1312,    570], [0xb3, 0x9d, 0xf4, 0xff]),
    Vtx([     8,   -822,   -218], 0, [   808,    870], [0xfd, 0xa7, 0xa7, 0xff]),
    Vtx([   216,   -808,    -53], 0, [  -568,    210], [0x4e, 0x9c, 0xfd, 0xff]),
    Vtx([    28,   -675,    134], 0, [   680,   -542], [0xfe, 0xb5, 0x66, 0xff]),
);

// 0x070079E8 - 0x07007AC8
jrb_seg7_dl_070079E8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09001800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    //gsSPLight(jrb_seg7_light_070077F8, 1),
    //gsSPLight(jrb_seg7_light_070077F0, 2),
    gsSPVertex(jrb_seg7_vertex_07007808, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 0,  4,  3, 0x0,  3,  6,  0, 0x0),
    gsSP2Triangles( 7,  0,  6, 0x0,  8,  7,  6, 0x0),
    gsSP2Triangles( 9,  4,  0, 0x0,  9,  0,  2, 0x0),
    gsSP2Triangles( 7,  1,  0, 0x0, 10, 11, 12, 0x0),
    gsSP2Triangles(13, 14,  4, 0x0, 13,  4,  9, 0x0),
    gsSP2Triangles( 4, 14,  5, 0x0,  5, 14, 15, 0x0),
    gsSPVertex(jrb_seg7_vertex_07007908, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 1,  0,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSPEndDisplayList(),
);

// 0x07007AC8 - 0x07007B70
jrb_seg7_dl_07007AC8 = dList(
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_2CYCLE),
    gsDPSetRenderMode(G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2),
    //gsDPSetDepthSource(G_ZS_PIXEL),
    //gsDPSetFogColor(5, 80, 75, 255),
    //gsSPFogPosition(900, 1000),
    gsSPSetGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_PASS2),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_070079E8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2),
    gsSPClearGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);

/// <pygml?v=1.0&h=6dea24dc8>
// 0x0E000930
jrb_geo_000930 = gList(
   [GCMD_CULL, 1100],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_07007AC8],
   [GCMD_CLOSE],
   [GCMD_END],
);

}