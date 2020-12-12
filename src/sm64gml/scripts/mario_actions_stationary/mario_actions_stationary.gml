/// <pygml?v=1.0&h=77da3e762>
/// @function	check_common_idle_cancels(m)
/// @param		{struct}	m
/// @returns	s32
function check_common_idle_cancels(m) {
    mario_drop_held_object(m);
    if (m._floor.normal.y < 0.29237169) {
        return mario_push_off_steep_floor(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_JUMP, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_FIRST_PERSON) {
        return set_mario_action(m, ACT_FIRST_PERSON, 0);
    }

    if (m.input & INPUT_NONZERO_ANALOG) {
        m.faceAngle[1] = m.intendedYaw;
        return set_mario_action(m, ACT_WALKING, 0);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_PUNCHING, 0);
    }

    if (m.input & INPUT_Z_DOWN) {
        return set_mario_action(m, ACT_START_CROUCHING, 0);
    }

    return 0;
}

/// <pygml?v=1.0&h=4f54c56a5>
/// @function	check_common_hold_idle_cancels(m)
/// @param		{struct}	m
/// @returns	s32
function check_common_hold_idle_cancels(m) {
    if (m._floor.normal.y < 0.29237169) {
        return mario_push_off_steep_floor(m, ACT_HOLD_FREEFALL, 0);
    }

    if (m.heldObj.rawData[oInteractionSubtype] & INT_SUBTYPE_DROP_IMMEDIATELY) {
        m.heldObj.rawData[oInteractionSubtype] =
            (m.heldObj.rawData[oInteractionSubtype] & ~INT_SUBTYPE_DROP_IMMEDIATELY);
        return set_mario_action(m, ACT_PLACING_DOWN, 0);
    }

    if (m.input & INPUT_UNKNOWN_10) {
        return drop_and_set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_HOLD_JUMP, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_HOLD_FREEFALL, 0);
    }

    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_HOLD_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_NONZERO_ANALOG) {
        m.faceAngle[1] = m.intendedYaw;
        return set_mario_action(m, ACT_HOLD_WALKING, 0);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_THROWING, 0);
    }

    if (m.input & INPUT_Z_DOWN) {
        return drop_and_set_mario_action(m, ACT_START_CROUCHING, 0);
    }

    return 0;
}

/// <pygml?v=1.0&h=029d5454c>
/// @function	act_idle(m)
/// @param		{struct}	m
/// @returns	s32
function act_idle(m) {
    if (m.quicksandDepth > 30.0) {
        return set_mario_action(m, ACT_IN_QUICKSAND, 0);
    }

    if (m.input & INPUT_IN_POISON_GAS) {
        return set_mario_action(m, ACT_COUGHING, 0);
    }

    if (!(m.actionArg & 1) && m._health < 0x300) {
        return set_mario_action(m, ACT_PANTING, 0);
    }

    if (check_common_idle_cancels(m)) {
        return 1;
    }

    if (m.actionState == 3) {
        if ((m.area.terrainType & TERRAIN_MASK) == TERRAIN_SNOW) {
            return set_mario_action(m, ACT_SHIVERING, 0);
        } else {
            return set_mario_action(m, ACT_START_SLEEPING, 0);
        }
    }

    if (m.actionArg & 1) {
        set_mario_animation(m, MARIO_ANIM_STAND_AGAINST_WALL);
    } else {
        switch (m.actionState) {
            case (0):
                set_mario_animation(m, MARIO_ANIM_IDLE_HEAD_LEFT);
                break;

            case (1):
                set_mario_animation(m, MARIO_ANIM_IDLE_HEAD_RIGHT);
                break;

            case (2):
                set_mario_animation(m, MARIO_ANIM_IDLE_HEAD_CENTER);
                break;
        }

        if (is_anim_at_end(m)) {
            // Fall asleep after 10 head turning cycles.
            // act_start_sleeping is triggered earlier in the function
            // when actionState == 3. This happens when Mario's done
            // turning his head back and forth. However, we do some checks
            // here to make sure that Mario would be able to sleep here,
            // and that he's gone through 10 cycles before sleeping.
            // actionTimer is used to track how many cycles have passed.
            if (++m.actionState == 3) {
                var deltaYOfFloorBehindMario = m.pos[1] - find_floor_height_relative_polar(m, -0x8000, 60.0);
                if (deltaYOfFloorBehindMario < -24.0 || 24.0 < deltaYOfFloorBehindMario || m._floor.flags & SURFACE_FLAG_DYNAMIC) {
                    m.actionState = 0;
                } else {
                    // If Mario hasn't turned his head 10 times yet, stay idle instead of going to sleep.
                    m.actionTimer++;
                    if (m.actionTimer < 10) {
                        m.actionState = 0;
                    }
                }
            }
        }
    }

    stationary_ground_step(m);

    return 0;
}

