function level_update_scripts_macros_init() {
#macro TIMER_CONTROL_SHOW  0
#macro TIMER_CONTROL_START 1
#macro TIMER_CONTROL_STOP  2
#macro TIMER_CONTROL_HIDE  3

#macro PLAY_MODE_NORMAL 0
#macro PLAY_MODE_PAUSED 2
#macro PLAY_MODE_CHANGE_AREA 3
#macro PLAY_MODE_CHANGE_LEVEL 4
#macro PLAY_MODE_FRAME_ADVANCE 5
#macro WARP_TYPE_NOT_WARPING 0
#macro WARP_TYPE_CHANGE_LEVEL 1
#macro WARP_TYPE_CHANGE_AREA 2
#macro WARP_TYPE_SAME_AREA 3
#macro WARP_NODE_F0 0xF0
#macro WARP_NODE_DEATH 0xF1
#macro WARP_NODE_F2 0xF2
#macro WARP_NODE_WARP_FLOOR 0xF3
#macro WARP_NODE_CREDITS_START 0xF8
#macro WARP_NODE_CREDITS_NEXT 0xF9
#macro WARP_NODE_CREDITS_END 0xFA
#macro WARP_NODE_CREDITS_MIN 0xF8

#macro WARP_OP_NONE          0x00
#macro WARP_OP_UNKNOWN_01    0x01
#macro WARP_OP_UNKNOWN_02    0x02
#macro WARP_OP_WARP_DOOR     0x03
#macro WARP_OP_WARP_OBJECT   0x04
#macro WARP_OP_TELEPORT      0x05
#macro WARP_OP_STAR_EXIT     0x11
#macro WARP_OP_DEATH         0x12
#macro WARP_OP_WARP_FLOOR    0x13
#macro WARP_OP_GAME_OVER     0x14
#macro WARP_OP_CREDITS_END   0x15
#macro WARP_OP_DEMO_NEXT     0x16
#macro WARP_OP_CREDITS_START 0x17
#macro WARP_OP_CREDITS_NEXT  0x18
#macro WARP_OP_DEMO_END      0x19

#macro HUD_DISPLAY_FLAG_LIVES  0x0001
#macro HUD_DISPLAY_FLAG_COIN_COUNT  0x0002
#macro HUD_DISPLAY_FLAG_STAR_COUNT  0x0004
#macro HUD_DISPLAY_FLAG_CAMERA_AND_POWER  0x0008
#macro HUD_DISPLAY_FLAG_KEYS  0x0010
#macro HUD_DISPLAY_FLAG_UNKNOWN_0020  0x0020
#macro HUD_DISPLAY_FLAG_TIMER  0x0040
#macro HUD_DISPLAY_FLAG_EMPHASIZE_POWER  0x8000

#macro HUD_DISPLAY_NONE  0x0000
#macro HUD_DISPLAY_DEFAULT  HUD_DISPLAY_FLAG_LIVES | HUD_DISPLAY_FLAG_COIN_COUNT | HUD_DISPLAY_FLAG_STAR_COUNT | HUD_DISPLAY_FLAG_CAMERA_AND_POWER | HUD_DISPLAY_FLAG_KEYS | HUD_DISPLAY_FLAG_UNKNOWN_0020

#macro MARIO_SPAWN_DOOR_WARP             0x01
#macro MARIO_SPAWN_UNKNOWN_02            0x02
#macro MARIO_SPAWN_UNKNOWN_03            0x03
#macro MARIO_SPAWN_TELEPORT              0x04
#macro MARIO_SPAWN_INSTANT_ACTIVE        0x10
#macro MARIO_SPAWN_SWIMMING              0x11
#macro MARIO_SPAWN_AIRBORNE              0x12
#macro MARIO_SPAWN_HARD_AIR_KNOCKBACK    0x13
#macro MARIO_SPAWN_SPIN_AIRBORNE_CIRCLE  0x14
#macro MARIO_SPAWN_DEATH                 0x15
#macro MARIO_SPAWN_SPIN_AIRBORNE         0x16
#macro MARIO_SPAWN_FLYING                0x17
#macro MARIO_SPAWN_PAINTING_STAR_COLLECT 0x20
#macro MARIO_SPAWN_PAINTING_DEATH        0x21
#macro MARIO_SPAWN_AIRBORNE_STAR_COLLECT 0x22
#macro MARIO_SPAWN_AIRBORNE_DEATH        0x23
#macro MARIO_SPAWN_LAUNCH_STAR_COLLECT   0x24
#macro MARIO_SPAWN_LAUNCH_DEATH          0x25
#macro MARIO_SPAWN_UNKNOWN_27            0x27
	
globalvar gMarioStates;
gMarioStates	= [new MarioStateInstance(), new MarioStateInstance()];
#macro gMarioState		gMarioStates[0]

globalvar gHudDisplay;
gHudDisplay	= new HudDisplay();

globalvar sWarpDest;
sWarpDest		= new WarpDestInstance();

globalvar gCurrCourseNum;
gCurrCourseNum = COURSE_NONE;

globalvar sTransitionUpdate;
sTransitionUpdate	= 0;

globalvar sCurrPlayMode,
D_80339ECA,
sTransitionTimer,
D_80339EE0,
sDelayedWarpOp,
sDelayedWarpTimer,
sSourceWarpNodeId,
sDelayedWarpArg,
sTimerRunning,
gNeverEnteredCastle,
gCurrCreditsEntry;	

sCurrPlayMode			= 0;
D_80339ECA				= 0;
sTransitionTimer		= 0;
D_80339EE0				= 0;
sDelayedWarpOp			= 0;
sDelayedWarpTimer		= 0;
sSourceWarpNodeId		= 0;
sDelayedWarpArg			= 0;
sTimerRunning			= 0;
gNeverEnteredCastle		= 0;
gCurrCreditsEntry		= null;

globalvar gPauseScreenMode;
gPauseScreenMode		= 0;

globalvar sWarpCheckpointActive;
sWarpCheckpointActive	= 0;

boot("level_update_scripts_macros_init");
}

