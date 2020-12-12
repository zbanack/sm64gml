/// <pygml?v=1.0&h=8ec533e5f>
/// @function	whomp_play_sfx_from_pound_animation()
function whomp_play_sfx_from_pound_animation() {
    var o = gCurrentObject;

    var sp2C = o.header.gfx.unk38.animFrame;
    var sp28 = 0;
    if (o.rawData[oForwardVel] < 5.0) {
        sp28 = cur_obj_check_anim_frame(0);
        sp28 |= cur_obj_check_anim_frame(23);
    } else {
        sp28 = cur_obj_check_anim_frame_in_range(0, 3);
        sp28 |= cur_obj_check_anim_frame_in_range(23, 3);
    }
    if (sp28)
        cur_obj_play_sound_2(SOUND_OBJ_POUNDING1);
}

/// <pygml?v=1.0&h=ce742c3e1>
/// @function	whomp_act_0()
function whomp_act_0() {
    var o = gCurrentObject;

    cur_obj_init_animation_with_accel_and_sound(0, 1.0);
    cur_obj_set_pos_to_home();
    if (o.rawData[oBehParams2ndByte] != 0) {
        gSecondCameraFocus = o;
        cur_obj_scale(2.0);
        if (o.rawData[oSubAction] == 0) {
            if (o.rawData[oDistanceToMario] < 600.0) {
                o.rawData[oSubAction]++;
                func_8031FFB4(SEQ_PLAYER_LEVEL, 60, 40);
            } else {
                cur_obj_set_pos_to_home();
                o.rawData[oHealth] = 3;
            }
        } else if (cur_obj_update_dialog_with_cutscene(2, 1, CUTSCENE_DIALOG, DIALOG_114))
            o.rawData[oAction] = 2;
    } else if (o.rawData[oDistanceToMario] < 500.0)
        o.rawData[oAction] = 1;
    whomp_play_sfx_from_pound_animation();
}

/// <pygml?v=1.0&h=362a6affb>
/// @function	whomp_act_7()
function whomp_act_7() {
    var o = gCurrentObject;

    if (o.rawData[oSubAction] == 0) {
        o.rawData[oForwardVel] = 0.0;
        cur_obj_init_animation_with_accel_and_sound(0, 1.0);
        if (o.rawData[oTimer] > 31)
            o.rawData[oSubAction]++;
        else
            o.rawData[oMoveAngleYaw] += 0x400;
    } else {
        o.rawData[oForwardVel] = 3.0;
        if (o.rawData[oTimer] > 42)
            o.rawData[oAction] = 1;
    }
    whomp_play_sfx_from_pound_animation();
}

/// <pygml?v=1.0&h=29da52c9d>
/// @function	whomp_act_1()
function whomp_act_1() {
    var o = gCurrentObject;

    var sp26;
    var sp20;
    var sp1C;
    sp26 = abs_angle_diff(o.rawData[oAngleToMario], o.rawData[oMoveAngleYaw]);
    sp20 = cur_obj_lateral_dist_to_home();
    if (gCurrLevelNum == LEVEL_BITS)
        sp1C = 200.0;
    else
        sp1C = 700.0;
    cur_obj_init_animation_with_accel_and_sound(0, 1.0);
    o.rawData[oForwardVel] = 3.0;
    if (sp20 > sp1C)
        o.rawData[oAction] = 7;
    else if (sp26 < 0x2000) {
        if (o.rawData[oDistanceToMario] < 1500.0) {
            o.rawData[oForwardVel] = 9.0;
            cur_obj_init_animation_with_accel_and_sound(0, 3.0);
        }
        if (o.rawData[oDistanceToMario] < 300.0)
            o.rawData[oAction] = 3;
    }
    whomp_play_sfx_from_pound_animation();
}

