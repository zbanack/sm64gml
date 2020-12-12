function lvl_cmd_init_level(args) {
		
    gObjParentGraphNode = init_graph_node_start(null, null);
    clear_objects();
    clear_areas();
    sCurrentScript.index++;
	
}
	
function lvl_cmd_init_mario(args) {
		
	var spawn_info = gMarioSpawnInfo;
    spawn_info.startPos				= {x:0, y:0, z:0};
    spawn_info.startAngle			= {x:0, y:0, z:0}; 
    spawn_info.areaIndex			= 0;
    spawn_info.behaviorArg			= args[2];
    spawn_info.behaviorScript		= args[3];
    spawn_info.unk18				= gLoadedGraphNodes[args[1]];

    sCurrentScript.index++

}

function lvl_cmd_object_with_acts(args) {
	
	var model, posX, posY, posZ, angleX, angleY, angleZ, behParam, beh, acts;
	model		= args[1];
	posX		= args[2];
	posY		= args[3];
	posZ		= args[4];
	angleX		= args[5];
	angleY		= args[6];
	angleZ		= args[7];
	behParam	= args[8];
	beh			= args[9];
	acts		= args[10];
	
	var obj = spawn_object_abs_with_rot(gMacroObjectDefaultParent, 0,
		model, beh, posX, posY, posZ, convert_rotation(angleX), convert_rotation(angleY), convert_rotation(angleZ));
		
    obj.behaviorArg	= behParam;
    obj.behaviorScript = beh;
    obj.areaIndex		= 0;
	
	// @z?
    obj.rawData[oBehParams]			= behParam;
    obj.rawData[oBehParams2ndByte]	= ((behParam) >> 16) & 0xFF;
			
    sCurrentScript.index++

}
	
function lvl_cmd_load_model_from_geo(args) {
	
    if (args[1] < 256) {
        var _test = process_geo_layout(args[2]).node;

		gLoadedGraphNodes[args[1]] = _test;
			
    }

    sCurrentScript.index++;
}
	
function lvl_cmd_set_mario_pos(args) {
		
    var yaw = floor(args[2] * 0x8000 / 180)
    yaw = yaw > 32767 ? yaw - 65536 : yaw
    yaw = yaw < -32768 ? yaw + 65536 : yaw
		
	var spawn_info = gMarioSpawnInfo;
	spawn_info.areaIndex	= args[1];
	spawn_info.startPos		= [ args[3], args[4], args[5] ];
	spawn_info.startAngle	= [0, yaw, 0 ];

	sCurrentScript.index++;
		
}

function lvl_cmd_terrain_type(args) {
		
	gAreas[sCurrAreaIndex].terrainType |= args[1];

	sCurrentScript.index++;
		
}
	
function lvl_cmd_load_mario_head(args) {
		
    GoddardRenderer.gdm_setup();
    GoddardRenderer.gdm_maketestdl(args[1]);
    sCurrentScript.index++;
		
}
	
/**
	* Puts game to sleep for n frames
	*/
function lvl_cmd_sleep(args) {
		
    sScriptStatus = SCRIPT_PAUSED;

    if (sDelayFrames == 0) {
        sDelayFrames = args[1];
    } else if (--sDelayFrames == 0) {
        sCurrentScript.index++;
        sScriptStatus = SCRIPT_RUNNING;
    }
}
	
function lvl_cmd_blackout(args) {
		
    sCurrentScript.index++;
}

function lvl_cmd_set_register(args) {
		
    sRegister = args[1];
    sCurrentScript.index++;
		
}

function eval_script_op(op, arg) {
    switch (op) {
        case(0): return sRegister & arg;
        case(1): return !(sRegister & arg);
        case(2): return sRegister == arg;
        case(3): return sRegister != arg;
        case(4): return sRegister < arg;
        case(5): return sRegister <= arg;
        case(6): return sRegister > arg;
        case(7): return sRegister >= arg;
    }
		
	return null;

}

function lvl_cmd_call(args) {
		
	var func = args[2];
    //var funcClass = args[3];
	//	
	//var fnc = method(funcClass, func);
		
    sRegister = func(args[1], sRegister);
    sCurrentScript.index++;
}

function lvl_cmd_call_loop(args) {
		
    var func = args[2];
    //var funcClass = args[3];
	//	
	//var fnc = method(funcClass, func);
    //sRegister = fnc(args[1], sRegister);
	
    sRegister = func(args[1], sRegister);
        
    if (sRegister == 0) {
        sScriptStatus = SCRIPT_PAUSED;
    } else {
        sScriptStatus = SCRIPT_RUNNING;
        sCurrentScript.index++;
    }
}

function lvl_cmd_alloc_level_pool(args) {
		
    sCurrentScript.index++;
		
}

function lvl_cmd_free_level_pool(args) {
   
    alloc_surface_pools();

    sCurrentScript.index++;
		
}

