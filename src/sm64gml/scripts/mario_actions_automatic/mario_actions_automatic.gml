function mario_actions_automatic_macros_init() {
	#macro POLE_NONE 0
	#macro POLE_TOUCHED_FLOOR 1
	#macro POLE_FELL_OFF 2

	#macro HANG_NONE 0
	#macro HANG_HIT_CEIL_OR_OOB 1
	#macro HANG_LEFT_CEIL 2	
	
	boot("mario_actions_automatic_macros_init");
}

/// <pygml?v=1.0&h=be8f69ffb>
/// @function	add_tree_leaf_particles(m)
/// @param		{struct}	m
function add_tree_leaf_particles(m) {
    var leafHeight;

    if (behaviors_equal(m.usedObj.behavior, Object1.bhvTree)) {
        // make leaf effect spawn higher on the Shifting Sand Land palm tree
        if (gCurrLevelNum == LEVEL_SSL) {
            leafHeight = 250.0;
        } else {
            leafHeight = 100.0;
        }
        if (m.pos[1] - m.floorHeight > leafHeight) {
            m.particleFlags |= PARTICLE_LEAF;
        }
    }
}

/// <pygml?v=1.0&h=760711c5f>
/// @function	play_climbing_sounds(m, b)
/// @param		{struct}	m
/// @param		{s32}		b
function play_climbing_sounds(m, b) {
    var isOnTree = (behaviors_equal(m.usedObj.behavior, Object1.bhvTree));

    if (b == 1) {
        if (is_anim_past_frame(m, 1)) {
            play_sound(isOnTree ? SOUND_ACTION_CLIMB_UP_TREE : SOUND_ACTION_CLIMB_UP_POLE,
                m.marioObj.header.gfx.cameraToObject);
        }
    } else {
        play_sound(isOnTree ? SOUND_MOVING_SLIDE_DOWN_TREE : SOUND_MOVING_SLIDE_DOWN_POLE,
            m.marioObj.header.gfx.cameraToObject);
    }
}


/// <pygml?v=1.0&h=8efb62393>
/// @function	set_pole_position(m, offsetY)
/// @param		{struct}	m
/// @param		{f32}		offsetY
/// @returns	s32
function set_pole_position(m, offsetY) {
    var unused1;
    var unused2;
    var unused3;
    var _floor = {};
    var _ceil = null;
    var floorHeight;
    var ceilHeight;
    var collided;
    var result = POLE_NONE;
    var poleTop = m.usedObj.hitboxHeight - 100.0;
    var marioObj = m.marioObj;

    if (marioObj.rawData[oMarioPolePos] > poleTop) {
        marioObj.rawData[oMarioPolePos] = poleTop;
    }

    m.pos[0] = m.usedObj.rawData[oPosX];
    m.pos[2] = m.usedObj.rawData[oPosZ];
    m.pos[1] = m.usedObj.rawData[oPosY] + marioObj.rawData[oMarioPolePos] + offsetY;

    collided = f32_find_wall_collision(m.pos[0], m.pos[1], m.pos[2], 60.0, 50.0);
    collided |= f32_find_wall_collision(m.pos[0], m.pos[1], m.pos[2], 30.0, 24.0);

    ceilHeight = vec3f_find_ceil(m.pos, m.pos[1], _ceil);
    if (m.pos[1] > ceilHeight - 160.0) {
        m.pos[1] = ceilHeight - 160.0;
        marioObj.rawData[oMarioPolePos] = m.pos[1] - m.usedObj.rawData[oPosY];
    }

    floorHeight = find_floor(m.pos[0], m.pos[1], m.pos[2], _floor)
    _floor = _floor._floor;
    if (m.pos[1] < floorHeight) {
        m.pos[1] = floorHeight;
        set_mario_action(m, ACT_IDLE, 0);
        result = POLE_TOUCHED_FLOOR;
    } else if (marioObj.rawData[oMarioPolePos] < -m.usedObj.hitboxDownOffset) {
        m.pos[1] = m.usedObj.rawData[oPosY] - m.usedObj.hitboxDownOffset;
        set_mario_action(m, ACT_FREEFALL, 0);
        result = POLE_FELL_OFF;
    } else if (collided) {
        if (m.pos[1] > floorHeight + 20.0) {
            m.forwardVel = -2.0;
            set_mario_action(m, ACT_SOFT_BONK, 0);
            result = POLE_FELL_OFF;
        } else {
            set_mario_action(m, ACT_IDLE, 0);
            result = POLE_TOUCHED_FLOOR;
        }
    }

    vec3f_copy(m.marioObj.header.gfx.pos, m.pos);
    vec3s_set(m.marioObj.header.gfx.angle, m.usedObj.rawData[oMoveAnglePitch], m.faceAngle[1],
        m.usedObj.rawData[oMoveAngleRoll]);

    return result;
}