/// <pygml?v=1.0&h=2526df8f0>
/// @function	play_anim_sound(m, actionState, animFrame, sound)
/// @param		{struct}	m
/// @param		{u32}		actionState
/// @param		{s32}		animFrame
/// @param		{u32}		sound
function play_anim_sound(m, actionState, animFrame, sound) {
    if (m.actionState == actionState && m.marioObj.header.gfx.unk38.animFrame == animFrame) {
        play_sound(sound, m.marioObj.header.gfx.cameraToObject);
    }
}

/// <pygml?v=1.0&h=8aead8596>
/// @function	act_start_sleeping(m)
/// @param		{struct}	m
/// @returns	s32
function act_start_sleeping(m) {
    var sp24;

    if (check_common_idle_cancels(m)) {
        return 1;
    }

    if (m.quicksandDepth > 30.0) {
        return set_mario_action(m, ACT_IN_QUICKSAND, 0);
    }

    if (m.actionState == 4) {
        return set_mario_action(m, ACT_SLEEPING, 0);
    }

    switch (m.actionState) {
        case (0):
            sp24 = set_mario_animation(m, MARIO_ANIM_START_SLEEP_IDLE);
            break;

        case (1):
            sp24 = set_mario_animation(m, MARIO_ANIM_START_SLEEP_SCRATCH);
            break;

        case (2):
            sp24 = set_mario_animation(m, MARIO_ANIM_START_SLEEP_YAWN);
            m.marioBodyState.eyeState = MARIO_EYES_HALF_CLOSED;
            break;

        case (3):
            sp24 = set_mario_animation(m, MARIO_ANIM_START_SLEEP_SITTING);
            m.marioBodyState.eyeState = MARIO_EYES_HALF_CLOSED;
            break;
    }

    play_anim_sound(m, 1, 41, SOUND_ACTION_PAT_BACK);
    play_anim_sound(m, 1, 49, SOUND_ACTION_PAT_BACK);
    play_anim_sound(m, 3, 15, m.terrainSoundAddend + SOUND_ACTION_TERRAIN_BODY_HIT_GROUND);

    if (is_anim_at_end(m)) {
        m.actionState++;
    }

    if (m.actionState == 2) {
        if (sp24 == -1) {
            play_sound(SOUND_MARIO_YAWNING, m.marioObj.header.gfx.cameraToObject);
        }
    }

    if (m.actionState == 1) {
        if (sp24 == -1) {
            play_sound(SOUND_MARIO_IMA_TIRED, m.marioObj.header.gfx.cameraToObject);
        }
    }

    stationary_ground_step(m);
    return 0;
}

/// <pygml?v=1.0&h=9bbda4e74>
/// @function	act_sleeping(m)
/// @desc		?
/// @param		{struct}	m
/// @returns	s32
function act_sleeping(m) {
    var sp24;
    if (m.input & INPUT_UNKNOWN_A41F) {
        return set_mario_action(m, ACT_WAKING_UP, m.actionState);
    }

    if (m.quicksandDepth > 30.0) {
        return set_mario_action(m, ACT_WAKING_UP, m.actionState);
    }

    if (m.pos[1] - find_floor_height_relative_polar(m, -0x8000, 60.0) > 24.0) {
        return set_mario_action(m, ACT_WAKING_UP, m.actionState);
    }

    m.marioBodyState.eyeState = MARIO_EYES_CLOSED;
    stationary_ground_step(m);
    switch (m.actionState) {
        case (0): {
            sp24 = set_mario_animation(m, MARIO_ANIM_SLEEP_IDLE);

            if (sp24 == -1 && !m.actionTimer) {
                lower_background_noise(2);
            }

            if (sp24 == 2) {
                play_sound(SOUND_MARIO_SNORING1, m.marioObj.header.gfx.cameraToObject);
            }

            if (sp24 == 20) {
                play_sound(SOUND_MARIO_SNORING2, m.marioObj.header.gfx.cameraToObject);
            }

            if (is_anim_at_end(m)) {
                m.actionTimer++;
                if (m.actionTimer > 45) {
                    m.actionState++;
                }
            }
            break;
        }
        case (1): {
            if (set_mario_animation(m, MARIO_ANIM_SLEEP_START_LYING) == 18) {
                play_mario_heavy_landing_sound(m, SOUND_ACTION_TERRAIN_BODY_HIT_GROUND);
            }

            if (is_anim_at_end(m)) {
                m.actionState++;
            }
            break;
        }
        case (2): {
            sp24 = set_mario_animation(m, MARIO_ANIM_SLEEP_LYING);
            play_sound_if_no_flag(m, SOUND_MARIO_SNORING3, MARIO_ACTION_SOUND_PLAYED);
            break;
        }
    }
    return 0;
}

