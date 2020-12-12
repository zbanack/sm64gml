function mario_actions_cutscene_macros_init() {

globalvar sIntroWarpPipeObj,
sEndPeachObj,	
sEndRightToadObj,
sEndLeftToadObj,
sEndJumboStarObj,
sEndPeachAnimation,
sEndToadAnims,
sEndCutsceneVp,
sDispCreditsEntry,
D_8032CBE4,	
D_8032CBE8,
D_8032CBEC,
sStarsNeededForDialog;

sIntroWarpPipeObj		= null;
sEndPeachObj			= null;
sEndRightToadObj		= null;
sEndLeftToadObj			= null;
sEndJumboStarObj		= null;
sEndPeachAnimation		= null;
sEndToadAnims			= array_create(2);

sEndCutsceneVp			= [[[640, 480, 511, 0 ], [ 640, 480, 511, 0]]];

sDispCreditsEntry		= null;
D_8032CBE4				= 0;
D_8032CBE8				= 0;
D_8032CBEC				= [2, 3, 2, 1, 2, 3, 2];

sStarsNeededForDialog	= [1, 3, 8, 30, 50, 70];

globalvar sJumboStarKeyframes;
sJumboStarKeyframes = [
    [20, 0, 678, -2916 ],      [30, 0, 680, -3500 ],      [40, 1000, 700, -4000 ],
    [50, 2500, 750, -3500 ],   [50, 3500, 800, -2000 ],   [50, 4000, 850, 0 ],
    [50, 3500, 900, 2000 ],    [50, 2000, 950, 3500 ],    [50, 0, 1000, 4000 ],
    [50, -2000, 1050, 3500 ],  [50, -3500, 1100, 2000 ],  [50, -4000, 1150, 0 ],
    [50, -3500, 1200, -2000 ], [50, -2000, 1250, -3500 ], [50, 0, 1300, -4000 ],
    [50, 2000, 1350, -3500 ],  [50, 3500, 1400, -2000 ],  [50, 4000, 1450, 0 ],
    [50, 3500, 1500, 2000 ],   [50, 2000, 1600, 3500 ],   [50, 0, 1700, 4000 ],
    [50, -2000, 1800, 3500 ],  [50, -3500, 1900, 2000 ],  [30, -4000, 2000, 0 ],
    [0, -3500, 2100, -2000 ],  [0, -2000, 2200, -3500 ],  [0, 0, 2300, -4000 ],	
];

boot("mario_actions_cutscene_macros_init");
	
}
/// <pygml?v=1.0&h=58ba963cf>
/// @function	act_fall_after_star_grab(m)
/// @param		{struct}	m
/// @returns	s32
function act_fall_after_star_grab(m) {
    if (m.pos[1] < m.waterLevel - 130) {
        play_sound(SOUND_ACTION_UNKNOWN430, m.marioObj.header.gfx.cameraToObject);
        m.particleFlags |= PARTICLE_WATER_SPLASH;
        return set_mario_action(m, ACT_STAR_DANCE_WATER, m.actionArg);
    }
    if (perform_air_step(m, 1) == AIR_STEP_LANDED) {
        play_mario_landing_sound(m, SOUND_ACTION_TERRAIN_LANDING);
        set_mario_action(m, m.actionArg & 1 ? ACT_STAR_DANCE_NO_EXIT : ACT_STAR_DANCE_EXIT,
            m.actionArg);
    }
    set_mario_animation(m, MARIO_ANIM_GENERAL_FALL);
    return false;
}