/// <pygml?v=1.0&h=806f1bd73>
/// @function	act_holding_pole(m)
/// @param		{struct}	m
/// @returns	s32
function act_holding_pole(m) {
    var marioObj = m.marioObj;


    if (m.controller.stickY > 16.0) {
        var poleTop = m.usedObj.hitboxHeight - 100.0;
        var poleBehavior = m.usedObj.behavior;

        if (marioObj.rawData[oMarioPolePos] < poleTop - 0.4) {
            return set_mario_action(m, ACT_CLIMBING_POLE, 0);
        }

        if (!behaviors_equal(poleBehavior, Object1.bhvGiantPole) && m.controller.stickY > 50.0) {
            return set_mario_action(m, ACT_TOP_OF_POLE_TRANSITION, 0);
        }
    }

    if (m.controller.stickY < -16.0) {
        marioObj.rawData[oMarioPoleYawVel] -= m.controller.stickY * 2;
        if (marioObj.rawData[oMarioPoleYawVel] > 0x1000) {
            marioObj.rawData[oMarioPoleYawVel] = 0x1000;
        }

        m.faceAngle[1] += marioObj.rawData[oMarioPoleYawVel];
        marioObj.rawData[oMarioPolePos] -= marioObj.rawData[oMarioPoleYawVel] / 0x100;

        if (behaviors_equal(m.usedObj.behavior, Object1.bhvTree)) {
            //! The Shifting Sand Land palm tree check is done climbing up in
            // add_tree_leaf_particles, but not here, when climbing down.
            if (m.pos[1] - m.floorHeight > 100.0) {
                m.particleFlags |= PARTICLE_LEAF;
            }
        }
        play_climbing_sounds(m, 2);
        func_80320A4C(1, marioObj.rawData[oMarioPoleYawVel] / 0x100 * 2);
    } else {
        marioObj.rawData[oMarioPoleYawVel] = 0;
        m.faceAngle[1] -= m.controller.stickX * 16.0;
    }

    if (set_pole_position(m, 0.0) == POLE_NONE) {
        set_mario_animation(m, MARIO_ANIM_IDLE_ON_POLE);
    }

    return false;
}

