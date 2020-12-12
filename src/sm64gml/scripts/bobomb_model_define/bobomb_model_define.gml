/// <pygml?v=1.0&h=220555761>
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bobomb_model_define() {
	
	// 0x08022A60
	bobomb_seg8_vertex_08022A60 = vList(
	    Vtx([   133,    -47,      0], 0, [   480,      0], [0xff, 0xff, 0xff, 0xff]),
	    Vtx([   133,     32,      0], 0, [   480,    990], [0xff, 0xff, 0xff, 0xff]),
	    Vtx([   128,     32,     50], 0, [   990,    990], [0xff, 0xff, 0xff, 0xff]),
	    Vtx([   128,    -47,    -49], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
	    Vtx([   128,    -47,     50], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
	    Vtx([   128,     32,    -49], 0, [     0,    990], [0xff, 0xff, 0xff, 0xff]),
	);

	// 0x08022AC0 - 0x08022B08
	bobomb_seg8_dl_08022AC0 = dList(
	    // //gsDPPipeSync(),
	    gsDPSetCombineMode(G_CC_DECALRGBA),//, G_CC_DECALRGBA),
	    gsSPClearGeometryMode(G_LIGHTING),
	    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
	    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
	    // //gsDPTileSync(),
	    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
	    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
	    gsSPEndDisplayList(),
	);

	// 0x08022B08 - 0x08022B58
	bobomb_seg8_dl_08022B08 = dList(
	    gsSPVertex(bobomb_seg8_vertex_08022A60, 6, 0),
	    gsSP2Triangles( 0,  1,  2, 0x0,  3,  1,  0, 0x0),
	    gsSP2Triangles( 0,  2,  4, 0x0,  3,  5,  1, 0x0),
	    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
	    // //gsDPPipeSync(),
	    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
	    gsSPSetGeometryMode(G_LIGHTING),
	    gsSPEndDisplayList(),
	);

	// 0x08022B58 - 0x08022B88
	bobomb_seg8_dl_08022B58 = dList(
	    gsSPDisplayList(bobomb_seg8_dl_08022AC0),
	    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bobomb_seg8_texture_08021A60),
	    gsDPLoadSync(),
	    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1),//, CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
	    gsSPDisplayList(bobomb_seg8_dl_08022B08),
	    gsSPEndDisplayList(),
	);

	// 0x08022B88 - 0x08022BB8
	bobomb_seg8_dl_08022B88 = dList(
	    gsSPDisplayList(bobomb_seg8_dl_08022AC0),
	    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bobomb_seg8_texture_08022260),
	    gsDPLoadSync(),
	    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1),//, CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
	    gsSPDisplayList(bobomb_seg8_dl_08022B08),
	    gsSPEndDisplayList(),
	);

	// 0x08022BB8
	bobomb_seg8_vertex_08022BB8 = vList(
	    Vtx([     0,     49,      0], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
	    Vtx([   -49,    -49,      0], 0, [     0,   2012], [0xff, 0xff, 0xff, 0xff]),
	    Vtx([     0,    -49,      0], 0, [   990,   2012], [0xff, 0xff, 0xff, 0xff]),
	    Vtx([   -49,     49,      0], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
	);

	// 0x08022BF8
	bobomb_seg8_vertex_08022BF8 = vList(
	    Vtx([    49,     49,      0], 0, [   990,      0], [0xff, 0xff, 0xff, 0xff]),
	    Vtx([     0,    -49,      0], 0, [     0,   2012], [0xff, 0xff, 0xff, 0xff]),
	    Vtx([    49,    -49,      0], 0, [   990,   2012], [0xff, 0xff, 0xff, 0xff]),
	    Vtx([     0,     49,      0], 0, [     0,      0], [0xff, 0xff, 0xff, 0xff]),
	);

	// 0x08022C38 - 0x08022CA0
	bobomb_seg8_dl_08022C38 = dList(
	    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bobomb_seg8_texture_0801DA60),
	    gsDPLoadSync(),
	    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1),//, CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
	    gsSPVertex(bobomb_seg8_vertex_08022BB8, 4, 0),
	    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
	    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bobomb_seg8_texture_0801EA60),
	    gsDPLoadSync(),
	    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1),// CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
	    gsSPVertex(bobomb_seg8_vertex_08022BF8, 4, 0),
	    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
	    gsSPEndDisplayList(),
	);

	// 0x08022CA0 - 0x08022D08
	bobomb_seg8_dl_08022CA0 = dList(
	    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bobomb_seg8_texture_0801FA60),
	    gsDPLoadSync(),
	    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1),//, CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
	    gsSPVertex(bobomb_seg8_vertex_08022BB8, 4, 0),
	    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
	    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, bobomb_seg8_texture_08020A60),
	    gsDPLoadSync(),
	    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1),//, CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
	    gsSPVertex(bobomb_seg8_vertex_08022BF8, 4, 0),
	    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
	    gsSPEndDisplayList(),
	);

	// 0x08022D08 - 0x08022D78
	bobomb_seg8_dl_08022D08 = dList(
	     //gsDPPipeSync(),
	    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
	    gsSPClearGeometryMode(G_LIGHTING),
	    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
	    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
	     //gsDPTileSync(),
	    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
	    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
	    gsSPDisplayList(bobomb_seg8_dl_08022C38),
	    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
	     //gsDPPipeSync(),
	    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
	    gsSPSetGeometryMode(G_LIGHTING),
	    gsSPEndDisplayList(),
	);

	// 0x08022D78 - 0x08022DE8
	bobomb_seg8_dl_08022D78 = dList(
	     //gsDPPipeSync(),
	    gsDPSetCombineMode(G_CC_DECALRGBA, G_CC_DECALRGBA),
	    gsSPClearGeometryMode(G_LIGHTING),
	    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
	    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
	     //gsDPTileSync(),
	    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
	    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
	    gsSPDisplayList(bobomb_seg8_dl_08022CA0),
	    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
	     //gsDPPipeSync(),
	    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
	    gsSPSetGeometryMode(G_LIGHTING),
	    gsSPEndDisplayList(),
	);

	// 0x08022DE8
	bobomb_seg8_lights_08022DE8 = gdSPDefLights1(
	    0x3f, 0x26, 0x04,
	    0xff, 0x99, 0x12, 0x28, 0x28, 0x28
	);

	// 0x08022E00
	bobomb_seg8_lights_08022E00 = gdSPDefLights1(
	    0x2c, 0x2c, 0x2c,
	    0xb2, 0xb2, 0xb2, 0x28, 0x28, 0x28
	);

	// Unreferenced light group
	bobomb_lights_unused = gdSPDefLights1(
	    0x00, 0x00, 0x00,
	    0x00, 0x00, 0x00, 0x28, 0x28, 0x28
	);

	// 0x08022E30
	bobomb_seg8_vertex_08022E30 = vList(
	    Vtx([    27,    -26,    -31], 0, [     0,      0], [0xeb, 0x96, 0xbf, 0x00]),
	    Vtx([   -36,      0,    -20], 0, [     0,      0], [0xb1, 0xd0, 0xaa, 0x00]),
	    Vtx([    32,      0,    -41], 0, [     0,      0], [0xfc, 0xfb, 0x82, 0x00]),
	    Vtx([    85,      0,    -32], 0, [     0,      0], [0x50, 0xf1, 0xa0, 0xff]),
	    Vtx([    79,     28,    -20], 0, [     0,      0], [0x34, 0x62, 0xc4, 0xff]),
	    Vtx([    79,     28,     15], 0, [     0,      0], [0x34, 0x62, 0x3c, 0xff]),
	    Vtx([    85,      0,     27], 0, [     0,      0], [0x50, 0xf1, 0x60, 0xff]),
	    Vtx([    33,     28,     29], 0, [     0,      0], [0xff, 0x69, 0x47, 0xff]),
	    Vtx([   -29,     28,     12], 0, [     0,      0], [0xc8, 0x60, 0x3c, 0xff]),
	    Vtx([   -36,      0,     16], 0, [     0,      0], [0xb1, 0xd0, 0x56, 0xff]),
	    Vtx([    32,      0,     37], 0, [     0,      0], [0xfc, 0xfb, 0x7e, 0xff]),
	    Vtx([    33,     28,    -34], 0, [     0,      0], [0xff, 0x69, 0xb9, 0xff]),
	    Vtx([   -29,     28,    -16], 0, [     0,      0], [0xc8, 0x60, 0xc4, 0xff]),
	    Vtx([    68,    -30,     16], 0, [     0,      0], [0x26, 0x95, 0x36, 0xff]),
	    Vtx([    68,    -30,    -21], 0, [     0,      0], [0x26, 0x95, 0xca, 0xff]),
	    Vtx([    27,    -26,     27], 0, [     0,      0], [0xeb, 0x96, 0x41, 0xff]),
	);

	// 0x08022F30
	bobomb_seg8_vertex_08022F30 = vList(
	    Vtx([    27,    -26,    -31], 0, [     0,      0], [0xed, 0x90, 0xc8, 0xff]),
	    Vtx([    27,    -26,     27], 0, [     0,      0], [0xf5, 0xa2, 0x53, 0x00]),
	    Vtx([   -36,      0,     16], 0, [     0,      0], [0xa2, 0xf8, 0x54, 0x00]),
	    Vtx([   -36,      0,    -20], 0, [     0,      0], [0xa9, 0xdd, 0xac, 0xff]),
	);

	// 0x08022F70
	bobomb_seg8_vertex_08022F70 = vList(
	    Vtx([    32,      0,     41], 0, [     0,      0], [0xfc, 0xfb, 0x7e, 0x00]),
	    Vtx([   -36,      0,     20], 0, [     0,      0], [0xb1, 0xd0, 0x56, 0x00]),
	    Vtx([    27,    -26,     31], 0, [     0,      0], [0xeb, 0x96, 0x41, 0x00]),
	    Vtx([    84,      0,    -27], 0, [     0,      0], [0x50, 0xf1, 0xa0, 0xff]),
	    Vtx([    79,     28,    -15], 0, [     0,      0], [0x34, 0x62, 0xc4, 0xff]),
	    Vtx([    79,     28,     20], 0, [     0,      0], [0x34, 0x62, 0x3c, 0xff]),
	    Vtx([    84,      0,     32], 0, [     0,      0], [0x50, 0xf1, 0x60, 0xff]),
	    Vtx([    32,      0,    -37], 0, [     0,      0], [0xfc, 0xfb, 0x82, 0xff]),
	    Vtx([   -36,      0,    -16], 0, [     0,      0], [0xb1, 0xd0, 0xaa, 0xff]),
	    Vtx([   -28,     28,    -12], 0, [     0,      0], [0xc8, 0x60, 0xc4, 0xff]),
	    Vtx([    33,     28,    -29], 0, [     0,      0], [0xff, 0x69, 0xb9, 0xff]),
	    Vtx([   -28,     28,     16], 0, [     0,      0], [0xc8, 0x60, 0x3c, 0xff]),
	    Vtx([    33,     28,     33], 0, [     0,      0], [0xff, 0x69, 0x47, 0xff]),
	    Vtx([    68,    -29,     21], 0, [     0,      0], [0x26, 0x95, 0x36, 0xff]),
	    Vtx([    68,    -29,    -16], 0, [     0,      0], [0x26, 0x95, 0xca, 0xff]),
	    Vtx([    27,    -26,    -27], 0, [     0,      0], [0xeb, 0x96, 0xbf, 0xff]),
	);

	// 0x08023070
	bobomb_seg8_vertex_08023070 = vList(
	    Vtx([    27,    -26,    -27], 0, [     0,      0], [0xed, 0x90, 0xc8, 0xff]),
	    Vtx([    27,    -26,     31], 0, [     0,      0], [0xf5, 0xa2, 0x53, 0x00]),
	    Vtx([   -36,      0,     20], 0, [     0,      0], [0xa2, 0xf8, 0x54, 0x00]),
	    Vtx([   -36,      0,    -16], 0, [     0,      0], [0xa9, 0xdd, 0xac, 0xff]),
	);

	// 0x080230B0
	bobomb_seg8_vertex_080230B0 = vList(
	    Vtx([     0,   -100,     59], 0, [     0,      0], [0x00, 0xfe, 0x7f, 0x00]),
	    Vtx([   -53,    -99,     28], 0, [     0,      0], [0xc1, 0xfe, 0x6d, 0x00]),
	    Vtx([   -53,   -140,     27], 0, [     0,      0], [0xc1, 0xfe, 0x6d, 0x00]),
	    Vtx([     0,   -141,     58], 0, [     0,      0], [0x00, 0xfe, 0x7f, 0xff]),
	    Vtx([    53,    -99,     28], 0, [     0,      0], [0x3f, 0xfe, 0x6d, 0xff]),
	    Vtx([    53,   -140,     27], 0, [     0,      0], [0x3f, 0xfe, 0x6d, 0xff]),
	    Vtx([   -53,    -99,     28], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
	    Vtx([   -53,    -98,    -32], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
	    Vtx([   -53,   -139,    -33], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
	    Vtx([   -53,   -140,     27], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
	    Vtx([   -53,    -98,    -32], 0, [     0,      0], [0xc1, 0x02, 0x93, 0xff]),
	    Vtx([     0,    -97,    -63], 0, [     0,      0], [0xc1, 0x02, 0x93, 0xff]),
	    Vtx([     0,   -138,    -64], 0, [     0,      0], [0xc1, 0x02, 0x93, 0xff]),
	    Vtx([   -53,   -139,    -33], 0, [     0,      0], [0xc1, 0x02, 0x93, 0xff]),
	);

	// 0x08023190
	bobomb_seg8_vertex_08023190 = vList(
	    Vtx([    53,    -98,    -32], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
	    Vtx([    53,    -99,     28], 0, [     0,      0], [0x7f, 0x00, 0x00, 0x00]),
	    Vtx([    53,   -140,     27], 0, [     0,      0], [0x7f, 0x00, 0x00, 0x00]),
	    Vtx([    53,   -139,    -33], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
	    Vtx([     0,    -97,    -63], 0, [     0,      0], [0x3f, 0x02, 0x93, 0xff]),
	    Vtx([    53,    -98,    -32], 0, [     0,      0], [0x3f, 0x02, 0x93, 0xff]),
	    Vtx([    53,   -139,    -33], 0, [     0,      0], [0x3f, 0x02, 0x93, 0xff]),
	    Vtx([     0,   -138,    -64], 0, [     0,      0], [0x3f, 0x02, 0x93, 0xff]),
	    Vtx([     0,   -138,    -64], 0, [     0,      0], [0x00, 0x81, 0xfe, 0xff]),
	    Vtx([    53,   -139,    -33], 0, [     0,      0], [0x00, 0x81, 0xfe, 0xff]),
	    Vtx([    53,   -140,     27], 0, [     0,      0], [0x00, 0x81, 0xfe, 0xff]),
	    Vtx([     0,   -141,     58], 0, [     0,      0], [0x00, 0x81, 0xfe, 0xff]),
	    Vtx([   -53,   -140,     27], 0, [     0,      0], [0x00, 0x81, 0xfe, 0xff]),
	    Vtx([   -53,   -139,    -33], 0, [     0,      0], [0x00, 0x81, 0xfe, 0xff]),
	);

	// 0x08023270 - 0x08023378
	bobomb_seg8_dl_08023270 = dList(
	    gsSPLight(bobomb_seg8_lights_08022DE8.l[0], 1),
	    gsSPLight(bobomb_seg8_lights_08022DE8.a, 2),
	    gsSPVertex(bobomb_seg8_vertex_08022E30, 16, 0),
	    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
	    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
	    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12,  8, 0x0),
	    gsSP2Triangles(11,  8,  7, 0x0,  6, 13, 14, 0x0),
	    gsSP2Triangles( 6, 14,  3, 0x0,  9,  8, 12, 0x0),
	    gsSP2Triangles( 9, 12,  1, 0x0, 10,  9, 15, 0x0),
	    gsSP2Triangles( 2,  1, 12, 0x0,  2, 12, 11, 0x0),
	    gsSP2Triangles(10,  6,  5, 0x0, 10,  5,  7, 0x0),
	    gsSP2Triangles( 0, 14, 13, 0x0,  0, 13, 15, 0x0),
	    gsSP2Triangles(11,  4,  3, 0x0, 11,  3,  2, 0x0),
	    gsSP2Triangles( 2,  3, 14, 0x0,  2, 14,  0, 0x0),
	    gsSP2Triangles( 7,  5,  4, 0x0,  7,  4, 11, 0x0),
	    gsSP2Triangles(15, 13,  6, 0x0, 15,  6, 10, 0x0),
	    gsSPVertex(bobomb_seg8_vertex_08022F30, 4, 0),
	    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
	    gsSPEndDisplayList(),
	);

	// 0x08023378 - 0x08023480
	bobomb_seg8_dl_08023378 = dList(
	    gsSPLight(bobomb_seg8_lights_08022DE8.l[0], 1),
	    gsSPLight(bobomb_seg8_lights_08022DE8.a, 2),
	    gsSPVertex(bobomb_seg8_vertex_08022F70, 16, 0),
	    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
	    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
	    gsSP2Triangles( 7,  9, 10, 0x0, 10,  9, 11, 0x0),
	    gsSP2Triangles(10, 11, 12, 0x0,  6, 13, 14, 0x0),
	    gsSP2Triangles( 6, 14,  3, 0x0,  1, 11,  9, 0x0),
	    gsSP2Triangles( 1,  9,  8, 0x0, 15,  8,  7, 0x0),
	    gsSP2Triangles(12, 11,  1, 0x0, 12,  1,  0, 0x0),
	    gsSP2Triangles(10,  4,  3, 0x0, 10,  3,  7, 0x0),
	    gsSP2Triangles(15, 14, 13, 0x0, 15, 13,  2, 0x0),
	    gsSP2Triangles( 0,  6,  5, 0x0,  0,  5, 12, 0x0),
	    gsSP2Triangles( 2, 13,  6, 0x0,  2,  6,  0, 0x0),
	    gsSP2Triangles(12,  5,  4, 0x0, 12,  4, 10, 0x0),
	    gsSP2Triangles( 7,  3, 14, 0x0,  7, 14, 15, 0x0),
	    gsSPVertex(bobomb_seg8_vertex_08023070, 4, 0),
	    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
	    gsSPEndDisplayList(),
	);

	// 0x08023480 - 0x08023528
	bobomb_seg8_dl_08023480 = dList(
	    gsSPLight(bobomb_seg8_lights_08022E00.l[0], 1),
	    gsSPLight(bobomb_seg8_lights_08022E00.a, 2),
	    gsSPVertex(bobomb_seg8_vertex_080230B0, 14, 0),
	    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
	    gsSP2Triangles( 4,  0,  3, 0x0,  4,  3,  5, 0x0),
	    gsSP2Triangles( 6,  7,  8, 0x0,  6,  8,  9, 0x0),
	    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
	    gsSPVertex(bobomb_seg8_vertex_08023190, 14, 0),
	    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
	    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
	    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
	    gsSP2Triangles( 8, 11, 12, 0x0,  8, 12, 13, 0x0),
	    gsSPEndDisplayList(),
	);

}