function lvl_cmd_get_or_set(args) {
		
    if (args[1] == 0) {
        switch (args[2]) {
            case(0): gCurrSaveFileNum = sRegister; break;
            case(1): gCurrCourseNum = sRegister; break;
            case(2): gCurrActNum = sRegister; break;
            case(3): gCurrLevelNum = sRegister; break;
            case(4): gCurAreaIndex = sRegister; break;
            case(5): gPressedStart = sRegister; break;
        }
    } else {  // GET
        switch (args[2]) {
            case(0): sRegister = gCurrSaveFileNum; break;
            case(1): sRegister = gCurrCourseNum; break;
            case(2): sRegister = gCurrActNum; break;
            case(3): sRegister = gCurrLevelNum; break;
            case(4): sRegister = gCurAreaIndex; break;
            case(5): sRegister = gPressedStart; break;
        }
    }
    sCurrentScript.index++;
}

function lvl_cmd_load_area(args) {
		
    var areaIndex = args[1];
    load_area(areaIndex);
    sCurrentScript.index++;
}

function lvl_cmd_unload_area(args) {
		
    clear_areas();
    sCurrentScript.index++;
}

function lvl_cmd_begin_area(args) {
		
    var areaIndex = args[1];
    var geoLayout = args[2];
		
    if (areaIndex < 8) {
        var screenArea = process_geo_layout(geoLayout);
			
        sCurrAreaIndex = areaIndex;
			
        screenArea.areaIndex = areaIndex;
			
        gAreas[areaIndex].geometryLayoutData = screenArea;
			
        if (screenArea.views[0]!=null) {
            gAreas[areaIndex].camera = screenArea.views[0].config.camera;
        } else {
            gAreas[areaIndex].camera = null;
        }
            
    }
    sCurrentScript.index++;
}

function lvl_cmd_terrain(args) {
		
    if (sCurrAreaIndex != -1) {
		gAreas[sCurrAreaIndex].terrainData = args[1];
	}

    sCurrentScript.index++;
}

function lvl_cmd_macro_objects(args) {
		
    if (sCurrAreaIndex != -1) {
		gAreas[sCurrAreaIndex].macroObjects = args[1];
	}

    sCurrentScript.index++;
}


function lvl_cmd_set_rooms(args) {
		
    if (sCurrAreaIndex != -1) {
		gAreas[sCurrAreaIndex].surfaceRooms = args[1];
	}

    sCurrentScript.index++;
}


function lvl_cmd_end_area(args) {
		
    sCurrAreaIndex = -1;
    sCurrentScript.index++;
}

function lvl_cmd_transition(args) {
		
    if (gCurrentArea) {
        play_transition(args[1], args[2], args[3], args[4], args[5]);
    }

    sCurrentScript.index++;
}

function cleardemoptr(args) {
    gCurrDemoInput = null;
    sCurrentScript.index++;
}

function lvl_cmd_execute(args) {
    start_new_script(args[1]);
}
	
function lvl_cmd_jump_link(args) {
    sStackTop.push({commands: sCurrentScript.commands, index: ++sCurrentScript.index})
    start_new_script(args[1]);
		
}

function lvl_cmd_return() {
	sCurrentScript = sStackTop.pop();
}

function lvl_cmd_jump_if(args) {
		
    if (eval_script_op(args[1], args[2]) == 0) {
        sCurrentScript.index++;
		return;
	}

	start_new_script(args[3]);
		
}

function start_new_script(level_script) {
    sCurrentScript.commands = level_script;
    sCurrentScript.index = 0;
}


function level_script_execute() {
	
    sScriptStatus = SCRIPT_RUNNING;

    while (sScriptStatus == SCRIPT_RUNNING) {
		var cmd, fnc, cur;
		cur = sCurrentScript;
        cmd = cur.commands[cur.index];
		fnc = LevelScriptJumpTable[cmd[0]];
		fnc(cmd);	
}

    rsp_init();
    rdp_init();
    render_game();
    end_master_display_list();

}