/// <pygml?v=1.0&h=5c2acc6c2>
/// @function	general_star_dance_handler(m, isInWater)
/// @param		{struct}	m
/// @param		{s32}		isInWater
function general_star_dance_handler(m, isInWater) {
    var dialogID;
    if (m.actionState == 0) {
		++m.actionTimer;
        switch (m.actionTimer) {
            case (1):
                spawn_object(m.marioObj, MODEL_STAR, Object1.bhvCelebrationStar);
                disable_background_sound();
                if (m.actionArg & 1) {
                    play_course_clear();
                } else {
                    if (gCurrLevelNum == LEVEL_BOWSER_1 || gCurrLevelNum == LEVEL_BOWSER_2) {
                        play_music(SEQ_PLAYER_ENV, SEQUENCE_ARGS(15, SEQ_EVENT_CUTSCENE_COLLECT_KEY), 0);
                    } else {
                        play_music(SEQ_PLAYER_ENV, SEQUENCE_ARGS(15, SEQ_EVENT_CUTSCENE_COLLECT_STAR), 0);
                    }
                }
                break;

            case (42):
                play_sound(SOUND_MARIO_HERE_WE_GO, m.marioObj.header.gfx.cameraToObject);
                break;

            case (80):
                if ((m.actionArg & 1) == 0) {
                    level_trigger_warp(m, WARP_OP_STAR_EXIT);
                } else {
                    enable_time_stop();
                    //create_dialog_box_with_response(gLastCompletedStarNum == 7 ? DIALOG_013 : DIALOG_014);
					// @z
                    m.actionState = 1;
                }
                break;
        }
    } else if (m.actionState == 1 && gDialogResponse) {
        if (gDialogResponse == 1) {
            //save_file_do_save(gCurrSaveFileNum - 1); // @z
        }
        m.actionState = 2;
    } else if (m.actionState == 2 && is_anim_at_end(m)) {
        disable_time_stop();
        enable_background_sound();
        dialogID = 0; // @z get_star_collection_dialog(m);
        if (dialogID != 0) {
            // look up for dialog
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, dialogID);
        } else {
            set_mario_action(m, isInWater ? ACT_WATER_IDLE : ACT_IDLE, 0);
        }
    }
}


/// <pygml?v=1.0&h=016d629cf>
/// @function	act_star_dance(m)
/// @param		{struct}	m
/// @returns	s32
function act_star_dance(m) {
    m.faceAngle[1] = m.area.camera.yaw;
    set_mario_animation(m, m.actionState == 2 ? MARIO_ANIM_RETURN_FROM_STAR_DANCE :
        MARIO_ANIM_STAR_DANCE);
    general_star_dance_handler(m, 0);
    if (m.actionState != 2 && m.actionTimer >= 40) {
        m.marioBodyState.handState = MARIO_HAND_PEACE_SIGN;
    }
	//if (m.actionTimer == 40) {
	//	show_message("yahoo");	
	//}
    stop_and_set_height_to_floor(m);
    return false;
}


/// <pygml?v=1.0&h=5ef876c21>
/// @function	check_for_instant_quicksand(m)
/// @param		{struct}	m
/// @returns	s32
function check_for_instant_quicksand(m) {
    if (m._floor.type == SURFACE_INSTANT_QUICKSAND && m.action & ACT_FLAG_INVULNERABLE &&
        m.action != ACT_QUICKSAND_DEATH) {
        update_mario_sound_and_camera(m);
        return drop_and_set_mario_action(m, ACT_QUICKSAND_DEATH, 0);
    }
    return false;
}

/// <pygml?v=1.0&h=7e00301e3>
/// @function	common_death_handler(m, animation, frameToDeathWarp)
/// @param		{struct}	m
/// @param		{s32}		animation
/// @param		{s32}		frameToDeathWarp
/// @returns	s32
function common_death_handler(m, animation, frameToDeathWarp) {
    var animFrame = set_mario_animation(m, animation);
    if (animFrame == frameToDeathWarp) {
        level_trigger_warp(m, WARP_OP_DEATH);
    }
    //m.marioBodyState.eyeState = MARIO_EYES_DEAD; // @z fixme
    stop_and_set_height_to_floor(m);
    return animFrame;
}