/// <pygml?v=1.0&h=52da05fd5>
/// @function	whomp_act_2()
function whomp_act_2() {
    var o = gCurrentObject;

    var sp1E;
    cur_obj_init_animation_with_accel_and_sound(0, 1.0);
    o.rawData[oForwardVel] = 3.0;
    cur_obj_rotate_yaw_toward(o.rawData[oAngleToMario], 0x200);
    if (o.rawData[oTimer] > 30) {
        sp1E = abs_angle_diff(o.rawData[oAngleToMario], o.rawData[oMoveAngleYaw]);
        if (sp1E < 0x2000) {
            if (o.rawData[oDistanceToMario] < 1500.0) {
                o.rawData[oForwardVel] = 9.0;
                cur_obj_init_animation_with_accel_and_sound(0, 3.0);
            }
            if (o.rawData[oDistanceToMario] < 300.0)
                o.rawData[oAction] = 3;
        }
    }
    whomp_play_sfx_from_pound_animation();
    if (mario_is_far_below_object(1000.0)) {
        o.rawData[oAction] = 0;
        stop_background_music(SEQUENCE_ARGS(4, SEQ_EVENT_BOSS));
    }
}

/// <pygml?v=1.0&h=fb4f2dee7>
/// @function	whomp_act_3()
function whomp_act_3() {
    var o = gCurrentObject;

    o.rawData[oForwardVel] = 0.0;
    cur_obj_init_animation_with_accel_and_sound(1, 1.0);
    if (cur_obj_check_if_near_animation_end())
        o.rawData[oAction] = 4;
}

/// <pygml?v=1.0&h=22faf454b>
/// @function	whomp_act_4()
function whomp_act_4() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] == 0)
        o.rawData[oVelY] = 40.0;
    if (o.rawData[oTimer] < 8) {} else {
        o.rawData[oAngleVelPitch] += 0x100;
        o.rawData[oFaceAnglePitch] += o.rawData[oAngleVelPitch];
        if (o.rawData[oFaceAnglePitch] > 0x4000) {
            o.rawData[oAngleVelPitch] = 0;
            o.rawData[oFaceAnglePitch] = 0x4000;
            o.rawData[oAction] = 5;
        }
    }
}

/// <pygml?v=1.0&h=e1eedc82c>
/// @function	whomp_act_5()
function whomp_act_5() {
    var o = gCurrentObject;

    if (o.rawData[oSubAction] == 0 && o.rawData[oMoveFlags] & OBJ_MOVE_LANDED) {
        cur_obj_play_sound_2(SOUND_OBJ_WHOMP_LOWPRIO);
        cur_obj_shake_screen(SHAKE_POS_SMALL);
        o.rawData[oVelY] = 0.0;
        o.rawData[oSubAction]++;
    }
    if (o.rawData[oMoveFlags] & OBJ_MOVE_ON_GROUND)
        o.rawData[oAction] = 6;
}

/// <pygml?v=1.0&h=7f7901d8a>
/// @function	king_whomp_on_ground()
function king_whomp_on_ground() {
    var o = gCurrentObject;

    var pos = Vec3f;
    if (o.rawData[oSubAction] == 0) {
        if (cur_obj_is_mario_ground_pounding_platform()) {
            o.rawData[oHealth]--;
            cur_obj_play_sound_2(SOUND_OBJ2_WHOMP_SOUND_SHORT);
            cur_obj_play_sound_2(SOUND_OBJ_KING_WHOMP_DEATH);
            if (o.rawData[oHealth] == 0)
                o.rawData[oAction] = 8;
            else {
                vec3f_copy_2(pos, o.rawData[oPosX]);
                vec3f_copy_2(o.rawData[oPosX], gMarioObject[0].rawData[oPosX]);
                spawn_mist_particles_variable(0, 0, 100.0);
                spawn_triangle_break_particles(20, 138, 3.0, 4);
                cur_obj_shake_screen(SHAKE_POS_SMALL);
                vec3f_copy_2(o.rawData[oPosX], pos);
            }
            o.rawData[oSubAction]++;
        }
        o.rawData[oWhompShakeVal] = 0;
    } else {
        if (o.rawData[oWhompShakeVal] < 10) {
            if (o.rawData[oWhompShakeVal] % 2)
                o.rawData[oPosY] += 8.0;
            else
                o.rawData[oPosY] -= 8.0;
        } else
            o.rawData[oSubAction] = 10;
        o.rawData[oWhompShakeVal]++;
    }
}

