function LandAction(_numFrames, _unk02, _verySteepAction, _endAction, _aPressedAction, _offFloorAction, _slideAction) constructor {
	numFrames		= _numFrames;
	unk02			= _unk02;
	verySteepAction = _verySteepAction;
	endAction		= _endAction;
	aPressedAction	= _aPressedAction;
	offFloorAction	= _offFloorAction;
	slideAction		= _slideAction;
}

function mario_actions_moving_macros_init() {
	
	globalvar sJumpLandAction,
	sFreefallLandAction,
	sSideFlipLandAction,
	sHoldJumpLandAction,
	sHoldFreefallLandAction,
	sDoubleJumpLandAction,
	sTripleJumpLandAction,
	sBackflipLandAction,
	sLongJumpLandAction;
	
	sJumpLandAction			= new LandAction(4, 5, ACT_FREEFALL, ACT_JUMP_LAND_STOP, ACT_DOUBLE_JUMP, ACT_FREEFALL, ACT_BEGIN_SLIDING);
	sFreefallLandAction		= new LandAction(4, 5, ACT_FREEFALL, ACT_FREEFALL_LAND_STOP, ACT_DOUBLE_JUMP, ACT_FREEFALL, ACT_BEGIN_SLIDING);
	sSideFlipLandAction		= new LandAction(4, 5, ACT_FREEFALL, ACT_SIDE_FLIP_LAND_STOP, ACT_DOUBLE_JUMP, ACT_FREEFALL, ACT_BEGIN_SLIDING);
	sHoldJumpLandAction 	= new LandAction(4, 5, ACT_HOLD_FREEFALL, ACT_HOLD_JUMP_LAND_STOP, ACT_HOLD_JUMP, ACT_HOLD_FREEFALL, ACT_HOLD_BEGIN_SLIDING);
	sHoldFreefallLandAction = new LandAction(4, 5, ACT_HOLD_FREEFALL, ACT_HOLD_FREEFALL_LAND_STOP, ACT_HOLD_JUMP, ACT_HOLD_FREEFALL, ACT_HOLD_BEGIN_SLIDING);
	sLongJumpLandAction		= new LandAction(6, 5, ACT_FREEFALL, ACT_LONG_JUMP_LAND_STOP,ACT_LONG_JUMP, ACT_FREEFALL,ACT_BEGIN_SLIDING);
	sDoubleJumpLandAction	= new LandAction(4, 5, ACT_FREEFALL, ACT_DOUBLE_JUMP_LAND_STOP, ACT_JUMP, ACT_FREEFALL, ACT_BEGIN_SLIDING);
	sTripleJumpLandAction	= new LandAction(4, 0, ACT_FREEFALL, ACT_TRIPLE_JUMP_LAND_STOP, null, ACT_FREEFALL, ACT_BEGIN_SLIDING);
	sBackflipLandAction		= new LandAction(4, 0, ACT_FREEFALL, ACT_BACKFLIP_LAND_STOP, ACT_BACKFLIP, ACT_FREEFALL, ACT_BEGIN_SLIDING);

	globalvar sFloorAlignMatrix;
	sFloorAlignMatrix = [Mat4, Mat4];
	
	boot("mario_actions_moving_macros_init");
}

/// <pygml?v=1.0&h=ef24764d7>
/// @function	tilt_body_running(m)
/// @param		{struct}	m
/// @returns	s16
function tilt_body_running(m) {
    var pitch = find_floor_slope(m, 0);
    pitch = pitch * m.forwardVel / 40.0;
    return -pitch;
}

/// <pygml?v=1.0&h=16b66827b>
/// @function	play_step_sound(m, frame1, frame2)
/// @param		{struct}	m
/// @param		{s16}		frame1
/// @param		{s16}		frame2
function play_step_sound(m, frame1, frame2) {
    if (is_anim_past_frame(m, frame1) || is_anim_past_frame(m, frame2)) {
        if (m.flags & MARIO_METAL_CAP) {
            if (m.marioObj.header.gfx.unk38.animID == MARIO_ANIM_TIPTOE) {
                play_sound_and_spawn_particles(m, SOUND_ACTION_METAL_STEP_TIPTOE, 0);
            } else {
                play_sound_and_spawn_particles(m, SOUND_ACTION_METAL_STEP, 0);
            }
        } else if (m.quicksandDepth > 50.0) {
            play_sound(SOUND_ACTION_QUICKSAND_STEP, m.marioObj.header.gfx.cameraToObject);
        } else if (m.marioObj.header.gfx.unk38.animID == MARIO_ANIM_TIPTOE) {
            play_sound_and_spawn_particles(m, SOUND_ACTION_TERRAIN_STEP_TIPTOE, 0);
        } else {
            play_sound_and_spawn_particles(m, SOUND_ACTION_TERRAIN_STEP, 0);
        }
    }
}

/// <pygml?v=1.0&h=acf405400>
/// @function	align_with_floor(m)
/// @param		{struct}	m
function align_with_floor(m) {
    m.pos[1] = m.floorHeight;
    mtxf_align_terrain_triangle(sFloorAlignMatrix[m.unk00], m.pos, m.faceAngle[1], 40.0);
    m.marioObj.header.gfx.throwMatrix = sFloorAlignMatrix[m.unk00];
}

/// <pygml?v=1.0&h=0f479eb4f>
/// @function	begin_walking_action(m, forwardVel, action, actionArg)
/// @param		{struct}	m
/// @param		{f32}		forwardVel
/// @param		{u32}		action
/// @param		{u32}		actionArg
/// @returns	s32
function begin_walking_action(m, forwardVel, action, actionArg) {
    m.faceAngle[1] = m.intendedYaw;
    mario_set_forward_vel(m, forwardVel);
    return set_mario_action(m, action, actionArg);
}

/// <pygml?v=1.0&h=621e25cd9>
/// @function	check_ledge_climb_down(m)
/// @param		{struct}	m
function check_ledge_climb_down(m) {
    var wallCols = {};
    var _floor = {};
    var floorHeight;
    var wall;
    var wallAngle;
    var wallDYaw;

    if (m.forwardVel < 10.0) {
        wallCols.x = m.pos[0];
        wallCols.y = m.pos[1];
        wallCols.z = m.pos[2];
        wallCols.radius = 10.0;
        wallCols.offsetY = -10.0;

        if (find_wall_collisions(wallCols) != 0) {
            floorHeight = find_floor(wallCols.x, wallCols.y, wallCols.z, _floor)
            _floor = _floor._floor;
            if (_floor != null) {
                if (wallCols.y - floorHeight > 160.0) {
                    wall = wallCols.walls[wallCols.numWalls - 1];
                    wallAngle = atan2s(wall.normal.z, wall.normal.x);
                    wallDYaw = wallAngle - m.faceAngle[1];

                    if (wallDYaw > -0x4000 && wallDYaw < 0x4000) {
                        m.pos[0] = wallCols.x - 20.0 * wall.normal.x;
                        m.pos[2] = wallCols.z - 20.0 * wall.normal.z;

                        m.faceAngle[0] = 0;
                        m.faceAngle[1] = wallAngle + 0x8000;

                        set_mario_action(m, ACT_LEDGE_CLIMB_DOWN, 0);
                        set_mario_animation(m, MARIO_ANIM_CLIMB_DOWN_LEDGE);
                    }
                }
            }
        }
    }
}

/// <pygml?v=1.0&h=38217f0c9>
/// @function	slide_bonk(m, fastAction, slowAction)
/// @param		{struct}	m
/// @param		{u32}		fastAction
/// @param		{u32}		slowAction
function slide_bonk(m, fastAction, slowAction) {
    if (m.forwardVel > 16.0) {
        mario_bonk_reflection(m, true);
        drop_and_set_mario_action(m, fastAction, 0);
    } else {
        mario_set_forward_vel(m, 0.0);
        set_mario_action(m, slowAction, 0);
    }
}
/// <pygml?v=1.0&h=6775d4bd6>
/// @function	set_triple_jump_action(m, action, actionArg)
/// @param		{struct}	m
/// @param		{u32}		action
/// @param		{u32}		actionArg
/// @returns	s32
function set_triple_jump_action(m, action, actionArg) {
    if (m.flags & MARIO_WING_CAP) {
        return set_mario_action(m, ACT_FLYING_TRIPLE_JUMP, 0);
    } else if (m.forwardVel > 20.0) {
        return set_mario_action(m, ACT_TRIPLE_JUMP, 0);
    } else {
        return set_mario_action(m, ACT_JUMP, 0);
    }

    return 0;
}