/// <pygml?v=1.0&h=74e5d0d6c>
/// @function	act_standing_death(m)
/// @param		{struct}	m
/// @returns	s32
function act_standing_death(m) {
    if (m.input & INPUT_IN_POISON_GAS) {
        return set_mario_action(m, ACT_SUFFOCATION, 0);
    }

    play_sound_if_no_flag(m, SOUND_MARIO_DYING, MARIO_ACTION_SOUND_PLAYED);
    common_death_handler(m, MARIO_ANIM_DYING_FALL_OVER, 80);
	var animInfo = m.marioObj.header.gfx.unk38;
    if (animInfo.animFrame == 77) {
        play_mario_landing_sound(m, SOUND_ACTION_TERRAIN_BODY_HIT_GROUND);
    }
    return false;
}

/// <pygml?v=1.0&h=60da4ef22>
/// @function	act_squished(m)
/// @param		{struct}	m
/// @returns	s32
function act_squished(m) {
    var pad;
    var squishAmount;
    var spaceUnderCeil;
    var surfAngle;
    var underSteepSurf = false; // seems to be responsible for setting velocity?

    if ((spaceUnderCeil = m.ceilHeight - m.floorHeight) < 0) {
        spaceUnderCeil = 0;
	}

    switch (m.actionState) {
        case (0):
            if (spaceUnderCeil > 160.0) {
                m.squishTimer = 0;
                return set_mario_action(m, ACT_IDLE, 0);
            }

            m.squishTimer = 0xFF;

            if (spaceUnderCeil >= 10.1) {
                // Mario becomes a pancake
                squishAmount = spaceUnderCeil / 160.0;
                vec3f_set(m.marioObj.header.gfx.scale, 2.0 - squishAmount, squishAmount,
                    2.0 - squishAmount);
            } else {
                if (!(m.flags & MARIO_METAL_CAP) && m.invincTimer == 0) {
                    // cap on: 3 units; cap off: 4.5 units
                    m.hurtCounter += m.flags & MARIO_CAP_ON_HEAD ? 12 : 18;
                    play_sound_if_no_flag(m, SOUND_MARIO_ATTACKED, MARIO_MARIO_SOUND_PLAYED);
                }

                // Both of the 1.8's are really floats, but one of them has to
                // be written as a double for this to match on -O2.
                vec3f_set(m.marioObj.header.gfx.scale, 1.8, 0.05, 1.8);
                m.actionState = 1;
            }
            break;
        case (1):
            if (spaceUnderCeil >= 30.0) {
                m.actionState = 2;
            }
            break;
        case (2):
            m.actionTimer++;
            if (m.actionTimer >= 15) {
                // 1 unit of _health
                if (m._health < 0x0100) {
                    level_trigger_warp(m, WARP_OP_DEATH);
                    // woosh, he's gone!
                    set_mario_action(m, ACT_DISAPPEARED, 0);
                } else if (m.hurtCounter == 0) {
                    // un-squish animation
                    m.squishTimer = 30;
                    set_mario_action(m, ACT_IDLE, 0);
                }
            }
            break;
    }

    // steep _floor
    if (m._floor != null && m._floor.normal.y < 0.5) {
        surfAngle = atan2s(m._floor.normal.z, m._floor.normal.x);
        underSteepSurf = true;
    }
    // steep ceiling
    if (m._ceil != null && -0.5 < m._ceil.normal.y) {
        surfAngle = atan2s(m._ceil.normal.z, m._ceil.normal.x);
        underSteepSurf = true;
    }

    if (underSteepSurf) {
        m.vel[0] = sins(surfAngle) * 10.0;
        m.vel[2] = coss(surfAngle) * 10.0;
        m.vel[1] = 0;

        // check if there's no _floor 10 units away from the surface
        if (perform_ground_step(m) == GROUND_STEP_LEFT_GROUND) {
            // instant un-squish
            m.squishTimer = 0;
            set_mario_action(m, ACT_IDLE, 0);
            return false;
        }
    }

    // squished for more than 10 seconds, so kill Mario
    if (m.actionArg++ > 300) {
        // 0 units of _health
        m._health = 0x00FF;
        m.hurtCounter = 0;
        level_trigger_warp(m, WARP_OP_DEATH);
        // woosh, he's gone!
        set_mario_action(m, ACT_DISAPPEARED, 0);
    }
    stop_and_set_height_to_floor(m);
    set_mario_animation(m, MARIO_ANIM_A_POSE);
    return false;
}