/// <pygml?v=1.0&h=340bd91e2>
/// @function	whomp_on_ground()
function whomp_on_ground() {
    var o = gCurrentObject;

    if (o.rawData[oSubAction] == 0) {
        if (gMarioObject[0].platform == o) {
            if (cur_obj_is_mario_ground_pounding_platform()) {
                o.rawData[oNumLootCoins] = 5;
                obj_spawn_loot_yellow_coins(o, 5, 20.0);
                o.rawData[oAction] = 8;
            } else {
                cur_obj_spawn_loot_coin_at_mario_pos();
                o.rawData[oSubAction]++;
            }
        }
    } else if (!cur_obj_is_mario_on_platform())
        o.rawData[oSubAction] = 0;
}

/// <pygml?v=1.0&h=c30f796d3>
/// @function	whomp_act_6()
function whomp_act_6() {
    var o = gCurrentObject;

    if (o.rawData[oSubAction] != 10) {
        o.rawData[oForwardVel] = 0.0;
        o.rawData[oAngleVelPitch] = 0;
        o.rawData[oAngleVelYaw] = 0;
        o.rawData[oAngleVelRoll] = 0;
        if (o.rawData[oBehParams2ndByte] != 0)
            king_whomp_on_ground();
        else
            whomp_on_ground();
        if (o.rawData[oTimer] > 100 || (gMarioState.action == ACT_SQUISHED && o.rawData[oTimer] > 30))
            o.rawData[oSubAction] = 10;
    } else {
        if (o.rawData[oFaceAnglePitch] > 0) {
            o.rawData[oAngleVelPitch] = -0x200;
            o.rawData[oFaceAnglePitch] += o.rawData[oAngleVelPitch];
        } else {
            o.rawData[oAngleVelPitch] = 0;
            o.rawData[oFaceAnglePitch] = 0;
            if (o.rawData[oBehParams2ndByte] != 0)
                o.rawData[oAction] = 2;
            else
                o.rawData[oAction] = 1;
        }
    }
}

/// <pygml?v=1.0&h=90d14d957>
/// @function	whomp_act_8()
function whomp_act_8() {
    var o = gCurrentObject;

    if (o.rawData[oBehParams2ndByte] != 0) {
        if (cur_obj_update_dialog_with_cutscene(2, 2, CUTSCENE_DIALOG, DIALOG_115)) {
            obj_set_angle(o, 0, 0, 0);
            cur_obj_hide();
            cur_obj_become_intangible();
            spawn_mist_particles_variable(0, 0, 200.0);
            spawn_triangle_break_particles(20, 138, 3.0, 4);
            cur_obj_shake_screen(SHAKE_POS_SMALL);
            o.rawData[oPosY] += 100.0;
            spawn_default_star(180.0, 3880.0, 340.0);
            cur_obj_play_sound_2(SOUND_OBJ_KING_WHOMP_DEATH);
            o.rawData[oAction] = 9;
        }
    } else {
        spawn_mist_particles_variable(0, 0, 100.0);
        spawn_triangle_break_particles(20, 138, 3.0, 4);
        cur_obj_shake_screen(SHAKE_POS_SMALL);
        create_sound_spawner(SOUND_OBJ_THWOMP);
        obj_mark_for_deletion(o);
    }
}

/// <pygml?v=1.0&h=9d71f924c>
/// @function	whomp_act_9()
function whomp_act_9() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] == 60)
        stop_background_music(SEQUENCE_ARGS(4, SEQ_EVENT_BOSS));
}

/// <pygml?v=1.0&h=66194e9d8>
/// @function	bhv_whomp_loop()
function bhv_whomp_loop() {
    var o = gCurrentObject;

    cur_obj_update_floor_and_walls();
    cur_obj_call_action_function(sWhompActions);
    cur_obj_move_standard(-20);
    if (o.rawData[oAction] != 9) {
        if (o.rawData[oBehParams2ndByte] != 0)
            cur_obj_hide_if_mario_far_away_y(2000.0);
        else
            cur_obj_hide_if_mario_far_away_y(1000.0);
        load_object_collision_model();
    }
}

function actor_whomp_acts_init() {
	global.__sWhompActions = [
	    whomp_act_0, whomp_act_1, whomp_act_2, whomp_act_3, whomp_act_4,
	    whomp_act_5, whomp_act_6, whomp_act_7, whomp_act_8, whomp_act_9
	];
	#macro sWhompActions	global.__sWhompActions	
}