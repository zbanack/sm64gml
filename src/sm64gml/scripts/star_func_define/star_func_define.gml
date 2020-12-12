/// <pygml?v=1.0&h=043c5cef0>
/// @function	bhv_collect_star_init()
function bhv_collect_star_init() {
    var o = gCurrentObject;

    var starId;
    var currentLevelStarFlags;

    starId = (o.rawData[oBehParams] >> 24) & 0xFF;
    //currentLevelStarFlags = save_file_get_star_flags(gCurrSaveFileNum - 1, gCurrCourseNum - 1);
    //if (currentLevelStarFlags & (1 << starId)) {
    //    o.header.gfx.sharedChild = gLoadedGraphNodes[MODEL_TRANSPARENT_STAR];
    //} else {
        o.header.gfx.sharedChild = gLoadedGraphNodes[MODEL_STAR]; // @z
    //}

    obj_set_hitbox(o, sCollectStarHitbox);
}

/// <pygml?v=1.0&h=fb5a29c33>
/// @function	bhv_collect_star_loop()
function bhv_collect_star_loop() {
    var o = gCurrentObject;

    o.rawData[oFaceAngleYaw] += 0x800;

    if (o.rawData[oInteractStatus] & INT_STATUS_INTERACTED) {
        mark_obj_for_deletion(o);
        o.rawData[oInteractStatus] = 0;
    }
}

/// <pygml?v=1.0&h=553beb497>
/// @function	bhv_star_spawn_init()
function bhv_star_spawn_init() {
    var o = gCurrentObject;

    o.rawData[oMoveAngleYaw] = atan2s(o.rawData[oHomeZ] - o.rawData[oPosZ], o.rawData[oHomeX] - o.rawData[oPosX]);
    o.rawData[oStarSpawnDisFromHome] = sqrt(sqr(o.rawData[oHomeX] - o.rawData[oPosX]) + sqr(o.rawData[oHomeZ] - o.rawData[oPosZ]));
    o.rawData[oVelY] = (o.rawData[oHomeY] - o.rawData[oPosY]) / 30.0;
    o.rawData[oForwardVel] = o.rawData[oStarSpawnDisFromHome] / 30.0;
    o.rawData[oStarSpawnUnkFC] = o.rawData[oPosY];
    if (o.rawData[oBehParams2ndByte] == 0 || gCurrCourseNum == COURSE_BBH)
        cutscene_object(CUTSCENE_STAR_SPAWN, o);
    else
        cutscene_object(CUTSCENE_RED_COIN_STAR_SPAWN, o);

    set_time_stop_flags(TIME_STOP_ENABLED | TIME_STOP_MARIO_AND_DOORS);
    o.activeFlags |= ACTIVE_FLAG_INITIATED_TIME_STOP;
    cur_obj_become_intangible();
}

/// <pygml?v=1.0&h=add4c8c15>
/// @function	bhv_star_spawn_loop()
function bhv_star_spawn_loop() {
    var o = gCurrentObject;

    switch (o.rawData[oAction]) {
        case (0):
            o.rawData[oFaceAngleYaw] += 0x1000;
            if (o.rawData[oTimer] > 20)
                o.rawData[oAction] = 1;
            break;

        case (1):
            obj_move_xyz_using_fvel_and_yaw(o);
            o.rawData[oStarSpawnUnkFC] += o.rawData[oVelY];
            o.rawData[oPosY] = o.rawData[oStarSpawnUnkFC] + sins((o.rawData[oTimer] * 0x8000) / 30) * 400.0;
            o.rawData[oFaceAngleYaw] += 0x1000;
            spawn_object(o, MODEL_NONE, bhvSparkleSpawn);
            cur_obj_play_sound_1(SOUND_ENV_STAR);
            if (o.rawData[oTimer] == 30) {
                o.rawData[oAction] = 2;
                o.rawData[oForwardVel] = 0;
                play_power_star_jingle(true);
            }
            break;

        case (2):
            if (o.rawData[oTimer] < 20)
                o.rawData[oVelY] = 20 - o.rawData[oTimer];
            else
                o.rawData[oVelY] = -10.0;

            spawn_object(o, MODEL_NONE, Object1.bhvSparkleSpawn);
            obj_move_xyz_using_fvel_and_yaw(o);
            o.rawData[oFaceAngleYaw] = o.rawData[oFaceAngleYaw] - o.rawData[oTimer] * 0x10 + 0x1000;
            cur_obj_play_sound_1(SOUND_ENV_STAR);

            if (o.rawData[oPosY] < o.rawData[oHomeY]) {
                cur_obj_play_sound_2(SOUND_GENERAL_STAR_APPEARS);
                cur_obj_become_tangible();
                o.rawData[oPosY] = o.rawData[oHomeY];
                o.rawData[oAction] = 3;
            }
            break;

        case (3):
            o.rawData[oFaceAngleYaw] += 0x800;
            if (o.rawData[oTimer] == 20) {
                gObjCutsceneDone = true;
                clear_time_stop_flags(TIME_STOP_ENABLED | TIME_STOP_MARIO_AND_DOORS);
                o.activeFlags &= ~ACTIVE_FLAG_INITIATED_TIME_STOP;
            }

            if (o.rawData[oInteractStatus] & INT_STATUS_INTERACTED) {
                mark_obj_for_deletion(o);
                o.rawData[oInteractStatus] = 0;
            }
            break;
    }
}

