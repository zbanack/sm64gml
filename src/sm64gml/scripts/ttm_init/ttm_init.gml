function ttm_init(){
	ttm_coll_define();	
	ttm_model_define();	
	ttm_geo_define();	

}

function ttm_script() {
/// <pygml?v=1.0&h=e5f39a5cd>
	ttm_seg7_area_2_macro_objs = [
		//MACRO_OBJECT(/*preset*/ macro_hidden_1up_trigger,   /*yaw*/   0, /*pos*/  6100,  4836,  6981),
		//MACRO_OBJECT(/*preset*/ macro_hidden_1up_trigger,   /*yaw*/   0, /*pos*/  6645,  4800,  7563),
		//MACRO_OBJECT(/*preset*/ macro_hidden_1up_trigger,   /*yaw*/   0, /*pos*/  7845,  4836,  6327),
		////MACRO_OBJECT(/*preset*/ macro_hidden_1up_trigger,   /*yaw*/   0, /*pos*/  7263,  4836,  5745),
		//MACRO_OBJECT_WITH_BEH_PARAM(/*preset*/ macro_hidden_1up,           /*yaw*/   0, /*pos*/  6936,  4800,  6654, /*behParam*/ 4),
		MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/  6281,  4836,  6472),
		//MACRO_OBJECT(/*preset*/ macro_1up,                  /*yaw*/   0, /*pos*/  6754,  4800,  5963),
		//MACRO_OBJECT(/*preset*/ macro_1up_sliding,          /*yaw*/   0, /*pos*/  1764,  2943,  1480),
		MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/  45, /*pos*/  2972,  3963,  2690),
		MACRO_OBJECT(/*preset*/ macro_coin_line_horizontal, /*yaw*/  45, /*pos*/    27,  2145,  -290),
		MACRO_OBJECT(/*preset*/ macro_yellow_coin,        /*yaw*/   0, /*pos*/ -2763,   -37, -2981),
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
	
	level_ttm_entry = [			   
		[LCMD_INIT_LEVEL],
		[LCMD_INIT_MARIO, 1, 1, bhvMario ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_YELLOW_COIN, yellow_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_RED_COIN, red_coin_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_BLUE_COIN, blue_coin_geo ],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_SPARKLES,          sparkles_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_NUMBER,			number_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_STAR,	star_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_MIST,	mist_geo],
	    [LCMD_BEGIN_AREA, 2, ttm_geo_000B5C ],
	    [LCMD_JUMP_LINK, script_func_local_4 ],
		[LCMD_TERRAIN, ttm_seg7_area_2_collision ],
		[LCMD_MACRO_OBJECTS, ttm_seg7_area_2_macro_objs ],
		[LCMD_TERRAIN_TYPE, TERRAIN_SLIDE ],
		[LCMD_END_AREA ],
		[LCMD_FREE_LEVEL_POOL ],
		[LCMD_SET_MARIO_POS,  1, /*yaw*/ 140, /*pos*/ 6936,  4800,  6654, /*yaw*/],
		[LCMD_CALL, 0, lvl_init_or_update ],
		[LCMD_CALL_LOOP, 1, lvl_init_or_update ],
	];			
}