function exclamation_box_bhv_init() {
	
	global.__sExclamationBoxContents = [
		new ExclamationBoxStruct( 0, 0, 0, MODEL_MARIOS_WING_CAP, sm64.bhvWingCap ),
		new ExclamationBoxStruct( 1, 0, 0, MODEL_MARIOS_METAL_CAP, sm64.bhvMetalCap ),
		new ExclamationBoxStruct( 2, 0, 0, MODEL_MARIOS_CAP, sm64.bhvVanishCap ),
		new ExclamationBoxStruct( 3, 0, 0, MODEL_KOOPA_SHELL, sm64.bhvKoopaShell ),
		new ExclamationBoxStruct( 4, 0, 0, MODEL_YELLOW_COIN, sm64.bhvSingleCoinGetsSpawned ),
		new ExclamationBoxStruct( 5, 0, 0, MODEL_NONE, sm64.bhvThreeCoinsSpawn ),
		new ExclamationBoxStruct( 6, 0, 0, MODEL_NONE, sm64.bhvTenCoinsSpawn ),
		new ExclamationBoxStruct( 7, 0, 0, MODEL_1UP, sm64.bhv1upWalking ),
		new ExclamationBoxStruct( 8, 0, 0, MODEL_STAR, sm64.bhvSpawnedStar ),
		new ExclamationBoxStruct( 9, 0, 0, MODEL_1UP, sm64.bhv1upRunningAway ),
		new ExclamationBoxStruct( 10, 0, 1, MODEL_STAR, sm64.bhvSpawnedStar ),
		new ExclamationBoxStruct( 11, 0, 2, MODEL_STAR, sm64.bhvSpawnedStar ),
		new ExclamationBoxStruct( 12, 0, 3, MODEL_STAR, sm64.bhvSpawnedStar ),
		new ExclamationBoxStruct( 13, 0, 4, MODEL_STAR, sm64.bhvSpawnedStar ),
		new ExclamationBoxStruct( 14, 0, 5, MODEL_STAR, sm64.bhvSpawnedStar ),
		new ExclamationBoxStruct( 99, 0, 0, 0, null ),
	];
	
	#macro sExclamationBoxContents	global.__sExclamationBoxContents	
	
	global.__sExclamationBoxActions = [
		exclamation_box_act_0,
		exclamation_box_act_1,
		exclamation_box_act_2,
		exclamation_box_act_3,
		exclamation_box_act_4,
		exclamation_box_act_5	
	];
	
	#macro sExclamationBoxActions	global.__sExclamationBoxActions
}


/// <pygml?v=1.0&h=d7ef105be>
/// @function	bhv_rotating_exclamation_box_loop()
function bhv_rotating_exclamation_box_loop() {
    var o = gCurrentObject;
    if (o.parentObj.rawData[oAction] != 1)
        obj_mark_for_deletion(o);
}

/// <pygml?v=1.0&h=f2b77280e>
/// @function	exclamation_box_act_0()
function exclamation_box_act_0() {
    var o = gCurrentObject;

    if (o.rawData[oBehParams2ndByte] < 3) {
        o.rawData[oAnimState] = o.rawData[oBehParams2ndByte];
        if ((save_file_get_flags() & D_8032F0C0[o.rawData[oBehParams2ndByte]]) ||
            ((o.rawData[oBehParams] >> 24) & 0xFF) != 0)
            o.rawData[oAction] = 2;
        else
            o.rawData[oAction] = 1;
    } else {
        o.rawData[oAnimState] = 3;
        o.rawData[oAction] = 2;
    }
}

/// <pygml?v=1.0&h=b1f3c97d7>
/// @function	exclamation_box_act_1()
function exclamation_box_act_1() {
    var o = gCurrentObject;

    cur_obj_become_intangible();
    if (o.rawData[oTimer] == 0) {
        spawn_object(o, MODEL_EXCLAMATION_POINT, bhvRotatingExclamationMark);
        cur_obj_set_model(MODEL_EXCLAMATION_BOX_OUTLINE);
    }
    if ((save_file_get_flags() & D_8032F0C0[o.rawData[oBehParams2ndByte]]) ||
        ((o.rawData[oBehParams] >> 24) & 0xFF) != 0) {
        o.rawData[oAction] = 2;
        cur_obj_set_model(MODEL_EXCLAMATION_BOX);
    }
}