/// <pygml?v=1.0&h=f0ca076d8>
/// @function	level_control_timer(timerOp)
/// @param		{s32}		timerOp
/// @returns	u16
function level_control_timer(timerOp) {
    switch (timerOp) {
        case (TIMER_CONTROL_SHOW):
            gHudDisplay.flags |= HUD_DISPLAY_FLAG_TIMER;
            sTimerRunning = false;
            gHudDisplay.timer = 0;
            break;

        case (TIMER_CONTROL_START):
            sTimerRunning = true;
            break;

        case (TIMER_CONTROL_STOP):
            sTimerRunning = false;
            break;

        case (TIMER_CONTROL_HIDE):
            gHudDisplay.flags &= ~HUD_DISPLAY_FLAG_TIMER;
            sTimerRunning = false;
            gHudDisplay.timer = 0;
            break;
    }

    return gHudDisplay.timer;
}

/// <pygml?v=1.0&h=b65e7ffb1>
/// @function	pressed_pause()
/// @returns	u32
function pressed_pause() {
    var val4 = get_dialog_id() >= 0;
    var intangible = (gMarioState.action & ACT_FLAG_INTANGIBLE) != 0;

    if (!intangible && !val4 && !gWarpTransition.isActive && sDelayedWarpOp == WARP_OP_NONE &&
        (gPlayer1Controller.buttonPressed & START_BUTTON)) {
        return true;
    }

    return false;
}

function set_play_mode(playMode) {
    sCurrPlayMode = playMode;
    D_80339ECA = 0;
}

function warp_special(arg) {
    sCurrPlayMode = PLAY_MODE_CHANGE_LEVEL;
    D_80339ECA = 0;
    D_80339EE0 = arg;
}

/// <pygml?v=1.0&h=605e36408>
/// @function	init_door_warp(spawnInfo, arg1)
/// @param		{struct}	spawnInfo
/// @param		{u32}		arg1
function init_door_warp(spawnInfo, arg1) {
    if (arg1 & 0x00000002) {
        spawnInfo.startAngle[1] += 0x8000;
    }

    spawnInfo.startPos[0] += 300.0 * sins(spawnInfo.startAngle[1]);
    spawnInfo.startPos[2] += 300.0 * coss(spawnInfo.startAngle[1]);
}