/// <pygml?v=1.0&h=e754455e3>
/// @function	act_shocked(m)
/// @param		{struct}	m
/// @returns	s32
function act_shocked(m) {
    play_sound_if_no_flag(m, SOUND_MARIO_WAAAOOOW, MARIO_ACTION_SOUND_PLAYED);
    play_sound(SOUND_MOVING_SHOCKED, m.marioObj.header.gfx.cameraToObject);
    set_camera_shake_from_hit(SHAKE_SHOCK);

    if (set_mario_animation(m, MARIO_ANIM_SHOCKED) == 0) {
        m.actionTimer++;
        m.flags |= MARIO_METAL_SHOCK;
    }

    if (m.actionArg == 0) {
        mario_set_forward_vel(m, 0.0);
        if (perform_air_step(m, 1) == AIR_STEP_LANDED) {
            play_mario_landing_sound(m, SOUND_ACTION_TERRAIN_LANDING);
            m.actionArg = 1;
        }
    } else {
        if (m.actionTimer >= 6) {
            m.invincTimer = 30;
            set_mario_action(m, m._health < 0x0100 ? ACT_ELECTROCUTION : ACT_IDLE, 0);
        }
        stop_and_set_height_to_floor(m);
    }

    return false;
}


/// <pygml?v=1.0&h=3f65841e1>
/// @function	act_electrocution(m)
/// @param		{struct}	m
/// @returns	s32
function act_electrocution(m) {
    play_sound_if_no_flag(m, SOUND_MARIO_DYING, MARIO_ACTION_SOUND_PLAYED);
    common_death_handler(m, MARIO_ANIM_ELECTROCUTION, 43);
    return false;
}

/// <pygml?v=1.0&h=f20179e21>
/// @function	act_suffocation(m)
/// @param		{struct}	m
/// @returns	s32
function act_suffocation(m) {
    play_sound_if_no_flag(m, SOUND_MARIO_DYING, MARIO_ACTION_SOUND_PLAYED);
    common_death_handler(m, MARIO_ANIM_SUFFOCATING, 86);
    return false;
}

/// <pygml?v=1.0&h=8529f83f8>
/// @function	act_death_on_back(m)
/// @param		{struct}	m
/// @returns	s32
function act_death_on_back(m) {
    play_sound_if_no_flag(m, SOUND_MARIO_DYING, MARIO_ACTION_SOUND_PLAYED);
    if (common_death_handler(m, MARIO_ANIM_DYING_ON_BACK, 54) == 40) {
        play_mario_heavy_landing_sound(m, SOUND_ACTION_TERRAIN_BODY_HIT_GROUND);
    }
    return false;
}

/// <pygml?v=1.0&h=d4c1d2c58>
/// @function	act_death_on_stomach(m)
/// @param		{struct}	m
/// @returns	s32
function act_death_on_stomach(m) {
    play_sound_if_no_flag(m, SOUND_MARIO_DYING, MARIO_ACTION_SOUND_PLAYED);
    if (common_death_handler(m, MARIO_ANIM_DYING_ON_STOMACH, 37) == 37) {
        play_mario_heavy_landing_sound(m, SOUND_ACTION_TERRAIN_BODY_HIT_GROUND);
    }
    return false;
}

