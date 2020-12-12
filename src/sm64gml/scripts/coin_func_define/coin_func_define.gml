/// <pygml?v=1.0&h=528c18a98>
/// @function	bhv_coin_sparkles_init()
/// @returns	s32
function bhv_coin_sparkles_init() {
    var o = gCurrentObject;

    if (o.rawData[oInteractStatus] & INT_STATUS_INTERACTED && !(o.rawData[oInteractStatus] & INT_STATUS_TOUCHED_BOB_OMB)) {
        spawn_object(o, MODEL_SPARKLES, Object1.bhvGoldenCoinSparkles);
        obj_mark_for_deletion(o);
        return 1;
    }
    o.rawData[oInteractStatus] = 0;
    return 0;
}

/// <pygml?v=1.0&h=611045750>
/// @function	bhv_yellow_coin_init()
function bhv_yellow_coin_init() {
    var o = gCurrentObject;

    cur_obj_set_behavior(Object1.bhvYellowCoin);
    obj_set_hitbox(o, sYellowCoinHitbox);
    bhv_init_room();
    cur_obj_update_floor_height();
    if (500.0 < abs(o.rawData[oPosY] - o.rawData[oFloorHeight]))
        cur_obj_set_model(MODEL_YELLOW_COIN_NO_SHADOW);
    if (o.rawData[oFloorHeight] < -10000.0)
        obj_mark_for_deletion(o);

}

/// <pygml?v=1.0&h=1c2eff929>
/// @function	bhv_yellow_coin_loop()
function bhv_yellow_coin_loop() {
    var o = gCurrentObject;

    bhv_coin_sparkles_init();
    o.rawData[oAnimState]++;
}

/// <pygml?v=1.0&h=4b56204f5>
/// @function	bhv_temp_coin_loop()
function bhv_temp_coin_loop() {
    var o = gCurrentObject;

    o.rawData[oAnimState]++;
    if (cur_obj_wait_then_blink(200, 20))
        obj_mark_for_deletion(o);
    bhv_coin_sparkles_init();
}

/// <pygml?v=1.0&h=f810e0b8d>
/// @function	bhv_coin_init()
function bhv_coin_init() {
    var o = gCurrentObject;

    o.rawData[oVelY] = random_float() * 10.0 + 30 + o.rawData[oCoinUnk110];
    o.rawData[oForwardVel] = random_float() * 10.0;
    o.rawData[oMoveAngleYaw] = random_u16();
    cur_obj_set_behavior(Object1.bhvYellowCoin);
    obj_set_hitbox(o, sYellowCoinHitbox);
    cur_obj_become_intangible();
	
}

/// <pygml?v=1.0&h=14b34e332>
/// @function	bhv_coin_loop()
function bhv_coin_loop() {
    var o = gCurrentObject;
	//log("coin loop");

    var sp1C;
    var sp1A;
    cur_obj_update_floor_and_walls();
    cur_obj_if_hit_wall_bounce_away();
    cur_obj_move_standard(-62);
	sp1C = o.rawData[oFloor];
    if (sp1C != null) {
        if (o.rawData[oMoveFlags] & OBJ_MOVE_ON_GROUND)
            o.rawData[oSubAction] = 1;
        if (o.rawData[oSubAction] == 1) {
            o.rawData[oBounciness] = 0;
            if (sp1C.normal.y < 0.9) {
                sp1A = atan2s(sp1C.normal.z, sp1C.normal.x);
                cur_obj_rotate_yaw_toward(sp1A, 0x400);
            }
        }
    }
    if (o.rawData[oTimer] == 0)
        cur_obj_play_sound_2(SOUND_GENERAL_COIN_SPURT_2);
    if (o.rawData[oVelY] < 0)
        cur_obj_become_tangible();
    if (o.rawData[oMoveFlags] & OBJ_MOVE_LANDED) {
        if (o.rawData[oMoveFlags] & (OBJ_MOVE_ABOVE_DEATH_BARRIER | OBJ_MOVE_ABOVE_LAVA))
            obj_mark_for_deletion(o);
    }
    if (o.rawData[oMoveFlags] & OBJ_MOVE_BOUNCE) {
        if (o.rawData[oCoinUnk1B0] < 5)
            cur_obj_play_sound_2(0x30364081);
        o.rawData[oCoinUnk1B0]++;
    }
    if (cur_obj_wait_then_blink(400, 200)) // @z 400, 20
        obj_mark_for_deletion(o);
    bhv_coin_sparkles_init();
}