/// <pygml?v=1.0&h=31872c865>
/// @function	update_sliding_angle(m, accel, lossFactor)
/// @param		{struct}	m
/// @param		{f32}		accel
/// @param		{f32}		lossFactor
function update_sliding_angle(m, accel, lossFactor) {
    var newFacingDYaw;
    var facingDYaw;

    var _floor = m._floor;
    var slopeAngle = atan2s(_floor.normal.z, _floor.normal.x);
    var steepness = sqrt(_floor.normal.x * _floor.normal.x + _floor.normal.z * _floor.normal.z);
    var normalY = _floor.normal.y;

    m.slideVelX += accel * steepness * sins(slopeAngle);
    m.slideVelZ += accel * steepness * coss(slopeAngle);

    m.slideVelX *= lossFactor;
    m.slideVelZ *= lossFactor;

    m.slideYaw = atan2s(m.slideVelZ, m.slideVelX);

    facingDYaw = m.faceAngle[1] - m.slideYaw;
    newFacingDYaw = facingDYaw;

    //! -0x4000 not handled - can slide down a slope while facing perpendicular to it
    if (newFacingDYaw > 0 && newFacingDYaw <= 0x4000) {
		newFacingDYaw -= 0x200;
        if (newFacingDYaw < 0) {
            newFacingDYaw = 0;
        }
    } else if (newFacingDYaw > -0x4000 && newFacingDYaw < 0) {
		newFacingDYaw += 0x200;
        if (newFacingDYaw > 0) {
            newFacingDYaw = 0;
        }
    } else if (newFacingDYaw > 0x4000 && newFacingDYaw < 0x8000) {
		newFacingDYaw += 0x200;
        if (newFacingDYaw > 0x8000) {
            newFacingDYaw = 0x8000;
        }
    } else if (newFacingDYaw > -0x8000 && newFacingDYaw < -0x4000) {
		newFacingDYaw -= 0x200;
        if (newFacingDYaw < -0x8000) {
            newFacingDYaw = -0x8000;
        }
    }

    m.faceAngle[1] = m.slideYaw + newFacingDYaw;

    m.vel[0] = m.slideVelX;
    m.vel[1] = 0.0;
    m.vel[2] = m.slideVelZ;

    mario_update_moving_sand(m);
    mario_update_windy_ground(m);

    //! Speed is capped a frame late (butt slide HSG)
    m.forwardVel = sqrt(m.slideVelX * m.slideVelX + m.slideVelZ * m.slideVelZ);
    if (m.forwardVel > 100.0) {
        m.slideVelX = m.slideVelX * 100.0 / m.forwardVel;
        m.slideVelZ = m.slideVelZ * 100.0 / m.forwardVel;
    }

    if (newFacingDYaw < -0x4000 || newFacingDYaw > 0x4000) {
        m.forwardVel *= -1.0;
    }
}

/// <pygml?v=1.0&h=7e4382493>
/// @function	update_sliding(m, stopSpeed)
/// @param		{struct}	m
/// @param		{f32}		stopSpeed
/// @returns	s32
function update_sliding(m, stopSpeed) {
    var lossFactor;
    var accel;
    var oldSpeed;
    var newSpeed;

    var stopped = false;

    var intendedDYaw = yaw_wrap(m.intendedYaw - m.slideYaw);
    var forward = coss(intendedDYaw);
    var sideward = sins(intendedDYaw);

    //! 10k glitch
    if (forward < 0.0 && m.forwardVel >= 0.0) {
        forward *= 0.5 + 0.5 * m.forwardVel / 100.0;
    }

    switch (mario_get_floor_class(m)) {
        case (SURFACE_CLASS_VERY_SLIPPERY):
            accel = 10.0;
            lossFactor = m.intendedMag / 32.0 * forward * 0.02 + 0.98;
            break;

        case (SURFACE_CLASS_SLIPPERY):
            accel = 8.0;
            lossFactor = m.intendedMag / 32.0 * forward * 0.02 + 0.96;
            break;

        default:
            accel = 7.0;
            lossFactor = m.intendedMag / 32.0 * forward * 0.02 + 0.92;
            break;

        case (SURFACE_CLASS_NOT_SLIPPERY):
            accel = 5.0;
            lossFactor = m.intendedMag / 32.0 * forward * 0.02 + 0.92;
            break;
    }

    oldSpeed = sqrt(m.slideVelX * m.slideVelX + m.slideVelZ * m.slideVelZ);

    //! This is attempting to use trig derivatives to rotate Mario's speed.
    // It is slightly off/asymmetric since it uses the new X speed, but the old
    // Z speed.
    m.slideVelX += m.slideVelZ * (m.intendedMag / 32.0) * sideward * 0.05;
    m.slideVelZ -= m.slideVelX * (m.intendedMag / 32.0) * sideward * 0.05;

    newSpeed = sqrt(m.slideVelX * m.slideVelX + m.slideVelZ * m.slideVelZ);

    if (oldSpeed > 0.0 && newSpeed > 0.0) {
        m.slideVelX = m.slideVelX * oldSpeed / newSpeed;
        m.slideVelZ = m.slideVelZ * oldSpeed / newSpeed;
    }

    update_sliding_angle(m, accel, lossFactor);

    if (!mario_floor_is_slope(m) && m.forwardVel * m.forwardVel < stopSpeed * stopSpeed) {
        mario_set_forward_vel(m, 0.0);
        stopped = true;
    }

    return stopped;
}

/// <pygml?v=1.0&h=0ba20be34>
/// @function	apply_slope_accel(m)
/// @param		{struct}	m
function apply_slope_accel(m) {
    var slopeAccel;

    var _floor = m._floor;
    var steepness = sqrt(_floor.normal.x * _floor.normal.x + _floor.normal.z * _floor.normal.z);

    var normalY = _floor.normal.y;
    var floorDYaw = m.floorAngle - m.faceAngle[1];

    if (mario_floor_is_slope(m)) {
        var slopeClass = 0;

        if (m.action != ACT_SOFT_BACKWARD_GROUND_KB && m.action != ACT_SOFT_FORWARD_GROUND_KB) {
            slopeClass = mario_get_floor_class(m);
        }

        switch (slopeClass) {
            case (SURFACE_CLASS_VERY_SLIPPERY):
                slopeAccel = 5.3;
                break;
            case (SURFACE_CLASS_SLIPPERY):
                slopeAccel = 2.7;
                break;
            default:
                slopeAccel = 1.7;
                break;
            case (SURFACE_CLASS_NOT_SLIPPERY):
                slopeAccel = 0.0;
                break;
        }

        if (floorDYaw > -0x4000 && floorDYaw < 0x4000) {
            m.forwardVel += slopeAccel * steepness;
        } else {
            m.forwardVel -= slopeAccel * steepness;
        }
    }

    m.slideYaw = m.faceAngle[1];

    m.slideVelX = m.forwardVel * sins(m.faceAngle[1]);
    m.slideVelZ = m.forwardVel * coss(m.faceAngle[1]);

    m.vel[0] = m.slideVelX;
    m.vel[1] = 0.0;
    m.vel[2] = m.slideVelZ;

    mario_update_moving_sand(m);
    mario_update_windy_ground(m);
}

/// <pygml?v=1.0&h=70b501824>
/// @function	apply_landing_accel(m, frictionFactor)
/// @param		{struct}	m
/// @param		{f32}		frictionFactor
/// @returns	s32
function apply_landing_accel(m, frictionFactor) {
    var stopped = false;

    apply_slope_accel(m);

    if (!mario_floor_is_slope(m)) {
        m.forwardVel *= frictionFactor;
        if (m.forwardVel * m.forwardVel < 1.0) {
            mario_set_forward_vel(m, 0.0);
            stopped = true;
        }
    }

    return stopped;
}

/// <pygml?v=1.0&h=f9fba6252>
/// @function	update_shell_speed(m)
/// @param		{struct}	m
function update_shell_speed(m) {
    var maxTargetSpeed;
    var targetSpeed;

    if (m.floorHeight < m.waterLevel) {
        m.floorHeight = m.waterLevel;
        m._floor = gWaterSurfacePseudoFloor;
        m._floor.originOffset = m.waterLevel; //! Negative origin offset
    }

    if (m._floor != null && m._floor.type == SURFACE_SLOW) {
        maxTargetSpeed = 48.0;
    } else {
        maxTargetSpeed = 64.0;
    }

    targetSpeed = m.intendedMag * 2.0;
    if (targetSpeed > maxTargetSpeed) {
        targetSpeed = maxTargetSpeed;
    }
    if (targetSpeed < 24.0) {
        targetSpeed = 24.0;
    }

    if (m.forwardVel <= 0.0) {
        m.forwardVel += 1.1;
    } else if (m.forwardVel <= targetSpeed) {
        m.forwardVel += 1.1 - m.forwardVel / 58.0;
    } else if (m._floor.normal.y >= 0.95) {
        m.forwardVel -= 1.0;
    }

    //! No backward speed cap (shell hyperspeed)
    if (m.forwardVel > 64.0) {
        m.forwardVel = 64.0;
    }

    m.faceAngle[1] =
        m.intendedYaw - approach_s32(yaw_wrap(m.intendedYaw - m.faceAngle[1]), 0, 0x800, 0x800);

    apply_slope_accel(m);
}

/// <pygml?v=1.0&h=5ef24c74d>
/// @function	apply_slope_decel(m, decelCoef)
/// @param		{struct}	m
/// @param		{f32}		decelCoef
/// @returns	s32
function apply_slope_decel(m, decelCoef) {
    var decel;
    var stopped = false;

    switch (mario_get_floor_class(m)) {
        case (SURFACE_CLASS_VERY_SLIPPERY):
            decel = decelCoef * 0.2;
            break;
        case (SURFACE_CLASS_SLIPPERY):
            decel = decelCoef * 0.7;
            break;
        default:
            decel = decelCoef * 2.0;
            break;
        case (SURFACE_CLASS_NOT_SLIPPERY):
            decel = decelCoef * 3.0;
            break;
    }

    if ((m.forwardVel = approach_f32(m.forwardVel, 0.0, decel, decel)) == 0.0) {
        stopped = true;
    }

    apply_slope_accel(m);
    return stopped;
}

/// <pygml?v=1.0&h=94d1d60d4>
/// @function	update_decelerating_speed(m)
/// @param		{struct}	m
/// @returns	s32
function update_decelerating_speed(m) {
    var stopped = false;

	m.forwardVel = approach_f32(m.forwardVel, 0.0, 1.0, 1.0);
    if (m.forwardVel == 0.0) {
        stopped = true;
    }

    mario_set_forward_vel(m, m.forwardVel);
    mario_update_moving_sand(m);
    mario_update_windy_ground(m);

    return stopped;
}
/// <pygml?v=1.0&h=9816bd500>
/// @function	update_walking_speed(m)
/// @param		{struct}	m
function update_walking_speed(m) {
    var maxTargetSpeed;
    var targetSpeed;

    if (m._floor != null && m._floor.type == SURFACE_SLOW) {
        maxTargetSpeed = 24.0;
    } else {
        maxTargetSpeed = 32.0;
    }

    targetSpeed = m.intendedMag < maxTargetSpeed ? m.intendedMag : maxTargetSpeed;

    if (m.quicksandDepth > 10.0) {
        targetSpeed *= 6.25 / m.quicksandDepth;
    }

    if (m.forwardVel <= 0.0) {
        m.forwardVel += 1.1;
    } else if (m.forwardVel <= targetSpeed) {
        m.forwardVel += 1.1 - m.forwardVel / 43.0;
    } else if (m._floor.normal.y >= 0.95) {
        m.forwardVel -= 1.0;
    }

    if (m.forwardVel > 48.0) {
        m.forwardVel = 48.0;
    }

    m.faceAngle[1] =
        m.intendedYaw - approach_s32(yaw_wrap(m.intendedYaw - m.faceAngle[1]), 0, 0x800, 0x800);
    apply_slope_accel(m);
}


