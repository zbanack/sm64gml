function wf_init(){
	wf_coll_define();	
	wf_model_define();	
	wf_geo_define();	
	
	/// <pygml?v=1.0&h=ea49eeed3>
	bhvTower = [
	    [BCMD_BEGIN, OBJ_LIST_SURFACE],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_COLLISION_DATA, wf_seg7_collision_tower],
	    [BCMD_SET_FLOAT, oCollisionDistance, 3000],
	    [BCMD_SET_FLOAT, oDrawingDistance, 20000],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, load_object_collision_model],
	    [BCMD_LOOP_END],
	];

	wf_tower_platform_init();
	bullet_bill_init();
	wf_tower_door_init();
	wf_kickable_board_init();
	wf_giant_pole_init();
	wf_rotating_platform_init();
	
}

function wf_script() {
	
	wf_seg7_macro_objs = [
	    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal,        /*yaw*/   0, /*pos*/  3760,   960,  2740),
	    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal,        /*yaw*/  90, /*pos*/ -1400,  1160,  3900),
	    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal,        /*yaw*/  90, /*pos*/  1254,  2586,  2299),
	    MACRO_OBJECT(/*preset*/ macro_coin_ring_horizontal,        /*yaw*/   0, /*pos*/ -2500,  1795,  -260),
		MACRO_OBJECT(/*preset*/ macro_blue_coin_switch,            /*yaw*/   0, /*pos*/ -2500,   384,  -250),
	    MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,            /*yaw*/   0, /*pos*/ -2500,   450, -1150),
	    MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,            /*yaw*/   0, /*pos*/ -2500,   450,  -900),
	    MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,            /*yaw*/   0, /*pos*/ -2500,   450,  -650),
	    MACRO_OBJECT(/*preset*/ macro_yellow_coin,                 /*yaw*/   0, /*pos*/     0,  2650,  2900),
	    MACRO_OBJECT(/*preset*/ macro_yellow_coin,                 /*yaw*/   0, /*pos*/  -500,  2650,  2900),
	    MACRO_OBJECT(/*preset*/ macro_yellow_coin,                 /*yaw*/   0, /*pos*/   250,  2650,  2800),
	    MACRO_OBJECT(/*preset*/ macro_yellow_coin,                 /*yaw*/   0, /*pos*/  -750,  2650,  2800),
	    MACRO_OBJECT(/*preset*/ macro_coin_ring_horizontal,        /*yaw*/   0, /*pos*/  4611,   256,   141),
	    MACRO_OBJECT(/*preset*/ macro_coin_ring_horizontal,        /*yaw*/   0, /*pos*/  1558,   922,  2329),
	    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal,        /*yaw*/   0, /*pos*/  3396,  1380,  3280),
	    MACRO_OBJECT(/*preset*/ macro_red_coin,  /*yaw*/   0, /*pos*/  -250,  2650,  2970),
	    MACRO_OBJECT(/*preset*/ macro_red_coin,  /*yaw*/   0, /*pos*/  1746,  3620, -3120),
	    MACRO_OBJECT(/*preset*/ macro_red_coin,  /*yaw*/   0, /*pos*/  1277,  2600,  1350),
	    MACRO_OBJECT(/*preset*/ macro_red_coin,  /*yaw*/   0, /*pos*/  1585,  2595,   -80),
	    MACRO_OBJECT(/*preset*/ macro_red_coin,  /*yaw*/   0, /*pos*/  3350,  3000, -1520),
	    MACRO_OBJECT(/*preset*/ macro_red_coin,  /*yaw*/   0, /*pos*/  2700,  3600,  -900),
	    MACRO_OBJECT(/*preset*/ macro_red_coin,  /*yaw*/   0, /*pos*/  3770,  1380,   650),
	    MACRO_OBJECT(/*preset*/ macro_red_coin,  /*yaw*/   0, /*pos*/  -270,  1720,  2250),
		//MACRO_OBJECT(macro_yellow_coin, 0,    2138.31, 1200, 2746.69),
		//MACRO_OBJECT(/*preset*/ macro_red_coin,   /*yaw*/   0, /*pos*/  2138.31, 1100, 2746.69),
		//MACRO_OBJECT(/*preset*/ macro_breakable_box_three_coins,   /*yaw*/   0, /*pos*/  2138.31, 1200, 2746.69),
	];
	
	script_func_local_1 = [
	    OBJECT(/*model*/ MODEL_LEVEL_GEOMETRY_03, /*pos*/  2305, 2432,  -255, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvStaticObject),
	    OBJECT(/*model*/ MODEL_LEVEL_GEOMETRY_04, /*pos*/  3405, 1664, -1791, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvStaticObject),
	    OBJECT(/*model*/ MODEL_LEVEL_GEOMETRY_05, /*pos*/  3840,    0, -2303, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvStaticObject),
	    OBJECT(/*model*/ MODEL_LEVEL_GEOMETRY_05, /*pos*/  3840,    0, -1279, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvStaticObject),
	    OBJECT(/*model*/ MODEL_LEVEL_GEOMETRY_06, /*pos*/     0,    0,     0, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvStaticObject),
	    OBJECT(/*model*/ MODEL_LEVEL_GEOMETRY_07, /*pos*/  1757, 3519, -3151, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvStaticObject),
	    OBJECT(/*model*/ MODEL_LEVEL_GEOMETRY_0A, /*pos*/  3840,  794,  2688, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvStaticObject),
	    OBJECT(/*model*/ MODEL_LEVEL_GEOMETRY_0C, /*pos*/  1408, 2522,  2431, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvStaticObject),
		[LCMD_RETURN],

	];
	
	script_func_local_2 = [
		OBJECT(/*model*/ MODEL_WF_ROTATING_WOODEN_PLATFORM, /*pos*/  -255, 2560,  2304, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvWfRotatingWoodenPlatform),
	    OBJECT(/*model*/ MODEL_WF_TUMBLING_BRIDGE,          /*pos*/  1792, 2496,  1600, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvWfTumblingBridge),
	    OBJECT(/*model*/ MODEL_WF_SLIDING_PLATFORM,         /*pos*/  3328, 1075, -1791, /*angle*/ 0,  90, 0, /*behParam*/ 0x00020000, /*beh*/ Object1.bhvWfSlidingPlatform),
	    OBJECT(/*model*/ MODEL_WF_SLIDING_PLATFORM,         /*pos*/  3328, 1075,  -767, /*angle*/ 0,  90, 0, /*behParam*/ 0x00010000, /*beh*/ Object1.bhvWfSlidingPlatform),
	    OBJECT(/*model*/ MODEL_WF_SLIDING_PLATFORM,         /*pos*/  3328, 1075, -2815, /*angle*/ 0,  90, 0, /*behParam*/ 0x00030000, /*beh*/ Object1.bhvWfSlidingPlatform),
		OBJECT(/*model*/ MODEL_WF_SMALL_BOMP,               /*pos*/  3300, 1070,     1, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvSmallBomp),
	    OBJECT(/*model*/ MODEL_WF_SMALL_BOMP,               /*pos*/  3300, 1070,  1281, /*angle*/ 0,  90, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvSmallBomp),
		OBJECT(/*model*/ MODEL_WF_LARGE_BOMP,               /*pos*/  3300, 1070,   641, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvLargeBomp),
		OBJECT_WITH_ACTS(/*model*/ MODEL_WF_KICKABLE_BOARD,           /*pos*/    13, 3584, -1407, /*angle*/ 0, 315-90, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvKickableBoard, /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
	    OBJECT(/*model*/ MODEL_WF_BREAKABLE_WALL_RIGHT,     /*pos*/   512, 2176,  2944, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvWfBreakableWallRight),
	    OBJECT(/*model*/ MODEL_WF_BREAKABLE_WALL_LEFT,      /*pos*/ -1023, 2176,  2944, /*angle*/ 0,   0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvWfBreakableWallLeft),
		OBJECT(/*model*/ MODEL_WF_ROTATING_PLATFORM,        /*pos*/  2304, 3584, -2303, /*angle*/ 0,   0, 0, /*behParam*/ 0x08000000, /*beh*/ Object1.bhvRotatingPlatform),
	    OBJECT(/*model*/ MODEL_WF_ROTATING_PLATFORM,        /*pos*/  3200, 3328, -1791, /*angle*/ 0,   0, 0, /*behParam*/ 0x08000000, /*beh*/ Object1.bhvRotatingPlatform),
	    OBJECT(/*model*/ MODEL_WF_ROTATING_PLATFORM,        /*pos*/  2688, 3584,  -895, /*angle*/ 0,   0, 0, /*behParam*/ 0x08000000, /*beh*/ Object1.bhvRotatingPlatform),
		[LCMD_RETURN],
	
	];
	script_func_local_3 = [
		OBJECT_WITH_ACTS(/*model*/ MODEL_BULLET_BILL,       /*pos*/  1280, 3712,   968, /*angle*/ 0,  180, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvBulletBill,               /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
		OBJECT_WITH_ACTS(/*model*/ MODEL_LEVEL_GEOMETRY_08, /*pos*/     0, 3584,     0, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvTower,                     /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
		OBJECT_WITH_ACTS(/*model*/ MODEL_LEVEL_GEOMETRY_09, /*pos*/  1280, 3584,   896, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvBulletBillCannon,        /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
		OBJECT_WITH_ACTS(/*model*/ MODEL_NONE,              /*pos*/     0, 3483,     0, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvTowerPlatformGroup,      /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
		OBJECT_WITH_ACTS(/*model*/ MODEL_WF_TOWER_DOOR,     /*pos*/  -511, 3584,     0, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvTowerDoor,                /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
		OBJECT(/*model*/ MODEL_WHOMP,             /*pos*/ -1545, 2560,  -286, /*angle*/ 0,    0, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvSmallWhomp),
		OBJECT(/*model*/ MODEL_WHOMP,             /*pos*/   189, 2560, -1857, /*angle*/ 0, -135, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvSmallWhomp),
		OBJECT(/*model*/ MODEL_THWOMP,            /*pos*/  3462, 1939, -1545, /*angle*/ 0,  180, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvThwomp),
		OBJECT(/*model*/ MODEL_THWOMP,            /*pos*/  3462, 1075, -3314, /*angle*/ 0,   90, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvThwomp2),	
		OBJECT(/*model*/ MODEL_WF_GIANT_POLE,     /*pos*/ -2560, 2560,  -256, /*angle*/ 0, 0, 0, /*behParam*/ 0x00000000, /*beh*/ bhvGiantPole),
		
		[LCMD_RETURN],
	];
	
	script_func_local_4 = [
	    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR,  /*pos*/   300, 5550,    0, /*angle*/ 0, 0, 0, /*behParam*/ 0x01000000, /*beh*/ Object1.bhvStar,                 /*acts*/ ACT_2 | ACT_3 | ACT_4 | ACT_5 | ACT_6),
	    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR,  /*pos*/ -2500, 1500, -750, /*angle*/ 0, 0, 0, /*behParam*/ 0x02000000, /*beh*/ Object1.bhvStar,                 /*acts*/ ALL_ACTS),
	    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR,  /*pos*/  2880, 4300,  190, /*angle*/ 0, 0, 0, /*behParam*/ 0x04000000, /*beh*/ Object1.bhvStar,                 /*acts*/ ALL_ACTS),
	    OBJECT_WITH_ACTS(/*model*/ MODEL_STAR,  /*pos*/   590, 2450, 2650, /*angle*/ 0, 0, 0, /*behParam*/ 0x05000000, /*beh*/ Object1.bhvStar,                 /*acts*/ ALL_ACTS),
		[LCMD_RETURN]
	];
	
	level_wf_entry = [			   
		[LCMD_INIT_LEVEL],
		[LCMD_INIT_MARIO, 1, 1, bhvMario ],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_BUBBLY_TREE, bubbly_tree_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_YELLOW_COIN, yellow_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_RED_COIN, red_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BLUE_COIN, blue_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BLUE_COIN_SWITCH, blue_coin_switch_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_03, wf_geo_0007E0 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_04, wf_geo_000820 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_05, wf_geo_000860 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_06, wf_geo_000878 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_07, wf_geo_000890 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_08, wf_geo_0008A8 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_09, wf_geo_0008E8 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_0A, wf_geo_000900 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_0C, wf_geo_000940 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_0E, wf_geo_000958 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_0F, wf_geo_0009A0 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_11, wf_geo_0009D0 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_12, wf_geo_0009E8 ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_SMALL_BOMP,                    wf_geo_000A00],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_LARGE_BOMP,                    wf_geo_000A40],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_SLIDING_PLATFORM,              wf_geo_000A98],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_EXCLAMATION_BOX,   exclamation_box_geo ],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_SPARKLES,          sparkles_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_NUMBER,			number_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_TUMBLING_BRIDGE_PART,			wf_geo_000AB0],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_TUMBLING_BRIDGE,				wf_geo_000AC8],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_BREAKABLE_WALL_RIGHT,			wf_geo_000B78],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_BREAKABLE_WALL_LEFT,			wf_geo_000B90],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_ROTATING_WOODEN_PLATFORM,			wf_geo_000A58],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_STAR,								star_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_WHOMP,								whomp_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_MIST,								mist_geo],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_TOWER_SQUARE_PLATORM,          wf_geo_000B10],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_TOWER_SQUARE_PLATORM_UNUSED,   wf_geo_000B38],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_TOWER_SQUARE_PLATORM_ELEVATOR, wf_geo_000B60],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BULLET_BILL, bullet_bill_geo],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_KICKABLE_BOARD, wf_geo_000BA8],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_TOWER_DOOR, wf_geo_000BE0],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_KICKABLE_BOARD_FELLED, wf_geo_000BC8],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_GIANT_POLE, wf_geo_000AE0],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_ROTATING_PLATFORM, wf_geo_0009B8],
		//[LCMD_LOAD_MODEL_FROM_GEO, MODEL_GOOMBA, goomba_geo ],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_THWOMP, thwomp_geo ],
	    [LCMD_BEGIN_AREA, 1, wf_geo_000BF8 ],
	    [LCMD_JUMP_LINK, script_func_local_1 ],
	    [LCMD_JUMP_LINK, script_func_local_2 ],
	    [LCMD_JUMP_LINK, script_func_local_3 ],
	    [LCMD_JUMP_LINK, script_func_local_4 ],
		[LCMD_TERRAIN, wf_seg7_collision_070102D8 ],
		[LCMD_MACRO_OBJECTS, wf_seg7_macro_objs ],
		[LCMD_END_AREA ],
		[LCMD_FREE_LEVEL_POOL ],
		[LCMD_SET_MARIO_POS, 1, 90,  2600, 256, 5120], //-312, 5325, -201],
		[LCMD_CALL, 0, lvl_init_or_update ],
		[LCMD_CALL_LOOP, 1, lvl_init_or_update ],
	];	
	
boot("wf_script");
	
}