function area_scripts_macros_init() {
	
	globalvar USING_DELTA_TIME;
	USING_DELTA_TIME	= false;
	
	#macro BROWSER (os_browser != browser_not_a_browser)
	
	globalvar GAME_FPS;
	GAME_FPS = game_get_speed(gamespeed_fps);
	
	globalvar LAG_FRAMES;
	LAG_FRAMES = 1;
	
	globalvar INTERPOLATED_FPS_ARRAY;
	INTERPOLATED_FPS_ARRAY = array_create(GAME_FPS);
	
	globalvar INTERPOLATED_FPS_POS;
	INTERPOLATED_FPS_POS = 0;
	
	globalvar INTERPOLATED_FPS_AVG;
	INTERPOLATED_FPS_AVG = 0;
	
	globalvar INTERPOLATED_FPS;
	INTERPOLATED_FPS = 0;
	
	#macro WARP_TRANSITION_FADE_FROM_COLOR		(0x00)
	#macro WARP_TRANSITION_FADE_INTO_COLOR		(0x01)
	#macro WARP_TRANSITION_FADE_FROM_STAR		(0x08)
	#macro WARP_TRANSITION_FADE_INTO_STAR		(0x09)
	#macro WARP_TRANSITION_FADE_FROM_CIRCLE		(0x0A)
	#macro WARP_TRANSITION_FADE_INTO_CIRCLE		(0x0B)
	#macro WARP_TRANSITION_FADE_INTO_MARIO		(0x11)
	#macro WARP_TRANSITION_FADE_FROM_BOWSER		(0x12)
	#macro WARP_TRANSITION_FADE_INTO_BOWSER		(0x13)

	globalvar D_8032CF00;
	D_8032CF00		= {
		vscale: [640, 480, 511, 0],
		vtrans: [640, 480, 511, 0],
	}
	
	globalvar gAreas,
	gCurrentArea,
	gCurAreaIndex,
	gCurrLevelNum,
	gSavedCourseNum,
	gLoadedGraphNodes;

	gAreas				= array_create(8, {});
	gCurrentArea		= null;
	gCurAreaIndex		= 0;
	gCurrLevelNum		= 0;
	gSavedCourseNum		= 0;
	gLoadedGraphNodes	= array_create(256);
	
	globalvar gCurrLevelArea;
	gCurrLevelArea		= 0;

	globalvar gWarpTransition;
	gWarpTransition	= new WarpTransition();

	globalvar gMarioSpawnInfo;
	gMarioSpawnInfo = {
		startPos: Vec3,
		startAngle: Vec3,
		areaIndex: 0,
		activeAreaIndex: 0,
		behaviorArg: 0,
		behaviorScript: null,
		unk18: null,
		next: null,
	}
	
	globalvar gOnlineSpawnInfo;
	gOnlineSpawnInfo = {
		startPos:	Vec3,
		startAngle: Vec3,
		areaIndex: 0,
		activeAreaIndex: 0,
		behaviorArg: 0,
		behaviorScript: null,
		unk18: null,
		next: null,
	}
	
	boot("area_scripts_macros_init");
}

function WarpTransitionData() constructor {
	red				= 0;
	green			= 0;
	blue			= 0;

	startTexRadius	= 0;
	endTexRadius	= 0;
	startTexX		= 0;
	startTexY		= 0;
	endTexX			= 0;
	endTexY			= 0;

	texTimer		= 0;
}

function WarpTransition() constructor {
    isActive  		    = 0;
    type			    = 0;
    time			    = 0;
    pauseRendering	    = 0;
    data				= null;
}

function load_area(index) {
		
    if (gAreas[index]==null) return;
		
    gCurrentArea = gAreas[index];
    gCurAreaIndex = gCurrentArea.index;
	if (gCurrentArea.terrainData==null) return;
		
	//log(index, gCurrentArea.macroObjects);
    load_area_terrain(index, gCurrentArea.terrainData, null, gCurrentArea.macroObjects);

}

function load_mario_area() {
		
    load_area(gMarioSpawnInfo.areaIndex);
		
    gCurrentArea.flags |= 0x01;
    spawn_objects_from_info(gMarioSpawnInfo);
}

function area_update_objects() {
    GeoRenderer.gAreaUpdateCounter++;
	
	update_objects(0);
}

function play_transition() {
}

function clear_areas() {
		
    gCurrentArea = null;
    gWarpTransition.isActive = false;
    gWarpTransition.pauseRendering = false;
    gMarioSpawnInfo.areaIndex = -1;

	for(var i = 0; i < array_length(gAreas); i++) {
		var area = gAreas[i];
			
		with(area) {
	        index = i;
	        flags = 0;
	        terrainType = 0;
	        geometryLayoutData = null;
	        terrainData = null;
	        surfaceRooms = null;
	        macroObjects = null;
	        warpNodes = null;
	        paintingWarpNodes = null;
	        instantWarps = null;
	        objectSpawnInfos = null;
	        camera = null;
	        unused28  =null;
	        whirlpools = [ null, null ];
	        dialog = [null, null];
	        musicParam = 0;
	        musicParam2 = 0;	
		}
	}

}

function string_format_xyz(val) {
	
	var str = string(floor(val));
	
	str = string_replace_all(str, "-", "M");
	
	return str;
}

function render_game() {
	
    if (gCurrentArea==null) return;
	
	GeoRenderer.geo_process_root(gCurrentArea.geometryLayoutData, null, null, null); // @cv
	
	render_hud();
	
	if (keyboard_check(ord("Q"))) {
		var rl = floor(fps_real);
		print_text(GFX_DIMENSIONS_FROM_LEFT_EDGE(8), 20+64, "OPS " + string(floor(opCount)));
		print_text(GFX_DIMENSIONS_FROM_LEFT_EDGE(8), 20+48, "FPS " + string(rl));
		print_text(GFX_DIMENSIONS_FROM_LEFT_EDGE(8), 20+32, "POS " + string_format_xyz(gMarioState.pos[0]));
		print_text(GFX_DIMENSIONS_FROM_LEFT_EDGE(8), 20+16, "    " + string_format_xyz(gMarioState.pos[1]));
		print_text(GFX_DIMENSIONS_FROM_LEFT_EDGE(8), 20,	"    " + string_format_xyz(gMarioState.pos[2]));
	}
	render_text_labels();
	
	SCREEN_SHADED = false;
	gPauseScreenMode = render_menus_and_dialogs();
}
	
