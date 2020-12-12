function mario_step_macros_init() {
	globalvar sMovingSandSpeeds;
	sMovingSandSpeeds	= [12, 8, 4, 0];

	globalvar gWaterSurfacePseudoFloor;
	gWaterSurfacePseudoFloor = new Surface(
	    SURFACE_VERY_SLIPPERY, 0,    0,    0, 0, 0, [0, 0, 0], [0, 0, 0], [0, 0, 0],
	    {x:0, y:1, z:0},  0, null
	);
	
	boot("mario_step_macros_init");
}

/**
 * Always returns zero. This may have been intended
 * to be used for the beta trampoline. Its return value
 * is used by set_mario_y_vel_based_on_fspeed as a constant
 * addition to Mario's Y velocity. Given the closeness of
 * this function to stub_mario_step_2, it is probable that this
 * was intended to check whether a trampoline had made itself
 * known through stub_mario_step_2 and whether Mario was on it,
 * and if so return a higher value than 0.
 */
function get_additive_y_vel_for_jumps() {
    return 0.0;
}

/// <pygml?v=1.0&h=015d56974>
/// @function	stub_mario_step_1(x)
/// @param		{struct}	x
function stub_mario_step_1(_x) {}

/// <pygml?v=1.0&h=0c2fb917a>
/// @function	stub_mario_step_2()
function stub_mario_step_2() {}

/// <pygml?v=1.0&h=531054a33>
/// @function	transfer_bully_speed(obj1, obj2)
/// @param		{struct}	obj1
/// @param		{struct}	obj2
function transfer_bully_speed(obj1, obj2) {
    var rx = obj2.posX - obj1.posX;
    var rz = obj2.posZ - obj1.posZ;

    //! Bully NaN crash
    var projectedV1 = (rx * obj1.velX + rz * obj1.velZ) / (rx * rx + rz * rz);
    var projectedV2 = (-rx * obj2.velX - rz * obj2.velZ) / (rx * rx + rz * rz);

    // Kill speed along r. Convert one object's speed along r and transfer it to
    // the other object.
    obj2.velX += obj2.conversionRatio * projectedV1 * rx - projectedV2 * -rx;
    obj2.velZ += obj2.conversionRatio * projectedV1 * rz - projectedV2 * -rz;

    obj1.velX += -projectedV1 * rx + obj1.conversionRatio * projectedV2 * -rx;
    obj1.velZ += -projectedV1 * rz + obj1.conversionRatio * projectedV2 * -rz;

    //! Bully battery
}
/// <pygml?v=1.0&h=e470fdbfc>
/// @function	init_bully_collision_data(data, posX, posZ, forwardVel, yaw, conversionRatio, radius)
/// @param		{struct}	data
/// @param		{f32}		posX
/// @param		{f32}		posZ
/// @param		{f32}		forwardVel
/// @param		{s16}		yaw
/// @param		{f32}		conversionRatio
/// @param		{f32}		radius
function init_bully_collision_data(data, posX, posZ, forwardVel, yaw, conversionRatio, radius) {
    if (forwardVel < 0.0) {
        forwardVel *= -1.0;
        yaw += 0x8000;
    }

    data.radius = radius;
    data.conversionRatio = conversionRatio;
    data.posX = posX;
    data.posZ = posZ;
    data.velX = forwardVel * sins(yaw);
    data.velZ = forwardVel * coss(yaw);
}

/// <pygml?v=1.0&h=e54d26807>
/// @function	mario_bonk_reflection(m, negateSpeed)
/// @param		{struct}	m
/// @param		{u32}		negateSpeed
function mario_bonk_reflection(m, negateSpeed) {
    if (m.wall != null) {
        var wallAngle = atan2s(m.wall.normal.z, m.wall.normal.x);
        m.faceAngle[1] = wallAngle - (m.faceAngle[1] - wallAngle);

        play_sound((m.flags & MARIO_METAL_CAP) ? SOUND_ACTION_METAL_BONK : SOUND_ACTION_BONK,
            m.marioObj.header.gfx.cameraToObject);
    } else {
        play_sound(SOUND_ACTION_HIT, m.marioObj.header.gfx.cameraToObject);
    }

    if (negateSpeed) {
        mario_set_forward_vel(m, -m.forwardVel);
    } else {
        m.faceAngle[1] += 0x8000;
    }
}

