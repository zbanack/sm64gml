// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function door_macros_init(){

global.__D_8032F300 = [new DoorAction(0x40000, 3), new DoorAction(0x80000, 4), new DoorAction(0x10000, 1), new DoorAction(0x20000, 2), new DoorAction(-1, 0)];
global.__D_8032F328 = [ SOUND_GENERAL_OPEN_WOOD_DOOR, SOUND_GENERAL_OPEN_IRON_DOOR ];
global.__D_8032F330 = [ SOUND_GENERAL_CLOSE_WOOD_DOOR, SOUND_GENERAL_CLOSE_IRON_DOOR ];
#macro D_8032F300		  global.__D_8032F300
#macro D_8032F328		  global.__D_8032F328
#macro D_8032F330		  global.__D_8032F330
}

function DoorAction(_flag, _action) constructor {
	flag = _flag;
	action = _action;
}

/// <pygml?v=1.0&h=2febbc48f>
/// @function	door_animation_and_reset(sp18)
/// @param		{s32}		sp18
function door_animation_and_reset(sp18) {
    var o = gCurrentObject;

    cur_obj_init_animation_with_sound(sp18);
    if (cur_obj_check_if_near_animation_end())
        o.rawData[oAction] = 0;
}

/// <pygml?v=1.0&h=6286722fd>
/// @function	set_door_camera_event()
function set_door_camera_event() {
    var o = gCurrentObject;
    if (behaviors_equal(Object1.bhvDoor, o.behavior)) 
        gPlayerCameraState.cameraEvent = CAM_EVENT_DOOR;
    else
        gPlayerCameraState.cameraEvent = CAM_EVENT_DOOR_WARP;
    gPlayerCameraState.usedObj = o;
}

/// <pygml?v=1.0&h=df22f14e1>
/// @function	play_door_open_noise()
function play_door_open_noise() {
    var o = gCurrentObject;

    var sp1C = cur_obj_has_model(MODEL_HMC_METAL_DOOR);
    if (o.rawData[oTimer] == 0) {
        cur_obj_play_sound_2(D_8032F328[sp1C]);
        gTimeStopState |= TIME_STOP_MARIO_OPENED_DOOR;
    }
    if (o.rawData[oTimer] == 70) {
        cur_obj_play_sound_2(D_8032F330[sp1C]);
    }
}

/// <pygml?v=1.0&h=fde1c0b89>
/// @function	play_warp_door_open_noise()
function play_warp_door_open_noise() {
    var o = gCurrentObject;

    var sp1C = cur_obj_has_model(MODEL_HMC_METAL_DOOR);
    if (o.rawData[oTimer] == 30)
        cur_obj_play_sound_2(D_8032F330[sp1C]);
}

/// <pygml?v=1.0&h=0eed29664>
/// @function	bhv_door_loop()
function bhv_door_loop() {
    var o = gCurrentObject;

    var sp1C = 0;

    while (D_8032F300[sp1C].flag != ~0) {
        if (cur_obj_clear_interact_status_flag(D_8032F300[sp1C].flag)) {
            set_door_camera_event();
            cur_obj_change_action(D_8032F300[sp1C].action);
        }
        sp1C++;
    }

    switch (o.rawData[oAction]) {
        case (0):
            cur_obj_init_animation_with_sound(0);
            break;
        case (1):
            door_animation_and_reset(1);
            play_door_open_noise();
            break;
        case (2):
            door_animation_and_reset(2);
            play_door_open_noise();
            break;
        case (3):
            door_animation_and_reset(3);
            play_warp_door_open_noise();
            break;
        case (4):
            door_animation_and_reset(4);
            play_warp_door_open_noise();
            break;
    }
    if (o.rawData[oAction] == 0)
        load_object_collision_model();
    bhv_star_door_loop_2();
}

/// <pygml?v=1.0&h=2d9e858f1>
/// @function	bhv_door_init()
function bhv_door_init() {
    var o = gCurrentObject;

    var _x = o.rawData[oPosX];
    var _z = o.rawData[oPosZ];
    var _floor = {};
    find_floor(_x, o.rawData[oPosY], _z, _floor)
    _floor = _floor._floor;
    if (_floor != null) {
        o.rawData[oDoorUnkF8] = _floor._room;
    }

    _x = o.rawData[oPosX] + sins(o.rawData[oMoveAngleYaw]) * 200.0;
    _z = o.rawData[oPosZ] + coss(o.rawData[oMoveAngleYaw]) * 200.0;
    find_floor(_x, o.rawData[oPosY], _z, _floor)
    _floor = _floor._floor;
    if (_floor != null) {
        o.rawData[oDoorUnkFC] = _floor._room;
    }

    _x = o.rawData[oPosX] + sins(o.rawData[oMoveAngleYaw]) * -200.0;
    _z = o.rawData[oPosZ] + coss(o.rawData[oMoveAngleYaw]) * -200.0;
    find_floor(_x, o.rawData[oPosY], _z, _floor)
    _floor = _floor._floor;
    if (_floor != null) {
        o.rawData[oDoorUnk100] = _floor._room;
    }

    if (o.rawData[oDoorUnkF8] > 0 && o.rawData[oDoorUnkF8] < 60) {
        gDoorAdjacentRooms[o.rawData[oDoorUnkF8]][0] = o.rawData[oDoorUnkFC];
        gDoorAdjacentRooms[o.rawData[oDoorUnkF8]][1] = o.rawData[oDoorUnk100];
    }
}

/// <pygml?v=1.0&h=95a0d9f1c>
/// @function	bhv_star_door_loop_2()
function bhv_star_door_loop_2() {
    var o = gCurrentObject;

    var sp4 = 0;
    if (gMarioCurrentRoom != 0) {
        if (o.rawData[oDoorUnkF8] == gMarioCurrentRoom)
            sp4 = 1;
        else if (gMarioCurrentRoom == o.rawData[oDoorUnkFC])
            sp4 = 1;
        else if (gMarioCurrentRoom == o.rawData[oDoorUnk100])
            sp4 = 1;
        else if (gDoorAdjacentRooms[gMarioCurrentRoom][0] == o.rawData[oDoorUnkFC])
            sp4 = 1;
        else if (gDoorAdjacentRooms[gMarioCurrentRoom][0] == o.rawData[oDoorUnk100])
            sp4 = 1;
        else if (gDoorAdjacentRooms[gMarioCurrentRoom][1] == o.rawData[oDoorUnkFC])
            sp4 = 1;
        else if (gDoorAdjacentRooms[gMarioCurrentRoom][1] == o.rawData[oDoorUnk100])
            sp4 = 1;
    } else
        sp4 = 1;
    if (sp4 == 1) {
        o.header.gfx.node.flags |= GRAPH_RENDER_ACTIVE;
        D_8035FEE4++;
    }
    if (sp4 == 0) {
        o.header.gfx.node.flags &= ~GRAPH_RENDER_ACTIVE;
    }
    o.rawData[oDoorUnk88] = sp4;
}