/// <pygml?v=1.0&h=ccb2569d4>
/// @function	set_mario_initial_cap_powerup(m)
/// @param		{struct}	m
function set_mario_initial_cap_powerup(m) {
    var capCourseIndex = gCurrCourseNum - COURSE_CAP_COURSES;

    switch (capCourseIndex) {
        case COURSE_COTMC - COURSE_CAP_COURSES:
            m.flags |= MARIO_METAL_CAP | MARIO_CAP_ON_HEAD;
            m.capTimer = 600;
            break;

        case COURSE_TOTWC - COURSE_CAP_COURSES:
            m.flags |= MARIO_WING_CAP | MARIO_CAP_ON_HEAD;
            m.capTimer = 1200;
            break;

        case COURSE_VCUTM - COURSE_CAP_COURSES:
            m.flags |= MARIO_VANISH_CAP | MARIO_CAP_ON_HEAD;
            m.capTimer = 600;
            break;
    }
}

/// <pygml?v=1.0&h=d16669aeb>
/// @function	set_mario_initial_action(m, spawnType, actionArg)
/// @param		{struct}	m
/// @param		{u32}		spawnType
/// @param		{u32}		actionArg
function set_mario_initial_action(m, spawnType, actionArg) {
    switch (spawnType) {
        case (MARIO_SPAWN_DOOR_WARP):
            set_mario_action(m, ACT_WARP_DOOR_SPAWN, actionArg);
            break;
        case (MARIO_SPAWN_UNKNOWN_02):
            set_mario_action(m, ACT_IDLE, 0);
            break;
        case (MARIO_SPAWN_UNKNOWN_03):
            set_mario_action(m, ACT_EMERGE_FROM_PIPE, 0);
            break;
        case (MARIO_SPAWN_TELEPORT):
            set_mario_action(m, ACT_TELEPORT_FADE_IN, 0);
            break;
        case (MARIO_SPAWN_INSTANT_ACTIVE):
            set_mario_action(m, ACT_IDLE, 0);
            break;
        case (MARIO_SPAWN_AIRBORNE):
            set_mario_action(m, ACT_SPAWN_NO_SPIN_AIRBORNE, 0);
            break;
        case (MARIO_SPAWN_HARD_AIR_KNOCKBACK):
            set_mario_action(m, ACT_HARD_BACKWARD_AIR_KB, 0);
            break;
        case (MARIO_SPAWN_SPIN_AIRBORNE_CIRCLE):
            set_mario_action(m, ACT_SPAWN_SPIN_AIRBORNE, 0);
            break;
        case (MARIO_SPAWN_DEATH):
            set_mario_action(m, ACT_FALLING_DEATH_EXIT, 0);
            break;
        case (MARIO_SPAWN_SPIN_AIRBORNE):
            set_mario_action(m, ACT_SPAWN_SPIN_AIRBORNE, 0);
            break;
        case (MARIO_SPAWN_FLYING):
            set_mario_action(m, ACT_FLYING, 2);
            break;
        case (MARIO_SPAWN_SWIMMING):
            set_mario_action(m, ACT_WATER_IDLE, 1);
            break;
        case (MARIO_SPAWN_PAINTING_STAR_COLLECT):
            set_mario_action(m, ACT_EXIT_AIRBORNE, 0);
            break;
        case (MARIO_SPAWN_PAINTING_DEATH):
            set_mario_action(m, ACT_DEATH_EXIT, 0);
            break;
        case (MARIO_SPAWN_AIRBORNE_STAR_COLLECT):
            set_mario_action(m, ACT_FALLING_EXIT_AIRBORNE, 0);
            break;
        case (MARIO_SPAWN_AIRBORNE_DEATH):
            set_mario_action(m, ACT_UNUSED_DEATH_EXIT, 0);
            break;
        case (MARIO_SPAWN_LAUNCH_STAR_COLLECT):
            set_mario_action(m, ACT_SPECIAL_EXIT_AIRBORNE, 0);
            break;
        case (MARIO_SPAWN_LAUNCH_DEATH):
            set_mario_action(m, ACT_SPECIAL_DEATH_EXIT, 0);
            break;
    }

    set_mario_initial_cap_powerup(m);
}