/// <pygml?v=1.0&h=f5361bf9d>
/// @function	should_begin_sliding(m)
/// @param		{struct}	m
/// @returns	s32
function should_begin_sliding(m) {
    if (m.input & INPUT_ABOVE_SLIDE) {
        var slideLevel = (m.area.terrainType & TERRAIN_MASK) == TERRAIN_SLIDE;
        var movingBackward = m.forwardVel <= -1.0;

        if (slideLevel || movingBackward || mario_facing_downhill(m, false)) {
            return true;
        }
    }

    return false;
}

/// <pygml?v=1.0&h=77128862b>
/// @function	analog_stick_held_back(m)
/// @param		{struct}	m
/// @returns	s32
function analog_stick_held_back(m) {
    var intendedDYaw = yaw_wrap(m.intendedYaw - m.faceAngle[1]);

    return intendedDYaw < -0x471C || intendedDYaw > 0x471C;
}

/// <pygml?v=1.0&h=2a2fe0148>
/// @function	check_ground_dive_or_punch(m)
/// @param		{struct}	m
/// @returns	s32
function check_ground_dive_or_punch(m) {
    var unused;

    if (m.input & INPUT_B_PRESSED) {
        //! Speed kick (shoutouts to SimpleFlips)
        if (m.forwardVel >= 29.0 && m.controller.stickMag > 48.0) {
            m.vel[1] = 20.0;
            return set_mario_action(m, ACT_DIVE, 1);
        }

        return set_mario_action(m, ACT_MOVE_PUNCHING, 0);
    }

    return false;
}

/// <pygml?v=1.0&h=d2bdb0b63>
/// @function	begin_braking_action(m)
/// @param		{struct}	m
/// @returns	s32
function begin_braking_action(m) {
    mario_drop_held_object(m);

    if (m.actionState == 1) {
        m.faceAngle[1] = m.actionArg;
        return set_mario_action(m, ACT_STANDING_AGAINST_WALL, 0);
    }

    if (m.forwardVel >= 16.0 && m._floor.normal.y >= 0.17364818) {
        return set_mario_action(m, ACT_BRAKING, 0);
    }

    return set_mario_action(m, ACT_DECELERATING, 0);
}

/// <pygml?v=1.0&h=6e6df29c6>
/// @function	anim_and_audio_for_walk(m)
/// @param		{struct}	m
function anim_and_audio_for_walk(m) {
    var val14;
    var marioObj = m.marioObj;
    var val0C = true;
    var targetPitch = 0;
    var val04;

    val04 = m.intendedMag > m.forwardVel ? m.intendedMag : m.forwardVel;

    if (val04 < 4.0) {
        val04 = 4.0;
    }

    if (m.quicksandDepth > 50.0) {
        val14 = (val04 / 4.0 * 0x10000);
        set_mario_anim_with_accel(m, MARIO_ANIM_MOVE_IN_QUICKSAND, val14);
        play_step_sound(m, 19, 93);
        m.actionTimer = 0;
    } else {
        while (val0C) {
            switch (m.actionTimer) {
                case (0):
                    if (val04 > 8.0) {
                        m.actionTimer = 2;
                    } else {
                        //! (Speed Crash) If Mario's speed is more than 2^17.
						val14 = (val04 / 4.0 * 0x10000);
                        if (val14 < 0x1000) {
                            val14 = 0x1000;
                        }
                        set_mario_anim_with_accel(m, MARIO_ANIM_START_TIPTOE, val14);
                        play_step_sound(m, 7, 22);
                        if (is_anim_past_frame(m, 23)) {
                            m.actionTimer = 2;
                        }

                        val0C = false;
                    }
                    break;

                case (1):
                    if (val04 > 8.0) {
                        m.actionTimer = 2;
                    } else {
                        //! (Speed Crash) If Mario's speed is more than 2^17.
						val14 = (val04 * 0x10000);
                        if (val14 < 0x1000) {
                            val14 = 0x1000;
                        }
                        set_mario_anim_with_accel(m, MARIO_ANIM_TIPTOE, val14);
                        play_step_sound(m, 14, 72);

                        val0C = false;
                    }
                    break;

                case (2):
                    if (val04 < 5.0) {
                        m.actionTimer = 1;
                    } else if (val04 > 22.0) {
                        m.actionTimer = 3;
                    } else {
                        //! (Speed Crash) If Mario's speed is more than 2^17.
                        val14 = (val04 / 4.0 * 0x10000);
                        set_mario_anim_with_accel(m, MARIO_ANIM_WALKING, val14);
                        play_step_sound(m, 10, 49);

                        val0C = false;
                    }
                    break;

                case (3):
                    if (val04 < 18.0) {
                        m.actionTimer = 2;
                    } else {
                        //! (Speed Crash) If Mario's speed is more than 2^17.
                        val14 = (val04 / 4.0 * 0x10000);
                        set_mario_anim_with_accel(m, MARIO_ANIM_RUNNING, val14);
                        play_step_sound(m, 9, 45);
                        targetPitch = tilt_body_running(m);

                        val0C = false;
                    }
                    break;
            }
        }
    }

    marioObj.rawData[oMarioWalkingPitch] =
        approach_s32(marioObj.rawData[oMarioWalkingPitch], targetPitch, 0x800, 0x800);
    marioObj.header.gfx.angle[0] = marioObj.rawData[oMarioWalkingPitch];
}

/// <pygml?v=1.0&h=c12284a59>
/// @function	anim_and_audio_for_hold_walk(m)
/// @param		{struct}	m
function anim_and_audio_for_hold_walk(m) {
    var val0C;
    var val08 = true;
    var val04;

    val04 = m.intendedMag > m.forwardVel ? m.intendedMag : m.forwardVel;

    if (val04 < 2.0) {
        val04 = 2.0;
    }

    while (val08) {
        switch (m.actionTimer) {
            case (0):
                if (val04 > 6.0) {
                    m.actionTimer = 1;
                } else {
                    //! (Speed Crash) Crashes if Mario's speed exceeds or equals 2^15.
                    val0C = (val04 * 0x10000);
                    set_mario_anim_with_accel(m, MARIO_ANIM_SLOW_WALK_WITH_LIGHT_OBJ, val0C);
                    play_step_sound(m, 12, 62);

                    val08 = false;
                }
                break;

            case (1):
                if (val04 < 3.0) {
                    m.actionTimer = 0;
                } else if (val04 > 11.0) {
                    m.actionTimer = 2;
                } else {
                    //! (Speed Crash) Crashes if Mario's speed exceeds or equals 2^15.
                    val0C = (val04 * 0x10000);
                    set_mario_anim_with_accel(m, MARIO_ANIM_WALK_WITH_LIGHT_OBJ, val0C);
                    play_step_sound(m, 12, 62);

                    val08 = false;
                }
                break;

            case (2):
                if (val04 < 8.0) {
                    m.actionTimer = 1;
                } else {
                    //! (Speed Crash) Crashes if Mario's speed exceeds or equals 2^16.
                    val0C = (val04 / 2.0 * 0x10000);
                    set_mario_anim_with_accel(m, MARIO_ANIM_RUN_WITH_LIGHT_OBJ, val0C);
                    play_step_sound(m, 10, 49);

                    val08 = false;
                }
                break;
        }
    }
}
/// <pygml?v=1.0&h=ed16f6aac>
/// @function	anim_and_audio_for_heavy_walk(m)
/// @param		{struct}	m
function anim_and_audio_for_heavy_walk(m) {
    var val04 = (m.intendedMag * 0x10000);
    set_mario_anim_with_accel(m, MARIO_ANIM_WALK_WITH_HEAVY_OBJ, val04);
    play_step_sound(m, 26, 79);
}


/// <pygml?v=1.0&h=8b5fec315>
/// @function	push_or_sidle_wall(m, startPos)
/// @param		{struct}	m
/// @param		{Vec3f}		startPos
function push_or_sidle_wall(m, startPos) {
    var wallAngle;
    var dWallAngle;
    var dx = m.pos[0] - startPos[@ 0];
    var dz = m.pos[2] - startPos[@ 2];
    var movedDistance = sqrt(dx * dx + dz * dz);
    //! (Speed Crash) If a wall is after moving 16384 distance, this crashes.
    var val04 = (movedDistance * 2.0 * 0x10000);

    if (m.forwardVel > 6.0) {
        mario_set_forward_vel(m, 6.0);
    }

    if (m.wall != null) {
        wallAngle = atan2s(m.wall.normal.z, m.wall.normal.x);
        dWallAngle = wallAngle - m.faceAngle[1];
    }

    if (m.wall == null || dWallAngle <= -0x71C8 || dWallAngle >= 0x71C8) {
        m.flags |= MARIO_UNKNOWN_31;
        set_mario_animation(m, MARIO_ANIM_PUSHING);
        play_step_sound(m, 6, 18);
    } else {
        if (dWallAngle < 0) {
            set_mario_anim_with_accel(m, MARIO_ANIM_SIDESTEP_RIGHT, val04);
        } else {
            set_mario_anim_with_accel(m, MARIO_ANIM_SIDESTEP_LEFT, val04);
        }

        if (m.marioObj.header.gfx.unk38.animFrame < 20) {
            play_sound(SOUND_MOVING_TERRAIN_SLIDE + m.terrainSoundAddend, m.marioObj.header.gfx.cameraToObject);
            m.particleFlags |= PARTICLE_DUST;
        }

        m.actionState = 1;
        m.actionArg = wallAngle + 0x8000;
        m.marioObj.header.gfx.angle[1] = wallAngle + 0x8000;
        m.marioObj.header.gfx.angle[2] = find_floor_slope(m, 0x4000);
    }
}