/// <pygml?v=1.0&h=57a1cb643>
/// @function	mario_update_quicksand(m, sinkingSpeed)
/// @param		{struct}	m
/// @param		{f32}		sinkingSpeed
/// @returns	u32
function mario_update_quicksand(m, sinkingSpeed) {
    if (m.action & ACT_FLAG_RIDING_SHELL) {
        m.quicksandDepth = 0.0;
    } else {
        if (m.quicksandDepth < 1.1) {
            m.quicksandDepth = 1.1;
        }

        switch (m._floor.type) {
            case (SURFACE_SHALLOW_QUICKSAND):
				m.quicksandDepth += sinkingSpeed
                if (m.quicksandDepth >= 10.0) {
                    m.quicksandDepth = 10.0;
                }
                break;

            case (SURFACE_SHALLOW_MOVING_QUICKSAND):
				m.quicksandDepth += sinkingSpeed;
                if (m.quicksandDepth >= 25.0) {
                    m.quicksandDepth = 25.0;
                }
                break;

            case (SURFACE_QUICKSAND):
            case (SURFACE_MOVING_QUICKSAND):
				m.quicksandDepth += sinkingSpeed;
                if (m.quicksandDepth >= 60.0) {
                    m.quicksandDepth = 60.0;
                }
                break;

            case (SURFACE_DEEP_QUICKSAND):
            case (SURFACE_DEEP_MOVING_QUICKSAND):
				m.quicksandDepth += sinkingSpeed;
                if (m.quicksandDepth >= 160.0) {
                    update_mario_sound_and_camera(m);
                    return drop_and_set_mario_action(m, ACT_QUICKSAND_DEATH, 0);
                }
                break;

            case (SURFACE_INSTANT_QUICKSAND):
            case (SURFACE_INSTANT_MOVING_QUICKSAND):
                update_mario_sound_and_camera(m);
                return drop_and_set_mario_action(m, ACT_QUICKSAND_DEATH, 0);
                break;

            default:
                m.quicksandDepth = 0.0;
                break;
        }
    }

    return 0;
}

/// <pygml?v=1.0&h=e653f804e>
/// @function	mario_push_off_steep_floor(m, action, actionArg)
/// @param		{struct}	m
/// @param		{u32}		action
/// @param		{u32}		actionArg
/// @returns	u32
function mario_push_off_steep_floor(m, action, actionArg) {
    var floorDYaw = m.floorAngle - m.faceAngle[1];

    if (floorDYaw > -0x4000 && floorDYaw < 0x4000) {
        m.forwardVel = 16.0;
        m.faceAngle[1] = m.floorAngle;
    } else {
        m.forwardVel = -16.0;
        m.faceAngle[1] = m.floorAngle + 0x8000;
    }

    return set_mario_action(m, action, actionArg);
}

/// <pygml?v=1.0&h=b4a3f25b6>
/// @function	mario_update_moving_sand(m)
/// @param		{struct}	m
/// @returns	u32
function mario_update_moving_sand(m) {
    var _floor = m._floor;
    var floorType = _floor.type;

    if (floorType == SURFACE_DEEP_MOVING_QUICKSAND || floorType == SURFACE_SHALLOW_MOVING_QUICKSAND ||
        floorType == SURFACE_MOVING_QUICKSAND || floorType == SURFACE_INSTANT_MOVING_QUICKSAND) {
        var pushAngle = _floor.force << 8;
        var pushSpeed = sMovingSandSpeeds[_floor.force >> 8];

        m.vel[0] += pushSpeed * sins(pushAngle);
        m.vel[2] += pushSpeed * coss(pushAngle);

        return 1;
    }

    return 0;
}

