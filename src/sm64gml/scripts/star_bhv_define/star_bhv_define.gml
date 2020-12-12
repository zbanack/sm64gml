// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function star_bhv_define(){
	/// <pygml?v=1.0&h=544eb6201>
	bhvStar = [
	    [BCMD_BEGIN, OBJ_LIST_LEVEL],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_CALL, bhv_init_room],
	    [BCMD_CALL, bhv_collect_star_init],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_collect_star_loop],
	    [BCMD_LOOP_END],
	];

	/// <pygml?v=1.0&h=2ecf93bdb>
	bhvStarKeyCollectionPuffSpawner = [
	    [BCMD_BEGIN, OBJ_LIST_DEFAULT],
	    [BCMD_CYCL],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_SET_INT, oAnimState, -1],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_star_key_collection_puff_spawner_loop],
	    [BCMD_LOOP_END],
	];
	
	/// <pygml?v=1.0&h=6550c007d>
	bhvCelebrationStar = [
	    [BCMD_BEGIN, OBJ_LIST_LEVEL],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_CALL, bhv_celebration_star_init],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_celebration_star_loop],
	    [BCMD_LOOP_END],
	];

	/// <pygml?v=1.0&h=c096108ae>
	bhvCelebrationStarSparkle = [
	    [BCMD_BEGIN, OBJ_LIST_UNIMPORTANT],
	    [BCMD_CYCL],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_SET_FLOAT, oGraphYOffset, 25],
	    [BCMD_SET_INT, oAnimState, -1],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_ADD_INT, oAnimState, 1],
	        [BCMD_CALL, bhv_celebration_star_sparkle_loop],
	    [BCMD_LOOP_END],
	];



}