// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sliding_box_init() {
/// <pygml?v=1.0&h=6fecaa5c2>
// 0x0700C8A8 - 0x0700C92C
jrb_seg7_collision_floating_box = cList(
    COL_INIT(),
    COL_VERTEX_INIT(0x8),
    COL_VERTEX(-101, 0, 77),
    COL_VERTEX(-101, 0, -76),
    COL_VERTEX(102, 0, -76),
    COL_VERTEX(102, 0, 77),
    COL_VERTEX(102, 154, 77),
    COL_VERTEX(-101, 154, 77),
    COL_VERTEX(102, 154, -76),
    COL_VERTEX(-101, 154, -76),
    COL_TRI_INIT(SURFACE_DEFAULT, 12),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI(3, 4, 5),
    COL_TRI(4, 6, 7),
    COL_TRI(4, 7, 5),
    COL_TRI(2, 6, 4),
    COL_TRI(2, 4, 3),
    COL_TRI(1, 6, 2),
    COL_TRI(1, 7, 6),
    COL_TRI(0, 5, 7),
    COL_TRI(0, 7, 1),
    COL_TRI(3, 5, 0),
    COL_TRI_STOP(),
    COL_END(),
);


/// <pygml?v=1.0&h=19b85264a>
// 0x07007EA0 - 0x07007EA8
//const Ambient jrb_seg7_light_07007EA0 = {
//    {{0x7f, 0x7f, 0x7f], 0, [0x7f, 0x7f, 0x7f}, 0}
//];
//
//// 0x07007EA8 - 0x07007EB8
//const Light jrb_seg7_light_07007EA8 = {
//    {{0xff, 0xff, 0xff], 0, [0xff, 0xff, 0xff], 0, [0x28, 0x28, 0x28}, 0}
//];

// 0x07007EB8 - 0x07007FB8
jrb_seg7_vertex_07007EB8 = vList(
    Vtx([   102,      0,     77], 0, [   990,    990], [0x33, 0xcd, 0x67, 0xff]),
    Vtx([   102,    154,     77], 0, [   990,      0], [0x54, 0x54, 0x2a, 0xff]),
    Vtx([  -101,    154,     77], 0, [     0,      0], [0xcd, 0x33, 0x67, 0xff]),
    Vtx([   102,      0,    -76], 0, [   990,    990], [0x54, 0xac, 0xd6, 0xff]),
    Vtx([   102,    154,     77], 0, [     0,      0], [0x54, 0x54, 0x2a, 0xff]),
    Vtx([   102,      0,     77], 0, [     0,    990], [0x33, 0xcd, 0x67, 0xff]),
    Vtx([   102,    154,    -76], 0, [   990,      0], [0x33, 0x33, 0x99, 0xff]),
    Vtx([  -101,      0,    -76], 0, [   990,    990], [0xcd, 0xcd, 0x99, 0xff]),
    Vtx([   102,    154,    -76], 0, [     0,      0], [0x33, 0x33, 0x99, 0xff]),
    Vtx([   102,      0,    -76], 0, [     0,    990], [0x54, 0xac, 0xd6, 0xff]),
    Vtx([  -101,    154,    -76], 0, [   990,      0], [0xac, 0x54, 0xd6, 0xff]),
    Vtx([  -101,      0,     77], 0, [   990,    990], [0xac, 0xac, 0x2a, 0xff]),
    Vtx([  -101,    154,     77], 0, [   990,      0], [0xcd, 0x33, 0x67, 0xff]),
    Vtx([  -101,    154,    -76], 0, [     0,      0], [0xac, 0x54, 0xd6, 0xff]),
    Vtx([  -101,      0,    -76], 0, [     0,    990], [0xcd, 0xcd, 0x99, 0xff]),
    Vtx([  -101,      0,     77], 0, [     0,    990], [0xac, 0xac, 0x2a, 0xff]),
);

