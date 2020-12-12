/// <pygml?v=1.0&h=acb618e34>
/// @function	mad_piano_act_wait()
function mad_piano_act_wait() {
    var o = gCurrentObject;

    //cur_obj_init_animation_with_sound(0);

    if (o.rawData[oDistanceToMario] < 500.0) {
        if (o.rawData[oTimer] > 20) {
            if (gMarioStates[0].forwardVel > 10.0) {
                o.rawData[oAction] = MAD_PIANO_ACT_ATTACK;
                cur_obj_become_tangible();
            }
        }
    } else {
        o.rawData[oTimer] = 0;
    }

    cur_obj_push_mario_away_from_cylinder(280.0, 150.0);
}

/// <pygml?v=1.0&h=6ce5f3be3>
/// @function	mad_piano_act_attack()
function mad_piano_act_attack() {
    var o = gCurrentObject;

    cur_obj_update_floor_and_walls();
    //cur_obj_init_animation_with_sound(1);
    //cur_obj_play_sound_at_anim_range(0, 0, SOUND_OBJ_MAD_PIANO_CHOMPING);

    if (o.rawData[oDistanceToMario] < 500.0) {
        o.rawData[oTimer] = 0;
    }

    if (o.rawData[oTimer] > 80 && cur_obj_check_if_near_animation_end()) {
        o.rawData[oAction] = MAD_PIANO_ACT_WAIT;
        o.rawData[oForwardVel] = 0.0;
        cur_obj_become_intangible();
    } else {
        var dx = o.rawData[oPosX] - o.rawData[oHomeX];
        var dz = o.rawData[oPosZ] - o.rawData[oHomeZ];
        var distToHome = sqrt(dx * dx + dz * dz);

        if (distToHome > 400.0) {
            distToHome = 400.0 / distToHome;
            o.rawData[oPosX] = o.rawData[oHomeX] + dx * distToHome;
            o.rawData[oPosZ] = o.rawData[oHomeZ] + dz * distToHome;
        }

        cur_obj_rotate_yaw_toward(o.rawData[oAngleToMario], 400);
        o.rawData[oForwardVel] = 5.0;
    }

    obj_check_attacks(sMadPianoHitbox, o.rawData[oAction]);
    cur_obj_move_standard(78);
}

/// <pygml?v=1.0&h=69935621c>
/// @function	bhv_mad_piano_update()
function bhv_mad_piano_update() {
    var o = gCurrentObject;

    if (!(o.activeFlags & ACTIVE_FLAG_IN_DIFFERENT_ROOM)) {
        o.rawData[oFaceAngleYaw] = o.rawData[oMoveAngleYaw] - 0x4000;

        switch (o.rawData[oAction]) {
            case (MAD_PIANO_ACT_WAIT):
                mad_piano_act_wait();
                break;
            case (MAD_PIANO_ACT_ATTACK):
                mad_piano_act_attack();
                break;
        }
    }
}