/// <pygml?v=1.0&h=d4f997390>
/// @function	bhv_coin_formation_spawn_loop()
function bhv_coin_formation_spawn_loop() {
    var o = gCurrentObject;
	
	//log("formation");

    if (o.rawData[oTimer] == 0) {
        cur_obj_set_behavior(Object1.bhvYellowCoin);
        obj_set_hitbox(o, sYellowCoinHitbox);
        bhv_init_room();
        if (o.rawData[oCoinUnkF8]) {
            o.rawData[oPosY] += 300.0;
            cur_obj_update_floor_height();
            if (o.rawData[oPosY] < o.rawData[oFloorHeight] || o.rawData[oFloorHeight] < -10000.0)
                obj_mark_for_deletion(o);
            else
                o.rawData[oPosY] = o.rawData[oFloorHeight];
        } else {
            cur_obj_update_floor_height();
            if (abs(o.rawData[oPosY] - o.rawData[oFloorHeight]) > 250.0)
                cur_obj_set_model(MODEL_YELLOW_COIN_NO_SHADOW);
        }
    } else {
        if (bhv_coin_sparkles_init())
            o.parentObj.rawData[oCoinUnkF4] |= bit_shift_left(o.rawData[oBehParams2ndByte]);
        o.rawData[oAnimState]++;
    }
    if (o.parentObj.rawData[oAction] == 2)
        obj_mark_for_deletion(o);
}

/// <pygml?v=1.0&h=44d7bc741>
/// @function	spawn_coin_in_formation(sp50, sp54)
/// @param		{s32}		sp50
/// @param		{s32}		sp54
function spawn_coin_in_formation(sp50, sp54) {
	
    var o = gCurrentObject;
	
    var sp4C;
    var sp40 = Vec3;
    var sp3C = 1;
    var sp38 = 1;
    var unused;
    sp40[2] = 0;
	sp40[1] = 0;
    sp40[0] = 0;
	
    switch (sp54 & 7) {
        case (0):
            sp40[2] = 160 * (sp50 - 2);
            if (sp50 > 4)
                sp3C = 0;
            break;
        case (1):
            sp38 = 0;
            sp40[1] = 160 * sp50 * 0.8; // 128 * sp50
            if (sp50 > 4)
                sp3C = 0;
            break;
        case (2):
            sp40[0] = sins(sp50 << 13) * 300.0;
            sp40[2] = coss(sp50 << 13) * 300.0;
            break;
        case (3):
            sp38 = 0;
            sp40[0] = coss(sp50 << 13) * 200.0;
            sp40[1] = sins(sp50 << 13) * 200.0 + 200.0;
            break;
        case (4):
            sp40[0] = D_8032F2A4[sp50][0];
            sp40[2] = D_8032F2A4[sp50][1];
            break;
    }
    if (sp54 & 0x10)
        sp38 = 0;
    if (sp3C) {
		//log(sp40);
        sp4C = spawn_object_relative(sp50, sp40[0], sp40[1], sp40[2], o, MODEL_YELLOW_COIN,
            Object1.bhvCoinFormationSpawn);
        sp4C.rawData[oCoinUnkF8] = sp38;
    }
}

/// <pygml?v=1.0&h=1eef8ffea>
/// @function	bhv_coin_formation_init()
function bhv_coin_formation_init() {
    var o = gCurrentObject;

    o.rawData[oCoinUnkF4] = (o.rawData[oBehParams] >> 8) & 0xFF;
}

/// <pygml?v=1.0&h=e5a8e7ae7>
/// @function	bhv_coin_formation_loop()
function bhv_coin_formation_loop() {
    var o = gCurrentObject;

    var bitIndex;
    switch (o.rawData[oAction]) {
        case (0):
            if (o.rawData[oDistanceToMario] < 2000.0) {
                for (bitIndex = 0; bitIndex < 8; bitIndex++) {
                    if (!(o.rawData[oCoinUnkF4] & (1 << bitIndex)))
                        spawn_coin_in_formation(bitIndex, o.rawData[oBehParams2ndByte]);
                }
                o.rawData[oAction]++;
            }
            break;
        case (1):
            if (o.rawData[oDistanceToMario] > 2100.0)
                o.rawData[oAction]++;
            break;
        case (2):
            o.rawData[oAction] = 0;
            break;
    }

    // Casting to var doesn't seem to match
    set_object_respawn_info_bits(o, o.rawData[oCoinUnkF4] & 0xFF);
}

