function input_scripts_macros_init() {
#macro CONTROLLER_PORTS		(4)
#macro ANALOG_DEADZONE		(0.125)
#macro ANALOG_MAGNITUDE		(64)

enum ContInputs {
	CON_A,
	CON_B,
	CON_L,
	CON_R,
	CON_Z,
	CON_S,
	CON_JU,
	CON_JL,
	CON_JR,
	CON_JD,
	CON_CU,
	CON_CL,
	CON_CR,
	CON_CD,
	count
}

globalvar INPUT_KB_LUT, INPUT_GP_LUT, INPUT_BIT_LUT;
INPUT_KB_LUT	= array_create(CONTROLLER_PORTS);
INPUT_GP_LUT	= array_create(CONTROLLER_PORTS);
INPUT_BIT_LUT	= array_create(ContInputs.count);
for(var i = 0; i < CONTROLLER_PORTS; i++) {
	for(var j = 0; j < ContInputs.count; j++) {
		INPUT_KB_LUT[i][j] = null;
		INPUT_GP_LUT[i][j] = null;
	}
}

INPUT_BIT_LUT[ContInputs.CON_A]	 = (0x8000);
INPUT_BIT_LUT[ContInputs.CON_B]	 = (0x4000);
INPUT_BIT_LUT[ContInputs.CON_L]	 = (0x0020);
INPUT_BIT_LUT[ContInputs.CON_R]	 = (0x0010);
INPUT_BIT_LUT[ContInputs.CON_Z]	 = (0x2000);
INPUT_BIT_LUT[ContInputs.CON_S]	 = (0x1000);
INPUT_BIT_LUT[ContInputs.CON_JU] = (0x0800);
INPUT_BIT_LUT[ContInputs.CON_JL] = (0x0200);
INPUT_BIT_LUT[ContInputs.CON_JR] = (0x0100);
INPUT_BIT_LUT[ContInputs.CON_JD] = (0x0400);
INPUT_BIT_LUT[ContInputs.CON_CU] = (0x0008);
INPUT_BIT_LUT[ContInputs.CON_CL] = (0x0002);
INPUT_BIT_LUT[ContInputs.CON_CR] = (0x0001);
INPUT_BIT_LUT[ContInputs.CON_CD] = (0x0004);

#macro A_BUTTON		(INPUT_BIT_LUT[ContInputs.CON_A])
#macro B_BUTTON		(INPUT_BIT_LUT[ContInputs.CON_B])
#macro L_TRIG		(INPUT_BIT_LUT[ContInputs.CON_L])
#macro R_TRIG		(INPUT_BIT_LUT[ContInputs.CON_R])
#macro Z_TRIG		(INPUT_BIT_LUT[ContInputs.CON_Z])
#macro START_BUTTON	(INPUT_BIT_LUT[ContInputs.CON_S])
#macro U_JPAD		(INPUT_BIT_LUT[ContInputs.CON_JU])
#macro L_JPAD		(INPUT_BIT_LUT[ContInputs.CON_JL])
#macro R_JPAD		(INPUT_BIT_LUT[ContInputs.CON_JR])
#macro D_JPAD		(INPUT_BIT_LUT[ContInputs.CON_JD])
#macro U_CBUTTONS	(INPUT_BIT_LUT[ContInputs.CON_CU])
#macro L_CBUTTONS	(INPUT_BIT_LUT[ContInputs.CON_CL])
#macro R_CBUTTONS	(INPUT_BIT_LUT[ContInputs.CON_CR])
#macro D_CBUTTONS	(INPUT_BIT_LUT[ContInputs.CON_CD])

// player 1 kb input
INPUT_KB_LUT[0][ContInputs.CON_A]		= vk_space;
INPUT_KB_LUT[0][ContInputs.CON_B]		= ord("X");
INPUT_KB_LUT[0][ContInputs.CON_L]		= ord("1");
INPUT_KB_LUT[0][ContInputs.CON_R]		= ord("0");
INPUT_KB_LUT[0][ContInputs.CON_Z]		= ord("Z");
INPUT_KB_LUT[0][ContInputs.CON_S]		= vk_enter;
INPUT_KB_LUT[0][ContInputs.CON_JU]		= ord("W");
INPUT_KB_LUT[0][ContInputs.CON_JL]		= ord("A");
INPUT_KB_LUT[0][ContInputs.CON_JR]		= ord("D");
INPUT_KB_LUT[0][ContInputs.CON_JD]		= ord("S");
INPUT_KB_LUT[0][ContInputs.CON_CU]		= vk_up;
INPUT_KB_LUT[0][ContInputs.CON_CL]		= vk_left;
INPUT_KB_LUT[0][ContInputs.CON_CR]		= vk_right;
INPUT_KB_LUT[0][ContInputs.CON_CD]		= vk_down;

// player 1 gamepad input
INPUT_GP_LUT[0][ContInputs.CON_A]		= gp_face1;
INPUT_GP_LUT[0][ContInputs.CON_B]		= gp_face3;
INPUT_GP_LUT[0][ContInputs.CON_L]		= gp_shoulderl;
INPUT_GP_LUT[0][ContInputs.CON_R]		= gp_shoulderr;
INPUT_GP_LUT[0][ContInputs.CON_Z]		= gp_shoulderrb;
INPUT_GP_LUT[0][ContInputs.CON_S]		= gp_start;
INPUT_GP_LUT[0][ContInputs.CON_JU]		= gp_axislv;
INPUT_GP_LUT[0][ContInputs.CON_JL]		= gp_axislh;
INPUT_GP_LUT[0][ContInputs.CON_JR]		= gp_axislh;
INPUT_GP_LUT[0][ContInputs.CON_JD]		= gp_axislv;
INPUT_GP_LUT[0][ContInputs.CON_CU]		= gp_padu;
INPUT_GP_LUT[0][ContInputs.CON_CL]		= gp_padl;
INPUT_GP_LUT[0][ContInputs.CON_CR]		= gp_padr;
INPUT_GP_LUT[0][ContInputs.CON_CD]		= gp_padd;

globalvar gControllers;
gControllers = [
	new gPlayerControllerInstance(0),
	new gPlayerControllerInstance(1),
	new gPlayerControllerInstance(2),
	new gPlayerControllerInstance(3)
];

#macro gPlayer1Controller	(gControllers[0])
#macro gPlayer2Controller	(gControllers[1])
#macro gPlayer3Controller	(gControllers[2])
#macro gPlayer4Controller	(gControllers[3])	

boot("input_scripts_macros_init");
inputs_update();
}


