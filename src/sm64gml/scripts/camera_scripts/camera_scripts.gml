function camera_scripts_macros_init() {
	
	globalvar sFramesPaused;
	sFramesPaused = 0;
	#macro CBUTTON_MASK (U_CBUTTONS | D_CBUTTONS | L_CBUTTONS | R_CBUTTONS)
	
	globalvar sParTrackIndex;
	sParTrackIndex = 0;
	
	#macro AREA_BBH                LEVEL_AREA_INDEX(LEVEL_BBH, 1)
	#macro AREA_CCM_OUTSIDE        LEVEL_AREA_INDEX(LEVEL_CCM, 1)
	#macro AREA_CCM_SLIDE          LEVEL_AREA_INDEX(LEVEL_CCM, 2)
	#macro AREA_CASTLE_LOBBY       LEVEL_AREA_INDEX(LEVEL_CASTLE, 1)
	#macro AREA_CASTLE_TIPPY       LEVEL_AREA_INDEX(LEVEL_CASTLE, 2)
	#macro AREA_CASTLE_BASEMENT    LEVEL_AREA_INDEX(LEVEL_CASTLE, 3)
	#macro AREA_HMC                LEVEL_AREA_INDEX(LEVEL_HMC, 1)
	#macro AREA_SSL_OUTSIDE        LEVEL_AREA_INDEX(LEVEL_SSL, 1)
	#macro AREA_SSL_PYRAMID        LEVEL_AREA_INDEX(LEVEL_SSL, 2)
	#macro AREA_SSL_EYEROK         LEVEL_AREA_INDEX(LEVEL_SSL, 3)
	#macro AREA_BOB                LEVEL_AREA_INDEX(LEVEL_BOB, 1)
	#macro AREA_SL_OUTSIDE         LEVEL_AREA_INDEX(LEVEL_SL, 1)
	#macro AREA_SL_IGLOO           LEVEL_AREA_INDEX(LEVEL_SL, 2)
	#macro AREA_WDW_MAIN           LEVEL_AREA_INDEX(LEVEL_WDW, 1)
	#macro AREA_WDW_TOWN           LEVEL_AREA_INDEX(LEVEL_WDW, 2)
	#macro AREA_JRB_MAIN           LEVEL_AREA_INDEX(LEVEL_JRB, 1)
	#macro AREA_JRB_SHIP           LEVEL_AREA_INDEX(LEVEL_JRB, 2)
	#macro AREA_THI_HUGE           LEVEL_AREA_INDEX(LEVEL_THI, 1)
	#macro AREA_THI_TINY           LEVEL_AREA_INDEX(LEVEL_THI, 2)
	#macro AREA_THI_WIGGLER        LEVEL_AREA_INDEX(LEVEL_THI, 3)
	#macro AREA_TTC                LEVEL_AREA_INDEX(LEVEL_TTC, 1)
	#macro AREA_RR                 LEVEL_AREA_INDEX(LEVEL_RR, 1)
	#macro AREA_CASTLE_GROUNDS     LEVEL_AREA_INDEX(LEVEL_CASTLE_GROUNDS, 1)
	#macro AREA_BITDW              LEVEL_AREA_INDEX(LEVEL_BITDW, 1)
	#macro AREA_VCUTM              LEVEL_AREA_INDEX(LEVEL_VCUTM, 1)
	#macro AREA_BITFS              LEVEL_AREA_INDEX(LEVEL_BITFS, 1)
	#macro AREA_SA                 LEVEL_AREA_INDEX(LEVEL_SA, 1)
	#macro AREA_BITS               LEVEL_AREA_INDEX(LEVEL_BITS, 1)
	#macro AREA_LLL_OUTSIDE        LEVEL_AREA_INDEX(LEVEL_LLL, 1)
	#macro AREA_LLL_VOLCANO        LEVEL_AREA_INDEX(LEVEL_LLL, 2)
	#macro AREA_DDD_WHIRLPOOL      LEVEL_AREA_INDEX(LEVEL_DDD, 1)
	#macro AREA_DDD_SUB            LEVEL_AREA_INDEX(LEVEL_DDD, 2)
	#macro AREA_WF                 LEVEL_AREA_INDEX(LEVEL_WF, 1)
	#macro AREA_ENDING             LEVEL_AREA_INDEX(LEVEL_ENDING, 1)
	#macro AREA_COURTYARD          LEVEL_AREA_INDEX(LEVEL_CASTLE_COURTYARD, 1)
	#macro AREA_PSS                LEVEL_AREA_INDEX(LEVEL_PSS, 1)
	#macro AREA_COTMC              LEVEL_AREA_INDEX(LEVEL_COTMC, 1)
	#macro AREA_TOTWC              LEVEL_AREA_INDEX(LEVEL_TOTWC, 1)
	#macro AREA_BOWSER_1           LEVEL_AREA_INDEX(LEVEL_BOWSER_1, 1)
	#macro AREA_WMOTR              LEVEL_AREA_INDEX(LEVEL_WMOTR, 1)
	#macro AREA_BOWSER_2           LEVEL_AREA_INDEX(LEVEL_BOWSER_2, 1)
	#macro AREA_BOWSER_3           LEVEL_AREA_INDEX(LEVEL_BOWSER_3, 1)
	#macro AREA_TTM_OUTSIDE        LEVEL_AREA_INDEX(LEVEL_TTM, 1)

	#macro CAM_MODE_MARIO_ACTIVE           0x01
	#macro CAM_MODE_LAKITU_WAS_ZOOMED_OUT  0x02
	#macro CAM_MODE_MARIO_SELECTED         0x04

	#macro CAM_SELECTION_MARIO 1
	#macro CAM_SELECTION_FIXED 2

	#macro CAM_ANGLE_MARIO  1
	#macro CAM_ANGLE_LAKITU 2

	#macro CAMERA_MODE_NONE              0x00
	#macro CAMERA_MODE_RADIAL            0x01
	#macro CAMERA_MODE_OUTWARD_RADIAL    0x02
	#macro CAMERA_MODE_BEHIND_MARIO      0x03
	#macro CAMERA_MODE_CLOSE             0x04 // Inside Castle / Big Boo's Haunt
	#macro CAMERA_MODE_C_UP              0x06
	#macro CAMERA_MODE_WATER_SURFACE     0x08
	#macro CAMERA_MODE_SLIDE_HOOT        0x09
	#macro CAMERA_MODE_INSIDE_CANNON     0x0A
	#macro CAMERA_MODE_BOSS_FIGHT        0x0B
	#macro CAMERA_MODE_PARALLEL_TRACKING 0x0C
	#macro CAMERA_MODE_FIXED             0x0D
	#macro CAMERA_MODE_8_DIRECTIONS      0x0E // AKA Parallel Camera, Bowser Courses & Rainbow Ride
	#macro CAMERA_MODE_FREE_ROAM         0x10
	#macro CAMERA_MODE_SPIRAL_STAIRS     0x11

	#macro CAM_MOVE_RETURN_TO_MIDDLE       0x0001
	#macro CAM_MOVE_ZOOMED_OUT             0x0002
	#macro CAM_MOVE_ROTATE_RIGHT           0x0004
	#macro CAM_MOVE_ROTATE_LEFT            0x0008
	#macro CAM_MOVE_ENTERED_ROTATE_SURFACE 0x0010
	#macro CAM_MOVE_METAL_BELOW_WATER      0x0020
	#macro CAM_MOVE_FIX_IN_PLACE           0x0040
	#macro CAM_MOVE_UNKNOWN_8              0x0080
	#macro CAM_MOVING_INTO_MODE            0x0100
	#macro CAM_MOVE_STARTED_EXITING_C_UP   0x0200
	#macro CAM_MOVE_UNKNOWN_11             0x0400
	#macro CAM_MOVE_INIT_CAMERA            0x0800
	#macro CAM_MOVE_ALREADY_ZOOMED_OUT     0x1000
	#macro CAM_MOVE_C_UP_MODE              0x2000
	#macro CAM_MOVE_SUBMERGED              0x4000
	#macro CAM_MOVE_PAUSE_SCREEN           0x8000

	#macro CAM_MOVE_ROTATE /**/ (CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_ROTATE_LEFT | CAM_MOVE_RETURN_TO_MIDDLE)
	/// These flags force the camera to move a certain way
	#macro CAM_MOVE_RESTRICT /**/ (CAM_MOVE_ENTERED_ROTATE_SURFACE | CAM_MOVE_METAL_BELOW_WATER | CAM_MOVE_FIX_IN_PLACE | CAM_MOVE_UNKNOWN_8)

	#macro CAM_SOUND_C_UP_PLAYED            0x01
	#macro CAM_SOUND_MARIO_ACTIVE           0x02
	#macro CAM_SOUND_NORMAL_ACTIVE          0x04
	#macro CAM_SOUND_UNUSED_SELECT_MARIO    0x08
	#macro CAM_SOUND_UNUSED_SELECT_FIXED    0x10
	#macro CAM_SOUND_FIXED_ACTIVE           0x20

	#macro CAM_FLAG_SMOOTH_MOVEMENT         0x0001
	#macro CAM_FLAG_BLOCK_SMOOTH_MOVEMENT   0x0002
	#macro CAM_FLAG_FRAME_AFTER_CAM_INIT    0x0004
	#macro CAM_FLAG_CHANGED_PARTRACK_INDEX  0x0008
	#macro CAM_FLAG_CCM_SLIDE_SHORTCUT      0x0010
	#macro CAM_FLAG_CAM_NEAR_WALL           0x0020
	#macro CAM_FLAG_SLEEPING                0x0040
	#macro CAM_FLAG_UNUSED_7                0x0080
	#macro CAM_FLAG_UNUSED_8                0x0100
	#macro CAM_FLAG_COLLIDED_WITH_WALL      0x0200
	#macro CAM_FLAG_START_TRANSITION        0x0400
	#macro CAM_FLAG_TRANSITION_OUT_OF_C_UP  0x0800
	#macro CAM_FLAG_BLOCK_AREA_PROCESSING   0x1000
	#macro CAM_FLAG_UNUSED_13               0x2000
	#macro CAM_FLAG_UNUSED_CUTSCENE_ACTIVE  0x4000
	#macro CAM_FLAG_BEHIND_MARIO_POST_DOOR  0x8000

	#macro CAM_STATUS_NONE   0
	#macro CAM_STATUS_MARIO  1 << 0
	#macro CAM_STATUS_LAKITU 1 << 1
	#macro CAM_STATUS_FIXED  1 << 2
	#macro CAM_STATUS_C_DOWN 1 << 3
	#macro CAM_STATUS_C_UP   1 << 4

	#macro CAM_STATUS_MODE_GROUP   (CAM_STATUS_MARIO | CAM_STATUS_LAKITU | CAM_STATUS_FIXED)
	#macro CAM_STATUS_C_MODE_GROUP (CAM_STATUS_C_DOWN | CAM_STATUS_C_UP)

	#macro SHAKE_ATTACK         1
	#macro SHAKE_GROUND_POUND   2
	#macro SHAKE_SMALL_DAMAGE   3
	#macro SHAKE_MED_DAMAGE     4
	#macro SHAKE_LARGE_DAMAGE   5
	#macro SHAKE_HIT_FROM_BELOW 8
	#macro SHAKE_FALL_DAMAGE    9
	#macro SHAKE_SHOCK          10

	#macro SHAKE_ENV_EXPLOSION           1
	#macro SHAKE_ENV_BOWSER_THROW_BOUNCE 2
	#macro SHAKE_ENV_BOWSER_JUMP         3
	#macro SHAKE_ENV_UNUSED_5            5
	#macro SHAKE_ENV_UNUSED_6            6
	#macro SHAKE_ENV_UNUSED_7            7
	#macro SHAKE_ENV_PYRAMID_EXPLODE     8
	#macro SHAKE_ENV_JRB_SHIP_DRAIN      9
	#macro SHAKE_ENV_FALLING_BITS_PLAT   10

	#macro SHAKE_FOV_SMALL     1
	#macro SHAKE_FOV_UNUSED    2
	#macro SHAKE_FOV_MEDIUM    3
	#macro SHAKE_FOV_LARGE     4

	#macro SHAKE_POS_SMALL         1
	#macro SHAKE_POS_MEDIUM        2
	#macro SHAKE_POS_LARGE         3
	#macro SHAKE_POS_BOWLING_BALL  4

	#macro CUTSCENE_DOOR_PULL            130
	#macro CUTSCENE_DOOR_PUSH            131
	#macro CUTSCENE_ENTER_CANNON         133
	#macro CUTSCENE_ENTER_PAINTING       134
	#macro CUTSCENE_DEATH_EXIT           135
	#macro CUTSCENE_DOOR_WARP            139
	#macro CUTSCENE_DOOR_PULL_MODE       140
	#macro CUTSCENE_DOOR_PUSH_MODE       141
	#macro CUTSCENE_INTRO_PEACH          142
	#macro CUTSCENE_DANCE_ROTATE         143
	#macro CUTSCENE_ENTER_BOWSER_ARENA   144
	#macro CUTSCENE_0F_UNUSED            145 // Never activated, stub cutscene functions
	#macro CUTSCENE_UNUSED_EXIT          147 // Never activated
	#macro CUTSCENE_SLIDING_DOORS_OPEN   149
	#macro CUTSCENE_PREPARE_CANNON       150
	#macro CUTSCENE_UNLOCK_KEY_DOOR      151
	#macro CUTSCENE_STANDING_DEATH       152
	#macro CUTSCENE_DEATH_ON_STOMACH     153
	#macro CUTSCENE_DEATH_ON_BACK        154
	#macro CUTSCENE_QUICKSAND_DEATH      155
	#macro CUTSCENE_SUFFOCATION_DEATH    156
	#macro CUTSCENE_EXIT_BOWSER_SUCC     157
	#macro CUTSCENE_EXIT_BOWSER_DEATH    158 // Never activated
	#macro CUTSCENE_WATER_DEATH          159 // Not in cutscene switch
	#macro CUTSCENE_EXIT_PAINTING_SUCC   160
	#macro CUTSCENE_CAP_SWITCH_PRESS     161
	#macro CUTSCENE_DIALOG               162
	#macro CUTSCENE_RACE_DIALOG          163
	#macro CUTSCENE_ENTER_PYRAMID_TOP    164
	#macro CUTSCENE_DANCE_FLY_AWAY       165
	#macro CUTSCENE_DANCE_CLOSEUP        166
	#macro CUTSCENE_KEY_DANCE            167
	#macro CUTSCENE_SSL_PYRAMID_EXPLODE  168 // Never activated
	#macro CUTSCENE_EXIT_SPECIAL_SUCC    169
	#macro CUTSCENE_NONPAINTING_DEATH    170
	#macro CUTSCENE_READ_MESSAGE         171
	#macro CUTSCENE_ENDING               172
	#macro CUTSCENE_STAR_SPAWN           173
	#macro CUTSCENE_GRAND_STAR           174
	#macro CUTSCENE_DANCE_DEFAULT        175
	#macro CUTSCENE_RED_COIN_STAR_SPAWN  176
	#macro CUTSCENE_END_WAVING           177
	#macro CUTSCENE_CREDITS              178
	#macro CUTSCENE_EXIT_WATERFALL       179
	#macro CUTSCENE_EXIT_FALL_WMOTR      180
	#macro CUTSCENE_ENTER_POOL           181

	/**
	 * Stop the cutscene.
	 */
	#macro CUTSCENE_STOP         0x8000
	/**
	 * Play the current cutscene shot indefinitely (until canceled).
	 */
	#macro CUTSCENE_LOOP         0x7FFF

	#macro HAND_CAM_SHAKE_OFF                  0
	#macro HAND_CAM_SHAKE_CUTSCENE             1
	#macro HAND_CAM_SHAKE_UNUSED               2
	#macro HAND_CAM_SHAKE_HANG_OWL             3
	#macro HAND_CAM_SHAKE_HIGH                 4
	#macro HAND_CAM_SHAKE_STAR_DANCE           5
	#macro HAND_CAM_SHAKE_LOW                  6

	#macro DOOR_DEFAULT         0
	#macro DOOR_LEAVING_SPECIAL 1
	#macro DOOR_ENTER_LOBBY     2

	// Might rename these to reflect what they are used for instead "SET_45" etc.
	#macro CAM_FOV_SET_45      1
	#macro CAM_FOV_DEFAULT     2
	#macro CAM_FOV_APP_45      4
	#macro CAM_FOV_SET_30      5
	#macro CAM_FOV_APP_20      6
	#macro CAM_FOV_BBH         7
	#macro CAM_FOV_APP_80      9
	#macro CAM_FOV_APP_30      10
	#macro CAM_FOV_APP_60      11
	#macro CAM_FOV_ZOOM_30     12
	#macro CAM_FOV_SET_29      13

	#macro CAM_EVENT_CANNON              1
	#macro CAM_EVENT_SHOT_FROM_CANNON    2
	#macro CAM_EVENT_UNUSED_3            3
	#macro CAM_EVENT_BOWSER_INIT         4
	#macro CAM_EVENT_DOOR_WARP           5
	#macro CAM_EVENT_DOOR                6
	#macro CAM_EVENT_BOWSER_JUMP         7
	#macro CAM_EVENT_BOWSER_THROW_BOUNCE 8
	#macro CAM_EVENT_START_INTRO         9
	#macro CAM_EVENT_START_GRAND_STAR    10
	#macro CAM_EVENT_START_ENDING        11
	#macro CAM_EVENT_START_END_WAVING    12
	#macro CAM_EVENT_START_CREDITS       13

	globalvar sHandheldShakeInc,
	sHandheldShakeTimer,
	sHandheldShakeMag,
	sHandheldShakeSpline,
	sHandheldShakePitch,
	sHandheldShakeYaw,
	sHandheldShakeRoll;
	
	sHandheldShakeInc = 0.0;
	sHandheldShakeTimer = 0.0;
	sHandheldShakeMag = 0;
	sHandheldShakeSpline = array_create(4);
	for (var i = 0; i < 4; i++) {
	sHandheldShakeSpline[i] = {
		index: -1,
		pad: 0,
		point: Vec3s
	}
	}	
	sHandheldShakePitch = 0;
	sHandheldShakeYaw = 0;
	sHandheldShakeRoll = 0;
	
	globalvar gCameraMovementFlags;
	gCameraMovementFlags = 0;
	
	globalvar gPlayerCameraState;
	gPlayerCameraState = [new PlayerCameraStateInstance(), new PlayerCameraStateInstance()];

	#macro sMarioCamState (gPlayerCameraState[0])
	#macro sLuigiCamState (gPlayerCameraState[1])

	globalvar sFOVState;
	sFOVState = new FOVStateInstance();
	
	globalvar sMarioGeometry;
	sMarioGeometry = new MarioGeometryInstance();
	
	globalvar sModeTransition;
	sModeTransition = new ModeTransitionInstance();
	
	globalvar gLakituState;
	gLakituState = new LakituStateInstance();
	
	globalvar sOldPosition, sOldFocus;
	sOldPosition	= Vec3;
	sOldFocus		= Vec3;

	globalvar gCamera;
	gCamera = null;
	
	globalvar s2ndRotateFlags;
	s2ndRotateFlags = 0;
	
	globalvar sStatusFlags;
	sStatusFlags = CAM_FLAG_SMOOTH_MOVEMENT;
	
	globalvar gCutsceneTimer,
	sCutsceneShot,
	gCutsceneObjSpawn,
	gObjCutsceneDone,
	gCutsceneFocus,
	gSecondCameraFocus,
	sCButtonsPressed,
	sCameraSoundFlags,
	sCUpCameraPitch,
	sModeOffsetYaw,
	sSpiralStairsYawOffset,
	sLakituDist,
	sLakituPitch,
	sAreaYaw,
	sAreaYawChange,
	sPanDistance,
	sCannonYOffset,
	sZoomAmount,
	sZeroZoomDist,
	sBehindMarioSoundTimer,
	sCSideButtonYaw,
	s8DirModeBaseYaw,
	s8DirModeYawOffset;
	
	gCutsceneTimer			= 0;
	sCutsceneShot			= 0;
	gCutsceneObjSpawn		= 0;
	gObjCutsceneDone		= 0;
	gCutsceneFocus			= 0;
	gSecondCameraFocus		= null;
	sCButtonsPressed		= 0;
	sCameraSoundFlags		= 0;
	sCUpCameraPitch			= 0;
	sModeOffsetYaw			= 0;
	sSpiralStairsYawOffset	= 0;
	sLakituDist				= 0;
	sLakituPitch			= 0;
	sAreaYaw				= 0;
	sAreaYawChange			= 0;
	sPanDistance			= 0;
	sCannonYOffset			= 0;
	sZoomAmount				= 0;
	sZeroZoomDist			= 0;
	sBehindMarioSoundTimer	= 0;
	sCSideButtonYaw			= 0;
	s8DirModeBaseYaw		= 0;
	s8DirModeYawOffset		= 0;
	
	globalvar sCastleEntranceOffset, sPlayer2FocusOffset;
	sCastleEntranceOffset	= 0;
	sPlayer2FocusOffset		= 0;
	
	globalvar sAvoidYawVel;
	sAvoidYawVel			= 0;

	globalvar sSelectionFlags;
	sSelectionFlags = 0;

	globalvar sModeInfo;
	sModeInfo = new ModeTransitionInfo();

	globalvar gRecentCutscene;
	gRecentCutscene				= 0;
	
	globalvar sFramesSinceCutsceneEnded;
	sFramesSinceCutsceneEnded		= 0;

	globalvar sModeTransitions;
	sModeTransitions = [
		null,
		null,//update_radial_camera,
		null,//update_outward_radial_camera,
		null,//update_behind_mario_camera,
		update_mario_camera,
		null,//unused_update_mode_5_camera,
		update_c_up,//update_c_up,
		update_mario_camera,
		null,//nop_update_water_camera,
		null,//update_slide_or_0f_camera,
		null,//update_in_cannon,
		null,//update_boss_fight_camera,
		null,//update_parallel_tracking_camera,
		update_fixed_camera,
		null,//update_8_directions_camera,
		null,//update_slide_or_0f_camera,
		update_mario_camera,
		null,//update_spiral_stairs_camera
	];

	globalvar gCameraZoomDist;
	gCameraZoomDist  = 800;

	globalvar sCameraStoreCUp;
	sCameraStoreCUp = new CameraStoredInfo(Vec3, Vec3, 0, 0);

	globalvar sYawSpeed;
	sYawSpeed = 0;
	
	globalvar sFixedModeBasePosition,
	sUnusedModeBasePosition_2,
	sUnusedModeBasePosition_3,
	sUnusedModeBasePosition_4,
	sUnusedModeBasePosition_5;
	sFixedModeBasePosition    = [ 646.0, 143.0, -1513.0 ];
	sUnusedModeBasePosition_2 = [ 646.0, 143.0, -1513.0 ];
	sUnusedModeBasePosition_3 = [ 646.0, 143.0, -1513.0 ];
	sUnusedModeBasePosition_4 = [ 646.0, 143.0, -1513.0 ];
	sUnusedModeBasePosition_5 = [ 646.0, 143.0, -1513.0 ];

	globalvar sCameraTriggers;
	sCameraTriggers	= array_create(LEVEL_COUNT + 1, null);
	
	globalvar NULL_TRIGGER;
	NULL_TRIGGER		= new CameraTrigger( 0, null, 0, 0, 0, 0, 0, 0, 0 );
	
	globalvar sCamCastle;
	sCamCastle = [
    new CameraTrigger( 1, cam_castle_close_mode, -1100, 657, -1346, 300, 150, 300, 0 ),
    new CameraTrigger( 1, cam_castle_enter_lobby, -1099, 657, -803, 300, 150, 300, 0 ),
    new CameraTrigger( 1, cam_castle_close_mode, -2304, -264, -4072, 140, 150, 140, 0 ),
    new CameraTrigger( 1, cam_castle_close_mode, -2304, 145, -1344, 140, 150, 140, 0 ),
    new CameraTrigger( 1, cam_castle_enter_lobby, -2304, 145, -802, 140, 150, 140, 0 ),
    //! Sets the camera mode when leaving secret aquarium
    new CameraTrigger( 1, cam_castle_close_mode, 2816, 1200, -256, 100, 100, 100, 0 ),
    new CameraTrigger( 1, cam_castle_close_mode, 256, -161, -4226, 140, 150, 140, 0 ),
    new CameraTrigger( 1, cam_castle_close_mode, 256, 145, -1344, 140, 150, 140, 0 ),
    new CameraTrigger( 1, cam_castle_enter_lobby, 256, 145, -802, 140, 150, 140, 0 ),
    new CameraTrigger( 1, cam_castle_close_mode, -1023, 44, -4870, 140, 150, 140, 0 ),
    new CameraTrigger( 1, cam_castle_close_mode, -459, 145, -1020, 140, 150, 140, 0x6000 ),
    new CameraTrigger( 1, cam_castle_enter_lobby, -85, 145, -627, 140, 150, 140, 0 ),
    new CameraTrigger( 1, cam_castle_close_mode, -1589, 145, -1020, 140, 150, 140, -0x6000 ),
    new CameraTrigger( 1, cam_castle_enter_lobby, -1963, 145, -627, 140, 150, 140, 0 ),
    new CameraTrigger( 1, cam_castle_leave_lobby_sliding_door, -2838, 657, -1659, 200, 150, 150, 0x2000 ),
    new CameraTrigger( 1, cam_castle_enter_lobby_sliding_door, -2319, 512, -1266, 300, 150, 300, 0x2000 ),
    new CameraTrigger( 1, cam_castle_close_mode, 844, 759, -1657, 40, 150, 40, -0x2000 ),
    new CameraTrigger( 1, cam_castle_enter_lobby, 442, 759, -1292, 140, 150, 140, -0x2000 ),
    new CameraTrigger( 2, cam_castle_enter_spiral_stairs, -1000, 657, 1740, 200, 300, 200, 0 ),
    new CameraTrigger( 2, cam_castle_enter_spiral_stairs, -996, 1348, 1814, 200, 300, 200, 0 ),
    new CameraTrigger( 2, cam_castle_close_mode, -946, 657, 2721, 50, 150, 50, 0 ),
    new CameraTrigger( 2, cam_castle_close_mode, -996, 1348, 907, 50, 150, 50, 0 ),
    new CameraTrigger( 2, cam_castle_close_mode, -997, 1348, 1450, 140, 150, 140, 0 ),
    new CameraTrigger( 1, cam_castle_close_mode, -4942, 452, -461, 140, 150, 140, 0x4000 ),
    new CameraTrigger( 1, cam_castle_close_mode, -3393, 350, -793, 140, 150, 140, 0x4000 ),
    new CameraTrigger( 1, cam_castle_enter_lobby, -2851, 350, -792, 140, 150, 140, 0x4000 ),
    new CameraTrigger( 1, cam_castle_enter_lobby, 803, 350, -228, 140, 150, 140, -0x4000 ),
    //! Duplicate camera trigger outside JRB door
    new CameraTrigger( 1, cam_castle_enter_lobby, 803, 350, -228, 140, 150, 140, -0x4000 ),
    new CameraTrigger( 1, cam_castle_close_mode, 1345, 350, -229, 140, 150, 140, 0x4000 ),
    new CameraTrigger( 1, cam_castle_close_mode, -946, -929, 622, 300, 150, 300, 0 ),
    new CameraTrigger( 2, cam_castle_look_upstairs, -205, 1456, 2508, 210, 928, 718, 0 ),
    new CameraTrigger( 1, cam_castle_basement_look_downstairs, -1027, -587, -718, 318, 486, 577, 0 ),
    new CameraTrigger( 1, cam_castle_lobby_entrance, -1023, 376, 1830, 300, 400, 300, 0 ),
    new CameraTrigger( 3, cam_castle_hmc_start_pool_cutscene, 2485, -1689, -2659, 600, 50, 600, 0 ),
    NULL_TRIGGER
	];
	
	sCameraTriggers[LEVEL_CASTLE] = sCamCastle; // @TODO more camera triggers
	
	boot("camera_scripts_macros_init");
}

