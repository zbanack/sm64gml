function pss_init(){
	pss_coll_define();	
	pss_model_define();	
	pss_geo_define();	
}

function pss_script() {
	
	pss_seg7_macro_objs = [
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -3233,  4688, -5600),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -5636,  4331, -5054),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -5980,  3453,   945),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -2870,  2837,  2300),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  3930,   274,  2425),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  5174,    61,  3200),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  5707,  -128,  4565),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  5194,  -310,  5845),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  3640,  -543,  6450),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  2550,  -700,  6050),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  1821,  -921,  4616),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/   -20, -2542, -6304),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -1197, -2929, -4692),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -2565, -3268, -3525),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -4909, -3633, -4218),
	  MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -6290, -3937, -2545),
	   ////MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_wooden_signpost,      /*yaw*/  90, /*pos*/  3580,  6140, -5180, /*behParam*/ DIALOG_149),
	   ////MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/  90, /*pos*/  3000,  6180, -5640),
	   MACRO_OBJECT(/*preset*/ macro_blue_coin_switch,     /*yaw*/   0, /*pos*/  5423,  6140, -6540),
	   MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,     /*yaw*/   0, /*pos*/   780,  5613, -5600),
	   MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,     /*yaw*/   0, /*pos*/  2360,  5979, -5600),
	   MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/   0, /*pos*/  1880, -1440,    60),
	   MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/   0, /*pos*/  1860, -1760, -1720),
	   MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/   0, /*pos*/  1860, -1200,  1680),
	   ////MACRO_OBJECT(/*preset*/ macro_hidden_1up_trigger,   /*yaw*/   0, /*pos*/  1860, -1220,  1700),
	   ////MACRO_OBJECT(/*preset*/ macro_hidden_1up_trigger,   /*yaw*/   0, /*pos*/  1880, -1460,    80),
	   ////MACRO_OBJECT(/*preset*/ macro_hidden_1up_trigger,   /*yaw*/   0, /*pos*/  1860, -1820, -1680),
	   ////MACRO_OBJECT(/*preset*/ macro_hidden_1up_trigger,   /*yaw*/   0, /*pos*/ -6380, -4550,  6320),
	   ////MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_hidden_1up,           /*yaw*/   0, /*pos*/ -6380, -4500,  5980, /*behParam*/ 4),
	   ////MACRO_OBJECT(/*preset*/ macro_1up_sliding,          /*yaw*/ 180, /*pos*/  1847,  -961,  3863),
	   MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/  90, /*pos*/   260,  2580,  2280),
	   MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/  90, /*pos*/  -880,  2880,  2280),
	   MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,     /*yaw*/   0, /*pos*/  -809,  5245, -5600),
	   MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,     /*yaw*/   0, /*pos*/ -2409,  4877, -5600),
	   MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -6400, -4146,  -590),
	   MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -6400, -4335,  1409),
	   MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -6400, -4530,  3481),
	   MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,     /*yaw*/   0, /*pos*/ -4445,  4490, -5536),
	   MACRO_OBJECT(/*preset*/ macro_hidden_blue_coin,     /*yaw*/   0, /*pos*/ -6263,  4150, -4009),
	   //MACRO_OBJECT(/*preset*/ macro_yellow_coin_2,        /*yaw*/   0, /*pos*/  1854, -2132, -4290),
	   //MACRO_OBJECT(/*preset*/ macro_breakable_box_three_coins,           /*yaw*/   0, /*pos*/ -6385, -4200,  5770),
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
	
	level_pss_entry = [			   
		[LCMD_INIT_LEVEL],
		[LCMD_INIT_MARIO, 1, 1, bhvMario ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_YELLOW_COIN, yellow_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_RED_COIN, red_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BLUE_COIN, blue_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BLUE_COIN_SWITCH, blue_coin_switch_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_EXCLAMATION_BOX,   exclamation_box_geo ],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_SPARKLES,          sparkles_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_NUMBER,			number_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_STAR,	star_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_MIST,	mist_geo],
	    [LCMD_BEGIN_AREA, 1, pss_geo_000100 ],
	    [LCMD_JUMP_LINK, script_func_local_1 ],
	    [LCMD_JUMP_LINK, script_func_local_2 ],
	    [LCMD_JUMP_LINK, script_func_local_3 ],
	    [LCMD_JUMP_LINK, script_func_local_4 ],
		[LCMD_TERRAIN, pss_seg7_collision ],
		[LCMD_MACRO_OBJECTS, pss_seg7_macro_objs ],
		[LCMD_TERRAIN_TYPE, TERRAIN_SLIDE ],
		[LCMD_END_AREA ],
		[LCMD_FREE_LEVEL_POOL ],
		[LCMD_SET_MARIO_POS,  1, /*yaw*/ 270, /*pos*/ 5632, 6451, -5631],
		[LCMD_CALL, 0, lvl_init_or_update ],
		[LCMD_CALL_LOOP, 1, lvl_init_or_update ],
	];		
}