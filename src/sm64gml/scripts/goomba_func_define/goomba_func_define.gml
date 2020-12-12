/// <pygml?v=1.0&h=85e8830ca>
/// @function	bhv_goomba_init()
/// @desc		Initialization function for goomba.
function bhv_goomba_init() {
    var o = gCurrentObject;

    o.rawData[oGoombaSize] = o.rawData[oBehParams2ndByte] & GOOMBA_BP_SIZE_MASK;

    o.rawData[oGoombaScale] = sGoombaProperties[o.rawData[oGoombaSize]].scale;
    o.rawData[oDeathSound] = sGoombaProperties[o.rawData[oGoombaSize]].deathSound;

    obj_set_hitbox(o, sGoombaHitbox);

    o.rawData[oDrawingDistance] = sGoombaProperties[o.rawData[oGoombaSize]].drawDistance;
    o.rawData[oDamageOrCoinValue] = sGoombaProperties[o.rawData[oGoombaSize]].damage;

    o.rawData[oGravity] = -8.0 / 3.0 * o.rawData[oGoombaScale];
}


function GoombaProperties(_scale, _deathSound, _drawDistance, _damage) constructor {
	scale = _scale;
	deathSound = _deathSound;
	drawDistance = _drawDistance;
	damage = _damage;
}

/// <pygml?v=1.0&h=3b2f76e94>
/// @function	bhv_goomba_triplet_spawner_update()
/// @desc		Update function for goomba triplet spawner.
function bhv_goomba_triplet_spawner_update() {
    var o = gCurrentObject;

    var unused1;
    var goombaFlag;
    var unused2;
    var angle;
    var dAngle;
    var dx;
    var dz;

    // If mario is close enough and the goombas aren't currently loaded, then
    // spawn them
    if (o.rawData[oAction] == GOOMBA_TRIPLET_SPAWNER_ACT_UNLOADED) {
        if (o.rawData[oDistanceToMario] < 3000.0) {
            // The spawner is capable of spawning more than 3 goombas, but this
            // is not used in the game
            dAngle =
                0x10000 /
                (((o.rawData[oBehParams2ndByte] & GOOMBA_TRIPLET_SPAWNER_BP_EXTRA_GOOMBAS_MASK) >> 2) + 3);

			goombaFlag = 1 << 8
            for (angle = 0; angle < 0xFFFF; angle += dAngle) {
                // Only spawn goombas which haven't been killed yet
                if (!(o.rawData[oBehParams] & goombaFlag)) {
                    dx = 500.0 * coss(angle);
                    dz = 500.0 * sins(angle);

                    spawn_object_relative((o.rawData[oBehParams2ndByte] & GOOMBA_TRIPLET_SPAWNER_BP_SIZE_MASK) |
                        (goombaFlag >> 6),
                        dx, 0, dz, o, MODEL_GOOMBA, bhvGoomba);
                }
				
				goombaFlag = goombaFlag << 1;
            }

            o.rawData[oAction] += 1;
        }
    } else if (o.rawData[oDistanceToMario] > 4000.0) {
        // If mario is too far away, enter the unloaded action. The goombas
        // will detect this and unload themselves
        o.rawData[oAction] = GOOMBA_TRIPLET_SPAWNER_ACT_UNLOADED;
    }
}


/// <pygml?v=1.0&h=63c3371a2>
/// @function	goomba_begin_jump()
/// @desc		Enter the jump action and set initial y velocity.
function goomba_begin_jump() {
    var o = gCurrentObject;

    cur_obj_play_sound_2(SOUND_OBJ_GOOMBA_ALERT);
    o.rawData[oAction] = GOOMBA_ACT_JUMP;
    o.rawData[oForwardVel] = 0.0;
    o.rawData[oVelY] = 50.0 / 3.0 * o.rawData[oGoombaScale];
}

/// <pygml?v=1.0&h=c323ad463>
/// @function	mark_goomba_as_dead()
/// @desc		If spawned by a triplet spawner, mark the flag in the
///					spawner to indicate that  this goomba died. This prevents it
///					from spawning again when mario leaves and  comes back.
function mark_goomba_as_dead() {
    var o = gCurrentObject;

    if (o.parentObj != o) {
        set_object_respawn_info_bits(o.parentObj,
            (o.rawData[oBehParams2ndByte] & GOOMBA_BP_TRIPLET_FLAG_MASK) >> 2);

        o.parentObj.rawData[oBehParams] =
            o.parentObj.rawData[oBehParams] | (o.rawData[oBehParams2ndByte] & GOOMBA_BP_TRIPLET_FLAG_MASK) << 6;
    }
}