/// <pygml?v=1.0&h=bac637509>
/// @function	tilt_body_walking(m, startYaw)
/// @param		{struct}	m
/// @param		{s16}		startYaw
function tilt_body_walking(m, startYaw) {
    var val0C = m.marioBodyState;
    var marioObj = m.marioObj;
    var animID = m.marioObj.header.gfx.unk38.animID;
    var dYaw;
    var val02;
    var val00;

    if (animID == MARIO_ANIM_WALKING || animID == MARIO_ANIM_RUNNING) {
        dYaw = m.faceAngle[1] - startYaw;
        //! (Speed Crash) These casts can cause a crash if (dYaw * forwardVel / 12) or
        //! (forwardVel * 170) exceed or equal 2^31.
        val02 = -(dYaw * m.forwardVel / 12.0);
        val00 = (m.forwardVel * 170.0);

        if (val02 > 0x1555) {
            val02 = 0x1555;
        }
        if (val02 < -0x1555) {
            val02 = -0x1555;
        }

        if (val00 > 0x1555) {
            val00 = 0x1555;
        }
        if (val00 < 0) {
            val00 = 0;
        }

        val0C.torsoAngle[2] = approach_s32(val0C.torsoAngle[2], val02, 0x400, 0x400);
        val0C.torsoAngle[0] = approach_s32(val0C.torsoAngle[0], val00, 0x400, 0x400);;
    } else {
        val0C.torsoAngle[2] = 0;
        val0C.torsoAngle[0] = 0;
    }
}

/// <pygml?v=1.0&h=b0c0d2f15>
/// @function	tilt_body_ground_shell(m, startYaw)
/// @param		{struct}	m
/// @param		{s16}		startYaw
function tilt_body_ground_shell(m, startYaw) {
    var val0C = m.marioBodyState;
    var marioObj = m.marioObj;
    var dYaw = m.faceAngle[1] - startYaw;
    //! (Speed Crash) These casts can cause a crash if (dYaw * forwardVel / 12) or
    //! (forwardVel * 170) exceed or equal 2^31. Harder (if not impossible to do)
    //! while on a Koopa Shell making this less of an issue.
    var val04 = -(dYaw * m.forwardVel / 12.0);
    var val02 = (m.forwardVel * 170.0);

    if (val04 > 0x1800) {
        val04 = 0x1800;
    }
    if (val04 < -0x1800) {
        val04 = -0x1800;
    }

    if (val02 > 0x1000) {
        val02 = 0x1000;
    }
    if (val02 < 0) {
        val02 = 0;
    }

    val0C.torsoAngle[2] = approach_s32(val0C.torsoAngle[2], val04, 0x200, 0x200);
    val0C.torsoAngle[0] = approach_s32(val0C.torsoAngle[0], val02, 0x200, 0x200);
    val0C.headAngle[2] = -val0C.torsoAngle[2];

    marioObj.header.gfx.angle[2] = val0C.torsoAngle[2];
    marioObj.header.gfx.pos[1] += 45.0;
}
/// <pygml?v=1.0&h=9bcdba043>
/// @function	act_walking(m)
/// @param		{struct}	m
/// @returns	s32
function act_walking(m) {
    var startPos = Vec3f;
    var startYaw = m.faceAngle[1];

    mario_drop_held_object(m);

    if (should_begin_sliding(m)) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_FIRST_PERSON) {
        return begin_braking_action(m);
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jump_from_landing(m);
    }

    if (check_ground_dive_or_punch(m)) {
        return true;
    }

    if (m.input & INPUT_UNKNOWN_5) {
        return begin_braking_action(m);
    }

    if (analog_stick_held_back(m) && m.forwardVel >= 16.0) {
        return set_mario_action(m, ACT_TURNING_AROUND, 0);
    }

    if (m.input & INPUT_Z_PRESSED) {
        return set_mario_action(m, ACT_CROUCH_SLIDE, 0);
    }

    m.actionState = 0;

    vec3f_copy(startPos, m.pos);
    update_walking_speed(m);

    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, ACT_FREEFALL, 0);
            set_mario_animation(m, MARIO_ANIM_GENERAL_FALL);
            break;

        case (GROUND_STEP_NONE):
            anim_and_audio_for_walk(m);
            if (m.intendedMag - m.forwardVel > 16.0) {
                m.particleFlags |= PARTICLE_DUST;
            }
            break;

        case (GROUND_STEP_HIT_WALL):
            push_or_sidle_wall(m, startPos);
            m.actionTimer = 0;
            break;
    }

    check_ledge_climb_down(m);
    tilt_body_walking(m, startYaw);
    return false;
}


/// <pygml?v=1.0&h=55a7e7690>
/// @function	act_move_punching(m)
/// @param		{struct}	m
/// @returns	s32
function act_move_punching(m) {
    if (should_begin_sliding(m)) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    if (m.actionState == 0 && (m.input & INPUT_A_DOWN)) {
        return set_mario_action(m, ACT_JUMP_KICK, 0);
    }

    m.actionState = 1;

    mario_update_punch_sequence(m);

    if (m.forwardVel >= 0.0) {
        apply_slope_decel(m, 0.5);
    } else {
		m.forwardVel += 8.0;
        if (m.forwardVel >= 0.0) {
            m.forwardVel = 0.0;
        }
        apply_slope_accel(m);
    }

    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, ACT_FREEFALL, 0);
            break;

        case (GROUND_STEP_NONE):
            m.particleFlags |= PARTICLE_DUST;
            break;
    }

    return false;
}

/// <pygml?v=1.0&h=f8a377346>
/// @function	act_hold_walking(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_walking(m) {
    if (m.heldObj.behavior == (bhvJumpingBox)) {
        return set_mario_action(m, ACT_CRAZY_BOX_BOUNCE, 0);
    }

    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_DROP_OBJECT) {
        return drop_and_set_mario_action(m, ACT_WALKING, 0);
    }

    if (should_begin_sliding(m)) {
        return set_mario_action(m, ACT_HOLD_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_THROWING, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_HOLD_JUMP, 0);
    }

    if (m.input & INPUT_UNKNOWN_5) {
        return set_mario_action(m, ACT_HOLD_DECELERATING, 0);
    }

    if (m.input & INPUT_Z_PRESSED) {
        return drop_and_set_mario_action(m, ACT_CROUCH_SLIDE, 0);
    }

    m.intendedMag *= 0.4;

    update_walking_speed(m);

    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, ACT_HOLD_FREEFALL, 0);
            break;

        case (GROUND_STEP_HIT_WALL):
            if (m.forwardVel > 16.0) {
                mario_set_forward_vel(m, 16.0);
            }
            break;
    }

    anim_and_audio_for_hold_walk(m);

    if (0.4 * m.intendedMag - m.forwardVel > 10.0) {
        m.particleFlags |= PARTICLE_DUST;
    }

    return false;
}

/// <pygml?v=1.0&h=a5d382b68>
/// @function	act_hold_heavy_walking(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_heavy_walking(m) {
    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_HEAVY_THROW, 0);
    }

    if (should_begin_sliding(m)) {
        return drop_and_set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_UNKNOWN_5) {
        return set_mario_action(m, ACT_HOLD_HEAVY_IDLE, 0);
    }

    m.intendedMag *= 0.1;

    update_walking_speed(m);

    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            drop_and_set_mario_action(m, ACT_FREEFALL, 0);
            break;

        case (GROUND_STEP_HIT_WALL):
            if (m.forwardVel > 10.0) {
                mario_set_forward_vel(m, 10.0);
            }
            break;
    }

    anim_and_audio_for_heavy_walk(m);
    return false;
}

/// <pygml?v=1.0&h=d39f2c1b2>
/// @function	act_turning_around(m)
/// @param		{struct}	m
/// @returns	s32
function act_turning_around(m) {
    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_SIDE_FLIP, 0);
    }

    if (m.input & INPUT_UNKNOWN_5) {
        return set_mario_action(m, ACT_BRAKING, 0);
    }

    if (!analog_stick_held_back(m)) {
        return set_mario_action(m, ACT_WALKING, 0);
    }

    if (apply_slope_decel(m, 2.0)) {
        return begin_walking_action(m, 8.0, ACT_FINISH_TURNING_AROUND, 0);
    }

    play_sound(SOUND_MOVING_TERRAIN_SLIDE + m.terrainSoundAddend, m.marioObj.header.gfx.cameraToObject);

    adjust_sound_for_speed(m);

    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, ACT_FREEFALL, 0);
            break;

        case (GROUND_STEP_NONE):
            m.particleFlags |= PARTICLE_DUST;
            break;
    }

    if (m.forwardVel >= 18.0) {
        set_mario_animation(m, MARIO_ANIM_TURNING_PART1);
    } else {
        set_mario_animation(m, MARIO_ANIM_TURNING_PART2);
        if (is_anim_at_end(m)) {
            if (m.forwardVel > 0.0) {
                begin_walking_action(m, -m.forwardVel, ACT_WALKING, 0);
            } else {
                begin_walking_action(m, 8.0, ACT_WALKING, 0);
            }
        }
    }

    return false;
}

