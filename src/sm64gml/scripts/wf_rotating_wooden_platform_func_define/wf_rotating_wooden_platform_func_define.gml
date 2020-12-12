
/// <pygml?v=1.0&h=894a7d1d2>
/// @function	bhv_wf_rotating_wooden_platform_loop()
function bhv_wf_rotating_wooden_platform_loop() {
    var o = gCurrentObject;

    if (o.rawData[oAction] == 0) {
        o.rawData[oAngleVelYaw] = 0;
        if (o.rawData[oTimer] > 60) {
            o.rawData[oAction]++;; // needed to match
        }
    } else {
        o.rawData[oAngleVelYaw] = 0x100;
        if (o.rawData[oTimer] > 126)
            o.rawData[oAction] = 0;
        cur_obj_play_sound_1(SOUND_ENV_ELEVATOR2);
    }
    cur_obj_rotate_face_angle_using_vel();
}

/// <pygml?v=1.0&h=e54b3ebce>
/// @function	bhv_rotating_platform_loop()
function bhv_rotating_platform_loop() {
    var o = gCurrentObject;

    var sp1F = o.rawData[oBehParams] >> 24;
    if (o.rawData[oTimer] == 0) {
        obj_set_collision_data(o, sWFRotatingPlatformData[o.rawData[oBehParams2ndByte]].collisionData);
        o.rawData[oCollisionDistance] = sWFRotatingPlatformData[o.rawData[oBehParams2ndByte]].collisionDistance;
        cur_obj_scale(sWFRotatingPlatformData[o.rawData[oBehParams2ndByte]].scale * 0.01);
    }
    o.rawData[oAngleVelYaw] = sp1F << 4;
    o.rawData[oFaceAngleYaw] += o.rawData[oAngleVelYaw];
}