/// <pygml?v=1.0&h=571b31e40>
/// @function	act_climbing_pole(m)
/// @param		{struct}	m
/// @returns	s32
function act_climbing_pole(m) {
    var sp24;
    var marioObj = m.marioObj;
    var cameraAngle = m.area.camera.yaw;

    if (m._health < 0x100) {
        add_tree_leaf_particles(m);
        m.forwardVel = -2.0;
        return set_mario_action(m, ACT_SOFT_BONK, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        add_tree_leaf_particles(m);
        m.faceAngle[1] += 0x8000;
        return set_mario_action(m, ACT_WALL_KICK_AIR, 0);
    }

    if (m.controller.stickY < 8.0) {
        return set_mario_action(m, ACT_HOLDING_POLE, 0);
    }

    marioObj.rawData[oMarioPolePos] += m.controller.stickY / 8.0;
    marioObj.rawData[oMarioPoleYawVel] = 0;
    m.faceAngle[1] = cameraAngle - approach_s32((cameraAngle - m.faceAngle[1]), 0, 0x400, 0x400);

    if (set_pole_position(m, 0.0) == POLE_NONE) {
        sp24 = m.controller.stickY / 4.0 * 0x10000;
        set_mario_anim_with_accel(m, MARIO_ANIM_CLIMB_UP_POLE, sp24);
        add_tree_leaf_particles(m);
        play_climbing_sounds(m, 1);
    }

    return false;
}

/// <pygml?v=1.0&h=a0684499b>
/// @function	act_grab_pole_slow(m)
/// @param		{struct}	m
/// @returns	s32
function act_grab_pole_slow(m) {
    play_sound_if_no_flag(m, SOUND_MARIO_WHOA, MARIO_MARIO_SOUND_PLAYED);

    if (set_pole_position(m, 0.0) == POLE_NONE) {
        set_mario_animation(m, MARIO_ANIM_GRAB_POLE_SHORT);
        if (is_anim_at_end(m)) {
            set_mario_action(m, ACT_HOLDING_POLE, 0);
        }
        add_tree_leaf_particles(m);
    }

    return false;
}

/// <pygml?v=1.0&h=70b39b27e>
/// @function	act_grab_pole_fast(m)
/// @param		{struct}	m
/// @returns	s32
function act_grab_pole_fast(m) {
    var marioObj = m.marioObj;

    play_sound_if_no_flag(m, SOUND_MARIO_WHOA, MARIO_MARIO_SOUND_PLAYED);
    m.faceAngle[1] += marioObj.rawData[oMarioPoleYawVel];
    marioObj.rawData[oMarioPoleYawVel] = marioObj.rawData[oMarioPoleYawVel] * 8 / 10;

    if (set_pole_position(m, 0.0) == POLE_NONE) {
        if (marioObj.rawData[oMarioPoleYawVel] > 0x800) {
            set_mario_animation(m, MARIO_ANIM_GRAB_POLE_SWING_PART1);
        } else {
            set_mario_animation(m, MARIO_ANIM_GRAB_POLE_SWING_PART2);
            if (is_anim_at_end(m) != 0) {
                marioObj.rawData[oMarioPoleYawVel] = 0;
                set_mario_action(m, ACT_HOLDING_POLE, 0);
            }
        }
        add_tree_leaf_particles(m);
    }

    return false;
}

/// <pygml?v=1.0&h=871400d62>
/// @function	act_top_of_pole_transition(m)
/// @param		{struct}	m
/// @returns	s32
function act_top_of_pole_transition(m) {
    var marioObj = m.marioObj;

    marioObj.rawData[oMarioPoleYawVel] = 0;
    if (m.actionArg == 0) {
        set_mario_animation(m, MARIO_ANIM_START_HANDSTAND);
        if (is_anim_at_end(m)) {
            return set_mario_action(m, ACT_TOP_OF_POLE, 0);
        }
    } else {
        set_mario_animation(m, MARIO_ANIM_RETURN_FROM_HANDSTAND);
        if (m.marioObj.header.gfx.unk38.animFrame == 0) {
            return set_mario_action(m, ACT_HOLDING_POLE, 0);
        }
    }

    set_pole_position(m, return_mario_anim_y_translation(m));
    return false;
}

/// <pygml?v=1.0&h=45c758d82>
/// @function	act_top_of_pole(m)
/// @param		{struct}	m
/// @returns	s32
function act_top_of_pole(m) {
    var marioObj = m.marioObj;

    if (m.input & INPUT_A_PRESSED) {
        return set_mario_action(m, ACT_TOP_OF_POLE_JUMP, 0);
    }
    if (m.controller.stickY < -16.0) {
        return set_mario_action(m, ACT_TOP_OF_POLE_TRANSITION, 1);
    }

    m.faceAngle[1] -= m.controller.stickX * 16.0;

    set_mario_animation(m, MARIO_ANIM_HANDSTAND_IDLE);
    set_pole_position(m, return_mario_anim_y_translation(m));
    return false;
}



/// <pygml?v=1.0&h=91c73bf0a>
/// @function	perform_hanging_step(m, nextPos)
/// @param		{struct}	m
/// @param		{Vec3f}		nextPos
/// @returns	s32
function perform_hanging_step(m, nextPos) {
    var unused;
    var _ceil = null;
    var _floor = {};
    var ceilHeight;
    var floorHeight;
    var ceilOffset;

    m.wall = resolve_and_return_wall_collisions(nextPos, 50.0, 50.0);
    floorHeight = find_floor(nextPos[@ 0], nextPos[@ 1], nextPos[@ 2], _floor)
    _floor = _floor._floor;
    ceilHeight = vec3f_find_ceil(nextPos, floorHeight, _ceil);

    if (_floor == null) {
        return HANG_HIT_CEIL_OR_OOB;
    }
    if (_ceil == null) {
        return HANG_LEFT_CEIL;
    }
    if (ceilHeight - floorHeight <= 160.0) {
        return HANG_HIT_CEIL_OR_OOB;
    }
    if (_ceil.type != SURFACE_HANGABLE) {
        return HANG_LEFT_CEIL;
    }

    ceilOffset = ceilHeight - (nextPos[@ 1] + 160.0);
    if (ceilOffset < -30.0) {
        return HANG_HIT_CEIL_OR_OOB;
    }
    if (ceilOffset > 30.0) {
        return HANG_LEFT_CEIL;
    }

    nextPos[@ 1] = m.ceilHeight - 160.0;
    vec3f_copy(m.pos, nextPos);

    m._floor = _floor;
    m.floorHeight = floorHeight;
    m._ceil = _ceil;
    m.ceilHeight = ceilHeight;

    return HANG_NONE;
}

/// <pygml?v=1.0&h=b2623c28c>
/// @function	update_hang_moving(m)
/// @param		{struct}	m
/// @returns	s32
function update_hang_moving(m) {
    var stepResult;
    var nextPos = Vec3f;
    var maxSpeed = 4.0;

    m.forwardVel += 1.0;
    if (m.forwardVel > maxSpeed) {
        m.forwardVel = maxSpeed;
    }

    m.faceAngle[1] =
        m.intendedYaw - approach_s32(yaw_wrap(m.intendedYaw - m.faceAngle[1]), 0, 0x800, 0x800);

    m.slideYaw = m.faceAngle[1];
    m.slideVelX = m.forwardVel * sins(m.faceAngle[1]);
    m.slideVelZ = m.forwardVel * coss(m.faceAngle[1]);

    m.vel[0] = m.slideVelX;
    m.vel[1] = 0.0;
    m.vel[2] = m.slideVelZ;

    nextPos[0] = m.pos[0] - m._ceil.normal.y * m.vel[0];
    nextPos[2] = m.pos[2] - m._ceil.normal.y * m.vel[2];
    nextPos[1] = m.pos[1];

    stepResult = perform_hanging_step(m, nextPos);

    vec3f_copy(m.marioObj.header.gfx.pos, m.pos);
    vec3s_set(m.marioObj.header.gfx.angle, 0, m.faceAngle[1], 0);
    return stepResult;
}
/// <pygml?v=1.0&h=03ecfd5a9>
/// @function	update_hang_stationary(m)
/// @param		{struct}	m
function update_hang_stationary(m) {
    m.forwardVel = 0.0;
    m.slideVelX = 0.0;
    m.slideVelZ = 0.0;

    m.pos[1] = m.ceilHeight - 160.0;
    vec3f_copy(m.vel, gVec3fZero);
    vec3f_copy(m.marioObj.header.gfx.pos, m.pos);
}


/// <pygml?v=1.0&h=532f586ab>
/// @function	act_start_hanging(m)
/// @param		{struct}	m
/// @returns	s32
function act_start_hanging(m) {

    if ((m.input & INPUT_NONZERO_ANALOG) && m.actionTimer >= 31) {
        return set_mario_action(m, ACT_HANGING, 0);
    }

    if (!(m.input & INPUT_A_DOWN)) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_Z_PRESSED) {
        return set_mario_action(m, ACT_GROUND_POUND, 0);
    }

    //! Crash if Mario's referenced ceiling is null (same for other hanging actions)
    if (m._ceil.type != SURFACE_HANGABLE) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    set_mario_animation(m, MARIO_ANIM_HANG_ON_CEILING);
    play_sound_if_no_flag(m, SOUND_ACTION_HANGING_STEP, MARIO_ACTION_SOUND_PLAYED);
    update_hang_stationary(m);

    if (is_anim_at_end(m)) {
        set_mario_action(m, ACT_HANGING, 0);
    }

    return false;
}

