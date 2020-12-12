function interaction_scripts_macros_init() {
	
globalvar sForwardKnockbackActions;
sForwardKnockbackActions = [
    [ ACT_SOFT_FORWARD_GROUND_KB, ACT_FORWARD_GROUND_KB, ACT_HARD_FORWARD_GROUND_KB ],
    [ ACT_FORWARD_AIR_KB,         ACT_FORWARD_AIR_KB,    ACT_HARD_FORWARD_AIR_KB ],
    [ ACT_FORWARD_WATER_KB,       ACT_FORWARD_WATER_KB,  ACT_FORWARD_WATER_KB ],
];

globalvar sBackwardKnockbackActions;
sBackwardKnockbackActions = [
    [ ACT_SOFT_BACKWARD_GROUND_KB, ACT_BACKWARD_GROUND_KB, ACT_HARD_BACKWARD_GROUND_KB ],
    [ ACT_BACKWARD_AIR_KB,         ACT_BACKWARD_AIR_KB,    ACT_HARD_BACKWARD_AIR_KB ],
    [ ACT_BACKWARD_WATER_KB,       ACT_BACKWARD_WATER_KB,  ACT_BACKWARD_WATER_KB ],
];

globalvar sInvulnerable;
sInvulnerable = 0;

globalvar sDelayInvincTimer;
sDelayInvincTimer = 0;


#macro INTERACT_HOOT           (1 << 0)
#macro INTERACT_GRABBABLE      (1 << 1)
#macro INTERACT_DOOR           (1 << 2)
#macro INTERACT_DAMAGE         (1 << 3)
#macro INTERACT_COIN           (1 << 4)
#macro INTERACT_CAP            (1 << 5)
#macro INTERACT_POLE           (1 << 6)
#macro INTERACT_KOOPA          (1 << 7)
#macro INTERACT_UNKNOWN_08     (1 << 8)
#macro INTERACT_BREAKABLE      (1 << 9)
#macro INTERACT_STRONG_WIND    (1 << 10)
#macro INTERACT_WARP_DOOR      (1 << 11)
#macro INTERACT_STAR_OR_KEY    (1 << 12)
#macro INTERACT_WARP           (1 << 13)
#macro INTERACT_CANNON_BASE    (1 << 14)
#macro INTERACT_BOUNCE_TOP     (1 << 15)
#macro INTERACT_WATER_RING     (1 << 16)
#macro INTERACT_BULLY          (1 << 17)
#macro INTERACT_FLAME          (1 << 18)
#macro INTERACT_KOOPA_SHELL    (1 << 19)
#macro INTERACT_BOUNCE_TOP2    (1 << 20)
#macro INTERACT_MR_BLIZZARD    (1 << 21)
#macro INTERACT_HIT_FROM_BELOW (1 << 22)
#macro INTERACT_TEXT           (1 << 23)
#macro INTERACT_TORNADO        (1 << 24)
#macro INTERACT_WHIRLPOOL      (1 << 25)
#macro INTERACT_CLAM_OR_BUBBA  (1 << 26)
#macro INTERACT_BBH_ENTRANCE   (1 << 27)
#macro INTERACT_SNUFIT_BULLET  (1 << 28)
#macro INTERACT_SHOCK          (1 << 29)
#macro INTERACT_IGLOO_BARRIER  (1 << 30)
#macro INTERACT_UNKNOWN_31     (1 << 31)

#macro INT_ATTACK_NOT_FROM_BELOW (INT_GROUND_POUND_OR_TWIRL | INT_PUNCH | INT_KICK | INT_TRIP | INT_SLIDE_KICK | INT_FAST_ATTACK_OR_SHELL | INT_HIT_FROM_ABOVE)

// INTERACT_WARP
#macro INT_SUBTYPE_FADING_WARP 0x00000001

// Damaging interactions
#macro INT_SUBTYPE_DELAY_INVINCIBILITY 0x00000002
#macro INT_SUBTYPE_BIG_KNOCKBACK 0x00000008 /* Used by Bowser, sets Mario's forward velocity to 40 on hit */

// INTERACT_GRABBABLE
#macro INT_SUBTYPE_GRABS_MARIO 0x00000004 /* Also makes the object heavy */
#macro INT_SUBTYPE_HOLDABLE_NPC 0x00000010 /* Allows the object to be gently dropped, and sets vertical speed to 0 when dropped with no forwards velocity */
#macro INT_SUBTYPE_DROP_IMMEDIATELY 0x00000040 /* This gets set by grabbable NPCs that talk to Mario to make him drop them after the dialog is finished */
#macro INT_SUBTYPE_KICKABLE 0x00000100
#macro INT_SUBTYPE_NOT_GRABBABLE 0x00000200 /* Used by Heavy-Ho to allow it to throw Mario, without Mario being able to pick it up */

// INTERACT_DOOR
#macro INT_SUBTYPE_STAR_DOOR 0x00000020

//INTERACT_BOUNCE_TOP
#macro INT_SUBTYPE_TWIRL_BOUNCE 0x00000080

// INTERACT_STAR_OR_KEY
#macro INT_SUBTYPE_NO_EXIT 0x00000400
#macro INT_SUBTYPE_GRAND_STAR 0x00000800

// INTERACT_TEXT
#macro INT_SUBTYPE_SIGN 0x00001000
#macro INT_SUBTYPE_NPC 0x00004000

// INTERACT_CLAM_OR_BUBBA
#macro INT_SUBTYPE_EATS_MARIO 0x00002000


#macro INT_GROUND_POUND_OR_TWIRL   (1 << 0)
#macro INT_PUNCH   (1 << 1) 
#macro INT_KICK   (1 << 2) 
#macro INT_TRIP   (1 << 3) 
#macro INT_SLIDE_KICK   (1 << 4) 
#macro INT_FAST_ATTACK_OR_SHELL   (1 << 5) 
#macro INT_HIT_FROM_ABOVE   (1 << 6) 
#macro INT_HIT_FROM_BELOW  (1 << 7) 

#macro ATTACK_PUNCH                 1
#macro ATTACK_KICK_OR_TRIP          2
#macro ATTACK_FROM_ABOVE            3
#macro ATTACK_GROUND_POUND_OR_TWIRL 4
#macro ATTACK_FAST_ATTACK           5
#macro ATTACK_FROM_BELOW            6

#macro INT_STATUS_ATTACK_MASK 0x000000FF

#macro INT_STATUS_HOOT_GRABBED_BY_MARIO  (1 << 0) 
#macro INT_STATUS_MARIO_UNK1  (1 << 1) 
#macro INT_STATUS_MARIO_UNK2  (1 << 2) 
#macro INT_STATUS_MARIO_DROP_OBJECT  (1 << 3)
#macro INT_STATUS_MARIO_UNK4  (1 << 4)
#macro INT_STATUS_MARIO_UNK5  (1 << 5) 
#macro INT_STATUS_MARIO_UNK6  (1 << 6) 
#macro INT_STATUS_MARIO_UNK7  (1 << 7) 
#macro INT_STATUS_GRABBED_MARIO  (1 << 11)
#macro INT_STATUS_ATTACKED_MARIO  (1 << 13) 
#macro INT_STATUS_WAS_ATTACKED  (1 << 14) 
#macro INT_STATUS_INTERACTED  (1 << 15) 
#macro INT_STATUS_TRAP_TURN  (1 << 20)
#macro INT_STATUS_HIT_MINE  (1 << 21) 
#macro INT_STATUS_STOP_RIDING  (1 << 22) 
#macro INT_STATUS_TOUCHED_BOB_OMB  (1 << 23) 

globalvar sDisplayingDoorText, sJustTeleported, sPssSlideStarted;
sDisplayingDoorText	= false;
sJustTeleported		= false;
sPssSlideStarted		= false;

// @TODO update me when new interactions are added
globalvar sInteractionHandlers;
sInteractionHandlers = [
	new InteractTypeInstance(INTERACT_COIN, interact_coin ),
	new InteractTypeInstance(INTERACT_WATER_RING, null ),
	new InteractTypeInstance(INTERACT_STAR_OR_KEY, interact_star_or_key ),
	new InteractTypeInstance(INTERACT_BBH_ENTRANCE, null ),
	new InteractTypeInstance(INTERACT_WARP, null ),
	new InteractTypeInstance(INTERACT_WARP_DOOR, null ),
	new InteractTypeInstance(INTERACT_DOOR, null ),
	new InteractTypeInstance(INTERACT_CANNON_BASE, null ),
	new InteractTypeInstance(INTERACT_IGLOO_BARRIER, null ),
	new InteractTypeInstance(INTERACT_TORNADO, null ),
	new InteractTypeInstance(INTERACT_WHIRLPOOL, null ),
	new InteractTypeInstance(INTERACT_STRONG_WIND, null ),
	new InteractTypeInstance(INTERACT_FLAME, null ),
	new InteractTypeInstance(INTERACT_SNUFIT_BULLET, null ),
	new InteractTypeInstance(INTERACT_CLAM_OR_BUBBA, null ),
	new InteractTypeInstance(INTERACT_BULLY, null ),
	new InteractTypeInstance(INTERACT_SHOCK, interact_shock ),
	new InteractTypeInstance(INTERACT_BOUNCE_TOP2, interact_bounce_top ),
	new InteractTypeInstance(INTERACT_MR_BLIZZARD, interact_mr_blizzard  ),
	new InteractTypeInstance(INTERACT_HIT_FROM_BELOW, null ),
	new InteractTypeInstance(INTERACT_BOUNCE_TOP, interact_bounce_top ),
	new InteractTypeInstance(INTERACT_DAMAGE, interact_damage ),
	new InteractTypeInstance(INTERACT_POLE, interact_pole ),
	new InteractTypeInstance(INTERACT_HOOT, null ),
	new InteractTypeInstance(INTERACT_BREAKABLE, null ),
	new InteractTypeInstance(INTERACT_KOOPA, interact_bounce_top ),
	new InteractTypeInstance(INTERACT_KOOPA_SHELL, null ),
	new InteractTypeInstance(INTERACT_UNKNOWN_08, null ),
	new InteractTypeInstance(INTERACT_CAP, null ),
	new InteractTypeInstance(INTERACT_GRABBABLE, null ),
	new InteractTypeInstance(INTERACT_TEXT, null ),
];

#macro READ_MASK (INPUT_B_PRESSED | INPUT_A_PRESSED)
#macro SIGN_RANGE 0x4000	

boot("interaction_scripts_macros_init");
}