/// <pygml?v=1.0&h=5453a3c37>
/// @function	spawn_star(sp30, sp34, sp38, sp3C)
/// @param		{struct}	sp30
/// @param		{f32}		sp34
/// @param		{f32}		sp38
/// @param		{f32}		sp3C
/// @returns	struct
function spawn_star(sp30, sp34, sp38, sp3C) {
    var o = gCurrentObject;

    sp30 = spawn_object_abs_with_rot(o, 0, MODEL_STAR, Object1.bhvStarSpawnCoordinates, o.rawData[oPosX], o.rawData[oPosY],
        o.rawData[oPosZ], 0, 0, 0);
    sp30.rawData[oBehParams] = o.rawData[oBehParams];
    sp30.rawData[oHomeX] = sp34;
    sp30.rawData[oHomeY] = sp38;
    sp30.rawData[oHomeZ] = sp3C;
    sp30.rawData[oFaceAnglePitch] = 0;
    sp30.rawData[oFaceAngleRoll] = 0;
    return sp30;
}

/// <pygml?v=1.0&h=e547bab1d>
/// @function	spawn_default_star(sp20, sp24, sp28)
/// @param		{f32}		sp20
/// @param		{f32}		sp24
/// @param		{f32}		sp28
function spawn_default_star(sp20, sp24, sp28) {
    var sp1C;
    sp1C = spawn_star(sp1C, sp20, sp24, sp28);
    sp1C.rawData[oBehParams2ndByte] = 0;
}

/// <pygml?v=1.0&h=8bea993db>
/// @function	spawn_red_coin_cutscene_star(sp20, sp24, sp28)
/// @param		{f32}		sp20
/// @param		{f32}		sp24
/// @param		{f32}		sp28
function spawn_red_coin_cutscene_star(sp20, sp24, sp28) {
    var sp1C;
    sp1C = spawn_star(sp1C, sp20, sp24, sp28);
    sp1C.rawData[oBehParams2ndByte] = 1;
}

/// <pygml?v=1.0&h=f9ef4ee66>
/// @function	spawn_no_exit_star(sp20, sp24, sp28)
/// @param		{f32}		sp20
/// @param		{f32}		sp24
/// @param		{f32}		sp28
function spawn_no_exit_star(sp20, sp24, sp28) {
    var sp1C;
    sp1C = spawn_star(sp1C, sp20, sp24, sp28);
    sp1C.rawData[oBehParams2ndByte] = 1;
    sp1C.rawData[oInteractionSubtype] |= INT_SUBTYPE_NO_EXIT;
}

/// <pygml?v=1.0&h=da9c348d1>
/// @function	bhv_hidden_red_coin_star_init()
function bhv_hidden_red_coin_star_init() {
    var o = gCurrentObject;

    var sp36;
    var sp30;

    if (gCurrCourseNum != COURSE_JRB)
        spawn_object(o, MODEL_TRANSPARENT_STAR, Object1.bhvRedCoinStarMarker);

    sp36 = count_objects_with_behavior(Object1.bhvRedCoin);
    if (sp36 == 0) {
        sp30 =
            spawn_object_abs_with_rot(o, 0, MODEL_STAR, Object1.bhvStar, o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ], 0, 0, 0);
        sp30.rawData[oBehParams] = o.rawData[oBehParams];
        o.activeFlags = ACTIVE_FLAG_DEACTIVATED;
    }

    o.rawData[oHiddenStarTriggerCounter] = 8 - sp36;
}

/// <pygml?v=1.0&h=94de5efc3>
/// @function	bhv_hidden_red_coin_star_loop()
function bhv_hidden_red_coin_star_loop() {
    var o = gCurrentObject;

    gRedCoinsCollected = o.rawData[oHiddenStarTriggerCounter];
    switch (o.rawData[oAction]) {
        case (0):
            if (o.rawData[oHiddenStarTriggerCounter] == 8)
                o.rawData[oAction] = 1;
            break;

        case (1):
            if (o.rawData[oTimer] > 2) {
                spawn_red_coin_cutscene_star(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ]);
                spawn_mist_particles();
                o.activeFlags = ACTIVE_FLAG_DEACTIVATED;
            }
            break;
    }
}

