/// <pygml?v=1.0&h=ad2e5e85a>
/// @function	bhv_small_bomp_init()
function bhv_small_bomp_init() {
    var o = gCurrentObject;

    o.rawData[oFaceAngleYaw] -= 0x4000;
    o.rawData[oSmallBompInitX] = o.rawData[oPosX];
    o.rawData[oTimer] = random_float() * 100.0;
}


/// <pygml?v=1.0&h=2d7350e5b>
/// @function	bhv_small_bomp_loop()
function bhv_small_bomp_loop() {
    var o = gCurrentObject;

    switch (o.rawData[oAction]) {
        case (BOMP_ACT_WAIT):
            if (o.rawData[oTimer] >= 101) {
                o.rawData[oAction] = BOMP_ACT_POKE_OUT;
                o.rawData[oForwardVel] = 30.0;
            }
            break;

        case (BOMP_ACT_POKE_OUT):
            if (o.rawData[oPosX] > 3450.0) {
                o.rawData[oPosX] = 3450.0;
                o.rawData[oForwardVel] = 0;
            }

            if (o.rawData[oTimer] == 15.0) {
                o.rawData[oAction] = BOMP_ACT_EXTEND;
                o.rawData[oForwardVel] = 40.0;
                cur_obj_play_sound_2(SOUND_OBJ_UNKNOWN2);
            }
            break;

        case (BOMP_ACT_EXTEND):
            if (o.rawData[oPosX] > 3830.0) {
                o.rawData[oPosX] = 3830.0;
                o.rawData[oForwardVel] = 0;
            }

            if (o.rawData[oTimer] == 60) {
                o.rawData[oAction] = BOMP_ACT_RETRACT;
                o.rawData[oForwardVel] = 10.0;
                o.rawData[oMoveAngleYaw] -= 0x8000;
                cur_obj_play_sound_2(SOUND_OBJ_UNKNOWN2);
            }
            break;

        case (BOMP_ACT_RETRACT):
            if (o.rawData[oPosX] < 3330.0) {
                o.rawData[oPosX] = 3330.0;
                o.rawData[oForwardVel] = 0;
            }

            if (o.rawData[oTimer] == 90) {
                o.rawData[oAction] = BOMP_ACT_POKE_OUT;
                o.rawData[oForwardVel] = 25.0;
                o.rawData[oMoveAngleYaw] -= 0x8000;
            }
            break;
    }
}

/// <pygml?v=1.0&h=99eec70b5>
/// @function	bhv_large_bomp_init()
function bhv_large_bomp_init() {
    var o = gCurrentObject;

    o.rawData[oMoveAngleYaw] += 0x4000;
    o.rawData[oTimer] = random_float() * 100.0;
}

/// <pygml?v=1.0&h=05b00a354>
/// @function	bhv_large_bomp_loop()
function bhv_large_bomp_loop() {
    var o = gCurrentObject;

    switch (o.rawData[oAction]) {
        case (BOMP_ACT_WAIT):
            if (o.rawData[oTimer] >= 101) {
                o.rawData[oAction] = BOMP_ACT_POKE_OUT;
                o.rawData[oForwardVel] = 30.0;
            }
            break;

        case (BOMP_ACT_POKE_OUT):
            if (o.rawData[oPosX] > 3450.0) {
                o.rawData[oPosX] = 3450.0;
                o.rawData[oForwardVel] = 0;
            }

            if (o.rawData[oTimer] == 15.0) {
                o.rawData[oAction] = BOMP_ACT_EXTEND;
                o.rawData[oForwardVel] = 10.0;
                cur_obj_play_sound_2(SOUND_OBJ_UNKNOWN2);
            }
            break;

        case (BOMP_ACT_EXTEND):
            if (o.rawData[oPosX] > 3830.0) {
                o.rawData[oPosX] = 3830.0;
                o.rawData[oForwardVel] = 0;
            }

            if (o.rawData[oTimer] == 60) {
                o.rawData[oAction] = BOMP_ACT_RETRACT;
                o.rawData[oForwardVel] = 10.0;
                o.rawData[oMoveAngleYaw] -= 0x8000;
                cur_obj_play_sound_2(SOUND_OBJ_UNKNOWN2);
            }
            break;

        case (BOMP_ACT_RETRACT):
            if (o.rawData[oPosX] < 3330.0) {
                o.rawData[oPosX] = 3330.0;
                o.rawData[oForwardVel] = 0;
            }

            if (o.rawData[oTimer] == 90) {
                o.rawData[oAction] = BOMP_ACT_POKE_OUT;
                o.rawData[oForwardVel] = 25.0;
                o.rawData[oMoveAngleYaw] -= 0x8000;
            }
            break;
    }
}