/// @function	InteractTypeInstance
function InteractTypeInstance(_type, _handler) constructor {
	interactType = _type;
	handler = _handler;
}

/// <pygml?v=1.0&h=4fd8ec6d8>
/// @function	get_mario_cap_flag(capObject)
/// @desc		Returns the type of cap Mario is wearing.
/// @param		{struct}	capObject
/// @returns	u32
function get_mario_cap_flag(capObject) {
    var _script = capObject.behavior;

    if (behaviors_equal(_script, Object1.bhvNormalCap)) {
        return MARIO_NORMAL_CAP;
    } else if (_script == Object1.bhvMetalCap) {
        return MARIO_METAL_CAP;
    } else if (_script == Object1.bhvWingCap) {
        return MARIO_WING_CAP;
    } else if (_script == Object1.bhvVanishCap) {
        return MARIO_VANISH_CAP;
    }

    return 0;
}

/// <pygml?v=1.0&h=a71ddf9a0>
/// @function	object_facing_mario(m, o, angleRange)
/// @desc		Returns true if the passed in object has a moving angle yaw
///					in the angular range given towards Mario.
/// @param		{struct}	m
/// @param		{struct}	o
/// @param		{s16}		angleRange
/// @returns	u32
function object_facing_mario(m, o, angleRange) {

    var dx = m.pos[0] - o.rawData[oPosX];
    var dz = m.pos[2] - o.rawData[oPosZ];

    var angleToMario = atan2s(dz, dx);
    var dAngle = angleToMario - o.rawData[oMoveAngleYaw];

    if (-angleRange <= dAngle && dAngle <= angleRange) {
        return true;
    }

    return false;
}