/// <pygml?v=1.0&h=092958135>
/// @function	init_mario_after_warp()
function init_mario_after_warp() {
    var spawnNode = area_get_warp_node(sWarpDest.nodeId);
    var marioSpawnType = get_mario_spawn_type(spawnNode.object);

    if (gMarioState.action != ACT_UNINITIALIZED) {
        gPlayerSpawnInfos[0].startPos[0] = spawnNode.object.rawData[oPosX];
        gPlayerSpawnInfos[0].startPos[1] = spawnNode.object.rawData[oPosY];
        gPlayerSpawnInfos[0].startPos[2] = spawnNode.object.rawData[oPosZ];

        gPlayerSpawnInfos[0].startAngle[0] = 0;
        gPlayerSpawnInfos[0].startAngle[1] = spawnNode.object.rawData[oMoveAngleYaw];
        gPlayerSpawnInfos[0].startAngle[2] = 0;

        if (marioSpawnType == MARIO_SPAWN_DOOR_WARP) {
            init_door_warp(gPlayerSpawnInfos[0], sWarpDest.arg);
        }

        if (sWarpDest.type == WARP_TYPE_CHANGE_LEVEL || sWarpDest.type == WARP_TYPE_CHANGE_AREA) {
            gPlayerSpawnInfos[0].areaIndex = sWarpDest.areaIdx;
            load_mario_area();
        }

        init_mario();
        set_mario_initial_action(gMarioState, marioSpawnType, sWarpDest.arg);

        gMarioState.interactObj = spawnNode.object;
        gMarioState.usedObj = spawnNode.object;
    }

    reset_camera(gCurrentArea.camera);
    sWarpDest.type = WARP_TYPE_NOT_WARPING;
    sDelayedWarpOp = WARP_OP_NONE;

    switch (marioSpawnType) {
        case (MARIO_SPAWN_UNKNOWN_03):
            play_transition(WARP_TRANSITION_FADE_FROM_STAR, 0x10, 0x00, 0x00, 0x00);
            break;
        case (MARIO_SPAWN_DOOR_WARP):
            play_transition(WARP_TRANSITION_FADE_FROM_CIRCLE, 0x10, 0x00, 0x00, 0x00);
            break;
        case (MARIO_SPAWN_TELEPORT):
            play_transition(WARP_TRANSITION_FADE_FROM_COLOR, 0x14, 0xFF, 0xFF, 0xFF);
            break;
        case (MARIO_SPAWN_SPIN_AIRBORNE):
            play_transition(WARP_TRANSITION_FADE_FROM_COLOR, 0x1A, 0xFF, 0xFF, 0xFF);
            break;
        case (MARIO_SPAWN_SPIN_AIRBORNE_CIRCLE):
            play_transition(WARP_TRANSITION_FADE_FROM_CIRCLE, 0x10, 0x00, 0x00, 0x00);
            break;
        case (MARIO_SPAWN_UNKNOWN_27):
            play_transition(WARP_TRANSITION_FADE_FROM_COLOR, 0x10, 0x00, 0x00, 0x00);
            break;
        default:
            play_transition(WARP_TRANSITION_FADE_FROM_STAR, 0x10, 0x00, 0x00, 0x00);
            break;
    }

    if (gCurrDemoInput == null) {
        set_background_music(gCurrentArea.musicParam, gCurrentArea.musicParam2, 0);

        if (gMarioState.flags & MARIO_METAL_CAP) {
            play_cap_music(SEQUENCE_ARGS(4, SEQ_EVENT_METAL_CAP));
        }

        if (gMarioState.flags & (MARIO_VANISH_CAP | MARIO_WING_CAP)) {
            play_cap_music(SEQUENCE_ARGS(4, SEQ_EVENT_POWERUP));
        }

        if (gCurrLevelNum == LEVEL_BOB &&
            get_current_background_music() != SEQUENCE_ARGS(4, SEQ_LEVEL_SLIDE) &&
            sTimerRunning) {
            play_music(SEQ_PLAYER_LEVEL, SEQUENCE_ARGS(4, SEQ_LEVEL_SLIDE), 0);
        }

        if (sWarpDest.levelNum == LEVEL_CASTLE && sWarpDest.areaIdx == 1 &&
            (sWarpDest.nodeId == 31 || sWarpDest.nodeId == 32)
        ) play_sound(SOUND_MENU_MARIO_CASTLE_WARP, gDefaultSoundArgs);
		
        if (sWarpDest.levelNum == LEVEL_CASTLE_GROUNDS && sWarpDest.areaIdx == 1 &&
            (sWarpDest.nodeId == 7 || sWarpDest.nodeId == 10 || sWarpDest.nodeId == 20 ||
                sWarpDest.nodeId == 30)) {
            play_sound(SOUND_MENU_MARIO_CASTLE_WARP, gDefaultSoundArgs);
        }
    }
}