function GET_BUTTON(_slot, _key, _holding, _cont) {
	
	var using_cont = _cont != null;
	
	var flag = INPUT_BIT_LUT[_key];
	
	if (using_cont) {
		if (INPUT_GP_LUT[_slot][_key] == null) return 0x00;
		var cont_res = _holding ? gamepad_button_check(_cont, INPUT_GP_LUT[_slot][_key]) : gamepad_button_check_pressed(_cont, INPUT_GP_LUT[_slot][_key]);
		if (cont_res) {
			return flag;
		}
	}
	
	if (INPUT_KB_LUT[_slot][_key] == null) return 0x00;
	
	var kb_res = _holding ? keyboard_check(INPUT_KB_LUT[_slot][_key]) : keyboard_check_pressed(INPUT_KB_LUT[_slot][_key]);
	
	if (kb_res) {
		return  flag;
	}
	
	return 0x00;
}

function gPlayerControllerInstance(_slot) constructor {
	slot = _slot;	
}

function inputs_update() {

	var stickX = 0;
	var stickY = 0;
		
	var gamepads_in_use	= array_create(CONTROLLER_PORTS, null);
	var track_connections = 0;
	var gamepads		= gamepad_get_device_count();	
		
	if (gamepad_is_supported()) {
		for(var i = 0; i < gamepads; i++) {
				
			if (gamepad_is_connected(i)) {
				//log("gamepad", i);
				gamepads_in_use[track_connections] = i;
				track_connections++;
				if (track_connections>CONTROLLER_PORTS-1) break;
			}
		}
	}
		
	for(var i = 0; i < CONTROLLER_PORTS; i++) {
		
		var gamepad = gamepads_in_use[i];
		
		// controller analog
		if (gamepad!=null) {
			var hor, vert;
			hor = ContInputs.CON_JR;
			vert = ContInputs.CON_JD;
			if (INPUT_GP_LUT[i][hor] != null) {
				stickX = gamepad_axis_value(gamepad, INPUT_GP_LUT[i][hor]);
			}
			if (INPUT_GP_LUT[i][vert] != null) {
				stickY = -gamepad_axis_value(gamepad, INPUT_GP_LUT[i][vert]);
			}
		}

		if (stickX < ANALOG_DEADZONE && stickX > -ANALOG_DEADZONE) stickX = 0.0
		if (stickY < ANALOG_DEADZONE && stickY > -ANALOG_DEADZONE) stickY = 0.0

		// no controller analog, use kb
		if (stickX == 0 && stickY == 0) {
		    if (GET_BUTTON(i, ContInputs.CON_JR, true, gamepad)) stickX += 1;
		    if (GET_BUTTON(i, ContInputs.CON_JL, true, gamepad)) stickX -= 1;
		    if (GET_BUTTON(i, ContInputs.CON_JU, true, gamepad)) stickY += 1;
		    if (GET_BUTTON(i, ContInputs.CON_JD, true, gamepad)) stickY -= 1;
		}

		stickX = round(stickX * ANALOG_MAGNITUDE);
		stickY = round(stickY * ANALOG_MAGNITUDE);
			
		// modulate the rawStickX and rawStickY to be the new f32 values by adding/subtracting 6.
		if (stickX <= -8) {
		    stickX = stickX + 6;
		}

		if (stickX >= 8) {
		    stickX = stickX - 6;
		}

		if (stickY <= -8) {
		    stickY = stickY + 6;
		}

		if (stickY >= 8) {
		    stickY = stickY - 6;
		}


		var mag = sqrt((stickX * stickX) + (stickY * stickY));

		gControllers[i].stickX				= stickX;
		gControllers[i].stickY				= stickY;
		gControllers[i].stickMag			= mag;
			
		if (gControllers[i].stickMag > 64) {
		    gControllers[i].stickX *= 64 / gControllers[i].stickMag;
		    gControllers[i].stickY *= 64 / gControllers[i].stickMag;
		    gControllers[i].stickMag = 64;
		}

		gControllers[i].buttonPressed = (
				GET_BUTTON(i, ContInputs.CON_A, false, gamepad)		
			| GET_BUTTON(i, ContInputs.CON_B, false, gamepad)		
			| GET_BUTTON(i, ContInputs.CON_L, false, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_R, false, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_Z, false, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_S, false, gamepad)		
			| GET_BUTTON(i, ContInputs.CON_JU, false, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_JL, false, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_JR, false, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_JD, false, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_CU, false, gamepad)			
			| GET_BUTTON(i, ContInputs.CON_CL, false, gamepad)			
			| GET_BUTTON(i, ContInputs.CON_CR, false, gamepad)			
			| GET_BUTTON(i, ContInputs.CON_CD, false, gamepad)
		);
	
		gControllers[i].buttonDown = (
				GET_BUTTON(i, ContInputs.CON_A, true, gamepad)		
			| GET_BUTTON(i, ContInputs.CON_B, true, gamepad)		
			| GET_BUTTON(i, ContInputs.CON_L, true, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_R, true, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_Z, true, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_S, true, gamepad)		
			| GET_BUTTON(i, ContInputs.CON_JU, true, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_JL, true, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_JR, true, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_JD, true, gamepad)				
			| GET_BUTTON(i, ContInputs.CON_CU, true, gamepad)			
			| GET_BUTTON(i, ContInputs.CON_CL, true, gamepad)			
			| GET_BUTTON(i, ContInputs.CON_CR, true, gamepad)			
			| GET_BUTTON(i, ContInputs.CON_CD, true, gamepad)
		);
	
	}
}
	