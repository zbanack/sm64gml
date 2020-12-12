globalvar INITIALIZED;
INITIALIZED = false;

enum Boot { BT_WELCOME, BT_OVERHEAD, BT_AUTH, BT_WINDOW, BT_ARRAY_CLASS, BT_PLACEHOLDER_LEVEL_SCRIPTS,
	BT_PLACEHOLDER_BEHAVIORS, BT_PLACEHOLDER_COLLISIONS, BT_POINTERS, BT_SM64_H,
	BT_TEXTURE_SCRIPTS, BT_N64_GFX, BT_GAME_SCRIPTS, BT_INPUT_SCRIPTS, BT_GBI_SCIPTS,
	BT_GEO_LAYOUT_SCRIPTS, BT_GEO_RENDERER, BT_MATH_UTIL, BT_GD_MATH, BT_GD_TYPES,
	BT_VERTEX_INDICES, BT_SURFACE_LOAD, BT_DEBUG_TIMER, BT_GAME_INIT_H, BT_AUDIO,
	BT_ANIMATED_FLOOR, BT_BEHAVIOR_SPAWN_PARTICLES, BT_BEHAVIOR_OBJ_LIST_MACROS,
	BT_SURFACE_TERRAIN, BT_SURFACE_COLLISION, BT_BHEAVIOR_COMMANDS, BT_DIALOG_IDS,
	BT_MACRO_PRESETS, BT_MACRO_PRESET_SCRIPT_MACROS, BT_TYPES_H, BT_SPECIAL_PRESET_NAMES,
	BT_SPECIAL_PRESETS, BT_OBJECT_CONSTANTS, BT_OBJECT_FIELDS, BT_MARIO_ANIMATION,
	BT_MARIO_GEO_SWITCH, BT_MARIO_C, BT_MARIO_MISC, BT_MARIO_STEP, BT_MARIO_ACTIONS_AUTOMATIC,
	BT_MARIO_ACTIONS_CUTSCENE, BT_MARIO_ACTIONS_MOVING, BT_MARIO_ACTIONS_OBJECT, BT_INTERACTION,
	BT_SEQUENCE, BT_CAMERA, BT_GRAPH_NODE, BT_HUD, BT_INGAME_MENUS, BT_LEVEL_COMMANDS, BT_LEVEL_UPDATE_SCRIPTS,
	BT_OBJECT_BEHAVIORS, BT_OBJECT_BEHAVIORS_2, BT_OBJECT_HELPERS, BT_OBJECT_LIST_PROCESSOR,
	BT_PLATFORM_DISPLACEMENT, BT_PRINT_SCRIPTS, BT_SAVE_FILE_SCRIPTS, BT_SEGMENT2_MACROS,
	BT_SHADOW_SCRIPTS, BT_SPAWN_SCRIPTS, BT_AREA_SCRIPTS, BT_BIN_SKY, BT_BIN_INSIDE, BT_BIN_GENERIC,
	BT_BIN_MOUNTAIN, BT_BIN_SNOW, BT_BIN_SPOOKY, BT_BIN_WATER, BT_SKYBOXES, BT_GRAPHICS_MACROS, BT_TEXTURE_DEF_SCRIPT,
	BT_BEHAVIORS_INIT, BT_LEVEL_INIT_SCRIPT,
	BT_POST_LEVEL_BEHAVIORS, BT_MACRO_OBJECT_PRESETS, BT_SPECIAL_OBJECT_PRESENTS, BT_FINALIZE_LEVEL,
	BT_ENTRY_C_MACROS, BT_ENTER_MAIN_LOOP, count
}
	