/// <pygml?v=1.0&h=6cea218ec>
/// @function	bhv_celebration_star_init()
function bhv_celebration_star_init() {
    var o = gCurrentObject;

    o.rawData[oHomeX] = gMarioObject[0].header.gfx.pos[0];
    o.rawData[oPosY] = gMarioObject[0].header.gfx.pos[1] + 30.0;
    o.rawData[oHomeZ] = gMarioObject[0].header.gfx.pos[2];
    o.rawData[oMoveAngleYaw] = gMarioObject[0].header.gfx.angle[1] + 0x8000;
    o.rawData[oCelebStarDiameterOfRotation] = 100;
    if (gCurrLevelNum == LEVEL_BOWSER_1 || gCurrLevelNum == LEVEL_BOWSER_2) {
        o.header.gfx.sharedChild = gLoadedGraphNodes[MODEL_BOWSER_KEY];
        o.rawData[oFaceAnglePitch] = 0;
        o.rawData[oFaceAngleRoll] = 49152;
        cur_obj_scale(0.1);
        o.rawData[oCelebStarUnkF4] = 1;
    } else {
        o.header.gfx.sharedChild = gLoadedGraphNodes[MODEL_STAR];
        o.rawData[oFaceAnglePitch] = 0;
        o.rawData[oFaceAngleRoll] = 0;
        cur_obj_scale(0.4);
        o.rawData[oCelebStarUnkF4] = 0;
    }
}


/// <pygml?v=1.0&h=35d493609>
/// @function	celeb_star_act_spin_around_mario()
function celeb_star_act_spin_around_mario() {
    var o = gCurrentObject;

    o.rawData[oPosX] = o.rawData[oHomeX] + sins(o.rawData[oMoveAngleYaw]) * (o.rawData[oCelebStarDiameterOfRotation] / 2);
    o.rawData[oPosZ] = o.rawData[oHomeZ] + coss(o.rawData[oMoveAngleYaw]) * (o.rawData[oCelebStarDiameterOfRotation] / 2);
    o.rawData[oPosY] += 5.0;
    o.rawData[oFaceAngleYaw] += 0x1000;
    o.rawData[oMoveAngleYaw] += 0x2000;

    if (o.rawData[oTimer] == 40)
        o.rawData[oAction] = CELEB_STAR_ACT_FACE_CAMERA;
    if (o.rawData[oTimer] < 35) {
        spawn_object(o, MODEL_SPARKLES, Object1.bhvCelebrationStarSparkle);
        o.rawData[oCelebStarDiameterOfRotation]++;
    } else
        o.rawData[oCelebStarDiameterOfRotation] -= 20;
}


/// <pygml?v=1.0&h=674516964>
/// @function	celeb_star_act_face_camera()
function celeb_star_act_face_camera() {
    var o = gCurrentObject;


    if (o.rawData[oTimer] < 10) {
        if (o.rawData[oCelebStarUnkF4] == 0) {
            cur_obj_scale(o.rawData[oTimer] / 10.0);
        } else {
            cur_obj_scale(o.rawData[oTimer] / 30.0);
        }
        o.rawData[oFaceAngleYaw] += 0x1000;
    } else {
        o.rawData[oFaceAngleYaw] = gMarioObject[0].header.gfx.angle[1];
    }

    if (o.rawData[oTimer] == 59)
        o.activeFlags = ACTIVE_FLAG_DEACTIVATED;
}


/// <pygml?v=1.0&h=72dc854d0>
/// @function	bhv_celebration_star_loop()
function bhv_celebration_star_loop() {
    var o = gCurrentObject;

    switch (o.rawData[oAction]) {
        case (CELEB_STAR_ACT_SPIN_AROUND_MARIO):
            celeb_star_act_spin_around_mario();
            break;

        case (CELEB_STAR_ACT_FACE_CAMERA):
            celeb_star_act_face_camera();
            break;
    }
}


/// <pygml?v=1.0&h=157d0699b>
/// @function	bhv_celebration_star_sparkle_loop()
function bhv_celebration_star_sparkle_loop() {
    var o = gCurrentObject;

    o.rawData[oPosY] -= 15.0;

    if (o.rawData[oTimer] == 12)
        o.activeFlags = ACTIVE_FLAG_DEACTIVATED;
}


/// <pygml?v=1.0&h=a23bf39ba>
/// @function	bhv_star_key_collection_puff_spawner_loop()
function bhv_star_key_collection_puff_spawner_loop() {
    var o = gCurrentObject;

    spawn_mist_particles_variable(0, 10, 30.0);
    o.activeFlags = ACTIVE_FLAG_DEACTIVATED;
}

function star_macros_init() {
global.__sCollectStarHitbox = new Hitbox(
    /* interactType:      */ INTERACT_STAR_OR_KEY,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 0,
    /* health:            */ 0,
    /* numLootCoins:      */ 0,
    /* radius:            */ 80,
    /* height:            */ 50,
    /* hurtboxRadius:     */ 0,
    /* hurtboxHeight:     */ 0,
);

#macro sCollectStarHitbox	global.__sCollectStarHitbox	
}