/// <pygml?v=1.0&h=9c735ed21>
/// @function	warp_area()
// used for warps inside one level
function warp_area() {
    if (sWarpDest.type != WARP_TYPE_NOT_WARPING) {
        if (sWarpDest.type == WARP_TYPE_CHANGE_AREA) {
            level_control_timer(TIMER_CONTROL_HIDE);
            unload_mario_area();
            load_area(sWarpDest.areaIdx);
        }

        init_mario_after_warp();
    }
}

/// <pygml?v=1.0&h=45729e061>
/// @function	warp_level()
// used for warps between levels
function warp_level() {
    gCurrLevelNum = sWarpDest.levelNum;

    level_control_timer(TIMER_CONTROL_HIDE);

    load_area(sWarpDest.areaIdx);
    init_mario_after_warp();
}



function lvl_init_from_save_file(arg0, levelNum) {
		
	levelNum			= CURRENT_LEVEL;
    gCurrLevelArea		= CURRENT_LEVEL_AREA; // @z
    gCurrLevelNum		= levelNum;
    gCurrCourseNum		= COURSE_NONE;
    gSavedCourseNum		= COURSE_NONE;
    gCurrCreditsEntry	= null;

    init_mario_from_save_file();
    select_mario_cam_mode();

    return levelNum;
}
	
function lvl_init_or_update(init_or_update) {
    return init_or_update ? update_level() : init_level();
}
	
function init_level() {
	var val4 = 0;
	
    set_play_mode(PLAY_MODE_NORMAL);
	
    sDelayedWarpOp = WARP_OP_NONE;
    sTransitionTimer = 0;
    D_80339EE0 = 0;

    if (gCurrCreditsEntry == null) {
        gHudDisplay.flags = HUD_DISPLAY_DEFAULT;
    } else {
        gHudDisplay.flags = HUD_DISPLAY_NONE;
    }

	sTimerRunning = false;

    if (sWarpDest.type != WARP_TYPE_NOT_WARPING) {
        if (sWarpDest.nodeId >= WARP_NODE_CREDITS_MIN) {
            warp_credits();
        } else {
            warp_level();
        }
    } else {
        if (gMarioSpawnInfo.areaIndex >= 0) {
            load_mario_area();
            init_marios();
        }

        if (gCurrentArea!=null) {
            reset_camera(gCurrentArea.camera);
			
            if (gCurrDemoInput != null) {
                set_mario_action(gMarioState, ACT_IDLE, 0);
            } else if (!gDebugLevelSelect) {
                //if (gMarioState.action != ACT_UNINITIALIZED) {
                //    if (save_file_exists(gCurrSaveFileNum - 1)) {
                //        set_mario_action(gMarioState, ACT_IDLE, 0);
                //    } else {
                //        set_mario_action(gMarioState, ACT_INTRO_CUTSCENE, 0);
                //        val4 = 1;
                //    }
                //} // @z
            }
        }
    }
	
    if (val4 != 0) {
        play_transition(WARP_TRANSITION_FADE_FROM_COLOR, 0x5A, 0xFF, 0xFF, 0xFF);
    } else {
        play_transition(WARP_TRANSITION_FADE_FROM_STAR, 0x10, 0xFF, 0xFF, 0xFF);
    }
	
    if (gCurrDemoInput == null) {
        set_background_music(gCurrentArea.musicParam, gCurrentArea.musicParam2, 0);
    }
	
    if (gMarioState.action == ACT_INTRO_CUTSCENE) {
        sound_banks_disable(2, 0x0330);
    }
        
    return 1;
}
	
