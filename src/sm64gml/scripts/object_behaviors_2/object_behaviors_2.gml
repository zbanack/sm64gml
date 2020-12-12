function object_behaviors_2_macros_init() {
#macro ATTACK_HANDLER_NOP 0
#macro ATTACK_HANDLER_DIE_IF_HEALTH_NON_POSITIVE 1
#macro ATTACK_HANDLER_KNOCKBACK 2
#macro ATTACK_HANDLER_SQUISHED 3
#macro ATTACK_HANDLER_SPECIAL_KOOPA_LOSE_SHELL 4
#macro ATTACK_HANDLER_SET_SPEED_TO_ZERO 5
#macro ATTACK_HANDLER_SPECIAL_WIGGLER_JUMPED_ON 6
#macro ATTACK_HANDLER_SPECIAL_HUGE_GOOMBA_WEAKLY_ATTACKED 7
#macro ATTACK_HANDLER_SQUISHED_WITH_BLUE_COIN 8

#macro POS_OP_SAVE_POSITION 0
#macro POS_OP_COMPUTE_VELOCITY 1
#macro POS_OP_RESTORE_POSITION 2

globalvar sMasterTreadmill;
sMasterTreadmill = null;

globalvar sObjSavedPosX, sObjSavedPosY, sObjSavedPosZ;
sObjSavedPosX		= 0;
sObjSavedPosY		= 0;
sObjSavedPosZ		= 0;

boot("object_behaviors_2_macros_init");
}

