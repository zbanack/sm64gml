function behavior_obj_lists_macros_init() {
	#macro OBJ_LIST_PLAYER			(0)
	#macro OBJ_LIST_UNUSED_1		(1)
	#macro OBJ_LIST_DESTRUCTIVE		(2)
	#macro OBJ_LIST_UNUSED_3		(3)
	#macro OBJ_LIST_GENACTOR		(4)
	#macro OBJ_LIST_PUSHABLE		(5)
	#macro OBJ_LIST_LEVEL			(6)
	#macro OBJ_LIST_UNUSED_7		(7)
	#macro OBJ_LIST_DEFAULT			(8)
	#macro OBJ_LIST_SURFACE			(9)
	#macro OBJ_LIST_POLELIKE		(10)
	#macro OBJ_LIST_SPAWNER			(11)
	#macro OBJ_LIST_UNIMPORTANT		(12)
	#macro NUM_OBJ_LISTS			(13)	
	
	boot("behavior_obj_lists_macros_init");
}

function behaviors_init() {
	
	load_all_bhvs();
	
	behavior_data_c();
	
	boot("behaviors_init");

}

/// <pygml?v=1.0&h=43ab9c558>
/// @function	spawn_triangle_break_particles(numTris, triModel, triSize, triAnimState)
/// @param		{s16}		numTris
/// @param		{s16}		triModel
/// @param		{f32}		triSize
/// @param		{s16}		triAnimState
function spawn_triangle_break_particles(numTris, triModel, triSize, triAnimState) {
	
	triModel = MODEL_RED_COIN;
	
	var o = gCurrentObject;
	
    var triangle;
    var i;
    for (i = 0; i < numTris; i++) {
        triangle = spawn_object(o, triModel, Object1.bhvBreakBoxTriangle);
        triangle.rawData[oAnimState] = triAnimState;
        triangle.rawData[oPosY] += 100.0;
        triangle.rawData[oMoveAngleYaw] = random_u16();
        triangle.rawData[oFaceAngleYaw] = triangle.rawData[oMoveAngleYaw];
        triangle.rawData[oFaceAnglePitch] = random_u16();
        triangle.rawData[oVelY] = random_f32_around_zero(50.0);
        if (triModel == 138 || triModel == 56) {
            triangle.rawData[oAngleVelPitch] = 0xF00;
            triangle.rawData[oAngleVelYaw] = 0x500;
            triangle.rawData[oForwardVel] = 30.0;
        } else {
            triangle.rawData[oAngleVelPitch] = 0x80 * (random_float() + 50.0);
            triangle.rawData[oForwardVel] = 30.0;
        }
        obj_scale(triangle, triSize);
    }
}

function post_level_behaviors_init() {
	
	seesaw_platform_collision_models_init();
	sliding_platform_2_collision_models_init();
	bhv_ferris_wheel_collision_models_init();
	animated_floor_switch_models_init();	
	
	globalvar sWFRotatingPlatformData;
	sWFRotatingPlatformData = [
	    new WFRotatingPlatformData( 0, 100, wf_seg7_collision_rotating_platform, 2000 ),
	    new WFRotatingPlatformData( 0, 150, wdw_seg7_collision_070186B4, 1000 )
	];
	
	globalvar sTumblingBridgeParams;
	sTumblingBridgeParams = [
	    new Struct8032F34C( 9, -512, 0x80, MODEL_WF_TUMBLING_BRIDGE_PART,		Object1.wf_seg7_collision_tumbling_bridge),
	    new Struct8032F34C( 9, -412, 103, MODEL_BBH_TUMBLING_PLATFORM_PART,		Object1.bbh_seg7_collision_07026B1C),
	    new Struct8032F34C( 9, -512, 0x80, MODEL_LLL_FALLING_PLATFORM,			Object1.lll_seg7_collision_0701D21C), // @z
	    new Struct8032F34C( 9, -512, 0x80, MODEL_BITFS_TUMBLING_PLATFORM_PART,	Object1.bitfs_seg7_collision_07015288), // @z
	];

	/// <pygml?v=1.0&h=80a4c574b>
	bhvSquarishPathMoving = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_COLLISION_DATA, Object1.bitdw_seg7_collision_moving_pyramid],
	    [BCMD_HOME],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_squarish_path_moving_loop],
	    [BCMD_LOOP_END],
	];
	
	/// <pygml?v=1.0&h=297209011>
	bhvSeesawPlatform = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_CALL, bhv_seesaw_platform_init],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_seesaw_platform_update],
	        [BCMD_CALL, load_object_collision_model],
	    [BCMD_LOOP_END],
	];

	/// <pygml?v=1.0&h=a80cbcd4e>
	bhvSlidingPlatform2 = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_HOME],
	    [BCMD_CALL, bhv_sliding_plat_2_init],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_sliding_plat_2_loop],
	        [BCMD_CALL, load_object_collision_model],
	    [BCMD_LOOP_END],
	];

	/// <pygml?v=1.0&h=aa058a3f0>
	bhvFerrisWheelAxle = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_ADD_INT, oMoveAngleYaw, 0x4000],
	    [BCMD_CALL, bhv_ferris_wheel_axle_init],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_ADD_INT, oFaceAngleRoll, 400],
	        [BCMD_CALL, load_object_collision_model],
	    [BCMD_LOOP_END],
	];
	
	/// <pygml?v=1.0&h=61370a1c7>
	bhvFerrisWheelPlatform = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_ferris_wheel_platform_update],
	        [BCMD_CALL, load_object_collision_model],
	    [BCMD_LOOP_END],
	];
	
	boot("post_level_behaviors_init");
}


function load_all_bhvs() {
	
	var is_wf = (CURRENT_LEVEL == LEVEL_WF);
	
	// free
	tree_geo_init();
	
	// star init
	star_init();
	
	// power meter
	power_meter_init();
	
	// mario init
	mario_init();
	
	// sparkle init
	sparkle_init();
	
	// scuttlebug init
	//scuttlebug_init();
	
	// bobomb init
	//bobomb_init();
	
	// goomba init
	goomba_init();
	
	// coin init
	coin_init();
	
	// coin switch
	blue_coin_switch_init();
	
	// exclamation box init
	exclamation_box_bhv_init();
	exclamation_box_init()
	
	// numbers
	number_init();
	
	// numbers
	door_init();
	
	// amp
	actor_amp_init();
	
	// purple_switch
	purple_switch_init();
	
	// thwomp
	if (is_wf) thwomp_init();
	
	// bomp
	if (is_wf) bomp_init();

	// wf sliding platform
	if (is_wf) wf_sliding_platform_init();
	
	// wf breakable walls
	if (is_wf) wf_breakable_walls_init();
	
	// tumbling bridges
	if (is_wf) tumbling_bridges_init();
	
	// wf rotating platform
	if (is_wf) wf_rotating_wooden_platform_init();
	
	// whomp
	if (is_wf) actor_whomp_init();
	
	// spindrift
	if (CURRENT_LEVEL == LEVEL_CCM || CURRENT_LEVEL == LEVEL_SL) {
		actor_spindrift_init();	
	}
	
	if (CURRENT_LEVEL == LEVEL_BBH) piano_init();
	
	// coin init
	mist_init();
	
	
}