// 0x07007FB8 - 0x07008038
jrb_seg7_vertex_07007FB8 = vList(
    Vtx([  -101,      0,     77], 0, [     0,      0], [0xac, 0xac, 0x2a, 0xff]),
    Vtx([   102,      0,    -76], 0, [   990,    990], [0x54, 0xac, 0xd6, 0xff]),
    Vtx([   102,      0,     77], 0, [   990,      0], [0x33, 0xcd, 0x67, 0xff]),
    Vtx([  -101,      0,    -76], 0, [     0,    990], [0xcd, 0xcd, 0x99, 0xff]),
    Vtx([   102,    154,     77], 0, [   990,    990], [0x54, 0x54, 0x2a, 0xff]),
    Vtx([   102,    154,    -76], 0, [   990,      0], [0x33, 0x33, 0x99, 0xff]),
    Vtx([  -101,    154,    -76], 0, [     0,      0], [0xac, 0x54, 0xd6, 0xff]),
    Vtx([  -101,    154,     77], 0, [     0,    990], [0xcd, 0x33, 0x67, 0xff]),
);

// 0x07008038 - 0x070080B0
jrb_seg7_dl_07008038 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, jrb_seg7_texture_07001800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    //gsSPLight(jrb_seg7_light_07007EA8, 1),
    //gsSPLight(jrb_seg7_light_07007EA0, 2),
    gsSPVertex(jrb_seg7_vertex_07007EB8, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 13, 14, 0x0,  0,  2, 15, 0x0),
    gsSPEndDisplayList(),
);

// 0x070080B0 - 0x070080F8
jrb_seg7_dl_070080B0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, jrb_seg7_texture_07002000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(jrb_seg7_vertex_07007FB8, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSPEndDisplayList(),
);

// 0x070080F8 - 0x070081A8
jrb_seg7_dl_070080F8 = dList(
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
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_07008038),
    gsSPDisplayList(jrb_seg7_dl_070080B0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2),
    gsSPClearGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);


/// <pygml?v=1.0&h=1cff94721>
// 0x0E000960
jrb_geo_000960 = gList(
   [GCMD_CULL, 300],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_070080F8],
   [GCMD_CLOSE],
   [GCMD_END],
);

/// <pygml?v=1.0&h=b04918de0>

bhvJrbSlidingBox = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, jrb_seg7_collision_floating_box],
    [BCMD_HOME],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_jrb_sliding_box_loop],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];


globalvar sSkullSlidingBoxHitbox;
sSkullSlidingBoxHitbox = new Hitbox(
    /* interactType: */ INTERACT_DAMAGE,
    /* downOffset: */ 0,
    /* damageOrCoinValue: */ 1,
    /* health: */ 1,
    /* numLootCoins: */ 0,
    /* radius: */ 130,
    /* height: */ 100,
    /* hurtboxRadius: */ 0,
    /* hurtboxHeight: */ 0,
);

}

/// <pygml?v=1.0&h=1ca8f6101>
/// @function	bhv_sunken_ship_part_loop()
function bhv_sunken_ship_part_loop() {
    var o = gCurrentObject;

    if (o.rawData[oDistanceToMario] > 10000.0)
        o.rawData[oOpacity] = 140;
    else
        o.rawData[oOpacity] = o.rawData[oDistanceToMario] * 140.0 / 10000.0;
    cur_obj_disable_rendering();
}

/// <pygml?v=1.0&h=a761d9a7e>
/// @function	bhv_ship_part_3_loop()
function bhv_ship_part_3_loop() {
    var o = gCurrentObject;

    var sp1E = o.rawData[oFaceAnglePitch];
    var sp1C = o.rawData[oFaceAngleRoll];
    //cur_obj_set_pos_to_home_with_debug();
    o.rawData[oShipPart3UnkF4] += 0x100;
    o.rawData[oFaceAnglePitch] = sins(o.rawData[oShipPart3UnkF4]) * 1024.0;
    o.rawData[oFaceAngleRoll] = sins(o.rawData[oShipPart3UnkF8]) * 1024.0;
    o.rawData[oAngleVelPitch] = o.rawData[oFaceAnglePitch] - sp1E;
    o.rawData[oAngleVelRoll] = o.rawData[oFaceAngleRoll] - sp1C;
    if (gMarioObject[0].rawData[oPosY] > 1000.0)
        cur_obj_play_sound_1(SOUND_ENV_BOAT_ROCKING1);
}