/// <pygml?v=1.0&h=771beadf2>
/// @function	mario_update_windy_ground(m)
/// @param		{struct}	m
/// @returns	u32
function mario_update_windy_ground(m) {
    var _floor = m._floor;

    if (_floor.type == SURFACE_HORIZONTAL_WIND) {
        var pushSpeed;
        var pushAngle = _floor.force << 8;

        if (m.action & ACT_FLAG_MOVING) {
            var pushDYaw = m.faceAngle[1] - pushAngle;

            pushSpeed = m.forwardVel > 0.0 ? -m.forwardVel * 0.5 : -8.0;

            if (pushDYaw > -0x4000 && pushDYaw < 0x4000) {
                pushSpeed *= -1.0;
            }

            pushSpeed *= coss(pushDYaw);
        } else {
            pushSpeed = 3.2 + (gGlobalTimer % 4);
        }

        m.vel[0] += pushSpeed * sins(pushAngle);
        m.vel[2] += pushSpeed * coss(pushAngle);

        return 1;
    }

    return 0;
}

/// <pygml?v=1.0&h=6f07e3733>
/// @function	stop_and_set_height_to_floor(m)
/// @param		{struct}	m
function stop_and_set_height_to_floor(m) {
    var marioObj = m.marioObj;

    mario_set_forward_vel(m, 0.0);
    m.vel[1] = 0.0;

    //! This is responsible for some downwarps.
    m.pos[1] = m.floorHeight;

    vec3f_copy(marioObj.header.gfx.pos, m.pos);
    vec3s_set(marioObj.header.gfx.angle, 0, m.faceAngle[1], 0);
}

/// <pygml?v=1.0&h=1ab1f59cd>
/// @function	stationary_ground_step(m)
/// @param		{struct}	m
/// @returns	s32
function stationary_ground_step(m) {
    var takeStep;
    var marioObj = m.marioObj;
    var stepResult = GROUND_STEP_NONE;

    mario_set_forward_vel(m, 0.0);

    takeStep = mario_update_moving_sand(m);
    takeStep |= mario_update_windy_ground(m);
    if (takeStep) {
        stepResult = perform_ground_step(m);
    } else {
        //! This is responsible for several stationary downwarps.
        m.pos[1] = m.floorHeight;

        vec3f_copy(marioObj.header.gfx.pos, m.pos);
        vec3s_set(marioObj.header.gfx.angle, 0, m.faceAngle[1], 0);
    }

    return stepResult;
}

/// <pygml?v=1.0&h=e8aa95515>
/// @function	perform_ground_quarter_step(m, nextPos)
/// @param		{struct}	m
/// @param		{Vec3f}		nextPos
/// @returns	s32
function perform_ground_quarter_step(m, nextPos) {
    var lowerWall;
    var upperWall;
    var _ceil = null;
    var _floor = {};
    var ceilHeight;
    var floorHeight;
    var waterLevel;

    lowerWall = resolve_and_return_wall_collisions(nextPos, 30.0, 24.0);
    upperWall = resolve_and_return_wall_collisions(nextPos, 60.0, 50.0);

    floorHeight = find_floor(nextPos[@ 0], nextPos[@ 1], nextPos[@ 2], _floor)
    _floor = _floor._floor;
    ceilHeight = vec3f_find_ceil(nextPos, floorHeight, _ceil);

    waterLevel = find_water_level(nextPos[@ 0], nextPos[@ 2]);

    m.wall = upperWall;

    if (_floor == null) {
        return GROUND_STEP_HIT_WALL_STOP_QSTEPS;
    }

    if ((m.action & ACT_FLAG_RIDING_SHELL) && floorHeight < waterLevel) {
        floorHeight = waterLevel;
        _floor = gWaterSurfacePseudoFloor;
        _floor.originOffset = floorHeight; //! Wrong origin offset (no effect)
    }

    if (nextPos[@ 1] > floorHeight + 100.0) {
        if (nextPos[@ 1] + 160.0 >= ceilHeight) {
            return GROUND_STEP_HIT_WALL_STOP_QSTEPS;
        }

        vec3f_copy(m.pos, nextPos);
        m._floor = _floor;
        m.floorHeight = floorHeight;
        return GROUND_STEP_LEFT_GROUND;
    }

    if (floorHeight + 160.0 >= ceilHeight) {
        return GROUND_STEP_HIT_WALL_STOP_QSTEPS;
    }

    vec3f_set(m.pos, nextPos[@ 0], floorHeight, nextPos[@ 2]);
    m._floor = _floor;
    m.floorHeight = floorHeight;

    if (upperWall != null) {
        var wallDYaw = atan2s(upperWall.normal.z, upperWall.normal.x) - m.faceAngle[1];

        if (wallDYaw >= 0x2AAA && wallDYaw <= 0x5555) {
            return GROUND_STEP_NONE;
        }
        if (wallDYaw <= -0x2AAA && wallDYaw >= -0x5555) {
            return GROUND_STEP_NONE;
        }

        return GROUND_STEP_HIT_WALL_CONTINUE_QSTEPS;
    }

    return GROUND_STEP_NONE;
}


