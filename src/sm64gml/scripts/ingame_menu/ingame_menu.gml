function ingame_menu_macros_init() {
#macro HUD_CHAR_A_UMLAUT		0x3A
#macro HUD_CHAR_O_UMLAUT		0x3B
#macro HUD_CHAR_U_UMLAUT		0x3C
								
#macro GLOBAL_CHAR_SPACE		0x9E
#macro GLOBAR_CHAR_TERMINATOR	0xFF

#macro DIALOG_CHAR_SLASH				0xD0
#macro DIALOG_CHAR_MULTI_THE			0xD1
#macro DIALOG_CHAR_MULTI_YOU			0xD2
#macro DIALOG_CHAR_PERIOD				0x6E
#macro DIALOG_CHAR_COMMA				0x6F
#macro DIALOG_CHAR_SPACE				0x9E
#macro DIALOG_CHAR_STAR_COUNT			0xE0
#macro DIALOG_CHAR_UMLAUT				0xE9
#macro DIALOG_CHAR_DAKUTEN				0xF0
#macro DIALOG_CHAR_PERIOD_OR_HANDAKUTEN 0xF1
#macro DIALOG_CHAR_STAR_FILLED			0xFA
#macro DIALOG_CHAR_STAR_OPEN			0xFD
#macro DIALOG_CHAR_NEWLINE				0xFE
#macro DIALOG_CHAR_TERMINATOR			0xFF
	
#macro MENU_MTX_PUSH   1
#macro MENU_MTX_NOPUSH 2
  
#macro MENU_SCROLL_VERTICAL   1
#macro MENU_SCROLL_HORIZONTAL 2

// Japanese File Select uses an unique table
// to print specific Japanese HUD chars
#macro HUD_LUT_JPMENU 1
#macro HUD_LUT_GLOBAL 2

// For file select JP HUD difference
#macro HUD_LUT_DIFF HUD_LUT_GLOBAL

#macro DIALOG_STATE_OPENING			0
#macro DIALOG_STATE_VERTICAL		1
#macro DIALOG_STATE_HORIZONTAL		2
#macro DIALOG_STATE_CLOSING			3
							
#macro DIALOG_PAGE_STATE_NONE		0
#macro DIALOG_PAGE_STATE_SCROLL		1
#macro DIALOG_PAGE_STATE_END		2
								
#macro DIALOG_TYPE_ROTATE			0
#macro DIALOG_TYPE_ZOOM				1
									
#macro RENDER_PAUSE_SCREEN			1
#macro RENDER_COURSE_DONE_SCREEN	2

globalvar gRedCoinsCollected;
gRedCoinsCollected		= 0;

globalvar gDialogID;
gDialogID				= -1;

globalvar gDialogResponse;
gDialogResponse		= null;

globalvar gHudFlash;
gHudFlash				= 0;

globalvar gMenuMode;
gMenuMode				= -1;

globalvar gDialogColorFadeTimer;
gDialogColorFadeTimer	= 0;

globalvar gLastDialogLineNum,
gDialogVariable,
gDialogTextAlpha,
gCutsceneMsgXOffset,
gCutsceneMsgYOffset;

gLastDialogLineNum		= 0;
gDialogVariable			= 0;
gDialogTextAlpha		= 0;
gCutsceneMsgXOffset		= 0;
gCutsceneMsgYOffset		= 0;

globalvar gLastCompletedCourseNum, gLastCompletedStarNum;
gLastCompletedCourseNum		= 0;
gLastCompletedStarNum		= 0;

#macro DEFAULT_DIALOG_BOX_ANGLE 90.0
#macro DEFAULT_DIALOG_BOX_SCALE 19.0


globalvar gDialogBoxState,
gDialogBoxOpenTimer,
gDialogBoxScale,
gDialogScrollOffsetY,
gDialogBoxType,
gLastDialogPageStrPos,
gDialogTextPos,
gDialogLineNum,
gLastDialogResponse,
gMenuHoldKeyIndex;

gDialogBoxState		= DIALOG_STATE_OPENING;
gDialogBoxOpenTimer	= DEFAULT_DIALOG_BOX_ANGLE;
gDialogBoxScale		= DEFAULT_DIALOG_BOX_SCALE;
gDialogScrollOffsetY	= 0;
gDialogBoxType			= DIALOG_TYPE_ROTATE;
gLastDialogPageStrPos	= 0;
gDialogTextPos			= 0;
gDialogLineNum			= 1;
gLastDialogResponse		= 0;
gMenuHoldKeyIndex		= 0;
gDialogResponse			= 0;

globalvar gCutsceneMsgFade,
gCutsceneMsgIndex,
gCutsceneMsgDuration,
gCutsceneMsgTimer,
gDialogCameraAngleIndex,
gDialogCourseActNum;

gCutsceneMsgFade			= 0;
gCutsceneMsgIndex			= -1;
gCutsceneMsgDuration		= -1;
gCutsceneMsgTimer			= 0;
gDialogCameraAngleIndex		= CAM_SELECTION_MARIO;
gDialogCourseActNum			= 1;

#macro DIAG_VAL1 16
#macro DIAG_VAL3 132
#macro DIAG_VAL4 5
#macro DIAG_VAL2 240 

globalvar SCREEN_SHADED;
SCREEN_SHADED = false;

boot("ingame_menu_macros_init");
}