function play_mode_normal() {
	
	for(var i = 0; i < LAG_FRAMES; i++) {
		
	    if (sTimerRunning && gHudDisplay.timer < 17999) {
	        gHudDisplay.timer += 1;
	    }

	    area_update_objects();
		update_hud_values();
	
		if (gCurrentArea!=null) {
	        update_camera(gCurrentArea.camera)
	    }
	
	    if (sCurrPlayMode == PLAY_MODE_NORMAL) {
	        if (sWarpDest.type == WARP_TYPE_CHANGE_LEVEL) {
	            set_play_mode(PLAY_MODE_CHANGE_LEVEL);
	        } else if (sTransitionTimer != 0) {
	            set_play_mode(PLAY_MODE_CHANGE_AREA);
	        } else if (pressed_pause()) {
	            lower_background_noise(1);
	            gCameraMovementFlags |= CAM_MOVE_PAUSE_SCREEN;
	            set_play_mode(PLAY_MODE_PAUSED);
	        }
	    }

	}
	
    return 0;
}

/// <pygml?v=1.0&h=0be224eb8>
/// @function	play_mode_paused()
/// @returns	s32
function play_mode_paused() {
    if (gPauseScreenMode == 0) {
        set_menu_mode(RENDER_PAUSE_SCREEN);
    } else if (gPauseScreenMode == 1) {
        raise_background_noise(1);
        gCameraMovementFlags &= ~CAM_MOVE_PAUSE_SCREEN;
        set_play_mode(PLAY_MODE_NORMAL);
    } else {
        // Exit level

        if (gDebugLevelSelect) {
            fade_into_special_warp(-9, 1);
        } else {
            initiate_warp(LEVEL_CASTLE, 1, 0x1F, 0);
            fade_into_special_warp(0, 0);
            gSavedCourseNum = COURSE_NONE;
        }

        gCameraMovementFlags &= ~CAM_MOVE_PAUSE_SCREEN;
    }

    return 0;
}




	
function update_level() {
		
    var changeLevel;

    switch (sCurrPlayMode) {
        case PLAY_MODE_NORMAL:
            changeLevel = play_mode_normal();
        break;
        case PLAY_MODE_PAUSED:
            changeLevel = play_mode_paused();
        break;
    }
	
    if (changeLevel) {
        reset_volume();
        enable_background_sound();
    }

    return changeLevel;
}



/// <pygml?v=1.0&h=bc9f3a052>
/// @function	fade_into_special_warp(arg, color)
/// @param		{u32}		arg
/// @param		{u32}		color
function fade_into_special_warp(arg, color) {
    if (color != 0) {
        color = 0xFF;
    }

    fadeout_music(190);
    play_transition(WARP_TRANSITION_FADE_INTO_COLOR, 0x10, color, color, color);
    level_set_transition(30, null);

    warp_special(arg);
}


function MarioStateInstance() constructor {
	unk00				= 0;
	input				= 0;
	flags				= 0;
	particleFlags		= 0;
	action				= 0;
	prevAction			= 0;
	terrainsoundAddend	= 0;
	actionState			= 0;
	actionTimer			= 0;
	actionArg			= 0;
	intendedMag			= 0;
	intendedYaw			= 0;
	invincTimer			= 0;
	framesSinceA		= 0;
	framesSinceB		= 0;
	wallKickTimer		= 0;
	doubleJumpTimer		= 0;
	faceAngle			= Vec3;
	angleVel			= Vec3;
	slideYaw			= 0;
	twirlYaw			= 0;
	pos					= Vec3;
	vel					= Vec3;
	forwardVel			= 0;
	slideVelX			= 0;
	slideVelY			= 0;
}

function WarpDestInstance() constructor {
	type		= 0;
	levelNum	= 0;
	areaIdx		= 0;
	nodeId		= 0;
	arg			= 0;
}

