// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function bobomb_macros_init() {
	global.__sBobombHitbox = new Hitbox(
	    /* interactType:      */ INTERACT_GRABBABLE,
	    /* downOffset:        */ 0,
	    /* damageOrCoinValue: */ 0,
	    /* health:            */ 0,
	    /* numLootCoins:      */ 0,
	    /* radius:            */ 65,
	    /* height:            */ 113,
	    /* hurtboxRadius:     */ 0,
	    /* hurtboxHeight:     */ 0,
	);
	#macro sBobombHitbox	global.__sBobombHitbox	
}

function bhv_bobomb_init() {
	
	var o = gCurrentObject;
	
    o.rawData[oGravity] = 2.5;
    o.rawData[oFriction] = 0.8;
    o.rawData[oBuoyancy] = 1.3;
    o.rawData[oInteractionSubtype] = INT_SUBTYPE_KICKABLE;	
	
}

function bhv_bobomb_buddy_init() {
	
	var o = gCurrentObject;

    o.rawData[oGravity] = 2.5;
    o.rawData[oFriction] = 0.8;
    o.rawData[oBuoyancy] = 1.3;
    o.rawData[oInteractionSubtype] = INT_SUBTYPE_KICKABLE;	
	
	
}

function bhv_bobomb_loop() {
	
		var o = gCurrentObject;

  var dustPeriodMinus1;
    if (is_point_within_radius_of_mario(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ], 4000) != 0) {
        switch (o.rawData[oHeldState]) {
            case HELD_FREE:
                bobomb_free_loop();
                break;

            case HELD_HELD:
                bobomb_held_loop();
                break;

            case HELD_THROWN:
                bobomb_thrown_loop();
                break;

            case HELD_DROPPED:
                bobomb_dropped_loop();
                break;
        }

        curr_obj_random_blink(o.rawData[oBobombBlinkTimer]);

        if (o.rawData[oBobombFuseLit] == 1) {
            if (o.rawData[oBobombFuseTimer] >= 121)
                dustPeriodMinus1 = 1;
            else
                dustPeriodMinus1 = 7;

            //if ((dustPeriodMinus1 & o.rawData[oBobombFuseTimer]) == 0) /* oBobombFuseTimer % 2 or oBobombFuseTimer % 8 */
                //spawn_object(o, MODEL_SMOKE, bhvBobombFuseSmoke);

            cur_obj_play_sound_1(-1);

            o.rawData[oBobombFuseTimer]++;
        }
    }	
}

function bobomb_free_loop() {
	var o = gCurrentObject;

    if (o.rawData[oBehParams2ndByte] == BOBOMB_BP_STYPE_GENERIC)
        generic_bobomb_free_loop();
    else
        stationary_bobomb_free_loop();
}

function bobomb_act_patrol(void) {
	var o = gCurrentObject;
    var collisionFlags;

    var sp22 = o.header.gfx.unk38.animFrame;
    o.rawData[oForwardVel] = 5.0;

    collisionFlags = object_step();
    if ((obj_return_home_if_safe(o, o.rawData[oHomeX], o.rawData[oHomeY], o.rawData[oHomeZ], 400) == 1)
        && (obj_check_if_facing_toward_angle(o.rawData[oMoveAngleYaw], o.rawData[oAngleToMario], 0x2000) == 1)) {
        o.rawData[oBobombFuseLit] = 1;
        o.rawData[oAction] = BOBOMB_ACT_CHASE_MARIO;
    }
    obj_check_floor_death(collisionFlags, sObjFloor);
}


function generic_bobomb_free_loop(void) {

	var o = gCurrentObject;
	
    switch (o.rawData[oAction]) {
        case BOBOMB_ACT_PATROL:
            bobomb_act_patrol();
            break;

        case BOBOMB_ACT_LAUNCHED:
            bobomb_act_launched();
            break;

        case BOBOMB_ACT_CHASE_MARIO:
            bobomb_act_chase_mario();
            break;

        case BOBOMB_ACT_EXPLODE:
            bobomb_act_explode();
            break;

        case BOBOMB_ACT_LAVA_DEATH:
            if (obj_lava_death() == 1)
                create_respawner(MODEL_BLACK_BOBOMB, bhvBobomb, 3000);
            break;

        case BOBOMB_ACT_DEATH_PLANE_DEATH:
            o.activeFlags = ACTIVE_FLAG_DEACTIVATED;
            create_respawner(MODEL_BLACK_BOBOMB, bhvBobomb, 3000);
            break;
    }

    bobomb_check_interactions();

    if (o.rawData[oBobombFuseTimer] >= 151)
        o.rawData[oAction] = 3;
}