function ASCII_TO_DIALOG(_asc) {
	
	var asc = ord(_asc);
	
	if ((asc) >= ord("0") && (asc) <= ord("9")) {
		return ((asc) - ord("0"));
	}
	
	if ((asc) >= ord("A") && (asc) <= ord("Z")) {
		return ((asc) - ord("A") + 0x0A);
	}
	
	if ((asc) >= ord("a") && (asc) <= ord("z")) {
		return ((asc) - ord("a") + 0x24);
	}
	
	return 0x00;
}

function get_dialog_id() {
	return gDialogID;	
}

/// <pygml?v=1.0&h=1ace35f0f>
/// @function	reset_red_coins_collected()
function reset_red_coins_collected() {
    gRedCoinsCollected = 0;
}

/// <pygml?v=1.0&h=6d0ec7e69>
/// @function	change_dialog_camera_angle()
function change_dialog_camera_angle() {
    if (cam_select_alt_mode(0) == CAM_SELECTION_MARIO) {
        gDialogCameraAngleIndex = CAM_SELECTION_MARIO;
    } else {
        gDialogCameraAngleIndex = CAM_SELECTION_FIXED;
    }
}


/// <pygml?v=1.0&h=69ad7045f>
/// @function	print_animated_red_coin(x, y)
/// @param		{s16}		x
/// @param		{s16}		y
function print_animated_red_coin(_x, _y) {
    var timer = gGlobalTimer;

    create_dl_translation_matrix(MENU_MTX_PUSH, _x, _y, 0);
    create_dl_scale_matrix(MENU_MTX_NOPUSH, 0.2, 0.2, 1.0);
    gDPSetRenderMode(gDisplayList, G_RM_TEX_EDGE, G_RM_TEX_EDGE2);

    switch (timer & 6) {
        case (0):
            gSPDisplayList(gDisplayList, coin_seg3_dl_03007940);
            break;
        case (2):
            gSPDisplayList(gDisplayList, coin_seg3_dl_03007968);
            break;
        case (4):
            gSPDisplayList(gDisplayList, coin_seg3_dl_03007990);
            break;
        case (6):
            gSPDisplayList(gDisplayList, coin_seg3_dl_030079B8);
            break;
    }

    gDPSetRenderMode(gDisplayList, G_RM_AA_ZB_OPA_SURF, G_RM_AA_ZB_OPA_SURF2);
    gSPPopMatrix(gDisplayList, G_MTX_MODELVIEW);
}


/// <pygml?v=1.0&h=6d80e47aa>
/// @function	render_pause_red_coins()
function render_pause_red_coins() {
    var _x;

    for (_x = 0; _x < gRedCoinsCollected; _x++) {
        print_animated_red_coin(GFX_DIMENSIONS_FROM_RIGHT_EDGE(30) - _x * 20, 16);
    }
}

