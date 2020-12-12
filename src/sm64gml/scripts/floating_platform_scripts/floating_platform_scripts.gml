function floating_platform_init() {
/// <pygml?v=1.0&h=6e791d546>
// 0x0700C824 - 0x0700C8A8
jrb_seg7_collision_floating_platform = cList(
    COL_INIT(),
    COL_VERTEX_INIT(0x8),
    COL_VERTEX(256, -63, 640),
    COL_VERTEX(-255, 64, 640),
    COL_VERTEX(-255, -63, 640),
    COL_VERTEX(-255, -63, -639),
    COL_VERTEX(-255, 64, -639),
    COL_VERTEX(256, 64, -639),
    COL_VERTEX(256, -63, -639),
    COL_VERTEX(256, 64, 640),
    COL_TRI_INIT(SURFACE_DEFAULT, 12),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI(2, 4, 3),
    COL_TRI(2, 1, 4),
    COL_TRI(3, 4, 5),
    COL_TRI(5, 4, 1),
    COL_TRI(0, 3, 6),
    COL_TRI(3, 5, 6),
    COL_TRI(0, 7, 1),
    COL_TRI(5, 1, 7),
    COL_TRI(6, 5, 7),
    COL_TRI(6, 7, 0),
    COL_TRI_STOP(),
    COL_END(),
);

// 0x07007B88 - 0x07007C88
jrb_seg7_vertex_07007B88 = vList(
    Vtx([  -255,    -63,    640], 0, [  -882,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -255,     64,    640], 0, [  -882,    848], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -255,     64,   -639], 0, [  3374,    848], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   256,    -63,    640], 0, [   138,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   256,     64,    640], 0, [   138,    848], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -255,     64,    640], 0, [   990,    848], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -255,    -63,    640], 0, [   990,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   256,    -63,   -639], 0, [  3374,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   256,     64,    640], 0, [  -882,    848], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   256,    -63,    640], 0, [  -882,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   256,     64,   -639], 0, [  3374,    848], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -255,    -63,   -639], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -255,     64,   -639], 0, [   990,    848], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   256,     64,   -639], 0, [   138,    848], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   256,    -63,   -639], 0, [   138,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -255,    -63,   -639], 0, [  3374,    990], [0x81, 0x00, 0x00, 0xff]),
);

// 0x07007C88 - 0x07007D08
jrb_seg7_vertex_07007C88 = vList(
    Vtx([   256,    -63,    640], 0, [ -2328,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -255,    -63,    640], 0, [ -2328,  -1566], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -255,    -63,   -639], 0, [  4056,  -1566], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   256,    -63,   -639], 0, [  4056,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   256,     64,   -639], 0, [  4056,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -255,     64,    640], 0, [ -2328,  -1566], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   256,     64,    640], 0, [ -2328,    990], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -255,     64,   -639], 0, [  4056,  -1566], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x07007D08 - 0x07007D80
jrb_seg7_dl_07007D08 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_0900A000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
   // gsSPLight(jrb_seg7_light_07007B78, 1),
   // gsSPLight(jrb_seg7_light_07007B70, 2),
    gsSPVertex(jrb_seg7_vertex_07007B88, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 13, 14, 0x0,  0,  2, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x07007D80 - 0x07007DC8
jrb_seg7_dl_07007D80 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_0900A800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(jrb_seg7_vertex_07007C88, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSPEndDisplayList(),
);

// 0x07007DC8 - 0x07007EA0
jrb_seg7_dl_07007DC8 = dList(
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_2CYCLE),
    gsDPSetRenderMode(G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2),
    //gsDPSetDepthSource(G_ZS_PIXEL),
    //gsDPSetFogColor(5, 80, 75, 255),
    //gsSPFogPosition(900, 1000),
    gsSPSetGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_PASS2),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_07007D08),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_07007D80),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2),
    gsSPClearGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);