/// <pygml?v=1.0&h=06b32f32c>
/// @function	act_quicksand_death(m)
/// @param		{struct}	m
/// @returns	s32
function act_quicksand_death(m) {
    if (m.actionState == 0) {
        set_mario_animation(m, MARIO_ANIM_DYING_IN_QUICKSAND);
        set_anim_to_frame(m, 60);
        m.actionState = 1;
    }
    if (m.actionState == 1) {
        if (m.quicksandDepth >= 100.0) {
            play_sound_if_no_flag(m, SOUND_MARIO_WAAAOOOW, MARIO_ACTION_SOUND_PLAYED);
        }
		m.quicksandDepth += 5.0;
        if (m.quicksandDepth >= 180.0) {
            level_trigger_warp(m, WARP_OP_DEATH);
            m.actionState = 2;
        }
    }
    stationary_ground_step(m);
    play_sound(SOUND_MOVING_QUICKSAND_DEATH, m.marioObj.header.gfx.cameraToObject);
    return false;
}

/// <pygml?v=1.0&h=6e2e2d62b>
/// @function	act_eaten_by_bubba(m)
/// @param		{struct}	m
/// @returns	s32
function act_eaten_by_bubba(m) {
    play_sound_if_no_flag(m, SOUND_MARIO_DYING, MARIO_ACTION_SOUND_PLAYED);
    set_mario_animation(m, MARIO_ANIM_A_POSE);
    m.marioObj.header.gfx.node.flags &= ~GRAPH_RENDER_ACTIVE;
    m._health = 0xFF;
    if (m.actionTimer++ == 60) {
        level_trigger_warp(m, WARP_OP_DEATH);
    }
    return false;
}