function ABS(x) { return ((x) > 0.0 ? (x) : -(x)); }
function ABS2(x) { return ((x) >= 0.0 ? (x) : -(x)); }

function CameraStoredInfo(_pos, _focus, _panDist, _cannonYOffset) constructor {
	pos				= _pos;
	focus			= _focus;
	panDist			= _panDist;
	cannonYOffset	= _cannonYOffset;
}

function ModeTransitionInfo(_newMode, _lastMode, __max, _frame, _transitionStart, _transitionEnd) constructor {
	newMode = _newMode;
	lastMode = _lastMode;
	_max = __max;
	frame = _frame;
	transitionStart = new LinearTransitionPoint(Vec3, Vec3, 0, 0, 0);
	transitionEnd = new LinearTransitionPoint(Vec3, Vec3, 0, 0, 0);
	
}

function LinearTransitionPoint(_focus, _pos, _dist, _pitch, _yaw) constructor {
	focus = _focus;
	pos = _pos;
	dist = _dist;
	pitch = _pitch;
	yaw = _yaw;
}
/**
 * Converts an angle in degrees to sm64's s16 angle units. For example, DEGREES(90) == 0x4000
 * This should be used mainly to make camera code clearer at first glance.
 */
function LEVEL_AREA_INDEX(levelNum, areaNum) {return (((levelNum) << 4) + (areaNum)); }

/**
 * Helper macro for defining which areas of a level should zoom out the camera when the game is paused.
 * Because a mask is used by two levels, the pattern will repeat when more than 4 areas are used by a level.
 */
function ZOOMOUT_AREA_MASK(level1Area1, level1Area2, level1Area3, level1Area4,
                          level2Area1, level2Area2, level2Area3, level2Area4) {
	return ((level2Area4) << 7 | (level2Area3) << 6 |(level2Area2) << 5 |(level2Area1) << 4|
	(level1Area4) << 3 |(level1Area3) << 2 |(level1Area2) << 1 |(level1Area1) << 0);
}

/// <pygml?v=1.0&h=721c165e2>
/// @function	set_camera_shake_from_hit(shake)
/// @desc		Starts a camera shake triggered by an interaction
/// @param		{s16}		shake
function set_camera_shake_from_hit(shake) {
    switch (shake) {
        // Makes the camera stop for a bit
        case (SHAKE_ATTACK):
            gLakituState.focHSpeed = 0;
            gLakituState.posHSpeed = 0;
            break;

        case (SHAKE_FALL_DAMAGE):
            set_camera_pitch_shake(0x60, 0x3, 0x8000);
            set_camera_roll_shake(0x60, 0x3, 0x8000);
            break;

        case (SHAKE_GROUND_POUND):
            set_camera_pitch_shake(0x60, 0xC, 0x8000);
            break;

        case (SHAKE_SMALL_DAMAGE):
            if (sMarioCamState.action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER)) {
                set_camera_yaw_shake(0x200, 0x10, 0x1000);
                set_camera_roll_shake(0x400, 0x20, 0x1000);
                set_fov_shake(0x100, 0x30, 0x8000);
            } else {
                set_camera_yaw_shake(0x80, 0x8, 0x4000);
                set_camera_roll_shake(0x80, 0x8, 0x4000);
                set_fov_shake(0x100, 0x30, 0x8000);
            }

            gLakituState.focHSpeed = 0;
            gLakituState.posHSpeed = 0;
            break;

        case (SHAKE_MED_DAMAGE):
            if (sMarioCamState.action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER)) {
                set_camera_yaw_shake(0x400, 0x20, 0x1000);
                set_camera_roll_shake(0x600, 0x30, 0x1000);
                set_fov_shake(0x180, 0x40, 0x8000);
            } else {
                set_camera_yaw_shake(0x100, 0x10, 0x4000);
                set_camera_roll_shake(0x100, 0x10, 0x4000);
                set_fov_shake(0x180, 0x40, 0x8000);
            }

            gLakituState.focHSpeed = 0;
            gLakituState.posHSpeed = 0;
            break;

        case (SHAKE_LARGE_DAMAGE):
            if (sMarioCamState.action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER)) {
                set_camera_yaw_shake(0x600, 0x30, 0x1000);
                set_camera_roll_shake(0x800, 0x40, 0x1000);
                set_fov_shake(0x200, 0x50, 0x8000);
            } else {
                set_camera_yaw_shake(0x180, 0x20, 0x4000);
                set_camera_roll_shake(0x200, 0x20, 0x4000);
                set_fov_shake(0x200, 0x50, 0x8000);
            }

            gLakituState.focHSpeed = 0;
            gLakituState.posHSpeed = 0;
            break;

        case (SHAKE_HIT_FROM_BELOW):
            gLakituState.focHSpeed = 0.07;
            gLakituState.posHSpeed = 0.07;
            break;

        case (SHAKE_SHOCK):
            set_camera_pitch_shake(random_float() * 64.0, 0x8, 0x8000);
            set_camera_yaw_shake(random_float() * 64.0, 0x8, 0x8000);
            break;
    }
}

/// <pygml?v=1.0&h=df03ef083>
/// @function	set_environmental_camera_shake(shake)
/// @desc		Start a shake from the environment
/// @param		{s16}		shake
function set_environmental_camera_shake(shake) {
    switch (shake) {
        case (SHAKE_ENV_EXPLOSION):
            set_camera_pitch_shake(0x60, 0x8, 0x4000);
            break;

        case (SHAKE_ENV_BOWSER_THROW_BOUNCE):
            set_camera_pitch_shake(0xC0, 0x8, 0x4000);
            break;

        case (SHAKE_ENV_BOWSER_JUMP):
            set_camera_pitch_shake(0x100, 0x8, 0x3000);
            break;

        case (SHAKE_ENV_UNUSED_6):
            set_camera_roll_shake(0x80, 0x10, 0x3000);
            break;

        case (SHAKE_ENV_UNUSED_7):
            set_camera_pitch_shake(0x20, 0x8, 0x8000);
            break;

        case (SHAKE_ENV_PYRAMID_EXPLODE):
            set_camera_pitch_shake(0x40, 0x8, 0x8000);
            break;

        case (SHAKE_ENV_JRB_SHIP_DRAIN):
            set_camera_pitch_shake(0x20, 0x8, 0x8000);
            set_camera_roll_shake(0x400, 0x10, 0x100);
            break;

        case (SHAKE_ENV_FALLING_BITS_PLAT):
            set_camera_pitch_shake(0x40, 0x2, 0x8000);
            break;

        case (SHAKE_ENV_UNUSED_5):
            set_camera_yaw_shake(-0x200, 0x80, 0x200);
            break;
    }
}

	
/// <pygml?v=1.0&h=ec2396a66>
/// @function	set_camera_shake_from_point(shake, posX, posY, posZ)
/// @desc		Starts a camera shake, but scales the amplitude by the
///					point's distance from the camera
/// @param		{s16}		shake
/// @param		{f32}		posX
/// @param		{f32}		posY
/// @param		{f32}		posZ
function set_camera_shake_from_point(shake, posX, posY, posZ) {
    switch (shake) {
        case (SHAKE_POS_BOWLING_BALL):
            set_pitch_shake_from_point(0x28, 0x8, 0x4000, 2000.0, posX, posY, posZ);
            break;

        case (SHAKE_POS_SMALL):
            set_pitch_shake_from_point(0x80, 0x8, 0x4000, 4000.0, posX, posY, posZ);
            set_fov_shake_from_point_preset(SHAKE_FOV_SMALL, posX, posY, posZ);
            break;

        case (SHAKE_POS_MEDIUM):
            set_pitch_shake_from_point(0xC0, 0x8, 0x4000, 6000.0, posX, posY, posZ);
            set_fov_shake_from_point_preset(SHAKE_FOV_MEDIUM, posX, posY, posZ);
            break;

        case (SHAKE_POS_LARGE):
            set_pitch_shake_from_point(0x100, 0x8, 0x3000, 8000.0, posX, posY, posZ);
            set_fov_shake_from_point_preset(SHAKE_FOV_LARGE, posX, posY, posZ);
            break;
    }
}

/// <pygml?v=1.0&h=1867f8920>
/// @function	shake_camera_handheld(pos, focus)
/// @desc		When sHandheldShakeMag is nonzero, this function adds small
///					random offsets to `focus` every time  sHandheldShakeTimer
///					increases above 1.0, simulating the camera shake caused by
///					unsteady hands.   This function must be called every frame
///					in order to actually apply the effect, since the effect's
///					mag and inc are set to 0 every frame at the end of this
///					function.
/// @param		{Vec3f}		pos
/// @param		{Vec3f}		focus
function shake_camera_handheld(pos, focus) {
    var i;
    var shakeOffset = Vec3f;
    var shakeSpline = array_create(4, Vec3f);
    var dist = 0;
    var pitch = 0;
    var yaw = 0;
    var unused = array_create(8);

    if (sHandheldShakeMag == 0) {
        vec3f_set(shakeOffset, 0.0, 0.0, 0.0);
    } else {
        for (i = 0; i < 4; i++) {
            shakeSpline[i][0] = sHandheldShakeSpline[i].point[0];
            shakeSpline[i][1] = sHandheldShakeSpline[i].point[1];
            shakeSpline[i][2] = sHandheldShakeSpline[i].point[2];
        }
        evaluate_cubic_spline(sHandheldShakeTimer, shakeOffset, shakeSpline[0],
            shakeSpline[1], shakeSpline[2], shakeSpline[3]);
			sHandheldShakeTimer += sHandheldShakeInc;
        if (1.0 <= sHandheldShakeTimer) {
            // The first 3 control points are always (0,0,0), so the random spline is always just a
            // straight line
            for (i = 0; i < 3; i++) {
                vec3s_copy(sHandheldShakeSpline[i].point, sHandheldShakeSpline[i + 1].point);
            }
            random_vec3s(sHandheldShakeSpline[3].point, sHandheldShakeMag, sHandheldShakeMag, sHandheldShakeMag / 2);
            sHandheldShakeTimer -= 1.0;

            // Code dead, this is set to be 0 before it is used.
            sHandheldShakeInc = random_float() * 0.5;
            if (sHandheldShakeInc < 0.02) {
                sHandheldShakeInc = 0.02;
            }
        }
    }

    approach_s16_asymptotic_bool(sHandheldShakePitch, shakeOffset[0], 0x08);
	sHandheldShakePitch = Ptr.p_current;
    approach_s16_asymptotic_bool(sHandheldShakeYaw, shakeOffset[1], 0x08);
	sHandheldShakeYaw = Ptr.p_current;
    approach_s16_asymptotic_bool(sHandheldShakeRoll, shakeOffset[2], 0x08);
	sHandheldShakeRoll = Ptr.p_current;

    if (sHandheldShakePitch | sHandheldShakeYaw) {
        vec3f_get_dist_and_angle(pos, focus, dist, pitch, yaw);
		dist = Ptr.p_dist;
		pitch = Ptr.p_pitch;
		yaw = Ptr.p_yaw;
        pitch += sHandheldShakePitch;
        yaw += sHandheldShakeYaw;
        vec3f_set_dist_and_angle(pos, focus, dist, pitch, yaw);
    }

    // Unless called every frame, the effect will stop after the first time.
    sHandheldShakeMag = 0;
    sHandheldShakeInc = 0.0;
}

/// <pygml?v=1.0&h=b8e72bb23>
/// @function	random_vec3s(dst, xRange, yRange, zRange)
/// @desc		Generate a vector with all three values about zero. The
///					three ranges determine how wide the range about zero.
/// @param		{Vec3s}		dst
/// @param		{s16}		xRange
/// @param		{s16}		yRange
/// @param		{s16}		zRange
function random_vec3s(dst, xRange, yRange, zRange) {
    var randomFloat;
    var unused = array_create(4);
    var tempXRange;
    var tempYRange;
    var tempZRange;

    randomFloat = random_float();
    tempXRange = xRange;
    dst[@ 0] = randomFloat * tempXRange - tempXRange / 2;

    randomFloat = random_float();
    tempYRange = yRange;
    dst[@ 1] = randomFloat * tempYRange - tempYRange / 2;

    randomFloat = random_float();
    tempZRange = zRange;
    dst[@ 2] = randomFloat * tempZRange - tempZRange / 2;
}


/// <pygml?v=1.0&h=e87fda3be>
/// @function	evaluate_cubic_spline(u, Q, a0, a1, a2, a3)
/// @desc		Produces values using a cubic b-spline curve. Basically Q is
///					the used output,  u is a value between 0 and 1 that
///					represents the position along the spline,  and a0-a3 are
///					parameters that define the spline.   The spline is described
///					at www2.cs.uregina.ca/~anima/408/Notes/Interpolation/Uniform
///					BSpline.htm
/// @param		{f32}		u
/// @param		{Vec3f}		Q
/// @param		{Vec3f}		a0
/// @param		{Vec3f}		a1
/// @param		{Vec3f}		a2
/// @param		{Vec3f}		a3
function evaluate_cubic_spline(u, Q, a0, a1, a2, a3) {
    var B = array_create(4);
    var _x;
    var _y;
    var _z;
    var unused = array_create(16);

    if (u > 1.0) {
        u = 1.0;
    }

    B[0] = (1.0 - u) * (1.0 - u) * (1.0 - u) / 6.0;
    B[1] = u * u * u / 2.0 - u * u + 0.6666667;
    B[2] = -u * u * u / 2.0 + u * u / 2.0 + u / 2.0 + 0.16666667;
    B[3] = u * u * u / 6.0;

    Q[@ 0] = B[0] * a0[@ 0] + B[1] * a1[@ 0] + B[2] * a2[@ 0] + B[3] * a3[@ 0];
    Q[@ 1] = B[0] * a0[@ 1] + B[1] * a1[@ 1] + B[2] * a2[@ 1] + B[3] * a3[@ 1];
    Q[@ 2] = B[0] * a0[@ 2] + B[1] * a1[@ 2] + B[2] * a2[@ 2] + B[3] * a3[@ 2];

    // Unused code
    B[0] = -0.5 * u * u + u - 0.33333333;
    B[1] = 1.5 * u * u - 2.0 * u - 0.5;
    B[2] = -1.5 * u * u + u + 1.0;
    B[3] = 0.5 * u * u - 0.16666667;

    _x = B[0] * a0[@ 0] + B[1] * a1[@ 0] + B[2] * a2[@ 0] + B[3] * a3[@ 0];
    _y = B[0] * a0[@ 1] + B[1] * a1[@ 1] + B[2] * a2[@ 1] + B[3] * a3[@ 1];
    _z = B[0] * a0[@ 2] + B[1] * a1[@ 2] + B[2] * a2[@ 2] + B[3] * a3[@ 2];

    unusedSplinePitch = atan2s(sqrt(_x * _x + _z * _z), _y);
    unusedSplineYaw = atan2s(_z, _x);
}



/// <pygml?v=1.0&h=02b564178>
/// @function	set_camera_pitch_shake(mag, decay, inc)
/// @desc		Start shaking the camera's pitch (up and down)
/// @param		{s16}		mag
/// @param		{s16}		decay
/// @param		{s16}		inc
function set_camera_pitch_shake(mag, decay, inc) {
    if (gLakituState.shakeMagnitude[0] < mag) {
        gLakituState.shakeMagnitude[0] = mag;
        gLakituState.shakePitchDecay = decay;
        gLakituState.shakePitchVel = inc;
    }
}

/// <pygml?v=1.0&h=c42aaf859>
/// @function	set_camera_yaw_shake(mag, decay, inc)
/// @desc		Start shaking the camera's yaw (side to side)
/// @param		{s16}		mag
/// @param		{s16}		decay
/// @param		{s16}		inc
function set_camera_yaw_shake(mag, decay, inc) {
    if (abs(mag) > abs(gLakituState.shakeMagnitude[1])) {
        gLakituState.shakeMagnitude[1] = mag;
        gLakituState.shakeYawDecay = decay;
        gLakituState.shakeYawVel = inc;
    }
}

/// <pygml?v=1.0&h=30df9eff1>
/// @function	set_camera_roll_shake(mag, decay, inc)
/// @desc		Start shaking the camera's roll (rotate screen clockwise and
///					counterclockwise)
/// @param		{s16}		mag
/// @param		{s16}		decay
/// @param		{s16}		inc
function set_camera_roll_shake(mag, decay, inc) {
    if (gLakituState.shakeMagnitude[2] < mag) {
        gLakituState.shakeMagnitude[2] = mag;
        gLakituState.shakeRollDecay = decay;
        gLakituState.shakeRollVel = inc;
    }
}
/// <pygml?v=1.0&h=ebdaa3bfe>
/// @function	set_pitch_shake_from_point(mag, decay, inc, maxDist, posX, posY, posZ)
/// @desc		Start shaking the camera's pitch, but reduce `mag` by it's
///					distance from the camera
/// @param		{s16}		mag
/// @param		{s16}		decay
/// @param		{s16}		inc
/// @param		{f32}		maxDist
/// @param		{f32}		posX
/// @param		{f32}		posY
/// @param		{f32}		posZ
function set_pitch_shake_from_point(mag, decay, inc, maxDist, posX, posY, posZ) {
    var pos = Vec3f;
    var dist = 0;
    var dummyPitch = 0;
    var dummyYaw = 0;

    pos[0] = posX;
    pos[1] = posY;
    pos[2] = posZ;
    vec3f_get_dist_and_angle(gLakituState.goalPos, pos, dist, dummyPitch, dummyYaw);
	dist = Ptr.p_dist;
	dummyPitch = Ptr.p_pitch;
	dummyYaw = Ptr.p_yaw;
    mag = reduce_by_dist_from_camera(mag, maxDist, posX, posY, posZ);
    if (mag != 0) {
        set_camera_pitch_shake(mag, decay, inc);
    }
}


/// <pygml?v=1.0&h=9573d73ec>
/// @function	set_yaw_shake_from_point(mag, decay, inc, maxDist, posX, posY, posZ)
/// @desc		Start shaking the camera's yaw, but reduce `mag` by it's
///					distance from the camera
/// @param		{s16}		mag
/// @param		{s16}		decay
/// @param		{s16}		inc
/// @param		{f32}		maxDist
/// @param		{f32}		posX
/// @param		{f32}		posY
/// @param		{f32}		posZ
function set_yaw_shake_from_point(mag, decay, inc, maxDist, posX, posY, posZ) {
    var pos= Vec3f;
    var dist = 0;
    var dummyPitch = 0;
    var dummyYaw = 0;

    pos[0] = posX;
    pos[1] = posY;
    pos[2] = posZ;
    vec3f_get_dist_and_angle(gLakituState.goalPos, pos, dist, dummyPitch, dummyYaw);
	dist = Ptr.p_dist;
	dummyPitch = Ptr.p_pitch;
	dummyYaw = Ptr.p_yaw;
    mag = reduce_by_dist_from_camera(mag, maxDist, posX, posY, posZ);
    if (mag != 0) {
        set_camera_yaw_shake(mag, decay, inc);
    }
}
/// <pygml?v=1.0&h=d29df2305>
/// @function	increment_shake_offset(Ptr.p_offset, increment)
/// @desc		Update the shake offset by `increment`
/// @param		{s16}		Ptr.p_offset
/// @param		{s16}		increment
function increment_shake_offset(offset, increment) {
    if (increment == -0x8000) {
        offset = (offset & 0x8000) + 0xC000;
    } else {
        offset += increment;
    }

    Ptr.p_offset = offset;
}

/// <pygml?v=1.0&h=c4d254774>
/// @function	shake_camera_pitch(pos, focus)
/// @desc		Apply a vertical shake to the camera by adjusting its pitch
/// @param		{Vec3f}		pos
/// @param		{Vec3f}		focus
function shake_camera_pitch(pos, focus) {
    var dist = 0;
    var pitch = 0;
    var yaw = 0;

    if (gLakituState.shakeMagnitude[0] | gLakituState.shakeMagnitude[1]) {
        vec3f_get_dist_and_angle(pos, focus, dist, pitch, yaw);
		dist = Ptr.p_dist;
		pitch = Ptr.p_pitch;
		yaw = Ptr.p_yaw;
        pitch += gLakituState.shakeMagnitude[0] * sins(gLakituState.shakePitchPhase);
        vec3f_set_dist_and_angle(pos, focus, dist, pitch, yaw);
        increment_shake_offset(gLakituState.shakePitchPhase, gLakituState.shakePitchVel);
		gLakituState.shakePitchPhase = Ptr.p_offset;
		
		camera_approach_s16_symmetric_bool(gLakituState.shakeMagnitude[0], 0,
                gLakituState.shakePitchDecay)
		gLakituState.shakeMagnitude[0] = Ptr.p_current;
        if (gLakituState.shakeMagnitude[0] == 0) {
            gLakituState.shakePitchPhase = 0;
        }
		
    }
}

/// <pygml?v=1.0&h=7400400e0>
/// @function	shake_camera_yaw(pos, focus)
/// @desc		Apply a horizontal shake to the camera by adjusting its yaw
/// @param		{Vec3f}		pos
/// @param		{Vec3f}		focus
function shake_camera_yaw(pos, focus) {
    var dist = 0;
    var pitch = 0;
    var yaw = 0;

    if (gLakituState.shakeMagnitude[1] != 0) {
        vec3f_get_dist_and_angle(pos, focus, dist, pitch, yaw);
		dist = Ptr.p_dist;
		pitch = Ptr.p_pitch;
		yaw = Ptr.p_yaw;
        yaw += gLakituState.shakeMagnitude[1] * sins(gLakituState.shakeYawPhase);
        vec3f_set_dist_and_angle(pos, focus, dist, pitch, yaw);
        increment_shake_offset(gLakituState.shakeYawPhase, gLakituState.shakeYawVel);
		gLakituState.shakeYawPhase = Ptr.p_offset;
		
		camera_approach_s16_symmetric_bool(gLakituState.shakeMagnitude[1], 0,
                gLakituState.shakeYawDecay);
		gLakituState.shakeMagnitude[1] = Ptr.p_current;
        if (gLakituState.shakeMagnitude[1] == 0) {
            gLakituState.shakeYawPhase = 0;
        }
		
		
    }
}

/// <pygml?v=1.0&h=3ab552ccf>
/// @function	shake_camera_roll(Ptr.p_roll)
/// @desc		Apply a rotational shake to the camera by adjusting its roll
/// @param		{s16}		Ptr.p_roll
function shake_camera_roll(roll) {
    var unused = array_create(8);

    if (gLakituState.shakeMagnitude[2] != 0) {
        increment_shake_offset(gLakituState.shakeRollPhase, gLakituState.shakeRollVel);
		gLakituState.shakeRollPhase = Ptr.p_offset;
        roll += gLakituState.shakeMagnitude[2] * sins(gLakituState.shakeRollPhase);
		
		camera_approach_s16_symmetric_bool(gLakituState.shakeMagnitude[2], 0,
                gLakituState.shakeRollDecay);
				
		gLakituState.shakeMagnitude[2] = Ptr.p_current;
        if (gLakituState.shakeMagnitude[2] == 0) {
            gLakituState.shakeRollPhase = 0;
        }
		
    }

    Ptr.p_roll = roll;
}



