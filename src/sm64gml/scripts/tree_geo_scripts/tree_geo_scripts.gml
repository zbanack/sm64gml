function tree_geo_init() {

	tree_seg3_lights_0302DE10 = gdSPDefLights1(
		0x3f, 0x3f, 0x3f,
		0xff, 0xff, 0xff, 0x28, 0x28, 0x28
	);

	tree_seg3_vertex_0302FE28 = vList(
		Vtx([-356, -9, 0],  0,  [-796, 2012],  [255, 255, 255, 255] ),
		Vtx([0, -9, 0],  0,  [990, 2012],  [255, 255, 255, 255] ),
		Vtx([0, 800, 0],  0,  [990, -712],  [255, 255, 255, 255] ),
	);

	tree_seg3_vertex_0302FE58 = vList(
		Vtx([0, -9, 0],  0, [0, 2012],  [255, 255, 255, 255] ),
		Vtx([358, -9, 0],  0,  [1756, 2012],  [255, 255, 255, 255] ),
		Vtx([0, 800, 0],  0,  [0, -712],  [255, 255, 255, 255] ),
	);

	tree_seg3_dl_0302FE88 = dList(
		gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, tree_seg3_texture_0302DE28),
		gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1),
		gsSPVertex(tree_seg3_vertex_0302FE28, 3, 0),
		gsSP1Triangle(0, 1, 2, 0x0),
		gsSPEndDisplayList(),
	);

	tree_seg3_dl_0302FEB8 = dList(
		gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, tree_seg3_texture_0302EE28),
		gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1),
		gsSPVertex(tree_seg3_vertex_0302FE58, 3, 0),
		gsSP1Triangle(0, 1, 2, 0x0),
		gsSPEndDisplayList(),
	);

	
	tree_seg3_dl_0302FEE8 = dList(
		gsDPSetCombineMode(G_CC_DECALRGBA),
		gsSPClearGeometryMode(G_LIGHTING),
		gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
		gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
		gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
		gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
		gsSPDisplayList(tree_seg3_dl_0302FE88),
		gsSPDisplayList(tree_seg3_dl_0302FEB8),
		gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
		gsDPSetCombineMode(G_CC_SHADE),
		gsSPSetGeometryMode(G_LIGHTING),
		gsSPEndDisplayList(),
	);

	bubbly_tree_geo = gList(
	    [ GCMD_CULL, 800 ],
	    [ GCMD_OPEN ],
	    [ GCMD_DLIST, LAYER_ALPHA, tree_seg3_dl_0302FEE8 ],
	    [ GCMD_CLOSE ],
	    [ GCMD_END ],
	);


/// <pygml?v=1.0&h=82f71ff50>
// 0x03032048
tree_seg3_vertex_03032048 = vList(
    Vtx([   128,    512,      0], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -127,    512,      0], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -127,      0,      0], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   128,      0,      0], 0, [   990,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x03032088 - 0x03032130
tree_seg3_dl_03032088 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, tree_seg3_texture_03031048),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(tree_seg3_lights_0302DE10.l[0], 1),
    gsSPLight(tree_seg3_lights_0302DE10.a, 2),
    gsSPVertex(tree_seg3_vertex_03032048, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);

// 0x03032130
tree_seg3_vertex_03032130 = vList(
    Vtx([   128,    512,      0], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -127,    512,      0], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -127,      0,      0], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   128,      0,      0], 0, [   990,   2012], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x03032170 - 0x03032218
tree_seg3_dl_03032170 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGBA, G_CC_MODULATERGBA),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, tree_seg3_texture_0302FF60),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(tree_seg3_lights_0302DE10.l[0], 1),
    gsSPLight(tree_seg3_lights_0302DE10.a, 2),
    gsSPVertex(tree_seg3_vertex_03032130, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);

	
	/// <pygml?v=1.0&h=a01a81e51>
	// 0x16001018
	snow_tree_geo = gList(
	   [GCMD_CULL, 800],
	   [GCMD_OPEN],
	      [GCMD_DLIST, LAYER_ALPHA, tree_seg3_dl_03032088],
	   [GCMD_CLOSE],
	   [GCMD_END],
	);
	
}