function hud_c_macros_init() {
	#macro POWER_METER_HIDDEN			 0
	#macro POWER_METER_EMPHASIZED		 1
	#macro POWER_METER_DEEMPHASIZING	 2
	#macro POWER_METER_HIDING			 3
	#macro POWER_METER_VISIBLE			 4

	#macro GLYPH_CAM_CAMERA				 0
	#macro GLYPH_CAM_MARIO_HEAD			 1
	#macro GLYPH_CAM_LAKITU_HEAD		 2
	#macro GLYPH_CAM_FIXED				 3
	#macro GLYPH_CAM_ARROW_UP			 4
	#macro GLYPH_CAM_ARROW_DOWN			 5

	globalvar sPowerMeterStoredHealth;
	sPowerMeterStoredHealth	= 0;

	globalvar sPowerMeterHUD;
	sPowerMeterHUD				= new PowerMeterHUD(POWER_METER_HIDDEN, 140, 166, 1.0);

	globalvar sPowerMeterVisibleTimer;
	sPowerMeterVisibleTimer	= 0;

	globalvar sCameraHUD;
	sCameraHUD					= new CameraHUD(CAM_STATUS_NONE);

	#macro HUD_TOP_Y	209
	#macro HUD_STARS_X	78	
	
	boot("hud_c_macros_init");
}

function PowerMeterHUD(_animation, _x, _y, _unused) constructor {
	animation = _animation;
	x = _x;
	y = _y;
	unused = _unused;
}

function CameraHUD(_status) constructor {
	status = _status;	
}

/// <pygml?v=1.0&h=4fa5e9d7d>
/// @function	render_hud_tex_lut(x, y, Ptr.p_texture)
/// @desc		Renders a rgba16 16x16 glyph texture from a table list.
/// @param		{s32}		x
/// @param		{s32}		y
/// @param		{u8}		Ptr.p_texture
function render_hud_tex_lut(_x, _y, texture) {
    //gDPPipeSync(gDisplayList);
    gDPSetTextureImage(gDisplayList, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture);
    gSPDisplayList(gDisplayList, dl_hud_img_load_tex_block);
    gSPTextureRectangle(gDisplayList, _x << 2, _y << 2, (_x + 15) << 2, (_y + 15) << 2,
        G_TX_RENDERTILE, 0, 0, 4 << 10, 1 << 10);
}

/// <pygml?v=1.0&h=06835f85d>
/// @function	render_hud_small_tex_lut(x, y, Ptr.p_texture)
/// @desc		Renders a rgba16 8x8 glyph texture from a table list.
/// @param		{s32}		x
/// @param		{s32}		y
/// @param		{u8}		Ptr.p_texture
function render_hud_small_tex_lut(_x, _y, texture) {
    gDPSetTile(gDisplayList, G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0,
        G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD);
   // gDPTileSync(gDisplayList);
    gDPSetTile(gDisplayList, G_IM_FMT_RGBA, G_IM_SIZ_16b, 2, 0, G_TX_RENDERTILE, 0,
        G_TX_CLAMP, 3, G_TX_NOLOD, G_TX_CLAMP, 3, G_TX_NOLOD);
    gDPSetTileSize(gDisplayList, G_TX_RENDERTILE, 0, 0, (8 - 1) << G_TEXTURE_IMAGE_FRAC, (8 - 1) << G_TEXTURE_IMAGE_FRAC);
    //gDPPipeSync(gDisplayList);
    gDPSetTextureImage(gDisplayList, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, texture);
    //gDPLoadSync(gDisplayList);
    gDPLoadBlock(gDisplayList, G_TX_LOADTILE, 0, 0, 8 * 8 - 1);//, CALC_DXT(8, G_IM_SIZ_16b_BYTES));
    gSPTextureRectangle(gDisplayList, _x << 2, _y << 2, (_x + 7) << 2, (_y + 7) << 2, G_TX_RENDERTILE,
        0, 0, 4 << 10, 1 << 10);
}

