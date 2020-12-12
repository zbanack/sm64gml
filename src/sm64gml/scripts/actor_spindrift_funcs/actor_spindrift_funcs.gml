/// <pygml?v=1.0&h=9e87c51b9>
/// @function	bhv_spindrift_loop()
function bhv_spindrift_loop() {
    var o = gCurrentObject;

    o.activeFlags |= ACTIVE_FLAG_UNK10;
    if (cur_obj_set_hitbox_and_die_if_attacked(sSpindriftHitbox, SOUND_OBJ_DYING_ENEMY1, 0))
        cur_obj_change_action(1);
    cur_obj_update_floor_and_walls();
    switch (o.rawData[oAction]) {
        case (0):
            approach_forward_vel(o.rawData[oForwardVel], 4.0, 1.0);
            if (cur_obj_lateral_dist_from_mario_to_home() > 1000.0)
                o.rawData[oAngleToMario] = cur_obj_angle_to_home();
            else if (o.rawData[oDistanceToMario] > 300.0)
                o.rawData[oAngleToMario] = obj_angle_to_object(o, gMarioObject[0]);
            cur_obj_rotate_yaw_toward(o.rawData[oAngleToMario], 0x400);
            break;
        case (1):
            o.rawData[oFlags] &= ~8;
            o.rawData[oForwardVel] = -10.0;
            if (o.rawData[oTimer] > 20) {
                o.rawData[oAction] = 0;
                o.rawData[oInteractStatus] = 0;
                o.rawData[oFlags] |= 8;
            }
            break;
    }
    cur_obj_move_standard(-60);
}