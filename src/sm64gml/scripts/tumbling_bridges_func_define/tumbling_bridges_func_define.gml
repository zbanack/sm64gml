/// <pygml?v=1.0&h=4e2047b7a>
/// @function	bhv_tumbling_bridge_platform_loop()
function bhv_tumbling_bridge_platform_loop() {
    var o = gCurrentObject;

    switch (o.rawData[oAction]) {
        case (0):
            if (gMarioObject[0].platform == o) {
                o.rawData[oAction]++;
                o.rawData[oTumblingBridgeUnkF4] = random_sign() * 0x80;
            }
            break;
        case (1):
            cur_obj_update_floor_height();
            if (o.rawData[oTimer] > 5) {
                o.rawData[oAction]++;
                cur_obj_play_sound_2(SOUND_GENERAL_PLATFORM);
            }
            break;
        case (2):
            if (o.rawData[oAngleVelPitch] < 0x400)
                o.rawData[oAngleVelPitch] += 0x80;
            if (o.rawData[oAngleVelRoll] > -0x400 && o.rawData[oAngleVelRoll] < 0x400)
                o.rawData[oAngleVelRoll] += o.rawData[oTumblingBridgeUnkF4]; // acceleration?
            o.rawData[oGravity] = -3.0;
            cur_obj_rotate_face_angle_using_vel();
            cur_obj_move_using_fvel_and_gravity();
            if (o.rawData[oPosY] < o.rawData[oFloorHeight] - 300.0)
                o.rawData[oAction]++;
            break;
        case (3):
            break;
    }
    if (o.parentObj.rawData[oAction] == 3)
        obj_mark_for_deletion(o);
}

/// <pygml?v=1.0&h=457ae957d>
/// @function	tumbling_bridge_act_1()
function tumbling_bridge_act_1() {
    var o = gCurrentObject;

    var platformObj;
    var i;
    var bridgeID = o.rawData[oBehParams2ndByte];
    var relativePlatformX;
    var relativePlatformZ;
    var relativePlatformY = 0;
    var relativeInitialPlatformY = 0;

    for (i = 0; i < sTumblingBridgeParams[bridgeID].numBridgeSections; i++) {
        relativePlatformX = 0;
        relativePlatformZ = 0;

        if (bridgeID == 3)
            relativePlatformX = sTumblingBridgeParams[bridgeID].bridgeRelativeStartingXorZ +
            sTumblingBridgeParams[bridgeID].platformWidth * i;
        else
            relativePlatformZ = sTumblingBridgeParams[bridgeID].bridgeRelativeStartingXorZ +
            sTumblingBridgeParams[bridgeID].platformWidth * i;

        if (cur_obj_has_behavior(Object1.bhvLllTumblingBridge)) {
            if (i % 3 == 0)
                relativePlatformY -= 150;
            relativeInitialPlatformY = 450;
        }

        platformObj = spawn_object_relative(
            0, relativePlatformX, relativePlatformY + relativeInitialPlatformY, relativePlatformZ, o,
            sTumblingBridgeParams[bridgeID].model, Object1.bhvTumblingBridgePlatform);

        obj_set_collision_data(platformObj, sTumblingBridgeParams[bridgeID].segAddr);
    }

    o.rawData[oAction] = 2;
}

/// <pygml?v=1.0&h=aa1bd5588>
/// @function	tumbling_bridge_act_2()
function tumbling_bridge_act_2() {
    var o = gCurrentObject;

    cur_obj_hide();
    if (cur_obj_has_behavior(Object1.bhvLllTumblingBridge))
        cur_obj_unhide();
    else if (o.rawData[oDistanceToMario] > 1200.0) {
        o.rawData[oAction] = 3;
        cur_obj_unhide();
    }
}

/// <pygml?v=1.0&h=679cfc529>
/// @function	tumbling_bridge_act_3()
function tumbling_bridge_act_3() {
    var o = gCurrentObject;

    cur_obj_unhide();
    o.rawData[oAction] = 0;
}

/// <pygml?v=1.0&h=e3aa40e5f>
/// @function	tumbling_bridge_act_0()
function tumbling_bridge_act_0() {
    var o = gCurrentObject;

    if (cur_obj_has_behavior(Object1.bhvLllTumblingBridge) || o.rawData[oDistanceToMario] < 1000.0)
        o.rawData[oAction] = 1;
}

/// <pygml?v=1.0&h=3696308f1>
/// @function	bhv_tumbling_bridge_loop()
function bhv_tumbling_bridge_loop() {
    cur_obj_call_action_function(sTumblingBridgeActions);
}

function tumbling_bridge_macros_init() {
	global.__sTumblingBridgeActions = [
	tumbling_bridge_act_0, tumbling_bridge_act_1,
	tumbling_bridge_act_2, tumbling_bridge_act_3 
	];
	#macro sTumblingBridgeActions	global.__sTumblingBridgeActions

	global.__D_8032F38C = [-51, 0,     0, -461, 0,   0, -512, 0,   0,    -2611, 0,
	                     0,   -2360, 0, 0,    214, 0, 0,    -50, 1945, 1,     0];
	#macro D_8032F38C	global.__D_8032F38C	
}