/// <pygml?v=1.0&h=c1282504e>
/// @function	handle_power_meter_actions(numHealthWedges)
/// @desc		Handles power meter actions depending of the health segments
///					values.
/// @param		{s16}		numHealthWedges
function handle_power_meter_actions(numHealthWedges) {
    // Show power meter if _health is not full, less than 8
    if (numHealthWedges < 8 && sPowerMeterStoredHealth == 8 && sPowerMeterHUD.animation == POWER_METER_HIDDEN) {
        sPowerMeterHUD.animation = POWER_METER_EMPHASIZED;
        sPowerMeterHUD.y = 166;
    }

    // Show power meter if _health is full, has 8
    if (numHealthWedges == 8 && sPowerMeterStoredHealth == 7) {
        sPowerMeterVisibleTimer = 0;
    }

    // After _health is full, hide power meter
    if (numHealthWedges == 8 && sPowerMeterVisibleTimer > 45.0) {
        sPowerMeterHUD.animation = POWER_METER_HIDING;
    }

    // Update to match _health value
    sPowerMeterStoredHealth = numHealthWedges;

    // If Mario is swimming, keep power meter visible
    if (gPlayerCameraState[0].action & ACT_FLAG_SWIMMING) {
        if (sPowerMeterHUD.animation == POWER_METER_HIDDEN ||
            sPowerMeterHUD.animation == POWER_METER_EMPHASIZED) {
            sPowerMeterHUD.animation = POWER_METER_DEEMPHASIZING;
            sPowerMeterHUD.y = 166;
        }
        sPowerMeterVisibleTimer = 0;
    }
}

/// <pygml?v=1.0&h=097bbdef7>
/// @function	animate_power_meter_emphasized()
/// @desc		Power meter animation called when there's less than 8 health
///					segments  Checks its timer to later change into
///					deemphasizing mode.
function animate_power_meter_emphasized() {
    var hudDisplayFlags;
    hudDisplayFlags = gHudDisplay.flags;

    if (!(hudDisplayFlags & HUD_DISPLAY_FLAG_EMPHASIZE_POWER)) {
        if (sPowerMeterVisibleTimer == 45.0) {
            sPowerMeterHUD.animation = POWER_METER_DEEMPHASIZING;
        }
    } else {
        sPowerMeterVisibleTimer = 0;
    }
}

/// <pygml?v=1.0&h=8eacc4c21>
/// @function	animate_power_meter_deemphasizing()
/// @desc		Power meter animation called after emphasized mode.  Moves
///					power meter y pos speed until it's at 200 to be visible.
function animate_power_meter_deemphasizing() {
    var _speed = 5;

    if (sPowerMeterHUD.y >= 181) {
        _speed = 3;
    }

    if (sPowerMeterHUD.y >= 191) {
        _speed = 2;
    }

    if (sPowerMeterHUD.y >= 196) {
        _speed = 1;
    }

    sPowerMeterHUD.y += _speed;

    if (sPowerMeterHUD.y >= 201) {
        sPowerMeterHUD.y = 200;
        sPowerMeterHUD.animation = POWER_METER_VISIBLE;
    }
}

/// <pygml?v=1.0&h=04af6feae>
/// @function	animate_power_meter_hiding()
/// @desc		Power meter animation called when there's 8 health segments.
///					Moves power meter y pos quickly until it's at 301 to be
///					hidden.
function animate_power_meter_hiding() {
    sPowerMeterHUD.y += 20;
    if (sPowerMeterHUD.y >= 301) {
        sPowerMeterHUD.animation = POWER_METER_HIDDEN;
        sPowerMeterVisibleTimer = 0;
    }
}

/// <pygml?v=1.0&h=785f120c3>
/// @function	render_power_meter_health_segment(numHealthWedges)
/// @desc		Renders power meter health segment texture using a table
///					list.
/// @param		{s16}		numHealthWedges
function render_power_meter_health_segment(numHealthWedges) {

    var healthLUT = (Object1.power_meter_health_segments_lut);

    //gDPPipeSync(gDisplayList);
    gDPSetTextureImage(gDisplayList, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, healthLUT[numHealthWedges - 1]);
    //gDPLoadSync(gDisplayList);
    gDPLoadBlock(gDisplayList, G_TX_LOADTILE, 0, 0, 32 * 32 - 1);//, CALC_DXT(32, G_IM_SIZ_16b_BYTES));
    gSP1Triangle(gDisplayList, 0, 1, 2, TRI_MODE_ORTHO_1_1);
    gSP1Triangle(gDisplayList, 0, 2, 3, TRI_MODE_ORTHO_1_1);
}