/// <pygml?v=1.0&h=cf7f95249>
/// @function	coin_inside_boo_act_1()
function coin_inside_boo_act_1() {
    var o = gCurrentObject;

    cur_obj_update_floor_and_walls();
    cur_obj_if_hit_wall_bounce_away();
    if (o.rawData[oMoveFlags] & OBJ_MOVE_BOUNCE)
        cur_obj_play_sound_2(SOUND_GENERAL_COIN_DROP);
    if (o.rawData[oTimer] > 90 || (o.rawData[oMoveFlags] & OBJ_MOVE_LANDED)) {
        obj_set_hitbox(o, sYellowCoinHitbox);
        cur_obj_become_tangible();
        cur_obj_set_behavior(Object1.bhvYellowCoin);
	}
    cur_obj_move_standard(-30);
    bhv_coin_sparkles_init();
    if (cur_obj_has_model(MODEL_BLUE_COIN))
        o.rawData[oDamageOrCoinValue] = 5;
    if (cur_obj_wait_then_blink(400, 20))
        obj_mark_for_deletion(o);
}


/// <pygml?v=1.0&h=352172f97>
/// @function	coin_inside_boo_act_0()
function coin_inside_boo_act_0() {
    var o = gCurrentObject;

    var sp26;
    var sp20;
    var parent = o.parentObj;
    cur_obj_become_intangible();
    if (o.rawData[oTimer] == 0 && gCurrLevelNum == LEVEL_BBH) {
        cur_obj_set_model(MODEL_BLUE_COIN);
        cur_obj_scale(0.7);
	}
    obj_copy_pos(o, parent);
    if (parent.rawData[oBooDeathStatus] == BOO_DEATH_STATUS_DYING) {
        o.rawData[oAction] = 1;
        sp26 = gMarioObject[0].rawData[oMoveAngleYaw];
        sp20 = 3.0;
        o.rawData[oVelX] = sins(sp26) * sp20;
        o.rawData[oVelZ] = coss(sp26) * sp20;
        o.rawData[oVelY] = 35.0;
    }
}

/// <pygml?v=1.0&h=a07d5ffe2>
/// @function	bhv_coin_inside_boo_loop()
function bhv_coin_inside_boo_loop() {
    cur_obj_call_action_function(sCoinInsideBooActions);
}

/// <pygml?v=1.0&h=fb317f0a5>
/// @function	bhv_coin_sparkles_loop()
function bhv_coin_sparkles_loop() {
    cur_obj_scale(0.6);
}

/// <pygml?v=1.0&h=136606a8a>
/// @function	bhv_golden_coin_sparkles_loop()
function bhv_golden_coin_sparkles_loop() {
	
    var o = gCurrentObject;
	
    var sp2C;
    var unused;
    var sp24 = 30.0;
    sp2C = spawn_object(o, MODEL_SPARKLES, Object1.bhvCoinSparkles);
    sp2C.rawData[oPosX] += random_float() * sp24 - sp24 / 2;
    sp2C.rawData[oPosZ] += random_float() * sp24 - sp24 / 2;
}

/// <pygml?v=1.0&h=640c69c72>
/// @function	bhv_red_coin_init()
/// @desc		Red coin initialization function. Sets the coin's hitbox and
///					parent object.
function bhv_red_coin_init() {
    var o = gCurrentObject;

    // This _floor and _floor height are unused. Perhaps for orange number spawns originally?
    var dummyFloor = {}
    var floorHeight = find_floor(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ], dummyFloor);
	dummyFloor = dummyFloor._floor;

    var hiddenRedCoinStar;

    // Set the red coins to have a parent of the closest red coin star.
    //hiddenRedCoinStar = cur_obj_nearest_object_with_behavior(bhvHiddenRedCoinStar);
    //if (hiddenRedCoinStar != null)
    //    o.parentObj = hiddenRedCoinStar;
    //else {
    //    hiddenRedCoinStar = cur_obj_nearest_object_with_behavior(bhvBowserCourseRedCoinStar);
    //    if (hiddenRedCoinStar != null) {
    //        o.parentObj = hiddenRedCoinStar;
    //    } else {
    //        o.parentObj = null;
    //    }
    //} // @z

    obj_set_hitbox(o, sRedCoinHitbox);
}

/// <pygml?v=1.0&h=daa43b171>
/// @function	bhv_red_coin_loop()
/// @desc		Main behavior for red coins. Primarily controls coin
///					collection noise and spawning  the orange number counter.
function bhv_red_coin_loop() {
    var o = gCurrentObject;

    // If Mario interacted with the object...
    if (o.rawData[oInteractStatus] & INT_STATUS_INTERACTED) {
        // ...and there is a red coin star in the level...
        if (o.parentObj != null) {
            // ...increment the star's counter.
            o.parentObj.rawData[oHiddenStarTriggerCounter]++;

            // For JP version, play an identical sound for all coins.
            // Spawn the orange number counter, as long as it isn't the last coin.
            if (o.parentObj.rawData[oHiddenStarTriggerCounter] != 8) {
                spawn_orange_number(o.parentObj.rawData[oHiddenStarTriggerCounter], 0, 0, 0);
            }

            // On all versions but the JP version, each coin collected plays a higher noise.
            play_sound(SOUND_MENU_COLLECT_RED_COIN +
                ((o.parentObj.rawData[oHiddenStarTriggerCounter] - 1) << 16),
                gDefaultSoundArgs);
        }

        coin_collected();
        // Despawn the coin.
        o.rawData[oInteractStatus] = 0;
    }
}