/// <pygml?v=1.0&h=0ec6fa0a7>
/// @function	act_waking_up(m)
/// @param		{struct}	m
/// @returns	s32
function act_waking_up(m) {
    if (!m.actionTimer) {
        func_803205E8(SOUND_MARIO_SNORING1, m.marioObj.header.gfx.cameraToObject);
        func_803205E8(SOUND_MARIO_SNORING2, m.marioObj.header.gfx.cameraToObject);
        func_803205E8(SOUND_MARIO_SNORING3, m.marioObj.header.gfx.cameraToObject);
        raise_background_noise(2);
    }

    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    m.actionTimer++;

    if (m.actionTimer > 20) {
        return set_mario_action(m, ACT_IDLE, 0);
    }

    stationary_ground_step(m);

    set_mario_animation(m, !m.actionArg ? MARIO_ANIM_WAKE_FROM_SLEEP : MARIO_ANIM_WAKE_FROM_LYING);

    return 0;
}

/// <pygml?v=1.0&h=1f5016432>
/// @function	act_shivering(m)
/// @param		{struct}	m
/// @returns	s32
function act_shivering(m) {
    var sp24;

    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_UNKNOWN_A41F) {
        m.actionState = 2;
    }

    stationary_ground_step(m);
    switch (m.actionState) {
        case (0): {
            sp24 = set_mario_animation(m, MARIO_ANIM_SHIVERING_WARMING_HAND);
            if (sp24 == 0x31) {
                m.particleFlags |= PARTICLE_BREATH;
                play_sound(SOUND_MARIO_PANTING_COLD, m.marioObj.header.gfx.cameraToObject);
            }
            if (sp24 == 7 || sp24 == 0x51) {
                play_sound(SOUND_ACTION_CLAP_HANDS_COLD, m.marioObj.header.gfx.cameraToObject);
            }
            if (is_anim_past_end(m)) {
                m.actionState = 1;
            }
            break;
        }
        case (1): {
            sp24 = set_mario_animation(m, MARIO_ANIM_SHIVERING);
            if (sp24 == 9 || sp24 == 0x19 || sp24 == 0x2C) {
                play_sound(SOUND_ACTION_CLAP_HANDS_COLD, m.marioObj.header.gfx.cameraToObject);
            }
            break;
        }
        case (2): {
            set_mario_animation(m, MARIO_ANIM_SHIVERING_RETURN_TO_IDLE);
            if (is_anim_past_end(m)) {
                set_mario_action(m, ACT_IDLE, 0);
            }
            break;
        }
    }
    return 0;
}

/// <pygml?v=1.0&h=c2dc4d0d0>
/// @function	act_coughing(m)
/// @param		{struct}	m
/// @returns	s32
function act_coughing(m) {
    var sp1C;

    if (check_common_idle_cancels(m)) {
        return 1;
    }

    stationary_ground_step(m);
    sp1C = set_mario_animation(m, MARIO_ANIM_COUGHING);
    if (sp1C == 0x19 || sp1C == 0x23) {
        play_sound(SOUND_MARIO_COUGHING3, m.marioObj.header.gfx.cameraToObject);
    }

    if (sp1C == 0x32 || sp1C == 0x3A) {
        play_sound(SOUND_MARIO_COUGHING2, m.marioObj.header.gfx.cameraToObject);
    }

    if (sp1C == 0x47 || sp1C == 0x50) {
        play_sound(SOUND_MARIO_COUGHING1, m.marioObj.header.gfx.cameraToObject);
    }

    return 0;
}

/// <pygml?v=1.0&h=1cbb339d8>
/// @function	act_hold_idle(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_idle(m) {
    if ((bhvJumpingBox) == m.heldObj.behavior) {
        return set_mario_action(m, ACT_CRAZY_BOX_BOUNCE, 0);
    }

    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_DROP_OBJECT) {
        return drop_and_set_mario_action(m, ACT_IDLE, 0);
    }

    if (m.quicksandDepth > 30.0) {
        return drop_and_set_mario_action(m, ACT_IN_QUICKSAND, 0);
    }

    if (check_common_hold_idle_cancels(m)) {
        return 1;
    }

    stationary_ground_step(m);
    set_mario_animation(m, MARIO_ANIM_IDLE_WITH_LIGHT_OBJ);
    return 0;
}

/// <pygml?v=1.0&h=f1b6c7746>
/// @function	act_hold_heavy_idle(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_heavy_idle(m) {
    if (m.input & INPUT_UNKNOWN_10) {
        return drop_and_set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return drop_and_set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_ABOVE_SLIDE) {
        return drop_and_set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_NONZERO_ANALOG) {
        return set_mario_action(m, ACT_HOLD_HEAVY_WALKING, 0);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_HEAVY_THROW, 0);
    }

    stationary_ground_step(m);
    set_mario_animation(m, MARIO_ANIM_IDLE_HEAVY_OBJ);
    return 0;
}