/// <pygml?v=1.0&h=e7792d7b5>
/// @function	bhv_jrb_sliding_box_loop()
function bhv_jrb_sliding_box_loop() {
	
	return; // @TODO
    var o = gCurrentObject;

    var sp60 = Mat4;
    var sp54 = Vec3f;
    var sp48 = Vec3f;
    var sp40 = Vec3s;
    var sp3C;
    var sp38;
    var sp2C = Vec3f;
    var sp20 = Vec3f;
    var sp1E;
    if (o.rawData[oJrbSlidingBoxUnkF4] == null) {
        sp3C = cur_obj_nearest_object_with_behavior(bhvInSunkenShip3);
        if (sp3C != null) // null check only for assignment, not for dereference?
            o.rawData[oJrbSlidingBoxUnkF4] = sp3C;
        o.rawData[oParentRelativePosX] = o.rawData[oPosX] - sp3C.rawData[oPosX];
        o.rawData[oParentRelativePosY] = o.rawData[oPosY] - sp3C.rawData[oPosY];
        o.rawData[oParentRelativePosZ] = o.rawData[oPosZ] - sp3C.rawData[oPosZ];
    } else {
        sp3C = o.rawData[oJrbSlidingBoxUnkF4];
        sp40[0] = sp3C.rawData[oFaceAnglePitch];
        sp40[1] = sp3C.rawData[oFaceAngleYaw];
        sp40[2] = sp3C.rawData[oFaceAngleRoll];
        sp54[0] = o.rawData[oParentRelativePosX];
        sp54[1] = o.rawData[oParentRelativePosY];
        sp54[2] = o.rawData[oParentRelativePosZ];
        mtxf_rotate_zxy_and_translate(sp60, sp54, sp40);
        linear_mtxf_mul_vec3f(sp60, sp48, sp54);
        o.rawData[oPosX] = sp3C.rawData[oPosX] + sp48[0];
        o.rawData[oPosY] = sp3C.rawData[oPosY] + sp48[1];
        o.rawData[oPosZ] = sp3C.rawData[oPosZ] + sp48[2];
        sp1E = sp3C.rawData[oFaceAnglePitch];
    }
    sp20[0] = o.rawData[oPosX];
    sp20[1] = o.rawData[oPosY];
    sp20[2] = o.rawData[oPosZ];
    find_floor(sp20[0], sp20[1], sp20[2], sp38);
    if (sp38 != null) {
        sp2C[0] = sp38.normal.x;
        sp2C[1] = sp38.normal.y;
        sp2C[2] = sp38.normal.z;
        o.rawData[oFaceAnglePitch] = sp1E;
    }
    o.rawData[oJrbSlidingBoxUnkFC] = sins(o.rawData[oJrbSlidingBoxUnkF8]) * 20.0;
    o.rawData[oJrbSlidingBoxUnkF8] += 0x100;
    o.rawData[oParentRelativePosZ] += o.rawData[oJrbSlidingBoxUnkFC];
    if (gMarioObject[0].rawData[oPosY] > 1000.0)
        if (abs(o.rawData[oJrbSlidingBoxUnkFC]) > 3.0)
            cur_obj_play_sound_1(SOUND_AIR_ROUGH_SLIDE);
    obj_set_hitbox(o, sSkullSlidingBoxHitbox);
    if (!(o.rawData[oJrbSlidingBoxUnkF8] & 0x7FFF))
        cur_obj_become_tangible();
    if (obj_check_if_collided_with_object(o, gMarioObject[0])) {
        o.rawData[oInteractStatus] = 0;
        cur_obj_become_intangible();
    }
}