/// <pygml?v=1.0&h=5c6675e2e>
/// @function	mario_obj_angle_to_object(m, o)
/// @param		{struct}	m
/// @param		{struct}	o
/// @returns	s16
function mario_obj_angle_to_object(m, o) {

    var dx = o.rawData[oPosX] - m.pos[0];
    var dz = o.rawData[oPosZ] - m.pos[2];

    return atan2s(dz, dx);
}


function reset_mario_pitch(m) {
	/// TODO: WATER JUMP || SHOT FROM CANNON || ACT_FLYING
}
	
/// @function	interact_pole
function interact_pole(m, interactType, o) {
		
	var actionId = m.action & ACT_ID_MASK;
	
	if (actionId >= 0x80 && actionId < 0x0A0) {
		
		if (!(m.prevAction & ACT_FLAG_ON_POLE) || m.usedObj != o) {
			
			var lowSpeed = m.forwardVel <= 10.0;
			var marioObj = m.marioObj;

			m.interactObj = o;
			m.usedObj = o;
			m.vel[1] = 0.0;
			m.forwardVel = 0.0;

			marioObj.rawData[oMarioPoleUnk108] = 0;
			marioObj.rawData[oMarioPoleYawVel] = 0;
			marioObj.rawData[oMarioPolePos] = m.pos[1] - o.rawData[oPosY];

			if (lowSpeed) {
			    return set_mario_action(m, ACT_GRAB_POLE_SLOW, 0);
			}

			marioObj.rawData[oMarioPoleYawVel] = floor((m.forwardVel * 0x100) + 0x1000);

			reset_mario_pitch(m); /// TODO: WATER JUMP || SHOT FROM CANNON || ACT_FLYING
			return set_mario_action(m, ACT_GRAB_POLE_FAST, 0);

		}
	}

	return 0;
}

/// <pygml?v=1.0&h=ce1be7d8d>
/// @function	take_damage_and_knock_back(m, o)
/// @param		{struct}	m
/// @param		{struct}	o
/// @returns	u32
function take_damage_and_knock_back(m, o) {

    var damage;

    if (!sInvulnerable && !(m.flags & MARIO_VANISH_CAP) &&
        !(o.rawData[oInteractionSubtype] & INT_SUBTYPE_DELAY_INVINCIBILITY)) {
        o.rawData[oInteractStatus] = INT_STATUS_INTERACTED | INT_STATUS_ATTACKED_MARIO;
        m.interactObj = o;

        damage = take_damage_from_interact_object(m);

        if (o.rawData[oInteractionSubtype] & INT_SUBTYPE_BIG_KNOCKBACK) {
            m.forwardVel = 40.0;
        }

        if (o.rawData[oDamageOrCoinValue] > 0) {
            play_sound(SOUND_MARIO_ATTACKED, m.marioObj.header.gfx.cameraToObject);
        }

        update_mario_sound_and_camera(m);
        return drop_and_set_mario_action(m, determine_knockback_action(m, o.rawData[oDamageOrCoinValue]),
            damage);
    }

    return false;
}

/// <pygml?v=1.0&h=5ec974c4f>
/// @function	determine_knockback_action(m, arg)
/// @param		{struct}	m
/// @param		{s32}		arg
/// @returns	u32
function determine_knockback_action(m, arg) {
    var bonkAction;

    var terrainIndex = 0; // 1 = air, 2 = water, 0 = default
    var strengthIndex = 0;

    var angleToObject = mario_obj_angle_to_object(m, m.interactObj);
    var facingDYaw = angleToObject - m.faceAngle[1];
    var remainingHealth = m._health - 0x40 * m.hurtCounter;

    if (m.action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER)) {
        terrainIndex = 2;
    } else if (m.action & (ACT_FLAG_AIR | ACT_FLAG_ON_POLE | ACT_FLAG_HANGING)) {
        terrainIndex = 1;
    }

    if (remainingHealth < 0x100) {
        strengthIndex = 2;
    } else if (m.interactObj.rawData[oDamageOrCoinValue] >= 4) {
        strengthIndex = 2;
    } else if (m.interactObj.rawData[oDamageOrCoinValue] >= 2) {
        strengthIndex = 1;
    }

    m.faceAngle[1] = angleToObject;

    if (terrainIndex == 2) {
        if (m.forwardVel < 28.0) {
            mario_set_forward_vel(m, 28.0);
        }

        if (m.pos[1] >= m.interactObj.rawData[oPosY]) {
            if (m.vel[1] < 20.0) {
                m.vel[1] = 20.0;
            }
        } else {
            if (m.vel[1] > 0.0) {
                m.vel[1] = 0.0;
            }
        }
    } else {
        if (m.forwardVel < 16.0) {
            mario_set_forward_vel(m, 16.0);
        }
    }

    if (-0x4000 <= facingDYaw && facingDYaw <= 0x4000) {
        m.forwardVel *= -1.0;
        bonkAction = sBackwardKnockbackActions[terrainIndex][strengthIndex];
    } else {
        m.faceAngle[1] += 0x8000;
        bonkAction = sForwardKnockbackActions[terrainIndex][strengthIndex];
    }

    return bonkAction;
}


/// <pygml?v=1.0&h=abd464424>
/// @function	take_damage_from_interact_object(m)
/// @param		{struct}	m
/// @returns	u32
function take_damage_from_interact_object(m) {
    var shake;
    var damage = m.interactObj.rawData[oDamageOrCoinValue];

    if (damage >= 4) {
        shake = SHAKE_LARGE_DAMAGE;
    } else if (damage >= 2) {
        shake = SHAKE_MED_DAMAGE;
    } else {
        shake = SHAKE_SMALL_DAMAGE;
    }

    if (!(m.flags & MARIO_CAP_ON_HEAD)) {
        damage += (damage + 1) / 2;
    }

    if (m.flags & MARIO_METAL_CAP) {
        damage = 0;
    }

    m.hurtCounter += 4 * damage;

    set_camera_shake_from_hit(shake);

    return damage;
}



