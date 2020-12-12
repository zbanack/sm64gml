function tox_box_init() {
	

global.__sToxBoxActions = [ tox_box_act_0, tox_box_act_1, tox_box_act_2, tox_box_act_3,
                                   tox_box_act_4, tox_box_act_5, tox_box_act_6, tox_box_act_7 ];
#macro sToxBoxActions	global.__sToxBoxActions	   
	toxbox_texture_define();
	toxbox_coll_define();
	toxbox_model_define();
	toxbox_geo_define();
	
	globalvar D_8032F8F0, D_8032F924, D_8032F948, D_8032F96C;
	D_8032F8F0 = [ 4, 1, 4, 1, 6, 1, 6, 1, 5, 1, 5, 1, 6, 1, 6, 1, 5, 1, 2, 4, 1, 4, 1, 4, 1, 2,
	                    5, 1, 5, 1, 7, 1, 7, 1, 4, 1, 4, 1, 7, 1, 7, 1, 5, 1, 5, 1, 5, 1, 2, 4, 1, -1 ];
	D_8032F924 = [ 4, 1, 4, 1, 7, 1, 7, 1, 7, 1, 2, 6, 1, 6, 1, 6, 1, 5,
	                    1, 5, 1, 6, 1, 5, 1, 5, 1, 2, 4, 1, 4, 1, 7, 1, -1 ];
	D_8032F948 = [ 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 2, 5, 1, 5, 1, 5, 1, 5,
	                    1, 5, 1, 7, 1, 2, 6, 1, 6, 1, 5, 1, 2, 4, 1, 7, 1, -1 ];
	D_8032F96C = [ D_8032F8F0, D_8032F924, D_8032F948 ];


	toxbox_bhv_define();
	
}

function toxbox_texture_define() {
/// <pygml?v=1.0&h=03a776dce>
global.__ssl_seg7_texture_0700BFA8 = sprite_add_from_rom("levels/ssl/8.rgba16.inc.c");
#macro ssl_seg7_texture_0700BFA8 (global.__ssl_seg7_texture_0700BFA8)

global.__ssl_seg7_texture_0700C7A8 = sprite_add_from_rom("levels/ssl/9.rgba16.inc.c");
#macro ssl_seg7_texture_0700C7A8 (global.__ssl_seg7_texture_0700C7A8)

global.__ssl_seg7_texture_0700D7A8 = sprite_add_from_rom("levels/ssl/10.rgba16.inc.c");
#macro ssl_seg7_texture_0700D7A8 (global.__ssl_seg7_texture_0700D7A8)

global.__ssl_seg7_texture_0700E7A8 = sprite_add_from_rom("levels/ssl/11.rgba16.inc.c");
#macro ssl_seg7_texture_0700E7A8 (global.__ssl_seg7_texture_0700E7A8)

	
}

function toxbox_coll_define() {
	/// <pygml?v=1.0&h=239b9eace>
// 0x07012644 - 0x07012758
ssl_seg7_collision_tox_box = cList(
    COL_INIT(),
    COL_VERTEX_INIT(0x10),
    COL_VERTEX(-255, 256, 256),
    COL_VERTEX(256, 256, -255),
    COL_VERTEX(-255, 256, -255),
    COL_VERTEX(256, 256, 256),
    COL_VERTEX(-255, -255, 256),
    COL_VERTEX(256, -255, 256),
    COL_VERTEX(256, -255, -255),
    COL_VERTEX(-255, -255, -255),
    COL_VERTEX(154, -255, 154),
    COL_VERTEX(154, -255, -153),
    COL_VERTEX(-153, -255, -153),
    COL_VERTEX(-153, -255, 154),
    COL_VERTEX(-153, 154, 154),
    COL_VERTEX(-153, 154, -153),
    COL_VERTEX(154, 154, -153),
    COL_VERTEX(154, 154, 154),
    COL_TRI_INIT(SURFACE_WALL_MISC, 28),
    COL_TRI(12, 13, 14),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 3, 1),
    COL_TRI(4, 0, 2),
    COL_TRI(5, 0, 4),
    COL_TRI(5, 3, 0),
    COL_TRI(6, 3, 5),
    COL_TRI(6, 1, 3),
    COL_TRI(7, 1, 6),
    COL_TRI(7, 2, 1),
    COL_TRI(4, 2, 7),
    COL_TRI(8, 6, 5),
    COL_TRI(8, 9, 6),
    COL_TRI(7, 6, 9),
    COL_TRI(4, 8, 5),
    COL_TRI(7, 9, 10),
    COL_TRI(7, 11, 4),
    COL_TRI(7, 10, 11),
    COL_TRI(4, 11, 8),
    COL_TRI(12, 11, 10),
    COL_TRI(12, 10, 13),
    COL_TRI(10, 14, 13),
    COL_TRI(10, 9, 14),
    COL_TRI(8, 11, 12),
    COL_TRI(14, 9, 8),
    COL_TRI(12, 14, 15),
    COL_TRI(8, 12, 15),
    COL_TRI(14, 8, 15),
    COL_TRI_STOP(),
    COL_END(),
);

}
function toxbox_geo_define() {
/// <pygml?v=1.0&h=df607300f>
// 0x0E000630
ssl_geo_000630 = gList(
   [GCMD_CULL, 4000],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, ssl_seg7_dl_0700FCE0],
   [GCMD_CLOSE],
   [GCMD_END],
);

}
function toxbox_model_define() {
/// <pygml?v=1.0&h=7e394ef0c>
// 0x0700BF90 - 0x0700BFA8
ssl_seg7_lights_0700BF90 = gdSPDefLights1(
    0x3f, 0x3f, 0x3f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700F7A8 - 0x0700F898
ssl_seg7_vertex_0700F7A8 = vList(
    Vtx([  -153,   -255,   -153], 0, [     0,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   154,   -255,   -153], 0, [   990,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   154,    154,   -153], 0, [   990,    -86], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -153,    154,    154], 0, [     0,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -153,    154,   -153], 0, [     0,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   154,    154,   -153], 0, [   990,    990], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   154,    154,    154], 0, [   990,      0], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -153,    154,    154], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -153,   -255,    154], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -153,   -255,   -153], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -153,    154,   -153], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   154,    154,   -153], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   154,   -255,    154], 0, [   990,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   154,    154,    154], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   154,   -255,   -153], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
);