function bobomb_check_interactions(void) {
	
	var o = gCurrentObject;
	
    obj_set_hitbox(o, sBobombHitbox);
    if ((o.rawData[oInteractStatus] & INT_STATUS_INTERACTED) != 0) {
        if ((o.rawData[oInteractStatus] & INT_STATUS_MARIO_UNK1) != 0) {
            o.rawData[oMoveAngleYaw] = gMarioObject[0].header.gfx.angle[1];
            o.rawData[oForwardVel] = 25.0;
            o.rawData[oVelY] = 30.0;
            o.rawData[oAction] = BOBOMB_ACT_LAUNCHED;
        }

        if ((o.rawData[oInteractStatus] & INT_STATUS_TOUCHED_BOB_OMB) != 0) {
            o.rawData[oAction] = BOBOMB_ACT_EXPLODE;
		}

        o.rawData[oInteractStatus] = 0;
    }

    if (obj_attack_collided_from_other_object(o) == 1)
        o.rawData[oAction] = BOBOMB_ACT_EXPLODE;
}

function bobomb_act_chase_mario() {
	
	
	var o = gCurrentObject;
    var sp1a, collisionFlags;

    sp1a = o.header.gfx.unk38.animFrame++;
    o.rawData[oForwardVel] = 20.0;

    collisionFlags = object_step();

    if (sp1a == 5 || sp1a == 16)
        cur_obj_play_sound_2(-1);

    obj_turn_toward_object(o, gMarioObject[0], 16, 0x800);
    obj_check_floor_death(collisionFlags, sObjFloor);
}

function bobomb_act_launched(void) {
	
	var o = gCurrentObject;
	
    var collisionFlags = 0;
    collisionFlags = object_step();
    if ((collisionFlags & OBJ_COL_FLAG_GROUNDED) == OBJ_COL_FLAG_GROUNDED)
        o.rawData[oAction] = BOBOMB_ACT_EXPLODE; /* bit 0 */
}

/// <pygml?v=1.0&h=13707486f>
/// @function	curr_obj_random_blink(Ptr.p_blinkTimer)
/// @param		{s32}		Ptr.p_blinkTimer
function curr_obj_random_blink(blinkTimer) {
    var o = gCurrentObject;

    if (blinkTimer == 0) {
        if ((random_float() * 100.0) == 0) {
            o.rawData[oAnimState] = 1;
            blinkTimer = 1;
        }
    } else {
        (blinkTimer) ++;
        if (blinkTimer >= 6)
            o.rawData[oAnimState] = 0;
        if (blinkTimer >= 11)
            o.rawData[oAnimState] = 1;
        if (blinkTimer >= 16) {
            o.rawData[oAnimState] = 0;
            blinkTimer = 0;
        }
    }

    Ptr.p_blinkTimer = blinkTimer;
}



function bobomb_buddy_act_idle() {
	
	var o = gCurrentObject;
	
    var sp1a = o.header.gfx.unk38.animFrame;

    o.rawData[oBobombBuddyPosXCopy] = o.rawData[oPosX];
    o.rawData[oBobombBuddyPosYCopy] = o.rawData[oPosY];
    o.rawData[oBobombBuddyPosZCopy] = o.rawData[oPosZ];

    var collisionFlags = object_step();

    if ((sp1a == 5) || (sp1a == 16))
        cur_obj_play_sound_2(-1);

    if (o.rawData[oDistanceToMario] < 1000.0)
        o.rawData[oMoveAngleYaw ]= approach_s16_symmetric(o.rawData[oMoveAngleYaw], o.rawData[oAngleToMario], 0x140);

    if (o.rawData[oInteractStatus] == INT_STATUS_INTERACTED)
        o.rawData[oAction] = BOBOMB_BUDDY_ACT_TURN_TO_TALK;
}

function bhv_bobomb_buddy_loop() {
	
	var o = gCurrentObject;
	
    bobomb_buddy_actions();

    curr_obj_random_blink(o.rawData[oBobombBuddyBlinkTimer]);
	o.rawData[oBobombBuddyBlinkTimer] = Ptr.p_blinkTimer;
	
    o.rawData[oInteractStatus] = 0;
}

function bobomb_buddy_actions(void) {
	
	var o = gCurrentObject;

    switch (o.rawData[oAction]) {
        case BOBOMB_BUDDY_ACT_IDLE:
            bobomb_buddy_act_idle();
            break;

        case BOBOMB_BUDDY_ACT_TURN_TO_TALK:
            bobomb_buddy_act_turn_to_talk();
            break;

        case BOBOMB_BUDDY_ACT_TALK:
            bobomb_buddy_act_talk();
            break;
    }

    set_object_visibility(o, 3000);
	
	//log(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ]);
}