/// <pygml?v=1.0&h=d519e748e>
/// @function	interact_damage(m, interactType, o)
/// @param		{struct}	m
/// @param		{u32}		interactType
/// @param		{struct}	o
/// @returns	u32
function interact_damage(m, interactType, o) {

    if (take_damage_and_knock_back(m, o)) {
        return true;
    }

    if (!(o.rawData[oInteractionSubtype] & INT_SUBTYPE_DELAY_INVINCIBILITY)) {
        sDelayInvincTimer = true;
    }

    return false;
}


/// @function	mario_get_collided_object
function mario_get_collided_object(m, interactType) {
	for (var i = 0; i < m.marioObj.collidedObjs.size; i++) {
	    var object = m.marioObj.collidedObjs.content[i];

	    if (object.rawData[oInteractType] == interactType) return object;
	}
	
	return null;
}

/// <pygml?v=1.0&h=2044cba59>
/// @function	mario_drop_held_object(m)
/// @param		{struct}	m
function mario_drop_held_object(m) {
    if (m.heldObj != null) {
        if (m.heldObj.behavior == (bhvKoopaShellUnderwater)) {
            stop_shell_music();
        }

        obj_set_held_state(m.heldObj, bhvCarrySomething4);

        // ! When dropping an object instead of throwing it, it will be put at Mario's
        // _y-positon instead of the HOLP's _y-position. This fact is often exploited when
        // cloning objects.
        m.heldObj.rawData[oPosX] = m.marioBodyState.heldObjLastPosition[0];
        m.heldObj.rawData[oPosY] = m.pos[1];
        m.heldObj.rawData[oPosZ] = m.marioBodyState.heldObjLastPosition[2];

        m.heldObj.rawData[oMoveAngleYaw] = m.faceAngle[1];

        m.heldObj = null;
    }
}


/// <pygml?v=1.0&h=8ca82f9ea>
/// @function	interact_coin(m, interactType, o)
/// @param		{struct}	m
/// @param		{u32}		interactType
/// @param		{struct}	o
/// @returns	u32
function interact_coin(m, interactType, o) {
	
    m.numCoins += o.rawData[oDamageOrCoinValue];
    m.healCounter += 4 * o.rawData[oDamageOrCoinValue];

    o.rawData[oInteractStatus] = INT_STATUS_INTERACTED;

	// @z
   // if (COURSE_IS_MAIN_COURSE(gCurrCourseNum) && m.numCoins - o.rawData[oDamageOrCoinValue] < 100 &&
    //    m.numCoins >= 100) {
    //    bhv_spawn_star_no_level_exit(6);
    //}

    return false;
}

/// <pygml?v=1.0&h=1e4b79dbb>
/// @function	interact_grabbable(m, interactType, o)
/// @param		{struct}	m
/// @param		{u32}		interactType
/// @param		{struct}	o
/// @returns	u32
function interact_grabbable(m, interactType, o) {

    var _script = o.behavior;

    if (o.rawData[oInteractionSubtype] & INT_SUBTYPE_KICKABLE) {
        var interaction = determine_interaction(m, o);
        if (interaction & (INT_KICK | INT_TRIP)) {
            attack_object(o, interaction);
            bounce_back_from_attack(m, interaction);
            return false;
        }
    }

    if ((o.rawData[oInteractionSubtype] & INT_SUBTYPE_GRABS_MARIO)) {
        if (check_object_grab_mario(m, interactType, o)) {
            return true;
        }
    }

    if (able_to_grab_object(m, o)) {
        if (!(o.rawData[oInteractionSubtype] & INT_SUBTYPE_NOT_GRABBABLE)) {
            m.interactObj = o;
            m.input |= INPUT_INTERACT_OBJ_GRABBABLE;
            return true;
        }
    }

    if (!behaviors_equal(_script, bhvBowser)) {
        push_mario_out_of_object(m, o, -5.0);
    }
    return false;
}


/// <pygml?v=1.0&h=a37621b0b>
/// @function	mario_can_talk(m, arg)
/// @param		{struct}	m
/// @param		{u32}		arg
/// @returns	u32
function mario_can_talk(m, arg) {
    var val6;

    if ((m.action & ACT_FLAG_IDLE) != 0x00000000) {
        return true;
    }

    if (m.action == ACT_WALKING) {
        if (arg) {
            return true;
        }

        val6 = m.marioObj.header.gfx.unk38.animID;

        if (val6 == 0x0080 || val6 == 0x007F || val6 == 0x006C) {
            return true;
        }
    }

    return false;
}


/// <pygml?v=1.0&h=79f154c22>
/// @function	check_read_sign(m, o)
/// @param		{struct}	m
/// @param		{struct}	o
/// @returns	u32
function check_read_sign(m, o) {

    if ((m.input & READ_MASK) && mario_can_talk(m, 0) && object_facing_mario(m, o, SIGN_RANGE)) {
        var facingDYaw = (o.rawData[oMoveAngleYaw] + 0x8000) - m.faceAngle[1];
        if (facingDYaw >= -SIGN_RANGE && facingDYaw <= SIGN_RANGE) {
            var targetX = o.rawData[oPosX] + 105.0 * sins(o.rawData[oMoveAngleYaw]);
            var targetZ = o.rawData[oPosZ] + 105.0 * coss(o.rawData[oMoveAngleYaw]);

            m.marioObj.rawData[oMarioReadingSignDYaw] = facingDYaw;
            m.marioObj.rawData[oMarioReadingSignDPosX] = targetX - m.pos[0];
            m.marioObj.rawData[oMarioReadingSignDPosZ] = targetZ - m.pos[2];

            m.interactObj = o;
            m.usedObj = o;
            return set_mario_action(m, ACT_READING_SIGN, 0);
        }
    }

    return false;
}