/// <pygml?v=1.0&h=9b30228f8>
/// @function	mario_execute_cutscene_action(m)
/// @desc		clang-format off
/// @param		{struct}	m
/// @returns	s32
function mario_execute_cutscene_action(m) {
    var cancel;

    if (check_for_instant_quicksand(m)) {
        return true;
    }

    switch (m.action) {
        case (ACT_DISAPPEARED):
            cancel = act_disappeared(m);
            break;
        case (ACT_INTRO_CUTSCENE):
            cancel = act_intro_cutscene(m);
            break;
        case (ACT_STAR_DANCE_EXIT):
            cancel = act_star_dance(m);
            break;
        case (ACT_STAR_DANCE_NO_EXIT):
            cancel = act_star_dance(m);
            break;
        case (ACT_STAR_DANCE_WATER):
            cancel = act_star_dance_water(m);
            break;
        case (ACT_FALL_AFTER_STAR_GRAB):
            cancel = act_fall_after_star_grab(m);
            break;
        case (ACT_READING_AUTOMATIC_DIALOG):
            cancel = act_reading_automatic_dialog(m);
            break;
        case (ACT_READING_NPC_DIALOG):
            cancel = act_reading_npc_dialog(m);
            break;
        case (ACT_DEBUG_FREE_MOVE):
            cancel = act_debug_free_move(m);
            break;
        case (ACT_READING_SIGN):
            cancel = act_reading_sign(m);
            break;
        case (ACT_JUMBO_STAR_CUTSCENE):
            cancel = act_jumbo_star_cutscene(m);
            break;
        case (ACT_WAITING_FOR_DIALOG):
            cancel = act_waiting_for_dialog(m);
            break;
        case (ACT_STANDING_DEATH):
            cancel = act_standing_death(m);
            break;
        case (ACT_QUICKSAND_DEATH):
            cancel = act_quicksand_death(m);
            break;
        case (ACT_ELECTROCUTION):
            cancel = act_electrocution(m);
            break;
        case (ACT_SUFFOCATION):
            cancel = act_suffocation(m);
            break;
        case (ACT_DEATH_ON_STOMACH):
            cancel = act_death_on_stomach(m);
            break;
        case (ACT_DEATH_ON_BACK):
            cancel = act_death_on_back(m);
            break;
        case (ACT_EATEN_BY_BUBBA):
            cancel = act_eaten_by_bubba(m);
            break;
        case (ACT_END_PEACH_CUTSCENE):
            cancel = act_end_peach_cutscene(m);
            break;
        case (ACT_CREDITS_CUTSCENE):
            cancel = act_credits_cutscene(m);
            break;
        case (ACT_END_WAVING_CUTSCENE):
            cancel = act_end_waving_cutscene(m);
            break;
        case (ACT_PULLING_DOOR):
        case (ACT_PUSHING_DOOR):
            cancel = act_going_through_door(m);
            break;
        case (ACT_WARP_DOOR_SPAWN):
            cancel = act_warp_door_spawn(m);
            break;
        case (ACT_EMERGE_FROM_PIPE):
            cancel = act_emerge_from_pipe(m);
            break;
        case (ACT_SPAWN_SPIN_AIRBORNE):
            cancel = act_spawn_spin_airborne(m);
            break;
        case (ACT_SPAWN_SPIN_LANDING):
            cancel = act_spawn_spin_landing(m);
            break;
        case (ACT_EXIT_AIRBORNE):
            cancel = act_exit_airborne(m);
            break;
        case (ACT_EXIT_LAND_SAVE_DIALOG):
            cancel = act_exit_land_save_dialog(m);
            break;
        case (ACT_DEATH_EXIT):
            cancel = act_death_exit(m);
            break;
        case (ACT_UNUSED_DEATH_EXIT):
            cancel = act_unused_death_exit(m);
            break;
        case (ACT_FALLING_DEATH_EXIT):
            cancel = act_falling_death_exit(m);
            break;
        case (ACT_SPECIAL_EXIT_AIRBORNE):
            cancel = act_special_exit_airborne(m);
            break;
        case (ACT_SPECIAL_DEATH_EXIT):
            cancel = act_special_death_exit(m);
            break;
        case (ACT_FALLING_EXIT_AIRBORNE):
            cancel = act_falling_exit_airborne(m);
            break;
        case (ACT_UNLOCKING_KEY_DOOR):
            cancel = act_unlocking_key_door(m);
            break;
        case (ACT_UNLOCKING_STAR_DOOR):
            cancel = act_unlocking_star_door(m);
            break;
        case (ACT_ENTERING_STAR_DOOR):
            cancel = act_entering_star_door(m);
            break;
        case (ACT_SPAWN_NO_SPIN_AIRBORNE):
            cancel = act_spawn_no_spin_airborne(m);
            break;
        case (ACT_SPAWN_NO_SPIN_LANDING):
            cancel = act_spawn_no_spin_landing(m);
            break;
        case (ACT_BBH_ENTER_JUMP):
            cancel = act_bbh_enter_jump(m);
            break;
        case (ACT_BBH_ENTER_SPIN):
            cancel = act_bbh_enter_spin(m);
            break;
        case (ACT_TELEPORT_FADE_OUT):
            cancel = act_teleport_fade_out(m);
            break;
        case (ACT_TELEPORT_FADE_IN):
            cancel = act_teleport_fade_in(m);
            break;
        case (ACT_SHOCKED):
            cancel = act_shocked(m);
            break;
        case (ACT_SQUISHED):
            cancel = act_squished(m);
            break;
        case (ACT_HEAD_STUCK_IN_GROUND):
            cancel = act_head_stuck_in_ground(m);
            break;
        case (ACT_BUTT_STUCK_IN_GROUND):
            cancel = act_butt_stuck_in_ground(m);
            break;
        case (ACT_FEET_STUCK_IN_GROUND):
            cancel = act_feet_stuck_in_ground(m);
            break;
        case (ACT_PUTTING_ON_CAP):
            cancel = act_putting_on_cap(m);
            break;
    }
    /* clang-format on */

    if (!cancel && (m.input & INPUT_IN_WATER)) {
        m.particleFlags |= PARTICLE_IDLE_WATER_WAVE;
    }

    return cancel;
}
