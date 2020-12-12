function castle_grounds_script() {
	level_castle_grounds_entry = [			   
		[LCMD_INIT_LEVEL],
		[LCMD_INIT_MARIO, 1, 1, bhvMario ],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_WF_BUBBLY_TREE, bubbly_tree_geo ],
	    [LCMD_LOAD_MODEL_FROM_GEO, MODEL_YELLOW_COIN, yellow_coin_geo ],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_SPARKLES,          sparkles_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_NUMBER,			number_geo],
		[LCMD_LOAD_MODEL_FROM_GEO, MODEL_LEVEL_GEOMETRY_03,	castle_grounds_geo_0006F4],
	    [LCMD_BEGIN_AREA, 1, castle_grounds_geo_00073C ],
		[LCMD_TERRAIN, castle_grounds_seg7_collision_level ],
		[LCMD_END_AREA ],
		[LCMD_FREE_LEVEL_POOL ],
		[LCMD_SET_MARIO_POS, 1, 180,  -1328, 260, 4664],
		[LCMD_CALL, 0, lvl_init_or_update ],
		[LCMD_CALL_LOOP, 1, lvl_init_or_update ],
	];
}