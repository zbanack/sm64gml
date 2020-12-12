/// <pygml?v=1.0&h=72e8f3f51>
/// @function	grindel_thwomp_act_4()
function grindel_thwomp_act_4() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] == 0)
        o.rawData[oThwompRandomTimer] = random_float() * 10.0 + 20.0;
    if (o.rawData[oTimer] > o.rawData[oThwompRandomTimer])
        o.rawData[oAction] = 0;
}

/// <pygml?v=1.0&h=4b5f28d66>
/// @function	grindel_thwomp_act_2()
function grindel_thwomp_act_2() {
    var o = gCurrentObject;

    o.rawData[oVelY] += -4.0;
    o.rawData[oPosY] += o.rawData[oVelY];
    if (o.rawData[oPosY] < o.rawData[oHomeY]) {
        o.rawData[oPosY] = o.rawData[oHomeY];
        o.rawData[oVelY] = 0;
        o.rawData[oAction] = 3;
    }
}

/// <pygml?v=1.0&h=19fa7c070>
/// @function	grindel_thwomp_act_3()
function grindel_thwomp_act_3() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] == 0)
        if (o.rawData[oDistanceToMario] < 1500.0) {
            cur_obj_shake_screen(SHAKE_POS_SMALL); // @z
            cur_obj_play_sound_2(SOUND_OBJ_THWOMP);
        }
    if (o.rawData[oTimer] > 9)
        o.rawData[oAction] = 4;
}

/// <pygml?v=1.0&h=9e7512f0c>
/// @function	grindel_thwomp_act_1()
function grindel_thwomp_act_1() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] == 0)
        o.rawData[oThwompRandomTimer] = random_float() * 30.0 + 10.0;
    if (o.rawData[oTimer] > o.rawData[oThwompRandomTimer])
        o.rawData[oAction] = 2;
}

/// <pygml?v=1.0&h=76a849698>
/// @function	grindel_thwomp_act_0()
function grindel_thwomp_act_0() {
    var o = gCurrentObject;

    if (o.rawData[oBehParams2ndByte] + 40 < o.rawData[oTimer]) {
        o.rawData[oAction] = 1;
        o.rawData[oPosY] += 5.0;
    } else
        o.rawData[oPosY] += 10.0;
}

/// <pygml?v=1.0&h=b45de0936>
/// @function	bhv_grindel_thwomp_loop()
function bhv_grindel_thwomp_loop() {
    cur_obj_call_action_function(sGrindelThwompActions);
}


function thwomp_macros_init() {
	global.__sGrindelThwompActions = [
		grindel_thwomp_act_0, grindel_thwomp_act_1,
		grindel_thwomp_act_2, grindel_thwomp_act_3,
		grindel_thwomp_act_4
	];
	#macro sGrindelThwompActions	global.__sGrindelThwompActions	
}