/// <pygml?v=1.0&h=b0029e0c9>
/// @function	act_hanging(m)
/// @param		{struct}	m
/// @returns	s32
function act_hanging(m) {
    if (m.input & INPUT_NONZERO_ANALOG) {
        return set_mario_action(m, ACT_HANG_MOVING, m.actionArg);
    }

    if (!(m.input & INPUT_A_DOWN)) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_Z_PRESSED) {
        return set_mario_action(m, ACT_GROUND_POUND, 0);
    }

    if (m._ceil.type != SURFACE_HANGABLE) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.actionArg & 1) {
        set_mario_animation(m, MARIO_ANIM_HANDSTAND_LEFT);
    } else {
        set_mario_animation(m, MARIO_ANIM_HANDSTAND_RIGHT);
    }

    update_hang_stationary(m);

    return false;
}

/// <pygml?v=1.0&h=e7c89ed37>
/// @function	act_hang_moving(m)
/// @param		{struct}	m
/// @returns	s32
function act_hang_moving(m) {
    if (!(m.input & INPUT_A_DOWN)) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_Z_PRESSED) {
        return set_mario_action(m, ACT_GROUND_POUND, 0);
    }

    if (m._ceil.type != SURFACE_HANGABLE) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.actionArg & 1) {
        set_mario_animation(m, MARIO_ANIM_MOVE_ON_WIRE_NET_RIGHT);
    } else {
        set_mario_animation(m, MARIO_ANIM_MOVE_ON_WIRE_NET_LEFT);
    }

    if (m.marioObj.header.gfx.unk38.animFrame == 12) {
        play_sound(SOUND_ACTION_HANGING_STEP, m.marioObj.header.gfx.cameraToObject);
    }

    if (is_anim_past_end(m)) {
        m.actionArg ^= 1;
        if (m.input & INPUT_UNKNOWN_5) {
            return set_mario_action(m, ACT_HANGING, m.actionArg);
        }
    }

    if (update_hang_moving(m) == HANG_LEFT_CEIL) {
        set_mario_action(m, ACT_FREEFALL, 0);
    }

    return false;
}