/// <pygml?v=1.0&h=be919bc9e>
/// @function	act_finish_turning_around(m)
/// @param		{struct}	m
/// @returns	s32
function act_finish_turning_around(m) {
    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_SIDE_FLIP, 0);
    }

    update_walking_speed(m);
    set_mario_animation(m, MARIO_ANIM_TURNING_PART2);

    if (perform_ground_step(m) == GROUND_STEP_LEFT_GROUND) {
        set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (is_anim_at_end(m)) {
        set_mario_action(m, ACT_WALKING, 0);
    }

    m.marioObj.header.gfx.angle[1] += 0x8000;
    return false;
}

/// <pygml?v=1.0&h=08ddba7b6>
/// @function	act_braking(m)
/// @param		{struct}	m
/// @returns	s32
function act_braking(m) {
    if (!(m.input & INPUT_FIRST_PERSON) &&
        (m.input &
            (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED | INPUT_OFF_FLOOR | INPUT_ABOVE_SLIDE))) {
        return check_common_action_exits(m);
    }

    if (apply_slope_decel(m, 2.0)) {
        return set_mario_action(m, ACT_BRAKING_STOP, 0);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_MOVE_PUNCHING, 0);
    }

    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, ACT_FREEFALL, 0);
            break;

        case (GROUND_STEP_NONE):
            m.particleFlags |= PARTICLE_DUST;
            break;

        case (GROUND_STEP_HIT_WALL):
            slide_bonk(m, ACT_BACKWARD_GROUND_KB, ACT_BRAKING_STOP);
            break;
    }

    play_sound(SOUND_MOVING_TERRAIN_SLIDE + m.terrainSoundAddend, m.marioObj.header.gfx.cameraToObject);
    adjust_sound_for_speed(m);
    set_mario_animation(m, MARIO_ANIM_SKID_ON_GROUND);
    return false;
}

/// <pygml?v=1.0&h=fa37ad2b6>
/// @function	act_decelerating(m)
/// @param		{struct}	m
/// @returns	s32
function act_decelerating(m) {
    var val0C;
    var slopeClass = mario_get_floor_class(m);

    if (!(m.input & INPUT_FIRST_PERSON)) {
        if (should_begin_sliding(m)) {
            return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
        }

        if (m.input & INPUT_A_PRESSED) {
            return set_jump_from_landing(m);
        }

        if (check_ground_dive_or_punch(m)) {
            return true;
        }

        if (m.input & INPUT_NONZERO_ANALOG) {
            return set_mario_action(m, ACT_WALKING, 0);
        }

        if (m.input & INPUT_Z_PRESSED) {
            return set_mario_action(m, ACT_CROUCH_SLIDE, 0);
        }
    }

    if (update_decelerating_speed(m)) {
        return set_mario_action(m, ACT_IDLE, 0);
    }

    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, ACT_FREEFALL, 0);
            break;

        case (GROUND_STEP_HIT_WALL):
            if (slopeClass == SURFACE_CLASS_VERY_SLIPPERY) {
                mario_bonk_reflection(m, true);
            } else {
                mario_set_forward_vel(m, 0.0);
            }
            break;
    }

    if (slopeClass == SURFACE_CLASS_VERY_SLIPPERY) {
        set_mario_animation(m, MARIO_ANIM_IDLE_HEAD_LEFT);
        play_sound(SOUND_MOVING_TERRAIN_SLIDE + m.terrainSoundAddend, m.marioObj.header.gfx.cameraToObject);
        adjust_sound_for_speed(m);
        m.particleFlags |= PARTICLE_DUST;
    } else {
        // (Speed Crash) Crashes if speed exceeds 2^17.
		val0C = (m.forwardVel / 4.0 * 0x10000);
        if (val0C < 0x1000) {
            val0C = 0x1000;
        }

        set_mario_anim_with_accel(m, MARIO_ANIM_WALKING, val0C);
        play_step_sound(m, 10, 49);
    }

    return false;
}

/// <pygml?v=1.0&h=624b78208>
/// @function	act_hold_decelerating(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_decelerating(m) {
    var val0C;
    var slopeClass = mario_get_floor_class(m);

    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_DROP_OBJECT) {
        return drop_and_set_mario_action(m, ACT_WALKING, 0);
    }

    if (should_begin_sliding(m)) {
        return set_mario_action(m, ACT_HOLD_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_THROWING, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_HOLD_JUMP, 0);
    }

    if (m.input & INPUT_Z_PRESSED) {
        return drop_and_set_mario_action(m, ACT_CROUCH_SLIDE, 0);
    }

    if (m.input & INPUT_NONZERO_ANALOG) {
        return set_mario_action(m, ACT_HOLD_WALKING, 0);
    }

    if (update_decelerating_speed(m)) {
        return set_mario_action(m, ACT_HOLD_IDLE, 0);
    }

    m.intendedMag *= 0.4;

    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, ACT_HOLD_FREEFALL, 0);
            break;

        case (GROUND_STEP_HIT_WALL):
            if (slopeClass == SURFACE_CLASS_VERY_SLIPPERY) {
                mario_bonk_reflection(m, true);
            } else {
                mario_set_forward_vel(m, 0.0);
            }
            break;
    }

    if (slopeClass == SURFACE_CLASS_VERY_SLIPPERY) {
        set_mario_animation(m, MARIO_ANIM_IDLE_WITH_LIGHT_OBJ);
        play_sound(SOUND_MOVING_TERRAIN_SLIDE + m.terrainSoundAddend, m.marioObj.header.gfx.cameraToObject);
        adjust_sound_for_speed(m);
        m.particleFlags |= PARTICLE_DUST;
    } else {
        //! (Speed Crash) This crashes if Mario has more speed than 2^15 speed.
		val0C = (m.forwardVel * 0x10000);
        if (val0C < 0x1000) {
            val0C = 0x1000;
        }

        set_mario_anim_with_accel(m, MARIO_ANIM_WALK_WITH_LIGHT_OBJ, val0C);
        play_step_sound(m, 12, 62);
    }

    return false;
}

/// <pygml?v=1.0&h=b044dfa77>
/// @function	act_riding_shell_ground(m)
/// @desc		06
/// @param		{struct}	m
/// @returns	s32
function act_riding_shell_ground(m) {
    var startYaw = m.faceAngle[1];

    if (m.input & INPUT_A_PRESSED) {
        return set_mario_action(m, ACT_RIDING_SHELL_JUMP, 0);
    }

    if (m.input & INPUT_Z_PRESSED) {
        mario_stop_riding_object(m);
        if (m.forwardVel < 24.0) {
            mario_set_forward_vel(m, 24.0);
        }
        return set_mario_action(m, ACT_CROUCH_SLIDE, 0);
    }

    update_shell_speed(m);
    set_mario_animation(m, m.actionArg == 0 ? MARIO_ANIM_START_RIDING_SHELL : MARIO_ANIM_RIDING_SHELL);

    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, ACT_RIDING_SHELL_FALL, 0);
            break;

        case (GROUND_STEP_HIT_WALL):
            mario_stop_riding_object(m);
            play_sound(m.flags & MARIO_METAL_CAP ? SOUND_ACTION_METAL_BONK : SOUND_ACTION_BONK,
                m.marioObj.header.gfx.cameraToObject);
            m.particleFlags |= PARTICLE_VERTICAL_STAR;
            set_mario_action(m, ACT_BACKWARD_GROUND_KB, 0);
            break;
    }

    tilt_body_ground_shell(m, startYaw);
    if (m._floor.type == SURFACE_BURNING) {
        play_sound(SOUND_MOVING_RIDING_SHELL_LAVA, m.marioObj.header.gfx.cameraToObject);
    } else {
        play_sound(SOUND_MOVING_TERRAIN_RIDING_SHELL + m.terrainSoundAddend,
            m.marioObj.header.gfx.cameraToObject);
    }

    adjust_sound_for_speed(m);
    return false;
}

/// <pygml?v=1.0&h=2183d604e>
/// @function	act_crawling(m)
/// @param		{struct}	m
/// @returns	s32
function act_crawling(m) {
    var val04;

    if (should_begin_sliding(m)) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_FIRST_PERSON) {
        return set_mario_action(m, ACT_STOP_CRAWLING, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_JUMP, 0);
    }

    if (check_ground_dive_or_punch(m)) {
        return true;
    }

    if (m.input & INPUT_UNKNOWN_5) {
        return set_mario_action(m, ACT_STOP_CRAWLING, 0);
    }

    if (!(m.input & INPUT_Z_DOWN)) {
        return set_mario_action(m, ACT_STOP_CRAWLING, 0);
    }

    m.intendedMag *= 0.1;

    update_walking_speed(m);

    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, ACT_FREEFALL, 0);
            break;

        case (GROUND_STEP_HIT_WALL):
            if (m.forwardVel > 10.0) {
                mario_set_forward_vel(m, 10.0);
            }
            //! Possibly unintended missing break

            case (GROUND_STEP_NONE):
                align_with_floor(m);
                break;
    }

    val04 = (m.intendedMag * 2.0 * 0x10000);
    set_mario_anim_with_accel(m, MARIO_ANIM_CRAWLING, val04);
    play_step_sound(m, 26, 79);
    return false;
}


/// <pygml?v=1.0&h=f626b4dca>
/// @function	tilt_body_butt_slide(m)
/// @param		{struct}	m
function tilt_body_butt_slide(m) {
    var intendedDYaw = (m.intendedYaw - m.faceAngle[1]);
    m.marioBodyState.torsoAngle[0] = (5461.3335 * m.intendedMag / 32.0 * coss(intendedDYaw));
    m.marioBodyState.torsoAngle[2] = (-(5461.3335 * m.intendedMag / 32.0 * sins(intendedDYaw)));
}