/// <pygml?v=1.0&h=5cb5dec0e>
/// @function	perform_ground_step(m)
/// @param		{struct}	m
/// @returns	s32
function perform_ground_step(m) {
    var i;
    var stepResult;
    var intendedPos = Vec3f;

    for (i = 0; i < 4; i++) {
        intendedPos[0] = m.pos[0] + m._floor.normal.y * (m.vel[0] / 4.0);
        intendedPos[2] = m.pos[2] + m._floor.normal.y * (m.vel[2] / 4.0);
        intendedPos[1] = m.pos[1];

        stepResult = perform_ground_quarter_step(m, intendedPos);
        if (stepResult == GROUND_STEP_LEFT_GROUND || stepResult == GROUND_STEP_HIT_WALL_STOP_QSTEPS) {
            break;
        }
    }

    m.terrainSoundAddend = mario_get_terrain_sound_addend(m);
    vec3f_copy(m.marioObj.header.gfx.pos, m.pos);
    vec3s_set(m.marioObj.header.gfx.angle, 0, m.faceAngle[1], 0);

    if (stepResult == GROUND_STEP_HIT_WALL_CONTINUE_QSTEPS) {
        stepResult = GROUND_STEP_HIT_WALL;
    }
    return stepResult;
}

/// <pygml?v=1.0&h=4d7b5cfc7>
/// @function	check_ledge_grab(m, wall, intendedPos, nextPos)
/// @param		{struct}	m
/// @param		{struct}	wall
/// @param		{Vec3f}		intendedPos
/// @param		{Vec3f}		nextPos
/// @returns	u32
function check_ledge_grab(m, wall, intendedPos, nextPos) {
    var ledgeFloor = {};
    var ledgePos = Vec3f;
    var displacementX;
    var displacementZ;

    if (m.vel[1] > 0) {
        return 0;
    }

    displacementX = nextPos[@ 0] - intendedPos[@ 0];
    displacementZ = nextPos[@ 2] - intendedPos[@ 2];

    // Only ledge grab if the wall displaced Mario in the opposite direction of
    // his velocity.
    if (displacementX * m.vel[0] + displacementZ * m.vel[2] > 0.0) {
        return 0;
    }

    //! Since the search for floors starts at _y + 160, we will sometimes grab
    // a higher ledge than expected (glitchy ledge grab)
    ledgePos[0] = nextPos[@ 0] - wall.normal.x * 60.0;
    ledgePos[2] = nextPos[@ 2] - wall.normal.z * 60.0;
    ledgePos[1] = find_floor(ledgePos[0], nextPos[@ 1] + 160.0, ledgePos[2], ledgeFloor);
	ledgeFloor = ledgeFloor._floor;

    if (ledgePos[1] - nextPos[@ 1] <= 100.0) {
        return 0;
    }

    vec3f_copy(m.pos, ledgePos);
    m._floor = ledgeFloor;
    m.floorHeight = ledgePos[1];

    m.floorAngle = atan2s(ledgeFloor.normal.z, ledgeFloor.normal.x);

    m.faceAngle[0] = 0;
    m.faceAngle[1] = atan2s(wall.normal.z, wall.normal.x) + 0x8000;
    return 1;
}