/// <pygml?v=1.0&h=6ba7951f2>
/// @function	let_go_of_ledge(m)
/// @param		{struct}	m
/// @returns	s32
function let_go_of_ledge(m) {
    var floorHeight;
    var _floor = {};

    m.vel[1] = 0.0;
    m.forwardVel = -8.0;
    m.pos[0] -= 60.0 * sins(m.faceAngle[1]);
    m.pos[2] -= 60.0 * coss(m.faceAngle[1]);

    floorHeight = find_floor(m.pos[0], m.pos[1], m.pos[2], _floor)
    _floor = _floor._floor;
    if (floorHeight < m.pos[1] - 100.0) {
        m.pos[1] -= 100.0;
    } else {
        m.pos[1] = floorHeight;
    }

    return set_mario_action(m, ACT_SOFT_BONK, 0);
}

/// <pygml?v=1.0&h=b78d43cd2>
/// @function	climb_up_ledge(m)
/// @param		{struct}	m
function climb_up_ledge(m) {
    set_mario_animation(m, MARIO_ANIM_IDLE_HEAD_LEFT);
    m.pos[0] += 14.0 * sins(m.faceAngle[1]);
    m.pos[2] += 14.0 * coss(m.faceAngle[1]);
    vec3f_copy(m.marioObj.header.gfx.pos, m.pos);
}

/// <pygml?v=1.0&h=48df46f0f>
/// @function	update_ledge_climb_camera(m)
/// @param		{struct}	m
function update_ledge_climb_camera(m) {
    var sp4;

    if (m.actionTimer < 14) {
        sp4 = m.actionTimer;
    } else {
        sp4 = 14.0;
    }
    m.statusForCamera.pos[0] = m.pos[0] + sp4 * sins(m.faceAngle[1]);
    m.statusForCamera.pos[2] = m.pos[2] + sp4 * coss(m.faceAngle[1]);
    m.statusForCamera.pos[1] = m.pos[1];
    m.actionTimer++;
    m.flags |= MARIO_UNKNOWN_25;
}

/// <pygml?v=1.0&h=922d8642e>
/// @function	update_ledge_climb(m, animation, endAction)
/// @param		{struct}	m
/// @param		{s32}		animation
/// @param		{u32}		endAction
function update_ledge_climb(m, animation, endAction) {
    stop_and_set_height_to_floor(m);

    set_mario_animation(m, animation);
    if (is_anim_at_end(m)) {
        set_mario_action(m, endAction, 0);
        if (endAction == ACT_IDLE) {
            climb_up_ledge(m);
        }
    }
}

/// <pygml?v=1.0&h=8f6818a76>
/// @function	act_ledge_grab(m)
/// @param		{struct}	m
/// @returns	s32
function act_ledge_grab(m) {
    var heightAboveFloor;
    var intendedDYaw = yaw_wrap(m.intendedYaw - m.faceAngle[1]);
    var hasSpaceForMario = (m.ceilHeight - m.floorHeight >= 160.0);

    if (m.actionTimer < 10) {
        m.actionTimer++;
    }

    if (m._floor.normal.y < 0.9063078) {
        return let_go_of_ledge(m);
    }

    if (m.input & (INPUT_Z_PRESSED | INPUT_OFF_FLOOR)) {
        return let_go_of_ledge(m);
    }

    if ((m.input & INPUT_A_PRESSED) && hasSpaceForMario) {
        return set_mario_action(m, ACT_LEDGE_CLIMB_FAST, 0);
    }

    if (m.input & INPUT_UNKNOWN_10) {
        if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_UNK1) {
            m.hurtCounter += (m.flags & MARIO_CAP_ON_HEAD) ? 12 : 18;
        }
        return let_go_of_ledge(m);
    }
	 if (m.actionTimer == 10 && (m.input & INPUT_NONZERO_ANALOG)) {
        if (intendedDYaw >= -0x4000 && intendedDYaw <= 0x4000) {
            if (hasSpaceForMario) {
                return set_mario_action(m, ACT_LEDGE_CLIMB_SLOW_1, 0);
            }
        } else {
            return let_go_of_ledge(m);
        }
    }

    heightAboveFloor = m.pos[1] - find_floor_height_relative_polar(m, -0x8000, 30.0);
    if (hasSpaceForMario && heightAboveFloor < 100.0) {
        return set_mario_action(m, ACT_LEDGE_CLIMB_FAST, 0);
    }

    if (m.actionArg == 0) {
        play_sound_if_no_flag(m, SOUND_MARIO_WHOA, MARIO_MARIO_SOUND_PLAYED);
    }

    stop_and_set_height_to_floor(m);
    set_mario_animation(m, MARIO_ANIM_IDLE_ON_LEDGE);

    return false;
}