/// <pygml?v=1.0&h=dfb88176d>
/// @function	common_slide_action(m, endAction, airAction, animation)
/// @param		{struct}	m
/// @param		{u32}		endAction
/// @param		{u32}		airAction
/// @param		{s32}		animation
function common_slide_action(m, endAction, airAction, animation) {
    var val14 = Vec3f;

    vec3f_copy(val14, m.pos);
    play_sound(SOUND_MOVING_TERRAIN_SLIDE + m.terrainSoundAddend, m.marioObj.header.gfx.cameraToObject);


    adjust_sound_for_speed(m);

    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, airAction, 0);
            if (m.forwardVel < -50.0 || 50.0 < m.forwardVel) {
                play_sound(SOUND_MARIO_HOOHOO, m.marioObj.header.gfx.cameraToObject);
            }
            break;

        case (GROUND_STEP_NONE):
            set_mario_animation(m, animation);
            align_with_floor(m);
            m.particleFlags |= PARTICLE_DUST;
            break;

        case (GROUND_STEP_HIT_WALL):
            if (!mario_floor_is_slippery(m)) {
                slide_bonk(m, ACT_GROUND_BONK, endAction);
            } else if (m.wall != null) {
                var wallAngle = atan2s(m.wall.normal.z, m.wall.normal.x);
                var slideSpeed = sqrt(m.slideVelX * m.slideVelX + m.slideVelZ * m.slideVelZ);

				slideSpeed *= 0.9;
                if (slideSpeed < 4.0) {
                    slideSpeed = 4.0;
                }

                m.slideYaw = wallAngle - (m.slideYaw - wallAngle) + 0x8000;

                m.vel[0] = m.slideVelX = slideSpeed * sins(m.slideYaw);
                m.vel[2] = m.slideVelZ = slideSpeed * coss(m.slideYaw);
            }

            align_with_floor(m);
            break;
    }
}

/// <pygml?v=1.0&h=25ee3d6ec>
/// @function	common_slide_action_with_jump(m, stopAction, jumpAction, airAction, animation)
/// @param		{struct}	m
/// @param		{u32}		stopAction
/// @param		{u32}		jumpAction
/// @param		{u32}		airAction
/// @param		{s32}		animation
/// @returns	s32
function common_slide_action_with_jump(m, stopAction, jumpAction, airAction, animation) {
    if (m.actionTimer == 5) {
        if (m.input & INPUT_A_PRESSED) {
            return set_jumping_action(m, jumpAction, 0);
        }
    } else {
        m.actionTimer++;
    }

    if (update_sliding(m, 4.0)) {
        return set_mario_action(m, stopAction, 0);
    }

    common_slide_action(m, stopAction, airAction, animation);
    return false;
}

/// <pygml?v=1.0&h=91b775a18>
/// @function	act_butt_slide(m)
/// @param		{struct}	m
/// @returns	s32
function act_butt_slide(m) {
    var cancel = common_slide_action_with_jump(m, ACT_BUTT_SLIDE_STOP, ACT_JUMP, ACT_BUTT_SLIDE_AIR,
        MARIO_ANIM_SLIDE);
    tilt_body_butt_slide(m);
    return cancel;
}

/// <pygml?v=1.0&h=d85374e3a>
/// @function	act_hold_butt_slide(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_butt_slide(m) {
    var cancel;

    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_DROP_OBJECT) {
        return drop_and_set_mario_action(m, ACT_BUTT_SLIDE, 0);
    }

    cancel = common_slide_action_with_jump(m, ACT_HOLD_BUTT_SLIDE_STOP, ACT_HOLD_JUMP, ACT_HOLD_BUTT_SLIDE_AIR,
        MARIO_ANIM_SLIDING_ON_BOTTOM_WITH_LIGHT_OBJ);
    tilt_body_butt_slide(m);
    return cancel;
}

/// <pygml?v=1.0&h=7772afb37>
/// @function	act_crouch_slide(m)
/// @param		{struct}	m
/// @returns	s32
function act_crouch_slide(m) {
    var cancel;

    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BUTT_SLIDE, 0);
    }

    if (m.actionTimer < 30) {
        m.actionTimer++;
        if (m.input & INPUT_A_PRESSED) {
            if (m.forwardVel > 5.0) { // @TODO change to 10.0
                return set_jumping_action(m, ACT_LONG_JUMP, 0);
            }
        }
    }

    if (m.input & INPUT_B_PRESSED) {
        if (m.forwardVel >= 10.0) {
            return set_mario_action(m, ACT_SLIDE_KICK, 0);
        } else {
            return set_mario_action(m, ACT_MOVE_PUNCHING, 0x0009);
        }
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_JUMP, 0);
    }

    if (m.input & INPUT_FIRST_PERSON) {
        return set_mario_action(m, ACT_BRAKING, 0);
    }

    cancel = common_slide_action_with_jump(m, ACT_CROUCHING, ACT_JUMP, ACT_FREEFALL,
        MARIO_ANIM_START_CROUCHING);
    return cancel;
}

/// <pygml?v=1.0&h=9ce9ae523>
/// @function	act_slide_kick_slide(m)
/// @param		{struct}	m
/// @returns	s32
function act_slide_kick_slide(m) {
    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_FORWARD_ROLLOUT, 0);
    }

    set_mario_animation(m, MARIO_ANIM_SLIDE_KICK);
    if (is_anim_at_end(m) && m.forwardVel < 1.0) {
        return set_mario_action(m, ACT_SLIDE_KICK_SLIDE_STOP, 0);
    }

    update_sliding(m, 1.0);
    switch (perform_ground_step(m)) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, ACT_FREEFALL, 2);
            break;

        case (GROUND_STEP_HIT_WALL):
            mario_bonk_reflection(m, true);
            m.particleFlags |= PARTICLE_VERTICAL_STAR;
            set_mario_action(m, ACT_BACKWARD_GROUND_KB, 0);
            break;
    }

    play_sound(SOUND_MOVING_TERRAIN_SLIDE + m.terrainSoundAddend, m.marioObj.header.gfx.cameraToObject);
    m.particleFlags |= PARTICLE_DUST;
    return false;
}

/// <pygml?v=1.0&h=ae3516636>
/// @function	stomach_slide_action(m, stopAction, airAction, animation)
/// @param		{struct}	m
/// @param		{u32}		stopAction
/// @param		{u32}		airAction
/// @param		{s32}		animation
/// @returns	s32
function stomach_slide_action(m, stopAction, airAction, animation) {
    if (m.actionTimer == 5) {
        if (!(m.input & INPUT_ABOVE_SLIDE) && (m.input & (INPUT_A_PRESSED | INPUT_B_PRESSED))) {
            return drop_and_set_mario_action(
                m, m.forwardVel >= 0.0 ? ACT_FORWARD_ROLLOUT : ACT_BACKWARD_ROLLOUT, 0);
        }
    } else {
        m.actionTimer++;
    }

    if (update_sliding(m, 4.0)) {
        return set_mario_action(m, stopAction, 0);
    }

    common_slide_action(m, stopAction, airAction, animation);
    return false;
}

/// <pygml?v=1.0&h=3ba0c0bcd>
/// @function	act_stomach_slide(m)
/// @param		{struct}	m
/// @returns	s32
function act_stomach_slide(m) {
    var cancel = stomach_slide_action(m, ACT_STOMACH_SLIDE_STOP, ACT_FREEFALL, MARIO_ANIM_SLIDE_DIVE);
    return cancel;
}
/// <pygml?v=1.0&h=81c90c388>
/// @function	act_hold_stomach_slide(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_stomach_slide(m) {
    var cancel;

    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_DROP_OBJECT) {
        return drop_and_set_mario_action(m, ACT_STOMACH_SLIDE, 0);
    }

    cancel = stomach_slide_action(m, ACT_DIVE_PICKING_UP, ACT_HOLD_FREEFALL, MARIO_ANIM_SLIDE_DIVE);
    return cancel;
}

/// <pygml?v=1.0&h=8d4a9bdb9>
/// @function	act_dive_slide(m)
/// @param		{struct}	m
/// @returns	s32
function act_dive_slide(m) {
    if (!(m.input & INPUT_ABOVE_SLIDE) && (m.input & (INPUT_A_PRESSED | INPUT_B_PRESSED))) {
        return set_mario_action(m, m.forwardVel > 0.0 ? ACT_FORWARD_ROLLOUT : ACT_BACKWARD_ROLLOUT,
            0);
    }

    play_mario_landing_sound_once(m, SOUND_ACTION_TERRAIN_BODY_HIT_GROUND);

    //! If the dive slide ends on the same frame that we pick up on object,
    // Mario will not be in the dive slide action for the call to
    // mario_check_object_grab, and so will end up in the regular picking action,
    // rather than the picking up after dive action.

    if (update_sliding(m, 8.0) && is_anim_at_end(m)) {
        mario_set_forward_vel(m, 0.0);
        set_mario_action(m, ACT_STOMACH_SLIDE_STOP, 0);
    }

    if (mario_check_object_grab(m)) {
        mario_grab_used_object(m);
        m.marioBodyState.grabPos = GRAB_POS_LIGHT_OBJ;
        return true;
    }

    common_slide_action(m, ACT_STOMACH_SLIDE_STOP, ACT_FREEFALL, MARIO_ANIM_DIVE);
    return false;
}

/// <pygml?v=1.0&h=cab51cce1>
/// @function	common_ground_knockback_action(m, animation, arg2, arg3, arg4)
/// @param		{struct}	m
/// @param		{s32}		animation
/// @param		{s32}		arg2
/// @param		{s32}		arg3
/// @param		{s32}		arg4
/// @returns	s32
function common_ground_knockback_action(m, animation, arg2, arg3, arg4) {
    var val04;

    if (arg3) {
        play_mario_heavy_landing_sound_once(m, SOUND_ACTION_TERRAIN_BODY_HIT_GROUND);
    }

    if (arg4 > 0) {
        play_sound_if_no_flag(m, SOUND_MARIO_ATTACKED, MARIO_MARIO_SOUND_PLAYED);
    } else {}

    if (m.forwardVel > 32.0) {
        m.forwardVel = 32.0;
    }
    if (m.forwardVel < -32.0) {
        m.forwardVel = -32.0;
    }

    val04 = set_mario_animation(m, animation);
    if (val04 < arg2) {
        apply_landing_accel(m, 0.9);
    } else if (m.forwardVel >= 0.0) {
        mario_set_forward_vel(m, 0.1);
    } else {
        mario_set_forward_vel(m, -0.1);
    }

    if (perform_ground_step(m) == GROUND_STEP_LEFT_GROUND) {
        if (m.forwardVel >= 0.0) {
            set_mario_action(m, ACT_FORWARD_AIR_KB, arg4);
        } else {
            set_mario_action(m, ACT_BACKWARD_AIR_KB, arg4);
        }
    } else if (is_anim_at_end(m)) {
        if (m._health < 0x100) {
            set_mario_action(m, ACT_STANDING_DEATH, 0);
        } else {
            if (arg4 > 0) {
                m.invincTimer = 30;
            }
            set_mario_action(m, ACT_IDLE, 0);
        }
    }

    return val04;
}