/// <pygml?v=1.0&h=93e598279>
/// @function	act_standing_against_wall(m)
/// @param		{struct}	m
/// @returns	s32
function act_standing_against_wall(m) {
    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED | INPUT_OFF_FLOOR | INPUT_ABOVE_SLIDE)) {
        return check_common_action_exits(m);
    }

    if (m.input & INPUT_FIRST_PERSON) {
        return set_mario_action(m, ACT_FIRST_PERSON, 0);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_PUNCHING, 0);
    }

    set_mario_animation(m, MARIO_ANIM_STAND_AGAINST_WALL);
    stationary_ground_step(m);
    return 0;
}

/// <pygml?v=1.0&h=ec4276929>
/// @function	act_in_quicksand(m)
/// @param		{struct}	m
/// @returns	s32
function act_in_quicksand(m) {
    if (m.quicksandDepth < 30.0) {
        return set_mario_action(m, ACT_IDLE, 0);
    }

    if (check_common_idle_cancels(m) != 0) {
        return 1;
    }

    if (m.quicksandDepth > 70.0) {
        set_mario_animation(m, MARIO_ANIM_DYING_IN_QUICKSAND);
    } else {
        set_mario_animation(m, MARIO_ANIM_IDLE_IN_QUICKSAND);
    }

    stationary_ground_step(m);
    return 0;
}

/// <pygml?v=1.0&h=5d02514e6>
/// @function	act_crouching(m)
/// @param		{struct}	m
/// @returns	s32
function act_crouching(m) {
    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_BACKFLIP, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    if (m.input & INPUT_FIRST_PERSON) {
        return set_mario_action(m, ACT_STOP_CROUCHING, 0);
    }

    if (!(m.input & INPUT_Z_DOWN)) {
        return set_mario_action(m, ACT_STOP_CROUCHING, 0);
    }

    if (m.input & INPUT_NONZERO_ANALOG) {
        return set_mario_action(m, ACT_START_CRAWLING, 0);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_PUNCHING, 9);
    }

    stationary_ground_step(m);
    set_mario_animation(m, MARIO_ANIM_CROUCHING);
    return 0;
}

/// <pygml?v=1.0&h=d80eb9435>
/// @function	act_panting(m)
/// @param		{struct}	m
/// @returns	s32
function act_panting(m) {
    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m._health >= 0x500) {
        return set_mario_action(m, ACT_IDLE, 0);
    }

    if (check_common_idle_cancels(m)) {
        return 1;
    }

    if (set_mario_animation(m, MARIO_ANIM_WALK_PANTING) == 1) {
        play_sound(SOUND_MARIO_PANTING + ((gAudioRandom % 3) << 0x10),
            m.marioObj.header.gfx.cameraToObject);
    }

    stationary_ground_step(m);
    m.marioBodyState.eyeState = MARIO_EYES_HALF_CLOSED;
    return 0;
}

/// <pygml?v=1.0&h=ecd779d46>
/// @function	act_hold_panting_unused(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_panting_unused(m) {
    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_DROP_OBJECT) {
        return drop_and_set_mario_action(m, ACT_PANTING, 0);
    }

    if (m.input & INPUT_UNKNOWN_10) {
        return drop_and_set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m._health >= 0x500) {
        return set_mario_action(m, ACT_HOLD_IDLE, 0);
    }

    if (check_common_hold_idle_cancels(m) != 0) {
        return 1;
    }

    set_mario_animation(m, MARIO_ANIM_WALK_PANTING);
    stationary_ground_step(m);
    m.marioBodyState.eyeState = MARIO_EYES_HALF_CLOSED;
    return 0;
}

/// <pygml?v=1.0&h=ee3ea1935>
/// @function	stopping_step(m, animID, action)
/// @param		{struct}	m
/// @param		{s32}		animID
/// @param		{u32}		action
function stopping_step(m, animID, action) {
    stationary_ground_step(m);
    set_mario_animation(m, animID);
    if (is_anim_at_end(m) != 0) {
        set_mario_action(m, action, 0);
    }
}

/// <pygml?v=1.0&h=78d221f88>
/// @function	act_braking_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_braking_stop(m) {
    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_PUNCHING, 0);
    }

    if (!(m.input & INPUT_FIRST_PERSON) &&
        m.input & (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED | INPUT_OFF_FLOOR | INPUT_ABOVE_SLIDE)) {
        return check_common_action_exits(m);
    }

    stopping_step(m, MARIO_ANIM_STOP_SKID, ACT_IDLE);
    return 0;
}

/// <pygml?v=1.0&h=fceaa6f1e>
/// @function	act_butt_slide_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_butt_slide_stop(m) {
    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED | INPUT_OFF_FLOOR | INPUT_ABOVE_SLIDE)) {
        return check_common_action_exits(m);
    }

    stopping_step(m, MARIO_ANIM_STOP_SLIDE, ACT_IDLE);
    if (m.marioObj.header.gfx.unk38.animFrame == 6) {
        play_mario_landing_sound(m, SOUND_ACTION_TERRAIN_LANDING);
    }

    return 0;
}