/// <pygml?v=1.0&h=2e2411c83>
/// @function	render_dl_power_meter(numHealthWedges)
/// @desc		Renders power meter display lists.  That includes the
///					"POWER" base and the colored health segment textures.
/// @param		{s16}		numHealthWedges
function render_dl_power_meter(numHealthWedges) {
    var mtx = Mat4;

	guTranslate(mtx, sPowerMeterHUD.x, sPowerMeterHUD.y, 10); // @z 10 = good (I think b/c of guOrtho -10->10 dist
    gSPMatrix(gDisplayList, mtx, G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_PUSH);
    gSPDisplayList(gDisplayList, Object1.dl_power_meter_base);

    if (numHealthWedges != 0) {
        gSPDisplayList(gDisplayList, Object1.dl_power_meter_health_segments_begin);
        render_power_meter_health_segment(numHealthWedges);
        gSPDisplayList(gDisplayList, Object1.dl_power_meter_health_segments_end);
    }

    gSPPopMatrix(gDisplayList, G_MTX_MODELVIEW);
}


/// <pygml?v=1.0&h=cbe611940>
/// @function	render_hud_power_meter()
/// @desc		Renders the power meter that shows when Mario is in
///					underwater  or has taken damage and has less than 8 health
///					segments.  And calls a power meter animation function
///					depending of the value defined.
function render_hud_power_meter() {
    var shownHealthWedges = gHudDisplay.wedges;

    if (sPowerMeterHUD.animation != POWER_METER_HIDING) {
        handle_power_meter_actions(shownHealthWedges);
    }

    if (sPowerMeterHUD.animation == POWER_METER_HIDDEN) {
        return;
    }

	for(var i = 0; i < LAG_FRAMES; i++) {
	    switch (sPowerMeterHUD.animation) {
	        case (POWER_METER_EMPHASIZED):
	            animate_power_meter_emphasized();
	            break;
	        case (POWER_METER_DEEMPHASIZING):
	            animate_power_meter_deemphasizing();
	            break;
	        case (POWER_METER_HIDING):
	            animate_power_meter_hiding();
	            break;
	        default:
	            break;
	    }
	}
	
    render_dl_power_meter(shownHealthWedges);

    sPowerMeterVisibleTimer += 1;
}


/// <pygml?v=1.0&h=63a04bb16>
/// @function	render_hud_mario_lives()
/// @desc		Renders the amount of lives Mario has.
function render_hud_mario_lives() {
    print_text(GFX_DIMENSIONS_RECT_FROM_LEFT_EDGE(22), HUD_TOP_Y, ","); // 'Mario Head' glyph
    print_text(GFX_DIMENSIONS_RECT_FROM_LEFT_EDGE(38), HUD_TOP_Y, "*"); // 'X' glyph
    print_text_fmt_int(GFX_DIMENSIONS_RECT_FROM_LEFT_EDGE(54), HUD_TOP_Y, "%d", gHudDisplay._lives);
}

/// <pygml?v=1.0&h=125facc51>
/// @function	render_hud_coins()
/// @desc		Renders the amount of coins collected.
function render_hud_coins() {
    print_text(168, HUD_TOP_Y, "+"); // 'Coin' glyph
    print_text(184, HUD_TOP_Y, "*"); // 'X' glyph
    print_text_fmt_int(198, HUD_TOP_Y, "%d", gHudDisplay.coins);
}

/// <pygml?v=1.0&h=e283d25d7>
/// @function	render_hud_stars()
/// @desc		Renders the amount of stars collected.  Disables "X" glyph
///					when Mario has 100 stars or more.
function render_hud_stars() {
    var showX = 0;

    if (gHudFlash == 1 && gGlobalTimer & 0x08) {
        return;
    }

    if (gHudDisplay.stars < 100) {
        showX = 1;
    }

    print_text(GFX_DIMENSIONS_RECT_FROM_RIGHT_EDGE(HUD_STARS_X), HUD_TOP_Y, "-"); // 'Star' glyph
    if (showX == 1) {
        print_text(GFX_DIMENSIONS_RECT_FROM_RIGHT_EDGE(HUD_STARS_X) + 16, HUD_TOP_Y, "*"); // 'X' glyph
    }
    print_text_fmt_int((showX * 14) + GFX_DIMENSIONS_RECT_FROM_RIGHT_EDGE(HUD_STARS_X - 16),
        HUD_TOP_Y, "%d", gHudDisplay.stars);
}