// 0x0700F898 - 0x0700F908
ssl_seg7_vertex_0700F898 = vList(
    Vtx([   154,   -255,    154], 0, [   -26,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -153,    154,    154], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   154,    154,    154], 0, [   -26,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -153,   -255,   -153], 0, [     0,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   154,    154,   -153], 0, [   990,    -86], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -153,    154,   -153], 0, [     0,    -86], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -153,   -255,    154], 0, [   990,    990], [0x00, 0x00, 0x81, 0xff]),
);

// 0x0700F908 - 0x0700FA08
ssl_seg7_vertex_0700F908 = vList(
    Vtx([   256,   -255,   -255], 0, [   990,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   256,    256,   -255], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   256,    256,    256], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([  -255,   -255,    256], 0, [   990,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -255,    256,   -255], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -255,   -255,   -255], 0, [     0,   2012], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -255,    256,    256], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   154,   -255,    154], 0, [   172,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   154,   -255,   -153], 0, [   786,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   256,   -255,   -255], 0, [   990,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   256,   -255,    256], 0, [     0,   2012], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   256,   -255,    256], 0, [     0,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -255,   -255,   -255], 0, [     0,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -153,   -255,    154], 0, [   786,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -255,   -255,    256], 0, [   990,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -153,   -255,   -153], 0, [   172,   2012], [0x00, 0x81, 0x00, 0xff]),
);

// 0x0700FA08 - 0x0700FB08
ssl_seg7_vertex_0700FA08 = vList(
    Vtx([  -255,   -255,   -255], 0, [   990,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -255,    256,   -255], 0, [   990,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   256,    256,   -255], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   256,   -255,   -255], 0, [     0,   2012], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -255,   -255,   -255], 0, [   990,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   256,   -255,   -255], 0, [     0,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   154,   -255,   -153], 0, [   172,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -153,   -255,   -153], 0, [   786,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   256,   -255,    256], 0, [   990,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   256,    256,    256], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -255,    256,    256], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -255,   -255,    256], 0, [     0,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   154,   -255,    154], 0, [   786,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([   256,   -255,    256], 0, [   990,   2012], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -255,   -255,    256], 0, [     0,   2012], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -153,   -255,    154], 0, [   172,   2012], [0x00, 0x81, 0x00, 0xff]),
);

// 0x0700FB08 - 0x0700FB48
ssl_seg7_vertex_0700FB08 = vList(
    Vtx([  -255,    256,    256], 0, [     0,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   256,    256,    256], 0, [   990,   2012], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   256,    256,   -255], 0, [   990,      0], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -255,    256,   -255], 0, [     0,      0], [0x00, 0x7f, 0x00, 0xff]),
);