/// <pygml?v=1.0&h=f2938339b>
/// @function	act_ledge_climb_slow(m)
/// @param		{struct}	m
/// @returns	s32
function act_ledge_climb_slow(m) {
    if (m.input & INPUT_OFF_FLOOR) {
        return let_go_of_ledge(m);
    }

    if (m.actionTimer >= 28 &&
        (m.input &
            (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED | INPUT_OFF_FLOOR | INPUT_ABOVE_SLIDE))) {
        climb_up_ledge(m);
        return check_common_action_exits(m);
    }

    if (m.actionTimer == 10) {
        play_sound_if_no_flag(m, SOUND_MARIO_EEUH, MARIO_MARIO_SOUND_PLAYED);
    }

    update_ledge_climb(m, MARIO_ANIM_SLOW_LEDGE_GRAB, ACT_IDLE);

    update_ledge_climb_camera(m);
    if (m.marioObj.header.gfx.unk38.animFrame == 17) {
        m.action = ACT_LEDGE_CLIMB_SLOW_2;
    }

    return false;
}

/// <pygml?v=1.0&h=73a09f2b6>
/// @function	act_ledge_climb_down(m)
/// @param		{struct}	m
/// @returns	s32
function act_ledge_climb_down(m) {
    if (m.input & INPUT_OFF_FLOOR) {
        return let_go_of_ledge(m);
    }

    play_sound_if_no_flag(m, SOUND_MARIO_WHOA, MARIO_MARIO_SOUND_PLAYED);

    update_ledge_climb(m, MARIO_ANIM_CLIMB_DOWN_LEDGE, ACT_LEDGE_GRAB);
    m.actionArg = 1;

    return false;
}

/// <pygml?v=1.0&h=ea353d570>
/// @function	act_ledge_climb_fast(m)
/// @param		{struct}	m
/// @returns	s32
function act_ledge_climb_fast(m) {
    if (m.input & INPUT_OFF_FLOOR) {
        return let_go_of_ledge(m);
    }

    play_sound_if_no_flag(m, SOUND_MARIO_UH2, MARIO_MARIO_SOUND_PLAYED);

    update_ledge_climb(m, MARIO_ANIM_FAST_LEDGE_GRAB, ACT_IDLE);

    if (m.marioObj.header.gfx.unk38.animFrame == 8) {
        play_mario_landing_sound(m, SOUND_ACTION_TERRAIN_LANDING);
    }
    update_ledge_climb_camera(m);

    return false;
}

/// <pygml?v=1.0&h=ec44cbeaf>
/// @function	act_grabbed(m)
/// @param		{struct}	m
/// @returns	s32
function act_grabbed(m) {
    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_UNK2) {
        var thrown = (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_UNK6) == 0;

        m.faceAngle[1] = m.usedObj.rawData[oMoveAngleYaw];
        vec3f_copy(m.pos, m.marioObj.header.gfx.pos);

        return set_mario_action(m, (m.forwardVel >= 0.0) ? ACT_THROWN_FORWARD : ACT_THROWN_BACKWARD,
            thrown);
    }

    set_mario_animation(m, MARIO_ANIM_BEING_GRABBED);
    return false;
}