/// <pygml?v=1.0&h=5d9a42d7a>
/// @function	set_hud_camera_status(status)
/// @desc		Sets HUD status camera value depending of the actions
///					defined in update_camera_status.
/// @param		{s16}		status
function set_hud_camera_status(status) {
    sCameraHUD.status = status;
}

/// <pygml?v=1.0&h=3e5edd27e>
/// @function	render_hud_camera_status()
/// @desc		Renders camera HUD glyphs using a table list, depending of
///					the camera status called, a defined glyph is rendered.
function render_hud_camera_status() {
    var _x;
    var _y;

    var cameraLUT = (main_hud_camera_lut);
    _x = GFX_DIMENSIONS_RECT_FROM_RIGHT_EDGE(54);
    _y = 205;

    if (sCameraHUD.status == CAM_STATUS_NONE) {
        return;
    }

    gSPDisplayList(gDisplayList, dl_hud_img_begin);
    render_hud_tex_lut(_x, _y, cameraLUT[GLYPH_CAM_CAMERA]);

    switch (sCameraHUD.status & CAM_STATUS_MODE_GROUP) {
        case (CAM_STATUS_MARIO):
            render_hud_tex_lut(_x + 16, _y, cameraLUT[GLYPH_CAM_MARIO_HEAD]);
            break;
        case (CAM_STATUS_LAKITU):
            render_hud_tex_lut(_x + 16, _y, cameraLUT[GLYPH_CAM_LAKITU_HEAD]);
            break;
        case (CAM_STATUS_FIXED):
            render_hud_tex_lut(_x + 16, _y, cameraLUT[GLYPH_CAM_FIXED]);
            break;
    }

    switch (sCameraHUD.status & CAM_STATUS_C_MODE_GROUP) {
        case (CAM_STATUS_C_DOWN):
            render_hud_small_tex_lut(_x + 4, _y + 16, cameraLUT[GLYPH_CAM_ARROW_DOWN]);
            break;
        case (CAM_STATUS_C_UP):
            render_hud_small_tex_lut(_x + 4, _y - 8, cameraLUT[GLYPH_CAM_ARROW_UP]);
            break;
    }

    gSPDisplayList(gDisplayList, dl_hud_img_end);
}



/**
 * Render HUD strings using hudDisplayFlags with it's render functions,
 * excluding the cannon reticle which detects a camera preset for it.
 */
function render_hud() {
	
    var hudDisplayFlags;

    hudDisplayFlags = gHudDisplay.flags;

    if (hudDisplayFlags == HUD_DISPLAY_NONE) {
        sPowerMeterHUD.animation = POWER_METER_HIDDEN;
        sPowerMeterStoredHealth = 8;
        sPowerMeterVisibleTimer = 0;
    } else {

        create_dl_ortho_matrix();
		render_hud_mario_lives();
		render_hud_stars();
		render_hud_coins();
		render_hud_power_meter();
		render_hud_camera_status();
        //if (gCurrentArea != null && gCurrentArea.camera.mode == CAMERA_MODE_INSIDE_CANNON) {
        //    render_hud_cannon_reticle();
        //}
		//
        //if (hudDisplayFlags & HUD_DISPLAY_FLAG_LIVES) {
        //    render_hud_mario_lives();
        //}
		//
        //if (hudDisplayFlags & HUD_DISPLAY_FLAG_COIN_COUNT) {
        //    render_hud_coins();
        //}
		//
        //if (hudDisplayFlags & HUD_DISPLAY_FLAG_STAR_COUNT) {
        //    render_hud_stars();
        //}
		//
        //if (hudDisplayFlags & HUD_DISPLAY_FLAG_KEYS) {
        //    render_hud_keys();
        //}
		//
        //if (hudDisplayFlags & HUD_DISPLAY_FLAG_CAMERA_AND_POWER) {
        //    render_hud_power_meter();
        //    render_hud_camera_status();
        //}
		//
        //if (hudDisplayFlags & HUD_DISPLAY_FLAG_TIMER) {
        //    render_hud_timer();
        //}
    }
}