/// <pygml?v=1.0&h=1a1b92b1f>
// 0x0E000948
jrb_geo_000948 = gList(
   [GCMD_CULL, 900],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_07007DC8],
   [GCMD_CLOSE],
   [GCMD_END],
);

}

/// <pygml?v=1.0&h=4d1751768>
/// @function	floating_platform_find_home_y()
/// @returns	f32
function floating_platform_find_home_y() {
    var o = gCurrentObject;

    var sp24 = {};
    var sp20;
    var sp1C;

    sp20 = find_water_level(o.rawData[oPosX], o.rawData[oPosZ]);
    sp1C = find_floor(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ], sp24);
	sp24 = sp24._floor;
    if (sp20 > sp1C + o.rawData[oFloatingPlatformUnkFC]) {
        o.rawData[oFloatingPlatformUnkF4] = 0;
        return sp20 + o.rawData[oFloatingPlatformUnkFC];
    } else {
        o.rawData[oFloatingPlatformUnkF4] = 1;
        return sp1C + o.rawData[oFloatingPlatformUnkFC];
    }
}


/// <pygml?v=1.0&h=da8092722>
/// @function	floating_platform_act_0()
function floating_platform_act_0() {
    var o = gCurrentObject;

    var sp6 = (gMarioObject[0].header.gfx.pos[0] - o.rawData[oPosX]) * coss(-1 * o.rawData[oMoveAngleYaw]) +
        (gMarioObject[0].header.gfx.pos[2] - o.rawData[oPosZ]) * sins(-1 * o.rawData[oMoveAngleYaw]);
    var sp4 = (gMarioObject[0].header.gfx.pos[2] - o.rawData[oPosZ]) * coss(-1 * o.rawData[oMoveAngleYaw]) -
        (gMarioObject[0].header.gfx.pos[0] - o.rawData[oPosX]) * sins(-1 * o.rawData[oMoveAngleYaw]);

    if (gMarioObject[0].platform == o) {
        o.rawData[oFaceAnglePitch] = sp4 * 2;
        o.rawData[oFaceAngleRoll] = -sp6 * 2;
        o.rawData[oVelY] -= 1.0;
        if (o.rawData[oVelY] < 0.0)
            o.rawData[oVelY] = 0.0;

        o.rawData[oFloatingPlatformUnkF8] += o.rawData[oVelY];
        if (o.rawData[oFloatingPlatformUnkF8] > 90.0)
            o.rawData[oFloatingPlatformUnkF8] = 90.0;
    } else {
        o.rawData[oFaceAnglePitch] /= 2;
        o.rawData[oFaceAngleRoll] /= 2;
        o.rawData[oFloatingPlatformUnkF8] -= 5.0;
        o.rawData[oVelY] = 10.0;
        if (o.rawData[oFloatingPlatformUnkF8] < 0.0)
            o.rawData[oFloatingPlatformUnkF8] = 0.0;
    }

    o.rawData[oPosY] = o.rawData[oHomeY] - 64.0 - o.rawData[oFloatingPlatformUnkF8] + sins(o.rawData[oFloatingPlatformUnk100] * 0x800) * 10.0;
    o.rawData[oFloatingPlatformUnk100]++;
    if (o.rawData[oFloatingPlatformUnk100] == 32)
        o.rawData[oFloatingPlatformUnk100] = 0;
}


/// <pygml?v=1.0&h=17c998a97>
/// @function	bhv_floating_platform_loop()
function bhv_floating_platform_loop() {
    var o = gCurrentObject;

    o.rawData[oHomeY] = floating_platform_find_home_y();
    if (o.rawData[oFloatingPlatformUnkF4] == 0)
        o.rawData[oAction] = 0;
    else
        o.rawData[oAction] = 1;

    switch (o.rawData[oAction]) {
        case (0):
            floating_platform_act_0();
            break;

        case (1):
            o.rawData[oPosY] = o.rawData[oHomeY];
            break;
    }
}