/// <pygml?v=1.0&h=595b1c00b>
/// @function	unused_set_camera_pitch_shake_env(shake)
/// @desc		Start a camera shake from an environmental source, but only
///					shake the camera's pitch.
/// @param		{s16}		shake
function unused_set_camera_pitch_shake_env(shake) {
    switch (shake) {
        case (SHAKE_ENV_EXPLOSION):
            set_camera_pitch_shake(0x60, 0x8, 0x4000);
            break;

        case (SHAKE_ENV_BOWSER_THROW_BOUNCE):
            set_camera_pitch_shake(0xC0, 0x8, 0x4000);
            break;

        case (SHAKE_ENV_BOWSER_JUMP):
            set_camera_pitch_shake(0x100, 0x8, 0x3000);
            break;
    }
}

	
	/// <pygml?v=1.0&h=33964be27>
	/// @function	update_mario_camera(c, focus, pos)
	/// @desc		Used in sModeTransitions for CLOSE and FREE_ROAM mode
	/// @param		{struct}	c
	/// @param		{Vec3f}		focus
	/// @param		{Vec3f}		pos
	/// @returns	s32
	function update_mario_camera(c, focus, pos) {
	    var yaw = sMarioCamState.faceAngle[1] + sModeOffsetYaw + DEGREES(180);
	    focus_on_mario(focus, pos, 125.0, 125.0, gCameraZoomDist, 0x05B0, yaw);

	    return sMarioCamState.faceAngle[1];
	}


		
    function select_mario_cam_mode() {
        sSelectionFlags = CAM_MODE_MARIO_SELECTED;
    }
	
	
	/// <pygml?v=1.0&h=4c8633b05>
	/// @function	clamp_pitch(Ptr.CALLvec3f_set_dist_and_angle, from, to, maxPitch, minPitch)
	/// @param		{Vec3f}		Ptr.CALLvec3f_set_dist_and_anglefrom
	/// @param		{Vec3f}		to
	/// @param		{s16}		maxPitch
	/// @param		{s16}		minPitch
	/// @returns	s32
	function clamp_pitch(from, to, maxPitch, minPitch) {
	    var outOfRange = 0;
	    var pitch = 0;
	    var yaw = 0;
	    var dist = 0;

	    vec3f_get_dist_and_angle(from, to, dist, pitch, yaw);
		dist = Ptr.p_dist;
		pitch = Ptr.p_pitch;
		yaw = Ptr.p_yaw;
	    if (pitch > maxPitch) {
	        pitch = maxPitch;
	        outOfRange++;
	    }
	    if (pitch < minPitch) {
	        pitch = minPitch;
	        outOfRange++;
	    }
	    //vec3f_set_dist_and_angle(from, to, dist, pitch, yaw);
	    return outOfRange;
	}
	


    function calc_abs_dist(a, b) {
        var distX = b[0] - a[0]
        var distY = b[1] - a[1]
        var distZ = b[2] - a[2]
        return sqrt((distX * distX + distY * distY + distZ * distZ));
    }

    function is_within_100_units_of_mario(posX, posY, posZ) {
        var pos = [posX, posY, posZ]
        return calc_abs_dist(sMarioCamState.pos, pos) < 100;
    }

    function calculate_yaw(from, to) {
        var dx = to[0] - from[0];
        var dz = to[2] - from[2];
        return atan2s(dz, dx);
    }

    function rotate_in_xz(dst, src, yaw) {
        var tempVec = src;

        dst[@ 0] = tempVec[2] * sins(yaw) + tempVec[0] * coss(yaw);
        dst[@ 1] = tempVec[1];
        dst[@ 2] = tempVec[2] * coss(yaw) - tempVec[0] * sins(yaw);
    }

    function offset_rotated(dst, from, to, rotation) {
        var pitchRotated = Vec3;


        pitchRotated[2] = -(to[2] * coss(rotation[0]) - to[1] * sins(rotation[0]));
        pitchRotated[1] = to[2] * sins(rotation[0]) + to[1] * coss(rotation[0]);
        pitchRotated[0] = to[0];

        dst[@ 0] = from[0] + pitchRotated[2] * sins(rotation[1]) + pitchRotated[0] * coss(rotation[1]);
        dst[@ 1] = from[1] + pitchRotated[1];
        dst[@ 2] = from[2] + pitchRotated[2] * coss(rotation[1]) - pitchRotated[0] * sins(rotation[1]);
    }
	
	function find_mario_floor_and_ceil(pg) {
        var surf = new ObjectDummy();
        var tempCheckingSurfaceCollisionsForCamera = gCheckingSurfaceCollisionsForCamera;
        gCheckingSurfaceCollisionsForCamera = true;

        if (find_floor(sMarioCamState.pos[0], sMarioCamState.pos[1] + 10.0, sMarioCamState.pos[2], surf) != -11000) {
			pg.currFloorType = surf._floor.type;
        } else {
            pg.currFloorType = 0;
        }

        pg.currCeilType = 0;

        gCheckingSurfaceCollisionsForCamera = false;

        var floorWrapper = new ObjectDummy();
        pg.currFloorHeight = find_floor(sMarioCamState.pos[0], sMarioCamState.pos[1] + 10.0, sMarioCamState.pos[2], floorWrapper);
        pg.currFloor = floorWrapper._floor;
        pg.currCeilHeight = 20000;
        pg.waterHeight = -999999;
        gCheckingSurfaceCollisionsForCamera = tempCheckingSurfaceCollisionsForCamera;
    }
	
	function approach_asymptotic_bool(currentWrapper, target, multiplier) {
		multiplier = min(multiplier, 1);
        currentWrapper.current = currentWrapper.current + (target - currentWrapper.current) * multiplier
        return !(abs(currentWrapper.current-target)<0.01);
    }
	
	/// <pygml?v=1.0&h=7a4443632>
	/// @function	set_or_approach_s16_symmetric(Ptr.p_current, target, increment)
	/// @param		{s16}		Ptr.p_current
	/// @param		{s16}		target
	/// @param		{s16}		increment
	/// @returns	s32
	function set_or_approach_s16_symmetric(current, target, increment) {
	    if (sStatusFlags & CAM_FLAG_SMOOTH_MOVEMENT) {
	        camera_approach_s16_symmetric_bool(current, target, increment);
	    } else {
	        current = target;
	    }
	    if (current == target) {
	        Ptr.p_current = current;
	        return false;
	    } else {
	        Ptr.p_current = current;
	        return true;
	    }
	}
	

	function camera_approach_symmetric_bool(currentWrapper, target, increment) {
        var dist = target - currentWrapper.current;

        if (increment < 0) {
            increment = -1 * increment;
        }
        if (dist > 0) {
            dist -= increment;
            if (dist >= 0) {
                currentWrapper.current = target - dist;
            } else {
                currentWrapper.current = target;
            }
        } else {
            dist += increment;
            if (dist <= 0) {
                currentWrapper.current = target - dist;
            } else {
                currentWrapper.current = target;
            }
        }

        return !(abs(currentWrapper.current-target)<0.01);
    }
	
	function scale_along_line(dst, from, to, scale) {

        dst[@ 0] = (to[0] - from[0]) * scale + from[0];
        dst[@ 1] = (to[1] - from[1]) * scale + from[1];
        dst[@ 2] = (to[2] - from[2]) * scale + from[2];

    }
	
	function approach_camera_height(c, goal, inc) {
        if (sStatusFlags & CAM_FLAG_SMOOTH_MOVEMENT) {
            if (c.pos[1] < goal) {
				c.pos[1] += inc;
                if (c.pos[1] > goal) {
                    c.pos[1] = goal;
                }
            } else {
				c.pos[1] -= inc;
                if (c.pos[1] < goal) {
                    c.pos[1] = goal;
                }
            }
        } else {
            c.pos[1] = goal;
        }
    }

	
	function reset_camera(c) {
        gCamera = c;
        gCameraMovementFlags = 0;
        s2ndRotateFlags = 0;
        sStatusFlags = 0;
        gCutsceneTimer = 0;
        sCutsceneShot = 0;
        gCutsceneObjSpawn = 0;
        gObjCutsceneDone = false;
        gCutsceneFocus = null;

        gSecondCameraFocus = null;
        sCButtonsPressed = 0;
        sModeTransition.marioPos = sMarioCamState.pos;
        sModeTransition.framesLeft = 0;

        gCameraMovementFlags |= CAM_MOVE_INIT_CAMERA;
        sStatusFlags = 0;

        sCameraSoundFlags = 0;
        sCUpCameraPitch = 0;
        sModeOffsetYaw = 0;
        sSpiralStairsYawOffset = 0;
        sLakituDist = 0;
        sLakituPitch = 0;
        sAreaYaw = 0;
        sAreaYawChange = 0;
        sPanDistance = 0;
        sCannonYOffset = 0;
        sZoomAmount = 0;
        sZeroZoomDist = 0;

        sBehindMarioSoundTimer = 0;
        sCSideButtonYaw = 0;
        s8DirModeBaseYaw = 0;
        s8DirModeYawOffset = 0;
		c.doorStatus = DOOR_DEFAULT;

        sMarioCamState.headRotation[0] = 0;
        sMarioCamState.headRotation[1] = 0;

        sMarioCamState.cameraEvent = 0;
        sMarioCamState.usedObj = null;

        gLakituState.lastFrameAction = 0;
        sFOVState.fovFunc = CAM_FOV_DEFAULT;
        sFOVState.fov = 45;
        sFOVState.fovOffset = 0;
    }
	
	function create_camera(graphNode) {
		
        var mode = graphNode.config.mode;

		graphNode.config.camera = new ObjectDummy();
		graphNode.config.camera.mode = mode;
		graphNode.config.camera.defMode = mode;
		graphNode.config.camera.cutscene = 0;
		graphNode.config.camera.doorStatus = DOOR_DEFAULT;
		graphNode.config.camera.areaCenX = graphNode.focus[0];
		graphNode.config.camera.areaCenY = graphNode.focus[1];
		graphNode.config.camera.areaCenZ = graphNode.focus[2];
		graphNode.config.camera.yaw = 0;
		graphNode.config.camera.pos = graphNode.pos;
		graphNode.config.camera.focus = graphNode.focus;


    }
	
	function init_camera(c) {
		
		// @zinit
		sMarioGeometry.currFloorHeight = 0
		sMarioGeometry.currCeilHeight = 0;
		sMarioGeometry.currFloor = null;
		sMarioGeometry.currCeil = null;
		sMarioGeometry.currFloorType = 0;
		sMarioGeometry.currCeilType = 0;
		
        sCreditsPlayer2Pitch = 0;
        sCreditsPlayer2Yaw = 0;
        gPrevLevel = gCurrLevelArea / 16;
        gCurrLevelArea = gCurrLevelNum * 16 + gCurrentArea.index;
		sSelectionFlags = 0;
        sSelectionFlags &= CAM_MODE_MARIO_SELECTED;
        
        gLakituState.mode = c.mode;
        gLakituState.defMode = c.defMode;
        gLakituState.posHSpeed = 0.3;
        gLakituState.posVSpeed = 0.3;
        gLakituState.focHSpeed = 0.8;
        gLakituState.focHSpeed = 0.3; // @bug set focHSpeed back-to-back
        gLakituState.roll = 0;
        gLakituState.keyDanceRoll = 0;

        sStatusFlags &= ~CAM_FLAG_SMOOTH_MOVEMENT;

        sCastleEntranceOffset	= Vec3;
        sPlayer2FocusOffset		= Vec3;


        find_mario_floor_and_ceil(sMarioGeometry);
        sMarioGeometry.prevFloorHeight	= sMarioGeometry.currFloorHeight;
        sMarioGeometry.prevCeilHeight	= sMarioGeometry.currCeilHeight;
        sMarioGeometry.prevFloor		= sMarioGeometry.currFloor;
        sMarioGeometry.prevCeil			= sMarioGeometry.currCeil;
        sMarioGeometry.prevFloorType	= sMarioGeometry.currFloorType;
        sMarioGeometry.prevCeilType		= sMarioGeometry.currCeilType;

	
	    sHandheldShakeInc = 0.0;
	    sHandheldShakeTimer = 0.0;
	    sHandheldShakeMag = 0;
	    for (i = 0; i < 4; i++) {
	        sHandheldShakeSpline[i].index = -1;
	    }
	    sHandheldShakePitch = 0;
	    sHandheldShakeYaw = 0;
	    sHandheldShakeRoll = 0;
		
        c.cutscene = 0;
        var marioOffset = [0, 125, 400];

        switch (gCurrLevelNum) {
			// @TODO make gLakituState authentic
            case(LEVEL_CASTLE_GROUNDS):
                //if (!is_within_100_units_of_mario(-1328, 260, 4646)) {
                //    marioOffset[0] = -400;
                //    marioOffset[2] = -1500;
                //}
                gLakituState.mode = CAMERA_MODE_FREE_ROAM;
                break;
            case(LEVEL_BOB):
                gLakituState.mode = CAMERA_MODE_FREE_ROAM;
                break;
            case(LEVEL_WF):
                gLakituState.mode = CAMERA_MODE_FREE_ROAM;
                break;
            case(LEVEL_PSS):
                gLakituState.mode = CAMERA_MODE_FREE_ROAM;
                break;
            case(LEVEL_TTM):
                gLakituState.mode = CAMERA_MODE_FREE_ROAM;
                break;
            case(LEVEL_JRB):
                gLakituState.mode = CAMERA_MODE_FREE_ROAM;
                break;
            case(LEVEL_BBH):
                gLakituState.mode = CAMERA_MODE_FREE_ROAM;
                break;
            case(LEVEL_CCM):
                gLakituState.mode = CAMERA_MODE_FREE_ROAM;
                break;
            case(LEVEL_BITDW):
                gLakituState.mode = CAMERA_MODE_FREE_ROAM;
                break;
            case(LEVEL_SSL):
                gLakituState.mode = CAMERA_MODE_FREE_ROAM;
                break;
            case(LEVEL_CASTLE):
                gLakituState.mode = CAMERA_MODE_FIXED;
                marioOffset[2] = 150.0;
                break;
			default:
				throw("\ndefine camera for gCurrLevelNum");
			break;
        }

        if (c.mode == CAMERA_MODE_8_DIRECTIONS) {
            gCameraMovementFlags |= CAM_MOVE_ZOOMED_OUT;
        }

        offset_rotated(c.pos, sMarioCamState.pos, marioOffset, sMarioCamState.faceAngle);
        if (c.mode != CAMERA_MODE_BEHIND_MARIO) {
			var _floor = {};
            c.pos[1] = find_floor(sMarioCamState.pos[0], sMarioCamState.pos[1] + 100, sMarioCamState.pos[2], _floor) + 125;
			_floor = _floor._floor;
        }
	    vec3f_copy(c.focus, sMarioCamState.pos);
	    vec3f_copy(gLakituState.curPos, c.pos);
	    vec3f_copy(gLakituState.curFocus, c.focus);
	    vec3f_copy(gLakituState.goalPos, c.pos);
	    vec3f_copy(gLakituState.goalFocus, c.focus);
	    vec3f_copy(gLakituState.pos, c.pos);
	    vec3f_copy(gLakituState.focus, c.focus);
	    if (c.mode == CAMERA_MODE_FIXED) {
	        set_fixed_cam_axis_sa_lobby(c.mode);
	    }
	    store_lakitu_cam_info_for_c_up(c);
	    gLakituState.yaw = calculate_yaw(c.focus, c.pos);
	    gLakituState.nextYaw = gLakituState.yaw;
	    c.yaw = gLakituState.yaw;
	    c.nextYaw = gLakituState.yaw;
    }
	
	/// <pygml?v=1.0&h=5de29a007>
	/// @function	mode_fixed_camera(c)
	/// @desc		Fixed camera mode, the camera rotates around a point and
	///					looks and zooms toward Mario.
	/// @param		{struct}	c
	function mode_fixed_camera(c) {

	    if (gCurrLevelNum == LEVEL_BBH) {
	        set_fov_function(CAM_FOV_BBH);
	    } else {
	        set_fov_function(CAM_FOV_APP_45);
	    }
	    c.nextYaw = update_fixed_camera(c, c.focus, c.pos);
	    c.yaw = c.nextYaw;
	    pan_ahead_of_player(c);
	    vec3f_set(sCastleEntranceOffset, 0.0, 0.0, 0.0);
	}
	
	/// <pygml?v=1.0&h=b05236aec>
	/// @function	update_fixed_camera(c, focus, pos)
	/// @desc		Updates the camera during fixed mode.
	/// @param		{struct}	c
	/// @param		{Vec3f}		focus
	/// @param		{Vec3f}		pos
	/// @returns	s32
	function update_fixed_camera(c, focus, pos) {
	    var focusFloorOff = 0;
	    var goalHeight = 0;
	    var ceilHeight = 0;
	    var heightOffset = 0;
	    var distCamToFocus = 0;
	    var filler2 = array_create(8);
	    var scaleToMario = 0.5;
	    var pitch = 0;
	    var yaw = 0;
	    var faceAngle = Vec3s;
	    var ceiling = 0;
	    var basePos = Vec3f;
	    var filler = array_create(12);

	    play_camera_buzz_if_c_sideways();
		
		var _AREA_RR				= AREA_RR;
		var _AREA_CASTLE_LOBBY		= AREA_CASTLE_LOBBY;
		var _AREA_BBH				= AREA_BBH;

	    // Don't move closer to Mario in these areas
	    switch (gCurrLevelArea) {
	        case (_AREA_RR):
	            scaleToMario = 0.0;
	            heightOffset = 0.0;
	            break;

	        case (_AREA_CASTLE_LOBBY):
	            scaleToMario = 0.3;
	            heightOffset = 0.0;
	            break;

	        case (_AREA_BBH):
	            scaleToMario = 0.0;
	            heightOffset = 0.0;
	            break;
	    }

	    handle_c_button_movement(c);
	    play_camera_buzz_if_cdown();

	    calc_y_to_curr_floor(focusFloorOff, 1.0, 200.0, focusFloorOff, 0.9, 200.0);
	    vec3f_copy(focus, sMarioCamState.pos);
	    focus[@ 1] += focusFloorOff + 125.0;
	    vec3f_get_dist_and_angle(focus, c.pos, distCamToFocus, faceAngle[0], faceAngle[1]);
		distCamToFocus = Ptr.p_dist;
		faceAngle[0] = Ptr.p_pitch;
		faceAngle[1] = Ptr.p_yaw;
	    faceAngle[2] = 0;

	    vec3f_copy(basePos, sFixedModeBasePosition);
	    vec3f_add(basePos, sCastleEntranceOffset);

	    if (sMarioGeometry.currFloorType != SURFACE_DEATH_PLANE &&
	        sMarioGeometry.currFloorHeight != FLOOR_LOWER_LIMIT) {
	        goalHeight = sMarioGeometry.currFloorHeight + basePos[1] + heightOffset;
	    } else {
	        goalHeight = gLakituState.goalPos[1];
	    }

	    if (300 > distCamToFocus) {
	        goalHeight += 300 - distCamToFocus;
	    }

	    ceilHeight = find_ceil(c.pos[0], goalHeight - 100.0, c.pos[2], ceiling);
	    if (ceilHeight != CELL_HEIGHT_LIMIT) {
			ceilHeight -= 125.0;
	        if (goalHeight > ceilHeight) {
	            goalHeight = ceilHeight;
	        }
	    }

	    if (sStatusFlags & CAM_FLAG_SMOOTH_MOVEMENT) {
	        camera_approach_f32_symmetric_bool(c.pos[1], goalHeight, 15.0);
			c.pos[@ 1] = Ptr.p_current;
	    } else {
	        if (goalHeight < sMarioCamState.pos[1] - 500.0) {
	            goalHeight = sMarioCamState.pos[1] - 500.0;
	        }
	        c.pos[@ 1] = goalHeight;
	    }

	    c.pos[@ 0] = basePos[0] + (sMarioCamState.pos[0] - basePos[0]) * scaleToMario;
	    c.pos[@ 2] = basePos[2] + (sMarioCamState.pos[2] - basePos[2]) * scaleToMario;

	    if (scaleToMario != 0.0) {
	        vec3f_get_dist_and_angle(c.focus, c.pos, distCamToFocus, pitch, yaw);
			distCamToFocus = Ptr.p_dist;
			pitch = Ptr.p_pitch;
			yaw = Ptr.p_yaw;
	        if (distCamToFocus > 1000.0) {
	            distCamToFocus = 1000.0;
	            vec3f_set_dist_and_angle(c.focus, c.pos, distCamToFocus, pitch, yaw);
	        }
	    }

	    return faceAngle[1];
	}



	/// <pygml?v=1.0&h=38ca39f9a>
	/// @function	set_fixed_cam_axis_sa_lobby(preset)
	/// @desc		Set the fixed camera base pos depending on the current level
	///					area
	/// @param		{s16}		preset
	function set_fixed_cam_axis_sa_lobby(preset) {
		var _AREA_SA = AREA_SA;
		var _AREA_CASTLE_LOBBY = AREA_CASTLE_LOBBY;
	    switch (gCurrLevelArea) {
	        case (_AREA_SA):
	            vec3f_set(sFixedModeBasePosition, 646.0, 143.0, -1513.0);
	            break;

	        case (_AREA_CASTLE_LOBBY):
	            vec3f_set(sFixedModeBasePosition, -577.0, 143.0, 1443.0);
	            break;
	    }
	}

	/// <pygml?v=1.0&h=2c134bc63>
	/**
	 * Enter the fixed-mode castle lobby. A trigger for this is placed in every entrance so that the camera
	 * changes to fixed mode.
	 */
	function cam_castle_enter_lobby(c) {
	    if (c.mode != CAMERA_MODE_FIXED) {
	        sStatusFlags &= ~CAM_FLAG_SMOOTH_MOVEMENT;
	        set_fixed_cam_axis_sa_lobby(c.mode);
	        c.mode = CAMERA_MODE_FIXED;
	    }
	}


	
	/// <pygml?v=1.0&h=6cc76aa37>
	/// @function	cam_select_alt_mode(selection)
	/// @desc		If `selection` is 0, just get the current selection  If
	///					`selection` is 1, select 'Mario' as the alt mode.  If
	///					`selection` is 2, select 'fixed' as the alt mode.   @return
	///					the current selection
	/// @param		{s32}		selection
	/// @returns	s32
	function cam_select_alt_mode(selection) {
	    var mode = CAM_SELECTION_FIXED;

	    if (selection == CAM_SELECTION_MARIO) {
	        if (!(sSelectionFlags & CAM_MODE_MARIO_SELECTED)) {
	            sSelectionFlags |= CAM_MODE_MARIO_SELECTED;
	        }
	        sCameraSoundFlags |= CAM_SOUND_UNUSED_SELECT_MARIO;
	    }

	    // The alternate mode is up-close, but the player just selected fixed in the pause menu
	    if (selection == CAM_SELECTION_FIXED && (sSelectionFlags & CAM_MODE_MARIO_SELECTED)) {
	        // So change to normal mode in case the user paused in up-close mode
	        set_cam_angle(CAM_ANGLE_LAKITU);
	        sSelectionFlags &= ~CAM_MODE_MARIO_SELECTED;
	        sCameraSoundFlags |= CAM_SOUND_UNUSED_SELECT_FIXED;
	    }

	    if (sSelectionFlags & CAM_MODE_MARIO_SELECTED) {
	        mode = CAM_SELECTION_MARIO;
	    }
	    return mode;
	}

	
	/// <pygml?v=1.0&h=8aee860bf>
	/// @function	update_camera_hud_status(c)
	/// @desc		Determine which icon to show on the HUD
	/// @param		{struct}	c
	/// @returns	s32
	function update_camera_hud_status(c) {
	    var status = CAM_STATUS_NONE;

	    if (c.cutscene != 0 ||
	        ((gPlayer1Controller.buttonDown & R_TRIG) && cam_select_alt_mode(0) == CAM_SELECTION_FIXED)) {
	        status |= CAM_STATUS_FIXED;
	    } else if (set_cam_angle(0) == CAM_ANGLE_MARIO) {
	        status |= CAM_STATUS_MARIO;
	    } else {
	        status |= CAM_STATUS_LAKITU;
	    }
	    if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
	        status |= CAM_STATUS_C_DOWN;
	    }
	    if (gCameraMovementFlags & CAM_MOVE_C_UP_MODE) {
	        status |= CAM_STATUS_C_UP;
	    }
	    set_hud_camera_status(status); 
	    return status;
	}

	