/// <pygml?v=1.0&h=3dde54518>
/// @function	goomba_act_walk()
/// @desc		Walk around randomly occasionally jumping. If mario comes
///					within range,  chase him.
function goomba_act_walk() {
    var o = gCurrentObject;

    treat_far_home_as_mario(1000.0);
	
	//log(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ]);

    obj_forward_vel_approach(o.rawData[oGoombaRelativeSpeed] * o.rawData[oGoombaScale], 0.4);

    // If walking fast enough, play footstep sounds
    if (o.rawData[oGoombaRelativeSpeed] > 4.0 / 3.0) {
        cur_obj_play_sound_at_anim_range(2, 17, SOUND_OBJ_GOOMBA_WALK);
    }

    //! By strategically hitting a wall, steep slope, or another goomba, we can
    //  prevent the goomba from turning back toward home for a while (goomba
    //  chase extension)
    //! It seems theoretically possible to get 2-3 goombas to repeatedly touch
    //  each other and move arbitrarily far from their home, but it's
    //  extremely precise and chaotic in practice, so probably can't be performed
    //  for nontrivial distances
    if (o.rawData[oGoombaTurningAwayFromWall]) {
        o.rawData[oGoombaTurningAwayFromWall] = obj_resolve_collisions_and_turn(o.rawData[oGoombaTargetYaw], 0x200);
    } else {
        // If far from home, walk toward home.
        if (o.rawData[oDistanceToMario] >= 25000.0) {
            o.rawData[oGoombaTargetYaw] = o.rawData[oAngleToMario];
            o.rawData[oGoombaWalkTimer] = random_linear_offset(20, 30);
        }

        if (!(o.rawData[oGoombaTurningAwayFromWall] =
                obj_bounce_off_walls_edges_objects(o.rawData[oGoombaTargetYaw]))) {
			
			o.rawData[oGoombaTargetYaw] = Ptr.p_targetYaw;
			
            if (o.rawData[oDistanceToMario] < 500.0) {
                // If close to mario, begin chasing him. If not already chasing
                // him, jump first

                if (o.rawData[oGoombaRelativeSpeed] <= 2.0) {
                    goomba_begin_jump();
                }

                o.rawData[oGoombaTargetYaw] = o.rawData[oAngleToMario];
                o.rawData[oGoombaRelativeSpeed] = 20.0;
            } else {
                // If mario is far away, walk at a normal pace, turning randomly
                // and occasionally jumping

                o.rawData[oGoombaRelativeSpeed] = 4.0 / 3.0;
                if (o.rawData[oGoombaWalkTimer] != 0) {
                    o.rawData[oGoombaWalkTimer] -= 1;
                } else {
                    if (random_u16() & 3) {
                        o.rawData[oGoombaTargetYaw] = obj_random_fixed_turn(0x2000);
                        o.rawData[oGoombaWalkTimer] = random_linear_offset(100, 100);
                    } else {
                        goomba_begin_jump();
                        o.rawData[oGoombaTargetYaw] = obj_random_fixed_turn(0x6000);
                    }
                }
            }
        }

        cur_obj_rotate_yaw_toward(o.rawData[oGoombaTargetYaw], 0x200);
    }
}
/// <pygml?v=1.0&h=1899e5454>
/// @function	goomba_act_attacked_mario()
/// @desc		This action occurs when either the goomba attacks mario
///					normally, or mario  attacks a huge goomba with an attack
///					that doesn't kill it.
function goomba_act_attacked_mario() {
    var o = gCurrentObject;

    if (o.rawData[oGoombaSize] == GOOMBA_SIZE_TINY) {
        mark_goomba_as_dead();
        o.rawData[oNumLootCoins] = 0;
        obj_die_if_health_non_positive();
    } else {
        //! This can happen even when the goomba is already in the air. It's
        //  hard to chain these in practice
        goomba_begin_jump();
        o.rawData[oGoombaTargetYaw] = o.rawData[oAngleToMario];
        o.rawData[oGoombaTurningAwayFromWall] = false;
    }
}

/// <pygml?v=1.0&h=85a0a66e5>
/// @function	goomba_act_jump()
/// @desc		Move until landing, and rotate toward target yaw.
function goomba_act_jump() {
    var o = gCurrentObject;

    obj_resolve_object_collisions(null);

    //! If we move outside the goomba's drawing radius the frame it enters the
    //  jump action, then it will keep its velY, but it will still be counted
    //  as being on the ground.
    //  Next frame, the jump action will think it has already ended because it is
    //  still on the ground.
    //  This puts the goomba back in the walk action, but the positive velY will
    //  make it hop into the air. We can then trigger another jump.
    if (o.rawData[oMoveFlags] & OBJ_MOVE_MASK_ON_GROUND) {
        o.rawData[oAction] = GOOMBA_ACT_WALK;
    } else {
        cur_obj_rotate_yaw_toward(o.rawData[oGoombaTargetYaw], 0x800);
    }
}

/// <pygml?v=1.0&h=fa8b00b5e>
/// @function	huge_goomba_weakly_attacked()
/// @desc		Attack handler for when mario attacks a huge goomba with an
///					attack that  doesn't kill it.  From the goomba's
///					perspective, this is the same as the goomba attacking
///					mario.
function huge_goomba_weakly_attacked() {
    var o = gCurrentObject;

    o.rawData[oAction] = GOOMBA_ACT_ATTACKED_MARIO;
}