/// <pygml?v=1.0&h=c139e2436>
/// @function	act_hold_butt_slide_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_butt_slide_stop(m) {
    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_DROP_OBJECT) {
        return drop_and_set_mario_action(m, ACT_IDLE, 0);
    }

    if (m.input & INPUT_UNKNOWN_10) {
        return drop_and_set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED | INPUT_OFF_FLOOR | INPUT_ABOVE_SLIDE)) {
        return check_common_hold_action_exits(m);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_THROWING, 0);
    }

    stopping_step(m, MARIO_ANIM_STAND_UP_FROM_SLIDING_WITH_LIGHT_OBJ, ACT_HOLD_IDLE);
    return 0;
}

/// <pygml?v=1.0&h=5758e1726>
/// @function	act_slide_kick_slide_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_slide_kick_slide_stop(m) {
    if (m.input & INPUT_UNKNOWN_10) {
        return drop_and_set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return drop_and_set_mario_action(m, ACT_FREEFALL, 0);
    }

    stopping_step(m, MARIO_ANIM_CROUCH_FROM_SLIDE_KICK, ACT_CROUCHING);
    return 0;
}

/// <pygml?v=1.0&h=8f5da192e>
/// @function	act_start_crouching(m)
/// @param		{struct}	m
/// @returns	s32
function act_start_crouching(m) {
    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_BACKFLIP, 0);
    }

    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    stationary_ground_step(m);
    set_mario_animation(m, MARIO_ANIM_START_CROUCHING);
    if (is_anim_past_end(m)) {
        set_mario_action(m, ACT_CROUCHING, 0);
    }
    return 0;
}

/// <pygml?v=1.0&h=b96f06fce>
/// @function	act_stop_crouching(m)
/// @param		{struct}	m
/// @returns	s32
function act_stop_crouching(m) {
    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        return set_jumping_action(m, ACT_BACKFLIP, 0);
    }

    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    stationary_ground_step(m);
    set_mario_animation(m, MARIO_ANIM_STOP_CROUCHING);
    if (is_anim_past_end(m)) {
        set_mario_action(m, ACT_IDLE, 0);
    }
    return 0;
}

/// <pygml?v=1.0&h=e38a79d60>
/// @function	act_start_crawling(m)
/// @param		{struct}	m
/// @returns	s32
function act_start_crawling(m) {
    if (m.input & INPUT_FIRST_PERSON) {
        return set_mario_action(m, ACT_STOP_CROUCHING, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    stationary_ground_step(m);
    set_mario_animation(m, MARIO_ANIM_START_CRAWLING);
    if (is_anim_past_end(m)) {
        set_mario_action(m, ACT_CRAWLING, 0);
    }

    return 0;
}

/// <pygml?v=1.0&h=4bfcef00f>
/// @function	act_stop_crawling(m)
/// @param		{struct}	m
/// @returns	s32
function act_stop_crawling(m) {
    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    stationary_ground_step(m);
    set_mario_animation(m, MARIO_ANIM_STOP_CRAWLING);
    if (is_anim_past_end(m)) {
        set_mario_action(m, ACT_CROUCHING, 0);
    }
    return 0;
}

/// <pygml?v=1.0&h=d16eb4982>
/// @function	act_shockwave_bounce(m)
/// @param		{struct}	m
/// @returns	s32
function act_shockwave_bounce(m) {
    var sp1E;
    var sp18;

    if (m.marioObj.rawData[oInteractStatus] & 0x10) {
        return hurt_and_set_mario_action(m, ACT_SHOCKED, 0, 4);
    }

    if (m.actionTimer == 0) {
        if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_UNK1) {
            return hurt_and_set_mario_action(m, ACT_BACKWARD_GROUND_KB, 0, 0xc);
        }
    }

    if (++m.actionTimer == 0x30) {
        return set_mario_action(m, ACT_IDLE, 0);
    }

    sp1E = (m.actionTimer % 0x10) << 0xC;
    sp18 = (((6 - m.actionTimer / 8) * 8.0) + 4.0);
    mario_set_forward_vel(m, 0);
    vec3f_set(m.vel, 0.0, 0.0, 0.0);
    if (sins(sp1E) >= 0.0) {
        m.pos[1] = sins(sp1E) * sp18 + m.floorHeight;
    } else {
        m.pos[1] = m.floorHeight - sins(sp1E) * sp18;
    }

    vec3f_copy(m.marioObj.header.gfx.pos, m.pos);
    vec3s_set(m.marioObj.header.gfx.angle, 0, m.faceAngle[1], 0);
    set_mario_animation(m, MARIO_ANIM_A_POSE);
    return 0;
}

/// <pygml?v=1.0&h=7d7046206>
/// @function	landing_step(m, arg1, action)
/// @param		{struct}	m
/// @param		{s32}		arg1
/// @param		{u32}		action
/// @returns	s32
function landing_step(m, arg1, action) {
    stationary_ground_step(m);
    set_mario_animation(m, arg1);
    if (is_anim_at_end(m)) {
        return set_mario_action(m, action, 0);
    }
    return 0;
}

/// <pygml?v=1.0&h=38bcf9e18>
/// @function	check_common_landing_cancels(m, action)
/// @param		{struct}	m
/// @param		{u32}		action
/// @returns	s32
function check_common_landing_cancels(m, action) {
    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_FIRST_PERSON) {
        return set_mario_action(m, ACT_IDLE, 0);
    }

    if (m.input & INPUT_A_PRESSED) {
        if (!action) {
            return set_jump_from_landing(m);
        } else {
            return set_jumping_action(m, action, 0);
        }
    }

    if (m.input & (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED | INPUT_OFF_FLOOR | INPUT_ABOVE_SLIDE)) {
        return check_common_action_exits(m);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_PUNCHING, 0);
    }

    return 0;
}