/// <pygml?v=1.0&h=5ef9216ab>
/// @function	push_mario_out_of_object(m, o, padding)
/// @param		{struct}	m
/// @param		{struct}	o
/// @param		{f32}		padding
function push_mario_out_of_object(m, o, padding) {

    var minDistance = o.hitboxRadius + m.marioObj.hitboxRadius + padding;

    var offsetX = m.pos[0] - o.rawData[oPosX];
    var offsetZ = m.pos[2] - o.rawData[oPosZ];
    var distance = sqrt(offsetX * offsetX + offsetZ * offsetZ);

    if (distance < minDistance) {
        var _floor = {};
        var pushAngle;
        var newMarioX;
        var newMarioZ;

        if (distance == 0.0) {
            pushAngle = m.faceAngle[1];
        } else {
            pushAngle = atan2s(offsetZ, offsetX);
        }

        newMarioX = o.rawData[oPosX] + minDistance * sins(pushAngle);
        newMarioZ = o.rawData[oPosZ] + minDistance * coss(pushAngle);

        f32_find_wall_collision(newMarioX, m.pos[1], newMarioZ, 60.0, 50.0);
		newMarioX	= Ptr.p_x; 
		m.pos[1]	= Ptr.p_y;
		newMarioZ	= Ptr.p_z;

        find_floor(newMarioX, m.pos[1], newMarioZ, _floor)
        _floor = _floor._floor;
        if (_floor != null) {
            //! Doesn't update Mario's referenced _floor (allows oob death when
            // an object pushes you into a steep slope while in a ground action)
            m.pos[0] = newMarioX;
            m.pos[2] = newMarioZ;
        }
    }
}


/// <pygml?v=1.0&h=a00f70c22>
/// @function	check_npc_talk(m, o)
/// @param		{struct}	m
/// @param		{struct}	o
/// @returns	u32
function check_npc_talk(m, o) {

    if ((m.input & READ_MASK) && mario_can_talk(m, 1)) {
        var facingDYaw = mario_obj_angle_to_object(m, o) - m.faceAngle[1];
        if (facingDYaw >= -0x4000 && facingDYaw <= 0x4000) {
            o.rawData[oInteractStatus] = INT_STATUS_INTERACTED;

            m.interactObj = o;
            m.usedObj = o;

            push_mario_out_of_object(m, o, -10.0);
            return set_mario_action(m, ACT_WAITING_FOR_DIALOG, 0);
        }
    }

    push_mario_out_of_object(m, o, -10.0);
    return false;
}


/// <pygml?v=1.0&h=4e131bb64>
/// @function	interact_text(m, interactType, o)
/// @param		{struct}	m
/// @param		{u32}		interactType
/// @param		{struct}	o
/// @returns	u32
function interact_text(m, interactType, o) {

    var interact = false;

    if (o.rawData[oInteractionSubtype] & INT_SUBTYPE_SIGN) {
        interact = check_read_sign(m, o);
    } else if (o.rawData[oInteractionSubtype] & INT_SUBTYPE_NPC) {
        interact = check_npc_talk(m, o);
    } else {
        push_mario_out_of_object(m, o, 2.0);
    }

    return interact;
}



/// <pygml?v=1.0&h=fb2632ba2>
/// @function	check_kick_or_punch_wall(m)
/// @param		{struct}	m
function check_kick_or_punch_wall(m) {
    if (m.flags & (MARIO_PUNCHING | MARIO_KICKING | MARIO_TRIPPING)) {
        var detector = Vec3f;
        detector[0] = m.pos[0] + 50.0 * sins(m.faceAngle[1]);
        detector[2] = m.pos[2] + 50.0 * coss(m.faceAngle[1]);
        detector[1] = m.pos[1];

        if (resolve_and_return_wall_collisions(detector, 80.0, 5.0) != null) {
            if (m.action != ACT_MOVE_PUNCHING || m.forwardVel >= 0.0) {
                if (m.action == ACT_PUNCHING) {
                    m.action = ACT_MOVE_PUNCHING;
                }

                mario_set_forward_vel(m, -48.0);
                play_sound(SOUND_ACTION_HIT_2, m.marioObj.header.gfx.cameraToObject);
                m.particleFlags |= PARTICLE_TRIANGLE;
            } else if (m.action & ACT_FLAG_AIR) {
                mario_set_forward_vel(m, -16.0);
                play_sound(SOUND_ACTION_HIT_2, m.marioObj.header.gfx.cameraToObject);
                m.particleFlags |= PARTICLE_TRIANGLE;
            }
        }
    }
}

/// <pygml?v=1.0&h=4234a015c>
/// @function	mario_process_interactions(m)
/// @param		{struct}	m
function mario_process_interactions(m) {
    sDelayInvincTimer = false;
    sInvulnerable = (m.action & ACT_FLAG_INVULNERABLE) || m.invincTimer != 0;

    if (!(m.action & ACT_FLAG_INTANGIBLE) && m.collidedObjInteractTypes != 0) {
        var i;
		var interact_lut = sInteractionHandlers;
        for (i = 0; i < 31; i++) {
			
            var interactType = interact_lut[i].interactType;
			
            if (!m.collidedObjInteractTypes & interactType) continue;
			
            var object = mario_get_collided_object(m, interactType);
			
			if (object == null) continue;

            m.collidedObjInteractTypes &= ~interactType;

            if (!(object.rawData[oInteractStatus] & INT_STATUS_INTERACTED)) {
                if (interact_lut[i].handler(m, interactType, object)) {
                    break;
                }
            }

        }
    }

    if (m.invincTimer > 0 && !sDelayInvincTimer) {
        m.invincTimer -= 1;
    }

    //! If the kick/punch flags are set and an object collision changes Mario's
    // action, he will get the kick/punch wall speed anyway.
    check_kick_or_punch_wall(m);
    m.flags &= ~MARIO_PUNCHING & ~MARIO_KICKING & ~MARIO_TRIPPING;

    if (!(m.marioObj.collidedObjInteractTypes & (INTERACT_WARP_DOOR | INTERACT_DOOR))) {
        sDisplayingDoorText = false;
    }
    if (!(m.marioObj.collidedObjInteractTypes & INTERACT_WARP)) {
        sJustTeleported = false;
    }
}