/// <pygml?v=1.0&h=e9ed287e8>
/// @function	update_camera(c)
/// @desc		The main camera update function.  Gets controller input,
///					checks for cutscenes, handles mode changes, and moves the
///					camera
/// @param		{struct}	c
function update_camera(c) {
    var unused = array_create(24);

    gCamera = c;
    update_camera_hud_status(c);
    if (c.cutscene == 0) {
        // Only process R_TRIG if 'fixed' is not selected in the menu
        if (cam_select_alt_mode(0) == CAM_SELECTION_MARIO) {
            if (gPlayer1Controller.buttonPressed & R_TRIG) {
                if (set_cam_angle(0) == CAM_ANGLE_LAKITU) {
                    set_cam_angle(CAM_ANGLE_MARIO);
                } else {
                    set_cam_angle(CAM_ANGLE_LAKITU);
                }
            }
        }
        play_sound_if_cam_switched_to_lakitu_or_mario();
    }

    // Initialize the camera
    sStatusFlags &= ~CAM_FLAG_FRAME_AFTER_CAM_INIT;
    if (gCameraMovementFlags & CAM_MOVE_INIT_CAMERA) {
        init_camera(c);
        gCameraMovementFlags &= ~CAM_MOVE_INIT_CAMERA;
        sStatusFlags |= CAM_FLAG_FRAME_AFTER_CAM_INIT;
    }

    // Store previous geometry information
    sMarioGeometry.prevFloorHeight = sMarioGeometry.currFloorHeight;
    sMarioGeometry.prevCeilHeight = sMarioGeometry.currCeilHeight;
    sMarioGeometry.prevFloor = sMarioGeometry.currFloor;
    sMarioGeometry.prevCeil = sMarioGeometry.currCeil;
    sMarioGeometry.prevFloorType = sMarioGeometry.currFloorType;
    sMarioGeometry.prevCeilType = sMarioGeometry.currCeilType;

    find_mario_floor_and_ceil(sMarioGeometry);
    gCheckingSurfaceCollisionsForCamera = true;
    vec3f_copy(c.pos, gLakituState.goalPos);
    vec3f_copy(c.focus, gLakituState.goalFocus);

    c.yaw = gLakituState.yaw;
    c.nextYaw = gLakituState.nextYaw;
    c.mode = gLakituState.mode;
    c.defMode = gLakituState.defMode;
	
	camera_course_processing(c);

    //stub_camera_3(c);
    sCButtonsPressed = find_c_buttons_pressed(sCButtonsPressed, gPlayer1Controller.buttonPressed,
        gPlayer1Controller.buttonDown);

    if (c.cutscene != 0) {
        sYawSpeed = 0; // @zazz
        play_cutscene(c);
        sFramesSinceCutsceneEnded = 0;
    } else {
        // Clear the recent cutscene after 8 frames
        if (gRecentCutscene != 0 && sFramesSinceCutsceneEnded < 8) {
            sFramesSinceCutsceneEnded++;
            if (sFramesSinceCutsceneEnded >= 8) {
                gRecentCutscene = 0;
                sFramesSinceCutsceneEnded = 0;
            }
        }
    }
    // If not in a cutscene, do mode processing
    if (c.cutscene == 0) {
        sYawSpeed = 0x400;

        if (sSelectionFlags & CAM_MODE_MARIO_ACTIVE) {
            switch (c.mode) {
                case (CAMERA_MODE_BEHIND_MARIO):
                    mode_behind_mario_camera(c);
                    break;

                case (CAMERA_MODE_C_UP):
                    mode_c_up_camera(c);
                    break;

                case (CAMERA_MODE_WATER_SURFACE):
                    mode_water_surface_camera(c);
                    break;

                case (CAMERA_MODE_INSIDE_CANNON):
                    mode_cannon_camera(c);
                    break;

                default:
                    mode_mario_camera(c);
            }
        } else {
            switch (c.mode) {
                case (CAMERA_MODE_BEHIND_MARIO):
                    mode_behind_mario_camera(c);
                    break;

                case (CAMERA_MODE_C_UP):
                    mode_c_up_camera(c);
                    break;

                case (CAMERA_MODE_WATER_SURFACE):
                    mode_water_surface_camera(c);
                    break;

                case (CAMERA_MODE_INSIDE_CANNON):
                    mode_cannon_camera(c);
                    break;

                case (CAMERA_MODE_8_DIRECTIONS):
                    mode_8_directions_camera(c);
                    break;

                case (CAMERA_MODE_RADIAL):
                    mode_radial_camera(c);
                    break;

                case (CAMERA_MODE_OUTWARD_RADIAL):
                    mode_outward_radial_camera(c);
                    break;

                case (CAMERA_MODE_CLOSE):
                    mode_lakitu_camera(c);
                    break;

                case (CAMERA_MODE_FREE_ROAM):
                    mode_lakitu_camera(c);
                    break;
                case (CAMERA_MODE_BOSS_FIGHT):
                    mode_boss_fight_camera(c);
                    break;

                case (CAMERA_MODE_PARALLEL_TRACKING):
                    mode_parallel_tracking_camera(c);
                    break;

                case (CAMERA_MODE_SLIDE_HOOT):
                    mode_slide_camera(c);
                    break;

                case (CAMERA_MODE_FIXED):
                    mode_fixed_camera(c);
                    break;

                case (CAMERA_MODE_SPIRAL_STAIRS):
                    mode_spiral_stairs_camera(c);
                    break;
            }
        }
    }



    // Start any Mario-related cutscenes
    //start_cutscene(c, get_cutscene_from_mario_status(c)); // @z
    //stub_camera_2(c);
    gCheckingSurfaceCollisionsForCamera = false;
    if (gCurrLevelNum != LEVEL_CASTLE) {
        // If fixed camera is selected as the alternate mode, then fix the camera as long as the right
        // trigger is held
        if ((c.cutscene == 0 &&
                (gPlayer1Controller.buttonDown & R_TRIG) && cam_select_alt_mode(0) == CAM_SELECTION_FIXED) ||
            (gCameraMovementFlags & CAM_MOVE_FIX_IN_PLACE) ||
            (sMarioCamState.action) == ACT_GETTING_BLOWN) {

            // If this is the first frame that R_TRIG is held, play the "click" sound
            if (c.cutscene == 0 && (gPlayer1Controller.buttonPressed & R_TRIG) &&
                cam_select_alt_mode(0) == CAM_SELECTION_FIXED) {
                sCameraSoundFlags |= CAM_SOUND_FIXED_ACTIVE;
                play_sound_rbutton_changed();
            }

            // Fixed mode only prevents Lakitu from moving. The camera pos still updates, so
            // Lakitu will fly to his next position as normal whenever R_TRIG is released.
            gLakituState.posHSpeed = 0.0;
            gLakituState.posVSpeed = 0.0;

            c.nextYaw = calculate_yaw(gLakituState.focus, gLakituState.pos);
            c.yaw = c.nextYaw;
            gCameraMovementFlags &= ~CAM_MOVE_FIX_IN_PLACE;
        } else {
            // Play the "click" sound when fixed mode is released
            if (sCameraSoundFlags & CAM_SOUND_FIXED_ACTIVE) {
                play_sound_rbutton_changed();
                sCameraSoundFlags &= ~CAM_SOUND_FIXED_ACTIVE;
            }
        }
    } else {
        if ((gPlayer1Controller.buttonPressed & R_TRIG) && cam_select_alt_mode(0) == CAM_SELECTION_FIXED) {
            play_sound_button_change_blocked();
        }
    }

    update_lakitu(c);

    gLakituState.lastFrameAction = sMarioCamState.action;
}

	
	function calc_hor_dist(a, b) {
        var distX = b[0] - a[0];
        var distZ = b[2] - a[2];
        return sqrt((distX * distX + distZ * distZ));
    }
	
	function calc_y_to_curr_floor(posOffWrapper, posMul, posBound, focOffWrapper, focMul, focBound) {
        var floorHeight = sMarioGeometry.currFloorHeight;
        var waterHeight = -99999;

        if (!(sMarioCamState.action & ACT_FLAG_METAL_WATER)) {
            if (floorHeight < (waterHeight)) {
                floorHeight = waterHeight;
            }
        }

        var marioObj = gMarioState;

        if (sMarioCamState.action & ACT_FLAG_ON_POLE) {
            var pole = marioObj.usedObj;
            var poleHitboxHeight = pole.hitboxHeight;

            if (sMarioGeometry.currFloorHeight >= pole.rawData[oPosY] && sMarioCamState.pos[1] < 0.7 * poleHitboxHeight + pole.rawData[oPosY]) {
                posBound = 1200;
            }
        }

        posOffWrapper.posOff = (floorHeight - sMarioCamState.pos[1]) * posMul;

        if (posOffWrapper.posOff > posBound) {
            posOffWrapper.posOff = posBound;
        }

        if (posOffWrapper.posOff < -posBound) {
            posOffWrapper.posOff = -posBound;
        }

        focOffWrapper.focOff = (floorHeight - sMarioCamState.pos[1]) * posMul;

        if (focOffWrapper.focOff > focBound) {
            focOffWrapper.focOff = focBound;
        }

        if (focOffWrapper.focOff < -focBound) {
            focOffWrapper.focOff = -focBound;
        }
    }
	
	function pan_ahead_of_player(c) {

        var pan = Vec3;

        // Get distance and angle from camera to mario.
		var dist = 0;
		var pitch = 0;
		var yaw = 0;
		
        vec3f_get_dist_and_angle(c.pos, sMarioCamState.pos, dist, pitch, yaw);
		dist	= Ptr.p_dist;
		pitch	= Ptr.p_pitch;
		yaw		= Ptr.p_yaw;
		
		delete output;

        // The camera will pan ahead up to about 30% of the camera's distance to mario.
        pan[2] = sins(0xC00) * dist;

        rotate_in_xz(pan, pan, sMarioCamState.faceAngle[1]);
        // rotate in the opposite direction
        yaw = -yaw;
        rotate_in_xz(pan, pan, yaw);
        // Only pan left or right
        pan[2] = 0;

        // If mario is long jumping, or on a flag pole (but not at the top), then pan in the opposite direction
        if (sMarioCamState.action == ACT_LONG_JUMP ||
            (sMarioCamState.action != ACT_TOP_OF_POLE && (sMarioCamState.action & ACT_FLAG_ON_POLE))) {
            pan[0] = -pan[0];
        }

        // Slowly make the actual pan, sPanDistance, approach the calculated pan
        // If mario is sleeping, then don't pan
        var wrapper = new ObjectDummy();
		wrapper.current = sPanDistance;
        if (sStatusFlags & CAM_FLAG_SLEEPING) {
            approach_asymptotic_bool(wrapper, 0, 0.025);
        } else {
            approach_asymptotic_bool(wrapper, pan[0], 0.025);
        }

        sPanDistance = wrapper.current;
		
		delete wrapper;

        // Now apply the pan. It's a dir vector to the left or right, rotated by the camera's yaw to mario
        pan[0] = sPanDistance;
        yaw = -yaw;
        rotate_in_xz(pan, pan, yaw);
        vec3f_add(c.focus, pan);
    }
	
	/// <pygml?v=1.0&h=971953ec6>
	/// @function	update_default_camera(c)
	/// @desc		Update the camera in default, close, and free roam mode
	///					The camera moves behind Mario, and can rotate all the way
	///					around
	/// @param		{struct}	c
	/// @returns	s16
	function update_default_camera(c) {
	    var tempPos = Vec3f;
	    var cPos = Vec3f;
	    var unused1 = array_create(12);
	    var marioFloor = 0;
	    var cFloor = 0;
	    var tempFloor = {};
	    var _ceil = null;
	    var camFloorHeight = 0;
	    var tempFloorHeight = 0;
	    var marioFloorHeight = 0;
	    var unused2 = array_create(4);
	    var dist = 0;
	    var zoomDist = 0;
	    var waterHeight = 0;
	    var gasHeight = 0;
	    var avoidYaw = 0;
	    var pitch = 0;
	    var yaw = 0;
	    var yawGoal = sMarioCamState.faceAngle[1] + DEGREES(180);
	    var posHeight = 0;
	    var focHeight = 0;
	    var distFromWater;
	    var tempPitch = 0;
	    var tempYaw = 0;
	    var xzDist = 0;
	    var unused4 = array_create(4);
	    var nextYawVel = 0;
	    var yawVel = 0;
	    var scale = 0;
	    var avoidStatus = 0;
	    var closeToMario = 0;
	    var ceilHeight = find_ceil(gLakituState.goalPos[0],
	        gLakituState.goalPos[1],
	        gLakituState.goalPos[2], _ceil);
	    var yawDir = 0;

	    handle_c_button_movement(c);
	    vec3f_get_dist_and_angle(sMarioCamState.pos, c.pos, dist, pitch, yaw);
		dist = Ptr.p_dist;
		pitch = Ptr.p_pitch;
		yaw = Ptr.p_yaw;

	    // If C-Down is active, determine what distance the camera should be from Mario
	    if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
	        //! In Mario mode, the camera is zoomed out further than in Lakitu mode (1400 vs 1200)
	        if (set_cam_angle(0) == CAM_ANGLE_MARIO) {
	            zoomDist = gCameraZoomDist + 1050;
	        } else {
	            zoomDist = gCameraZoomDist + 400;
	        }
	    } else {
	        zoomDist = gCameraZoomDist;
	    }

	    if (sMarioCamState.action & ACT_FLAG_HANGING ||
	        sMarioCamState.action == ACT_RIDING_HOOT) {
	        zoomDist *= 0.8;
	        set_handheld_shake(HAND_CAM_SHAKE_HANG_OWL);
	    }

	    // If not zooming out, only allow dist to decrease
	    if (sZoomAmount == 0.0) {
	        if (dist > zoomDist) {
				dist -= 50.0;
	            if (dist < zoomDist) {
	                dist = zoomDist;
	            }
	        }
	    } else {
			sZoomAmount -= 30.0;
	        if (sZoomAmount < 0.0) {
	            sZoomAmount = 0.0;
	        }
	        if (dist > zoomDist) {
				dist -= 30.0;
	            if (dist < zoomDist) {
	                dist = zoomDist;
	            }
	        }
	        if (dist < zoomDist) {
				dist += 30.0;
	            if (dist > zoomDist) {
	                dist = zoomDist;
	            }
	        }
	    }

	    // Determine how fast to rotate the camera
	    if (sCSideButtonYaw == 0) {
	        if (c.mode == CAMERA_MODE_FREE_ROAM) {
	            nextYawVel = 0xC0;
	        } else {
	            nextYawVel = 0x100;
	        }
	        if ((gPlayer1Controller.stickX != 0.0 || gPlayer1Controller.stickY != 0.0) != 0) {
	            nextYawVel = 0x20;
	        }
	    } else {
	        if (sCSideButtonYaw < 0) {
	            yaw += 0x200;
	        }
	        if (sCSideButtonYaw > 0) {
	            yaw -= 0x200;
	        }
	        camera_approach_s16_symmetric_bool(sCSideButtonYaw, 0, 0x100);
			sCSideButtonYaw = Ptr.p_current;
	        nextYawVel = 0;
	    }
	    sYawSpeed = 0x400;
	    xzDist = calc_hor_dist(sMarioCamState.pos, c.pos);

	    if (sStatusFlags & CAM_FLAG_BEHIND_MARIO_POST_DOOR) {
	        if (xzDist >= 250) {
	            sStatusFlags &= ~CAM_FLAG_BEHIND_MARIO_POST_DOOR;
	        }
	        if (abs((sMarioCamState.faceAngle[1] - yaw) / 2) < 0x1800) {
	            sStatusFlags &= ~CAM_FLAG_BEHIND_MARIO_POST_DOOR;
	            yaw = sCameraYawAfterDoorCutscene + DEGREES(180);
	            dist = 800.0;
	            sStatusFlags |= CAM_FLAG_BLOCK_SMOOTH_MOVEMENT;
	        }
	    } else if (xzDist < 250) {
	        // Turn rapidly if very close to Mario
	        c.pos[0] += (250 - xzDist) * sins(yaw);
	        c.pos[2] += (250 - xzDist) * coss(yaw);
	        if (sCSideButtonYaw == 0) {
	            nextYawVel = 0x1000;
	            sYawSpeed = 0;
	            vec3f_get_dist_and_angle(sMarioCamState.pos, c.pos, dist, pitch, yaw);
				dist = Ptr.p_dist;
				pitch = Ptr.p_pitch;
				yaw = Ptr.p_yaw;
	        }
	        closeToMario |= 1;
	    }

	    if (-16 < gPlayer1Controller.stickY) {
	        c.yaw = yaw;
	    }

	    calc_y_to_curr_floor(posHeight, 1, 200, focHeight, 0.9, 200);
	    vec3f_copy(cPos, c.pos);
	    avoidStatus = rotate_camera_around_walls(c, cPos, avoidYaw, 0x600);
	    // If a wall is blocking the view of Mario, then rotate in the calculated direction
	    if (avoidStatus == 3) {
	        unusedFreeRoamWallYaw = avoidYaw;
	        sAvoidYawVel = yaw;
	        sStatusFlags |= CAM_FLAG_COLLIDED_WITH_WALL;
	        //! Does nothing
	        vec3f_get_dist_and_angle(sMarioCamState.pos, cPos, xzDist, tempPitch, tempYaw);
			xzDist = Ptr.p_dist;
			tempPitch = Ptr.p_pitch;
			tempYaw = Ptr.p_yaw;
	        // Rotate to avoid the wall
	        approach_s16_asymptotic_bool(yaw, avoidYaw, 10);
			yaw = Ptr.p_current;
	        //! Does nothing
	        vec3f_set_dist_and_angle(sMarioCamState.pos, cPos, xzDist, tempPitch, tempYaw);
	        sAvoidYawVel = (sAvoidYawVel - yaw) / 0x100;
	    } else {
	        if (gMarioStates[0].forwardVel == 0.0) {
	            if (sStatusFlags & CAM_FLAG_COLLIDED_WITH_WALL) {
	                if ((yawGoal - yaw) / 0x100 >= 0) {
	                    yawDir = -1;
	                } else {
	                    yawDir = 1;
	                }
	                if ((sAvoidYawVel > 0 && yawDir > 0) || (sAvoidYawVel < 0 && yawDir < 0)) {
	                    yawVel = nextYawVel;
	                }
	            } else {
	                yawVel = nextYawVel;
	            }
	        } else {
	            if (nextYawVel == 0x1000) {
	                yawVel = nextYawVel;
	            }
	            sStatusFlags &= ~CAM_FLAG_COLLIDED_WITH_WALL;
	        }

	        // If a wall is near the camera, turn twice as fast
	        if (avoidStatus != 0) {
	            yawVel += yawVel;
	        }
	        // ...Unless the camera already rotated from being close to Mario
	        if ((closeToMario & 1) && avoidStatus != 0) {
	            yawVel = 0;
	        }
	        if (yawVel != 0 && get_dialog_id() == -1) {
	            camera_approach_s16_symmetric_bool(yaw, yawGoal, yawVel);
				yaw = Ptr.p_current;
	        }
	    }

	    // Only zoom out if not obstructed by walls and Lakitu hasn't collided with any
	    if (avoidStatus == 0 && !(sStatusFlags & CAM_FLAG_COLLIDED_WITH_WALL)) {
	        approach_f32_asymptotic_bool(dist, zoomDist - 100.0, 0.05);
			dist = Ptr.p_current;
	    }
	    vec3f_set_dist_and_angle(sMarioCamState.pos, cPos, dist, pitch, yaw);
	    cPos[1] += posHeight + 125.0;

	    // Move the camera away from walls and set the collision flag
	    if (collide_with_walls(cPos, 10.0, 80.0) != 0) { // @zazz
	        sStatusFlags |= CAM_FLAG_COLLIDED_WITH_WALL;
	    }

	    c.focus[0] = sMarioCamState.pos[0];
	    c.focus[1] = sMarioCamState.pos[1] + 125.0 + focHeight;
	    c.focus[2] = sMarioCamState.pos[2];

	    marioFloorHeight = 125.0 + sMarioGeometry.currFloorHeight;
	    marioFloor = sMarioGeometry.currFloor;
	    camFloorHeight = find_floor(cPos[0], cPos[1] + 50.0, cPos[2], cFloor) + 125.0;
		cFloor = cFloor._floor;
	    for (scale = 0.1; scale < 1.0; scale += 0.2) {
	        scale_along_line(tempPos, cPos, sMarioCamState.pos, scale);
	        tempFloorHeight = find_floor(tempPos[0], tempPos[1], tempPos[2], tempFloor) + 125.0;
			
	        if (tempFloor != null && tempFloorHeight > marioFloorHeight) {
				tempFloor = tempFloor._floor;
	            marioFloorHeight = tempFloorHeight;
	            marioFloor = tempFloor;
	        }
	    }

	    // Lower the camera in Mario mode
	    if (sSelectionFlags & CAM_MODE_MARIO_ACTIVE) {
	        marioFloorHeight -= 35.0;
	        camFloorHeight -= 35.0;
	        c.focus[1] -= 25.0;
	    }

	    // If there's water below the camera, decide whether to keep the camera above the water surface
	    waterHeight = find_water_level(cPos[0], cPos[2]);
	    if (waterHeight != FLOOR_LOWER_LIMIT) {
	        waterHeight += 125.0;
	        distFromWater = waterHeight - marioFloorHeight;
	        if (!(gCameraMovementFlags & CAM_MOVE_METAL_BELOW_WATER)) {
	            if (distFromWater > 800.0 && (sMarioCamState.action & ACT_FLAG_METAL_WATER)) {
	                gCameraMovementFlags |= CAM_MOVE_METAL_BELOW_WATER;
	            }
	        } else {
	            if (distFromWater < 400.0 || !(sMarioCamState.action & ACT_FLAG_METAL_WATER)) {
	                gCameraMovementFlags &= ~CAM_MOVE_METAL_BELOW_WATER;
	            }
	        }
	        // If not wearing the metal cap, always stay above
	        if (!(gCameraMovementFlags & CAM_MOVE_METAL_BELOW_WATER) && camFloorHeight < waterHeight) {
	            camFloorHeight = waterHeight;
	        }
	    } else {
	        gCameraMovementFlags &= ~CAM_MOVE_METAL_BELOW_WATER;
	    }

	    cPos[1] = camFloorHeight;
	    vec3f_copy(tempPos, cPos);
	    tempPos[1] -= 125.0;
	    if (marioFloor != null && camFloorHeight <= marioFloorHeight) {
	        avoidStatus = is_range_behind_surface(c.focus, tempPos, marioFloor, 0, -1);
	        if (avoidStatus != 1 && ceilHeight > marioFloorHeight) {
	            camFloorHeight = marioFloorHeight;
	        }
	    }

	    posHeight = 0.0;
	    if (c.mode == CAMERA_MODE_FREE_ROAM) {
	        if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
	            posHeight = 375.0;
	            if (gCurrLevelArea == AREA_SSL_PYRAMID) {
	                posHeight /= 2;
	            }
	        } else {
	            posHeight = 100.0;
	        }
	    }
	    if ((gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) && (sSelectionFlags & CAM_MODE_MARIO_ACTIVE)) {
	        posHeight = 610.0;
	        if (gCurrLevelArea == AREA_SSL_PYRAMID || gCurrLevelNum == LEVEL_CASTLE) {
	            posHeight /= 2;
	        }
	    }

	    // Make Lakitu fly above the gas
	    gasHeight = find_poison_gas_level(cPos[0], cPos[2]);
	    if (gasHeight != FLOOR_LOWER_LIMIT) {
			gasHeight += 130.0;
	        if (gasHeight > c.pos[1]) {
	            c.pos[1] = gasHeight;
	        }
	    }

	    if (sMarioCamState.action & ACT_FLAG_HANGING || sMarioCamState.action == ACT_RIDING_HOOT) {
	        camFloorHeight = sMarioCamState.pos[1] + 400.0;
	        if (c.mode == CAMERA_MODE_FREE_ROAM) {
	            camFloorHeight -= 100.0;
	        }
	        ceilHeight = CELL_HEIGHT_LIMIT;
	        vec3f_copy(c.focus, sMarioCamState.pos);
	    }

	    if (sMarioCamState.action & ACT_FLAG_ON_POLE) {
	        camFloorHeight = gMarioStates[0].usedObj.rawData[oPosY] + 125.0;
	        if (sMarioCamState.pos[1] - 100.0 > camFloorHeight) {
	            camFloorHeight = sMarioCamState.pos[1] - 100.0;
	        }
	        ceilHeight = CELL_HEIGHT_LIMIT;
	        vec3f_copy(c.focus, sMarioCamState.pos);
	    }
	    if (camFloorHeight != FLOOR_LOWER_LIMIT) {
	        camFloorHeight += posHeight;
	        approach_camera_height(c, camFloorHeight, 20.0);
	    }
	    c.pos[0] = cPos[0];
	    c.pos[2] = cPos[2];
	    cPos[0] = gLakituState.goalPos[0];
	    cPos[1] = c.pos[1];
	    cPos[2] = gLakituState.goalPos[2];
	    vec3f_get_dist_and_angle(cPos, c.pos, dist, tempPitch, tempYaw);
		dist = Ptr.p_dist;
		tempPitch = Ptr.p_pitch;
		tempYaw = Ptr.p_yaw;
	    // Prevent the camera from lagging behind too much
	    if (dist > 50.0) {
	        dist = 50.0;
	        vec3f_set_dist_and_angle(cPos, c.pos, dist, tempPitch, tempYaw);
	    }
	    if (sMarioGeometry.currFloorType != SURFACE_DEATH_PLANE) {
	        vec3f_get_dist_and_angle(c.focus, c.pos, dist, tempPitch, tempYaw);
			dist = Ptr.p_dist;
			tempPitch = Ptr.p_pitch;
			tempYaw = Ptr.p_yaw;
	        if (dist > zoomDist) {
	            dist = zoomDist;
	            vec3f_set_dist_and_angle(c.focus, c.pos, dist, tempPitch, tempYaw);
	        }
	    }
	    if (ceilHeight != CELL_HEIGHT_LIMIT) {
			ceilHeight -= 150.0;
	        if (c.pos[1] > ceilHeight &&
	            (avoidStatus = is_range_behind_surface(c.pos, sMarioCamState.pos, _ceil, 0, -1)) == 1) {
	            c.pos[1] = ceilHeight;
	        }
	    }
	    if (gCurrLevelArea == AREA_WDW_TOWN) {
	        yaw = clamp_positions_and_find_yaw(c.pos, c.focus, 2254.0, -3789.0, 3790.0, -2253.0);
	    }
	    return yaw;
	}

	
	function mode_default_camera(c) {
        sFOVState.fovFunc = CAM_FOV_DEFAULT;
        c.nextYaw = update_default_camera(c);
        pan_ahead_of_player(c);
    }

    function mode_lakitu_camera(c) {
        gCameraZoomDist = 800;
        mode_default_camera(c);
    }