/// <pygml?v=1.0&h=4cf47e5ac>
/// @function	act_jump_land_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_jump_land_stop(m) {
    if (check_common_landing_cancels(m, 0)) {
        return 1;
    }

    landing_step(m, MARIO_ANIM_LAND_FROM_SINGLE_JUMP, ACT_IDLE);
    return 0;
}

/// <pygml?v=1.0&h=ac375ab6b>
/// @function	act_double_jump_land_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_double_jump_land_stop(m) {
    if (check_common_landing_cancels(m, 0)) {
        return 1;
    }

    landing_step(m, MARIO_ANIM_LAND_FROM_DOUBLE_JUMP, ACT_IDLE);
    return 0;
}

/// <pygml?v=1.0&h=8bc8c226b>
/// @function	act_side_flip_land_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_side_flip_land_stop(m) {
    if (check_common_landing_cancels(m, 0)) {
        return 1;
    }

    landing_step(m, MARIO_ANIM_SLIDEFLIP_LAND, ACT_IDLE);
    m.marioObj.header.gfx.angle[1] += 0x8000;
    return 0;
}

/// <pygml?v=1.0&h=f913d9afc>
/// @function	act_freefall_land_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_freefall_land_stop(m) {
    if (check_common_landing_cancels(m, 0)) {
        return 1;
    }

    landing_step(m, MARIO_ANIM_GENERAL_LAND, ACT_IDLE);
    return 0;
}

/// <pygml?v=1.0&h=65aa7c7c2>
/// @function	act_triple_jump_land_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_triple_jump_land_stop(m) {
    if (check_common_landing_cancels(m, ACT_JUMP)) {
        return 1;
    }

    landing_step(m, MARIO_ANIM_TRIPLE_JUMP_LAND, ACT_IDLE);
    return 0;
}

/// <pygml?v=1.0&h=00f009c2d>
/// @function	act_backflip_land_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_backflip_land_stop(m) {
    if (!(m.input & INPUT_Z_DOWN) || m.marioObj.header.gfx.unk38.animFrame >= 6) {
        m.input &= -3;
    }

    if (check_common_landing_cancels(m, ACT_BACKFLIP)) {
        return 1;
    }

    landing_step(m, MARIO_ANIM_TRIPLE_JUMP_LAND, ACT_IDLE);
    return 0;
}

/// <pygml?v=1.0&h=08db7a5b2>
/// @function	act_lava_boost_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_lava_boost_land(m) {
    m.input &= -0x2011;

    if (check_common_landing_cancels(m, 0)) {
        return 1;
    }

    landing_step(m, MARIO_ANIM_STAND_UP_FROM_LAVA_BOOST, ACT_IDLE);
    return 0;
}

/// <pygml?v=1.0&h=b1739f277>
/// @function	act_long_jump_land_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_long_jump_land_stop(m) {
    m.input &= -0x2001;
    if (check_common_landing_cancels(m, ACT_JUMP)) {
        return 1;
    }

    landing_step(m,
        !m.marioObj.rawData[oMarioLongJumpIsSlow] ? MARIO_ANIM_CROUCH_FROM_FAST_LONGJUMP :
        MARIO_ANIM_CROUCH_FROM_SLOW_LONGJUMP,
        ACT_CROUCHING);
    return 0;
}
/// <pygml?v=1.0&h=19da9ae32>
/// @function	act_hold_jump_land_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_jump_land_stop(m) {
    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_DROP_OBJECT) {
        return drop_and_set_mario_action(m, ACT_IDLE, 0);
    }

    if (m.input & INPUT_UNKNOWN_10) {
        return drop_and_set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED | INPUT_OFF_FLOOR | INPUT_ABOVE_SLIDE)) {
        return check_common_hold_action_exits(m);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_THROWING, 0);
    }

    landing_step(m, MARIO_ANIM_JUMP_LAND_WITH_LIGHT_OBJ, ACT_HOLD_IDLE);
    return 0;
}