/// <pygml?v=1.0&h=1dfca0f87>
/// @function	check_death_barrier(m)
/// @param		{struct}	m
function check_death_barrier(m) {
    if (m.pos[1] < m.floorHeight + 2048.0) {
        if (level_trigger_warp(m, WARP_OP_WARP_FLOOR) == 20 && !(m.flags & MARIO_UNKNOWN_18)) {
            play_sound(SOUND_MARIO_WAAAOOOW, m.marioObj.header.gfx.cameraToObject);
        }
    }
}

/// <pygml?v=1.0&h=2c414ae93>
/// @function	check_lava_boost(m)
/// @param		{struct}	m
function check_lava_boost(m) {
    if (!(m.action & ACT_FLAG_RIDING_SHELL) && m.pos[1] < m.floorHeight + 10.0) {
        if (!(m.flags & MARIO_METAL_CAP)) {
            m.hurtCounter += (m.flags & MARIO_CAP_ON_HEAD) ? 12 : 18;
        }

        update_mario_sound_and_camera(m);
        drop_and_set_mario_action(m, ACT_LAVA_BOOST, 0);
    }
}

/// <pygml?v=1.0&h=96c5f9faa>
/// @function	pss_begin_slide(m)
/// @param		{struct}	m
function pss_begin_slide(m) {
    if (!(gHudDisplay.flags & HUD_DISPLAY_FLAG_TIMER)) {
        level_control_timer(TIMER_CONTROL_SHOW);
        level_control_timer(TIMER_CONTROL_START);
        sPssSlideStarted = true;
    }
}

/// <pygml?v=1.0&h=6d83d7873>
/// @function	pss_end_slide(m)
/// @param		{struct}	m
function pss_end_slide(m) {
    //! This flag isn't set on death or level entry, allowing double star spawn
    if (sPssSlideStarted) {
        var slideTime = level_control_timer(TIMER_CONTROL_STOP);
        if (slideTime < 630) {
            m.marioObj.rawData[oBehParams] = (1 << 24);
            spawn_default_star(-6358.0, -4300.0, 4700.0);
        }
        sPssSlideStarted = false;
    }
}

/// <pygml?v=1.0&h=675af4cdd>
/// @function	mario_handle_special_floors(m)
/// @param		{struct}	m
function mario_handle_special_floors(m) {
	
    if ((m.action & ACT_GROUP_MASK) == ACT_GROUP_CUTSCENE) {
        return;
    }

    if (m._floor != null) {
        var floorType = m._floor.type;

        switch (floorType) {
            case (SURFACE_DEATH_PLANE):
            case (SURFACE_VERTICAL_WIND):
                check_death_barrier(m);
                break;

            case (SURFACE_WARP):
                level_trigger_warp(m, WARP_OP_WARP_FLOOR);
                break;

            case (SURFACE_TIMER_START):
                pss_begin_slide(m);
                break;

            case (SURFACE_TIMER_END):
                pss_end_slide(m);
                break;
        }

        if (!(m.action & ACT_FLAG_AIR) && !(m.action & ACT_FLAG_SWIMMING)) {
            switch (floorType) {
                case (SURFACE_BURNING):
                    check_lava_boost(m);
                    break;
            }
        }
    }
}

/// <pygml?v=1.0&h=942a04d22>
/// @function	mario_check_object_grab(m)
/// @param		{struct}	m
/// @returns	u32
function mario_check_object_grab(m) {
    var result = false;
    var _script;

    if (m.input & INPUT_INTERACT_OBJ_GRABBABLE) {
        _script = virtual_to_segmented(0x13, m.interactObj.behavior);

        if (behaviors_equal(_script, bhvBowser)) {
            var facingDYaw = m.faceAngle[1] - m.interactObj.rawData[oMoveAngleYaw];
            if (facingDYaw >= -0x5555 && facingDYaw <= 0x5555) {
                m.faceAngle[1] = m.interactObj.rawData[oMoveAngleYaw];
                m.usedObj = m.interactObj;
                result = set_mario_action(m, ACT_PICKING_UP_BOWSER, 0);
            }
        } else {
            var facingDYaw = mario_obj_angle_to_object(m, m.interactObj) - m.faceAngle[1];
            if (facingDYaw >= -0x2AAA && facingDYaw <= 0x2AAA) {
                m.usedObj = m.interactObj;

                if (!(m.action & ACT_FLAG_AIR)) {
                    set_mario_action(
                        m, (m.action & ACT_FLAG_DIVING) ? ACT_DIVE_PICKING_UP : ACT_PICKING_UP, 0);
                }

                result = true;
            }
        }
    }

    return result;
}

