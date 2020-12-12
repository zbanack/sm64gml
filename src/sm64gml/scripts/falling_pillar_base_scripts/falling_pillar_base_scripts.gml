// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function falling_pillar_base_init() {
/// <pygml?v=1.0&h=99fc4a3c3>
// 0x0700D198 - 0x0700D1DA
jrb_seg7_collision_pillar_base = cList(
    COL_INIT(),
    COL_VERTEX_INIT(0x5),
    COL_VERTEX(102, 0, -101),
    COL_VERTEX(0, 102, 0),
    COL_VERTEX(102, 0, 102),
    COL_VERTEX(-101, 0, -101),
    COL_VERTEX(-101, 0, 102),
    COL_TRI_INIT(SURFACE_DEFAULT, 4),
    COL_TRI(0, 1, 2),
    COL_TRI(3, 4, 1),
    COL_TRI(2, 1, 4),
    COL_TRI(1, 0, 3),
    COL_TRI_STOP(),
    COL_END(),
);

// 0x0700AF08 - 0x0700AF58
jrb_seg7_vertex_0700AF08 = vList(
    Vtx([   102,      0,   -101], 0, [  2012,  -1054], [0x33, 0x67, 0xcc, 0xff]),
    Vtx([     0,    102,      0], 0, [   992,      0], [0x00, 0x7e, 0x00, 0xff]),
    Vtx([   102,      0,    102], 0, [  2012,    990], [0x33, 0x67, 0x33, 0xff]),
    Vtx([  -101,      0,   -101], 0, [     0,  -1054], [0xcc, 0x67, 0xcc, 0xff]),
    Vtx([  -101,      0,    102], 0, [     0,    990], [0xcc, 0x67, 0x33, 0xff]),
);

// 0x0700AF58 - 0x0700AFB0
jrb_seg7_dl_0700AF58 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09001800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    //gsSPLight(jrb_seg7_light_0700AEF8, 1),
    //gsSPLight(jrb_seg7_light_0700AEF0, 2),
    gsSPVertex(jrb_seg7_vertex_0700AF08, 5, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  1, 0x0),
    gsSP2Triangles( 2,  1,  4, 0x0,  1,  0,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700AFB0 - 0x0700B058
jrb_seg7_dl_0700AFB0 = dList(
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
    gsSPDisplayList(jrb_seg7_dl_0700AF58),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2),
    gsSPClearGeometryMode(G_FOG),
    gsSPEndDisplayList(),
);

/// <pygml?v=1.0&h=89118c8d6>
// 0x0E000918
jrb_geo_000918 = gList(
   [GCMD_CULL, 300],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_0700AFB0],
   [GCMD_CLOSE],
   [GCMD_END],
);
}