// 0x0700FB48 - 0x0700FBD8
ssl_seg7_dl_0700FB48 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ssl_seg7_texture_0700BFA8),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(ssl_seg7_lights_0700BF90.l[0], 1),
    gsSPLight(ssl_seg7_lights_0700BF90.a, 2),
    gsSPVertex(ssl_seg7_vertex_0700F7A8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(ssl_seg7_vertex_0700F898, 7, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP1Triangle( 0,  6,  1, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700FBD8 - 0x0700FC40
ssl_seg7_dl_0700FBD8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ssl_seg7_texture_0700C7A8),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(ssl_seg7_vertex_0700F908, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 0,  2, 10, 0x0,  7,  9, 11, 0x0),
    gsSP2Triangles(12, 13, 14, 0x0, 12, 15, 13, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700FC40 - 0x0700FCA8
ssl_seg7_dl_0700FC40 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ssl_seg7_texture_0700E7A8),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(ssl_seg7_vertex_0700FA08, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles( 8, 10, 14, 0x0, 11, 15, 12, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700FCA8 - 0x0700FCE0
ssl_seg7_dl_0700FCA8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ssl_seg7_texture_0700D7A8),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 64 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(ssl_seg7_vertex_0700FB08, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700FCE0 - 0x0700FD80
ssl_seg7_dl_0700FCE0 = dList(
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_MODULATERGB),
    gsSPClearGeometryMode(G_SHADING_SMOOTH),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 5, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(ssl_seg7_dl_0700FB48),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 6, G_TX_NOLOD, G_TX_CLAMP, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (64 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(ssl_seg7_dl_0700FBD8),
    gsSPDisplayList(ssl_seg7_dl_0700FC40),
    gsSPDisplayList(ssl_seg7_dl_0700FCA8),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPSetGeometryMode(G_SHADING_SMOOTH),
    gsSPEndDisplayList(),
);
	
}

function toxbox_bhv_define() {
	/// <pygml?v=1.0&h=0c8c04360>
bhvToxBox = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, ssl_seg7_collision_tox_box],
    [BCMD_ADD_FLOAT, oPosY, 256],
    [BCMD_SET_FLOAT, oDrawingDistance, 8000],
    [BCMD_HOME],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_tox_box_loop],
    [BCMD_LOOP_END],
];

}

/// <pygml?v=1.0&h=865b0b640>
/// @function	tox_box_shake_screen()
function tox_box_shake_screen() {
    var o = gCurrentObject;

    if (o.rawData[oDistanceToMario] < 3000.0)
        cur_obj_shake_screen(SHAKE_POS_SMALL);
}

/// <pygml?v=1.0&h=504f74c6e>
/// @function	tox_box_move(forwardVel, a1, deltaPitch, deltaRoll)
/// @param		{f32}		forwardVel
/// @param		{f32}		a1
/// @param		{s16}		deltaPitch
/// @param		{s16}		deltaRoll
function tox_box_move(forwardVel, a1, deltaPitch, deltaRoll) {
    var o = gCurrentObject;

    o.rawData[oPosY] = 99.41124 * sins((o.rawData[oTimer] + 1) / 8 * 0x8000) + o.rawData[oHomeY] + 3.0;
    o.rawData[oForwardVel] = forwardVel;
    o.rawData[oUnkC0] = a1;
    o.rawData[oFaceAnglePitch] += deltaPitch;
    if (o.rawData[oFaceAnglePitch] < 0)
        deltaRoll = -deltaRoll;
    o.rawData[oFaceAngleRoll] += deltaRoll;
    cur_obj_set_pos_via_transform();
    if (o.rawData[oTimer] == 7) {
        o.rawData[oAction] = cur_obj_progress_direction_table();
        cur_obj_play_sound_2(SOUND_GENERAL_UNK46);
    }
}

/// <pygml?v=1.0&h=776877565>
/// @function	tox_box_act_4()
function tox_box_act_4() {
    tox_box_move(64.0, 0.0, 0x800, 0);
}

/// <pygml?v=1.0&h=77a27c9c4>
/// @function	tox_box_act_5()
function tox_box_act_5() {
    tox_box_move(-64.0, 0.0, -0x800, 0);
}

/// <pygml?v=1.0&h=699998766>
/// @function	tox_box_act_6()
function tox_box_act_6() {
    tox_box_move(0.0, -64.0, 0, 0x800);
}
/// <pygml?v=1.0&h=a2b3dc90f>
/// @function	tox_box_act_7()
function tox_box_act_7() {
    tox_box_move(0.0, 64.0, 0, -0x800);
}

/// <pygml?v=1.0&h=66c48bd2b>
/// @function	tox_box_act_1()
function tox_box_act_1() {
    var o = gCurrentObject;

    o.rawData[oForwardVel] = 0.0;
    if (o.rawData[oTimer] == 0)
        tox_box_shake_screen();
    o.rawData[oPosY] = o.rawData[oHomeY] + 3.0;
    if (o.rawData[oTimer] == 20)
        o.rawData[oAction] = cur_obj_progress_direction_table();
}

/// <pygml?v=1.0&h=f98d3445e>
/// @function	tox_box_act_2()
function tox_box_act_2() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] == 20)
        o.rawData[oAction] = cur_obj_progress_direction_table();
}

/// <pygml?v=1.0&h=1425df2c9>
/// @function	tox_box_act_3()
function tox_box_act_3() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] == 20)
        o.rawData[oAction] = cur_obj_progress_direction_table();
}

/// <pygml?v=1.0&h=f2858f5d0>
/// @function	tox_box_act_0()
function tox_box_act_0() {
    var o = gCurrentObject;

    var sp1C = D_8032F96C[o.rawData[oBehParams2ndByte]];
    o.rawData[oAction] = cur_obj_set_direction_table(sp1C);
}

/// <pygml?v=1.0&h=e9f200801>
/// @function	bhv_tox_box_loop()
function bhv_tox_box_loop() {
    cur_obj_call_action_function(sToxBoxActions);
    load_object_collision_model();
}
