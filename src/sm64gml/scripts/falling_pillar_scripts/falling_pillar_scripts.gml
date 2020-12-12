function falling_pillar_init() {


// 0x0700AD50 - 0x0700ADD0
jrb_seg7_vertex_0700AD50 = vList(
    Vtx([  -153,    922,    154], 0, [  -796,  -2076], [0xa7, 0x0e, 0x59, 0xff]),
    Vtx([  -153,    922,   -153], 0, [   736,  -2076], [0xa7, 0x0e, 0xa7, 0xff]),
    Vtx([     0,      0,      0], 0, [     0,    990], [0x00, 0x82, 0x00, 0xff]),
    Vtx([   154,    922,    154], 0, [   736,  -2076], [0x59, 0x0e, 0x59, 0xff]),
    Vtx([     0,   1382,      0], 0, [     0,  -3610], [0x00, 0x7e, 0x00, 0xff]),
    Vtx([  -153,    922,   -153], 0, [  -796,  -2076], [0xa7, 0x0e, 0xa7, 0xff]),
    Vtx([   154,    922,   -153], 0, [   736,  -2076], [0x59, 0x0e, 0xa7, 0xff]),
    Vtx([   154,    922,    154], 0, [  -796,  -2076], [0x59, 0x0e, 0x59, 0xff]),
);

// 0x0700ADD0 - 0x0700AE48
jrb_seg7_dl_0700ADD0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09001800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    //gsSPLight(jrb_seg7_light_0700AD40, 1),
    //gsSPLight(jrb_seg7_light_0700AD38, 2),
    gsSPVertex(jrb_seg7_vertex_0700AD50, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  0, 0x0),
    gsSP2Triangles( 5,  4,  6, 0x0,  6,  4,  7, 0x0),
    gsSP2Triangles( 4,  1,  0, 0x0,  2,  5,  6, 0x0),
    gsSP2Triangles( 7,  2,  6, 0x0,  3,  0,  2, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700AE48 - 0x0700AEF0
jrb_seg7_dl_0700AE48 = dList(
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
    gsSPDisplayList(jrb_seg7_dl_0700ADD0),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2),
    gsSPClearGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);

/// <pygml?v=1.0&h=5c3646cdf>
bhvFallingPillarHitbox = [
    [BCMD_BEGIN, OBJ_LIST_GENACTOR],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_HOME],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_falling_pillar_hitbox_loop],
    [BCMD_LOOP_END],
];


/// <pygml?v=1.0&h=bc9cad9de>
// 0x0E000900
jrb_geo_000900 = gList(
   [GCMD_CULL, 1600],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_0700AE48],
   [GCMD_CLOSE],
   [GCMD_END],
);

globalvar sFallingPillarHitbox;
sFallingPillarHitbox = new Hitbox(
    /* interactType:      */ INTERACT_DAMAGE,
    /* downOffset:        */ 150,
    /* damageOrCoinValue: */ 3,
    /* health:            */ 0,
    /* numLootCoins:      */ 0,
    /* radius:            */ 150,
    /* height:            */ 300,
    /* hurtboxRadius:     */ 0,
    /* hurtboxHeight:     */ 0,
);

}

/// <pygml?v=1.0&h=00a54c1b9>
/// @function	bhv_falling_pillar_init()
/// @desc		Initiates various physics params for the pillar.
function bhv_falling_pillar_init() {
    var o = gCurrentObject;

    o.rawData[oGravity] = 0.5;
    o.rawData[oFriction] = 0.91;
    o.rawData[oBuoyancy] = 1.3;
}


/// <pygml?v=1.0&h=e23f8c631>
/// @function	bhv_falling_pillar_spawn_hitboxes()
/// @desc		Spawns 4 hitboxes with Y coordinates offset.
function bhv_falling_pillar_spawn_hitboxes() {
    var o = gCurrentObject;
	
    var i;

    for (i = 0; i < 4; i++) {
        spawn_object_relative(i, 0, i * 400 + 300, 0, o, MODEL_NONE, bhvFallingPillarHitbox);
    }
}

/// <pygml?v=1.0&h=34f171d98>
/// @function	bhv_falling_pillar_calculate_angle_in_front_of_mario()
/// @desc		Computes the angle from current pillar position to 500 units
///					in front of  Mario.
/// @returns	s16
function bhv_falling_pillar_calculate_angle_in_front_of_mario() {
    var o = gCurrentObject;

    var targetX;
    var targetZ;

    // Calculate target to be 500 units in front of Mario in
    // the direction he is facing (angle[1] is yaw).
    targetX = sins(gMarioObject[0].header.gfx.angle[1]) * 500.0 + gMarioObject[0].header.gfx.pos[0];
    targetZ = coss(gMarioObject[0].header.gfx.angle[1]) * 500.0 + gMarioObject[0].header.gfx.pos[2];

    // Calculate the angle to the target from the pillar's current location.
    return atan2s(targetZ - o.rawData[oPosZ], targetX - o.rawData[oPosX]);
}