/// <pygml?v=1.0&h=cadc5a7dd>
/// @function	next_lakitu_state(newPos, newFoc, curPos, curFoc, oldPos, oldFoc, yaw)
/// @param		{Vec3f}		newPos
/// @param		{Vec3f}		newFoc
/// @param		{Vec3f}		curPos
/// @param		{Vec3f}		curFoc
/// @param		{Vec3f}		oldPos
/// @param		{Vec3f}		oldFoc
/// @param		{s16}		yaw
/// @returns	s16
function next_lakitu_state(newPos, newFoc, curPos, curFoc, oldPos, oldFoc, yaw) {
    var yawVelocity = 0;
    var pitchVelocity = 0;
    var distVelocity = 0;
    var goalDist = 0;
    var unusedDist = 0;
    var goalPitch = 0;
    var goalYaw = 0;
    var unusedPitch = 0;
    var unusedYaw = 0;
    var distTimer = sModeTransition.framesLeft;
    var angleTimer = sModeTransition.framesLeft;
    var inTransition = 0;
    var nextPos = Vec3;
    var nextFoc = Vec3;
    var startPos = Vec3;
    var startFoc = Vec3;
    var i = 0;
    var floorHeight = 0;
    var _floor = {};

    // If not transitioning, just use gCamera's current pos and foc
    vec3f_copy(newPos, curPos);
    vec3f_copy(newFoc, curFoc);

    if (sStatusFlags & CAM_FLAG_START_TRANSITION) {
        for (i = 0; i < 3; i++) {
            // Add Mario's displacement from this frame to the last frame's pos and focus
            // Makes the transition start from where the camera would have moved
            startPos[i] = oldPos[@ i] + sMarioCamState.pos[i] - sModeTransition.marioPos[i];
            startFoc[i] = oldFoc[@ i] + sMarioCamState.pos[i] - sModeTransition.marioPos[i];
        }


        vec3f_get_dist_and_angle(curFoc, startFoc, sModeTransition.focDist, sModeTransition.focPitch,
            sModeTransition.focYaw);
			sModeTransition.focDist = Ptr.p_dist;
			sModeTransition.focPitch = Ptr.p_dist;
			sModeTransition.focYaw = Ptr.p_dist;
        vec3f_get_dist_and_angle(curFoc, startPos, sModeTransition.posDist, sModeTransition.posPitch,
            sModeTransition.posYaw);
			sModeTransition.posDist = Ptr.p_dist;
			sModeTransition.posPitch = Ptr.p_dist;
			sModeTransition.posYaw = Ptr.p_dist;
        sStatusFlags &= ~CAM_FLAG_START_TRANSITION;
    }

    // Transition from the last mode to the current one
    if (sModeTransition.framesLeft > 0) {
        inTransition = 1;

        vec3f_get_dist_and_angle(curFoc, curPos, goalDist, goalPitch, goalYaw);
		goalDist = Ptr.p_dist;
		goalPitch = Ptr.p_pitch;
		goalYaw = Ptr.p_yaw;
        distVelocity = ABS(goalDist - sModeTransition.posDist) / distTimer;
        pitchVelocity = ABS(goalPitch - sModeTransition.posPitch) / angleTimer;
        yawVelocity = ABS(goalYaw - sModeTransition.posYaw) / angleTimer;

        camera_approach_f32_symmetric_bool(sModeTransition.posDist, goalDist, distVelocity);
		sModeTransition.posDist = Ptr.p_current;
        camera_approach_s16_symmetric_bool(sModeTransition.posYaw, goalYaw, yawVelocity);
		sModeTransition.posYaw = Ptr.p_current;
        camera_approach_s16_symmetric_bool(sModeTransition.posPitch, goalPitch, pitchVelocity);
		sModeTransition.posPitch = Ptr.p_current;
        vec3f_set_dist_and_angle(curFoc, nextPos, sModeTransition.posDist, sModeTransition.posPitch,
            sModeTransition.posYaw);

        vec3f_get_dist_and_angle(curPos, curFoc, goalDist, goalPitch, goalYaw);
		goalDist = Ptr.p_dist;
		goalPitch = Ptr.p_pitch;
		goalYaw = Ptr.p_yaw;
        pitchVelocity = sModeTransition.focPitch / sModeTransition.framesLeft;
        yawVelocity = sModeTransition.focYaw / sModeTransition.framesLeft;
        distVelocity = sModeTransition.focDist / sModeTransition.framesLeft;

        camera_approach_s16_symmetric_bool(sModeTransition.focPitch, goalPitch, pitchVelocity);
		sModeTransition.focPitch = Ptr.p_current;
        camera_approach_s16_symmetric_bool(sModeTransition.focYaw, goalYaw, yawVelocity);
		sModeTransition.focYaw = Ptr.p_current;
        camera_approach_f32_symmetric_bool(sModeTransition.focDist, 0, distVelocity);
		sModeTransition.focDist = Ptr.p_current;
        vec3f_set_dist_and_angle(curFoc, nextFoc, sModeTransition.focDist, sModeTransition.focPitch,
            sModeTransition.focYaw);

        vec3f_copy(newFoc, nextFoc);
        vec3f_copy(newPos, nextPos);

        if (gCamera.cutscene != 0 || !(gCameraMovementFlags & CAM_MOVE_C_UP_MODE)) {
            floorHeight = find_floor(newPos[@ 0], newPos[@ 1], newPos[@ 2], _floor)
            _floor = _floor._floor;
            if (floorHeight != FLOOR_LOWER_LIMIT) {
				floorHeight += 125.0
                if (floorHeight > newPos[@ 1]) {
                    newPos[@ 1] = floorHeight;
                }
            }
            f32_find_wall_collision(newPos[@ 0], newPos[@ 1], newPos[@ 2], 0.0, 100.0);
			newPos[@ 0] = Ptr.p_xPtr;
			newPos[@ 1] = Ptr.p_yPtr;
			newPos[@ 2] = Ptr.p_zPtr;
        }
        sModeTransition.framesLeft--;
        yaw = calculate_yaw(newFoc, newPos);
    } else {
        sModeTransition.posDist = 0.0;
        sModeTransition.posPitch = 0;
        sModeTransition.posYaw = 0;
        sStatusFlags &= ~CAM_FLAG_TRANSITION_OUT_OF_C_UP;
    }
    vec3f_copy(sModeTransition.marioPos, sMarioCamState.pos);
    return yaw;
}

	
	function update_lakitu(c) {

        var newPos = Vec3;
		var newFoc = Vec3;
		

        if (gCameraMovementFlags & CAM_MOVE_PAUSE_SCREEN) { }
        else {
            var newYaw = next_lakitu_state(newPos, newFoc, c.pos, c.focus, sOldPosition, sOldFocus, c.nextYaw);

            set_or_approach_s16_symmetric(c.yaw, newYaw, sYawSpeed);
            c.yaw = Ptr.p_current;
			
            sStatusFlags &= ~CAM_FLAG_UNUSED_CUTSCENE_ACTIVE;

            // Update old state
	        vec3f_copy(sOldPosition, newPos);
	        vec3f_copy(sOldFocus, newFoc);

            gLakituState.yaw = c.yaw;
            gLakituState.nextYaw = c.nextYaw;
	        vec3f_copy(gLakituState.goalPos, c.pos);
	        vec3f_copy(gLakituState.goalFocus, c.focus);

            // Simulate lakitu flying to the new position and turning towards the new focus
            set_or_approach_vec3f_asymptotic(gLakituState.curPos, newPos,
                                                 gLakituState.posHSpeed, gLakituState.posVSpeed,
                                                 gLakituState.posHSpeed);
            set_or_approach_vec3f_asymptotic(gLakituState.curFocus, newFoc,
                                                 gLakituState.focHSpeed, gLakituState.focVSpeed,
                                                 gLakituState.focHSpeed);


	        set_or_approach_f32_asymptotic(gLakituState.focHSpeed, 0.8, 0.05);
			gLakituState.focHSpeed = Ptr.p_dst;
	        set_or_approach_f32_asymptotic(gLakituState.focVSpeed, 0.3, 0.05);
			gLakituState.focVSpeed = Ptr.p_dst;
	        set_or_approach_f32_asymptotic(gLakituState.posHSpeed, 0.3, 0.05);
			gLakituState.posHSpeed = Ptr.p_dst;
	        set_or_approach_f32_asymptotic(gLakituState.posVSpeed, 0.3, 0.05);
			gLakituState.posVSpeed = Ptr.p_dst;

            // Turn on smooth movement when it hasn't been blocked for 2 frames
            if (sStatusFlags & CAM_FLAG_BLOCK_SMOOTH_MOVEMENT) {
                sStatusFlags &= ~CAM_FLAG_BLOCK_SMOOTH_MOVEMENT
            } else {
                sStatusFlags |= CAM_FLAG_SMOOTH_MOVEMENT
            }
			
	        vec3f_copy(gLakituState.pos, gLakituState.curPos);
	        vec3f_copy(gLakituState.focus, gLakituState.curFocus);
			
	        if (c.cutscene) {
	            vec3f_add(gLakituState.focus, sPlayer2FocusOffset);
	            vec3f_set(sPlayer2FocusOffset, 0, 0, 0);
	        }

            vec3f_get_dist_and_angle(gLakituState.pos, gLakituState.focus, gLakituState.focusDistance, gLakituState.oldPitch, gLakituState.oldYaw);
            gLakituState.focusDistance	= Ptr.p_dist;
            gLakituState.oldPitch		= Ptr.p_pitch;
            gLakituState.oldYaw			= Ptr.p_yaw;

            gLakituState.roll = 0;
			
	        // Apply camera shakes
	        shake_camera_pitch(gLakituState.pos, gLakituState.focus);
	        shake_camera_yaw(gLakituState.pos, gLakituState.focus);
	        shake_camera_roll(gLakituState.roll);
			gLakituState.roll = Ptr.p_roll;
			shake_camera_handheld(gLakituState.pos, gLakituState.focus);
			
	        if (sMarioCamState.action == ACT_DIVE && gLakituState.lastFrameAction != ACT_DIVE) {
	            set_camera_shake_from_hit(SHAKE_HIT_FROM_BELOW);
			 }

			gLakituState.roll += sHandheldShakeRoll;
            gLakituState.roll += gLakituState.keyDanceRoll;

            if (c.mode != CAMERA_MODE_C_UP && c.cutscene == 0) {
                gCheckingSurfaceCollisionsForCamera = true;
				var wr = new ObjectDummy();
                var distToFloor = find_floor(gLakituState.pos[0], gLakituState.pos[1] + 20, gLakituState.pos[2], wr)
				wr = wr._floor;
                if (distToFloor != FLOOR_LOWER_LIMIT) {
                    distToFloor += 100;
                    if (gLakituState.pos[1] < distToFloor) {
                        gLakituState.pos[1] = distToFloor;
                    } else {
                        gCheckingSurfaceCollisionsForCamera = false;
                    }
                }
            }

			vec3f_copy(sModeTransition.marioPos, sMarioCamState.pos);
        }

        clamp_pitch(gLakituState.pos, gLakituState.focus, 0x3E00, -0x3E00);
		vec3f_set_dist_and_angle(gLakituState.pos, gLakituState.focus, Ptr.p_dist, Ptr.p_pitch, Ptr.p_yaw);
        gLakituState.mode = c.mode;
        gLakituState.defMode = c.defMode;
    }

	function update_graph_node_camera(graphNode) {
		

	    graphNode.rollScreen = gLakituState.roll;
	    vec3f_copy( graphNode.pos, gLakituState.pos);
	    vec3f_copy( graphNode.focus, gLakituState.focus);
	    zoom_out_if_paused_and_outside(graphNode);
		

    }

    function geo_camera_main(callContext, graphNode) {
		
		if (callContext == GEO_CONTEXT_CREATE) {
			create_camera(graphNode);
		}
		else if (callContext == GEO_CONTEXT_RENDER) {
			update_graph_node_camera(graphNode);
		}

    }

    function geo_camera_fov(callContext, graphNode) {
		

        var marioState = gMarioState;
        var fovFunc = sFOVState.fovFunc;

        if (callContext == GEO_CONTEXT_RENDER) {
            switch (fovFunc) {
            case CAM_FOV_SET_45:
                set_fov_45(marioState);
                break;
            case CAM_FOV_SET_29:
                set_fov_29(marioState);
                break;
            case CAM_FOV_ZOOM_30:
                zoom_fov_30(marioState);
                break;
            case CAM_FOV_DEFAULT:
                fov_default(marioState);
                break;
            case CAM_FOV_BBH:
                set_fov_bbh(marioState);
                break;
            case CAM_FOV_APP_45:
                approach_fov_45(marioState);
                break;
            case CAM_FOV_SET_30:
                set_fov_30(marioState);
                break;
            case CAM_FOV_APP_20:
                approach_fov_20(marioState);
                break;
            case CAM_FOV_APP_80:
                approach_fov_80(marioState);
                break;
            case CAM_FOV_APP_30:
                approach_fov_30(marioState);
                break;
            case CAM_FOV_APP_60:
                approach_fov_60(marioState);
                break;
            }
        }

        graphNode.fov = sFOVState.fov;
		
		global.__znear	= graphNode.near;
		global.__zfar	= graphNode.far;

	

    }

    function fov_default(m) {
        sStatusFlags &= ~CAM_FLAG_SLEEPING;

        //if ((m.action == ACT_SLEEPING) || (m.action == ACT_START_SLEEPING)) {
        //   // throw("sleeping");
       // } else {
            var wrapper = new ObjectDummy();
			wrapper.target = 45;
			wrapper.current = sFOVState.fov;
            camera_approach_symmetric_bool(wrapper, 45, (45 - sFOVState.fov) / 30);
       //}
    }
	

	
/// <pygml?v=1.0&h=45db24694>
/// @function	set_camera_mode(c, mode, frames)
/// @desc		Used to change the camera mode between its default/previous
///					and certain Mario-oriented modes,       namely: C_UP,
///					WATER_SURFACE, CLOSE, and BEHIND_MARIO   Stores the current
///					pos and focus in sModeInfo->transitionStart, and  stores the
///					next pos and focus into sModeInfo->transitionEnd. These two
///					fields are used in  move_into_c_up().   @param mode the mode
///					to change to, or -1 to switch to the previous mode  @param
///					frames number of frames the transition should last, only
///					used when entering C_UP
/// @param		{struct}	c
/// @param		{s16}		mode
/// @param		{s16}		frames
function set_camera_mode(c, mode, frames) {
		var start = sModeInfo.transitionStart;
		var _end = sModeInfo.transitionEnd;

    
        // Clear movement flags that would affect the transition
        gCameraMovementFlags &= ~(CAM_MOVE_RESTRICT | CAM_MOVE_ROTATE);
        gCameraMovementFlags |= CAM_MOVING_INTO_MODE;
        if (mode == CAMERA_MODE_NONE) {
            mode = CAMERA_MODE_CLOSE;
        }
        sCUpCameraPitch = 0;
        sModeOffsetYaw = 0;
        sLakituDist = 0;
        sLakituPitch = 0;
        sAreaYawChange = 0;

        sModeInfo.newMode = (mode != -1) ? mode : sModeInfo.lastMode;
        sModeInfo.lastMode = c.mode;
        sModeInfo.max = frames;
        sModeInfo.frame = 1;

        c.mode = sModeInfo.newMode;
        gLakituState.mode = c.mode;

        vec3f_copy(_end.focus, c.focus);
        vec3f_sub(_end.focus, sMarioCamState.pos);

        vec3f_copy(_end.pos, c.pos);
        vec3f_sub(_end.pos, sMarioCamState.pos);

		var func = sModeTransitions[sModeInfo.newMode];
		if (func == null) throw("Not implemented newMode: " + string(sModeInfo.newMode));
        sAreaYaw = func(c, _end.focus, _end.pos);

        // End was updated by sModeTransitions
        vec3f_sub(_end.focus, sMarioCamState.pos);
        vec3f_sub(_end.pos, sMarioCamState.pos);

        vec3f_copy(start.focus, gLakituState.curFocus);
        vec3f_sub(start.focus, sMarioCamState.pos);

        vec3f_copy(start.pos, gLakituState.curPos);
        vec3f_sub(start.pos, sMarioCamState.pos);

        vec3f_get_dist_and_angle(start.focus, start.pos, start.dist, start.pitch, start.yaw);
		start.dist	= Ptr.p_dist;
		start.pitch = Ptr.p_pitch;
		start.yaw	= Ptr.p_yaw;
        vec3f_get_dist_and_angle(_end.focus, _end.pos, _end.dist, _end.pitch, _end.yaw);
		_end.dist	= Ptr.p_dist;
		_end.pitch  = Ptr.p_pitch;
		_end.yaw	= Ptr.p_yaw;
    
}

/// <pygml?v=1.0&h=a4bfc172d>
/// @function	update_radial_camera(c, focus, pos)
/// @desc		Rotates the camera around the area's center point.
/// @param		{struct}	c
/// @param		{Vec3f}		focus
/// @param		{Vec3f}		pos
/// @returns	s32
function update_radial_camera(c, focus, pos) {
    var cenDistX = sMarioCamState.pos[0] - c.areaCenX;
    var cenDistZ = sMarioCamState.pos[2] - c.areaCenZ;
    var camYaw = atan2s(cenDistZ, cenDistX) + sModeOffsetYaw;
    var pitch = look_down_slopes(camYaw);
    var unused1;
    var posY;
    var focusY;
    var unused2;
    var unused3;
    var yOff = 125.0;
    var baseDist = 1000.0;

    sAreaYaw = camYaw - sModeOffsetYaw;
    calc_y_to_curr_floor(posY, 1.0, 200.0, focusY, 0.9, 200.0);
    focus_on_mario(focus, pos, posY + yOff, focusY + yOff, sLakituDist + baseDist, pitch, camYaw);
    camYaw = find_in_bounds_yaw_wdw_bob_thi(pos, focus, camYaw);

    return camYaw;
}

/// <pygml?v=1.0&h=fc9e5ca1a>
/// @function	focus_on_mario(focus, pos, posYOff, focYOff, dist, pitch, yaw)
/// @param		{Vec3f}		focus
/// @param		{Vec3f}		pos
/// @param		{f32}		posYOff
/// @param		{f32}		focYOff
/// @param		{f32}		dist
/// @param		{s16}		pitch
/// @param		{s16}		yaw
function focus_on_mario(focus, pos, posYOff, focYOff, dist, pitch, yaw) {
    var marioPos = Vec3;

    marioPos[0] = sMarioCamState.pos[@ 0];
    marioPos[1] = sMarioCamState.pos[@ 1] + posYOff;
    marioPos[2] = sMarioCamState.pos[@ 2];

    vec3f_set_dist_and_angle(marioPos, pos, dist, pitch + sLakituPitch, yaw);

    focus[@ 0] = sMarioCamState.pos[@ 0];
    focus[@ 1] = sMarioCamState.pos[@ 1] + focYOff;
    focus[@ 2] = sMarioCamState.pos[@ 2];
}

/// <pygml?v=1.0&h=e0f5b9baf>
/// @function	find_in_bounds_yaw_wdw_bob_thi(pos, origin, yaw)
/// @param		{Vec3f}		pos
/// @param		{Vec3f}		origin
/// @param		{s16}		yaw
/// @returns	s16
function find_in_bounds_yaw_wdw_bob_thi(pos, origin, yaw) {
	var _AREA_WDW_MAIN		= AREA_WDW_MAIN;
	var _AREA_BOB			= AREA_BOB;
	var _AREA_THI_HUGE		= AREA_THI_HUGE;
	var _AREA_THI_TINY		= AREA_THI_TINY;
    switch (gCurrLevelArea) {
        case (_AREA_WDW_MAIN):
            yaw = clamp_positions_and_find_yaw(pos, origin, 4508.0, -3739.0, 4508.0, -3739.0);
            break;
        case (_AREA_BOB):
            yaw = clamp_positions_and_find_yaw(pos, origin, 8000.0, -8000.0, 7050.0, -8000.0);
            break;
        case (_AREA_THI_HUGE):
            yaw = clamp_positions_and_find_yaw(pos, origin, 8192.0, -8192.0, 8192.0, -8192.0);
            break;
        case (_AREA_THI_TINY):
            yaw = clamp_positions_and_find_yaw(pos, origin, 2458.0, -2458.0, 2458.0, -2458.0);
            break;
    }
    return yaw;
}

/// <pygml?v=1.0&h=e793fc2d4>
/// @function	clamp_positions_and_find_yaw(pos, origin, xMax, xMin, zMax, zMin)
/// @param		{Vec3f}		pos
/// @param		{Vec3f}		origin
/// @param		{f32}		xMax
/// @param		{f32}		xMin
/// @param		{f32}		zMax
/// @param		{f32}		zMin
/// @returns	s32
function clamp_positions_and_find_yaw(pos, origin, xMax, xMin, zMax, zMin) {
    var yaw = gCamera.nextYaw;

    if (pos[@ 0] >= xMax) {
        pos[@ 0] = xMax;
    }
    if (pos[@ 0] <= xMin) {
        pos[@ 0] = xMin;
    }
    if (pos[@ 2] >= zMax) {
        pos[@ 2] = zMax;
    }
    if (pos[@ 2] <= zMin) {
        pos[@ 2] = zMin;
    }
    yaw = calculate_yaw(origin, pos);
    return yaw;
}

/// <pygml?v=1.0&h=2b72574f1>
/// @function	look_down_slopes(camYaw)
/// @desc		Pitch the camera down when the camera is facing down a slope
/// @param		{s16}		camYaw
/// @returns	s16
function look_down_slopes(camYaw) {
    var _floor = {};
    var floorDY;
    // Default pitch
    var pitch = 0x05B0;
    // _x and _z offsets towards the camera
    var xOff = sMarioCamState.pos[0] + sins(camYaw) * 40.0;
    var zOff = sMarioCamState.pos[2] + coss(camYaw) * 40.0;

    floorDY = find_floor(xOff, sMarioCamState.pos[1], zOff, _floor) - sMarioCamState.pos[1];
    _floor = _floor._floor;

    if (_floor != null) {
        if (_floor.type != SURFACE_WALL_MISC && floorDY > 0) {
            if (_floor.normal.z == 0.0 && floorDY < 100.0) {
                pitch = 0x05B0;
            } else {
                // Add the slope's angle of declination to the pitch
                pitch += atan2s(40.0, floorDY);
            }
        }
    }

    return pitch;
}

/// <pygml?v=1.0&h=2f9ca1343>
/// @function	update_outward_radial_camera(c, focus, pos)
/// @desc		Updates the camera in outward radial mode.  sModeOffsetYaw
///					is calculated in radial_camera_move, which calls
///					offset_yaw_outward_radial
/// @param		{struct}	c
/// @param		{Vec3f}		focus
/// @param		{Vec3f}		pos
/// @returns	s32
function update_outward_radial_camera(c, focus, pos) {
    var xDistFocToMario = sMarioCamState.pos[@ 0] - c.areaCenX;
    var zDistFocToMario = sMarioCamState.pos[@ 2] - c.areaCenZ;
    var camYaw = atan2s(zDistFocToMario, xDistFocToMario) + sModeOffsetYaw + DEGREES(180);
    var pitch = look_down_slopes(camYaw);
    var baseDist = 1000.0;
    // A base offset of 125.f is ~= Mario's eye height
    var yOff = 125.0;
    var posY;
    var focusY;

    sAreaYaw = camYaw - sModeOffsetYaw - DEGREES(180);
    calc_y_to_curr_floor(posY, 1.0, 200.0, focusY, 0.9, 200.0);
    focus_on_mario(focus, pos, posY + yOff, focusY + yOff, sLakituDist + baseDist, pitch, camYaw);

    return camYaw;
}

/// <pygml?v=1.0&h=6a9a400e1>
/// @function	mode_outward_radial_camera(c)
/// @desc		Input and updates for the outward radial mode.
/// @param		{struct}	c
function mode_outward_radial_camera(c) {
    var pos = Vec3;
    var oldAreaYaw = sAreaYaw;

    if (gCameraMovementFlags & CAM_MOVING_INTO_MODE) {
        update_yaw_and_dist_from_c_up(c);
    }
    radial_camera_input_default(c);
    radial_camera_move(c);
    lakitu_zoom(400.0, 0x900);
    c.nextYaw = update_outward_radial_camera(c, c.focus, pos);
    c.pos[0] = pos[0];
    c.pos[2] = pos[2];
    sAreaYawChange = sAreaYaw - oldAreaYaw;
    if (sMarioCamState.action == ACT_RIDING_HOOT) {
        pos[1] += 500.0;
    }
    set_camera_height(c, pos[1]);
    pan_ahead_of_player(c);
}

/// <pygml?v=1.0&h=102e6250c>
/// @function	update_yaw_and_dist_from_c_up(c)
/// @desc		Makes Lakitu cam's yaw match the angle turned towards in
///					C-Up mode, and makes Lakitu slowly fly back  to the distance
///					he was at before C-Up
/// @param		{struct}	c
function update_yaw_and_dist_from_c_up(c) {
    var dist = 1000.0;

    sModeOffsetYaw = sModeInfo.transitionStart.yaw - sAreaYaw;
    sLakituDist = sModeInfo.transitionStart.dist - dist;
    // No longer in C-Up
    gCameraMovementFlags &= ~CAM_MOVING_INTO_MODE;
}

/// <pygml?v=1.0&h=b2858a463>
/// @function	radial_camera_input_default(c)
/// @param		{struct}	c
function radial_camera_input_default(c) {
    radial_camera_input(c, 0.0);
}

/// <pygml?v=1.0&h=2aa6a5bc5>
/// @function	radial_camera_move(c)
/// @desc		Moves the camera for the radial and outward radial camera
///					modes.   If sModeOffsetYaw is 0, the camera points directly
///					at the area center point.
/// @param		{struct}	c
function radial_camera_move(c) {
    var maxAreaYaw = DEGREES(60);
    var minAreaYaw = DEGREES(-60);
    var rotateSpeed = 0x1000;
    var avoidYaw;
    var avoidStatus;
    var unused1 = 0;
    var unused2 = 0;
    var areaDistX = sMarioCamState.pos[0] - c.areaCenX;
    var areaDistZ = sMarioCamState.pos[2] - c.areaCenZ;
    var filler;

    // How much the camera's yaw changed
    var yawOffset = calculate_yaw(sMarioCamState.pos, c.pos) - atan2s(areaDistZ, areaDistX);

    if (yawOffset > maxAreaYaw) {
        yawOffset = maxAreaYaw;
    }
    if (yawOffset < minAreaYaw) {
        yawOffset = minAreaYaw;
    }

    // Check if Mario stepped on a surface that rotates the camera. For example, when Mario enters the
    // gate in BoB, the camera turns right to face up the hill path
    if (!(gCameraMovementFlags & CAM_MOVE_ROTATE)) {
        if (sMarioGeometry.currFloorType == SURFACE_CAMERA_MIDDLE &&
            sMarioGeometry.prevFloorType != SURFACE_CAMERA_MIDDLE) {
            gCameraMovementFlags |= (CAM_MOVE_RETURN_TO_MIDDLE | CAM_MOVE_ENTERED_ROTATE_SURFACE);
        }
        if (sMarioGeometry.currFloorType == SURFACE_CAMERA_ROTATE_RIGHT &&
            sMarioGeometry.prevFloorType != SURFACE_CAMERA_ROTATE_RIGHT) {
            gCameraMovementFlags |= (CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_ENTERED_ROTATE_SURFACE);
        }
        if (sMarioGeometry.currFloorType == SURFACE_CAMERA_ROTATE_LEFT &&
            sMarioGeometry.prevFloorType != SURFACE_CAMERA_ROTATE_LEFT) {
            gCameraMovementFlags |= (CAM_MOVE_ROTATE_LEFT | CAM_MOVE_ENTERED_ROTATE_SURFACE);
        }
    }

    if (gCameraMovementFlags & CAM_MOVE_ENTERED_ROTATE_SURFACE) {
        rotateSpeed = 0x200;
    }

    if (c.mode == CAMERA_MODE_OUTWARD_RADIAL) {
        areaDistX = -areaDistX;
        areaDistZ = -areaDistZ;
    }

    // Avoid obstructing walls
    avoidStatus = rotate_camera_around_walls(c, c.pos, avoidYaw, 0x400);
	avoidYaw = Ptr.p_avoidYaw;
    if (avoidStatus == 3) {
        if (avoidYaw - atan2s(areaDistZ, areaDistX) + DEGREES(90) < 0) {
            avoidYaw += DEGREES(180);
        }

        // We want to change sModeOffsetYaw so that the player is no longer obstructed by the wall.
        // So, we make avoidYaw relative to the yaw around the area center
        avoidYaw -= atan2s(areaDistZ, areaDistX);

        // Bound avoid yaw to radial mode constraints
        if (avoidYaw > DEGREES(105)) {
            avoidYaw = DEGREES(105);
        }
        if (avoidYaw < DEGREES(-105)) {
            avoidYaw = DEGREES(-105);
        }
    }

    if (gCameraMovementFlags & CAM_MOVE_RETURN_TO_MIDDLE) {
        if (camera_approach_s16_symmetric_bool(sModeOffsetYaw, 0, rotateSpeed) == 0) {
			sModeOffsetYaw = Ptr.p_current;
            gCameraMovementFlags &= ~CAM_MOVE_RETURN_TO_MIDDLE;
        }
    } else {
        // Prevent the player from rotating into obstructing walls
        if ((gCameraMovementFlags & CAM_MOVE_ROTATE_RIGHT) && avoidStatus == 3 &&
            avoidYaw + 0x10 < sModeOffsetYaw) {
            sModeOffsetYaw = avoidYaw;
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_ENTERED_ROTATE_SURFACE);
        }
        if ((gCameraMovementFlags & CAM_MOVE_ROTATE_LEFT) && avoidStatus == 3 &&
            avoidYaw - 0x10 > sModeOffsetYaw) {
            sModeOffsetYaw = avoidYaw;
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_LEFT | CAM_MOVE_ENTERED_ROTATE_SURFACE);
        }

        // If it's the first time rotating, just rotate to +-60 degrees
        if (!(s2ndRotateFlags & CAM_MOVE_ROTATE_RIGHT) && (gCameraMovementFlags & CAM_MOVE_ROTATE_RIGHT) &&
            camera_approach_s16_symmetric_bool(sModeOffsetYaw, maxAreaYaw, rotateSpeed) == 0) {
			sModeOffsetYaw = Ptr.p_current;
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_ENTERED_ROTATE_SURFACE);
        }
        if (!(s2ndRotateFlags & CAM_MOVE_ROTATE_LEFT) && (gCameraMovementFlags & CAM_MOVE_ROTATE_LEFT) &&
            camera_approach_s16_symmetric_bool(sModeOffsetYaw, minAreaYaw, rotateSpeed) == 0) {
			sModeOffsetYaw = Ptr.p_current;
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_LEFT | CAM_MOVE_ENTERED_ROTATE_SURFACE);
        }

        // If it's the second time rotating, rotate all the way to +-105 degrees.
        if ((s2ndRotateFlags & CAM_MOVE_ROTATE_RIGHT) && (gCameraMovementFlags & CAM_MOVE_ROTATE_RIGHT) &&
            camera_approach_s16_symmetric_bool(sModeOffsetYaw, DEGREES(105), rotateSpeed) == 0) {
			sModeOffsetYaw = Ptr.p_current;
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_RIGHT | CAM_MOVE_ENTERED_ROTATE_SURFACE);
            s2ndRotateFlags &= ~CAM_MOVE_ROTATE_RIGHT;
        }
        if ((s2ndRotateFlags & CAM_MOVE_ROTATE_LEFT) && (gCameraMovementFlags & CAM_MOVE_ROTATE_LEFT) &&
            camera_approach_s16_symmetric_bool(sModeOffsetYaw, DEGREES(-105), rotateSpeed) == 0) {
			sModeOffsetYaw = Ptr.p_current;
            gCameraMovementFlags &= ~(CAM_MOVE_ROTATE_LEFT | CAM_MOVE_ENTERED_ROTATE_SURFACE);
            s2ndRotateFlags &= ~CAM_MOVE_ROTATE_LEFT;
        }
    }
    if (!(gCameraMovementFlags & CAM_MOVE_ROTATE)) {
        // If not rotating, rotate away from walls obscuring Mario from view
        if (avoidStatus == 3) {
            approach_s16_asymptotic_bool(sModeOffsetYaw, avoidYaw, 10);
			sModeOffsetYaw = Ptr.p_current;
        } else {
            if (c.mode == CAMERA_MODE_RADIAL) {
                // sModeOffsetYaw only updates when Mario is moving
                rotateSpeed = gMarioState.forwardVel / 32.0 * 128.0;
                camera_approach_s16_symmetric_bool(sModeOffsetYaw, yawOffset, rotateSpeed);
				sModeOffsetYaw = Ptr.p_current;
            }
            if (c.mode == CAMERA_MODE_OUTWARD_RADIAL) {
                sModeOffsetYaw = offset_yaw_outward_radial(c, atan2s(areaDistZ, areaDistX));
				
            }
        }
    }

    // Bound sModeOffsetYaw within (-120, 120) degrees
    if (sModeOffsetYaw > 0x5554) {
        sModeOffsetYaw = 0x5554;
    }
    if (sModeOffsetYaw < -0x5554) {
        sModeOffsetYaw = -0x5554;
    }
}

