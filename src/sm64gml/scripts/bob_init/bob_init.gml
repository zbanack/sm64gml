function bob_init() {
	bob_texture_define();
	bob_coll_define();	
	bob_model_define();	
	bob_geo_define();	
}

function bob_script() {
	level_bob_entry = [			   
		[LCMD_INIT_LEVEL],
		[LCMD_INIT_MARIO, 1, 1, bhvMario ],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_BUBBLY_TREE, bubbly_tree_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_YELLOW_COIN, yellow_coin_geo ],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_SPARKLES,  sparkles_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_NUMBER,	number_geo],
	    [LCMD_BEGIN_AREA, 1, bob_geo_000488 ],
		[LCMD_TERRAIN, bob_seg7_collision_level ],
		[LCMD_END_AREA ],
		[LCMD_FREE_LEVEL_POOL ],
		[LCMD_SET_MARIO_POS, 1, /*yaw*/ 135, /*pos*/ -6558, 0, 6464],
		[LCMD_CALL, 0, lvl_init_or_update ],
		[LCMD_CALL_LOOP, 1, lvl_init_or_update ],
	];		
}