function castle_inside_script(){
	
script_func_local_1 = [
    //OBJECT(/*model*/ MODEL_CASTLE_STAR_DOOR_8_STARS, /*pos*/ -2706,   512, -1409, /*angle*/ 0,  45, 0, /*behParam*/ 0x08000000, /*beh*/ Object1.bhvStarDoor),
    //OBJECT(/*model*/ MODEL_CASTLE_STAR_DOOR_8_STARS, /*pos*/ -2598,   512, -1517, /*angle*/ 0, 225, 0, /*behParam*/ 0x08000000, /*beh*/ Object1.bhvStarDoor),
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

level_castle_inside_entry = [
	[LCMD_INIT_LEVEL],
	[LCMD_INIT_MARIO, 1, 1, bhvMario ],

    //[LCMD_LOAD_MODEL_FROM_GEO, MODEL_CASTLE_CASTLE_DOOR,        castle_door_geo],
    //[LCMD_LOAD_MODEL_FROM_GEO, MODEL_CASTLE_WOODEN_DOOR,        wooden_door_geo],
    //[LCMD_LOAD_MODEL_FROM_GEO, MODEL_CASTLE_METAL_DOOR,         metal_door_geo],
    //[LCMD_LOAD_MODEL_FROM_GEO, MODEL_CASTLE_CASTLE_DOOR_UNUSED, castle_door_geo],
    //[LCMD_LOAD_MODEL_FROM_GEO, MODEL_CASTLE_WOODEN_DOOR_UNUSED, wooden_door_geo],
    //[LCMD_LOAD_MODEL_FROM_GEO, MODEL_CASTLE_DOOR_0_STARS,       castle_door_0_star_geo],
    //[LCMD_LOAD_MODEL_FROM_GEO, MODEL_CASTLE_DOOR_1_STAR,        castle_door_1_star_geo],
    //[LCMD_LOAD_MODEL_FROM_GEO, MODEL_CASTLE_DOOR_3_STARS,       castle_door_3_stars_geo],
    //[LCMD_LOAD_MODEL_FROM_GEO, MODEL_CASTLE_KEY_DOOR,           key_door_geo],
	[LCMD_BEGIN_AREA, 1, castle_geo_001400 ],
	[LCMD_JUMP_LINK, script_func_local_1 ],
	[LCMD_JUMP_LINK, script_func_local_2 ],
	[LCMD_JUMP_LINK, script_func_local_3 ],
	[LCMD_JUMP_LINK, script_func_local_4 ],
	[LCMD_TERRAIN, inside_castle_seg7_area_1_collision ],
	[LCMD_ROOMS, inside_castle_seg7_area_1_rooms ],
	[LCMD_MACRO_OBJECTS, inside_castle_seg7_area_1_macro_objs ],
	[LCMD_END_AREA ],
	[LCMD_FREE_LEVEL_POOL ],
	[LCMD_SET_MARIO_POS, 1, 180,  -1023, 0, 1152],
	[LCMD_CALL, 0, lvl_init_or_update ],
	[LCMD_CALL_LOOP, 1, lvl_init_or_update ],
];

boot("castle_inside_script");
}