/// <pygml?v=1.0&h=bdfe785b5>
/// @function	level_trigger_warp(m, warpOp)
/// @desc		If there is not already a delayed warp, schedule one. The
///					source node is  based on the warp operation and sometimes
///					Mario's used object.  Return the time left until the delayed
///					warp is initiated.
/// @param		{struct}	m
/// @param		{s32}		warpOp
/// @returns	s16
function level_trigger_warp(m, warpOp) {
    var val04 = true;

    if (sDelayedWarpOp == WARP_OP_NONE) {
        m.invincTimer = -1;
        sDelayedWarpArg = 0;
        sDelayedWarpOp = warpOp;

        switch (warpOp) {
            case (WARP_OP_DEMO_NEXT):
            case (WARP_OP_DEMO_END):
                sDelayedWarpTimer = 20; // Must be one line to match on -O2
                sSourceWarpNodeId = WARP_NODE_F0;
                gSavedCourseNum = COURSE_NONE;
                val04 = false;
                play_transition(WARP_TRANSITION_FADE_INTO_STAR, 0x14, 0x00, 0x00, 0x00);
                break;

            case (WARP_OP_CREDITS_END):
                sDelayedWarpTimer = 60;
                sSourceWarpNodeId = WARP_NODE_F0;
                val04 = false;
                gSavedCourseNum = COURSE_NONE;
                play_transition(WARP_TRANSITION_FADE_INTO_COLOR, 0x3C, 0x00, 0x00, 0x00);
                break;

            case (WARP_OP_STAR_EXIT):
                sDelayedWarpTimer = 32;
                sSourceWarpNodeId = WARP_NODE_F0;
                gSavedCourseNum = COURSE_NONE;
                play_transition(WARP_TRANSITION_FADE_INTO_MARIO, 0x20, 0x00, 0x00, 0x00);
                break;

            case (WARP_OP_DEATH):
                if (m.numLives == 0) {
                    sDelayedWarpOp = WARP_OP_GAME_OVER;
                }
                sDelayedWarpTimer = 48;
                sSourceWarpNodeId = WARP_NODE_DEATH;
                play_transition(WARP_TRANSITION_FADE_INTO_BOWSER, 0x30, 0x00, 0x00, 0x00);
                play_sound(SOUND_MENU_BOWSER_LAUGH, gDefaultSoundArgs);
                break;

            case (WARP_OP_WARP_FLOOR):
                sSourceWarpNodeId = WARP_NODE_WARP_FLOOR;
                if (area_get_warp_node(sSourceWarpNodeId) == null) {
                    if (m.numLives == 0) {
                        sDelayedWarpOp = WARP_OP_GAME_OVER;
                    } else {
                        sSourceWarpNodeId = WARP_NODE_DEATH;
                    }
                }
                sDelayedWarpTimer = 20;
                play_transition(WARP_TRANSITION_FADE_INTO_CIRCLE, 0x14, 0x00, 0x00, 0x00);
                break;

            case (WARP_OP_UNKNOWN_01): // enter totwc
                sDelayedWarpTimer = 30;
                sSourceWarpNodeId = WARP_NODE_F2;
                play_transition(WARP_TRANSITION_FADE_INTO_COLOR, 0x1E, 0xFF, 0xFF, 0xFF);
                play_sound(SOUND_MENU_STAR_SOUND, gDefaultSoundArgs);
                break;

            case (WARP_OP_UNKNOWN_02): // bbh enter
                sDelayedWarpTimer = 30;
                sSourceWarpNodeId = (m.usedObj.rawData[oBehParams] & 0x00FF0000) >> 16;
                play_transition(WARP_TRANSITION_FADE_INTO_COLOR, 0x1E, 0xFF, 0xFF, 0xFF);
                break;

            case (WARP_OP_TELEPORT):
                sDelayedWarpTimer = 20;
                sSourceWarpNodeId = (m.usedObj.rawData[oBehParams] & 0x00FF0000) >> 16;
                val04 = !music_changed_through_warp(sSourceWarpNodeId);
                play_transition(WARP_TRANSITION_FADE_INTO_COLOR, 0x14, 0xFF, 0xFF, 0xFF);
                break;

            case (WARP_OP_WARP_DOOR):
                sDelayedWarpTimer = 20;
                sDelayedWarpArg = m.actionArg;
                sSourceWarpNodeId = (m.usedObj.rawData[oBehParams] & 0x00FF0000) >> 16;
                val04 = !music_changed_through_warp(sSourceWarpNodeId);
                play_transition(WARP_TRANSITION_FADE_INTO_CIRCLE, 0x14, 0x00, 0x00, 0x00);
                break;

            case (WARP_OP_WARP_OBJECT):
                sDelayedWarpTimer = 20;
                sSourceWarpNodeId = (m.usedObj.rawData[oBehParams] & 0x00FF0000) >> 16;
                val04 = !music_changed_through_warp(sSourceWarpNodeId);
                play_transition(WARP_TRANSITION_FADE_INTO_STAR, 0x14, 0x00, 0x00, 0x00);
                break;

            case (WARP_OP_CREDITS_START):
                sDelayedWarpTimer = 30;
                play_transition(WARP_TRANSITION_FADE_INTO_COLOR, 0x1E, 0x00, 0x00, 0x00);
                break;

            case (WARP_OP_CREDITS_NEXT):
                if (gCurrCreditsEntry == sCreditsSequence[0]) {
                    sDelayedWarpTimer = 60;
                    play_transition(WARP_TRANSITION_FADE_INTO_COLOR, 0x3C, 0x00, 0x00, 0x00);
                } else {
                    sDelayedWarpTimer = 20;
                    play_transition(WARP_TRANSITION_FADE_INTO_COLOR, 0x14, 0x00, 0x00, 0x00);
                }
                val04 = false;
                break;
        }

        if (val04 && gCurrDemoInput == null) {
            fadeout_music((3 * sDelayedWarpTimer / 2) * 8 - 2);
        }
    }

    return sDelayedWarpTimer;
}