/// @function	sm64_init(string:baserom_directory, LEVEL:debug_goto_course, int:course_arae)
function sm64_init(baserom_directory, debug_goto_course, debug_goto_course_area) {
	
	// set gamespeed here
	globalvar GOAL_FPS;
	GOAL_FPS = 30;
	
	if (INITIALIZED) return;
	
	// reference to controller object
	globalvar sm64;
	sm64 = instance_find(Object1, 0);
	
	// location of decomp directory on OS
	globalvar ROM_DIR;
	ROM_DIR = base64_encode(baserom_directory);

	// temporary solution to go from level to level
	// @TODO use authentic level system, this 
	globalvar CURRENT_LEVEL, CURRENT_LEVEL_AREA;
	CURRENT_LEVEL = debug_goto_course;
	CURRENT_LEVEL_AREA = max(1, debug_goto_course_area);
	
	globalvar BOOT_STEP;
	BOOT_STEP = 0;
	
	window_set_caption("sm64.gml");
	
	boot_stack = ds_list_create();
	
}

function sm64_booting() {
	
	if (INITIALIZED) return;
	
	// force 60 fps through boot
	game_set_speed(60, gamespeed_fps);
	
	// scripts necessary to boot into the correct level
	var texture_def_script = null,
		level_init_script = null,
		level_script = null;
	
	switch(CURRENT_LEVEL) {
		case(LEVEL_WF):
			texture_def_script	= wf_texture_define;
			level_init_script	= wf_init;
			level_script		= wf_script;
		break;
		case(LEVEL_PSS):
			texture_def_script	= pss_texture_define;
			level_init_script	= pss_init;
			level_script		= pss_script;
		break;
		case(LEVEL_SSL):
			texture_def_script	= ssl_texture_define;
			level_init_script	= ssl_init;
			level_script		= ssl_script;
		break;
		case(LEVEL_JRB):
			texture_def_script	= jrb_texture_define;
			level_init_script	= jrb_init;
			level_script		= jrb_script;
		break;
		case(LEVEL_BBH):
			texture_def_script	= bbh_texture_define;
			level_init_script	= bbh_init;
			level_script		= bbh_script;
		break;
		case(LEVEL_TTM):
			texture_def_script	= ttm_texture_define;
			level_init_script	= ttm_init;
			level_script		= ttm_script;
		break;
		case(LEVEL_CCM):
			texture_def_script	= ccm_texture_define;
			level_init_script	= ccm_init;
			level_script		= ccm_script;
		break;
		case(LEVEL_BITDW):
			texture_def_script	= bitdw_texture;
			level_init_script	= bitdw_init;
			level_script		= bitdw_script;
		break;
		case(LEVEL_CASTLE):
			texture_def_script	= castle_inside_textures;
			level_init_script	= castle_inside_init;
			level_script		= castle_inside_script;
		break;
		case(LEVEL_CASTLE_GROUNDS):
			texture_def_script	= castle_grounds_texture_define;
			level_init_script	= castle_grounds_init;
			level_script		= castle_grounds_script;
		break;
		case(LEVEL_BOB):
			texture_def_script	= bob_texture_define;
			level_init_script	= bob_init;
			level_script		= bob_script;
		break;
		default:
			throw("\nbooting into undefined level");
		break;
	}

	switch(BOOT_STEP) {
		case(Boot.BT_WELCOME):
			boot("welcome to sm64.gml :)");
		break;
	
		case(Boot.BT_AUTH):
			/**
			 * ensure possession of valid game copy in `ROM_DIR`
			 */
			authenticate_ownership();
		break;
	
		/**
		 * Pre-game A
		 */
		case(Boot.BT_OVERHEAD):
			gm_overhead_macros_init();
		break;
		case(Boot.BT_WINDOW):
			window_macros_init();
		break;
		case(Boot.BT_ARRAY_CLASS):
			array_class_macros_init();
		break;
		case(Boot.BT_PLACEHOLDER_LEVEL_SCRIPTS):
			immediate_placeholders_level_scripts();
		break;
		case(Boot.BT_PLACEHOLDER_BEHAVIORS):
			immediate_placeholders_behaviors_init();
		break;
		case(Boot.BT_PLACEHOLDER_COLLISIONS):
			immediate_placeholders_collision_init();
		break;
		case(Boot.BT_POINTERS):
			sm64_pointers_init();
		break;
		case(Boot.BT_SM64_H):
			sm64_h_macros_init();
		break;
		case(Boot.BT_TEXTURE_SCRIPTS):
			texture_scripts_macros_init();
		break;
		case(Boot.BT_N64_GFX):
			n64_gfx_scripts_macros_init();
		break;
		case(Boot.BT_GAME_SCRIPTS):
			game_scripts_macros_init();
		break;
		case(Boot.BT_INPUT_SCRIPTS):
			input_scripts_macros_init();
		break;
		case(Boot.BT_GBI_SCIPTS):
			gbi_scripts_macros_init();
		break;
		case(Boot.BT_GEO_LAYOUT_SCRIPTS):
			geo_layout_scripts_macros_init();
		break;
		case(Boot.BT_GEO_RENDERER):
			geo_renderer_scripts_macros_init();
		break;
		case(Boot.BT_MATH_UTIL):
			math_util_macros_init();
		break;
		case(Boot.BT_GD_MATH):
			gd_math_macros_init();
		break;
		case(Boot.BT_GD_TYPES):
			gd_types_macros_init();
		break;
		case(Boot.BT_VERTEX_INDICES):
			vertex_indices_macros_init();
		break;
		case(Boot.BT_SURFACE_LOAD):
			surface_load_macros_init();
		break;
		case(Boot.BT_DEBUG_TIMER):
			debug_timer_init();
		break;
		case(Boot.BT_GAME_INIT_H):
			game_init_h();
		break;
		
		case(Boot.BT_AUDIO):
			sm64_audio_enums_init();
		break;
		case(Boot.BT_ANIMATED_FLOOR):
			sm64_animated_floor_switch_init();
		break;
		case(Boot.BT_BEHAVIOR_SPAWN_PARTICLES):
			behavior_spawn_particles_init();
		break;
		case(Boot.BT_BEHAVIOR_OBJ_LIST_MACROS):
			behavior_obj_lists_macros_init();
		break;
		case(Boot.BT_SURFACE_TERRAIN):
			surface_terrain_macros_init();
		break;
		case(Boot.BT_SURFACE_COLLISION):
			surface_collision_macros_init();
		break;
		case(Boot.BT_BHEAVIOR_COMMANDS):
			bhv_commands_macros_init();
		break;
		case(Boot.BT_DIALOG_IDS):
			dialog_ids_macros_init();
		break;
		case(Boot.BT_MACRO_PRESETS):
			macro_presets_macros_init();
		break;
		case(Boot.BT_MACRO_PRESET_SCRIPT_MACROS):
			macro_preset_scripts_macros_init();
		break;
		case(Boot.BT_TYPES_H):
			types_h_macros_init();
		break;
	
		case(Boot.BT_SPECIAL_PRESET_NAMES):
			special_preset_names_macros_init();
		break;
		case(Boot.BT_SPECIAL_PRESETS):
			special_presets_h_macros_init();
		break;
		case(Boot.BT_OBJECT_CONSTANTS):
			object_constants_macros_init();
		break;
		case(Boot.BT_OBJECT_FIELDS):
			object_fields_macros_init();
		break;
	
		case(Boot.BT_MARIO_ANIMATION):
			mario_animation_macros_init();
		break;
		case(Boot.BT_MARIO_GEO_SWITCH):
			mario_geo_switch_case_macros_init();
		break;
		case(Boot.BT_MARIO_C):
			mario_c_macros_init();
		break;
		case(Boot.BT_MARIO_MISC):
			mario_misc_macros_init();
		break;
		case(Boot.BT_MARIO_STEP):
			mario_step_macros_init();
		break;
		case(Boot.BT_MARIO_ACTIONS_AUTOMATIC):
			mario_actions_automatic_macros_init();
		break;
		case(Boot.BT_MARIO_ACTIONS_CUTSCENE):
			mario_actions_cutscene_macros_init();
		break;
		case(Boot.BT_MARIO_ACTIONS_MOVING):
			mario_actions_moving_macros_init();
		break;
		case(Boot.BT_MARIO_ACTIONS_OBJECT):
			mario_actions_object_macros_init();
		break;
	
		case(Boot.BT_INTERACTION):
			interaction_scripts_macros_init();
		break;
		case(Boot.BT_SEQUENCE):
			sequence_macros_init();
		break;
		case(Boot.BT_CAMERA):
			camera_scripts_macros_init();
		break;
		case(Boot.BT_GRAPH_NODE):
			graph_node_scripts_macros_init();
		break;
		case(Boot.BT_HUD):
			hud_c_macros_init();
		break;
		case(Boot.BT_INGAME_MENUS):
			ingame_menu_macros_init();
		break;
		case(Boot.BT_LEVEL_COMMANDS):
			level_commands_scripts_macros_init();
		break;
		case(Boot.BT_LEVEL_UPDATE_SCRIPTS):
			level_update_scripts_macros_init();
		break;
	
		case(Boot.BT_OBJECT_BEHAVIORS):
			object_behaviors_macros_init();
		break;
		case(Boot.BT_OBJECT_BEHAVIORS_2):
			object_behaviors_2_macros_init();
		break;
		case(Boot.BT_OBJECT_HELPERS):
			object_helpers_scripts_macros_init();
		break;
		case(Boot.BT_OBJECT_LIST_PROCESSOR):
			object_list_processor_macros_init();
		break;
	
		case(Boot.BT_PLATFORM_DISPLACEMENT):
			platform_displacement_macros_init();
		break;
		case(Boot.BT_PRINT_SCRIPTS):
			print_scripts_macros_init();
		break;
		case(Boot.BT_SAVE_FILE_SCRIPTS):
			save_file_scripts_macros_init();
		break;
		case(Boot.BT_SEGMENT2_MACROS):
			segment2_macros_init();
		break;
		case(Boot.BT_SHADOW_SCRIPTS):
			shadow_scripts_macros_init();
		break;
		case(Boot.BT_SPAWN_SCRIPTS):
			spawn_scripts_macros_init();
		break;
		case(Boot.BT_AREA_SCRIPTS):
			area_scripts_macros_init();
		break;
		case(Boot.BT_BIN_SKY):
			sm64_init_bin_sky();
		break;
		case(Boot.BT_BIN_INSIDE):
			sm64_init_bin_inside();
		break;
		case(Boot.BT_BIN_GENERIC):
			sm64_init_bin_generic();
		break;
		case(Boot.BT_BIN_MOUNTAIN):
			sm64_init_bin_mountain();
		break;
		case(Boot.BT_BIN_SNOW):
			sm64_init_bin_snow();
		break;
		case(Boot.BT_BIN_SPOOKY):
			sm64_init_bin_spooky();
		break;
		case(Boot.BT_BIN_WATER):
			sm64_init_bin_water();
		break;
		case(Boot.BT_SKYBOXES):
			sm64_init_skyboxes();
		break;
		case(Boot.BT_GRAPHICS_MACROS):
			gl_scripts_macros_init();
		break;
	
		case(Boot.BT_TEXTURE_DEF_SCRIPT):
			if (texture_def_script != null) texture_def_script();
		break;
	
		// load behaviors after textures
		case(Boot.BT_BEHAVIORS_INIT):
			behaviors_init();
		break;
	
		// init level after defining behaviors
		case(Boot.BT_LEVEL_INIT_SCRIPT):
			if (level_init_script != null) level_init_script();
		break;
	
		// mid-level-loading
		case(Boot.BT_POST_LEVEL_BEHAVIORS):
			post_level_behaviors_init();
		break;
		case(Boot.BT_MACRO_OBJECT_PRESETS):
			macro_object_presets_define();
		break;
		case(Boot.BT_SPECIAL_OBJECT_PRESENTS):
			special_object_presets_define();
		break;
	
		// finalize level
		case(Boot.BT_FINALIZE_LEVEL):
			if (level_script != null) level_script();
		break;

		// prep level entry
		case(Boot.BT_ENTRY_C_MACROS):
			entry_c_macros_init();
		break;
	
		/**
		 * Start main loop
		 */
		case(Boot.BT_ENTER_MAIN_LOOP):
			main_loop_init();
			
			// set to desired fps
			game_set_speed(GOAL_FPS, gamespeed_fps);
		break;
		
	}
	
	BOOT_STEP++;
	
}

