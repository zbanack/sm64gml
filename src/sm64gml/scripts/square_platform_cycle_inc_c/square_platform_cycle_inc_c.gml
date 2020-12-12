/// <pygml?v=1.0&h=4ee33faee>
/// @function	square_plat_set_yaw_until_timer(yaw, a)
/// @param		{u16}		yaw
/// @param		{s32}		a
/// @returns	s32
function square_plat_set_yaw_until_timer(yaw, a) {
    var o = gCurrentObject;

    o.rawData[oMoveAngleYaw] = yaw;
    if (a < o.rawData[oTimer])
        return 1;
    else
        return 0;
}

/// <pygml?v=1.0&h=be15b427e>
/// @function	bhv_squarish_path_moving_loop()
function bhv_squarish_path_moving_loop() {
    var o = gCurrentObject;

    o.rawData[oForwardVel] = 10.0;
    switch (o.rawData[oAction]) {
        case (0):
            o.rawData[oAction] = (o.rawData[oBehParams2ndByte] & 3) + 1;
            break;
        case (1):
            if (square_plat_set_yaw_until_timer(0, 60))
                o.rawData[oAction]++;
            break;
        case (2):
            if (square_plat_set_yaw_until_timer(0x4000, 60))
                o.rawData[oAction]++;
            break;
        case (3):
            if (square_plat_set_yaw_until_timer(0x8000, 60))
                o.rawData[oAction]++;
            break;
        case (4):
            if (square_plat_set_yaw_until_timer(0xc000, 60))
                o.rawData[oAction] = 1;
            break;
        default:
            break;
    }
    cur_obj_move_using_fvel_and_gravity();
    load_object_collision_model();
}