/// <pygml?v=1.0&h=f6ab12c11>
/// @function	interact_star_or_key(m, interactType, o)
/// @param		{struct}	m
/// @param		{u32}		interactType
/// @param		{struct}	o
/// @returns	u32
function interact_star_or_key(m, interactType, o) {

    var starIndex;
    var starGrabAction = ACT_STAR_DANCE_EXIT;
    var noExit = (o.rawData[oInteractionSubtype] & INT_SUBTYPE_NO_EXIT) != 0;
    var grandStar = (o.rawData[oInteractionSubtype] & INT_SUBTYPE_GRAND_STAR) != 0;

    if (m._health >= 0x100) {
        mario_stop_riding_and_holding(m);

        if (!noExit) {
            m.hurtCounter = 0;
            m.healCounter = 0;
            if (m.capTimer > 1) {
                m.capTimer = 1;
            }
        }

        if (noExit) {
            starGrabAction = ACT_STAR_DANCE_NO_EXIT;
        }

        if (m.action & ACT_FLAG_SWIMMING) {
            starGrabAction = ACT_STAR_DANCE_WATER;
        }

        if (m.action & ACT_FLAG_METAL_WATER) {
            starGrabAction = ACT_STAR_DANCE_WATER;
        }

        if (m.action & ACT_FLAG_AIR) {
            starGrabAction = ACT_FALL_AFTER_STAR_GRAB;
        }

        spawn_object(o, MODEL_NONE, Object1.bhvStarKeyCollectionPuffSpawner);

        o.rawData[oInteractStatus] = INT_STATUS_INTERACTED;
        m.interactObj = o;
        m.usedObj = o;

        starIndex = (o.rawData[oBehParams] >> 24) & 0x1F;
        //save_file_collect_star_or_key(m.numCoins, starIndex);
		// @z
        m.numStars++;//save_file_get_total_star_count(gCurrSaveFileNum - 1, COURSE_MIN - 1, COURSE_MAX - 1);

        if (!noExit) {
            drop_queued_background_music();
            fadeout_level_music(126);
        }

        play_sound(SOUND_MENU_STAR_SOUND, m.marioObj.header.gfx.cameraToObject);
        update_mario_sound_and_camera(m);

        if (grandStar) {
            return set_mario_action(m, ACT_JUMBO_STAR_CUTSCENE, 0);
        }

        return set_mario_action(m, starGrabAction, noExit + 2 * grandStar);
    }

    return false;
}

/// <pygml?v=1.0&h=ceedb4a86>
/// @function	mario_stop_riding_and_holding(m)
/// @param		{struct}	m
function mario_stop_riding_and_holding(m) {
    mario_drop_held_object(m);
    mario_stop_riding_object(m);

    if (m.action == ACT_RIDING_HOOT) {
        m.usedObj.rawData[oInteractStatus] = 0;
        m.usedObj.rawData[oHootMarioReleaseTime] = gGlobalTimer;
    }
}

/// <pygml?v=1.0&h=bf3242296>
/// @function	mario_stop_riding_object(m)
/// @param		{struct}	m
function mario_stop_riding_object(m) {
    if (m.riddenObj != null) {
        m.riddenObj.rawData[oInteractStatus] = INT_STATUS_STOP_RIDING;
        stop_shell_music();
        m.riddenObj = null;
    }
}

/// <pygml?v=1.0&h=7c1e08ec7>
/// @function	interact_shock(m, interactType, o)
/// @param		{struct}	m
/// @param		{u32}		interactType
/// @param		{struct}	o
/// @returns	u32
function interact_shock(m, interactType, o) {

    if (!sInvulnerable && !(m.flags & MARIO_VANISH_CAP) &&
        !(o.rawData[oInteractionSubtype] & INT_SUBTYPE_DELAY_INVINCIBILITY)) {
        var actionArg = (m.action & (ACT_FLAG_AIR | ACT_FLAG_ON_POLE | ACT_FLAG_HANGING)) == 0;

        o.rawData[oInteractStatus] = INT_STATUS_INTERACTED | INT_STATUS_ATTACKED_MARIO;
        m.interactObj = o;

        take_damage_from_interact_object(m);
        play_sound(SOUND_MARIO_ATTACKED, m.marioObj.header.gfx.cameraToObject);

        if (m.action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER)) {
            return drop_and_set_mario_action(m, ACT_WATER_SHOCKED, 0);
        } else {
            update_mario_sound_and_camera(m);
            return drop_and_set_mario_action(m, ACT_SHOCKED, actionArg);
        }
    }

    if (!(o.rawData[oInteractionSubtype] & INT_SUBTYPE_DELAY_INVINCIBILITY)) {
        sDelayInvincTimer = true;
    }

    return false;
}


/// <pygml?v=1.0&h=4b59bd111>
/// @function	interact_bounce_top(m, interactType, o)
/// @param		{struct}	m
/// @param		{u32}		interactType
/// @param		{struct}	o
/// @returns	u32
function interact_bounce_top(m, interactType, o) {

    var interaction;
    if (m.flags & MARIO_METAL_CAP) {
        interaction = INT_FAST_ATTACK_OR_SHELL;
    } else {
        interaction = determine_interaction(m, o);
    }

    if (interaction & INT_ATTACK_NOT_FROM_BELOW) {
        attack_object(o, interaction);
        bounce_back_from_attack(m, interaction);

        if (interaction & INT_HIT_FROM_ABOVE) {
            if (o.rawData[oInteractionSubtype] & INT_SUBTYPE_TWIRL_BOUNCE) {
                bounce_off_object(m, o, 80.0);
                reset_mario_pitch(m);
                play_sound(SOUND_MARIO_TWIRL_BOUNCE, m.marioObj.header.gfx.cameraToObject);
                return drop_and_set_mario_action(m, ACT_TWIRLING, 0);
            } else {
                bounce_off_object(m, o, 30.0);
            }
        }
    } else if (take_damage_and_knock_back(m, o)) {
        return true;
    }

    if (!(o.rawData[oInteractionSubtype] & INT_SUBTYPE_DELAY_INVINCIBILITY)) {
        sDelayInvincTimer = true;
    }

    return false;
}

/// <pygml?v=1.0&h=c0e7d17c0>
/// @function	bounce_off_object(m, o, velY)
/// @param		{struct}	m
/// @param		{struct}	o
/// @param		{f32}		velY
function bounce_off_object(m, o, velY) {

    m.pos[1] = o.rawData[oPosY] + o.hitboxHeight;
    m.vel[1] = velY;

    m.flags &= ~MARIO_UNKNOWN_08;

    play_sound(SOUND_ACTION_BOUNCE_OFF_OBJECT, m.marioObj.header.gfx.cameraToObject);
}