/// <pygml?v=1.0&h=627105dd1>
/// @function	perform_air_quarter_step(m, intendedPos, stepArg)
/// @param		{struct}	m
/// @param		{Vec3f}		intendedPos
/// @param		{u32}		stepArg
/// @returns	s32
function perform_air_quarter_step(m, intendedPos, stepArg) {
    var wallDYaw;
    var nextPos = Vec3f;
    var upperWall;
    var lowerWall;
    var _ceil = null;
    var _floor = {};
    var ceilHeight;
    var floorHeight;
    var waterLevel;

    vec3f_copy(nextPos, intendedPos);

    upperWall = resolve_and_return_wall_collisions(nextPos, 150.0, 50.0);
    lowerWall = resolve_and_return_wall_collisions(nextPos, 30.0, 50.0);

    floorHeight = find_floor(nextPos[0], nextPos[1], nextPos[2], _floor)
    _floor = _floor._floor;
    ceilHeight = vec3f_find_ceil(nextPos, floorHeight, _ceil);

    waterLevel = find_water_level(nextPos[0], nextPos[2]);

    m.wall = null;

    //! The water pseudo _floor is not referenced when your intended qstep is
    // out of bounds, so it won't detect you as landing.

    if (_floor == null) {
        if (nextPos[1] <= m.floorHeight) {
            m.pos[1] = m.floorHeight;
            return AIR_STEP_LANDED;
        }

        m.pos[1] = nextPos[1];
        return AIR_STEP_HIT_WALL;
    }

    if ((m.action & ACT_FLAG_RIDING_SHELL) && floorHeight < waterLevel) {
        floorHeight = waterLevel;
        _floor = gWaterSurfacePseudoFloor;
        _floor.originOffset = floorHeight; //! Incorrect origin offset (no effect)
    }

    //! This check uses f32, but findFloor uses short (overflow jumps)
    if (nextPos[1] <= floorHeight) {
        if (ceilHeight - floorHeight > 160.0) {
            m.pos[0] = nextPos[0];
            m.pos[2] = nextPos[2];
            m._floor = _floor;
            m.floorHeight = floorHeight;
        }

        //! When ceilHeight - floorHeight <= 160, the step result says that
        // Mario landed, but his movement is cancelled and his referenced _floor
        // isn't updated (pedro spots)
        m.pos[1] = floorHeight;
        return AIR_STEP_LANDED;
    }

    if (nextPos[1] + 160.0 > ceilHeight) {
        if (m.vel[1] >= 0.0) {
            m.vel[1] = 0.0;

            //! Uses referenced ceiling instead of _ceil (ceiling hang upwarp)
            if ((stepArg & AIR_STEP_CHECK_HANG) && m._ceil != null &&
                m._ceil.type == SURFACE_HANGABLE) {
                return AIR_STEP_GRABBED_CEILING;
            }

            return AIR_STEP_NONE;
        }

        //! Potential subframe downwarp.upwarp?
        if (nextPos[1] <= m.floorHeight) {
            m.pos[1] = m.floorHeight;
            return AIR_STEP_LANDED;
        }

        m.pos[1] = nextPos[1];
        return AIR_STEP_HIT_WALL;
    }

    //! When the wall is not completely vertical or there is a slight wall
    // misalignment, you can activate these conditions in unexpected situations
    if ((stepArg & AIR_STEP_CHECK_LEDGE_GRAB) && upperWall == null && lowerWall != null) {
        if (check_ledge_grab(m, lowerWall, intendedPos, nextPos)) {
            return AIR_STEP_GRABBED_LEDGE;
        }

        vec3f_copy(m.pos, nextPos);
        m._floor = _floor;
        m.floorHeight = floorHeight;
        return AIR_STEP_NONE;
    }

    vec3f_copy(m.pos, nextPos);
    m._floor = _floor;
    m.floorHeight = floorHeight;

    if (upperWall != null || lowerWall != null) {
        m.wall = upperWall != null ? upperWall : lowerWall;
        wallDYaw = atan2s(m.wall.normal.z, m.wall.normal.x) - m.faceAngle[1];

        if (m.wall.type == SURFACE_BURNING) {
            return AIR_STEP_HIT_LAVA_WALL;
        }

        if (wallDYaw < -0x6000 || wallDYaw > 0x6000) {
            m.flags |= MARIO_UNKNOWN_30;
            return AIR_STEP_HIT_WALL;
        }
    }

    return AIR_STEP_NONE;
}

