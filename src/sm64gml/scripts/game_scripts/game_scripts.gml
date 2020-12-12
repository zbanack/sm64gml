function game_scripts_macros_init() {
	
	globalvar sCurrFBNum, frameBufferIndex;
	sCurrFBNum			= 0;
	frameBufferIndex	= 0;

	#macro MOUSE_X				device_mouse_x_to_gui(0)
	#macro MOUSE_Y				device_mouse_y_to_gui(0)

	globalvar gDisplayLists;
	gDisplayLists = ds_list_create();

	globalvar gDisplayList;
	gDisplayList = new DisplayList(true); // once
	
	boot("game_scripts_macros_init");
}

/// @function	remap(val, min1, max1, min2, max2)
function remap(val, min1, max1, min2, max2) {
	return min2 + (max2 - min2) * ((val - min1) / (max1 - min1));
}

/// @function	remap_clamp(val, min1, max1, min2, max2)
function remap_clamp(val, min1, max1, min2, max2) {
	return remap(clamp(val, min1, max1), min1, max1, min2, max2);
}

/// @function	remap_range_floor(val, min1, max1, min2, max2)
function remap_range_floor(val, min1, max1, min2, max2) {
	return floor(remap_clamp(val, min1, max1, min2, max2));
}


function DisplayList() constructor {
	
	permanent = argument_count > 0 ? argument[0] : false;
	
	if (!permanent) {
		var _self = self;
		ds_list_add(gDisplayLists, _self);	
	}

	dl_arr = array_create(BASE_ARRAY_SIZE, 0);
	dl_size = 0;
	
	static push = function() {
		for(var i = 0; i < argument_count; i++) {
			dl_arr[dl_size++] = argument[i];
		}
	}
	
	static clear = function() {
		dl_size = 0;	
	}
	
	static get_size = function() {
		return dl_size;	
	}
}

function DisplayListResetHeaders() {
	for(var i = 0; i < ds_list_size(gDisplayLists); i++) {
		gDisplayLists[| i].clear();
	}	
}

function update_lag_frames() {
	
	LAG_FRAMES = 1;
	
	if (USING_DELTA_TIME) {
		LAG_FRAMES = max(1, round(delta_time/(1000000/GAME_FPS)));	
	}
	
	INTERPOLATED_FPS = (LAG_FRAMES * fps_real);
	INTERPOLATED_FPS_ARRAY[INTERPOLATED_FPS_POS] = INTERPOLATED_FPS;
	INTERPOLATED_FPS_POS++;

	if (INTERPOLATED_FPS_POS>=GAME_FPS) {
		INTERPOLATED_FPS_POS -= GAME_FPS;
	
		INTERPOLATED_FPS_AVG = 0;
		for(var i = 0; i < GAME_FPS; i++) {
			INTERPOLATED_FPS_AVG += INTERPOLATED_FPS_ARRAY[i];
		}
	
		INTERPOLATED_FPS_AVG /= GAME_FPS;
	
		INTERPOLATED_FPS_AVG = floor(INTERPOLATED_FPS_AVG);
	}
	
}

function frame_interpolation_render(_bool) {
	
	
	if (_bool) {
		
		gpu_set_texfilter(true);
	
		if (previous_frame_can_render) {
			if (surface_exists(previous_frame)) {
				var interval = 1;
				for(var i = 0; i < SCREEN_HEIGHT; i+=interval*2) {
					draw_surface_part_ext(previous_frame, 0, i, SCREEN_WIDTH, interval,
						0, SCREEN_HEIGHT-i, 1, -1, c_white, 1);
				}
			}
		}
	
		gpu_set_texfilter(false);
		
	}

	previous_frame_can_render = false;
	if (previous_frame_texel!=-1) {
		surface_free(previous_frame);
	}
	previous_frame_texel = -1;
	if (!surface_exists(previous_frame)) {
		previous_frame = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);
	}
	if (surface_exists(previous_frame)) {
	
		if (surface_exists(application_surface)) {
			surface_set_target(previous_frame);
			draw_clear_alpha(c_black, 0);
			draw_surface(application_surface, 0, 0);	
			surface_reset_target();
			previous_frame_can_render = true;
			previous_frame_texel = surface_get_texture(previous_frame);
		}
	}
}

function display_and_vsync() {
	
    if (++sCurrFBNum == 3) {
        sCurrFBNum = 0;
    }
    if (++frameBufferIndex == 3) {
        frameBufferIndex = 0;
    }	
	gGlobalTimer++;
	
	run();
	
}

function handle_debug_commands() {
	if (gCurrentArea!=null) {
	
		// moon jump with shift
		if (keyboard_check_pressed(vk_shift)) {
			gMarioState.pos[1] += 750;
			set_forward_vel(gMarioState, 25);
		}
		
		// send mario back to spawn position
		else if (keyboard_check_pressed(ord("R"))) {
			gMarioState.pos[0] = gMarioSpawnInfo.startPos[0];
			gMarioState.pos[1] = gMarioSpawnInfo.startPos[1];
			gMarioState.pos[2] = gMarioSpawnInfo.startPos[2];	
			set_forward_vel(gMarioState, 0);
		}
		
		// toggle delta times
		else if (keyboard_check_pressed(ord("P"))) {
			USING_DELTA_TIME = !USING_DELTA_TIME;	
		}
	}	
}

function thread5_game_loop() {
	
	if (!INITIALIZED) {
		sm64_booting();
		return;
	}
	
	window_handle_centering();
	update_lag_frames();
		
	DisplayListResetHeaders();
	
	inputs_update();
    gDisplayList.clear();

    level_script_execute();
	

	display_and_vsync();
	TIMER_STOP(0);
	
	handle_debug_commands();

}

function main_loop_init() {
	INITIALIZED = true;
	start_new_script(Object1.level_script_entry);
}
	
function end_master_display_list() {
    gSPEndDisplayList(gDisplayList);
}	
	
function rsp_init() {
    gSPClearGeometryMode(gDisplayList, G_SHADE | G_SHADING_SMOOTH | G_CULL_BOTH | G_FOG | G_LIGHTING | G_TEXTURE_GEN | G_TEXTURE_GEN_LINEAR | G_LOD);
    gSPSetGeometryMode(gDisplayList, G_SHADE | G_SHADING_SMOOTH | G_CULL_BACK | G_LIGHTING);
    gSPNumLights(gDisplayList, 1);
    gSPTexture(gDisplayList, 0, 0, 0, G_TX_RENDERTILE, G_OFF);
}
	
function rdp_init() {
    gDPSetCombineMode(gDisplayList, G_CC_SHADE);
    gDPSetTextureFilter(gDisplayList, G_TF_BILERP);
    gDPSetRenderMode(gDisplayList, G_RM_OPA_SURF_SURF2);
    gDPSetCycleType(gDisplayList, G_CYC_FILL);
}