/// <pygml?v=1.0&h=bacf820cf>
/// @function	act_hard_backward_ground_kb(m)
/// @param		{struct}	m
/// @returns	s32
function act_hard_backward_ground_kb(m) {
    var val04 =
        common_ground_knockback_action(m, MARIO_ANIM_FALL_OVER_BACKWARDS, 0x2B, true, m.actionArg);
    if (val04 == 0x2B && m._health < 0x100) {
        set_mario_action(m, ACT_DEATH_ON_BACK, 0);
    }

    if (val04 == 0x36 && m.prevAction == ACT_SPECIAL_DEATH_EXIT) {
        play_sound(SOUND_MARIO_MAMA_MIA, m.marioObj.header.gfx.cameraToObject);
    }

    if (val04 == 0x45) {
        play_mario_landing_sound_once(m, SOUND_ACTION_TERRAIN_LANDING);
    }

    return false;
}

/// <pygml?v=1.0&h=0cd35f387>
/// @function	act_hard_forward_ground_kb(m)
/// @param		{struct}	m
/// @returns	s32
function act_hard_forward_ground_kb(m) {
    var val04 = common_ground_knockback_action(m, MARIO_ANIM_LAND_ON_STOMACH, 0x15, true, m.actionArg);
    if (val04 == 0x17 && m._health < 0x100) {
        set_mario_action(m, ACT_DEATH_ON_STOMACH, 0);
    }

    return false;
}

/// <pygml?v=1.0&h=295e18830>
/// @function	act_backward_ground_kb(m)
/// @param		{struct}	m
/// @returns	s32
function act_backward_ground_kb(m) {
    common_ground_knockback_action(m, MARIO_ANIM_BACKWARD_KB, 0x16, true, m.actionArg);
    return false;
}

/// <pygml?v=1.0&h=65c45f15f>
/// @function	act_forward_ground_kb(m)
/// @param		{struct}	m
/// @returns	s32
function act_forward_ground_kb(m) {
    common_ground_knockback_action(m, MARIO_ANIM_FORWARD_KB, 0x14, true, m.actionArg);
    return false;
}

/// <pygml?v=1.0&h=66289f821>
/// @function	act_soft_backward_ground_kb(m)
/// @param		{struct}	m
/// @returns	s32
function act_soft_backward_ground_kb(m) {
    common_ground_knockback_action(m, MARIO_ANIM_SOFT_BACK_KB, 0x64, false, m.actionArg);
    return false;
}

/// <pygml?v=1.0&h=a16872087>
/// @function	act_soft_forward_ground_kb(m)
/// @param		{struct}	m
/// @returns	s32
function act_soft_forward_ground_kb(m) {
    common_ground_knockback_action(m, MARIO_ANIM_SOFT_FRONT_KB, 0x64, false, m.actionArg);
    return false;
}

/// <pygml?v=1.0&h=1c04f8c28>
/// @function	act_ground_bonk(m)
/// @param		{struct}	m
/// @returns	s32
function act_ground_bonk(m) {
    var val04 = common_ground_knockback_action(m, MARIO_ANIM_GROUND_BONK, 0x20, true, m.actionArg);
    if (val04 == 0x20) {
        play_mario_landing_sound(m, SOUND_ACTION_TERRAIN_LANDING);
    }
    return false;
}

/// <pygml?v=1.0&h=bcfc0d271>
/// @function	act_death_exit_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_death_exit_land(m) {
    var val04;

    apply_landing_accel(m, 0.9);
    play_mario_heavy_landing_sound_once(m, SOUND_ACTION_TERRAIN_BODY_HIT_GROUND);

    val04 = set_mario_animation(m, MARIO_ANIM_FALL_OVER_BACKWARDS);

    if (val04 == 0x36) {
        play_sound(SOUND_MARIO_MAMA_MIA, m.marioObj.header.gfx.cameraToObject);
    }
    if (val04 == 0x44) {
        play_mario_landing_sound(m, SOUND_ACTION_TERRAIN_LANDING);
    }

    if (is_anim_at_end(m)) {
        set_mario_action(m, ACT_IDLE, 0);
    }

    return false;
}

/// <pygml?v=1.0&h=6b2448dd1>
/// @function	common_landing_action(m, animation, airAction)
/// @param		{struct}	m
/// @param		{s16}		animation
/// @param		{u32}		airAction
/// @returns	u32
function common_landing_action(m, animation, airAction) {
    var stepResult;

    if (m.input & INPUT_NONZERO_ANALOG) {
        apply_landing_accel(m, 0.98);
    } else if (m.forwardVel >= 16.0) {
        apply_slope_decel(m, 2.0);
    } else {
        m.vel[1] = 0.0;
    }

    stepResult = perform_ground_step(m);
    switch (stepResult) {
        case (GROUND_STEP_LEFT_GROUND):
            set_mario_action(m, airAction, 0);
            break;

        case (GROUND_STEP_HIT_WALL):
            set_mario_animation(m, MARIO_ANIM_PUSHING);
            break;
    }

    if (m.forwardVel > 16.0) {
        m.particleFlags |= PARTICLE_DUST;
    }

    set_mario_animation(m, animation);
    play_mario_landing_sound_once(m, SOUND_ACTION_TERRAIN_LANDING);

    if (m._floor.type >= SURFACE_SHALLOW_QUICKSAND && m._floor.type <= SURFACE_MOVING_QUICKSAND) {
        m.quicksandDepth += (4 - m.actionTimer) * 3.5 - 0.5;
    }

    return stepResult;
}

/// <pygml?v=1.0&h=6f2c5836d>
/// @function	common_landing_cancels(m, landingAction, setAPressAction)
/// @param		{struct}	m
/// @param		{struct}	landingAction
/// @param		{u32}		setAPressAction
/// @returns	s32
function common_landing_cancels(m, landingAction, setAPressAction) {
    //! Everything here, including _floor steepness, is checked before checking
    // if Mario is actually on the _floor. This leads to e.g. remote sliding.

    if (m._floor.normal.y < 0.2923717) {
        return mario_push_off_steep_floor(m, landingAction.verySteepAction, 0);
    }

    m.doubleJumpTimer = landingAction.unk02;

    if (should_begin_sliding(m)) {
        return set_mario_action(m, landingAction.slideAction, 0);
    }

    if (m.input & INPUT_FIRST_PERSON) {
        return set_mario_action(m, landingAction.endAction, 0);
    }

    if (++m.actionTimer >= landingAction.numFrames) {
        return set_mario_action(m, landingAction.endAction, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        return setAPressAction(m, landingAction.aPressedAction, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, landingAction.offFloorAction, 0);
    }

    return false;
}

/// <pygml?v=1.0&h=8c61c8670>
/// @function	act_jump_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_jump_land(m) {
    if (common_landing_cancels(m, sJumpLandAction, set_jumping_action)) {
        return true;
    }

    common_landing_action(m, MARIO_ANIM_LAND_FROM_SINGLE_JUMP, ACT_FREEFALL);
    return false;
}

/// <pygml?v=1.0&h=13dd83b64>
/// @function	act_freefall_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_freefall_land(m) {
    if (common_landing_cancels(m, sFreefallLandAction, set_jumping_action)) {
        return true;
    }

    common_landing_action(m, MARIO_ANIM_GENERAL_LAND, ACT_FREEFALL);
    return false;
}

/// <pygml?v=1.0&h=579a3f58e>
/// @function	act_side_flip_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_side_flip_land(m) {
    if (common_landing_cancels(m, sSideFlipLandAction, set_jumping_action)) {
        return true;
    }

    if (common_landing_action(m, MARIO_ANIM_SLIDEFLIP_LAND, ACT_FREEFALL) != GROUND_STEP_HIT_WALL) {
        m.marioObj.header.gfx.angle[1] += 0x8000;
    }
    return false;
}

/// <pygml?v=1.0&h=d1d9f4412>
/// @function	act_hold_jump_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_jump_land(m) {
    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_DROP_OBJECT) {
        return drop_and_set_mario_action(m, ACT_JUMP_LAND_STOP, 0);
    }

    if (common_landing_cancels(m, sHoldJumpLandAction, set_jumping_action)) {
        return true;
    }

    common_landing_action(m, MARIO_ANIM_JUMP_LAND_WITH_LIGHT_OBJ, ACT_HOLD_FREEFALL);
    return false;
}