/// <pygml?v=1.0&h=c6fbe4807>
/// @function	apply_twirl_gravity(m)
/// @param		{struct}	m
function apply_twirl_gravity(m) {
    var terminalVelocity;
    var heaviness = 1.0;

    if (m.angleVel[1] > 1024) {
        heaviness = 1024.0 / m.angleVel[1];
    }

    terminalVelocity = -75.0 * heaviness;

    m.vel[1] -= 4.0 * heaviness;
    if (m.vel[1] < terminalVelocity) {
        m.vel[1] = terminalVelocity;
    }
}



/// <pygml?v=1.0&h=de238dc56>
/// @function	should_strengthen_gravity_for_jump_ascent(m)
/// @param		{struct}	m
/// @returns	u32
function should_strengthen_gravity_for_jump_ascent(m) {
    if (!(m.flags & MARIO_UNKNOWN_08)) {
        return false;
    }

    if (m.action & (ACT_FLAG_INTANGIBLE | ACT_FLAG_INVULNERABLE)) {
        return false;
    }

    if (!(m.input & INPUT_A_DOWN) && m.vel[1] > 20.0) {
        return (m.action & ACT_FLAG_CONTROL_JUMP_HEIGHT) != 0;
    }

    return false;
}

/// <pygml?v=1.0&h=ee7302dc5>
/// @function	apply_gravity(m)
/// @param		{struct}	m
function apply_gravity(m) {
    if (m.action == ACT_TWIRLING && m.vel[1] < 0.0) {
        apply_twirl_gravity(m);
    } else if (m.action == ACT_SHOT_FROM_CANNON) {
        m.vel[1] -= 1.0;
        if (m.vel[1] < -75.0) {
            m.vel[1] = -75.0;
        }
    } else if (m.action == ACT_LONG_JUMP || m.action == ACT_SLIDE_KICK ||
        m.action == ACT_BBH_ENTER_SPIN) {
        m.vel[1] -= 2.0;
        if (m.vel[1] < -75.0) {
            m.vel[1] = -75.0;
        }
    } else if (m.action == ACT_LAVA_BOOST || m.action == ACT_FALL_AFTER_STAR_GRAB) {
        m.vel[1] -= 3.2;
        if (m.vel[1] < -65.0) {
            m.vel[1] = -65.0;
        }
    } else if (m.action == ACT_GETTING_BLOWN) {
        m.vel[1] -= m.unkC4;
        if (m.vel[1] < -75.0) {
            m.vel[1] = -75.0;
        }
    } else if (should_strengthen_gravity_for_jump_ascent(m)) {
        m.vel[1] /= 4.0;
    } else if (m.action & ACT_FLAG_METAL_WATER) {
        m.vel[1] -= 1.6;
        if (m.vel[1] < -16.0) {
            m.vel[1] = -16.0;
        }
    } else if ((m.flags & MARIO_WING_CAP) && m.vel[1] < 0.0 && (m.input & INPUT_A_DOWN)) {
        m.marioBodyState.wingFlutter = true;

        m.vel[1] -= 2.0;
        if (m.vel[1] < -37.5) {
			m.vel[1] += 4.0;
            if (m.vel[1] > -37.5) {
                m.vel[1] = -37.5;
            }
        }
    } else {
        m.vel[1] -= 4.0;
        if (m.vel[1] < -75.0) {
            m.vel[1] = -75.0;
        }
    }
}