/// <pygml?v=1.0&h=4cb016de4>
/// @function	coin_collected()
function coin_collected() {
    var o = gCurrentObject;
    spawn_object(o, MODEL_SPARKLES, Object1.bhvGoldenCoinSparkles);
    o.activeFlags = ACTIVE_FLAG_DEACTIVATED;
}


/// <pygml?v=1.0&h=98f453efe>
/// @function	bhv_hidden_blue_coin_loop()
/// @desc		Update function for bhvHiddenBlueCoin.
function bhv_hidden_blue_coin_loop() {
    var o = gCurrentObject;

    var blueCoinSwitch;

    switch (o.rawData[oAction]) {
        case (HIDDEN_BLUE_COIN_ACT_INACTIVE):
            // Become invisible and intangible
            cur_obj_disable_rendering();
            cur_obj_become_intangible();

            // Set action to HIDDEN_BLUE_COIN_ACT_WAITING after the blue coin switch is found.
            o.rawData[oHiddenBlueCoinSwitch] = cur_obj_nearest_object_with_behavior(Object1.bhvBlueCoinSwitch);
			
			//log("Nearest: " + string(o.rawData[oHiddenBlueCoinSwitch]))

            if (o.rawData[oHiddenBlueCoinSwitch] != null) {
                o.rawData[oAction]++;
            }

            break;
        case (HIDDEN_BLUE_COIN_ACT_WAITING):
            // Wait until the blue coin switch starts ticking to activate.
            blueCoinSwitch = o.rawData[oHiddenBlueCoinSwitch];

            if (blueCoinSwitch.rawData[oAction] == BLUE_COIN_SWITCH_ACT_TICKING) {
                o.rawData[oAction]++; // Set to HIDDEN_BLUE_COIN_ACT_ACTIVE
            }

            break;
        case (HIDDEN_BLUE_COIN_ACT_ACTIVE):
		
            // Become tangible
            cur_obj_enable_rendering();
            cur_obj_become_tangible();

            // Delete the coin once collected
            if (o.rawData[oInteractStatus] & INT_STATUS_INTERACTED) {
                spawn_object(o, MODEL_SPARKLES, Object1.bhvGoldenCoinSparkles);
                obj_mark_for_deletion(o);
            }

            // After 200 frames of waiting and 20 2-frame blinks (for 240 frames total),
            // delete the object.
            if (cur_obj_wait_then_blink(200, 20)) {
                obj_mark_for_deletion(o);
            }

            break;
    }

    o.rawData[oInteractStatus] = 0;
}

function coin_macros_init() {
global.__sCoinInsideBooActions = [coin_inside_boo_act_0, coin_inside_boo_act_1];
#macro sCoinInsideBooActions	global.__sCoinInsideBooActions

global.__sYellowCoinHitbox = new Hitbox(
    /* interactType: */ INTERACT_COIN,
    /* downOffset: */ 0,
    /* damageOrCoinValue: */ 1,
    /* health: */ 0,
    /* numLootCoins: */ 0,
    /* radius: */ 100,
    /* height: */ 64,
    /* hurtboxRadius: */ 0,
    /* hurtboxHeight: */ 0,
);
#macro sYellowCoinHitbox	global.__sYellowCoinHitbox

/**
 * Red coin's hitbox details.
 */
global.__RedCoinHitbox = new Hitbox(
    /* interactType:      */ INTERACT_COIN,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 2,
    /* health:            */ 0,
    /* numLootCoins:      */ 0,
    /* radius:            */ 100,
    /* height:            */ 64,
    /* hurtboxRadius:     */ 0,
    /* hurtboxHeight:     */ 0,
);

#macro sRedCoinHitbox	global.__RedCoinHitbox

global.__D_8032F2A4 = [
	[ 0, -150 ],  [ 0, -50 ],   [ 0, 50 ],   [  0, 150 ],
	[ -50, 100 ], [ -100, 50 ], [ 50, 100 ], [  100, 50 ]
];

#macro D_8032F2A4	global.__D_8032F2A4	
}