function game_init_h() {
	
	globalvar gGlobalTimer;
	gGlobalTimer = 0;
	
	globalvar gCurrDemoInput;
	gCurrDemoInput = null;

	globalvar gDebugLevelSelect;
	gDebugLevelSelect = 0;
	
	boot("game_init_h");
}

/// @function	boot()
/// @desc		track booting process to console
function boot() {
	
	var str = "";
	for(var i = 0; i < argument_count; i++) {
		if (i > 0) str += " ";
		str += string(argument[i]);
	}
	
	var perc = (BOOT_STEP / Boot.count) * 100;
	str =  string(perc) + "% => " + string(str);
	
	show_debug_message(str);
	
	ds_list_insert(boot_stack, 0, str);
	
}

/// @function	immediate_placeholders_behaviors_init()
/// @desc		define a bunch of behaviors here to prevent GM from yelling at us for
//					trying to reference unknown behaviors
function immediate_placeholders_behaviors_init() {
	
	bhvYellowCoin							= null;        
	bhvCastleFloorTrap						= null;        
	bhvLllMovingOctagonalMeshPlatform		= null;        
	bhvSnowBall								= null;        
	bhvLllDrawbridgeSpawner					= null;        
	bhvLllRotatingBlockWithFireBars			= null;        
	bhvLllFloatingWoodBridge				= null;        
	bhvLllTumblingBridge					= null;        
	bhvLllRotatingHexagonalRing				= null;        
	bhvLllSinkingRectangularPlatform		= null;        
	bhvLllSinkingSquarePlatforms			= null;        
	bhvLllTiltingInvertedPyramid			= null;        
	bhvLllBowserPuzzle						= null;        
	bhvBigBully								= null;        
	bhvMovingBlueCoin						= null;        
	bhvButterfly							= null;        
	bhvBowser								= null;        
	bhvWfRotatingWoodenPlatform				= null;        
	bhvSmallBomp							= null;        
	bhvWfSlidingPlatform					= null;        
	bhvTowerPlatformGroup					= null;        
	bhvRotatingCounterClockwise				= null;        
	bhvWfTumblingBridge						= null;        
	bhvLargeBomp							= null;        
	bhvTree									= null;        
	bhvDoor									= null;        
	bhvDoorWarp								= null;         
	bhvOneCoin                              = null;     
	bhvBlueCoinSliding						= null;           
	bhvRedCoin								= null;           
	bhvCoinFormation						= null;           
	bhvHiddenStarTrigger					= null;           
	bhvMessagePanel							= null;           
	bhvCannonClosed							= null;           
	bhvBobombBuddyOpensCannon				= null;           
	bhvBetaFishSplashSpawner				= null;           
	bhvHidden1upInPoleSpawner				= null;           
	bhvGoombaTripletSpawner					= null;           
	bhvSignOnWall							= null;           
	bhvChuckya								= null;           
	bhvCannon								= null;           
	bhvGoomba								= null;           
	bhvHomingAmp							= null;           
	bhvCirclingAmp							= null;           
	bhvCarrySomething1						= null;           
	bhvBetaTrampolineTop					= null;           
	bhvFreeBowlingBall						= null;           
	bhvSnufit								= null;           
	bhvRecoveryHeart						= null;           
	bhv1upSliding							= null;           
	bhv1Up									= null;           
	bhv1upJumpOnApproach					= null;           
	bhvHidden1up							= null;           
	bhvHidden1upTrigger						= null;           
	bhvBlueCoinSwitch						= null;           
	bhvHiddenBlueCoin						= null;           
	bhvCapSwitch							= null;           
	bhvWaterLevelDiamond					= null;           
	bhvBreakableBox							= null;           
	bhvPushableMetalBox						= null;           
	bhvBreakableBoxSmall					= null;           
	bhvFloorSwitchHiddenObjects				= null;           
	bhvHiddenObject							= null;           
	bhvKoopaShellUnderwater					= null;                                    
	bhvKoopaShell							= null;                                    
	bhvBulletBill							= null;           
	bhvHeaveHo								= null;           
	bhvThwomp2								= null;           
	bhvFireSpitter							= null;           
	bhvJumpingBox							= null;           
	bhvTripletButterfly						= null;           
	bhvSmallBully							= null;           
	bhvStub1D0C								= null;           
	bhvBouncingFireball						= null;           
	bhvFlamethrower							= null;            
	bhvWaterBombSpawner						= null;           
	bhvEnemyLakitu							= null;           
	bhvKoopa								= null;           
	bhvKoopaRaceEndpoint					= null;           
	bhvWaterBombCannon						= null;           
	bhvBobomb								= null;           
	bhvUnusedFakeStar						= null;           
	bhvUnagi								= null;           
	bhvSushiShark							= null;           
	bhvStaticObject							= null;           
	bhvTweester								= null;           
	bhvPokey								= null;           
	bhvToxBox								= null;           
	bhvMontyMole							= null;           
	bhvMontyMoleHole						= null;           
	bhvFlyGuy								= null;           
	bhvWigglerHead							= null;                                
	bhvSpindrift							= null;           
	bhvSmallPenguin							= null;           
	bhvTuxiesMother							= null;           
	bhvMrBlizzard							= null;                                       
	bhvHauntedChair							= null;            
	bhvGhostHuntBoo							= null;           
	bhvCourtyardBooTriplet					= null;           
	bhvBooWithCage							= null;           
	bhvAlphaBooKey							= null;                                      
	bhvChirpChirp							= null;           
	bhvSeaweedBundle						= null;           
	bhvBetaChestBottom						= null;           
	bhvBowserBomb							= null;           
	bhvLargeFishGroup						= null;           
	bhvJetStreamRingSpawner					= null;           
	bhvSkeeter								= null;           
	bhvClamShell							= null;                                        
	bhvMacroUkiki							= null;           
	bhvPiranhaPlant							= null;           
	bhvSmallWhomp							= null;           
	bhvChainChomp							= null;            
	bhvWoodenPost							= null;           
	bhvFirePiranhaPlant						= null;           
	bhvMoneybagHidden						= null;                    
	bhvSwoop								= null;           
	bhvMrI									= null;           
	bhvScuttlebugSpawn						= null;           
	bhvScuttlebug							= null;                
	bhvTTCRotatingSolid						= null;           
	bhvTTCPendulum							= null;           
	bhvTTCMovingBar							= null;           
	bhvTTCCog								= null;           
	bhvTTCPitBlock							= null;           
	bhvTTCElevator							= null;           
	bhvTTCSpinner							= null;            
	bhvTTC2DRotator							= null;           
	bhvTTCTreadmill							= null;              
	bhvExclamationBox						= null;            
	bhvSlidingPlatform2						= null;           
	bhvAnotherTiltingPlatform				= null;           
	bhvOctagonalPlatformRotating			= null;           
	bhvAnimatesOnFloorSwitchPress			= null;             
	bhvFerrisWheelAxle						= null;           
	bhvActivatedBackAndForthPlatform		= null;           
	bhvSeesawPlatform						= null;
	bhvSquarishPathMoving					= null;
	bhvWingCap							    = null;
	bhvMetalCap							    = null;
	bhvVanishCap						    = null;
	bhvSingleCoinGetsSpawned			    = null;
	bhvThreeCoinsSpawn					    = null;
	bhvTenCoinsSpawn					    = null;
	bhv1upWalking						    = null;
	bhvSpawnedStar						    = null;
	bhv1upRunningAway					    = null;
	bhvGiantPole							= null;
	
	boot("immediate_placeholders_behaviors_init");
}