/// <pygml?v=1.0&h=2e54a5b59>
/// @function	bhv_goomba_update()
/// @desc		Update function for goomba.
function bhv_goomba_update() {
    var o = gCurrentObject;

    // PARTIAL_UPDATE

    var animSpeed;

    if (obj_update_standard_actions(o.rawData[oGoombaScale])) {
        // If this goomba has a spawner and mario moved away from the spawner,
        // unload
        if (1==2 && o.parentObj != o && o.parentObj!=null) { // @z
			//log(o.parentObj);
            if (o.parentObj.rawData[oAction] == GOOMBA_TRIPLET_SPAWNER_ACT_UNLOADED) {
                obj_mark_for_deletion(o);
            }
        }

        cur_obj_scale(o.rawData[oGoombaScale]);
        obj_update_blinking(o.rawData[oGoombaBlinkTimer], 30, 50, 5);
		o.rawData[oGoombaBlinkTimer] = Ptr.p_blinkTimer;
        cur_obj_update_floor_and_walls();

		animSpeed = o.rawData[oForwardVel] / o.rawData[oGoombaScale] * 0.4;
        if (animSpeed < 1.0) {
            animSpeed = 1.0;
        }
        cur_obj_init_animation_with_accel_and_sound(0, animSpeed);

        switch (o.rawData[oAction]) {
            case (GOOMBA_ACT_WALK):
                goomba_act_walk();
                break;
            case (GOOMBA_ACT_ATTACKED_MARIO):
                goomba_act_attacked_mario();
                break;
            case (GOOMBA_ACT_JUMP):
                goomba_act_jump();
                break;
        }

        //! @bug Weak attacks on huge goombas in a triplet mark them as dead even if they're not.
        // obj_handle_attacks returns the type of the attack, which is non-zero
        // even for Mario's weak attacks. Thus, if Mario weakly attacks a huge goomba
        // without harming it (e.g. by punching it), the goomba will be marked as dead
        // and will not respawn if Mario leaves and re-enters the spawner's radius
        // even though the goomba isn't actually dead.
        if (obj_handle_attacks(sGoombaHitbox, GOOMBA_ACT_ATTACKED_MARIO,
                sGoombaAttackHandlers[o.rawData[oGoombaSize] & 1])) {
            mark_goomba_as_dead();
        }

        cur_obj_move_standard(-78);
    } else {
        o.rawData[oAnimState] = true;
    }
}

function goomba_macros_init() {
	/**
	 * Attack handlers for goombas.
	 */
	global.__sGoombaAttackHandlers = [
	    [
	       ATTACK_HANDLER_KNOCKBACK,
	       ATTACK_HANDLER_KNOCKBACK,
	       ATTACK_HANDLER_SQUISHED,
	       ATTACK_HANDLER_SQUISHED,
	       ATTACK_HANDLER_KNOCKBACK,
	       ATTACK_HANDLER_KNOCKBACK,
	    ],
	    [
	       ATTACK_HANDLER_SPECIAL_HUGE_GOOMBA_WEAKLY_ATTACKED,
	       ATTACK_HANDLER_SPECIAL_HUGE_GOOMBA_WEAKLY_ATTACKED,
	       ATTACK_HANDLER_SQUISHED,
	       ATTACK_HANDLER_SQUISHED_WITH_BLUE_COIN,
	       ATTACK_HANDLER_SPECIAL_HUGE_GOOMBA_WEAKLY_ATTACKED,
	       ATTACK_HANDLER_SPECIAL_HUGE_GOOMBA_WEAKLY_ATTACKED,
	    ],
	];
	#macro sGoombaAttackHandlers	global.__sGoombaAttackHandlers

	global.__sGoombaHitbox = new Hitbox(
	    /* interactType:      */ INTERACT_BOUNCE_TOP,
	    /* downOffset:        */ 0,
	    /* damageOrCoinValue: */ 1,
	    /* health:            */ 0,
	    /* numLootCoins:      */ 1,
	    /* radius:            */ 72,
	    /* height:            */ 50,
	    /* hurtboxRadius:     */ 42,
	    /* hurtboxHeight:     */ 40,
	);
	#macro sGoombaHitbox		global.__sGoombaHitbox

	global.__sGoombaProperties = [
	    new GoombaProperties( 1.5, SOUND_OBJ_ENEMY_DEATH_HIGH, 4000, 1 ),
	    new GoombaProperties( 3.5, SOUND_OBJ_ENEMY_DEATH_LOW, 4000, 2 ),
	    new GoombaProperties( 0.5, SOUND_OBJ_ENEMY_DEATH_HIGH, 1500, 0 ),
	];

	#macro sGoombaProperties global.__sGoombaProperties	
}