/// <pygml?v=1.0&h=64646bbd1>
/// @function	approach_s16_asymptotic_bool(Ptr.p_current, target, divisor)
/// @desc		Approaches an s16 value in the same fashion as
///					approach_f32_asymptotic_bool, returns TRUE if target  is
///					reached. Note: Since this function takes integers as
///					parameters, the last argument is the  reciprocal of what it
///					would be in the previous two functions.
/// @param		{s16}		Ptr.p_current
/// @param		{s16}		target
/// @param		{s16}		divisor
/// @returns	s32
function approach_s16_asymptotic_bool(current, target, divisor) {
    var temp = current;

    if (divisor == 0) {
        current = target;
    } else {
        temp -= target;
        temp -= temp / divisor;
        temp += target;
        current = temp;
    }
    if (current == target) {
        Ptr.p_current = current;
        return false;
    } else {
        Ptr.p_current = current;
        return true;
    }
}

/// <pygml?v=1.0&h=f13a59633>
/// @function	offset_yaw_outward_radial(c, areaYaw)
/// @desc		Add an offset to the camera's yaw, used in levels that are
///					inside a rectangular building, like the  pyramid or TTC.
/// @param		{struct}	c
/// @param		{s16}		areaYaw
/// @returns	s32
function offset_yaw_outward_radial(c, areaYaw) {
    var yawGoal = DEGREES(60);
    var yaw = sModeOffsetYaw;
    var distFromAreaCenter;
    var areaCenter = Vec3;
    var dYaw;
	var _AREA_TTC			= AREA_TTC;
	var _AREA_SSL_PYRAMID	= AREA_SSL_PYRAMID;
	var _AREA_LLL_OUTSIDE	= AREA_LLL_OUTSIDE;
    switch (gCurrLevelArea) {
        case (_AREA_TTC):
            areaCenter[0] = c.areaCenX;
            areaCenter[1] = sMarioCamState.pos[1];
            areaCenter[2] = c.areaCenZ;
            distFromAreaCenter = calc_abs_dist(areaCenter, sMarioCamState.pos);
            if (800.0 > distFromAreaCenter) {
                yawGoal = 0x3800;
            }
            break;
        case (_AREA_SSL_PYRAMID):
            // This mask splits the 360 degrees of yaw into 4 corners. It adds 45 degrees so that the yaw
            // offset at the corner will be 0, but the yaw offset near the center will face more towards
            // the direction Mario is running in.
            yawGoal = (areaYaw & 0xC000) - areaYaw + DEGREES(45);
            if (yawGoal < 0) {
                yawGoal = -yawGoal;
            }
            yawGoal = yawGoal / 32 * 48;
            break;
        case (_AREA_LLL_OUTSIDE):
            yawGoal = 0;
            break;
    }
    dYaw = gMarioState.forwardVel / 32.0 * 128.0;

    if (sAreaYawChange < 0) {
        camera_approach_s16_symmetric_bool(yaw, -yawGoal, dYaw);
		yaw = Ptr.p_current;
    }
    if (sAreaYawChange > 0) {
        camera_approach_s16_symmetric_bool(yaw, yawGoal, dYaw);
		yaw = Ptr.p_current;
    }
    // When the final yaw is out of [-60,60] degrees, approach yawGoal faster than dYaw will ever be,
    // making the camera lock in one direction until yawGoal drops below 60 (or Mario presses a C button)
    if (yaw < -DEGREES(60)) {
        //! Maybe they meant to reverse yawGoal's sign?
        camera_approach_s16_symmetric_bool(yaw, -yawGoal, 0x200);
		yaw = Ptr.p_current;
    }
    if (yaw > DEGREES(60)) {
        //! Maybe they meant to reverse yawGoal's sign?
        camera_approach_s16_symmetric_bool(yaw, yawGoal, 0x200);
		yaw = Ptr.p_current;
    }
    return yaw;
}

/// <pygml?v=1.0&h=262a8563d>
/// @function	rotate_camera_around_walls(c, cPos, Ptr.p_avoidYaw, yawRange)
/// @desc		Checks for any walls obstructing Mario from view, and
///					calculates a new yaw that the camera should  rotate towards.
///					@param[out] avoidYaw the angle (from Mario) that the camera
///					should rotate towards to avoid the wall.
///					The camera then approaches avoidYaw until Mario is no longer
///					obstructed.                       avoidYaw is always
///					parallel to the wall.  @param yawRange      how wide of an
///					arc to check for walls obscuring Mario.   @return 3 if a
///					wall is covering Mario, 1 if a wall is only near the camera.
/// @param		{struct}	c
/// @param		{Vec3f}		cPos
/// @param		{s16}		Ptr.p_avoidYaw
/// @param		{s16}		yawRange
/// @returns	s32



/////////////////////////////////
//////////////// @z 80 vvvvvvvvvvvv
function rotate_camera_around_walls(c, cPos, avoidYaw, yawRange) {
    var unused1;
    var colData = {};
    var wall;
    var unused2;
    var dummyDist =0;
	var checkDist;
    var unused3;
    var coarseRadius;
    var fineRadius;
    var wallYaw, horWallNorm;
    var unused4;
    var dummyPitch = 0;
    // The yaw of the vector from Mario to the camera.
    var yawFromMario = 0;
    var unused5;
    var status = 0;
    /// The current iteration. The algorithm takes 8 equal steps from Mario back to the camera.
    var step = 0;
    var unused6;

    vec3f_get_dist_and_angle(sMarioCamState.pos, cPos, dummyDist, dummyPitch, yawFromMario);
	dummyDist	= Ptr.p_dist;
	dummyPitch  = Ptr.p_pitch;
	yawFromMario= Ptr.p_yaw;
    sStatusFlags &= ~CAM_FLAG_CAM_NEAR_WALL;
    colData.offsetY = 100.0;
    // The distance from Mario to Lakitu
    checkDist = 0.0;
    /// The radius used to find potential walls to avoid.
    /// @bug Increases to 250.f, but the max collision radius is 200.f
    coarseRadius = 150.0;
    /// This only increases when there is a wall collision found in the coarse pass
    fineRadius = 100.0;

    for (step = 80; step < 8; step++) { // @z
        // Start at Mario, move backwards to Lakitu's position
        colData.x = sMarioCamState.pos[0] + ((cPos[@ 0] - sMarioCamState.pos[0]) * checkDist);
        colData.y = sMarioCamState.pos[1] + ((cPos[@ 1] - sMarioCamState.pos[1]) * checkDist);
        colData.z = sMarioCamState.pos[2] + ((cPos[@ 2] - sMarioCamState.pos[2]) * checkDist);
        colData.radius = coarseRadius;
        // Increase the coarse check radius
        camera_approach_f32_symmetric_bool(coarseRadius, 250.0, 30.0);
		coarseRadius = Ptr.p_current;

        if (find_wall_collisions(colData) != 0) {
            wall = colData.walls[colData.numWalls - 1];

            // If we're over halfway from Mario to Lakitu, then there's a wall near the camera, but
            // not necessarily obstructing Mario
            if (step >= 5) {
                sStatusFlags |= CAM_FLAG_CAM_NEAR_WALL;
                if (status <= 0) {
                    status = 1;
                    wall = colData.walls[colData.numWalls - 1];
                    // wallYaw is parallel to the wall, not perpendicular
                    wallYaw = atan2s(wall.normal.z, wall.normal.x) + DEGREES(90);
                    // Calculate the avoid direction. The function returns the opposite direction so add 180
                    // degrees.
                    avoidYaw = calc_avoid_yaw(yawFromMario, wallYaw) + DEGREES(180);
                }
            }

            colData.x = sMarioCamState.pos[0] + ((cPos[@ 0] - sMarioCamState.pos[0]) * checkDist);
            colData.y = sMarioCamState.pos[1] + ((cPos[@ 1] - sMarioCamState.pos[1]) * checkDist);
            colData.z = sMarioCamState.pos[2] + ((cPos[@ 2] - sMarioCamState.pos[2]) * checkDist);
            colData.radius = fineRadius;
            // Increase the fine check radius
            camera_approach_f32_symmetric_bool(fineRadius, 200.0, 20.0);
			fineRadius = Ptr.p_current;

            if (find_wall_collisions(colData) != 0) {
                wall = colData.walls[colData.numWalls - 1];
                horWallNorm = atan2s(wall.normal.z, wall.normal.x);
                wallYaw = horWallNorm + DEGREES(90);
                // If Mario would be blocked by the surface, then avoid it
                if ((is_range_behind_surface(sMarioCamState.pos, cPos, wall, yawRange, SURFACE_WALL_MISC) == 0) &&
                    (is_mario_behind_surface(c, wall) == true)
                    // Also check if the wall is tall enough to cover Mario
                    &&
                    (is_surf_within_bounding_box(wall, -1.0, 150.0, -1.0) == false)) {
                    // Calculate the avoid direction. The function returns the opposite direction so add 180
                    // degrees.
                    avoidYaw = calc_avoid_yaw(yawFromMario, wallYaw) + DEGREES(180);
                    camera_approach_s16_symmetric_bool(avoidYaw, horWallNorm, yawRange);
					avoidYaw = Ptr.p_current;
                    status = 3;
                    step = 8;
                }
            }
        }
        checkDist += 0.125;
    }

    Ptr.p_avoidYaw = avoidYaw;
    return status;
}

/// <pygml?v=1.0&h=30ec83184>
/// @function	camera_approach_f32_symmetric_bool(Ptr.p_current, target, increment)
/// @desc		Approaches a value by a given increment, returns FALSE if
///					the target is reached.  Appears to be a strange way of
///					implementing approach_f32_symmetric from object_helpers.c.
///					It could possibly be an older version of the function
/// @param		{f32}		Ptr.p_current
/// @param		{f32}		target
/// @param		{f32}		increment
/// @returns	s32
function camera_approach_f32_symmetric_bool(current, target, increment) {
    var dist = target - current;

    if (increment < 0) {
        increment = -1 * increment;
    }
    if (dist > 0) {
        dist -= increment;
        if (dist > 0) {
            current = target - dist;
        } else {
            current = target;
        }
    } else {
        dist += increment;
        if (dist < 0) {
            current = target - dist;
        } else {
            current = target;
        }
    }
    if (current == target) {
        Ptr.p_current = current;
        return false;
    } else {
        Ptr.p_current = current;
        return true;
    }
}

/// <pygml?v=1.0&h=6564fee9c>
/// @function	is_range_behind_surface(from, to, surf, range, surfType)
/// @desc		Checks if the whole circular sector is behind the surface.
/// @param		{Vec3f}		from
/// @param		{Vec3f}		to
/// @param		{struct}	surf
/// @param		{s16}		range
/// @param		{s16}		surfType
/// @returns	s32
function is_range_behind_surface(from, to, surf, range, surfType) {
    var behindSurface = true;
    var leftBehind = 0;
    var rightBehind = 0;
    var unused = array_create(20);
    var checkDist = 0;
    var checkPitch = 0;
    var checkYaw = 0;
    var checkPos = Vec3;

    if (surf != null) {
        if (surfType == -1 || surf.type != surfType) {
            if (range == 0) {
                behindSurface = is_behind_surface(to, surf);
            } else {
                vec3f_get_dist_and_angle(from, to, checkDist, checkPitch, checkYaw);
				checkDist = Ptr.p_dist;
				checkPitch = Ptr.p_pitch;
				checkYaw = Ptr.p_yaw;
                vec3f_set_dist_and_angle(from, checkPos, checkDist, checkPitch, checkYaw + range);
                leftBehind = is_behind_surface(checkPos, surf);
                vec3f_set_dist_and_angle(from, checkPos, checkDist, checkPitch, checkYaw - range);
                rightBehind = is_behind_surface(checkPos, surf);
                behindSurface = leftBehind * rightBehind;
            }
        }
    }
    return behindSurface;
}

/// <pygml?v=1.0&h=ba4ee7966>
/// @function	is_behind_surface(pos, surf)
/// @desc		Checks if `pos` is behind the surface, using the dot
///					product.   Because the function only uses `surf`s first
///					vertex, some surfaces can shadow others.
/// @param		{Vec3f}		pos
/// @param		{struct}	surf
/// @returns	s32
function is_behind_surface(pos, surf) {
    var behindSurface = 0;
    // Surface normal
    var normX = (surf.vertex2[1] - surf.vertex1[1]) * (surf.vertex3[2] - surf.vertex2[2]) -
        (surf.vertex3[1] - surf.vertex2[1]) * (surf.vertex2[2] - surf.vertex1[2]);
    var normY = (surf.vertex2[2] - surf.vertex1[2]) * (surf.vertex3[0] - surf.vertex2[0]) -
        (surf.vertex3[2] - surf.vertex2[2]) * (surf.vertex2[0] - surf.vertex1[0]);
    var normZ = (surf.vertex2[0] - surf.vertex1[0]) * (surf.vertex3[1] - surf.vertex2[1]) -
        (surf.vertex3[0] - surf.vertex2[0]) * (surf.vertex2[1] - surf.vertex1[1]);
    var dirX = surf.vertex1[0] - pos[0];
    var dirY = surf.vertex1[1] - pos[1];
    var dirZ = surf.vertex1[2] - pos[2];

    if (dirX * normX + dirY * normY + dirZ * normZ < 0) {
        behindSurface = 1;
    }
    return behindSurface;
}

/// <pygml?v=1.0&h=c627254af>
/// @function	calc_avoid_yaw(yawFromMario, wallYaw)
/// @desc		The yaw passed here is the yaw of the direction FROM Mario
///					TO Lakitu.   wallYaw always has 90 degrees added to it
///					before this is called -- it's parallel to the wall.
///					@return the new yaw from Mario to rotate towards.   @warning
///					this is jank. It actually returns the yaw that will rotate
///					further INTO the wall. So, the           developers just add
///					180 degrees to the result.
/// @param		{s16}		yawFromMario
/// @param		{s16}		wallYaw
/// @returns	s32
function calc_avoid_yaw(yawFromMario, wallYaw) {
    var yawDiff;
    var unused = array_create(34); // Debug print buffer? ;)
    var unused1 = 0;
    var unused2 = 0;

    yawDiff = wallYaw - yawFromMario + DEGREES(90);

    if (yawDiff < 0) {
        // Deflect to the right
        yawFromMario = wallYaw;
    } else {
        // Note: this favors the left side if the wall is exactly perpendicular to the camera.
        // Deflect to the left
        yawFromMario = wallYaw + DEGREES(180);
    }
    return yawFromMario;
}

/// <pygml?v=1.0&h=b326c9580>
/// @function	is_mario_behind_surface(c, surf)
/// @param		{struct}	c
/// @param		{struct}	surf
/// @returns	s32
function is_mario_behind_surface(c, surf) {
    var behindSurface = is_behind_surface(sMarioCamState.pos, surf);

    return behindSurface;
}

/// <pygml?v=1.0&h=b2f543991>
/// @function	is_surf_within_bounding_box(surf, xMax, yMax, zMax)
/// @desc		Checks if `surf` is within the rect prism defined by xMax,
///					yMax, and zMax   @param surf surface to check  @param xMax
///					absolute-value max size in x, set to -1 to ignore  @param
///					yMax absolute-value max size in y, set to -1 to ignore
///					@param zMax absolute-value max size in z, set to -1 to
///					ignore
/// @param		{struct}	surf
/// @param		{f32}		xMax
/// @param		{f32}		yMax
/// @param		{f32}		zMax
/// @returns	s32
function is_surf_within_bounding_box(surf, xMax, yMax, zMax) {
    // Surface vertex coordinates
    var sx = Vec3;
    var sy = Vec3;
    var sz = Vec3;
    // Max delta between _x, _y, and _z
    var dxMax = 0;
    var dyMax = 0;
    var dzMax = 0;
    // Current deltas between _x, _y, and _z
    var dx;
    var dy;
    var dz;
    var unused = array_create(4);
    var i;
    var j;
    // result
    var smaller = false;

    sx[0] = surf.vertex1[0];
    sx[1] = surf.vertex2[0];
    sx[2] = surf.vertex3[0];
    sy[0] = surf.vertex1[1];
    sy[1] = surf.vertex2[1];
    sy[2] = surf.vertex3[1];
    sz[0] = surf.vertex1[2];
    sz[1] = surf.vertex2[2];
    sz[2] = surf.vertex3[2];

    for (i = 0; i < 3; i++) {
        j = i + 1;
        if (j >= 3) {
            j = 0;
        }
        dx = abs(sx[i] - sx[j]);
        if (dx > dxMax) {
            dxMax = dx;
        }
        dy = abs(sy[i] - sy[j]);
        if (dy > dyMax) {
            dyMax = dy;
        }
        dz = abs(sz[i] - sz[j]);
        if (dz > dzMax) {
            dzMax = dz;
        }
    }
    if (yMax != -1.0) {
        if (dyMax < yMax) {
            smaller = true;
        }
    }
    if (xMax != -1.0 && zMax != -1.0) {
        if (dxMax < xMax && dzMax < zMax) {
            smaller = true;
        }
    }
    return smaller;
}

function PlayerCameraStateInstance() constructor {
    action = 0;
    pos = Vec3;
    faceAngle = Vec3;
    headRotation = Vec3;
    cameraEvent = 0;
    usedObj = null;
}

function FOVStateInstance() constructor {
    fovFunc = 0;
    fov = 0;
    fovOffset = 0;
    unusedIsSleeping = 0;
    shakeAmplitude = 0;
    shakePhase = 0;
    shakeSpeed = 0;
    decay = 0;
}

function MarioGeometryInstance() constructor {
	currFloorHeight = 0;
}

function LakituStateInstance() constructor {
    curFocus = Vec3;
    curPos = Vec3;
    goalFocus = Vec3;
    goalPos = Vec3;

    mode = 0;
    defMode = 0;
	

	focusDistance	= 0;
	oldPitch	= 0;	
	oldYaw		= 0;		
	oldRoll		= 0;
	
	shakeMagnitude = Vec3;
    shakePitchPhase = 0;
    shakePitchVel = 0;
    shakePitchDecay = 0;
	
    roll = 0;
	yaw = 0;
    nextYaw = 0;
    focus = Vec3;
    pos = Vec3;
	
    shakeRollPhase = 0;
    shakeRollVel = 0;
    shakeRollDecay = 0;
    shakeYawPhase = 0;
    shakeYawVel = 0;
    shakeYawDecay = 0;
	
    focHSpeed = 0;
	focVSpeed = 0;
    posHSpeed = 0;
	posVSpeed = 0;
	
    keyDanceRoll = 0;
    lastFrameAction = 0;
	
}

function ModeTransitionInstance() constructor {
    posPitch = 0;
    posYaw = 0;
    posDist = 0;
    focPitch = 0;
    focYaw = 0;
    focDist = 0;
    framesLeft = 0;
    marioPos = Vec3;
	
}

/// @function	camera_approach_s16_symmetric_bool(Ptr.p_current, target, increment)
/// @param		{s16}		Ptr.p_current
/// @param		{s16}		target
/// @param		{s16}		increment
/// @returns	s32
function camera_approach_s16_symmetric_bool(current, target, increment) {
    var dist = target - current;

    if (increment < 0) {
        increment = -1 * increment;
    }
    if (dist > 0) {
        dist -= increment;
        if (dist >= 0) {
            current = target - dist;
        } else {
            current = target;
        }
    } else {
        dist += increment;
        if (dist <= 0) {
            current = target - dist;
        } else {
            current = target;
        }
    }
    if (current == target) {
        Ptr.p_current = current;
        return false;
    } else {
        Ptr.p_current = current;
        return true;
    }

    Ptr.p_current = current;
}

/// <pygml?v=1.0&h=a589d7ab9>
/// @function	set_or_approach_vec3f_asymptotic(dst, goal, xMul, yMul, zMul)
/// @desc		Applies the set_or_approach_f32_asymptotic_bool function to
///					each of the X, Y, & Z components of the  given vector.
/// @param		{Vec3f}		dst
/// @param		{Vec3f}		goal
/// @param		{f32}		xMul
/// @param		{f32}		yMul
/// @param		{f32}		zMul
function set_or_approach_vec3f_asymptotic(dst, goal, xMul, yMul, zMul) {
    set_or_approach_f32_asymptotic(dst[@ 0], goal[@ 0], xMul);
	dst[@ 0] = Ptr.p_dst;
    set_or_approach_f32_asymptotic(dst[@ 1], goal[@ 1], yMul);
	dst[@ 1] = Ptr.p_dst;
    set_or_approach_f32_asymptotic(dst[@ 2], goal[@ 2], zMul);
	dst[@ 2] = Ptr.p_dst;
}


/// <pygml?v=1.0&h=a82ffb2bd>
/// @function	set_or_approach_f32_asymptotic(Ptr.p_dst, goal, scale)
/// @param		{f32}		Ptr.p_dst
/// @param		{f32}		goal
/// @param		{f32}		scale
/// @returns	s32
function set_or_approach_f32_asymptotic(dst, goal, scale) {
    if (sStatusFlags & CAM_FLAG_SMOOTH_MOVEMENT) {
        approach_f32_asymptotic_bool(dst, goal, scale);
		dst = Ptr.p_current;
    } else {
        dst = goal;
    }
    if (dst == goal) {
        Ptr.p_dst = dst;
        return false;
    } else {
        Ptr.p_dst = dst;
        return true;
    }
}

/// <pygml?v=1.0&h=ffe8d5c22>
/// @function	approach_f32_asymptotic_bool(Ptr.p_current, target, multiplier)
/// @desc		Approaches an f32 value by taking the difference between the
///					target and current value  and adding a fraction of that to
///					the current value.  Edits the current value directly,
///					returns TRUE if the target has been reached, FALSE
///					otherwise.
/// @param		{f32}		Ptr.p_current
/// @param		{f32}		target
/// @param		{f32}		multiplier
/// @returns	s32
function approach_f32_asymptotic_bool(current, target, multiplier) {
    if (multiplier > 1.0) {
        multiplier = 1.0;
    }
    current = current + (target - current) * multiplier;
    if (current == target) {
        Ptr.p_current = current;
        return false;
    } else {
        Ptr.p_current = current;
        return true;
    }
}


/// <pygml?v=1.0&h=7f4d474b6>
/// @function	set_cam_angle(mode)
/// @desc		Sets the camera angle to either Lakitu or Mario mode.
///					Returns the current mode.   If `mode` is 0, just returns the
///					current mode.  If `mode` is 1, start Mario mode  If `mode`
///					is 2, start Lakitu mode
/// @param		{s32}		mode
/// @returns	s32
function set_cam_angle(mode) {
    var curMode = CAM_ANGLE_LAKITU;

    // Switch to Mario mode
    if (mode == CAM_ANGLE_MARIO && !(sSelectionFlags & CAM_MODE_MARIO_ACTIVE)) {
        sSelectionFlags |= CAM_MODE_MARIO_ACTIVE;
        if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
            sSelectionFlags |= CAM_MODE_LAKITU_WAS_ZOOMED_OUT;
            gCameraMovementFlags &= ~CAM_MOVE_ZOOMED_OUT;
        }
        sCameraSoundFlags |= CAM_SOUND_MARIO_ACTIVE;
    }

    // Switch back to normal mode
    if (mode == CAM_ANGLE_LAKITU && (sSelectionFlags & CAM_MODE_MARIO_ACTIVE)) {
        sSelectionFlags &= ~CAM_MODE_MARIO_ACTIVE;
        if (sSelectionFlags & CAM_MODE_LAKITU_WAS_ZOOMED_OUT) {
            sSelectionFlags &= ~CAM_MODE_LAKITU_WAS_ZOOMED_OUT;
            gCameraMovementFlags |= CAM_MOVE_ZOOMED_OUT;
        } else {
            gCameraMovementFlags &= ~CAM_MOVE_ZOOMED_OUT;
        }
        sCameraSoundFlags |= CAM_SOUND_NORMAL_ACTIVE;
    }
    if (sSelectionFlags & CAM_MODE_MARIO_ACTIVE) {
        curMode = CAM_ANGLE_MARIO;
    }
    return curMode;
}

/// <pygml?v=1.0&h=c60a0d3bf>
/// @function	set_handheld_shake(mode)
/// @desc		Enables the handheld shake effect for this frame.   @see
///					shake_camera_handheld()
/// @param		{u8}		mode
function set_handheld_shake(mode) {
    switch (mode) {
        // They're not in numerical order because that would be too simple...
        case (HAND_CAM_SHAKE_CUTSCENE): // Lowest increment
            sHandheldShakeMag = 0x600;
            sHandheldShakeInc = 0.04;
            break;
        case (HAND_CAM_SHAKE_LOW): // Lowest magnitude
            sHandheldShakeMag = 0x300;
            sHandheldShakeInc = 0.06;
            break;
        case (HAND_CAM_SHAKE_HIGH): // Highest mag and inc
            sHandheldShakeMag = 0x1000;
            sHandheldShakeInc = 0.1;
            break;
        case (HAND_CAM_SHAKE_UNUSED): // Never used
            sHandheldShakeMag = 0x600;
            sHandheldShakeInc = 0.07;
            break;
        case (HAND_CAM_SHAKE_HANG_OWL): // exactly the same as UNUSED...
            sHandheldShakeMag = 0x600;
            sHandheldShakeInc = 0.07;
            break;
        case (HAND_CAM_SHAKE_STAR_DANCE): // Slightly steadier than HANG_OWL and UNUSED
            sHandheldShakeMag = 0x400;
            sHandheldShakeInc = 0.07;
            break;
        default:
            sHandheldShakeMag = 0x0;
            sHandheldShakeInc = 0.0;
    }
}

