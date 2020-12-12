// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mist_bhv_define(){
	/// <pygml?v=1.0&h=d95fad7a4>
	Object1.bhvWhitePuffExplosion = [
	    [BCMD_BEGIN, OBJ_LIST_UNIMPORTANT],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_CYCL],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_white_puff_exploding_loop],
	    [BCMD_LOOP_END],
	];	
}