/// <pygml?v=1.0&h=d376fce75>
/// @function	act_hold_freefall_land_stop(m)
/// @param		{struct}	m
/// @returns	s32
function act_hold_freefall_land_stop(m) {
    if (m.marioObj.rawData[oInteractStatus] & INT_STATUS_MARIO_DROP_OBJECT) {
        return drop_and_set_mario_action(m, ACT_IDLE, 0);
    }

    if (m.input & INPUT_UNKNOWN_10) {
        return drop_and_set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED | INPUT_OFF_FLOOR | INPUT_ABOVE_SLIDE)) {
        return check_common_hold_action_exits(m);
    }

    if (m.input & INPUT_B_PRESSED) {
        return set_mario_action(m, ACT_THROWING, 0);
    }
    landing_step(m, MARIO_ANIM_FALL_LAND_WITH_LIGHT_OBJ, ACT_HOLD_IDLE);
    return 0;
}

/// <pygml?v=1.0&h=74cf9e9c2>
/// @function	act_air_throw_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_air_throw_land(m) {
    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (++m.actionTimer == 4) {
        mario_throw_held_object(m);
    }

    landing_step(m, MARIO_ANIM_THROW_LIGHT_OBJECT, ACT_IDLE);
    return 0;
}

/// <pygml?v=1.0&h=52ab15d75>
/// @function	act_twirl_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_twirl_land(m) {
    m.actionState = 1;
    if (m.input & INPUT_UNKNOWN_10) {
        return set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    stationary_ground_step(m);
    set_mario_animation(m, MARIO_ANIM_TWIRL_LAND);
    if (m.angleVel[1] > 0) {
        m.angleVel[1] -= 0x400;
        if (m.angleVel[1] < 0) {
            m.angleVel[1] = 0;
        }

        m.twirlYaw += m.angleVel[1];
    }

    m.marioObj.header.gfx.angle[1] += m.twirlYaw;
    if (is_anim_at_end(m)) {
        if (m.angleVel[1] == 0) {
            m.faceAngle[1] += m.twirlYaw;
            set_mario_action(m, ACT_IDLE, 0);
        }
    }

    return 0;
}

/// <pygml?v=1.0&h=da6c56f9d>
/// @function	act_ground_pound_land(m)
/// @param		{struct}	m
/// @returns	s32
function act_ground_pound_land(m) {
    m.actionState = 1;
    if (m.input & INPUT_UNKNOWN_10) {
        return drop_and_set_mario_action(m, ACT_SHOCKWAVE_BOUNCE, 0);
    }

    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }

    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BUTT_SLIDE, 0);
    }

    landing_step(m, MARIO_ANIM_GROUND_POUND_LANDING, ACT_BUTT_SLIDE_STOP);
    return 0;
}

/// <pygml?v=1.0&h=2df673c05>
/// @function	act_first_person(m)
/// @param		{struct}	m
/// @returns	s32
function act_first_person(m) {
    var sp1C;
    var sp1A;
    var sp18;

    sp1C = 0 != (m.input & (INPUT_UNKNOWN_10 | 0xC));
    if (m.actionState == 0) {
        lower_background_noise(2);
        set_camera_mode(m.area.camera, CAMERA_MODE_C_UP, 0x10);
        m.actionState = 1;
    } else {
        if (!(m.input & INPUT_FIRST_PERSON) || sp1C) {
            raise_background_noise(2);
            // Go back to the last camera mode
            set_camera_mode(m.area.camera, -1, 1);
            return set_mario_action(m, ACT_IDLE, 0);
        }
    }

    if (m._floor.type == SURFACE_LOOK_UP_WARP) {
        if (save_file_get_total_star_count(gCurrSaveFileNum - 1, 0, 0x18) >= 10) {
            sp1A = m.statusForCamera.headRotation[0];
            sp18 = ((m.statusForCamera.headRotation[1] * 4) / 3) + m.faceAngle[1];
            if (sp1A == -0x1800) {
                if (sp18 < -0x6FFF || sp18 >= 0x7000) {
                    level_trigger_warp(m, 1);
                }
            }
        }
    }

    stationary_ground_step(m);
    set_mario_animation(m, MARIO_ANIM_FIRST_PERSON);
    return 0;
}