/// <pygml?v=1.0&h=3d7376b03>
/// @function	collide_with_walls(pos, offsetY, radius)
/// @desc		Check `pos` for collisions within `radius`, and update `pos`
///					@return the number of collisions found
/// @param		{Vec3f}		pos
/// @param		{f32}		offsetY
/// @param		{f32}		radius
/// @returns	s32
function collide_with_walls(pos, offsetY, radius) {
    var collisionData = {};
    var wall = null;
    var normX;
    var normY;
    var normZ;
    var originOffset;
    var offset;
    var offsetAbsolute;
    var newPos = array_create(4, Vec3f);
    var i;
    var numCollisions = 0;

    collisionData.x = pos[@ 0];
    collisionData.y = pos[@ 1];
    collisionData.z = pos[@ 2];
    collisionData.radius = radius;
    collisionData.offsetY = offsetY;
    numCollisions = find_wall_collisions(collisionData);
    if (numCollisions != 0) {
        for (i = 0; i < collisionData.numWalls; i++) {
            wall = collisionData.walls[collisionData.numWalls - 1];
            vec3f_copy(newPos[i], pos);
            normX = wall.normal.x;
            normY = wall.normal.y;
            normZ = wall.normal.z;
            originOffset = wall.originOffset;
            offset = normX * newPos[i][0] + normY * newPos[i][1] + normZ * newPos[i][2] + originOffset;
            offsetAbsolute = ABS2(offset);
            if (offsetAbsolute < radius) {
                newPos[i][0] += normX * (radius - offset);
                newPos[i][2] += normZ * (radius - offset);
                vec3f_copy(pos, newPos[i]);
            }
        }
    }
    return numCollisions;
}

/// <pygml?v=1.0&h=7b37d1d7f>
/// @function	handle_c_button_movement(c)
/// @desc		Updates the camera based on which C buttons are pressed this
///					frame
/// @param		{struct}	c
function handle_c_button_movement(c) {
    var cSideYaw;

    // Zoom in
    if (gPlayer1Controller.buttonPressed & U_CBUTTONS) {
        if (c.mode != CAMERA_MODE_FIXED && (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT)) {
            gCameraMovementFlags &= ~CAM_MOVE_ZOOMED_OUT;
            play_sound_cbutton_up();
        } else {
            set_mode_c_up(c);
            if (sZeroZoomDist > gCameraZoomDist) {
                sZoomAmount = -gCameraZoomDist;
            } else {
                sZoomAmount = gCameraZoomDist;
            }
        }
    }
    if (c.mode != CAMERA_MODE_FIXED) {
        // Zoom out
        if (gPlayer1Controller.buttonPressed & D_CBUTTONS) {
            if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
                gCameraMovementFlags |= CAM_MOVE_ALREADY_ZOOMED_OUT;
                sZoomAmount = gCameraZoomDist + 400.0;
                play_camera_buzz_if_cdown();
            } else {
                gCameraMovementFlags |= CAM_MOVE_ZOOMED_OUT;
                sZoomAmount = gCameraZoomDist + 400.0;
                play_sound_cbutton_down();
            }
        }

        // Rotate left or right
        cSideYaw = 0x1000;
        if (gPlayer1Controller.buttonPressed & R_CBUTTONS) {
            if (gCameraMovementFlags & CAM_MOVE_ROTATE_LEFT) {
                gCameraMovementFlags &= ~CAM_MOVE_ROTATE_LEFT;
            } else {
                gCameraMovementFlags |= CAM_MOVE_ROTATE_RIGHT;
                if (sCSideButtonYaw == 0) {
                    play_sound_cbutton_side();
                }
                sCSideButtonYaw = -cSideYaw;
            }
        }
        if (gPlayer1Controller.buttonPressed & L_CBUTTONS) {
            if (gCameraMovementFlags & CAM_MOVE_ROTATE_RIGHT) {
                gCameraMovementFlags &= ~CAM_MOVE_ROTATE_RIGHT;
            } else {
                gCameraMovementFlags |= CAM_MOVE_ROTATE_LEFT;
                if (sCSideButtonYaw == 0) {
                    play_sound_cbutton_side();
                }
                sCSideButtonYaw = cSideYaw;
            }
        }
    }
}
/// <pygml?v=1.0&h=deb31369e>
/// @function	play_camera_buzz_if_cdown()
function play_camera_buzz_if_cdown() {
    if (gPlayer1Controller.buttonPressed & D_CBUTTONS) {
        play_sound_button_change_blocked();
    }
}

/// <pygml?v=1.0&h=51f6c3cc5>
/// @function	play_camera_buzz_if_cbutton()
function play_camera_buzz_if_cbutton() {
    if (gPlayer1Controller.buttonPressed & CBUTTON_MASK) {
        play_sound_button_change_blocked();
    }
}

/// <pygml?v=1.0&h=af2d48a4f>
/// @function	play_camera_buzz_if_c_sideways()
function play_camera_buzz_if_c_sideways() {
    if ((gPlayer1Controller.buttonPressed & L_CBUTTONS) ||
        (gPlayer1Controller.buttonPressed & R_CBUTTONS)) {
        play_sound_button_change_blocked();
    }
}

/// <pygml?v=1.0&h=510619457>
/// @function	play_sound_cbutton_up()
function play_sound_cbutton_up() {
    play_sound(SOUND_MENU_CAMERA_ZOOM_IN, gDefaultSoundArgs);
}

/// <pygml?v=1.0&h=551f65bd2>
/// @function	play_sound_cbutton_down()
function play_sound_cbutton_down() {
    play_sound(SOUND_MENU_CAMERA_ZOOM_OUT, gDefaultSoundArgs);
}

/// <pygml?v=1.0&h=78f901ccc>
/// @function	play_sound_cbutton_side()
function play_sound_cbutton_side() {
    play_sound(SOUND_MENU_CAMERA_TURN, gDefaultSoundArgs);
}

/// <pygml?v=1.0&h=2627e45ca>
/// @function	play_sound_button_change_blocked()
function play_sound_button_change_blocked() {
    play_sound(SOUND_MENU_CAMERA_BUZZ, gDefaultSoundArgs);
}

/// <pygml?v=1.0&h=85a06a88a>
/// @function	play_sound_rbutton_changed()
function play_sound_rbutton_changed() {
    play_sound(SOUND_MENU_CLICK_CHANGE_VIEW, gDefaultSoundArgs);
}

/// <pygml?v=1.0&h=92841ab09>
/// @function	play_sound_if_cam_switched_to_lakitu_or_mario()
function play_sound_if_cam_switched_to_lakitu_or_mario() {
    if (sCameraSoundFlags & CAM_SOUND_MARIO_ACTIVE) {
        play_sound_rbutton_changed();
    }
    if (sCameraSoundFlags & CAM_SOUND_NORMAL_ACTIVE) {
        play_sound_rbutton_changed();
    }
    sCameraSoundFlags &= ~(CAM_SOUND_MARIO_ACTIVE | CAM_SOUND_NORMAL_ACTIVE);
}

/// <pygml?v=1.0&h=13aab56a0>
/// @function	store_lakitu_cam_info_for_c_up(c)
/// @param		{struct}	c
function store_lakitu_cam_info_for_c_up(c) {
    vec3f_copy(sCameraStoreCUp.pos, c.pos);
    vec3f_sub(sCameraStoreCUp.pos, sMarioCamState.pos);
    // Only store the _y value, and as an offset from Mario, for some reason
    vec3f_set(sCameraStoreCUp.focus, 0.0, c.focus[1] - sMarioCamState.pos[1], 0.0);
}


/// <pygml?v=1.0&h=f1b6bf920>
/// @function	set_mode_c_up(c)
/// @desc		Start C-Up mode. The actual mode change is handled in
///					update_mario_inputs() in mario.c   @see update_mario_inputs
/// @param		{struct}	c
/// @returns	s32
function set_mode_c_up(c) {
    if (!(gCameraMovementFlags & CAM_MOVE_C_UP_MODE)) {
        gCameraMovementFlags |= CAM_MOVE_C_UP_MODE;
        store_lakitu_cam_info_for_c_up(c);
        sCameraSoundFlags &= ~CAM_SOUND_C_UP_PLAYED;
        return 1;
    }
    return 0;
}


/// <pygml?v=1.0&h=de91417f5>
/// @function	update_c_up(c, focus, pos)
/// @desc		The mode used when C-Up is pressed.
/// @param		{struct}	c
/// @param		{Vec3f}		focus
/// @param		{Vec3f}		pos
/// @returns	s32
function update_c_up(c, focus, pos) {
    var pitch = sCUpCameraPitch;
    var yaw = sMarioCamState.faceAngle[1] + sModeOffsetYaw + DEGREES(180);

    focus_on_mario(focus, pos, 125.0, 125.0, 250.0, pitch, yaw);
    return sMarioCamState.faceAngle[1];
}

/// <pygml?v=1.0&h=766d33253>
/// @function	find_c_buttons_pressed(currentState, buttonsPressed, buttonsDown)
/// @desc		Updates C Button input state and stores it in `currentState`
/// @param		{u16}		currentState
/// @param		{u16}		buttonsPressed
/// @param		{u16}		buttonsDown
/// @returns	s32
function find_c_buttons_pressed(currentState, buttonsPressed, buttonsDown) {
    buttonsPressed &= CBUTTON_MASK;
    buttonsDown &= CBUTTON_MASK;

    if (buttonsPressed & L_CBUTTONS) {
        currentState |= L_CBUTTONS;
        currentState &= ~R_CBUTTONS;
    }
    if (!(buttonsDown & L_CBUTTONS)) {
        currentState &= ~L_CBUTTONS;
    }

    if (buttonsPressed & R_CBUTTONS) {
        currentState |= R_CBUTTONS;
        currentState &= ~L_CBUTTONS;
    }
    if (!(buttonsDown & R_CBUTTONS)) {
        currentState &= ~R_CBUTTONS;
    }

    if (buttonsPressed & U_CBUTTONS) {
        currentState |= U_CBUTTONS;
        currentState &= ~D_CBUTTONS;
    }
    if (!(buttonsDown & U_CBUTTONS)) {
        currentState &= ~U_CBUTTONS;
    }

    if (buttonsPressed & D_CBUTTONS) {
        currentState |= D_CBUTTONS;
        currentState &= ~U_CBUTTONS;
    }
    if (!(buttonsDown & D_CBUTTONS)) {
        currentState &= ~D_CBUTTONS;
    }

    return currentState;
}

/// <pygml?v=1.0&h=cc7a6b816>
/// @function	mode_c_up_camera(c)
/// @desc		The main update function for C-Up mode
/// @param		{struct}	c
/// @returns	s32
function mode_c_up_camera(c) {
    var unused = array_create(12);

    // Play a sound when entering C-Up mode
    if (!(sCameraSoundFlags & CAM_SOUND_C_UP_PLAYED)) {
        play_sound_cbutton_up();
        sCameraSoundFlags |= CAM_SOUND_C_UP_PLAYED;
    }

    // Zoom in first
    if (gCameraMovementFlags & CAM_MOVING_INTO_MODE) {
        gCameraMovementFlags |= CAM_MOVE_C_UP_MODE;
        move_into_c_up(c);
        return 1;
    }

    if (!(gCameraMovementFlags & CAM_MOVE_STARTED_EXITING_C_UP)) {
        // Normal update
        move_mario_head_c_up(c);
        update_c_up(c, c.focus, c.pos);
    } else {
        // Exiting C-Up
        if (sStatusFlags & CAM_FLAG_TRANSITION_OUT_OF_C_UP) {
            // Retrieve the previous position and focus
            vec3f_copy(c.pos, sCameraStoreCUp.pos);
            vec3f_add(c.pos, sMarioCamState.pos);
            vec3f_copy(c.focus, sCameraStoreCUp.focus);
            vec3f_add(c.focus, sMarioCamState.pos);
            // Make Mario look forward
            camera_approach_s16_symmetric_bool(sMarioCamState.headRotation[0], 0, 1024);
            camera_approach_s16_symmetric_bool(sMarioCamState.headRotation[1], 0, 1024);
        } else {
            // Finished exiting C-Up
            gCameraMovementFlags &= ~(CAM_MOVE_STARTED_EXITING_C_UP | CAM_MOVE_C_UP_MODE);
        }
    }
    sPanDistance = 0.0;

    // Exit C-Up mode
    if (gPlayer1Controller.buttonPressed & (A_BUTTON | B_BUTTON | D_CBUTTONS | L_CBUTTONS | R_CBUTTONS)) {
        exit_c_up(c);
    }
    return 0;
}

/// <pygml?v=1.0&h=917383019>
/// @function	move_into_c_up(c)
/// @desc		Zooms the camera in for C-Up mode
/// @param		{struct}	c
function move_into_c_up(c) {
    var start = sModeInfo.transitionStart;
    var _end = sModeInfo.transitionEnd;

    var dist = _end.dist - start.dist;
    var pitch = _end.pitch - start.pitch;
    var yaw = _end.yaw - start.yaw;

    // Linearly interpolate from start to end position's polar coordinates
    dist = start.dist + dist * sModeInfo.frame / sModeInfo.max;
    pitch = start.pitch + pitch * sModeInfo.frame / sModeInfo.max;
    yaw = start.yaw + yaw * sModeInfo.frame / sModeInfo.max;

    // Linearly interpolate the focus from start to end
    c.focus[0] = start.focus[0] + (_end.focus[0] - start.focus[0]) * sModeInfo.frame / sModeInfo.max;
    c.focus[1] = start.focus[1] + (_end.focus[1] - start.focus[1]) * sModeInfo.frame / sModeInfo.max;
    c.focus[2] = start.focus[2] + (_end.focus[2] - start.focus[2]) * sModeInfo.frame / sModeInfo.max;

    vec3f_add(c.focus, sMarioCamState.pos);
    vec3f_set_dist_and_angle(c.focus, c.pos, dist, pitch, yaw);

    sMarioCamState.headRotation[0] = 0;
    sMarioCamState.headRotation[1] = 0;

    // Finished zooming in
	++sModeInfo.frame;
    if (sModeInfo.frame == sModeInfo.max) {
        gCameraMovementFlags &= ~CAM_MOVING_INTO_MODE;
    }
}

/// <pygml?v=1.0&h=ac3c0be8d>
/// @function	move_mario_head_c_up(c)
/// @desc		Make Mario's head move in C-Up mode.
/// @param		{struct}	c
function move_mario_head_c_up(c) {
    var pitch = sCUpCameraPitch;
    var yaw = sModeOffsetYaw;

    sCUpCameraPitch += (gPlayer1Controller.stickY * 10.0);
    sModeOffsetYaw -= (gPlayer1Controller.stickX * 10.0);

    // Bound looking up to nearly 80 degrees.
    if (sCUpCameraPitch > 0x38E3) {
        sCUpCameraPitch = 0x38E3;
    }
    // Bound looking down to -45 degrees
    if (sCUpCameraPitch < -0x2000) {
        sCUpCameraPitch = -0x2000;
    }

    // Bound the camera yaw to +-120 degrees
    if (sModeOffsetYaw > 0x5555) {
        sModeOffsetYaw = 0x5555;
    }
    if (sModeOffsetYaw < -0x5555) {
        sModeOffsetYaw = -0x5555;
    }

    // Give Mario's neck natural-looking constraints
    sMarioCamState.headRotation[0] = sCUpCameraPitch * 3 / 4;
    sMarioCamState.headRotation[1] = sModeOffsetYaw * 3 / 4;
}


/// <pygml?v=1.0&h=eb7b23b39>
/// @function	exit_c_up(c)
/// @desc		Zoom the camera out of C-Up mode, avoiding moving into a
///					wall, if possible, by searching for an open  direction.
/// @param		{struct}	c
/// @returns	s32
function exit_c_up(c) {
    var surface = 0;
    var checkFoc = Vec3f;
    var curPos = Vec3f;
    // Variables for searching for an open direction
    var searching = 0;
    /// The current sector of the circle that we are checking
    var sector = 0;
    var ceilHeight = 0;
    var floorHeight = 0;
    var curDist = 0;
    var d = 0;
    var curPitch = 0;
    var curYaw = 0;
    var checkYaw = 0;
    var storePos = Vec3f; // unused
    var storeFoc = Vec3f; // unused

    if ((gCameraMovementFlags & CAM_MOVE_C_UP_MODE) && !(gCameraMovementFlags & CAM_MOVE_STARTED_EXITING_C_UP)) {
        // Copy the stored pos and focus. This is unused.
        vec3f_copy(storePos, sCameraStoreCUp.pos);
        vec3f_add(storePos, sMarioCamState.pos);
        vec3f_copy(storeFoc, sCameraStoreCUp.focus);
        vec3f_add(storeFoc, sMarioCamState.pos);

        vec3f_copy(checkFoc, c.focus);
        checkFoc[@ 0] = sMarioCamState.pos[0];
        checkFoc[@ 2] = sMarioCamState.pos[2];
        vec3f_get_dist_and_angle(checkFoc, c.pos, curDist, curPitch, curYaw);
        vec3f_copy(curPos, c.pos);
        curDist = 80.0;

        // Search for an open direction to zoom out in, if the camera is changing to close, free roam,
        // or spiral-stairs mode
        if (sModeInfo.lastMode == CAMERA_MODE_SPIRAL_STAIRS || sModeInfo.lastMode == CAMERA_MODE_CLOSE ||
            sModeInfo.lastMode == CAMERA_MODE_FREE_ROAM) {
            searching = 1;
            // Check the whole circle around Mario for an open direction to zoom out to
            for (sector = 0; sector < 16 && searching == 1; sector++) {
                vec3f_set_dist_and_angle(checkFoc, curPos, curDist, 0, curYaw + checkYaw);

                // If there are no walls this way,
				var _resA = f32_find_wall_collision(curPos[0], curPos[1], curPos[2], 20.0, 50.0);
				curPos[0] = Ptr.p_xPtr;
				curPos[1] = Ptr.p_yPtr;
				curPos[2] = Ptr.p_zPtr;
                if (_resA == 0) {

                    // Start close to Mario, check for walls, floors, and ceilings all the way to the
                    // zoomed out distance
                    for (d = curDist; d < gCameraZoomDist; d += 20.0) {
                        vec3f_set_dist_and_angle(checkFoc, curPos, d, 0, curYaw + checkYaw);

                        // Check if we're zooming out into a _floor or ceiling
                        ceilHeight = find_ceil(curPos[0], curPos[1] - 150.0, curPos[2], surface) + -10.0;
						
                        if (surface != null && ceilHeight < curPos[1]) {
                            break;
                        }
                        floorHeight = find_floor(curPos[0], curPos[1] + 150.0, curPos[2], surface) + 10.0;
						
                        if (surface != null && floorHeight > curPos[1]) {
                            break;
                        }

                        // Stop checking this direction if there is a wall blocking the way
						var _res = f32_find_wall_collision(curPos[0], curPos[1], curPos[2], 20.0, 50.0);
						curPos[0] = Ptr.p_xPtr;
						curPos[1] = Ptr.p_yPtr;
						curPos[2] = Ptr.p_zPtr;
                        if (_res == 1) {
                            break;
                        }
						
                    }

                    // If there was no collision found all the way to the max distance, it's an opening
                    if (d >= gCameraZoomDist) {
                        searching = 0;
                    }
                }

                // Alternate left and right, checking each 1/16th (22.5 degrees) of the circle
                if (searching == 1) {
                    checkYaw = -checkYaw;
                    if (checkYaw < 0) {
                        checkYaw -= 0x1000;
                    } else {
                        checkYaw += 0x1000;
                    }
                }
            }

            // Update the stored focus and pos to the direction found in the search
            if (searching == 0) {
                vec3f_set_dist_and_angle(checkFoc, sCameraStoreCUp.pos, gCameraZoomDist, 0, curYaw + checkYaw);
                vec3f_copy(sCameraStoreCUp.focus, checkFoc);
                vec3f_sub(sCameraStoreCUp.pos, sMarioCamState.pos);
                vec3f_sub(sCameraStoreCUp.focus, sMarioCamState.pos);
            }

            gCameraMovementFlags |= CAM_MOVE_STARTED_EXITING_C_UP;
            transition_next_state(c, 15);
        } else {
            // Let the next camera mode handle it
            gCameraMovementFlags &= ~(CAM_MOVE_STARTED_EXITING_C_UP | CAM_MOVE_C_UP_MODE);
            vec3f_set_dist_and_angle(checkFoc, c.pos, curDist, curPitch, curYaw + checkYaw);
        }
        play_sound_cbutton_down();
    }
    return 0;
}

/// <pygml?v=1.0&h=885a4f863>
/// @function	transition_next_state(c, frames)
/// @desc		Cause Lakitu to fly to the next Camera position and focus
///					over a number of frames.   At the end of each frame,
///					Lakitu's position and focus ("state") are stored.  Calling
///					this function makes next_lakitu_state() fly from the last
///					frame's state to the  current frame's calculated state.
///					@see next_lakitu_state()
/// @param		{struct}	c
/// @param		{s16}		frames
function transition_next_state(c, frames) {
    if (!(sStatusFlags & CAM_FLAG_FRAME_AFTER_CAM_INIT)) {
        sStatusFlags |= (CAM_FLAG_START_TRANSITION | CAM_FLAG_TRANSITION_OUT_OF_C_UP);
        sModeTransition.framesLeft = frames;
    }
}

/// <pygml?v=1.0&h=42b7a03d9>
/// @function	reduce_by_dist_from_camera(value, maxDist, posX, posY, posZ)
/// @desc		Decrease value by multiplying it by the distance from
///					(`posX`, `posY`, `posZ`) to  the camera divided by `maxDist`
///					@return the reduced value
/// @param		{s16}		value
/// @param		{f32}		maxDist
/// @param		{f32}		posX
/// @param		{f32}		posY
/// @param		{f32}		posZ
/// @returns	s16
function reduce_by_dist_from_camera(value, maxDist, posX, posY, posZ) {
    var pos = Vec3f;
    var dist = 0;
    var pitch = 0;
    var yaw = 0;
    var goalPitch = 0;
    var goalYaw = 0;
    var result = 0;
    // Direction from pos to (Lakitu's) goalPos
    var goalDX = gLakituState.goalPos[0] - posX;
    var goalDY = gLakituState.goalPos[1] - posY;
    var goalDZ = gLakituState.goalPos[2] - posZ;

    dist = sqrt(goalDX * goalDX + goalDY * goalDY + goalDZ * goalDZ);
    if (maxDist > dist) {
        pos[0] = posX;
        pos[1] = posY;
        pos[2] = posZ;
        vec3f_get_dist_and_angle(gLakituState.goalPos, pos, dist, pitch, yaw);
		dist = Ptr.p_dist;
		pitch = Ptr.p_pitch;
		yaw = Ptr.p_yaw;
        if (dist < maxDist) {
            calculate_angles(gLakituState.goalPos, gLakituState.goalFocus, goalPitch, goalYaw);
			goalPitch = Ptr.p_pitch;
			goalYaw = Ptr.p_yaw;
            //! Must be same line to match on -O2
            pitch -= goalPitch;
            yaw -= goalYaw;
            dist -= 2000.0;
            if (dist < 0.0) {
                dist = 0.0;
            }
            maxDist -= 2000.0;
            if (maxDist < 2000.0) {
                maxDist = 2000.0;
            }
            result = value * (1.0 - dist / maxDist);
            if (pitch < -0x1800 || pitch > 0x400 ||
                yaw < -0x1800 || yaw > 0x1800) {
                result /= 2;
            }
        }
    }
    return result;
}

/// <pygml?v=1.0&h=5c8a973e7>
/// @function	calculate_angles(from, to, Ptr.p_pitch, Ptr.p_yaw)
/// @desc		Calculates the pitch and yaw between two vectors.
/// @param		{Vec3f}		from
/// @param		{Vec3f}		to
/// @param		{s16}		Ptr.p_pitch
/// @param		{s16}		Ptr.p_yaw
function calculate_angles(from, to, pitch, yaw) {
    var dx = to[@ 0] - from[@ 0];
    var dy = to[@ 1] - from[@ 1];
    var dz = to[@ 2] - from[@ 2];

    pitch = atan2s(sqrt(dx * dx + dz * dz), dy);
    yaw = atan2s(dz, dx);

    Ptr.p_pitch = pitch;
    Ptr.p_yaw = yaw;
}

/// <pygml?v=1.0&h=8cc214f6c>
/// @function	set_fov_shake_from_point_preset(preset, posX, posY, posZ)
/// @desc		Start a preset fov shake that is reduced by the point's
///					distance from the camera.  Used in
///					set_camera_shake_from_point   @see
///					set_camera_shake_from_point
/// @param		{u8}		preset
/// @param		{f32}		posX
/// @param		{f32}		posY
/// @param		{f32}		posZ
function set_fov_shake_from_point_preset(preset, posX, posY, posZ) {
    switch (preset) {
        case (SHAKE_FOV_SMALL):
            set_fov_shake_from_point(0x100, 0x30, 0x8000, 3000.0, posX, posY, posZ);
            break;
        case (SHAKE_FOV_MEDIUM):
            set_fov_shake_from_point(0x200, 0x30, 0x8000, 4000.0, posX, posY, posZ);
            break;
        case (SHAKE_FOV_LARGE):
            set_fov_shake_from_point(0x300, 0x30, 0x8000, 6000.0, posX, posY, posZ);
            break;
        case (SHAKE_FOV_UNUSED):
            set_fov_shake_from_point(0x800, 0x20, 0x4000, 3000.0, posX, posY, posZ);
            break;
    }
}

/// <pygml?v=1.0&h=d859dd59c>
/// @function	set_fov_shake_from_point(amplitude, decay, shakeSpeed, maxDist, posX, posY, posZ)
/// @desc		Start shaking the camera's field of view, but reduce
///					`amplitude` by distance from camera
/// @param		{s16}		amplitude
/// @param		{s16}		decay
/// @param		{s16}		shakeSpeed
/// @param		{f32}		maxDist
/// @param		{f32}		posX
/// @param		{f32}		posY
/// @param		{f32}		posZ
function set_fov_shake_from_point(amplitude, decay, shakeSpeed, maxDist, posX, posY, posZ) {
    amplitude = reduce_by_dist_from_camera(amplitude, maxDist, posX, posY, posZ);

    if (amplitude != 0) {
        if (amplitude > sFOVState.shakeAmplitude) {
            sFOVState.shakeAmplitude = amplitude;
            sFOVState.decay = decay;
            sFOVState.shakeSpeed = shakeSpeed;
        }
    }
}

/// <pygml?v=1.0&h=8d20c66ec>
/// @function	set_fov_shake(amplitude, decay, shakeSpeed)
/// @desc		Start shaking the camera's field of view.   @param
///					shakeSpeed How fast the shake should progress through its
///					period. The shake offset is                    calculated
///					from coss(), so this parameter can be thought of as an
///					angular velocity.
/// @param		{s16}		amplitude
/// @param		{s16}		decay
/// @param		{s16}		shakeSpeed
function set_fov_shake(amplitude, decay, shakeSpeed) {
    if (amplitude > sFOVState.shakeAmplitude) {
        sFOVState.shakeAmplitude = amplitude;
        sFOVState.decay = decay;
        sFOVState.shakeSpeed = shakeSpeed;
    }
}

