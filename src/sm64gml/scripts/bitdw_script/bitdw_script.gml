function bitdw_script(){
	
script_func_local_1 = [
	OBJECT(/*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -1966, -3154,  3586, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00000000, /*beh*/ Object1.bhvSquarishPathMoving),
	OBJECT(/*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -1352, -3154,  4200, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00020000, /*beh*/ Object1.bhvSquarishPathMoving),
	OBJECT(/*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -2963,  1017, -2464, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00000000, /*beh*/ Object1.bhvSquarishPathMoving),
	OBJECT(/*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -2349,  1017, -1849, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00020000, /*beh*/ Object1.bhvSquarishPathMoving),
	OBJECT(/*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -2349,  1017, -1235, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00000000, /*beh*/ Object1.bhvSquarishPathMoving),
	OBJECT(/*model*/ MODEL_BITDW_SQUARE_PLATFORM,   /*pos*/ -1735,  1017,  -621, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00020000, /*beh*/ Object1.bhvSquarishPathMoving),
	OBJECT(/*model*/ MODEL_BITDW_SEESAW_PLATFORM,   /*pos*/  1491,  1273,   512, /*angle*/ 0, 90, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvSeesawPlatform),
	OBJECT(/*model*/ MODEL_BITDW_SEESAW_PLATFORM,   /*pos*/  -147,   894,   512, /*angle*/ 0, 90, 0, /*behParam*/ 0x00000000, /*beh*/ Object1.bhvSeesawPlatform),
	OBJECT(/*model*/ MODEL_BITDW_SLIDING_PLATFORM,  /*pos*/ -5728,   819, -2151, /*angle*/ 0, 0, 0,  /*behParam*/ 0x03CE0000, /*beh*/ Object1.bhvSlidingPlatform2),
	OBJECT(/*model*/ MODEL_BITDW_FERRIS_WHEEL_AXLE, /*pos*/  -204, -1924,  3381, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00010000, /*beh*/ Object1.bhvFerrisWheelAxle),
	OBJECT(/*model*/ MODEL_BITDW_STAIRCASE,         /*pos*/  5279,  1740,    -6, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00010000, /*beh*/ Object1.bhvAnimatesOnFloorSwitchPress),
	OBJECT(/*model*/ MODEL_PURPLE_SWITCH,           /*pos*/  3922,  1740,    -7, /*angle*/ 0, 0, 0,  /*behParam*/ 0x00000000, /*beh*/ Object1.bhvFloorSwitchAnimatesObject),

	[LCMD_RETURN],
];

script_func_local_2 = [
	[LCMD_RETURN],
];

script_func_local_3 = [
	[LCMD_RETURN],
];

script_func_local_4 = [
	[LCMD_RETURN],
];

level_bitdw_entry = [
		[LCMD_INIT_LEVEL],
		[LCMD_INIT_MARIO, 1, 1, bhvMario ],
		
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_03,       geo_bitdw_0003C0],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_04,       geo_bitdw_0003D8],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_05,       geo_bitdw_0003F0],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_06,       geo_bitdw_000408],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_07,       geo_bitdw_000420],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_08,       geo_bitdw_000438],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_09,       geo_bitdw_000450],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_0A,       geo_bitdw_000468],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_0B,       geo_bitdw_000480],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_0C,       geo_bitdw_000498],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_0D,       geo_bitdw_0004B0],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_0E,       geo_bitdw_0004C8],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_0F,       geo_bitdw_0004E0],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_10,       geo_bitdw_0004F8],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_11,       geo_bitdw_000510],
	    //[LCMD_LOAD_MODEL_FROM_GEO, MODEL_BITDW_WARP_PIPE,         warp_pipe_geo)]
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BITDW_SQUARE_PLATFORM,   geo_bitdw_000558],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BITDW_SEESAW_PLATFORM,   geo_bitdw_000540],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BITDW_SLIDING_PLATFORM,  geo_bitdw_000528],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BITDW_FERRIS_WHEEL_AXLE, geo_bitdw_000570],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BITDW_BLUE_PLATFORM,     geo_bitdw_000588],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BITDW_STAIRCASE_FRAME4,  geo_bitdw_0005A0],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BITDW_STAIRCASE_FRAME3,  geo_bitdw_0005B8],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BITDW_STAIRCASE_FRAME2,  geo_bitdw_0005D0],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BITDW_STAIRCASE_FRAME1,  geo_bitdw_0005E8],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BITDW_STAIRCASE,         geo_bitdw_000600],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_PURPLE_SWITCH,				purple_switch_geo],
	
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_YELLOW_COIN, yellow_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_RED_COIN, red_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_EXCLAMATION_BOX,   exclamation_box_geo ],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_SPARKLES,          sparkles_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_NUMBER,			number_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_STAR,								star_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_MIST,								mist_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_AMP,								amp_geo],

	    [LCMD_BEGIN_AREA, 1, geo_bitdw_000618 ],
	    [LCMD_JUMP_LINK, script_func_local_1 ],
	    [LCMD_JUMP_LINK, script_func_local_2 ],
	    [LCMD_JUMP_LINK, script_func_local_3 ],
	    [LCMD_JUMP_LINK, script_func_local_4 ],
		[LCMD_TERRAIN, bitdw_seg7_collision_level ],
		[LCMD_MACRO_OBJECTS, bitdw_seg7_macro_objs ],
		[LCMD_END_AREA ],
		[LCMD_FREE_LEVEL_POOL ],
		[LCMD_SET_MARIO_POS, 1, 90,  -7443, -3153, 3886],//-7282, 538, -243],//6816,  2860,   -7],//-7443, -3153, 3886],
		[LCMD_CALL, 0, lvl_init_or_update ],
		[LCMD_CALL_LOOP, 1, lvl_init_or_update ],
];

boot("bitdw_script");
}