/// <pygml?v=1.0&h=1af33e5fd>
/// @function	check_common_stationary_cancels(m)
/// @param		{struct}	m
/// @returns	s32
function check_common_stationary_cancels(m) {
    if (m.pos[1] < m.waterLevel - 100) {
        if (m.action == ACT_SPAWN_SPIN_LANDING) {
            load_level_init_text(0);
        }
        update_mario_sound_and_camera(m);
        return set_water_plunge_action(m);
    }

    if (m.input & INPUT_SQUISHED) {
        update_mario_sound_and_camera(m);
        return drop_and_set_mario_action(m, ACT_SQUISHED, 0);
    }

    if (m.action != 0x0002020E) {
        if (m._health < 0x100) {
            update_mario_sound_and_camera(m);
            return drop_and_set_mario_action(m, ACT_STANDING_DEATH, 0);
        }
    }
    return 0;
}

/// <pygml?v=1.0&h=c9f701014>
/// @function	mario_execute_stationary_action(m)
/// @desc		clang-format off
/// @param		{struct}	m
/// @returns	s32
function mario_execute_stationary_action(m) {
    var cancel;
	
    if (check_common_stationary_cancels(m)) {
        return 1;
    }

    if (mario_update_quicksand(m, 0.5)) {
        return 1;
    }

    switch (m.action) {
        case ACT_IDLE:                    cancel = act_idle(m);                             break;
        case ACT_START_SLEEPING:          cancel = act_start_sleeping(m);                   break;
        case ACT_SLEEPING:                cancel = act_sleeping(m);                         break;
        case ACT_WAKING_UP:               cancel = act_waking_up(m);                        break;
        case ACT_PANTING:                 cancel = act_panting(m);                          break;
        case ACT_HOLD_PANTING_UNUSED:     cancel = act_hold_panting_unused(m);              break;
        case ACT_HOLD_IDLE:               cancel = act_hold_idle(m);                        break;
        case ACT_HOLD_HEAVY_IDLE:         cancel = act_hold_heavy_idle(m);                  break;
        case ACT_IN_QUICKSAND:            cancel = act_in_quicksand(m);                     break;
        case ACT_STANDING_AGAINST_WALL:   cancel = act_standing_against_wall(m);            break;
        case ACT_COUGHING:                cancel = act_coughing(m);                         break;
        case ACT_SHIVERING:               cancel = act_shivering(m);                        break;
        case ACT_CROUCHING:               cancel = act_crouching(m);                        break;
        case ACT_START_CROUCHING:         cancel = act_start_crouching(m);                  break;
        case ACT_STOP_CROUCHING:          cancel = act_stop_crouching(m);                   break;
        case ACT_START_CRAWLING:          cancel = act_start_crawling(m);                   break;
        case ACT_STOP_CRAWLING:           cancel = act_stop_crawling(m);                    break;
        case ACT_SLIDE_KICK_SLIDE_STOP:   cancel = act_slide_kick_slide_stop(m);            break;
        case ACT_SHOCKWAVE_BOUNCE:        cancel = act_shockwave_bounce(m);                 break;
        case ACT_FIRST_PERSON:            cancel = act_first_person(m);                     break;
        case ACT_JUMP_LAND_STOP:          cancel = act_jump_land_stop(m);                   break;
        case ACT_DOUBLE_JUMP_LAND_STOP:   cancel = act_double_jump_land_stop(m);            break;
        case ACT_FREEFALL_LAND_STOP:      cancel = act_freefall_land_stop(m);               break;
        case ACT_SIDE_FLIP_LAND_STOP:     cancel = act_side_flip_land_stop(m);              break;
        case ACT_HOLD_JUMP_LAND_STOP:     cancel = act_hold_jump_land_stop(m);              break;
        case ACT_HOLD_FREEFALL_LAND_STOP: cancel = act_hold_freefall_land_stop(m);          break;
        case ACT_AIR_THROW_LAND:          cancel = act_air_throw_land(m);                   break;
        case ACT_LAVA_BOOST_LAND:         cancel = act_lava_boost_land(m);                  break;
        case ACT_TWIRL_LAND:              cancel = act_twirl_land(m);                       break;
        case ACT_TRIPLE_JUMP_LAND_STOP:   cancel = act_triple_jump_land_stop(m);            break;
        case ACT_BACKFLIP_LAND_STOP:      cancel = act_backflip_land_stop(m);               break;
        case ACT_LONG_JUMP_LAND_STOP:     cancel = act_long_jump_land_stop(m);              break;
        case ACT_GROUND_POUND_LAND:       cancel = act_ground_pound_land(m);                break;
        case ACT_BRAKING_STOP:            cancel = act_braking_stop(m);                     break;
        case ACT_BUTT_SLIDE_STOP:         cancel = act_butt_slide_stop(m);                  break;
        case ACT_HOLD_BUTT_SLIDE_STOP:    cancel = act_hold_butt_slide_stop(m);             break;
    }
    /* clang-format on */

    if (!cancel && (m.input & INPUT_IN_WATER)) {
        m.particleFlags |= PARTICLE_IDLE_WATER_WAVE;
    }

    return cancel;
}
