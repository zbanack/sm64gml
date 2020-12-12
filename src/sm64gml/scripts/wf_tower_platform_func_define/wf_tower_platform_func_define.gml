/// <pygml?v=1.0&h=cf729bada>
/// @function	bhv_wf_solid_tower_platform_loop()
function bhv_wf_solid_tower_platform_loop() {
	
	var o = gCurrentObject;

    if (o.parentObj.rawData[oAction] == 3)
        obj_mark_for_deletion(o);
}

/// <pygml?v=1.0&h=eac911384>
/// @function	bhv_wf_elevator_tower_platform_loop()
function bhv_wf_elevator_tower_platform_loop() {
    var o = gCurrentObject;

    switch (o.rawData[oAction]) {
        case (0):
            if (gMarioObject[0].platform == o)
                o.rawData[oAction]++;
            break;
        case (1):
            cur_obj_play_sound_1(SOUND_ENV_ELEVATOR1);
            if (o.rawData[oTimer] > 140)
                o.rawData[oAction]++;
            else
                o.rawData[oPosY] += 5.0;
            break;
        case (2):
            if (o.rawData[oTimer] > 60)
                o.rawData[oAction]++;
            break;
        case (3):
            cur_obj_play_sound_1(SOUND_ENV_ELEVATOR1);
            if (o.rawData[oTimer] > 140)
                o.rawData[oAction] = 0;
            else
                o.rawData[oPosY] -= 5.0;
            break;
    }
    if (o.parentObj.rawData[oAction] == 3)
        obj_mark_for_deletion(o);
}

/// <pygml?v=1.0&h=77bd248c2>
/// @function	bhv_wf_sliding_tower_platform_loop()
function bhv_wf_sliding_tower_platform_loop() {
    var o = gCurrentObject;

    var sp24 = o.rawData[oPlatformUnk110] / o.rawData[oPlatformUnk10C];
    switch (o.rawData[oAction]) {
        case (0):
            if (o.rawData[oTimer] > sp24)
                o.rawData[oAction]++;
            o.rawData[oForwardVel] = -o.rawData[oPlatformUnk10C];
            break;
        case (1):
            if (o.rawData[oTimer] > sp24)
                o.rawData[oAction] = 0;
            o.rawData[oForwardVel] = o.rawData[oPlatformUnk10C];
            break;
    }
    cur_obj_compute_vel_xz();
    o.rawData[oPosX] += o.rawData[oVelX];
    o.rawData[oPosZ] += o.rawData[oVelZ];
    if (o.parentObj.rawData[oAction] == 3)
        obj_mark_for_deletion(o);
}

/// <pygml?v=1.0&h=52f1947e6>
/// @function	spawn_and_init_wf_platforms(a, bhv)
/// @param		{s16}		a
/// @param		{const}		bhv
function spawn_and_init_wf_platforms(a, bhv) {
    var o = gCurrentObject;

    var yaw;
    var platform = spawn_object(o, a, bhv);
    yaw = o.rawData[@ oPlatformSpawnerUnkF4] * o.rawData[@ oPlatformSpawnerUnkFC] + o.rawData[@ oPlatformSpawnerUnkF8];
    platform.rawData[oMoveAngleYaw] = yaw;
    platform.rawData[oPosX] += o.rawData[@ oPlatformSpawnerUnk100] * sins(yaw);
    platform.rawData[oPosY] += 100 * o.rawData[@ oPlatformSpawnerUnkF4];
    platform.rawData[oPosZ] += o.rawData[@ oPlatformSpawnerUnk100] * coss(yaw);
    platform.rawData[oPlatformUnk110] = o.rawData[@ oPlatformSpawnerUnk104];
    platform.rawData[oPlatformUnk10C] = o.rawData[@ oPlatformSpawnerUnk108];
    o.rawData[oPlatformSpawnerUnkF4]++;
}

/// <pygml?v=1.0&h=c8061fba7>
/// @function	spawn_wf_platform_group()
function spawn_wf_platform_group() {
    var o = gCurrentObject;

    var unused = 8;
    o.rawData[oPlatformSpawnerUnkF4] = 0;
    o.rawData[oPlatformSpawnerUnkF8] = 0;
    o.rawData[oPlatformSpawnerUnkFC] = 0x2000;
    o.rawData[oPlatformSpawnerUnk100] = 704.0;
    o.rawData[oPlatformSpawnerUnk104] = 380.0;
    o.rawData[oPlatformSpawnerUnk108] = 3.0;
    spawn_and_init_wf_platforms(MODEL_WF_TOWER_SQUARE_PLATORM, Object1.bhvWfSolidTowerPlatform);
    spawn_and_init_wf_platforms(MODEL_WF_TOWER_SQUARE_PLATORM, Object1.bhvWfSlidingTowerPlatform);
    spawn_and_init_wf_platforms(MODEL_WF_TOWER_SQUARE_PLATORM, Object1.bhvWfSolidTowerPlatform);
    spawn_and_init_wf_platforms(MODEL_WF_TOWER_SQUARE_PLATORM, Object1.bhvWfSlidingTowerPlatform);
    spawn_and_init_wf_platforms(MODEL_WF_TOWER_SQUARE_PLATORM, Object1.bhvWfSolidTowerPlatform);
    spawn_and_init_wf_platforms(MODEL_WF_TOWER_SQUARE_PLATORM, Object1.bhvWfSlidingTowerPlatform);
    spawn_and_init_wf_platforms(MODEL_WF_TOWER_SQUARE_PLATORM, Object1.bhvWfSolidTowerPlatform);
    spawn_and_init_wf_platforms(MODEL_WF_TOWER_SQUARE_PLATORM_ELEVATOR, Object1.bhvWfElevatorTowerPlatform);
}

/// <pygml?v=1.0&h=ee03e91c9>
/// @function	bhv_tower_platform_group_loop()
function bhv_tower_platform_group_loop() {
    var o = gCurrentObject;

    var marioY = gMarioObject[0].rawData[oPosY];
    o.rawData[oDistanceToMario] = dist_between_objects(o, gMarioObject[0]);
    switch (o.rawData[oAction]) {
        case (0):
            if (marioY > o.rawData[oHomeY] - 1000.0)
                o.rawData[oAction]++;
            break;
        case (1):
            spawn_wf_platform_group();
            o.rawData[oAction]++;
            break;
        case (2):
            if (marioY < o.rawData[oHomeY] - 1000.0)
                o.rawData[oAction]++;
            break;
        case (3):
            o.rawData[oAction] = 0;
            break;
    }
}