/// @function	immediate_placeholders_level_scripts()
/// @desc		define a bunch of level entry scripts here to prevent GM from yelling at us for
//					trying to reference unknown level entry variables in the level jump table
function immediate_placeholders_level_scripts() {
	
	// level scripts
	level_castle_grounds_entry			= null;	
	level_bob_entry						= null;	
	level_castle_inside_entry			= null;
	level_bitdw_entry					= null;
	level_wf_entry						= null;	
	level_pss_entry						= null;	
	level_ccm_entry						= null;	
	level_ssl_entry						= null;	
	level_ttm_entry						= null;	
	level_jrb_entry						= null;	
	level_bbh_entry						= null;	
		
	boot("immediate_placeholders_level_scripts");
	
}

/// @function	immediate_placeholders_collision_init()
/// @desc		define a bunch of collision segments here to prevent GM from yelling at us for
//					trying to reference unknown variables in the event two levels share collision references
function immediate_placeholders_collision_init() {
	
	bitdw_seg7_collision_0700F70C			= null;        
	bits_seg7_collision_0701ADD8			= null;        
	bits_seg7_collision_0701AE5C			= null;        
	bob_seg7_collision_bridge				= null;        
	bitfs_seg7_collision_07015928			= null;        
	rr_seg7_collision_07029750				= null;        
	rr_seg7_collision_07029858				= null;        
	vcutm_seg7_collision_0700AC44			= null;  
	bits_seg7_collision_0701A9A0			= null;  
	bits_seg7_collision_0701AA0C			= null;  
	bitfs_seg7_collision_07015714			= null;  
	bitfs_seg7_collision_07015768			= null;  
	rr_seg7_collision_070295F8				= null;  
	rr_seg7_collision_0702967C				= null;  
	bitdw_seg7_collision_0700F688			= null;  
	bits_seg7_collision_0701ACAC			= null;  
	bits_seg7_collision_0701AC28			= null;  
	bits_seg7_collision_0701B734			= null;  
	bits_seg7_collision_0701B59C			= null;  
	bits_seg7_collision_0701B404			= null;  
	bits_seg7_collision_0701B26C			= null;  
	bits_seg7_collision_0701B0D4			= null;  
	bitdw_seg7_collision_0700FD9C			= null;  
	bitdw_seg7_collision_0700FC7C			= null;  
	bitdw_seg7_collision_0700FB5C			= null;  
	bitdw_seg7_collision_0700FA3C			= null;  
	bitdw_seg7_collision_0700F91C			= null;  
	bitdw_seg7_collision_moving_pyramid		= null;  
	rr_seg7_collision_0702A6B4				= null;  
	rr_seg7_collision_0702A32C				= null;  
	rr_seg7_collision_07029FA4				= null;  
	rr_seg7_collision_07029C1C				= null;  
	rr_seg7_collision_07029924				= null;  	
	wdw_seg7_collision_070186B4				= null;  	
	wf_seg7_collision_rotating_platform		= null;  	
	wf_seg7_collision_tumbling_bridge		= null;  	
	bbh_seg7_collision_07026B1C				= null;  	
	lll_seg7_collision_0701D21C				= null;  	
	bitfs_seg7_collision_07015288			= null;  	
	bitdw_seg7_collision_0700F7F0			= null;  	
	bitdw_seg7_collision_0700F898			= null;  	
	
	boot("immediate_placeholders_collision_init");
}