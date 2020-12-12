function jrb_init(){
	falling_pillar_init();
	falling_pillar_base_init();
	floating_platform_init();
	rock_init();
	sliding_box_init();
	wooden_ship_init();
	
	jrb_coll_define();	
	jrb_model_define();	
	jrb_geo_define();	
	
/// <pygml?v=1.0&h=5abb7c010>
bhvRockSolid = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_DIST_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, jrb_seg7_collision_rock_solid],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=af9317f86>
bhvPillarBase = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, jrb_seg7_collision_pillar_base],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=da2c608dc>
bhvJrbFloatingPlatform = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, jrb_seg7_collision_floating_platform],
    [BCMD_SET_FLOAT, oFloatingPlatformUnkFC, 64],
    [BCMD_HOME],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_floating_platform_loop],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];

/// <pygml?v=1.0&h=20791ce86>

bhvFallingPillar = [
    [BCMD_BEGIN, OBJ_LIST_GENACTOR],
    [BCMD_OR_INT, oFlags,  OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_HOME],
    [BCMD_CALL, bhv_falling_pillar_init],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_falling_pillar_loop],
    [BCMD_LOOP_END],
];


}

function jrb_script() {
jrb_seg7_area_1_macro_objs = [
    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,             /*yaw*/ 250, /*pos*/ -6325,  1126,  1730, /*behParam*/ 60),
    //MACRO_OBJECT(/*preset*/ macro_coin_ring_vertical,          /*yaw*/   0, /*pos*/  5060, -4420,   720),
    //MACRO_OBJECT(/*preset*/ macro_box_metal_cap,               /*yaw*/   0, /*pos*/  2077,  1832,  7465),
    //MACRO_OBJECT(/*preset*/ macro_coin_ring_horizontal_flying, /*yaw*/   0, /*pos*/ -1780,  -650,  4200),
   // MACRO_OBJECT(/*preset*/ macro_floor_switch_hidden_objects, /*yaw*/  45, /*pos*/  2260,  1536,  6854),
    //MACRO_OBJECT(/*preset*/ macro_hidden_box,                  /*yaw*/  45, /*pos*/  4269,  1336,  4866),
    //MACRO_OBJECT(/*preset*/ macro_hidden_box,                  /*yaw*/  45, /*pos*/  4128,  1336,  5007),
    //MACRO_OBJECT(/*preset*/ macro_hidden_box,                  /*yaw*/  45, /*pos*/  3400,  1336,  5155),
    //MACRO_OBJECT(/*preset*/ macro_hidden_box,                  /*yaw*/  45, /*pos*/  3261,  1336,  5294),
    //MACRO_OBJECT(/*preset*/ macro_hidden_box,                  /*yaw*/  45, /*pos*/  3120,  1336,  5435),
    //MACRO_OBJECT(/*preset*/ macro_seaweed_bundle,              /*yaw*/   0, /*pos*/  3551, -5120,  2744),
    //MACRO_OBJECT(/*preset*/ macro_seaweed_bundle,              /*yaw*/   0, /*pos*/  4201, -5120,  3863),
    MACRO_OBJECT(/*preset*/ macro_coin_ring_horizontal,        /*yaw*/   0, /*pos*/ -2440, -2980, -4120),
    //MACRO_OBJECT(/*preset*/ macro_box_metal_cap,               /*yaw*/   0, /*pos*/   279, -2600, -7340),
    //MACRO_OBJECT(/*preset*/ macro_seaweed_bundle,              /*yaw*/   0, /*pos*/  4846, -5119,  1213),
    //MACRO_OBJECT(/*preset*/ macro_seaweed_bundle,              /*yaw*/   0, /*pos*/  -800, -1023,  4040),
    //MACRO_OBJECT(/*preset*/ macro_hidden_box,                  /*yaw*/  45, /*pos*/  3621,  1336,  6529),
    //MACRO_OBJECT(/*preset*/ macro_hidden_box,                  /*yaw*/  45, /*pos*/  3485,  1336,  6665),
    //MACRO_OBJECT(/*preset*/ macro_hidden_box,                  /*yaw*/  45, /*pos*/  2671,  1336,  6459),
    MACRO_OBJECT(/*preset*/ macro_red_coin,                    /*yaw*/   0, /*pos*/  4900,  1800,  4700),
    MACRO_OBJECT(/*preset*/ macro_red_coin,                    /*yaw*/   0, /*pos*/ -2535,  2110,  6113),
    MACRO_OBJECT(/*preset*/ macro_red_coin,                    /*yaw*/   0, /*pos*/ -1845, -1003,  3518),
    MACRO_OBJECT(/*preset*/ macro_red_coin,                    /*yaw*/   0, /*pos*/  -546,   530,  5930),
    MACRO_OBJECT(/*preset*/ macro_red_coin,                    /*yaw*/   0, /*pos*/   648,  -490,  4256),
    MACRO_OBJECT(/*preset*/ macro_red_coin,                    /*yaw*/   0, /*pos*/  3642, -5103,  3175),
    MACRO_OBJECT(/*preset*/ macro_red_coin,                    /*yaw*/   0, /*pos*/  4400,  2200,  1300),
    MACRO_OBJECT(/*preset*/ macro_red_coin,                    /*yaw*/   0, /*pos*/  5400,  2200,  1300),
    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,             /*yaw*/ 180, /*pos*/  -900, -2966, -2200, /*behParam*/ 73),
    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,             /*yaw*/  80, /*pos*/ -2552,  1331,  6573, /*behParam*/ 51),
    //MACRO_OBJECT(/*preset*/ macro_clam_shell,                  /*yaw*/ 315, /*pos*/ -1800, -1023,  3500),
    //MACRO_OBJECT(/*preset*/ macro_clam_shell,                  /*yaw*/ 225, /*pos*/  -480,   512,  5980),
    //MACRO_OBJECT(/*preset*/ macro_clam_shell,                  /*yaw*/ 270, /*pos*/   700,  -511,  4250),
    //MACRO_OBJECT(/*preset*/ macro_clam_shell,                  /*yaw*/  90, /*pos*/  3600, -5119,  3200),
    //MACRO_OBJECT(/*preset*/ macro_fish_group,                  /*yaw*/   0, /*pos*/ -2523,  -246,  4676),
    //MACRO_OBJECT(/*preset*/ macro_fish_group,                  /*yaw*/   0, /*pos*/  5876, -4738,  3476),
    MACRO_OBJECT(/*preset*/ macro_blue_coin_switch,            /*yaw*/   0, /*pos*/  6011, -2966, -5511),
    MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,            /*yaw*/   0, /*pos*/  5900, -2966, -7347),
    MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,            /*yaw*/   0, /*pos*/  5300, -2966, -7347),
    MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,            /*yaw*/   0, /*pos*/  4700, -2966, -7347),
    MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,            /*yaw*/   0, /*pos*/  4100, -2966, -7347),
    MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,            /*yaw*/   0, /*pos*/  3500, -2966, -7347),
    MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,            /*yaw*/   0, /*pos*/  2900, -2966, -7347),
    //MACRO_OBJECT(/*preset*/ macro_goomba_triplet_spawner,      /*yaw*/   0, /*pos*/  3305, -2966, -6147),
    //MACRO_OBJECT(/*preset*/ macro_coin_line_vertical,          /*yaw*/   0, /*pos*/   255,  1160,  7633),
    //MACRO_OBJECT(/*preset*/ macro_coin_ring_horizontal_flying, /*yaw*/   0, /*pos*/    51,   960,  2744),
    //MACRO_OBJECT(/*preset*/ macro_hidden_1up_trigger,          /*yaw*/   0, /*pos*/  5060, -4220,   720),
    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_hidden_1up,                  /*yaw*/   0, /*pos*/  5140, -4380,     0, /*behParam*/ 1),
    //MACRO_OBJECT(/*preset*/ macro_fish_group_2,                /*yaw*/   0, /*pos*/  4072, -4463,  2027),
    //MACRO_OBJECT(/*preset*/ macro_fish_group_2,                /*yaw*/   0, /*pos*/  -290,   190,  4645),
    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_cannon_closed,               /*yaw*/   0, /*pos*/ -4235,  1247,  2137, /*behParam*/ 0x00),
    //MACRO_OBJECT(/*preset*/ macro_hidden_box,                  /*yaw*/  45, /*pos*/  2536,  1336,  6594),
    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal,        /*yaw*/  45, /*pos*/  4220,  1536,  5700),
    //MACRO_OBJECT(/*preset*/ macro_hidden_box,                  /*yaw*/  45, /*pos*/  3987,  1336,  5148),
    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal,        /*yaw*/  45, /*pos*/  3280,  1536,  5940),
    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal,        /*yaw*/  45, /*pos*/  3200,  1536,  6720),
    //MACRO_OBJECT(/*preset*/ macro_box_metal_cap,               /*yaw*/   0, /*pos*/ -7160,  1340,  2580),
    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,             /*yaw*/ 180, /*pos*/ -6910,  1120,  2380, /*behParam*/ 113),
    //MACRO_OBJECT(/*preset*/ macro_box_three_coins,             /*yaw*/   0, /*pos*/ -5800,  1340,  -750),
    //MACRO_OBJECT(/*preset*/ macro_1up,                         /*yaw*/   0, /*pos*/   670,  3000,  3315),
    //MACRO_OBJECT(/*preset*/ macro_koopa_shell_underwater,      /*yaw*/   0, /*pos*/ -1480, -1000,  4820),
    //MACRO_OBJECT(/*preset*/ macro_clam_shell,                  /*yaw*/ 180, /*pos*/ -1480, -1040,  4820),
    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,             /*yaw*/   0, /*pos*/  5290, -2966, -4740, /*behParam*/ 169),
	];

	script_func_local_1 = [
	// @TODO shipPart3 + sliding box are NOT in ACT_1
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SHIP_LEFT_HALF_PART,  /*pos*/  4880,   820,  2375, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvShipPart3,               /*acts*/ ACT_1 | ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SHIP_BACK_LEFT_PART,  /*pos*/  4880,   820,  2375, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvShipPart3,               /*acts*/ ACT_1 | ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SHIP_RIGHT_HALF_PART, /*pos*/  4880,   820,  2375, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvShipPart3,               /*acts*/ ACT_1 | ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SHIP_BACK_RIGHT_PART, /*pos*/  4880,   820,  2375, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvShipPart3,               /*acts*/ ACT_1 | ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,                     /*pos*/  4880,   820,  2375, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvInSunkenShip3,          /*acts*/  ACT_1 | ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
    OBJECT_WITH_ACTS(/*model*/ MODEL_JRB_SLIDING_BOX,          /*pos*/  4668,  1434,  2916, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvJrbSlidingBox,           /*acts*/ ACT_1 | ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
		[LCMD_RETURN],
	];

	script_func_local_2 = [
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1834, -2556, -7090, /*angle*/ 0, 194, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -2005, -2556, -3506, /*angle*/ 0, 135, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1578, -2556, -5554, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/    42, -2556, -6578, /*angle*/ 0, 135, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  -981, -2556, -5298, /*angle*/ 0, 255, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -6549,  1536,  4343, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1322, -2556, -3506, /*angle*/ 0, 165, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  6442, -2556, -6322, /*angle*/ 0, 135, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  3882, -2556, -5042, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1497,  1741,  7810, /*angle*/ 0,  14, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -3978,  1536,   -85, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -5228,  1230,  2106, /*angle*/ 0, 323, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -7481,  1536,   185, /*angle*/ 0, 149, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -5749,  1536, -1113, /*angle*/ 0, 255, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -5332,  1434,  1023, /*angle*/ 0, 315, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  -815,  -613,  3556, /*angle*/ 0, 315, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -3429,   819,  4948, /*angle*/ 0, 284, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -1940,   410,  2377, /*angle*/ 0, 194, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/ -1798,  -716,  4330, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  -845,   922,  7668, /*angle*/ 0, 315, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  6741, -2886,  3556, /*angle*/ 0, 135, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/   255,  -101,  4719, /*angle*/ 0,  45, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1787,  -306,  5133, /*angle*/ 0, 315, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  1079,  -613,  2299, /*angle*/ 0,  75, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  2931, -1697,   980, /*angle*/ 0, 315, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  3036, -4709,  4027, /*angle*/ 0, 315, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  4222, -1125,  7083, /*angle*/ 0, 104, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  6650,  -613,  4941, /*angle*/ 0, 315, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  5764, -4709,  4427, /*angle*/ 0, 315, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  3693, -4709,   856, /*angle*/ 0, 135, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  7981,   410,  2704, /*angle*/ 0, 165, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  2917, -3046,  4818, /*angle*/ 0, 241, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    OBJECT(/*model*/ MODEL_JRB_ROCK,                 /*pos*/  5896,  -393,  -123, /*angle*/ 0, 315, 0, /*behParam*/ 0x00000000, /*beh*/ bhvRockSolid),
	    //OBJECT(/*model*/ MODEL_NONE,                     /*pos*/    53,  2355,  2724, /*angle*/ 0,   0, 0, /*behParam*/ 0x00290000, /*beh*/ bhvPoleGrabbing),
	    //OBJECT(/*model*/ MODEL_NONE,                     /*pos*/   659,  2560,  3314, /*angle*/ 0,   0, 0, /*behParam*/ 0x00290000, /*beh*/ bhvPoleGrabbing),
	    //OBJECT(/*model*/ MODEL_NONE,                     /*pos*/  1087,  2150,  3798, /*angle*/ 0,   0, 0, /*behParam*/ 0x00290000, /*beh*/ bhvPoleGrabbing),
	    //OBJECT(/*model*/ MODEL_NONE,                     /*pos*/ -2535,  1075,  6113, /*angle*/ 0,   0, 0, /*behParam*/ 0x00610000, /*beh*/ bhvPoleGrabbing),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/  2078, -2863, -4696, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFallingPillar),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/ -1403, -2863, -4696, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFallingPillar),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/ -1096, -2863, -3262, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFallingPillar),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/   337, -2863, -5106, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFallingPillar),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/  2078, -2863, -6232, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFallingPillar),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR,       /*pos*/  4330, -2863, -5618, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvFallingPillar),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/  2078, -2966, -4696, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPillarBase),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/ -1403, -2966, -4696, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPillarBase),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/ -1096, -2966, -3262, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPillarBase),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/   337, -2966, -5106, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPillarBase),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/  2078, -2966, -6232, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPillarBase),
	    OBJECT(/*model*/ MODEL_JRB_FALLING_PILLAR_BASE,  /*pos*/  4330, -2966, -5618, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ bhvPillarBase),
	    //OBJECT(/*model*/ MODEL_JRB_FLOATING_PLATFORM,    /*pos*/ -1059,  1025,  7072, /*angle*/ 0, 247, 0, /*behParam*/ 0x00000000, /*beh*/ bhvJrbFloatingPlatform),
	    //OBJECT(/*model*/ MODEL_NONE,                     /*pos*/ -4236, 1044, 2136,   /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvInsideCannon),
		[LCMD_RETURN],
	];

	script_func_local_3 = [
		[LCMD_RETURN],
	];

	script_func_local_4 = [
		[LCMD_RETURN],
	];

	level_jrb_entry = [			   
		[LCMD_INIT_LEVEL],
		[LCMD_INIT_MARIO, 1, 1, bhvMario ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_YELLOW_COIN, yellow_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_RED_COIN, red_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BLUE_COIN, blue_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BLUE_COIN_SWITCH, blue_coin_switch_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_EXCLAMATION_BOX,   exclamation_box_geo ],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_SPARKLES,          sparkles_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_NUMBER,			number_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_PURPLE_SWITCH,				purple_switch_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_STAR,								star_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_MIST,								mist_geo],
		
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_MIST,								mist_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_JRB_SHIP_LEFT_HALF_PART,  jrb_geo_000978],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_JRB_SHIP_BACK_LEFT_PART,  jrb_geo_0009B0],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_JRB_SHIP_RIGHT_HALF_PART, jrb_geo_0009E8],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_JRB_SHIP_BACK_RIGHT_PART, jrb_geo_000A00],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_JRB_SUNKEN_SHIP,          jrb_geo_000990],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_JRB_SUNKEN_SHIP_BACK,     jrb_geo_0009C8],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_JRB_ROCK,                 jrb_geo_000930],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_JRB_SLIDING_BOX,          jrb_geo_000960],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_JRB_FALLING_PILLAR,       jrb_geo_000900],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_JRB_FALLING_PILLAR_BASE,  jrb_geo_000918],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_JRB_FLOATING_PLATFORM,    jrb_geo_000948],

		
	    [LCMD_BEGIN_AREA, 1, jrb_geo_000A18 ],
	    [LCMD_JUMP_LINK, script_func_local_1 ],
	    [LCMD_JUMP_LINK, script_func_local_2 ],
	    [LCMD_JUMP_LINK, script_func_local_3 ],
		[LCMD_TERRAIN, jrb_seg7_area_1_collision ],
		[LCMD_MACRO_OBJECTS, jrb_seg7_area_1_macro_objs ],
		[LCMD_TERRAIN_TYPE, TERRAIN_WATER ],
		[LCMD_END_AREA ],
		[LCMD_FREE_LEVEL_POOL ],
		[LCMD_SET_MARIO_POS, 1, 90,  -6750, 1126, 1482],//3696, -2966, -5971],//-6750, 1126, 1482],
		[LCMD_CALL, 0, lvl_init_or_update ],
		[LCMD_CALL_LOOP, 1, lvl_init_or_update ],
	];	
	
boot("jrb_script");	
}

