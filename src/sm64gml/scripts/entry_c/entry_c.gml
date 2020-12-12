function entry_c_macros_init() {
	
	var use_jump;
	
	switch(CURRENT_LEVEL) {
	
		case(LEVEL_CASTLE):
			use_jump = level_castle_inside_entry;
		break;
		case(LEVEL_BITDW):
			use_jump = level_bitdw_entry;
		break;
		case(LEVEL_WF):
			use_jump = level_wf_entry;
		break;
		case(LEVEL_PSS):
			use_jump = level_pss_entry;
		break;
		case(LEVEL_SSL):
			use_jump = level_ssl_entry;
		break;
		case(LEVEL_JRB):
			use_jump = level_jrb_entry;
		break;
		case(LEVEL_BBH):
			use_jump = level_bbh_entry;
		break;
		case(LEVEL_CCM):
			use_jump = level_ccm_entry;
		break;
		case(LEVEL_TTM):
			use_jump = level_ttm_entry;
		break;
		case(LEVEL_CASTLE_GROUNDS):
			use_jump = level_castle_grounds_entry;
		break;
		case(LEVEL_BOB):
			use_jump = level_bob_entry;
		break;
		default:
			throw("\nlevel LCMD_JUMP_IF undefined");
		break;
		
	}
	
	level_defines_list = [
		[LCMD_JUMP_IF, OP_EQ, CURRENT_LEVEL, use_jump],
	];		

	script_exec_level_table = [
	    [ LCMD_GET_OR_SET,  OP_GET, VAR_CURR_LEVEL_NUM ],
		level_defines_list[0],
	];

	level_main_scripts_entry = [

	   [LCMD_ALLOC_LEVEL_POOL],
	   [LCMD_LOAD_MODEL_FROM_GEO, 1, mario_geo],
	   //[LCMD_FREE_LEVEL_POOL],
	   [LCMD_CALL, 0, lvl_init_from_save_file ],
	   [LCMD_JUMP_LINK, script_exec_level_table ],
	]

	level_intro_entry_2 = [

	    [LCMD_SET_REGISTER, CURRENT_LEVEL ],
	    [LCMD_EXECUTE,  level_main_scripts_entry ],

	]

	level_intro_entry_1 = [
	    [LCMD_EXECUTE, level_intro_entry_2]
	]
	
	level_script_entry = [
	    [LCMD_INIT_LEVEL ],
	    [LCMD_SLEEP, 1 ],
	    [LCMD_BLACKOUT, false ],
	    [LCMD_SET_REGISTER, 0 ],
	    [LCMD_EXECUTE, level_intro_entry_1 ],
	];	
	
	boot("entry_c_macros_init");
}