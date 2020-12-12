// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function number_bhv_define(){
	/// <pygml?v=1.0&h=68b0b537f>
	bhvOrangeNumber = [
	    [BCMD_BEGIN, OBJ_LIST_LEVEL],
	    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
	    [BCMD_CYCL],
	    [BCMD_HOME],
	    [BCMD_CALL, bhv_orange_number_init],
	    [BCMD_LOOP_BEGIN],
	        [BCMD_CALL, bhv_orange_number_loop],
	    [BCMD_LOOP_END],
	];

}