/// <pygml?v=1.0&h=51b4ee8bb>
/// @function	attack_object(o, interaction)
/// @desc		Sets the interaction types for INT_STATUS_INTERACTED,
///					INT_STATUS_WAS_ATTACKED
/// @param		{struct}	o
/// @param		{s32}		interaction
/// @returns	u32
function attack_object(o, interaction) {

    var attackType = 0;

    switch (interaction) {
        case (INT_GROUND_POUND_OR_TWIRL):
            attackType = ATTACK_GROUND_POUND_OR_TWIRL;
            break;
        case (INT_PUNCH):
            attackType = ATTACK_PUNCH;
            break;
        case (INT_KICK):
        case (INT_TRIP):
            attackType = ATTACK_KICK_OR_TRIP;
            break;
        case (INT_SLIDE_KICK):
        case (INT_FAST_ATTACK_OR_SHELL):
            attackType = ATTACK_FAST_ATTACK;
            break;
        case (INT_HIT_FROM_ABOVE):
            attackType = ATTACK_FROM_ABOVE;
            break;
        case (INT_HIT_FROM_BELOW):
            attackType = ATTACK_FROM_BELOW;
            break;
    }

    o.rawData[oInteractStatus] = attackType + (INT_STATUS_INTERACTED | INT_STATUS_WAS_ATTACKED);
    return attackType;
}

/// <pygml?v=1.0&h=9de66cb79>
/// @function	bounce_back_from_attack(m, interaction)
/// @param		{struct}	m
/// @param		{u32}		interaction
function bounce_back_from_attack(m, interaction) {
    if (interaction & (INT_PUNCH | INT_KICK | INT_TRIP)) {
        if (m.action == ACT_PUNCHING) {
            m.action = ACT_MOVE_PUNCHING;
        }

        if (m.action & ACT_FLAG_AIR) {
            mario_set_forward_vel(m, -16.0);
        } else {
            mario_set_forward_vel(m, -48.0);
        }

        set_camera_shake_from_hit(SHAKE_ATTACK);
        m.particleFlags |= PARTICLE_TRIANGLE;
    }

    if (interaction & (INT_PUNCH | INT_KICK | INT_TRIP | INT_FAST_ATTACK_OR_SHELL)) {
        play_sound(SOUND_ACTION_HIT_2, m.marioObj.header.gfx.cameraToObject);
    }
}

/// <pygml?v=1.0&h=435f54636>
/// @function	determine_interaction(m, o)
/// @desc		Determines Mario's interaction with a given object depending
///					on their proximity,  action, speed, and position.
/// @param		{struct}	m
/// @param		{struct}	o
/// @returns	u32
function determine_interaction(m, o) {

    var interaction = 0;
    var action = m.action;

    if (action & ACT_FLAG_ATTACKING) {
        if (action == ACT_PUNCHING || action == ACT_MOVE_PUNCHING || action == ACT_JUMP_KICK) {
            var dYawToObject = mario_obj_angle_to_object(m, o) - m.faceAngle[1];

            if (m.flags & MARIO_PUNCHING) {
                // 120 degrees total, or 60 each way
                if (-0x2AAA <= dYawToObject && dYawToObject <= 0x2AAA) {
                    interaction = INT_PUNCH;
                }
            }
            if (m.flags & MARIO_KICKING) {
                // 120 degrees total, or 60 each way
                if (-0x2AAA <= dYawToObject && dYawToObject <= 0x2AAA) {
                    interaction = INT_KICK;
                }
            }
            if (m.flags & MARIO_TRIPPING) {
                // 180 degrees total, or 90 each way
                if (-0x4000 <= dYawToObject && dYawToObject <= 0x4000) {
                    interaction = INT_TRIP;
                }
            }
        } else if (action == ACT_GROUND_POUND || action == ACT_TWIRLING) {
            if (m.vel[1] < 0.0) {
                interaction = INT_GROUND_POUND_OR_TWIRL;
            }
        } else if (action == ACT_GROUND_POUND_LAND || action == ACT_TWIRL_LAND) {
            // Neither ground pounding nor twirling change Mario's vertical speed on landing.,
            // so the speed check is nearly always true (perhaps not if you land while going upwards?)
            // Additionally, actionState it set on each first thing in their action, so this is
            // only true prior to the very first frame (i.e. active 1 frame prior to it run).
            if (m.vel[1] < 0.0 && m.actionState == 0) {
                interaction = INT_GROUND_POUND_OR_TWIRL;
            }
        } else if (action == ACT_SLIDE_KICK || action == ACT_SLIDE_KICK_SLIDE) {
            interaction = INT_SLIDE_KICK;
        } else if (action & ACT_FLAG_RIDING_SHELL) {
            interaction = INT_FAST_ATTACK_OR_SHELL;
        } else if (m.forwardVel <= -26.0 || 26.0 <= m.forwardVel) {
            interaction = INT_FAST_ATTACK_OR_SHELL;
        }
    }

    // Prior to this, the interaction type could be overwritten. This requires, however,
    // that the interaction not be set prior. This specifically overrides turning a ground
    // pound into just a bounce.
    if (interaction == 0 && (action & ACT_FLAG_AIR)) {
        if (m.vel[1] < 0.0) {
            if (m.pos[1] > o.rawData[oPosY]) {
                interaction = INT_HIT_FROM_ABOVE;
            }
        } else {
            if (m.pos[1] < o.rawData[oPosY]) {
                interaction = INT_HIT_FROM_BELOW;
            }
        }
    }

    return interaction;
}

/// <pygml?v=1.0&h=b67504019>
/// @function	interact_mr_blizzard(m, interactType, o)
/// @param		{struct}	m
/// @param		{u32}		interactType
/// @param		{struct}	o
/// @returns	u32
function interact_mr_blizzard(m, interactType, o) {

    if (take_damage_and_knock_back(m, o)) {
        return true;
    }

    if (!(o.rawData[oInteractionSubtype] & INT_SUBTYPE_DELAY_INVINCIBILITY)) {
        sDelayInvincTimer = true;
    }

    return false;
}