function level_commands_scripts_macros_init() {
#macro SCRIPT_RUNNING			(1)
#macro SCRIPT_PAUSED			(0)
#macro SCRIPT_PAUSED2			(-1)
#macro OP_AND					(0)
#macro OP_NAND					(1)
#macro OP_EQ					(2)
#macro OP_NEQ					(3)
#macro OP_LT					(4)
#macro OP_LEQ					(5)
#macro OP_GT					(6)
#macro OP_GEQ					(7)
#macro OP_SET					(0)
#macro OP_GET					(1)	
#macro VAR_CURR_SAVE_FILE_NUM	(0)
#macro VAR_CURR_COURSE_NUM		(1)
#macro VAR_CURR_ACT_NUM			(2)
#macro VAR_CURR_LEVEL_NUM		(3)
#macro VAR_CURR_AREA_INDEX		(4)
#macro REGULAR_FACE				(0x0002)
#macro DIZZY_FACE				(0x0003)
	
globalvar sScriptStatus;
sScriptStatus			= SCRIPT_PAUSED;

globalvar sDelayFrames;
sDelayFrames			= 0;

globalvar sCurrentScript;
sCurrentScript			= {commands: [], index: 0};

globalvar sRegister;
sRegister				= null;

globalvar sStackTop;
sStackTop				= new Array();

#macro LCMD_INIT_LEVEL				(0)
#macro LCMD_SLEEP					(1)
#macro LCMD_BLACKOUT				(2)
#macro LCMD_SET_REGISTER			(3)
#macro LCMD_EXECUTE					(4)
#macro LCMD_LOAD_MODEL_FROM_GEO		(5)
#macro LCMD_ALLOC_LEVEL_POOL		(6)
#macro LCMD_FREE_LEVEL_POOL			(7)
#macro LCMD_BEGIN_AREA				(8)
#macro LCMD_END_AREA				(9)
#macro LCMD_LOAD_AREA				(10)
#macro LCMD_UNLOAD_AREA				(11)
#macro LCMD_TRANSITION				(12)
#macro LCMD_CALL					(13)
#macro LCMD_CALL_LOOP				(14)
#macro LCMD_JUMP_IF					(15)
#macro LCMD_JUMP_LINK				(16)
#macro LCMD_GET_OR_SET				(17)
#macro LCMD_TERRAIN					(18)
#macro LCMD_SET_MARIO_POS			(19)
#macro LCMD_INIT_MARIO				(20)
#macro LCMD_MACRO_OBJECTS			(21)
#macro LCMD_OBJECT_WITH_ACTS		(22)
#macro LCMD_RETURN					(23)
#macro LCMD_ROOMS					(24)
#macro LCMD_TERRAIN_TYPE			(31)

globalvar LevelScriptJumpTable;
LevelScriptJumpTable							= array_create(50);
LevelScriptJumpTable[LCMD_INIT_LEVEL]			= lvl_cmd_init_level;
LevelScriptJumpTable[LCMD_SLEEP]				= lvl_cmd_sleep;
LevelScriptJumpTable[LCMD_BLACKOUT]				= lvl_cmd_blackout;
LevelScriptJumpTable[LCMD_SET_REGISTER]			= lvl_cmd_set_register;
LevelScriptJumpTable[LCMD_EXECUTE]				= lvl_cmd_execute;
LevelScriptJumpTable[LCMD_LOAD_MODEL_FROM_GEO]	= lvl_cmd_load_model_from_geo;
LevelScriptJumpTable[LCMD_ALLOC_LEVEL_POOL]		= lvl_cmd_alloc_level_pool;
LevelScriptJumpTable[LCMD_FREE_LEVEL_POOL]		= lvl_cmd_free_level_pool;
LevelScriptJumpTable[LCMD_BEGIN_AREA]			= lvl_cmd_begin_area;
LevelScriptJumpTable[LCMD_END_AREA]				= lvl_cmd_end_area;
LevelScriptJumpTable[LCMD_LOAD_AREA]			= lvl_cmd_load_area;
LevelScriptJumpTable[LCMD_UNLOAD_AREA]			= lvl_cmd_unload_area;
LevelScriptJumpTable[LCMD_TRANSITION]			= lvl_cmd_transition;
LevelScriptJumpTable[LCMD_CALL]					= lvl_cmd_call;
LevelScriptJumpTable[LCMD_CALL_LOOP]			= lvl_cmd_call_loop;
LevelScriptJumpTable[LCMD_JUMP_IF]				= lvl_cmd_jump_if;
LevelScriptJumpTable[LCMD_JUMP_LINK]			= lvl_cmd_jump_link;
LevelScriptJumpTable[LCMD_GET_OR_SET]			= lvl_cmd_get_or_set;
LevelScriptJumpTable[LCMD_TERRAIN]				= lvl_cmd_terrain;
LevelScriptJumpTable[LCMD_SET_MARIO_POS]		= lvl_cmd_set_mario_pos;
LevelScriptJumpTable[LCMD_INIT_MARIO]			= lvl_cmd_init_mario;
LevelScriptJumpTable[LCMD_MACRO_OBJECTS]		= lvl_cmd_macro_objects;
LevelScriptJumpTable[LCMD_OBJECT_WITH_ACTS]		= lvl_cmd_object_with_acts;
LevelScriptJumpTable[LCMD_RETURN]				= lvl_cmd_return;	
LevelScriptJumpTable[LCMD_ROOMS]				= lvl_cmd_set_rooms;	
LevelScriptJumpTable[LCMD_TERRAIN_TYPE]			= lvl_cmd_terrain_type;	

boot("level_commands_scripts_macros_init");
}