/// <pygml?v=1.0&h=f47bc8bf4>
/// @function	act_in_cannon(m)
/// @param		{struct}	m
/// @returns	s32
function act_in_cannon(m) {
    var marioObj = m.marioObj;
    var startFacePitch = m.faceAngle[0];
    var startFaceYaw = m.faceAngle[1];

    switch (m.actionState) {
        case (0):
            m.marioObj.header.gfx.node.flags &= ~GRAPH_RENDER_ACTIVE;
            m.usedObj.rawData[oInteractStatus] = INT_STATUS_INTERACTED;

            m.statusForCamera.cameraEvent = CAM_EVENT_CANNON;
            m.statusForCamera.usedObj = m.usedObj;

            vec3f_set(m.vel, 0.0, 0.0, 0.0);

            m.pos[0] = m.usedObj.rawData[oPosX];
            m.pos[1] = m.usedObj.rawData[oPosY] + 350.0;
            m.pos[2] = m.usedObj.rawData[oPosZ];

            m.forwardVel = 0.0;

            m.actionState = 1;
            break;

        case (1):
            if (m.usedObj.rawData[oAction] == 1) {
                m.faceAngle[0] = m.usedObj.rawData[oMoveAnglePitch];
                m.faceAngle[1] = m.usedObj.rawData[oMoveAngleYaw];

                marioObj.rawData[oMarioCannonObjectYaw] = m.usedObj.rawData[oMoveAngleYaw];
                marioObj.rawData[oMarioCannonInputYaw] = 0;

                m.actionState = 2;
            }
            break;

        case (2):
            m.faceAngle[0] -= (m.controller.stickY * 10.0);
            marioObj.rawData[oMarioCannonInputYaw] -= (m.controller.stickX * 10.0);

            if (m.faceAngle[0] > 0x38E3) {
                m.faceAngle[0] = 0x38E3;
            }
            if (m.faceAngle[0] < 0) {
                m.faceAngle[0] = 0;
            }

            if (marioObj.rawData[oMarioCannonInputYaw] > 0x4000) {
                marioObj.rawData[oMarioCannonInputYaw] = 0x4000;
            }
            if (marioObj.rawData[oMarioCannonInputYaw] < -0x4000) {
                marioObj.rawData[oMarioCannonInputYaw] = -0x4000;
            }

            m.faceAngle[1] = marioObj.rawData[oMarioCannonObjectYaw] + marioObj.rawData[oMarioCannonInputYaw];
            if (m.input & INPUT_A_PRESSED) {
                m.forwardVel = 100.0 * coss(m.faceAngle[0]);

                m.vel[1] = 100.0 * sins(m.faceAngle[0]);

                m.pos[0] += 120.0 * coss(m.faceAngle[0]) * sins(m.faceAngle[1]);
                m.pos[1] += 120.0 * sins(m.faceAngle[0]);
                m.pos[2] += 120.0 * coss(m.faceAngle[0]) * coss(m.faceAngle[1]);

                play_sound(SOUND_ACTION_FLYING_FAST, m.marioObj.header.gfx.cameraToObject);
                play_sound(SOUND_OBJ_POUNDING_CANNON, m.marioObj.header.gfx.cameraToObject);

                m.marioObj.header.gfx.node.flags |= GRAPH_RENDER_ACTIVE;

                set_mario_action(m, ACT_SHOT_FROM_CANNON, 0);
                m.usedObj.rawData[oAction] = 2;
                return false;
            } else {
                if (m.faceAngle[0] != startFacePitch || m.faceAngle[1] != startFaceYaw) {
                    play_sound(SOUND_MOVING_AIM_CANNON, m.marioObj.header.gfx.cameraToObject);
                }
            }
    }

    vec3f_copy(m.marioObj.header.gfx.pos, m.pos);
    vec3s_set(m.marioObj.header.gfx.angle, 0, m.faceAngle[1], 0);
    set_mario_animation(m, MARIO_ANIM_DIVE);

    return false;
}