/// <pygml?v=1.0&h=089391977>
/// @function	act_hold_freefall_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_freefall_land(m) {
    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_DROP_OBJECT) {
        return drop_and_set_mario_action(m, ACT_FREEFALL_LAND_STOP, 0);
    }

    if (common_landing_cancels(m, sHoldFreefallLandAction, set_jumping_action)) {
        return true;
    }

    common_landing_action(m, MARIO_ANIM_FALL_LAND_WITH_LIGHT_OBJ, ACT_HOLD_FREEFALL);
    return false;
}
/// <pygml?v=1.0&h=431d7ad06>
/// @function	act_long_jump_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_long_jump_land(m) {

    if (!(m.input & INPUT_Z_DOWN)) {
        m.input &= ~INPUT_A_PRESSED;
    }

    if (common_landing_cancels(m, sLongJumpLandAction, set_jumping_action)) {
        return true;
    }

    if (!(m.input & INPUT_NONZERO_ANALOG)) {
        play_sound_if_no_flag(m, SOUND_MARIO_UH2_2, MARIO_MARIO_SOUND_PLAYED);
    }

    common_landing_action(m,
        !m.marioObj.rawData[oMarioLongJumpIsSlow] ? MARIO_ANIM_CROUCH_FROM_FAST_LONGJUMP :
        MARIO_ANIM_CROUCH_FROM_SLOW_LONGJUMP,
        ACT_FREEFALL);
    return false;
}

/// <pygml?v=1.0&h=4feaa23d7>
/// @function	act_double_jump_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_double_jump_land(m) {
    if (common_landing_cancels(m, sDoubleJumpLandAction, set_triple_jump_action)) {
        return true;
    }
    common_landing_action(m, MARIO_ANIM_LAND_FROM_DOUBLE_JUMP, ACT_FREEFALL);
    return false;
}


/// <pygml?v=1.0&h=967515d13>
/// @function	act_triple_jump_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_triple_jump_land(m) {
    m.input &= ~INPUT_A_PRESSED;

    if (common_landing_cancels(m, sTripleJumpLandAction, set_jumping_action)) {
        return true;
    }

    if (!(m.input & INPUT_NONZERO_ANALOG)) {
        play_sound_if_no_flag(m, SOUND_MARIO_HAHA, MARIO_MARIO_SOUND_PLAYED);
    }

    common_landing_action(m, MARIO_ANIM_TRIPLE_JUMP_LAND, ACT_FREEFALL);
    return false;
}

/// <pygml?v=1.0&h=4f42e3cb4>
/// @function	act_backflip_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_backflip_land(m) {
    if (!(m.input & INPUT_Z_DOWN)) {
        m.input &= ~INPUT_A_PRESSED;
    }

    if (common_landing_cancels(m, sBackflipLandAction, set_jumping_action)) {
        return true;
    }

    if (!(m.input & INPUT_NONZERO_ANALOG)) {
        play_sound_if_no_flag(m, SOUND_MARIO_HAHA, MARIO_MARIO_SOUND_PLAYED);
    }

    common_landing_action(m, MARIO_ANIM_TRIPLE_JUMP_LAND, ACT_FREEFALL);
    return false;
}

/// <pygml?v=1.0&h=cfb4e2271>
/// @function	quicksand_jump_land_action(m, animation1, animation2, endAction, airAction)
/// @param		{struct}	m
/// @param		{s32}		animation1
/// @param		{s32}		animation2
/// @param		{u32}		endAction
/// @param		{u32}		airAction
/// @returns	s32
function quicksand_jump_land_action(m, animation1, animation2, endAction, airAction) {
    if (m.actionTimer++ < 6) {
        m.quicksandDepth -= (7 - m.actionTimer) * 0.8;
        if (m.quicksandDepth < 1.0) {
            m.quicksandDepth = 1.1;
        }

        play_mario_jump_sound(m);
        set_mario_animation(m, animation1);
    } else {
        if (m.actionTimer >= 13) {
            return set_mario_action(m, endAction, 0);
        }

        set_mario_animation(m, animation2);
    }

    apply_landing_accel(m, 0.95);
    if (perform_ground_step(m) == GROUND_STEP_LEFT_GROUND) {
        set_mario_action(m, airAction, 0);
    }

    return false;
}

/// <pygml?v=1.0&h=b2682c095>
/// @function	act_quicksand_jump_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_quicksand_jump_land(m) {
    var cancel = quicksand_jump_land_action(m, MARIO_ANIM_SINGLE_JUMP, MARIO_ANIM_LAND_FROM_SINGLE_JUMP,
        ACT_JUMP_LAND_STOP, ACT_FREEFALL);
    return cancel;
}

/// <pygml?v=1.0&h=83b1d3f19>
/// @function	act_hold_quicksand_jump_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_quicksand_jump_land(m) {
    var cancel = quicksand_jump_land_action(m, MARIO_ANIM_JUMP_WITH_LIGHT_OBJ,
        MARIO_ANIM_JUMP_LAND_WITH_LIGHT_OBJ, ACT_HOLD_JUMP_LAND_STOP,
        ACT_HOLD_FREEFALL);
    return cancel;
}

/// <pygml?v=1.0&h=5536de721>
/// @function	check_common_moving_cancels(m)
/// @param		{struct}	m
/// @returns	s32
function check_common_moving_cancels(m) {
    if (m.pos[1] < m.waterLevel - 100) {
        return set_water_plunge_action(m);
    }

    if (!(m.action & ACT_FLAG_INVULNERABLE) && (m.input & INPUT_UNKNOWN_10)) {
        return drop_and_set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_SQUISHED) {
        return drop_and_set_mario_action(m, ACT_SQUISHED, 0);
    }

    if (!(m.action & ACT_FLAG_INVULNERABLE)) {
        if (m._health < 0x100) {
            return drop_and_set_mario_action(m, ACT_STANDING_DEATH, 0);
        }
    }

    return false;
}

/// <pygml?v=1.0&h=105342bc1>
/// @function	mario_execute_moving_action(m)
/// @desc		clang-format off
/// @param		{struct}	m
/// @returns	s32
function mario_execute_moving_action(m) {
    var cancel;

    if (check_common_moving_cancels(m)) {
        return true;
    }

    if (mario_update_quicksand(m, 0.25)) {
        return true;
    }


    switch (m.action) {
        case (ACT_WALKING):
            cancel = act_walking(m);
            break;
        case (ACT_HOLD_WALKING):
            cancel = act_hold_walking(m);
            break;
        case (ACT_HOLD_HEAVY_WALKING):
            cancel = act_hold_heavy_walking(m);
            break;
        case (ACT_TURNING_AROUND):
            cancel = act_turning_around(m);
            break;
        case (ACT_FINISH_TURNING_AROUND):
            cancel = act_finish_turning_around(m);
            break;
        case (ACT_BRAKING):
            cancel = act_braking(m);
            break;
        case (ACT_RIDING_SHELL_GROUND):
            cancel = act_riding_shell_ground(m);
            break;
        case (ACT_CRAWLING):
            cancel = act_crawling(m);
            break;
        case (ACT_BURNING_GROUND):
            cancel = act_burning_ground(m);
            break;
        case (ACT_DECELERATING):
            cancel = act_decelerating(m);
            break;
        case (ACT_HOLD_DECELERATING):
            cancel = act_hold_decelerating(m);
            break;
        case (ACT_BUTT_SLIDE):
            cancel = act_butt_slide(m);
            break;
        case (ACT_STOMACH_SLIDE):
            cancel = act_stomach_slide(m);
            break;
        case (ACT_HOLD_BUTT_SLIDE):
            cancel = act_hold_butt_slide(m);
            break;
        case (ACT_HOLD_STOMACH_SLIDE):
            cancel = act_hold_stomach_slide(m);
            break;
        case (ACT_DIVE_SLIDE):
            cancel = act_dive_slide(m);
            break;
        case (ACT_MOVE_PUNCHING):
            cancel = act_move_punching(m);
            break;
        case (ACT_CROUCH_SLIDE):
            cancel = act_crouch_slide(m);
            break;
        case (ACT_SLIDE_KICK_SLIDE):
            cancel = act_slide_kick_slide(m);
            break;
        case (ACT_HARD_BACKWARD_GROUND_KB):
            cancel = act_hard_backward_ground_kb(m);
            break;
        case (ACT_HARD_FORWARD_GROUND_KB):
            cancel = act_hard_forward_ground_kb(m);
            break;
        case (ACT_BACKWARD_GROUND_KB):
            cancel = act_backward_ground_kb(m);
            break;
        case (ACT_FORWARD_GROUND_KB):
            cancel = act_forward_ground_kb(m);
            break;
        case (ACT_SOFT_BACKWARD_GROUND_KB):
            cancel = act_soft_backward_ground_kb(m);
            break;
        case (ACT_SOFT_FORWARD_GROUND_KB):
            cancel = act_soft_forward_ground_kb(m);
            break;
        case (ACT_GROUND_BONK):
            cancel = act_ground_bonk(m);
            break;
        case (ACT_DEATH_EXIT_LAND):
            cancel = act_death_exit_land(m);
            break;
        case (ACT_JUMP_LAND):
            cancel = act_jump_land(m);
            break;
        case (ACT_FREEFALL_LAND):
            cancel = act_freefall_land(m);
            break;
        case (ACT_DOUBLE_JUMP_LAND):
            cancel = act_double_jump_land(m);
            break;
        case (ACT_SIDE_FLIP_LAND):
            cancel = act_side_flip_land(m);
            break;
        case (ACT_HOLD_JUMP_LAND):
            cancel = act_hold_jump_land(m);
            break;
        case (ACT_HOLD_FREEFALL_LAND):
            cancel = act_hold_freefall_land(m);
            break;
        case (ACT_TRIPLE_JUMP_LAND):
            cancel = act_triple_jump_land(m);
            break;
        case (ACT_BACKFLIP_LAND):
            cancel = act_backflip_land(m);
            break;
        case (ACT_QUICKSAND_JUMP_LAND):
            cancel = act_quicksand_jump_land(m);
            break;
        case (ACT_HOLD_QUICKSAND_JUMP_LAND):
            cancel = act_hold_quicksand_jump_land(m);
            break;
        case (ACT_LONG_JUMP_LAND):
            cancel = act_long_jump_land(m);
            break;
    }
    /* clang-format on */

    if (!cancel && (m.input & INPUT_IN_WATER)) {
        m.particleFlags |= PARTICLE_WAVE_TRAIL;
        m.particleFlags &= ~PARTICLE_DUST;
    }

    return cancel;
}
