function ccm_init(){
	switch(CURRENT_LEVEL_AREA) {
		case(1):
			ccm_coll1_define();	
			ccm_model1_define();	
			ccm_geo1_define();	
		break;
		case(2):
			ccm_coll2_define();	
			ccm_model2_define();	
			ccm_geo2_define();	
		break;
	}
}

function ccm_script() {
	
	switch(CURRENT_LEVEL_AREA) {
		case(1):
			ccm_seg7_area_1_macro_objs = [
			    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,           /*yaw*/ 180, /*pos*/ -2412,  2912,  -878, /*behParam*/ DIALOG_040),
			    //MACRO_OBJECT(/*preset*/ macro_mr_blizzard,               /*yaw*/   0, /*pos*/  3054, -2674,  2072),
			    MACRO_OBJECT(/*preset*/ macro_spindrift,                 /*yaw*/   0, /*pos*/  2542,  2622, -1714),
			    MACRO_OBJECT(/*preset*/ macro_spindrift,                 /*yaw*/   0, /*pos*/ -6090, -1740,  1936),
			    MACRO_OBJECT(/*preset*/ macro_spindrift,                 /*yaw*/   0, /*pos*/  4346, -3068,   400),
			    MACRO_OBJECT(/*preset*/ macro_spindrift,                 /*yaw*/   0, /*pos*/ -5054, -4659, -1054),
			    MACRO_OBJECT(/*preset*/ macro_spindrift,                 /*yaw*/   0, /*pos*/ -5033, -4740, -2666),
			    //MACRO_OBJECT(/*preset*/ macro_bobomb_buddy_opens_cannon, /*yaw*/   0, /*pos*/ -1220, -3583,  5969),
			    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_cannon_closed,             /*yaw*/   0, /*pos*/ -3615, -4607,  4790, /*behParam*/ 0x00),
			    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_cannon_closed,             /*yaw*/   0, /*pos*/ -5045, -1740,  4615, /*behParam*/ 0x00),
			    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_cannon_closed,             /*yaw*/   0, /*pos*/  1090, -4607,  5729, /*behParam*/ 0x80),
			    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,           /*yaw*/ 270, /*pos*/ -1060,  2560, -1840, /*behParam*/ DIALOG_087),
			    MACRO_OBJECT(/*preset*/ macro_coin_line_vertical,        /*yaw*/   0, /*pos*/  -180,  3100, -1480),
			    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal,      /*yaw*/   0, /*pos*/  3560,  2100,  -280),
			    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal,      /*yaw*/  77, /*pos*/ -1942,  1334,  1678),
			    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal,      /*yaw*/  90, /*pos*/ -1020,   646, -2706),
			    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal,      /*yaw*/  93, /*pos*/ -1460,  -888, -3933),
			    //MACRO_OBJECT(/*preset*/ macro_coin_arrow,                /*yaw*/  75, /*pos*/ -2586, -4889, -4093),
			    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,           /*yaw*/ 270, /*pos*/ -4350, -4864, -4813, /*behParam*/ DIALOG_094),
			    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,           /*yaw*/   0, /*pos*/ -1037, -3583,  5872, /*behParam*/ DIALOG_091),
			    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,           /*yaw*/ 180, /*pos*/  -309, -4889, -3690, /*behParam*/ DIALOG_049),
			    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,           /*yaw*/   0, /*pos*/  1900, -1535,  3500, /*behParam*/ DIALOG_040),
			    MACRO_OBJECT(/*preset*/ macro_red_coin,                  /*yaw*/   0, /*pos*/  -488,  3100, -2305),
			    MACRO_OBJECT(/*preset*/ macro_red_coin,                  /*yaw*/   0, /*pos*/ -3120, -1200, -2080),
			    //MACRO_OBJECT(/*preset*/ macro_hidden_1up_in_pole,        /*yaw*/   0, /*pos*/ -5200, -1345,  2995),
			    MACRO_OBJECT(/*preset*/ macro_red_coin,                  /*yaw*/   0, /*pos*/  2940, -1400,  2630),
			    MACRO_OBJECT(/*preset*/ macro_red_coin,                  /*yaw*/   0, /*pos*/  -600,  -505,  1940),
			    MACRO_OBJECT(/*preset*/ macro_red_coin,                  /*yaw*/   0, /*pos*/ -3814, -2112,  6427),
			    MACRO_OBJECT(/*preset*/ macro_red_coin,                  /*yaw*/   0, /*pos*/  2700, -4600,  1230),
			    MACRO_OBJECT(/*preset*/ macro_red_coin,                  /*yaw*/   0, /*pos*/  1990, -4040,  4950),
			    MACRO_OBJECT(/*preset*/ macro_blue_coin_switch,          /*yaw*/   0, /*pos*/  3400,  -820,     0),
			    MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,          /*yaw*/   0, /*pos*/  3400,  -640,  -740),
			    MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,          /*yaw*/   0, /*pos*/  3400,  -320, -1740),
			    //MACRO_OBJECT(/*preset*/ macro_recovery_heart,            /*yaw*/   0, /*pos*/  -270, -4650, -3100),
			    MACRO_OBJECT(/*preset*/ macro_red_coin,                  /*yaw*/   0, /*pos*/  4408, -4550, -1534),
			    //MACRO_OBJECT(/*preset*/ macro_box_1up_running_away,      /*yaw*/   0, /*pos*/ -4887, -1300, -4003),
			    //MACRO_OBJECT(/*preset*/ macro_box_1up_running_away,      /*yaw*/   0, /*pos*/ -1557,  -205,  1794),
			];
	
			script_func_local_1 = [
				[LCMD_RETURN],
			]
	
			script_func_local_2 = [
				[LCMD_RETURN],
			]
	
			script_func_local_3 = [
				[LCMD_RETURN],
			]
	
			script_func_local_4 = [
				[LCMD_RETURN],
			]
	
			level_ccm_entry = [			   
				[LCMD_INIT_LEVEL],
				[LCMD_INIT_MARIO, 1, 1, bhvMario ],
			    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_YELLOW_COIN, yellow_coin_geo ],
			    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_RED_COIN, red_coin_geo ],
			    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BLUE_COIN, blue_coin_geo ],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_BLUE_COIN_SWITCH, blue_coin_switch_geo ],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_CCM_SNOW_TREE, snow_tree_geo ],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_SPARKLES,          sparkles_geo],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_NUMBER,			number_geo],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_STAR,	star_geo],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_MIST,	mist_geo],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_CCM_CABIN_DOOR,	cabin_door_geo],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_03, ccm_geo_00042C],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_04, ccm_geo_00045C],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_05, ccm_geo_000494],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_06, ccm_geo_0004BC],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_07, ccm_geo_0004E4],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_SPINDRIFT, spindrift_geo],
			    [LCMD_BEGIN_AREA, 2, ccm_geo_00051C ],
			    [LCMD_JUMP_LINK, script_func_local_4 ],
				[LCMD_TERRAIN, ccm_seg7_area_1_collision ],
				[LCMD_MACRO_OBJECTS, ccm_seg7_area_1_macro_objs ],
				[LCMD_TERRAIN_TYPE, TERRAIN_SNOW ],
				[LCMD_END_AREA ],
				[LCMD_FREE_LEVEL_POOL ],
				[LCMD_SET_MARIO_POS,  2, /*yaw*/ 140, /*pos*/ -1512, 2560, -2305],
				[LCMD_CALL, 0, lvl_init_or_update ],
				[LCMD_CALL_LOOP, 1, lvl_init_or_update ],
			];					
		break;
		case(2):
			ccm_seg7_area_2_macro_objs = [
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  2255,  4091,  -536),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,          /*yaw*/   0, /*pos*/  2055,  4352,  -497),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,          /*yaw*/   0, /*pos*/  1843,  4486,  -433),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,          /*yaw*/   0, /*pos*/  1603,  4567,  -347),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,          /*yaw*/   0, /*pos*/  1397,  4530,  -287),
		    //MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,      /*yaw*/   0, /*pos*/ -5320,  6656, -6540, /*behParam*/ DIALOG_054),
		    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/   0, /*pos*/ -4980,  2180, -1980),
		    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/   0, /*pos*/  6640,   -60,  -800),
		    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/   0, /*pos*/  6640, -1020,   440),
		    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/   0, /*pos*/  6640, -1820,  1760),
		    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/   0, /*pos*/  6640, -2260,  2620),
		    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/   0, /*pos*/ -6460, -5000, -3200),
		    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/   0, /*pos*/ -6460, -5540, -4100),
		    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/   0, /*pos*/ -6460, -5200, -5000),
		    //MACRO_OBJECT(/*preset*/ macro_box_1up,              /*yaw*/   0, /*pos*/ -5600, -4500, -6644),
		    //MACRO_OBJECT(/*preset*/ macro_moving_blue_coin,     /*yaw*/   0, /*pos*/ -3160,  6267, -6120),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  -700,  5923, -6240),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  2260,  5342, -6440),
		    MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/ 120, /*pos*/  2960,  4280,  -880),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  1900,   659, -2340),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  1720,   690, -2220),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  3400,   302, -5240),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  3600,   297, -5420),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  6120,  4435, -5020),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  6140,  -152, -5540),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  6320,  -200, -5320),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  3960, -3297,  6440),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  1400, -3560,  5840),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  -220, -3780,  4960),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  -520, -3890,  4360),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  -740, -4008,  3540),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  -920, -4094,  2760),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  -960, -4101,  2080),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  -860,  3391,  -760),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -1120,  3293, -1140),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -1560,  2989, -3280),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -1740,  2926, -3780),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -2849,  2677, -4608),
		    MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -4620,  2353, -4120),
		    //MACRO_OBJECT(/*preset*/ macro_1up_sliding,          /*yaw*/   0, /*pos*/ -4890,  1452,   552),
		    //MACRO_OBJECT(/*preset*/ macro_1up_sliding,          /*yaw*/   0, /*pos*/ -6369, -1538,  3726),
		    //MACRO_OBJECT_END(),
			];
	
			script_func_local_1 = [
				[LCMD_RETURN],
			]
	
			script_func_local_2 = [
				[LCMD_RETURN],
			]
	
			script_func_local_3 = [
				[LCMD_RETURN],
			]
	
			script_func_local_4 = [
				[LCMD_RETURN],
			]
	
			level_ccm_entry = [			   
				[LCMD_INIT_LEVEL],
				[LCMD_INIT_MARIO, 1, 1, bhvMario ],
			    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_YELLOW_COIN, yellow_coin_geo ],
			    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_RED_COIN, red_coin_geo ],
			    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BLUE_COIN, blue_coin_geo ],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_SPARKLES,          sparkles_geo],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_NUMBER,			number_geo],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_STAR,	star_geo],
				[LCMD_LOAD_MODEL_FROM_GEO, MODEL_MIST,	mist_geo],
			    [LCMD_BEGIN_AREA, 2, ccm_geo_0005E8 ],
			    [LCMD_JUMP_LINK, script_func_local_4 ],
				[LCMD_TERRAIN, ccm_seg7_area_2_collision ],
				[LCMD_MACRO_OBJECTS, ccm_seg7_area_2_macro_objs ],
				[LCMD_TERRAIN_TYPE, TERRAIN_SLIDE ],
				[LCMD_END_AREA ],
				[LCMD_FREE_LEVEL_POOL ],
				[LCMD_SET_MARIO_POS,  2, /*yaw*/ 140, /*pos*/ -5836,  7465, -6143, /*yaw*/],
				[LCMD_CALL, 0, lvl_init_or_update ],
				[LCMD_CALL_LOOP, 1, lvl_init_or_update ],
			];			
		break;
	}
		
}