function HudDisplay() constructor {
    _lives = 0;
    coins  = 0;
    stars  = 0;
    wedges = 0;
    keys   = 0;
    flags  = 0;
    timer  = 0;
}

/// <pygml?v=1.0&h=e257f7057>
/// @function	update_hud_values()
function update_hud_values() {
    if (gCurrCreditsEntry == null) {
        var numHealthWedges = gMarioState._health > 0 ? gMarioState._health >> 8 : 0;

        if (gCurrCourseNum >= COURSE_MIN) {
            gHudDisplay.flags |= HUD_DISPLAY_FLAG_COIN_COUNT;
        } else {
            gHudDisplay.flags &= ~HUD_DISPLAY_FLAG_COIN_COUNT;
       }

        if (gHudDisplay.coins < gMarioState.numCoins) {
            if (gGlobalTimer & 0x00000001) {
                var coinSound;
                if (gMarioState.action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER)) {
                    coinSound = SOUND_GENERAL_COIN_WATER;
                } else {
                    coinSound = SOUND_GENERAL_COIN;
                }

                gHudDisplay.coins += 1;
                play_sound(coinSound, gMarioState.marioObj.header.gfx.cameraToObject);
            }
        }

        if (gMarioState.numLives > 100) {
            gMarioState.numLives = 100;
        }

        if (gMarioState.numCoins > 999) {
            gMarioState.numCoins = 999;
        }

        if (gHudDisplay.coins > 999) {
            gHudDisplay.coins = 999;
        }

        gHudDisplay.stars = gMarioState.numStars;
        gHudDisplay._lives = gMarioState.numLives;
        gHudDisplay.keys = gMarioState.numKeys;
		
        if (numHealthWedges > gHudDisplay.wedges) {
            play_sound(SOUND_MENU_POWER_METER, gDefaultSoundArgs);
        }
		
        gHudDisplay.wedges = numHealthWedges;

		if (keyboard_check_pressed(ord("O"))) gMarioState.hurtCounter = 20;

        if (gMarioState.hurtCounter > 0) {
            gHudDisplay.flags |= HUD_DISPLAY_FLAG_EMPHASIZE_POWER;
        } else {
            gHudDisplay.flags &= ~HUD_DISPLAY_FLAG_EMPHASIZE_POWER;
        }
    }
}

/// <pygml?v=1.0&h=6ae552f44>
/// @function	level_set_transition(length, )
/// @desc		Set the transition, which is a period of time after the warp
///					is initiated  but before it actually occurs. If
///					updateFunction is not null, it will be  called each frame
///					during the transition.
/// @param		{s16}		length
/// @param		{void}		
function level_set_transition(length, updateFunction) {
    sTransitionTimer	= length;
    sTransitionUpdate	= updateFunction;
}