/// <pygml?v=1.0&h=ec1c896d9>
/// @function	exclamation_box_act_2()
function exclamation_box_act_2() {
    var o = gCurrentObject;

    obj_set_hitbox(o, sExclamationBoxHitbox);
    if (o.rawData[oTimer] == 0) {
        cur_obj_unhide();
        cur_obj_become_tangible();
        o.rawData[oInteractStatus] = 0;
        o.rawData[oPosY] = o.rawData[oHomeY];
        o.rawData[oGraphYOffset] = 0.0;
    }
    if (cur_obj_was_attacked_or_ground_pounded()) {
        cur_obj_become_intangible();
        o.rawData[oExclamationBoxUnkFC] = 0x4000;
        o.rawData[oVelY] = 30.0;
        o.rawData[oGravity] = -8.0;
        o.rawData[oFloorHeight] = o.rawData[oPosY];
        o.rawData[oAction] = 3;
    }
    load_object_collision_model();
}

/// <pygml?v=1.0&h=cf81a14e0>
/// @function	exclamation_box_act_3()
function exclamation_box_act_3() {
    var o = gCurrentObject;

    var unused;
    cur_obj_move_using_fvel_and_gravity();
    if (o.rawData[oVelY] < 0.0) {
        o.rawData[oVelY] = 0.0;
        o.rawData[oGravity] = 0.0;
    }
    o.rawData[oExclamationBoxUnkF8] = (sins(o.rawData[oExclamationBoxUnkFC]) + 1.0) * 0.3 + 0.0;
    o.rawData[oExclamationBoxUnkF4] = (-sins(o.rawData[oExclamationBoxUnkFC]) + 1.0) * 0.5 + 1.0;
    o.rawData[oGraphYOffset] = (-sins(o.rawData[oExclamationBoxUnkFC]) + 1.0) * 26.0;
    o.rawData[oExclamationBoxUnkFC] += 0x1000;
    o.header.gfx.scale[0] = o.rawData[oExclamationBoxUnkF4] * 2.0;
    o.header.gfx.scale[1] = o.rawData[oExclamationBoxUnkF8] * 2.0;
    o.header.gfx.scale[2] = o.rawData[oExclamationBoxUnkF4] * 2.0;
    if (o.rawData[oTimer] == 7)
        o.rawData[oAction] = 4;
}

/// <pygml?v=1.0&h=52b3fbc75>
/// @function	exclamation_box_spawn_contents(a0, a1)
/// @param		{struct}	a0
/// @param		{u8}		a1
function exclamation_box_spawn_contents(a0, a1) {
    var o = gCurrentObject;

    var sp1C = null;

    while (a0.unk0 != 99) {
        if (a1 == a0.unk0) {
            sp1C = spawn_object(o, a0.model, a0.behavior);
            sp1C.rawData[oVelY] = 20.0;
            sp1C.rawData[oForwardVel] = 3.0;
            sp1C.rawData[oMoveAngleYaw] = gMarioObject[0].rawData[oMoveAngleYaw];
            o.rawData[oBehParams] |= a0.unk2 << 24;
            if (a0.model == 122)
                o.rawData[oFlags] |= 0x4000;
            break;
        }
        a0++;
    }
}

/// <pygml?v=1.0&h=2e3cc4eed>
/// @function	exclamation_box_act_4()
function exclamation_box_act_4() {
    var o = gCurrentObject;

    exclamation_box_spawn_contents(sExclamationBoxContents, o.rawData[oBehParams2ndByte]);
    spawn_mist_particles_variable(0, 0, 46.0);
    spawn_triangle_break_particles(20, 139, 0.3, o.rawData[oAnimState]);
    create_sound_spawner(SOUND_GENERAL_BREAK_BOX);
    if (o.rawData[oBehParams2ndByte] < 3) {
        o.rawData[oAction] = 5;
        cur_obj_hide();
    } else
        obj_mark_for_deletion(o);
}

/// <pygml?v=1.0&h=d8e72adfe>
/// @function	exclamation_box_act_5()
function exclamation_box_act_5() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] > 300)
        o.rawData[oAction] = 2;
}


/// <pygml?v=1.0&h=19f0d23d3>
/// @function	bhv_exclamation_box_loop()
function bhv_exclamation_box_loop() {
    cur_obj_scale(2.0);
    cur_obj_call_action_function(sExclamationBoxActions);
}

function ExclamationBoxStruct(_unk0, _unk1, _unk2, _model, _behavior) constructor {
    unk0 = _unk0;
    unk1 = _unk1;
    unk2 = _unk2;
    model = _model;
    behavior = _behavior;
}

function exclamation_box_macros_init() {
global.__sExclamationBoxHitbox = new Hitbox(
    /* interactType: */ INTERACT_BREAKABLE,
    /* downOffset: */ 5,
    /* damageOrCoinValue: */ 0,
    /* health: */ 1,
    /* numLootCoins: */ 0,
    /* radius: */ 40,
    /* height: */ 30,
    /* hurtboxRadius: */ 40,
    /* hurtboxHeight: */ 30,
);

#macro sExclamationBoxHitbox global.__sExclamationBoxHitbox	
}