/// <pygml?v=1.0&h=96864f7df>
/// @function	act_tornado_twirling(m)
/// @param		{struct}	m
/// @returns	s32
function act_tornado_twirling(m) {
    var _floor = {};
    var nextPos = Vec3f;
    var sinAngleVel;
    var cosAngleVel;
    var floorHeight;
    var marioObj = m.marioObj;
    var usedObj = m.usedObj;
    var prevTwirlYaw = m.twirlYaw;

    var dx = (m.pos[0] - usedObj.rawData[oPosX]) * 0.95;
    var dz = (m.pos[2] - usedObj.rawData[oPosZ]) * 0.95;

    if (m.vel[1] < 60.0) {
        m.vel[1] += 1.0;
    }

	marioObj.rawData[oMarioTornadoPosY] += m.vel[1];
    if (marioObj.rawData[oMarioTornadoPosY] < 0.0) {
        marioObj.rawData[oMarioTornadoPosY] = 0.0;
    }
    if (marioObj.rawData[oMarioTornadoPosY] > usedObj.hitboxHeight) {
        if (m.vel[1] < 20.0) {
            m.vel[1] = 20.0;
        }
        return set_mario_action(m, ACT_TWIRLING, 1);
    }

    if (m.angleVel[1] < 0x3000) {
        m.angleVel[1] += 0x100;
    }

    if (marioObj.rawData[oMarioTornadoYawVel] < 0x1000) {
        marioObj.rawData[oMarioTornadoYawVel] += 0x100;
    }

    m.twirlYaw += m.angleVel[1];

    sinAngleVel = sins(marioObj.rawData[oMarioTornadoYawVel]);
    cosAngleVel = coss(marioObj.rawData[oMarioTornadoYawVel]);

    nextPos[0] = usedObj.rawData[oPosX] + dx * cosAngleVel + dz * sinAngleVel;
    nextPos[2] = usedObj.rawData[oPosZ] - dx * sinAngleVel + dz * cosAngleVel;
    nextPos[1] = usedObj.rawData[oPosY] + marioObj.rawData[oMarioTornadoPosY];

    f32_find_wall_collision(nextPos[0], nextPos[1], nextPos[2], 60.0, 50.0);

    floorHeight = find_floor(nextPos[0], nextPos[1], nextPos[2], _floor)
    _floor = _floor._floor;
    if (_floor != null) {
        m._floor = _floor;
        m.floorHeight = floorHeight;
        vec3f_copy(m.pos, nextPos);
    } else {
        if (nextPos[1] >= m.floorHeight) {
            m.pos[1] = nextPos[1];
        } else {
            m.pos[1] = m.floorHeight;
        }
    }

    m.actionTimer++;

    set_mario_animation(m, (m.actionArg == 0) ? MARIO_ANIM_START_TWIRL : MARIO_ANIM_TWIRL);

    if (is_anim_past_end(m)) {
        m.actionArg = 1;
    }

    // Play sound on angle overflow
    if (prevTwirlYaw > m.twirlYaw) {
        play_sound(SOUND_ACTION_TWIRL, m.marioObj.header.gfx.cameraToObject);
    }

    vec3f_copy(m.marioObj.header.gfx.pos, m.pos);
    vec3s_set(m.marioObj.header.gfx.angle, 0, m.faceAngle[1] + m.twirlYaw, 0);

    return false;
}

/// <pygml?v=1.0&h=8cf1ad65a>
/// @function	check_common_automatic_cancels(m)
/// @param		{struct}	m
/// @returns	s32
function check_common_automatic_cancels(m) {
    if (m.pos[1] < m.waterLevel - 100) {
        return set_water_plunge_action(m);
    }

    return false;
}

/// <pygml?v=1.0&h=861fb5be5>
/// @function	mario_execute_automatic_action(m)
/// @desc		clang-format off
/// @param		{struct}	m
/// @returns	s32
function mario_execute_automatic_action(m) {
    var cancel;

    if (check_common_automatic_cancels(m)) {
        return true;
    }

    m.quicksandDepth = 0.0;


    switch (m.action) {
        case (ACT_HOLDING_POLE):
            cancel = act_holding_pole(m);
            break;
        case (ACT_GRAB_POLE_SLOW):
            cancel = act_grab_pole_slow(m);
            break;
        case (ACT_GRAB_POLE_FAST):
            cancel = act_grab_pole_fast(m);
            break;
        case (ACT_CLIMBING_POLE):
            cancel = act_climbing_pole(m);
            break;
        case (ACT_TOP_OF_POLE_TRANSITION):
            cancel = act_top_of_pole_transition(m);
            break;
        case (ACT_TOP_OF_POLE):
            cancel = act_top_of_pole(m);
            break;
        case (ACT_START_HANGING):
            cancel = act_start_hanging(m);
            break;
        case (ACT_HANGING):
            cancel = act_hanging(m);
            break;
        case (ACT_HANG_MOVING):
            cancel = act_hang_moving(m);
            break;
        case (ACT_LEDGE_GRAB):
            cancel = act_ledge_grab(m);
            break;
        case (ACT_LEDGE_CLIMB_SLOW_1):
            cancel = act_ledge_climb_slow(m);
            break;
        case (ACT_LEDGE_CLIMB_SLOW_2):
            cancel = act_ledge_climb_slow(m);
            break;
        case (ACT_LEDGE_CLIMB_DOWN):
            cancel = act_ledge_climb_down(m);
            break;
        case (ACT_LEDGE_CLIMB_FAST):
            cancel = act_ledge_climb_fast(m);
            break;
        case (ACT_GRABBED):
            cancel = act_grabbed(m);
            break;
        case (ACT_IN_CANNON):
            cancel = act_in_cannon(m);
            break;
        case (ACT_TORNADO_TWIRLING):
            cancel = act_tornado_twirling(m);
            break;
    }
    /* clang-format on */

    return cancel;
}
