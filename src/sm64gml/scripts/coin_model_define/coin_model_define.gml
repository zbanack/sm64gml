// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function coin_model_define(){
/// <pygml?v=1.0&h=a0a504702>
// Coin

// 0x030056C0
coin_seg3_vertex_030056C0 = vList(
    Vtx([   -32,      0,      0], 0, [     0,   1984], [0xff, 0xff, 0x00, 0xff]),
    Vtx([    32,      0,      0], 0, [  1984,   1984], [0xff, 0xff, 0x00, 0xff]),
    Vtx([    32,     64,      0], 0, [  1984,      0], [0xff, 0xff, 0x00, 0xff]),
    Vtx([   -32,     64,      0], 0, [     0,      0], [0xff, 0xff, 0x00, 0xff]),
);

// 0x03005700
coin_seg3_vertex_03005700 = vList(
    Vtx([   -50,      0,      0], 0, [     0,   1984], [0x78, 0x78, 0xff, 0xff]),
    Vtx([    50,      0,      0], 0, [  1984,   1984], [0x78, 0x78, 0xff, 0xff]),
    Vtx([    50,    100,      0], 0, [  1984,      0], [0x78, 0x78, 0xff, 0xff]),
    Vtx([   -50,    100,      0], 0, [     0,      0], [0x78, 0x78, 0xff, 0xff]),
);

// 0x03005740
coin_seg3_vertex_03005740 = vList(
    Vtx([   -35,      0,      0], 0, [     0,   1984], [0xff, 0x00, 0x00, 0xff]),
    Vtx([    35,      0,      0], 0, [  1984,   1984], [0xff, 0x00, 0x00, 0xff]),
    Vtx([    35,     70,      0], 0, [  1984,      0], [0xff, 0x00, 0x00, 0xff]),
    Vtx([   -35,     70,      0], 0, [     0,      0], [0xff, 0x00, 0x00, 0xff]),
);

// 0x03007780 - 0x030077D0
coin_seg3_dl_03007780 = dList(
    //gsDPPipeSync(),
    gsSPClearGeometryMode(G_LIGHTING),
    gsDPSetCombineMode(G_CC_MODULATEIA, G_CC_MODULATEIA),
    gsSPTexture(0x8000, 0x8000, 0, G_TX_RENDERTILE, G_ON),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPEndDisplayList(),
);

// 0x030077D0 - 0x03007800
coin_seg3_dl_030077D0 = dList(
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPTexture(0x0001, 0x0001, 0, G_TX_RENDERTILE, G_OFF),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_LIGHTING),
    gsSPEndDisplayList(),
);

// 0x03007800 - 0x03007828
coin_seg3_dl_03007800 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005780),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_030056C0, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

// 0x03007828 - 0x03007850
coin_seg3_dl_03007828 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005F80),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_030056C0, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

// 0x03007850 - 0x03007878
coin_seg3_dl_03007850 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006780),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_030056C0, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

// 0x03007878 - 0x030078A0
coin_seg3_dl_03007878 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006F80),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_030056C0, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

// 0x030078A0 - 0x030078C8
coin_seg3_dl_030078A0 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005780),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_03005700, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

// 0x030078C8 - 0x030078F0
coin_seg3_dl_030078C8 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005F80),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_03005700, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

// 0x030078F0 - 0x03007918
coin_seg3_dl_030078F0 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006780),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_03005700, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

// 0x03007918 - 0x03007940
coin_seg3_dl_03007918 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006F80),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_03005700, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

// 0x03007940 - 0x03007968
coin_seg3_dl_03007940 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005780),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_03005740, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

// 0x03007968 - 0x03007990
coin_seg3_dl_03007968 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03005F80),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_03005740, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

// 0x03007990 - 0x030079B8
coin_seg3_dl_03007990 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006780),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_03005740, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

// 0x030079B8 - 0x030079E0
coin_seg3_dl_030079B8 = dList(
    //gsDPPipeSync(),
    gsDPSetTextureImage(G_IM_FMT_IA, G_IM_SIZ_16b, 1, coin_seg3_texture_03006F80),
    gsSPDisplayList(coin_seg3_dl_03007780),
    gsSPVertex(coin_seg3_vertex_03005740, 4, 0),
    gsSPBranchList(coin_seg3_dl_030077D0),
);

}