/// <pygml?v=1.0&h=b3da58aaa>
/// @function	create_dl_identity_matrix()
function create_dl_identity_matrix() {
    var matrix = Mat4;

    array_copy(matrix, 0, matrix_build_identity(), 0, 16);

    gSPMatrix(gDisplayList, matrix, G_MTX_MODELVIEW | G_MTX_LOAD | G_MTX_NOPUSH);
    gSPMatrix(gDisplayList, matrix, G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH);
}


/// <pygml?v=1.0&h=3b41906e2>
/// @function	create_dl_ortho_matrix()
function create_dl_ortho_matrix() {
    var matrix = Mat4;

    create_dl_identity_matrix();

    guOrtho(matrix, 0.0, SCREEN_WIDTH, 0.0, SCREEN_HEIGHT, -10.0, 10.0, 1.0);

    // Should produce G_RDPHALF_1 in Fast3D
    // gSPPerspNormalize(gDisplayList, 0xFFFF);

    gSPMatrix(gDisplayList, matrix, G_MTX_PROJECTION | G_MTX_MUL | G_MTX_NOPUSH)
}

/// <pygml?v=1.0&h=3ad4d1fd5>
/// @function	set_menu_mode(mode)
/// @param		{s16}		mode
// Calls a gMenuMode value defined by render_menus_and_dialogs cases
function set_menu_mode(mode) {
    if (gMenuMode == -1) {
        gMenuMode = mode;
    }
}

/// <pygml?v=1.0&h=a731db70c>
/// @function	highlight_last_course_complete_stars()
function highlight_last_course_complete_stars() {
    var courseDone;

    if (gLastCompletedCourseNum == COURSE_NONE) {
        courseDone = 0;
    } else {
        courseDone = gLastCompletedCourseNum - 1;

        if (courseDone >= COURSE_STAGES_COUNT) {
            courseDone = COURSE_STAGES_COUNT;
        }
    }

    gDialogLineNum = courseDone;
}


function shade_screen() {
    create_dl_translation_matrix(MENU_MTX_PUSH, GFX_DIMENSIONS_FROM_LEFT_EDGE(0), SCREEN_HEIGHT, 0);

    create_dl_scale_matrix(MENU_MTX_NOPUSH,
                           GFX_DIMENSIONS_ASPECT_RATIO() * SCREEN_HEIGHT / 130.0, 3.0, 1.0);

    gDPSetEnvColor(gDisplayList, 0, 0, 0, 255);
    gSPDisplayList(gDisplayList, dl_draw_text_bg_box);
    gSPPopMatrix(gDisplayList, G_MTX_MODELVIEW);
}

/// <pygml?v=1.0&h=a688a3b7b>
/// @function	print_hud_pause_colorful_str()
function print_hud_pause_colorful_str() {
    var textPause = "PAUSE";

    gSPDisplayList(gDisplayList, dl_rgba16_text_begin);
    gDPSetEnvColor(gDisplayList, 255, 255, 255, gDialogTextAlpha);
    print_hud_lut_string(HUD_LUT_GLOBAL, 123, 81, textPause);
    gSPDisplayList(gDisplayList, dl_rgba16_text_end);
}

/**
 * Prints a hud string depending of the hud table list defined.
 */