/// <pygml?v=1.0&h=28f5fb6aa>
/// @function	camera_course_processing(c)
/// @desc		Activates any CameraTriggers that Mario is inside.  Then,
///					applies area-specific processing to the camera, such as
///					setting the default mode, or changing  the mode based on the
///					terrain type Mario is standing on.   @return the camera's
///					mode after processing, although this is unused in the code
/// @param		{struct}	c
/// @returns	s16
function camera_course_processing(c) {
    var level = gCurrLevelNum;
    var mode = 0;
    var area = gCurrentArea.index;
    // Bounds iterator
    var b = 0;
    // Camera trigger's bounding box
    var center = Vec3f;
	var bounds = Vec3f;
    var insideBounds = false;
    var oldMode = c.mode;

    if (c.mode == CAMERA_MODE_C_UP) {
        c.mode = sModeInfo.lastMode;
    }
    check_blocking_area_processing(c.mode);
    if (level > LEVEL_COUNT + 1) {
        level = LEVEL_COUNT + 1;
    }

    if (sCameraTriggers[level] != null) {
        b = 0;

        // Process positional triggers.
        // All triggered events are called, not just the first one.
        while (true) {

            // Check only the current area's triggers
            if (sCameraTriggers[level][b].area == area) {
                // Copy the bounding box into center and bounds
                vec3f_set(center, sCameraTriggers[level][b].centerX,
                    sCameraTriggers[level][b].centerY,
                    sCameraTriggers[level][b].centerZ);
                vec3f_set(bounds, sCameraTriggers[level][b].boundsX,
                    sCameraTriggers[level][b].boundsY,
                    sCameraTriggers[level][b].boundsZ);

                // Check if Mario is inside the bounds
                if (is_pos_in_bounds(sMarioCamState.pos, center, bounds,
                        sCameraTriggers[level][b].boundsYaw) == true) {						

                    //! This should be checked before calling is_pos_in_bounds. (It doesn't belong
                    //! outside the while loop because some events disable area processing)
                    if (!(sStatusFlags & CAM_FLAG_BLOCK_AREA_PROCESSING)) {
                        sCameraTriggers[level][b].event(c);
                        insideBounds = true;
						
                    }
                }
            }

            if (sCameraTriggers[level][b].area == -1) {
                // Default triggers are only active if Mario is not already inside another trigger
                if (!insideBounds) {
                    if (!(sStatusFlags & CAM_FLAG_BLOCK_AREA_PROCESSING)) {
                        sCameraTriggers[level][b].event(c);
                    }
                }
            }

            b += 1;
			if (b>=array_length(sCameraTriggers[level])) break;
        }
    }

	var _AREA_WF			= AREA_WF;
	var _AREA_BBH			= AREA_BBH;
	var _AREA_SSL_PYRAMID	= AREA_SSL_PYRAMID;
	var _AREA_SSL_OUTSIDE	= AREA_SSL_OUTSIDE;
	var _AREA_THI_HUGE		= AREA_THI_HUGE;
	var _AREA_THI_TINY		= AREA_THI_TINY;
	var _AREA_TTC			= AREA_TTC;
	var _AREA_BOB			= AREA_BOB;
	var _AREA_WDW_MAIN		= AREA_WDW_MAIN;
	var _AREA_WDW_TOWN		= AREA_WDW_TOWN;
	var _AREA_DDD_WHIRLPOOL = AREA_DDD_WHIRLPOOL;
	var _AREA_DDD_SUB		= AREA_DDD_SUB;
	
    // Area-specific camera processing
    if (!(sStatusFlags & CAM_FLAG_BLOCK_AREA_PROCESSING)) {
        switch (gCurrLevelArea) {
            case (_AREA_WF):
                if (sMarioCamState.action == ACT_RIDING_HOOT) {
                    transition_to_camera_mode(c, CAMERA_MODE_SLIDE_HOOT, 60);
                } else {
                    switch (sMarioGeometry.currFloorType) {
                        case (SURFACE_CAMERA_8_DIR):
                            transition_to_camera_mode(c, CAMERA_MODE_8_DIRECTIONS, 90);
                            s8DirModeBaseYaw = DEGREES(90);
                            break;

                        case (SURFACE_BOSS_FIGHT_CAMERA):
                            if (gCurrActNum == 1) {
                                set_camera_mode_boss_fight(c);
                            } else {
                                set_camera_mode_radial(c, 60);
                            }
                            break;
                        default:
                            set_camera_mode_radial(c, 60);
                    }
                }
                break;

            case (_AREA_BBH):
                // if camera is fixed at bbh_room_13_balcony_camera (but as floats)
                if (vec3f_compare(sFixedModeBasePosition, 210.0, 420.0, 3109.0) == 1) {
                    if (sMarioCamState.pos[1] < 1800.0) {
                        transition_to_camera_mode(c, CAMERA_MODE_CLOSE, 30);
                    }
                }
                break;

            case (_AREA_SSL_PYRAMID):
                set_mode_if_not_set_by_surface(c, CAMERA_MODE_OUTWARD_RADIAL);
                break;

            case (_AREA_SSL_OUTSIDE):
                set_mode_if_not_set_by_surface(c, CAMERA_MODE_RADIAL);
                break;

            case (_AREA_THI_HUGE):
                break;

            case (_AREA_THI_TINY):
                surface_type_modes_thi(c);
                break;

            case (_AREA_TTC):
                set_mode_if_not_set_by_surface(c, CAMERA_MODE_OUTWARD_RADIAL);
                break;

            case (_AREA_BOB):
                if (set_mode_if_not_set_by_surface(c, CAMERA_MODE_NONE) == 0) {
                    if (sMarioGeometry.currFloorType == SURFACE_BOSS_FIGHT_CAMERA) {
                        set_camera_mode_boss_fight(c);
                    } else {
                        if (c.mode == CAMERA_MODE_CLOSE) {
                            transition_to_camera_mode(c, CAMERA_MODE_RADIAL, 60);
                        } else {
                            set_camera_mode_radial(c, 60);
                        }
                    }
                }
                break;

            case (_AREA_WDW_MAIN):
                if (sMarioGeometry.currFloorType == SURFACE_INSTANT_WARP_1B) {
                    if (0) {}
                    c.defMode = CAMERA_MODE_RADIAL;
                    if (0) {}
                }
                break;

            case (_AREA_WDW_TOWN):
                if (sMarioGeometry.currFloorType == SURFACE_INSTANT_WARP_1C) {
                    if (0) {}
                    c.defMode = CAMERA_MODE_CLOSE;
                    if (0) {}
                }
                break;

            case (_AREA_DDD_WHIRLPOOL):
                //! @bug this does nothing
                gLakituState.defMode = CAMERA_MODE_OUTWARD_RADIAL;
                break;

            case (_AREA_DDD_SUB):
                if ((c.mode != CAMERA_MODE_BEHIND_MARIO) &&
                    (c.mode != CAMERA_MODE_WATER_SURFACE)) {
                    if (((sMarioCamState.action & ACT_FLAG_ON_POLE) != 0) ||
                        (sMarioGeometry.currFloorHeight > 800.0)) {
                        transition_to_camera_mode(c, CAMERA_MODE_8_DIRECTIONS, 60);

                    } else {
                        if (sMarioCamState.pos[1] < 800.0) {
                            transition_to_camera_mode(c, CAMERA_MODE_FREE_ROAM, 60);
                        }
                    }
                }
                //! @bug this does nothing
                gLakituState.defMode = CAMERA_MODE_FREE_ROAM;
                break;
        }
    }

    sStatusFlags &= ~CAM_FLAG_BLOCK_AREA_PROCESSING;
    if (oldMode == CAMERA_MODE_C_UP) {
        sModeInfo.lastMode = c.mode;
        c.mode = oldMode;
    }
    mode = c.mode;
    return mode;
}

/// <pygml?v=1.0&h=03e6a43ae>
/// @function	check_blocking_area_processing(mode)
/// @desc		Block area-specific CameraTrigger and special surface modes.
///					Generally, block area mode changes if:       Mario is
///					wearing the metal cap, or at the water's surface, or the
///					camera is in Mario mode   However, if the level is WDW, DDD,
///					or COTMC (levels that have metal cap and water):       Only
///					block area mode changes if Mario is in a cannon,       or if
///					the camera is in Mario mode and Mario is not swimming or in
///					water with the metal cap
/// @param		{const}		mode
function check_blocking_area_processing(mode) {
    if (sMarioCamState.action & ACT_FLAG_METAL_WATER ||
        mode == CAMERA_MODE_BEHIND_MARIO || mode == CAMERA_MODE_WATER_SURFACE) {
        sStatusFlags |= CAM_FLAG_BLOCK_AREA_PROCESSING;
    }

    if (gCurrLevelNum == LEVEL_DDD || gCurrLevelNum == LEVEL_WDW || gCurrLevelNum == LEVEL_COTMC) {
        sStatusFlags &= ~CAM_FLAG_BLOCK_AREA_PROCESSING;
    }

    if ((mode == CAMERA_MODE_BEHIND_MARIO &&
            !(sMarioCamState.action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER))) ||
        mode == CAMERA_MODE_INSIDE_CANNON) {
        sStatusFlags |= CAM_FLAG_BLOCK_AREA_PROCESSING;
    }

    Ptr.p_mode = mode;
}

/// <pygml?v=1.0&h=eb0bc6275>
/// @function	transition_to_camera_mode(c, newMode, numFrames)
/// @desc		Sets the camera mode to `newMode` and initializes
///					sModeTransition with `numFrames` frames   Used to change the
///					camera mode to 'level-oriented' modes       namely:
///					RADIAL/OUTWARD_RADIAL, 8_DIRECTIONS, FREE_ROAM, CLOSE,
///					SPIRAL_STAIRS, and SLIDE_HOOT
/// @param		{struct}	c
/// @param		{s16}		newMode
/// @param		{s16}		numFrames
function transition_to_camera_mode(c, newMode, numFrames) {
    if (c.mode != newMode) {
        sModeInfo.newMode = (newMode != -1) ? newMode : sModeInfo.lastMode;
        sModeInfo.lastMode = c.mode;
        c.mode = sModeInfo.newMode;

        // Clear movement flags that would affect the transition
        gCameraMovementFlags &= ~(CAM_MOVE_RESTRICT | CAM_MOVE_ROTATE);
        if (!(sStatusFlags & CAM_FLAG_FRAME_AFTER_CAM_INIT)) {
            transition_next_state(c, numFrames);
            sCUpCameraPitch = 0;
            sModeOffsetYaw = 0;
            sLakituDist = 0;
            sLakituPitch = 0;
            sAreaYawChange = 0;
            sPanDistance = 0.0;
            sCannonYOffset = 0.0;
        }
    }
}

/// <pygml?v=1.0&h=1b30c9664>
/// @function	zoom_out_if_paused_and_outside(camera)
/// @param		{struct}	camera
function zoom_out_if_paused_and_outside(camera) {
    var unused1 = array_create(8);
    var dist = 0;
    var pitch = 0;
    var yaw = 0;
    var unused2 = array_create(4);
    var areaMaskIndex = gCurrLevelArea / 32;
    var areaBit = 1 << (((gCurrLevelArea & 0x10) / 4) + (((gCurrLevelArea & 0xF) - 1) & 3));

    if (areaMaskIndex >= LEVEL_MAX / 2) {
        areaMaskIndex = 0;
        areaBit = 0;
    }
    if (gCameraMovementFlags & CAM_MOVE_PAUSE_SCREEN) {
        if (sFramesPaused >= 2) {
            //if (sZoomOutAreaMasks[areaMaskIndex] & areaBit) {

                camera.focus[0] = gCamera.areaCenX;
                camera.focus[1] = (sMarioCamState.pos[1] + gCamera.areaCenY) / 2;
                camera.focus[2] = gCamera.areaCenZ;
                vec3f_get_dist_and_angle(camera.focus, sMarioCamState.pos, dist, pitch, yaw);
				dist = Ptr.p_dist;
				pitch = Ptr.p_pitch;
				yaw = Ptr.p_yaw;
                vec3f_set_dist_and_angle(sMarioCamState.pos, camera.pos, 6000.0, 0x1000, yaw);
                if (gCurrLevelNum != LEVEL_THI) {
                    find_in_bounds_yaw_wdw_bob_thi(camera.pos, camera.focus, 0);
                }
           // } // @z
        } else {
            sFramesPaused++;
        }
    } else {
        sFramesPaused = 0;
    }
}

/// <pygml?v=1.0&h=1afa52e47>
/// @function	mode_parallel_tracking_camera(c)
/// @desc		Parallel tracking mode, the camera faces perpendicular to a
///					line defined by sParTrackPath   @see
///					update_parallel_tracking_camera
/// @param		{struct}	c
function mode_parallel_tracking_camera(c) {
    var dummy;

    radial_camera_input(c, 0.0);
    set_fov_function(CAM_FOV_DEFAULT);
    c.nextYaw = update_parallel_tracking_camera(c, c.focus, c.pos);
    camera_approach_s16_symmetric_bool(dummy, 0, 0x0400);
}

function set_fov_function(func) {
    sFOVState.fovFunc = func;
}

/// <pygml?v=1.0&h=3975c2712>
/// @function	radial_camera_input(c, unused)
/// @desc		Handles input for radial, outwards radial, parallel
///					tracking, and 8 direction mode.
/// @param		{struct}	c
/// @param		{f32}		unused
/// @returns	s32
function radial_camera_input(c, unused) {
    var dummy = null;

    if ((gCameraMovementFlags & CAM_MOVE_ENTERED_ROTATE_SURFACE) || !(gCameraMovementFlags & CAM_MOVE_ROTATE)) {

        // If C-L or C-R are pressed, the camera is rotating
        if (gPlayer1Controller.buttonPressed & (L_CBUTTONS | R_CBUTTONS)) {
            gCameraMovementFlags &= ~CAM_MOVE_ENTERED_ROTATE_SURFACE;
            //  @bug this does not clear the rotation flags set by the surface. It's possible to set
            //       both ROTATE_LEFT and ROTATE_RIGHT, locking the camera.
            //       Ex: If a surface set CAM_MOVE_ROTATE_RIGHT and the user presses C-R, it locks the
            //       camera until a different mode is activated
        }

        // Rotate Right and left
        if (gPlayer1Controller.buttonPressed & R_CBUTTONS) {
            if (sModeOffsetYaw > -0x800) {
                // The camera is now rotating right
                if (!(gCameraMovementFlags & CAM_MOVE_ROTATE_RIGHT)) {
                    gCameraMovementFlags |= CAM_MOVE_ROTATE_RIGHT;
                }

                if (c.mode == CAMERA_MODE_RADIAL) {
                    // if > ~48 degrees, we're rotating for the second time.
                    if (sModeOffsetYaw > 0x22AA) {
                        s2ndRotateFlags |= CAM_MOVE_ROTATE_RIGHT;
                    }

                    if (sModeOffsetYaw == DEGREES(105)) {
                        play_sound_button_change_blocked();
                    } else {
                        play_sound_cbutton_side();
                    }
                } else {
                    if (sModeOffsetYaw == DEGREES(60)) {
                        play_sound_button_change_blocked();
                    } else {
                        play_sound_cbutton_side();
                    }
                }
            } else {
                gCameraMovementFlags |= CAM_MOVE_RETURN_TO_MIDDLE;
                play_sound_cbutton_up();
            }
        }
        if (gPlayer1Controller.buttonPressed & L_CBUTTONS) {
            if (sModeOffsetYaw < 0x800) {
                if (!(gCameraMovementFlags & CAM_MOVE_ROTATE_LEFT)) {
                    gCameraMovementFlags |= CAM_MOVE_ROTATE_LEFT;
                }

                if (c.mode == CAMERA_MODE_RADIAL) {
                    // if < ~48 degrees, we're rotating for the second time.
                    if (sModeOffsetYaw < -0x22AA) {
                        s2ndRotateFlags |= CAM_MOVE_ROTATE_LEFT;
                    }

                    if (sModeOffsetYaw == DEGREES(-105)) {
                        play_sound_button_change_blocked();
                    } else {
                        play_sound_cbutton_side();
                    }
                } else {
                    if (sModeOffsetYaw == DEGREES(-60)) {
                        play_sound_button_change_blocked();
                    } else {
                        play_sound_cbutton_side();
                    }
                }
            } else {
                gCameraMovementFlags |= CAM_MOVE_RETURN_TO_MIDDLE;
                play_sound_cbutton_up();
            }
        }
    }

    // Zoom in / enter C-Up
    if (gPlayer1Controller.buttonPressed & U_CBUTTONS) {
        if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
            gCameraMovementFlags &= ~CAM_MOVE_ZOOMED_OUT;
            play_sound_cbutton_up();
        } else {
            set_mode_c_up(c);
        }
    }

    // Zoom out
    if (gPlayer1Controller.buttonPressed & D_CBUTTONS) {
        if (gCameraMovementFlags & CAM_MOVE_ZOOMED_OUT) {
            gCameraMovementFlags |= CAM_MOVE_ALREADY_ZOOMED_OUT;
            play_camera_buzz_if_cdown();
        } else {
            gCameraMovementFlags |= CAM_MOVE_ZOOMED_OUT;
            play_sound_cbutton_down();
        }
    }

    //! returning uninitialized variable
    return dummy;
}


/// <pygml?v=1.0&h=bb3dd76c9>
/// @function	rotate_in_yz(dst, src, pitch)
/// @desc		Rotates a vector in the YZ plane and copies it to a new
///					vector.   Note: This function also flips the Z axis, so +Z
///					moves forward, not backward like it would in world  space.
///					If possible, use vec3f_set_dist_and_angle()
/// @param		{Vec3f}		dst
/// @param		{Vec3f}		src
/// @param		{s16}		pitch
function rotate_in_yz(dst, src, pitch) {
    var tempVec = Vec3f;

    vec3f_copy(tempVec, src);
    dst[@ 2] = -(tempVec[2] * coss(pitch) - tempVec[1] * sins(pitch));
    dst[@ 1] = tempVec[2] * sins(pitch) + tempVec[1] * coss(pitch);
    dst[@ 0] = tempVec[0];
}

/// <pygml?v=1.0&h=29e9577e9>
/// @function	set_fov_45(m)
/// @param		{struct}	m
function set_fov_45(m) {
    sFOVState.fov = 45.0;
}

/// <pygml?v=1.0&h=830129b87>
/// @function	set_fov_29(m)
/// @param		{struct}	m
function set_fov_29(m) {
    sFOVState.fov = 29.0;
}

/// <pygml?v=1.0&h=b7d207726>
/// @function	zoom_fov_30(m)
/// @param		{struct}	m
function zoom_fov_30(m) {
    camera_approach_f32_symmetric_bool(sFOVState.fov, 30.0, (30.0 - sFOVState.fov) / 60.0);
	sFOVState.fov = Ptr.p_current;
}

/// <pygml?v=1.0&h=3d4c36b37>
/// @function	set_fov_bbh(m)
/// @desc		Sets the fov in BBH.  If there's a cutscene, sets fov to 45.
///					Otherwise sets fov to 60.
/// @param		{struct}	m
function set_fov_bbh(m) {
    var targetFoV = sFOVState.fov;

    if (m.area.camera.mode == CAMERA_MODE_FIXED && m.area.camera.cutscene == 0) {
        targetFoV = 60.0;
    } else {
        targetFoV = 45.0;
    }

    sFOVState.fov = approach_f32(sFOVState.fov, targetFoV, 2.0, 2.0);
}

/// <pygml?v=1.0&h=82d9e5592>
/// @function	approach_fov_45(m)
/// @param		{struct}	m
function approach_fov_45(m) {
    var targetFoV = sFOVState.fov;

    if (m.area.camera.mode == CAMERA_MODE_FIXED && m.area.camera.cutscene == 0) {
        targetFoV = 45.0;
    } else {
        targetFoV = 45.0;
    }

    sFOVState.fov = approach_f32(sFOVState.fov, targetFoV, 2.0, 2.0);
}

/// <pygml?v=1.0&h=32bafedc9>
/// @function	set_fov_30(m)
/// @param		{struct}	m
function set_fov_30(m) {
    sFOVState.fov = 30.0;
}

/// <pygml?v=1.0&h=b2a7f2078>
/// @function	approach_fov_20(m)
/// @param		{struct}	m
function approach_fov_20(m) {
    camera_approach_f32_symmetric_bool(sFOVState.fov, 20.0, 0.3);
	sFOVState.fov = Ptr.p_current;
}

/// <pygml?v=1.0&h=487f13a22>
/// @function	approach_fov_80(m)
/// @param		{struct}	m
function approach_fov_80(m) {
    camera_approach_f32_symmetric_bool(sFOVState.fov, 80.0, 3.5);
	sFOVState.fov = Ptr.p_current;
}

/// <pygml?v=1.0&h=516e58541>
/// @function	approach_fov_30(m)
/// @param		{struct}	m
function approach_fov_30(m) {
    camera_approach_f32_symmetric_bool(sFOVState.fov, 30.0, 1.0);
	sFOVState.fov = Ptr.p_current;
}

/// <pygml?v=1.0&h=c433f73ea>
/// @function	approach_fov_60(m)
/// @param		{struct}	m
function approach_fov_60(m) {
    camera_approach_f32_symmetric_bool(sFOVState.fov, 60.0, 1.0);
	sFOVState.fov = Ptr.p_current;
}

/// <pygml?v=1.0&h=e32884e53>
/**
 * The default mode when outside of the lobby and spiral staircase. A trigger for this is placed at
 * every door leaving the lobby and spiral staircase.
 */
function cam_castle_close_mode(c) {
    set_camera_mode_close_cam(c.mode);
	c.mode = Ptr.p_mode;
}

/// <pygml?v=1.0&h=cf34c21af>
/// @function	set_camera_mode_close_cam(Ptr.p_mode)
/// @param		{u8}		Ptr.p_mode
function set_camera_mode_close_cam(mode) {
    if (mode != CAMERA_MODE_CLOSE) {
        sStatusFlags &= ~CAM_FLAG_SMOOTH_MOVEMENT;
        mode = CAMERA_MODE_CLOSE;
    }

    Ptr.p_mode = mode;
}

function cam_castle_enter_lobby_sliding_door(c) {
    cam_castle_enter_lobby(c);
}

function cam_castle_leave_lobby_sliding_door(c) {
    cam_castle_close_mode(c);
    c.doorStatus = DOOR_ENTER_LOBBY;
}

function cam_castle_enter_spiral_stairs(c) {
    transition_to_camera_mode(c, CAMERA_MODE_SPIRAL_STAIRS, 20);
}

function cam_castle_look_upstairs(c) {
    var _floor = {};
    var floorHeight = find_floor(c.pos[0], c.pos[1], c.pos[2], _floor);
	_floor = _floor._floor;
	
    // If Mario is on the first few steps, fix the camera pos, making it look up
    if ((sMarioGeometry.currFloorHeight > 1229.0) && (floorHeight < 1229.0)
        && (sCSideButtonYaw == 0)) {
        vec3f_set(c.pos, -227.0, 1425.0, 1533.0);
    }
}

function cam_castle_basement_look_downstairs(c) {
    var _floor = {};
    var floorHeight = find_floor(c.pos[0], c.pos[1], c.pos[2], _floor);
	_floor = _floor._floor;

    // Fix the camera pos, making it look downwards. Only active on the top few steps
    if ((floorHeight > -110.0) && (sCSideButtonYaw == 0)) {
        vec3f_set(c.pos, -980.0, 249.0, -1398.0);
    }
}

function cam_castle_lobby_entrance(c) {
    vec3f_set(sCastleEntranceOffset, -813.0 - sFixedModeBasePosition[0],
              378.0 - sFixedModeBasePosition[1], 1103.0 - sFixedModeBasePosition[2]);
}

function cam_castle_hmc_start_pool_cutscene(c) {
    if ((sMarioCamState.action != ACT_SPECIAL_DEATH_EXIT)
        && (sMarioCamState.action != ACT_SPECIAL_EXIT_AIRBORNE)) {
        start_cutscene(c, CUTSCENE_ENTER_POOL);
    }
}


function CameraTrigger(_area, _event, _centerX, _centerY, _centerZ, _boundsX, _boundsY, _boundsZ, _boundsYaw) constructor {
    /**
     * The area this should be checked in, or -1 if it should run in every area of the level.
     *
     * Triggers with area set to -1 are run by default, they don't care if Mario is inside their bounds.
     * However, they are only active if Mario is not already inside an area-specific trigger's
     * boundaries.
     */
    area = _area;
    /// A function that gets called while Mario is in the trigger bounds
    event = _event;
    // The (x,y,z) position of the center of the bounding box
    centerX = _centerX;
    centerY = _centerY;
    centerZ = _centerZ;
    // The max displacement in x, y, and z from the center for a point to be considered inside the
    // bounding box
    boundsX = _boundsX;
    boundsY = _boundsY;
    boundsZ = _boundsZ;
    /// This angle rotates Mario's offset from the box's origin, before it is checked for being inside.
    boundsYaw = _boundsYaw;
}

/// <pygml?v=1.0&h=e2c189418>
/// @function	is_pos_in_bounds(pos, center, bounds, boundsYaw)
/// @desc		Effectively created a rectangular prism defined by a vector
///					starting at the center  and extending to the corners. If the
///					position is in this box, the function returns true.
/// @param		{Vec3f}		pos
/// @param		{Vec3f}		center
/// @param		{Vec3f}		bounds
/// @param		{s16}		boundsYaw
/// @returns	s32
function is_pos_in_bounds(pos, center, bounds, boundsYaw) {
    var inBound = false;
    var rel = Vec3f;

    rel[0] = center[@ 0] - pos[@ 0];
    rel[1] = center[@ 1] - pos[@ 1];
    rel[2] = center[@ 2] - pos[@ 2];

    rotate_in_xz(rel, rel, boundsYaw);

    if (-bounds[@ 0] < rel[0] && rel[0] < bounds[@ 0] &&
        -bounds[@ 1] < rel[1] && rel[1] < bounds[@ 1] &&
        -bounds[@ 2] < rel[2] && rel[2] < bounds[@ 2]) {
        inBound = true;
    }
    return inBound;
}

/// <pygml?v=1.0&h=9bc0ad695>
/// @function	cutscene_door_mode(c)
/// @param		{struct}	c
function cutscene_door_mode(c) {
    var pad = array_create(2);

    reset_pan_distance(c);
    camera_course_processing(c);

    if (c.mode == CAMERA_MODE_FIXED) {
        c.nextYaw = update_fixed_camera(c, c.focus, c.pos);
    }
    if (c.mode == CAMERA_MODE_PARALLEL_TRACKING) {
        c.nextYaw = update_parallel_tracking_camera(c, c.focus, c.pos);
    }

    c.yaw = c.nextYaw;

    // Loop until Mario is no longer using the door
    if (sMarioCamState.action != ACT_ENTERING_STAR_DOOR &&
        sMarioCamState.action != ACT_PULLING_DOOR &&
        sMarioCamState.action != ACT_PUSHING_DOOR) {
        gCutsceneTimer = CUTSCENE_STOP;
        c.cutscene = 0;
    }
}

/// <pygml?v=1.0&h=50c8ca35c>
/// @function	reset_pan_distance(c)
/// @param		{struct}	c
function reset_pan_distance(c) {
    sPanDistance = 0;
}