/// <pygml?v=1.0&h=1c2865cbb>
/// @function	bhv_falling_pillar_loop()
/// @desc		Falling pillar main logic loop.
function bhv_falling_pillar_loop() {
    var o = gCurrentObject;

    var angleInFrontOfMario;
    switch (o.rawData[oAction]) {
        case (FALLING_PILLAR_ACT_IDLE):
            // When Mario is within 1300 units of distance...
            if (is_point_within_radius_of_mario(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ], 1300)) {
                // Begin slightly moving towards Mario.
                o.rawData[oMoveAngleYaw] = o.rawData[oAngleToMario];
                o.rawData[oForwardVel] = 1.0;

                // Spawn the invisible hitboxes.
                bhv_falling_pillar_spawn_hitboxes();

                // Start turning towards Mario.
                o.rawData[oAction] = FALLING_PILLAR_ACT_TURNING;

                // Play the detaching sound.
                cur_obj_play_sound_2(SOUND_GENERAL_POUND_ROCK);
            }
            break;

        case (FALLING_PILLAR_ACT_TURNING):
			// @TODO fixme
            //object_step_without_floor_orient();
			//
            // Calculate angle in front of Mario and turn towards it.
            angleInFrontOfMario = bhv_falling_pillar_calculate_angle_in_front_of_mario();
            o.rawData[oFaceAngleYaw] = approach_s16_symmetric(o.rawData[oFaceAngleYaw], angleInFrontOfMario, 0x400);
			
            // After 10 ticks, start falling.
            if (o.rawData[oTimer] > 10)
                o.rawData[oAction] = FALLING_PILLAR_ACT_FALLING;
            break;

        case (FALLING_PILLAR_ACT_FALLING):
			// @TODO fixme
            //object_step_without_floor_orient();

            // Start falling slowly, with increasing acceleration each frame.
            o.rawData[oFallingPillarPitchAcceleration] += 4.0;
            o.rawData[oAngleVelPitch] += o.rawData[oFallingPillarPitchAcceleration];
            o.rawData[oFaceAnglePitch] += o.rawData[oAngleVelPitch];

            // Once the pillar has turned nearly 90 degrees (after ~22 frames),
            if (o.rawData[oFaceAnglePitch] > 0x3900) {
                // Move 500 units in the direction of falling.
                o.rawData[oPosX] += sins(o.rawData[oFaceAngleYaw]) * 500.0;
                o.rawData[oPosZ] += coss(o.rawData[oFaceAngleYaw]) * 500.0;

                // Make the camera shake and spawn dust clouds.
                set_camera_shake_from_point(SHAKE_POS_MEDIUM, o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ]);
                spawn_mist_particles_variable(0, 0, 92.0);

                // Go invisible.
                o.activeFlags = ACTIVE_FLAG_DEACTIVATED;

                // Play the hitting the ground sound.
                create_sound_spawner(SOUND_GENERAL_BIG_POUND);
            }
            break;
    }
}


/// <pygml?v=1.0&h=024037882>
/// @function	bhv_falling_pillar_hitbox_loop()
/// @desc		Main loop for the invisible hitboxes.
function bhv_falling_pillar_hitbox_loop() {
    var o = gCurrentObject;

    // Get the state of the pillar.
    var pitch = o.parentObj.rawData[oFaceAnglePitch];
    var yaw = o.parentObj.rawData[oFaceAngleYaw];
    var _x = o.parentObj.rawData[oPosX];
    var _y = o.parentObj.rawData[oPosY];
    var _z = o.parentObj.rawData[oPosZ];
    var yOffset = o.rawData[oBehParams2ndByte] * 400 + 300;

    // Update position of hitboxes so they fall with the pillar.
    o.rawData[oPosX] = sins(pitch) * sins(yaw) * yOffset + _x;
    o.rawData[oPosY] = coss(pitch) * yOffset + _y;
    o.rawData[oPosZ] = sins(pitch) * coss(yaw) * yOffset + _z;

    // Give these a hitbox so they can collide with Mario.
    obj_set_hitbox(o, sFallingPillarHitbox);

    // When the pillar goes inactive, the hitboxes also go inactive.
    if (o.parentObj.activeFlags == ACTIVE_FLAG_DEACTIVATED)
        o.activeFlags = ACTIVE_FLAG_DEACTIVATED;
}