function print_hud_lut_string(hudLUT, x, y, _str) {
    var strPos = 0;
    var hudLUT2 = main_hud_lut; // 0-9 A-Z HUD Color Font
    var curX = x;
    var curY = y;

    var xStride; // X separation

    if (hudLUT == HUD_LUT_JPMENU) {
        xStride = 16;
    } else { // HUD_LUT_GLOBAL
        xStride = 12; //? Shindou uses this.
    }
	
	var str = array_create(string_length(_str));
	for(var i = 1; i<= string_length(_str); i++) str[i-1] = ASCII_TO_DIALOG(string_char_at(_str, i));

    while (str[strPos] != GLOBAR_CHAR_TERMINATOR) {

        if (str[strPos] == GLOBAL_CHAR_SPACE) {
            curX += 8;
        } else {
            //gDPPipeSync(gDisplayList);

            if (hudLUT == HUD_LUT_GLOBAL)
                gDPSetTextureImage(gDisplayList, G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, hudLUT2[str[strPos]]);

            gSPDisplayList(gDisplayList, dl_rgba16_load_tex_block);
            gSPTextureRectangle(gDisplayList, curX << 2, curY << 2, (curX + 16) << 2,
                                (curY + 16) << 2, G_TX_RENDERTILE, 0, 0, 1 << 10, 1 << 10);

            curX += xStride;

        }

		strPos++;
		// fail-safe, if at end of array
		if (strPos>=array_length(str)) break;
    }
}

/// <pygml?v=1.0&h=0f46d203b>
/// @function	render_pause_castle_menu_box(x, y)
/// @param		{s16}		x
/// @param		{s16}		y
function render_pause_castle_menu_box(_x, _y) {
    create_dl_translation_matrix(MENU_MTX_PUSH, _x - 78, _y - 32, 0);
    create_dl_scale_matrix(MENU_MTX_NOPUSH, 1.2, 0.8, 1.0);
    gDPSetEnvColor(gDisplayList, 0, 0, 0, 105);
    gSPDisplayList(gDisplayList, dl_draw_text_bg_box);
    gSPPopMatrix(gDisplayList, G_MTX_MODELVIEW);

    create_dl_translation_matrix(MENU_MTX_PUSH, _x + 6, _y - 28, 0);
    create_dl_rotation_matrix(MENU_MTX_NOPUSH, DEFAULT_DIALOG_BOX_ANGLE, 0, 0, 1.0);
    gDPSetEnvColor(gDisplayList, 255, 255, 255, gDialogTextAlpha);
    gSPDisplayList(gDisplayList, dl_draw_triangle);
    gSPPopMatrix(gDisplayList, G_MTX_MODELVIEW);

    create_dl_translation_matrix(MENU_MTX_PUSH, _x - 9, _y - 101, 0);
    create_dl_rotation_matrix(MENU_MTX_NOPUSH, 270.0, 0, 0, 1.0);
    gSPDisplayList(gDisplayList, dl_draw_triangle);
    gSPPopMatrix(gDisplayList, G_MTX_MODELVIEW);
}



/// <pygml?v=1.0&h=40dfd75b7>
/// @function	render_pause_courses_and_castle()
/// @returns	s16
function render_pause_courses_and_castle() {
    var num;

    switch (gDialogBoxState) {
        case (DIALOG_STATE_OPENING):
            gDialogLineNum = 1;
            gDialogTextAlpha = 0;
            level_set_transition(-1, null);
            play_sound(SOUND_MENU_PAUSE_HIGHPRIO, gDefaultSoundArgs);

            if (gCurrCourseNum >= COURSE_MIN && gCurrCourseNum <= COURSE_MAX) {
                change_dialog_camera_angle();
                gDialogBoxState = DIALOG_STATE_VERTICAL;
            } else {
                highlight_last_course_complete_stars();
                gDialogBoxState = DIALOG_STATE_HORIZONTAL;
            }
            break;
        case (DIALOG_STATE_VERTICAL):
            shade_screen();
            render_pause_my_score_coins();
            render_pause_red_coins();

            if (gMarioStates[0].action & ACT_FLAG_PAUSE_EXIT) {
                render_pause_course_options(99, 93, gDialogLineNum, 15);
            }

		if (gPlayer3Controller.buttonPressed & A_BUTTON || gPlayer3Controller.buttonPressed & START_BUTTON) {
                level_set_transition(0, null);
                play_sound(SOUND_MENU_PAUSE_2, gDefaultSoundArgs);
                gDialogBoxState = DIALOG_STATE_OPENING;
                gMenuMode = -1;

                if (gDialogLineNum == 2) {
                    num = gDialogLineNum;
                } else {
                    num = 1;
                }

                return num;
            }
            break;
        case (DIALOG_STATE_HORIZONTAL):
            shade_screen();
            print_hud_pause_colorful_str();
            render_pause_castle_menu_box(160, 143);
            //render_pause_castle_main_strings(104, 60);

			// @z, changed gPlayer3Controller to gPlayer1Controller
            if (gPlayer1Controller.buttonPressed & A_BUTTON || gPlayer1Controller.buttonPressed & START_BUTTON) {
                level_set_transition(0, null);
                play_sound(SOUND_MENU_PAUSE_2, gDefaultSoundArgs);
                gMenuMode = -1;
                gDialogBoxState = DIALOG_STATE_OPENING;

                return 1;
            }
            break;
    }

    if (gDialogTextAlpha < 250) {
        gDialogTextAlpha += 25;
    }

    return 0;
}