/// <pygml?v=1.0&h=33c7846f3>
/// @function	obj_is_rendering_enabled()
/// @returns	s32
function obj_is_rendering_enabled() {
    var o = gCurrentObject;

    if (o.header.gfx.node.flags & GRAPH_RENDER_ACTIVE) {
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=0c5fa4569>
/// @function	obj_get_pitch_from_vel()
/// @returns	s16
function obj_get_pitch_from_vel() {
    var o = gCurrentObject;

    return -atan2s(o.rawData[oForwardVel], o.rawData[oVelY]);
}

/// <pygml?v=1.0&h=19bbe288a>
/// @function	obj_update_race_proposition_dialog(dialogID)
/// @desc		Show dialog proposing a race.  If the player accepts the
///					race, then leave time stop enabled and Mario in the  text
///					action so that the racing object can wait before starting
///					the race.  If the player declines the race, then disable
///					time stop and allow Mario to  move again.
/// @param		{s16}		dialogID
/// @returns	s32
function obj_update_race_proposition_dialog(dialogID) {
    var dialogResponse =
        cur_obj_update_dialog_with_cutscene(2, DIALOG_UNK2_FLAG_0 | DIALOG_UNK2_LEAVE_TIME_STOP_ENABLED, CUTSCENE_RACE_DIALOG, dialogID);

    if (dialogResponse == 2) {
        set_mario_npc_dialog(0);
        disable_time_stop_including_mario();
    }

    return dialogResponse;
}

/// <pygml?v=1.0&h=c3782af9c>
/// @function	obj_set_dist_from_home(distFromHome)
/// @param		{f32}		distFromHome
function obj_set_dist_from_home(distFromHome) {
    var o = gCurrentObject;

    o.rawData[oPosX] = o.rawData[oHomeX] + distFromHome * coss(o.rawData[oMoveAngleYaw]);
    o.rawData[oPosZ] = o.rawData[oHomeZ] + distFromHome * sins(o.rawData[oMoveAngleYaw]);
}

/// <pygml?v=1.0&h=f1a32e32f>
/// @function	obj_is_near_to_and_facing_mario(maxDist, maxAngleDiff)
/// @param		{f32}		maxDist
/// @param		{s16}		maxAngleDiff
/// @returns	s32
function obj_is_near_to_and_facing_mario(maxDist, maxAngleDiff) {
    var o = gCurrentObject;

    if (o.rawData[oDistanceToMario] < maxDist &&
        abs_angle_diff(o.rawData[oMoveAngleYaw], o.rawData[oAngleToMario]) < maxAngleDiff) {
        return true;
    }
    return false;
}

/// <pygml?v=1.0&h=2ef1c6e5b>
/// @function	obj_perform_position_op(op)
/// @param		{s32}		op
//! Although having no return value, this function
//! must be var to match other functions on -O2.
function obj_perform_position_op(op) {
    var o = gCurrentObject;

    switch (op) {
        case (POS_OP_SAVE_POSITION):
            sObjSavedPosX = o.rawData[oPosX];
            sObjSavedPosY = o.rawData[oPosY];
            sObjSavedPosZ = o.rawData[oPosZ];
            break;

        case (POS_OP_COMPUTE_VELOCITY):
            o.rawData[oVelX] = o.rawData[oPosX] - sObjSavedPosX;
            o.rawData[oVelY] = o.rawData[oPosY] - sObjSavedPosY;
            o.rawData[oVelZ] = o.rawData[oPosZ] - sObjSavedPosZ;
            break;

        case (POS_OP_RESTORE_POSITION):
            o.rawData[oPosX] = sObjSavedPosX;
            o.rawData[oPosY] = sObjSavedPosY;
            o.rawData[oPosZ] = sObjSavedPosZ;
            break;
    }
}

/// <pygml?v=1.0&h=eb459d7f1>
/// @function	platform_on_track_update_pos_or_spawn_ball(ballIndex, x, y, z)
/// @param		{s32}		ballIndex
/// @param		{f32}		x
/// @param		{f32}		y
/// @param		{f32}		z
function platform_on_track_update_pos_or_spawn_ball(ballIndex, _x, _y, _z) {
    var o = gCurrentObject;

    var trackBall;
    var initialPrevWaypoint;
    var nextWaypoint;
    var prevWaypoint;
    var unused;
    var amountToMove;
    var dx;
    var dy;
    var dz;
    var distToNextWaypoint;

    if (ballIndex == 0 || ((o.rawData[oBehParams] >> 16) & 0x0080)) {
        initialPrevWaypoint = o.rawData[oPlatformOnTrackPrevWaypoint];
        nextWaypoint = initialPrevWaypoint;

        if (ballIndex != 0) {
            amountToMove = 300.0 * ballIndex;
        } else {
            obj_perform_position_op(POS_OP_SAVE_POSITION);
            o.rawData[oPlatformOnTrackPrevWaypointFlags] = 0;
            amountToMove = o.rawData[oForwardVel];
        }

        do {
            prevWaypoint = nextWaypoint;

            nextWaypoint += 1;
            if (nextWaypoint.flags == WAYPOINT_FLAGS_END) {
                if (ballIndex == 0) {
                    o.rawData[oPlatformOnTrackPrevWaypointFlags] = WAYPOINT_FLAGS_END;
                }

                if (((o.rawData[oBehParams] >> 16) & PLATFORM_ON_TRACK_BP_RETURN_TO_START)) {
                    nextWaypoint = o.rawData[oPlatformOnTrackStartWaypoint];
                } else {
                    return;
                }
            }

            dx = nextWaypoint.pos[0] - _x;
            dy = nextWaypoint.pos[1] - _y;
            dz = nextWaypoint.pos[2] - _z;

            distToNextWaypoint = sqrt(dx * dx + dy * dy + dz * dz);

            // Move directly to the next waypoint, even if it's farther away
            // than amountToMove
            amountToMove -= distToNextWaypoint;
            _x += dx;
            _y += dy;
            _z += dz;
        } until (!(amountToMove > 0.0));

        // If we moved farther than amountToMove, move in the opposite direction
        // No risk of near-zero division: If distToNextWaypoint is close to
        // zero, then that means we didn't cross a waypoint this frame (since
        // otherwise distToNextWaypoint would equal the distance between two
        // waypoints, which should never be that small). But this implies that
        // amountToMove - distToNextWaypoint <= 0, and amountToMove is at least
        // 0.1 (from platform on track behavior).
        distToNextWaypoint = amountToMove / distToNextWaypoint;
        _x += dx * distToNextWaypoint;
        _y += dy * distToNextWaypoint;
        _z += dz * distToNextWaypoint;

        if (ballIndex != 0) {
            trackBall = spawn_object_relative(o.rawData[oPlatformOnTrackBaseBallIndex] + ballIndex, 0, 0, 0, o,
                MODEL_TRAJECTORY_MARKER_BALL, bhvTrackBall);

            if (trackBall != null) {
                trackBall.rawData[oPosX] = _x;
                trackBall.rawData[oPosY] = _y;
                trackBall.rawData[oPosZ] = _z;
            }
        } else {
            if (prevWaypoint != initialPrevWaypoint) {
                if (o.rawData[oPlatformOnTrackPrevWaypointFlags] == 0) {
                    o.rawData[oPlatformOnTrackPrevWaypointFlags] = initialPrevWaypoint.flags;
                }
                o.rawData[oPlatformOnTrackPrevWaypoint] = prevWaypoint;
            }

            o.rawData[oPosX] = _x;
            o.rawData[oPosY] = _y;
            o.rawData[oPosZ] = _z;

            obj_perform_position_op(POS_OP_COMPUTE_VELOCITY);

            o.rawData[oPlatformOnTrackPitch] =
                atan2s(sqrt(o.rawData[oVelX] * o.rawData[oVelX] + o.rawData[oVelZ] * o.rawData[oVelZ]), -o.rawData[oVelY]);
            o.rawData[oPlatformOnTrackYaw] = atan2s(o.rawData[oVelZ], o.rawData[oVelX]);
        }
    }
}

/// <pygml?v=1.0&h=b29b9b607>
/// @function	cur_obj_spin_all_dimensions(arg0, arg1)
/// @param		{f32}		arg0
/// @param		{f32}		arg1
function cur_obj_spin_all_dimensions(arg0, arg1) {
    var o = gCurrentObject;

    var val24;
    var val20;
    var val1C;
    var c;
    var s;
    var val10;
    var val0C;
    var val08;
    var val04;
    var val00;

    if (o.rawData[oForwardVel] == 0.0) {
		val1C = 0.0;
		val20 = val1C;
        val24 = val20;

        if (o.rawData[oMoveFlags] & OBJ_MOVE_IN_AIR) {
            val20 = 50.0;
        } else {
            if (o.rawData[oFaceAnglePitch] < 0) {
                val1C = -arg0;
            } else if (o.rawData[oFaceAnglePitch] > 0) {
                val1C = arg0;
            }

            if (o.rawData[oFaceAngleRoll] < 0) {
                val24 = -arg1;
            } else if (o.rawData[oFaceAngleRoll] > 0) {
                val24 = arg1;
            }
        }

        c = coss(o.rawData[oFaceAnglePitch]);
        s = sins(o.rawData[oFaceAnglePitch]);
        val08 = val1C * c + val20 * s;
        val0C = val20 * c - val1C * s;

        c = coss(o.rawData[oFaceAngleRoll]);
        s = sins(o.rawData[oFaceAngleRoll]);
        val04 = val24 * c + val0C * s;
        val0C = val0C * c - val24 * s;

        c = coss(o.rawData[oFaceAngleYaw]);
        s = sins(o.rawData[oFaceAngleYaw]);
        val10 = val04 * c - val08 * s;
        val08 = val08 * c + val04 * s;

        val04 = val24 * c - val1C * s;
        val00 = val1C * c + val24 * s;

        o.rawData[oPosX] = o.rawData[oHomeX] - val04 + val10;
        o.rawData[oGraphYOffset] = val20 - val0C;
        o.rawData[oPosZ] = o.rawData[oHomeZ] + val00 - val08;
    }
}

/// <pygml?v=1.0&h=df8fb6296>
/// @function	obj_rotate_yaw_and_bounce_off_walls(targetYaw, turnAmount)
/// @param		{s16}		targetYaw
/// @param		{s16}		turnAmount
function obj_rotate_yaw_and_bounce_off_walls(targetYaw, turnAmount) {
    var o = gCurrentObject;

    if (o.rawData[oMoveFlags] & OBJ_MOVE_HIT_WALL) {
        targetYaw = cur_obj_reflect_move_angle_off_wall();
    }
    cur_obj_rotate_yaw_toward(targetYaw, turnAmount);
}

/// <pygml?v=1.0&h=f37178c02>
/// @function	obj_get_pitch_to_home(latDistToHome)
/// @param		{f32}		latDistToHome
/// @returns	s16
function obj_get_pitch_to_home(latDistToHome) {
    var o = gCurrentObject;

    return atan2s(latDistToHome, o.rawData[oPosY] - o.rawData[oHomeY]);
}

/// <pygml?v=1.0&h=cce34e69c>
/// @function	obj_compute_vel_from_move_pitch(speed)
/// @param		{f32}		speed
function obj_compute_vel_from_move_pitch(speed) {
    var o = gCurrentObject;

    o.rawData[oForwardVel] = speed * coss(o.rawData[oMoveAnglePitch]);
    o.rawData[oVelY] = speed * -sins(o.rawData[oMoveAnglePitch]);
}

/// <pygml?v=1.0&h=4abfd871c>
/// @function	clamp_s16(Ptr.p_value, minimum, maximum)
/// @param		{s16}		Ptr.p_value
/// @param		{s16}		minimum
/// @param		{s16}		maximum
/// @returns	s32
function clamp_s16(value, minimum, maximum) {
    if (value <= minimum) {
        value = minimum;
    } else if (value >= maximum) {
        value = maximum;
    } else {
        Ptr.p_value = value;
        return false;
    }

    Ptr.p_value = value;
    return true;
}

/// <pygml?v=1.0&h=9efe75d21>
/// @function	clamp_f32(Ptr.p_value, minimum, maximum)
/// @param		{f32}		Ptr.p_value
/// @param		{f32}		minimum
/// @param		{f32}		maximum
/// @returns	s32
function clamp_f32(value, minimum, maximum) {
    if (value <= minimum) {
        value = minimum;
    } else if (value >= maximum) {
        value = maximum;
    } else {
        Ptr.p_value = value;
        return false;
    }

    Ptr.p_value = value;
    return true;
}

/// <pygml?v=1.0&h=9e1aebd65>
/// @function	cur_obj_init_anim_extend(arg0)
/// @param		{s32}		arg0
function cur_obj_init_anim_extend(arg0) {
    cur_obj_init_animation_with_sound(arg0);
    cur_obj_extend_animation_if_at_end();
}

/// <pygml?v=1.0&h=c3bc99875>
/// @function	cur_obj_init_anim_and_check_if_end(arg0)
/// @param		{s32}		arg0
/// @returns	s32
function cur_obj_init_anim_and_check_if_end(arg0) {
    cur_obj_init_animation_with_sound(arg0);
    return cur_obj_check_if_near_animation_end();
}

/// <pygml?v=1.0&h=2fb537af7>
/// @function	cur_obj_init_anim_check_frame(arg0, arg1)
/// @param		{s32}		arg0
/// @param		{s32}		arg1
/// @returns	s32
function cur_obj_init_anim_check_frame(arg0, arg1) {
    cur_obj_init_animation_with_sound(arg0);
    return cur_obj_check_anim_frame(arg1);
}

/// <pygml?v=1.0&h=5b9554210>
/// @function	cur_obj_set_anim_if_at_end(arg0)
/// @param		{s32}		arg0
/// @returns	s32
function cur_obj_set_anim_if_at_end(arg0) {
    if (cur_obj_check_if_at_animation_end()) {
        cur_obj_init_animation_with_sound(arg0);
        return true;
    }
    return false;
}

/// <pygml?v=1.0&h=df34a4a7c>
/// @function	cur_obj_play_sound_at_anim_range(arg0, arg1, sound)
/// @param		{s8}		arg0
/// @param		{s8}		arg1
/// @param		{u32}		sound
/// @returns	s32
function cur_obj_play_sound_at_anim_range(arg0, arg1, sound) {
    var o = gCurrentObject;

    var val04;

    if ((val04 = o.header.gfx.unk38.animAccel / 0x10000) <= 0) {
        val04 = 1;
    }

    if (cur_obj_check_anim_frame_in_range(arg0, val04) || cur_obj_check_anim_frame_in_range(arg1, val04)) {
        cur_obj_play_sound_2(sound);
        return true;
    }

    return false;
}

/// <pygml?v=1.0&h=d08e667b0>
/// @function	obj_turn_pitch_toward_mario(targetOffsetY, turnAmount)
/// @param		{f32}		targetOffsetY
/// @param		{s16}		turnAmount
/// @returns	s16
function obj_turn_pitch_toward_mario(targetOffsetY, turnAmount) {
    var o = gCurrentObject;

    var targetPitch;

    o.rawData[oPosY] -= targetOffsetY;
    targetPitch = obj_turn_toward_object(o, gMarioObject[0], O_MOVE_ANGLE_PITCH_INDEX, turnAmount);
    o.rawData[oPosY] += targetOffsetY;

    return targetPitch;
}

/// <pygml?v=1.0&h=dfb5d3d2a>
/// @function	approach_f32_ptr(Ptr.p_px, target, delta)
/// @param		{f32}		Ptr.p_px
/// @param		{f32}		target
/// @param		{f32}		delta
/// @returns	s32
function approach_f32_ptr(px, target, delta) {
    if (px > target) {
        delta = -delta;
    }

    px += delta;

    if ((px - target) * delta >= 0) {
        px = target;
        Ptr.p_px = px;
        return true;
    }
    Ptr.p_px = px;
    return false;
}

/// <pygml?v=1.0&h=dcfff19f2>
/// @function	obj_forward_vel_approach(target, delta)
/// @param		{f32}		target
/// @param		{f32}		delta
/// @returns	s32
function obj_forward_vel_approach(target, delta) {
    var o = gCurrentObject;

    var ret = approach_f32_ptr(o.rawData[oForwardVel], target, delta);
	o.rawData[oForwardVel] = Ptr.p_px;
	return ret;
}

/// <pygml?v=1.0&h=feabead70>
/// @function	obj_y_vel_approach(target, delta)
/// @param		{f32}		target
/// @param		{f32}		delta
/// @returns	s32
function obj_y_vel_approach(target, delta) {
    var o = gCurrentObject;

    var ret = approach_f32_ptr(o.rawData[oVelY], target, delta);
	o.rawData[oVelY] = Ptr.p_px;
	return ret;
}

/// <pygml?v=1.0&h=601ae1406>
/// @function	obj_move_pitch_approach(target, delta)
/// @param		{s16}		target
/// @param		{s16}		delta
/// @returns	s32
function obj_move_pitch_approach(target, delta) {
    var o = gCurrentObject;

    o.rawData[oMoveAnglePitch] = approach_s16_symmetric(o.rawData[oMoveAnglePitch], target, delta);

    if (o.rawData[oMoveAnglePitch] == target) {
        return true;
    }

    return false;
}

/// <pygml?v=1.0&h=2811c02b6>
/// @function	obj_face_pitch_approach(targetPitch, deltaPitch)
/// @param		{s16}		targetPitch
/// @param		{s16}		deltaPitch
/// @returns	s32
function obj_face_pitch_approach(targetPitch, deltaPitch) {
    var o = gCurrentObject;

    o.rawData[oFaceAnglePitch] = approach_s16_symmetric(o.rawData[oFaceAnglePitch], targetPitch, deltaPitch);

    if (o.rawData[oFaceAnglePitch] == targetPitch) {
        return true;
    }

    return false;
}

/// <pygml?v=1.0&h=ffd6d8549>
/// @function	obj_face_yaw_approach(targetYaw, deltaYaw)
/// @param		{s16}		targetYaw
/// @param		{s16}		deltaYaw
/// @returns	s32
function obj_face_yaw_approach(targetYaw, deltaYaw) {
    var o = gCurrentObject;

    o.rawData[oFaceAngleYaw] = approach_s16_symmetric(o.rawData[oFaceAngleYaw], targetYaw, deltaYaw);

    if (o.rawData[oFaceAngleYaw] == targetYaw) {
        return true;
    }

    return false;
}

/// <pygml?v=1.0&h=3d4360ebb>
/// @function	obj_face_roll_approach(targetRoll, deltaRoll)
/// @param		{s16}		targetRoll
/// @param		{s16}		deltaRoll
/// @returns	s32
function obj_face_roll_approach(targetRoll, deltaRoll) {
    var o = gCurrentObject;

    o.rawData[oFaceAngleRoll] = approach_s16_symmetric(o.rawData[oFaceAngleRoll], targetRoll, deltaRoll);

    if (o.rawData[oFaceAngleRoll] == targetRoll) {
        return true;
    }

    return false;
}



/// <pygml?v=1.0&h=e549f5638>
/// @function	obj_smooth_turn(Ptr.p_angleVel, Ptr.p_angle, targetAngle, targetSpeedProportion, accel, minSpeed, maxSpeed)
/// @param		{s16}		Ptr.p_angleVel
/// @param		{s32}		Ptr.p_angle
/// @param		{s16}		targetAngle
/// @param		{f32}		targetSpeedProportion
/// @param		{s16}		accel
/// @param		{s16}		minSpeed
/// @param		{s16}		maxSpeed
/// @returns	s32
function obj_smooth_turn(angleVel, angle, targetAngle, targetSpeedProportion, accel, minSpeed, maxSpeed) {
    var currentSpeed;
    var currentAngle = (angle);

    angleVel =
        approach_s16_symmetric(angleVel, (targetAngle - currentAngle) * targetSpeedProportion, accel);

    currentSpeed = abs(angleVel);
    clamp_s16(currentSpeed, minSpeed, maxSpeed);
	currentSpeed = Ptr.p_value;

    angle = approach_s16_symmetric(angle, targetAngle, currentSpeed);
    Ptr.p_angleVel = angleVel;
    Ptr.p_angle = angle;
    return angle == targetAngle;
}

/// <pygml?v=1.0&h=ca8be6881>
/// @function	obj_roll_to_match_yaw_turn(targetYaw, maxRoll, rollSpeed)
/// @param		{s16}		targetYaw
/// @param		{s16}		maxRoll
/// @param		{s16}		rollSpeed
function obj_roll_to_match_yaw_turn(targetYaw, maxRoll, rollSpeed) {
    var o = gCurrentObject;

    var targetRoll = o.rawData[oMoveAngleYaw] - targetYaw;
    clamp_s16(targetRoll, -maxRoll, maxRoll);
	targetRoll = Ptr.p_value;
    obj_face_roll_approach(targetRoll, rollSpeed);
}

/// <pygml?v=1.0&h=f6a9da104>
/// @function	random_linear_offset(base, range)
/// @param		{s16}		base
/// @param		{s16}		range
/// @returns	s16
function random_linear_offset(base, range) {
    return base + (range * random_float());
}

/// <pygml?v=1.0&h=bb12b5780>
/// @function	random_mod_offset(base, step, mod)
/// @param		{s16}		base
/// @param		{s16}		step
/// @param		{s16}		mod
/// @returns	s16
function random_mod_offset(base, step, _mod) {
    return base + step * (random_u16() % _mod);
}

/// <pygml?v=1.0&h=23d9d0ede>
/// @function	obj_random_fixed_turn(delta)
/// @param		{s16}		delta
/// @returns	s16
function obj_random_fixed_turn(delta) {
    var o = gCurrentObject;

    return o.rawData[oMoveAngleYaw] + random_sign() * delta;
}


/// <pygml?v=1.0&h=038d67084>
/// @function	obj_grow_then_shrink(Ptr.p_scaleVel, shootFireScale, endScale)
/// @desc		Begin by increasing the object's scale by scaleVel, and
///					slowly decreasing  scaleVel. Once the object starts to
///					shrink, wait a bit, and then begin to  scale the object
///					toward endScale. The first time it reaches below
///					shootFireScale during this time, return 1.  Return -1 once
///					it's reached endScale.
/// @param		{f32}		Ptr.p_scaleVel
/// @param		{f32}		shootFireScale
/// @param		{f32}		endScale
/// @returns	s32
function obj_grow_then_shrink(scaleVel, shootFireScale, endScale) {
    var o = gCurrentObject;

    if (o.rawData[oTimer] < 2) {
        o.header.gfx.scale[0] += scaleVel;

		scaleVel -= 0.01;
        if (scaleVel > -0.03) {
            o.rawData[oTimer] = 0;
        }
    } else if (o.rawData[oTimer] > 10) {
        if (approach_f32_ptr(o.header.gfx.scale[0], endScale, 0.05)) {
			o.header.gfx.scale[0] = Ptr.p_px;
            Ptr.p_scaleVel = scaleVel;
            return -1;
        } else if (scaleVel != 0.0 && o.header.gfx.scale[0] < shootFireScale) {
            scaleVel = 0.0;
            Ptr.p_scaleVel = scaleVel;
            return 1;
        }
    }

    Ptr.p_scaleVel = scaleVel;
    return 0;
}

/// <pygml?v=1.0&h=f50240ba0>
/// @function	oscillate_toward(Ptr.p_value, Ptr.p_vel, target, velCloseToZero, accel, slowdown)
/// @param		{s32}		Ptr.p_value
/// @param		{f32}		Ptr.p_vel
/// @param		{s32}		target
/// @param		{f32}		velCloseToZero
/// @param		{f32}		accel
/// @param		{f32}		slowdown
/// @returns	s32
function oscillate_toward(value, vel, target, velCloseToZero, accel, slowdown) {
    var startValue = value;
    value += vel;

    if (value == target ||
        ((value - target) * (startValue - target) < 0 && vel > -velCloseToZero &&
            vel < velCloseToZero)) {
        value = target;
        vel = 0.0;
        Ptr.p_value = value;
        Ptr.p_vel = vel;
        return true;
    } else {
        if (value >= target) {
            accel = -accel;
        }
        if (vel * accel < 0.0) {
            accel *= slowdown;
        }

        vel += accel;
    }

    Ptr.p_value = value;
    Ptr.p_vel = vel;
    return false;
}

/// <pygml?v=1.0&h=494138584>
/// @function	obj_update_blinking(Ptr.p_blinkTimer, baseCycleLength, cycleLengthRange, blinkLength)
/// @param		{s32}		Ptr.p_blinkTimer
/// @param		{s16}		baseCycleLength
/// @param		{s16}		cycleLengthRange
/// @param		{s16}		blinkLength
function obj_update_blinking(blinkTimer, baseCycleLength, cycleLengthRange, blinkLength) {
    var o = gCurrentObject;

    if (blinkTimer != 0) {
        blinkTimer -= 1;
    } else {
        blinkTimer = random_linear_offset(baseCycleLength, cycleLengthRange);
    }

    if (blinkTimer > blinkLength) {
        o.rawData[oAnimState] = 0;
    } else {
        o.rawData[oAnimState] = 1;
    }

    Ptr.p_blinkTimer = blinkTimer;
}

/// <pygml?v=1.0&h=b6ef0c317>
/// @function	obj_resolve_object_collisions(Ptr.p_targetYaw)
/// @param		{s32}		Ptr.p_targetYaw
/// @returns	s32
function obj_resolve_object_collisions(targetYaw) {
    var o = gCurrentObject;

    var otherObject;
    var dx;
    var dz;
    var angle;
    var radius;
    var otherRadius;
    var relativeRadius;
    var newCenterX;
    var newCenterZ;

    if (o.numCollidedObjs != 0) {
        otherObject = o.collidedObjs.content[0];
        if (otherObject != gMarioObject[0]) {
            //! If one object moves after collisions are detected and this code
            //  runs, the objects can move toward each other (transport cloning)

            dx = otherObject.rawData[oPosX] - o.rawData[oPosX];
            dz = otherObject.rawData[oPosZ] - o.rawData[oPosZ];
            angle = atan2s(dx, dz); //! This should be atan2s(dz, dx)

            radius = o.hitboxRadius;
            otherRadius = otherObject.hitboxRadius;
            relativeRadius = radius / (radius + otherRadius);

            newCenterX = o.rawData[oPosX] + dx * relativeRadius;
            newCenterZ = o.rawData[oPosZ] + dz * relativeRadius;

            o.rawData[oPosX] = newCenterX - radius * coss(angle);
            o.rawData[oPosZ] = newCenterZ - radius * sins(angle);

            otherObject.rawData[oPosX] = newCenterX + otherRadius * coss(angle);
            otherObject.rawData[oPosZ] = newCenterZ + otherRadius * sins(angle);

            if (targetYaw != null && abs_angle_diff(o.rawData[oMoveAngleYaw], angle) < 0x4000) {
                // Bounce off object (or it would, if the above atan2s bug
                // were fixed)
                targetYaw = (angle - o.rawData[oMoveAngleYaw] + angle + 0x8000);
                Ptr.p_targetYaw = targetYaw;
                return true;
            }
        }
    }

    Ptr.p_targetYaw = targetYaw;
    return false;
}

/// <pygml?v=1.0&h=a0e7b1c1f>
/// @function	obj_bounce_off_walls_edges_objects(Ptr.p_targetYaw)
/// @param		{s32}		Ptr.p_targetYaw
/// @returns	s32
function obj_bounce_off_walls_edges_objects(targetYaw) {
    var o = gCurrentObject;

    if (o.rawData[oMoveFlags] & OBJ_MOVE_HIT_WALL) {
        targetYaw = cur_obj_reflect_move_angle_off_wall();
    } else if (o.rawData[oMoveFlags] & OBJ_MOVE_HIT_EDGE) {
        targetYaw = (o.rawData[oMoveAngleYaw] + 0x8000);
    } else if (!obj_resolve_object_collisions(targetYaw)) {
		targetYaw = Ptr.p_targetYaw;
        Ptr.p_targetYaw = targetYaw;
        return false;
    }

    Ptr.p_targetYaw = targetYaw;
    return true;
}

/// <pygml?v=1.0&h=399695987>
/// @function	obj_resolve_collisions_and_turn(targetYaw, turnSpeed)
/// @param		{s16}		targetYaw
/// @param		{s16}		turnSpeed
/// @returns	s32
function obj_resolve_collisions_and_turn(targetYaw, turnSpeed) {
	var v = null;
    obj_resolve_object_collisions(v);
	Ptr.p_targetYaw = v;

    if (cur_obj_rotate_yaw_toward(targetYaw, turnSpeed)) {
        return false;
    } else {
        return true;
    }
}

/// <pygml?v=1.0&h=5e02b57dc>
/// @function	obj_die_if_health_non_positive()
function obj_die_if_health_non_positive() {
    var o = gCurrentObject;

    if (o.rawData[oHealth] <= 0) {
        if (o.rawData[oDeathSound] == 0) {
            spawn_mist_particles_with_sound(SOUND_OBJ_DEFAULT_DEATH);
        } else if (o.rawData[oDeathSound] > 0) {
            spawn_mist_particles_with_sound(o.rawData[oDeathSound]);
        } else {
            spawn_mist_particles();
        }

        if (o.rawData[oNumLootCoins] < 0) {
            spawn_object(o, MODEL_BLUE_COIN, bhvMrIBlueCoin);
        } else {
            obj_spawn_loot_yellow_coins(o, o.rawData[oNumLootCoins], 20.0);
        }
        // This doesn't do anything
        obj_spawn_loot_yellow_coins(o, o.rawData[oNumLootCoins], 20.0);

        if (o.rawData[oHealth] < 0) {
            cur_obj_hide();
            cur_obj_become_intangible();
        } else {
            obj_mark_for_deletion(o);
        }
    }
}

/// <pygml?v=1.0&h=b44e5c4be>
/// @function	obj_unused_die()
function obj_unused_die() {
    var o = gCurrentObject;

    o.rawData[oHealth] = 0;
    obj_die_if_health_non_positive();
}

/// <pygml?v=1.0&h=e6ec03dd6>
/// @function	obj_set_knockback_action(attackType)
/// @param		{s32}		attackType
function obj_set_knockback_action(attackType) {
    var o = gCurrentObject;

    switch (attackType) {
        case (ATTACK_KICK_OR_TRIP):
        case (ATTACK_FAST_ATTACK):
            o.rawData[oAction] = OBJ_ACT_VERTICAL_KNOCKBACK;
            o.rawData[oForwardVel] = 20.0;
            o.rawData[oVelY] = 50.0;
            break;

        default:
            o.rawData[oAction] = OBJ_ACT_HORIZONTAL_KNOCKBACK;
            o.rawData[oForwardVel] = 50.0;
            o.rawData[oVelY] = 30.0;
            break;
    }

    o.rawData[oFlags] &= ~OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW;
    o.rawData[oMoveAngleYaw] = obj_angle_to_object(gMarioObject[0], o);
}

/// <pygml?v=1.0&h=291160b5e>
/// @function	obj_set_squished_action()
function obj_set_squished_action() {
    var o = gCurrentObject;

    cur_obj_play_sound_2(SOUND_OBJ_STOMPED);
    o.rawData[oAction] = OBJ_ACT_SQUISHED;
}

/// <pygml?v=1.0&h=327e258eb>
/// @function	obj_die_if_above_lava_and_health_non_positive()
/// @returns	s32
function obj_die_if_above_lava_and_health_non_positive() {
    var o = gCurrentObject;

    if (o.rawData[oMoveFlags] & OBJ_MOVE_UNDERWATER_ON_GROUND) {
        if (o.rawData[oGravity] + o.rawData[oBuoyancy] > 0.0 ||
            find_water_level(o.rawData[oPosX], o.rawData[oPosZ]) - o.rawData[oPosY] < 150.0) {
            return false;
        }
    } else if (!(o.rawData[oMoveFlags] & OBJ_MOVE_ABOVE_LAVA)) {
        if (o.rawData[oMoveFlags] & OBJ_MOVE_ENTERED_WATER) {
            if (o.rawData[oWallHitboxRadius] < 200.0) {
                cur_obj_play_sound_2(SOUND_OBJ_DIVING_INTO_WATER);
            } else {
                cur_obj_play_sound_2(SOUND_OBJ_DIVING_IN_WATER);
            }
        }
        return false;
    }

    obj_die_if_health_non_positive();
    return true;
}

/// <pygml?v=1.0&h=3af0b7ac2>
/// @function	obj_handle_attacks(hitbox, attackedMarioAction, Ptr.p_attackHandlers)
/// @param		{struct}	hitbox
/// @param		{s32}		attackedMarioAction
/// @param		{u8}		Ptr.p_attackHandlers
/// @returns	s32
function obj_handle_attacks(hitbox, attackedMarioAction, attackHandlers) {
    var o = gCurrentObject;

    var attackType;

    obj_set_hitbox(o, hitbox);

    //! Die immediately if above lava
    if (obj_die_if_above_lava_and_health_non_positive()) {
        return 1;
    } else if (o.rawData[oInteractStatus] & INT_STATUS_INTERACTED) {
        if (o.rawData[oInteractStatus] & INT_STATUS_ATTACKED_MARIO) {
            if (o.rawData[oAction] != attackedMarioAction) {
                o.rawData[oAction] = attackedMarioAction;
                o.rawData[oTimer] = 0;
            }
        } else {
            attackType = o.rawData[oInteractStatus] & INT_STATUS_ATTACK_MASK;

            switch (attackHandlers[@ attackType - 1]) {
                case (ATTACK_HANDLER_NOP):
                    break;

                case (ATTACK_HANDLER_DIE_IF_HEALTH_NON_POSITIVE):
                    obj_die_if_health_non_positive();
                    break;

                case (ATTACK_HANDLER_KNOCKBACK):
                    obj_set_knockback_action(attackType);
                    break;

                case (ATTACK_HANDLER_SQUISHED):
                    obj_set_squished_action();
                    break;

                case (ATTACK_HANDLER_SPECIAL_KOOPA_LOSE_SHELL):
                    shelled_koopa_attack_handler(attackType);
                    break;

                case (ATTACK_HANDLER_SET_SPEED_TO_ZERO):
                    obj_set_speed_to_zero();
                    break;

                case (ATTACK_HANDLER_SPECIAL_WIGGLER_JUMPED_ON):
                    wiggler_jumped_on_attack_handler();
                    break;

                case (ATTACK_HANDLER_SPECIAL_HUGE_GOOMBA_WEAKLY_ATTACKED):
                    huge_goomba_weakly_attacked();
                    break;

                case (ATTACK_HANDLER_SQUISHED_WITH_BLUE_COIN):
                    o.rawData[oNumLootCoins] = -1;
                    obj_set_squished_action();
                    break;
            }

            o.rawData[oInteractStatus] = 0;
            return attackType;
        }
    }

    o.rawData[oInteractStatus] = 0;
    return 0;
}

/// <pygml?v=1.0&h=050c0b22a>
/// @function	obj_act_knockback(baseScale)
/// @param		{f32}		baseScale
function obj_act_knockback(baseScale) {
    var o = gCurrentObject;

    cur_obj_update_floor_and_walls();

    if (o.header.gfx.unk38.curAnim != null) {
        cur_obj_extend_animation_if_at_end();
    }

    //! Dies immediately if above lava
    if ((o.rawData[oMoveFlags] &
            (OBJ_MOVE_MASK_ON_GROUND | OBJ_MOVE_MASK_IN_WATER | OBJ_MOVE_HIT_WALL | OBJ_MOVE_ABOVE_LAVA)) ||
        (o.rawData[oAction] == OBJ_ACT_VERTICAL_KNOCKBACK && o.rawData[oTimer] >= 9)) {
        obj_die_if_health_non_positive();
    }

    cur_obj_move_standard(-78);
}

/// <pygml?v=1.0&h=362870a73>
/// @function	obj_act_squished(baseScale)
/// @param		{f32}		baseScale
function obj_act_squished(baseScale) {
    var o = gCurrentObject;

    var targetScaleY = baseScale * 0.3;

    cur_obj_update_floor_and_walls();

    if (o.header.gfx.unk38.curAnim != null) {
        cur_obj_extend_animation_if_at_end();
    }

    if (approach_f32_ptr(o.header.gfx.scale[1], targetScaleY, baseScale * 0.14)) {
		o.header.gfx.scale[1] = Ptr.p_px;
        o.header.gfx.scale[0] = o.header.gfx.scale[2] = baseScale * 2.0 - o.header.gfx.scale[1];

        if (o.rawData[oTimer] >= 16) {
            obj_die_if_health_non_positive();
        }
    }

    o.rawData[oForwardVel] = 0.0;
    cur_obj_move_standard(-78);
}

/// <pygml?v=1.0&h=c2b070eb9>
/// @function	obj_update_standard_actions(scale)
/// @param		{f32}		scale
/// @returns	s32
function obj_update_standard_actions(scale) {
    var o = gCurrentObject;

    if (o.rawData[oAction] < 100) {
        return true;
    } else {
        cur_obj_become_intangible();

        switch (o.rawData[oAction]) {
            case (OBJ_ACT_HORIZONTAL_KNOCKBACK):
            case (OBJ_ACT_VERTICAL_KNOCKBACK):
                obj_act_knockback(scale);
                break;

            case (OBJ_ACT_SQUISHED):
                obj_act_squished(scale);
                break;
        }

        return false;
    }
}

/// <pygml?v=1.0&h=f7a9d7229>
/// @function	obj_check_attacks(hitbox, attackedMarioAction)
/// @param		{struct}	hitbox
/// @param		{s32}		attackedMarioAction
/// @returns	s32
function obj_check_attacks(hitbox, attackedMarioAction) {
    var o = gCurrentObject;

    var attackType;

    obj_set_hitbox(o, hitbox);

    //! Dies immediately if above lava
    if (obj_die_if_above_lava_and_health_non_positive()) {
        return 1;
    } else if (o.rawData[oInteractStatus] & INT_STATUS_INTERACTED) {
        if (o.rawData[oInteractStatus] & INT_STATUS_ATTACKED_MARIO) {
            if (o.rawData[oAction] != attackedMarioAction) {
                o.rawData[oAction] = attackedMarioAction;
                o.rawData[oTimer] = 0;
            }
        } else {
            attackType = o.rawData[oInteractStatus] & INT_STATUS_ATTACK_MASK;
            obj_die_if_health_non_positive();
            o.rawData[oInteractStatus] = 0;
            return attackType;
        }
    }

    o.rawData[oInteractStatus] = 0;
    return 0;
}

/// <pygml?v=1.0&h=aa95542c6>
/// @function	obj_move_for_one_second(endAction)
/// @param		{s32}		endAction
/// @returns	s32
function obj_move_for_one_second(endAction) {
    var o = gCurrentObject;

    cur_obj_update_floor_and_walls();
    cur_obj_extend_animation_if_at_end();

    if (o.rawData[oTimer] > 30) {
        o.rawData[oAction] = endAction;
        return true;
    }

    cur_obj_move_standard(-78);
    return false;
}

/// <pygml?v=1.0&h=04c890224>
/// @function	treat_far_home_as_mario(threshold)
/// @desc		If we are far from home (> threshold away), then set
///					oAngleToMario to the  angle to home and oDistanceToMario to
///					25000.  If we are close to home, but Mario is far from us (>
///					threshold away), then  keep oAngleToMario the same and set
///					oDistanceToMario to 20000.  If we are close to both home and
///					Mario, then keep both oAngleToMario and  oDistanceToMario
///					the same.   The point of this function is to avoid having to
///					write extra code to get  the object to return to home. When
///					Mario is far away and the object is far  from home, it could
///					theoretically re-use the "approach Mario" logic to approach
///					its home instead.  However, most objects that use this
///					function handle the far-from-home case  separately anyway.
///					This function causes seemingly erroneous behavior in some
///					objects that try to  attack Mario (e.g. fly guy shooting
///					fire or lunging), especially when combined  with partial
///					updates.
/// @param		{f32}		threshold
function treat_far_home_as_mario(threshold) {
    var o = gCurrentObject;

    var dx = o.rawData[oHomeX] - o.rawData[oPosX];
    var dy = o.rawData[oHomeY] - o.rawData[oPosY];
    var dz = o.rawData[oHomeZ] - o.rawData[oPosZ];
    var distance = sqrt(dx * dx + dy * dy + dz * dz);

    if (distance > threshold) {
        o.rawData[oAngleToMario] = atan2s(dz, dx);
        o.rawData[oDistanceToMario] = 25000.0;
    } else {
        dx = o.rawData[oHomeX] - gMarioObject[0].rawData[oPosX];
        dy = o.rawData[oHomeY] - gMarioObject[0].rawData[oPosY];
        dz = o.rawData[oHomeZ] - gMarioObject[0].rawData[oPosZ];
        distance = sqrt(dx * dx + dy * dy + dz * dz);

        if (distance > threshold) {
            o.rawData[oDistanceToMario] = 20000.0;
        }
    }
}