/// <pygml?v=1.0&h=9e39b7e1f>
/// @function	apply_vertical_wind(m)
/// @param		{struct}	m
function apply_vertical_wind(m) {
    var maxVelY;
    var offsetY;

    if (m.action != ACT_GROUND_POUND) {
        offsetY = m.pos[1] - -1500.0;

        if (m._floor.type == SURFACE_VERTICAL_WIND && -3000.0 < offsetY && offsetY < 2000.0) {
            if (offsetY >= 0.0) {
                maxVelY = 10000.0 / (offsetY + 200.0);
            } else {
                maxVelY = 50.0;
            }

            if (m.vel[1] < maxVelY) {
				m.vel[1] += maxVelY / 8.0;
                if (m.vel[1] > maxVelY) {
                    m.vel[1] = maxVelY;
                }
            }

        }
    }
}


/// <pygml?v=1.0&h=664d472d8>
/// @function	perform_air_step(m, stepArg)
/// @param		{struct}	m
/// @param		{u32}		stepArg
/// @returns	s32
function perform_air_step(m, stepArg) {
    var intendedPos = Vec3f;
    var i;
    var quarterStepResult;
    var stepResult = AIR_STEP_NONE;

    m.wall = null;

    for (i = 0; i < 4; i++) {
        intendedPos[0] = m.pos[0] + m.vel[0] / 4.0;
        intendedPos[1] = m.pos[1] + m.vel[1] / 4.0;
        intendedPos[2] = m.pos[2] + m.vel[2] / 4.0;

        quarterStepResult = perform_air_quarter_step(m, intendedPos, stepArg);

        //! On one qf, hit OOB/_ceil/wall to store the 2 return value, and continue
        // getting 0s until your last qf. Graze a wall on your last qf, and it will
        // return the stored 2 with a sharply angled reference wall. (some gwks)

        if (quarterStepResult != AIR_STEP_NONE) {
            stepResult = quarterStepResult;
        }

        if (quarterStepResult == AIR_STEP_LANDED || quarterStepResult == AIR_STEP_GRABBED_LEDGE ||
            quarterStepResult == AIR_STEP_GRABBED_CEILING ||
            quarterStepResult == AIR_STEP_HIT_LAVA_WALL) {
            break;
        }
    }

    if (m.vel[1] >= 0.0) {
        m.peakHeight = m.pos[1];
    }

    m.terrainSoundAddend = mario_get_terrain_sound_addend(m);

    if (m.action != ACT_FLYING) {
        apply_gravity(m);
    }
    apply_vertical_wind(m);

    vec3f_copy(m.marioObj.header.gfx.pos, m.pos);
    vec3s_set(m.marioObj.header.gfx.angle, 0, m.faceAngle[1], 0);

    return stepResult;
}


/// <pygml?v=1.0&h=2e46665d4>
/// @function	set_vel_from_pitch_and_yaw(m)
/// @param		{struct}	m
// They had these functions the whole time and never used them? Lol

function set_vel_from_pitch_and_yaw(m) {
    m.vel[0] = m.forwardVel * coss(m.faceAngle[0]) * sins(m.faceAngle[1]);
    m.vel[1] = m.forwardVel * sins(m.faceAngle[0]);
    m.vel[2] = m.forwardVel * coss(m.faceAngle[0]) * coss(m.faceAngle[1]);
}

/// <pygml?v=1.0&h=6ef989ed6>
/// @function	set_vel_from_yaw(m)
/// @param		{struct}	m
function set_vel_from_yaw(m) {
    m.vel[0] = m.slideVelX = m.forwardVel * sins(m.faceAngle[1]);
    m.vel[1] = 0.0;
    m.vel[2] = m.slideVelZ = m.forwardVel * coss(m.faceAngle[1]);
}