/// <pygml?v=1.0&h=ecd73c112>
/// @function	render_menus_and_dialogs()
/// @returns	s16
// Only case 1 and 2 are used
function render_menus_and_dialogs() {
    var mode = 0;

    create_dl_ortho_matrix();

    if (gMenuMode != -1) {
        switch (gMenuMode) {
            case (0):
                mode = render_pause_courses_and_castle();
                break;
            case (1):
                mode = render_pause_courses_and_castle();
                break;
            case (2):
                mode = render_course_complete_screen();
                break;
            case (3):
                mode = render_course_complete_screen();
                break;
        }

        gDialogColorFadeTimer = gDialogColorFadeTimer + 0x1000;
    } else if (gDialogID != -1) {
        // The Peach "Dear Mario" message needs to be repositioned separately
        if (gDialogID == 20) {
            print_peach_letter_message();
            return mode;
        }

        render_dialog_entries();
        gDialogColorFadeTimer = gDialogColorFadeTimer + 0x1000;
    }
    return mode;
}

/// <pygml?v=1.0&h=cb18558ef>
/// @function	create_dl_translation_matrix(pushOp, x, y, z)
/// @param		{s8}		pushOp
/// @param		{f32}		x
/// @param		{f32}		y
/// @param		{f32}		z
function create_dl_translation_matrix(pushOp, _x, _y, _z) {
    var matrix = Mtx;

    guTranslate(matrix, _x, _y, _z);

    if (pushOp == MENU_MTX_PUSH)
        gSPMatrix(gDisplayList, (matrix), G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_PUSH);

    if (pushOp == MENU_MTX_NOPUSH)
        gSPMatrix(gDisplayList, (matrix), G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_NOPUSH);
}

/// <pygml?v=1.0&h=a6dd1b898>
/// @function	create_dl_scale_matrix(pushOp, x, y, z)
/// @param		{s8}		pushOp
/// @param		{f32}		x
/// @param		{f32}		y
/// @param		{f32}		z
function create_dl_scale_matrix(pushOp, _x, _y, _z) {
    var matrix = Mtx;

    guScale(matrix, _x, _y, _z);

    if (pushOp == MENU_MTX_PUSH)
        gSPMatrix(gDisplayList, (matrix), G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_PUSH);

    if (pushOp == MENU_MTX_NOPUSH)
        gSPMatrix(gDisplayList, (matrix), G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_NOPUSH);
}

/// <pygml?v=1.0&h=316ba42d1>
/// @function	create_dl_rotation_matrix(pushOp, a, x, y, z)
/// @param		{s8}		pushOp
/// @param		{f32}		a
/// @param		{f32}		x
/// @param		{f32}		y
/// @param		{f32}		z
function create_dl_rotation_matrix(pushOp, a, _x, _y, _z) {
    var matrix = Mtx;

    guRotate(matrix, a, _x, _y, _z);

    if (pushOp == MENU_MTX_PUSH)
        gSPMatrix(gDisplayList, (matrix), G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_PUSH);

    if (pushOp == MENU_MTX_NOPUSH)
        gSPMatrix(gDisplayList, (matrix), G_MTX_MODELVIEW | G_MTX_MUL | G_MTX_NOPUSH);
}
