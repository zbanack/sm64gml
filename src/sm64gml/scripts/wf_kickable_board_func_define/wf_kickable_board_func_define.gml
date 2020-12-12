/// <pygml?v=1.0&h=1218320c0>
/// @function	check_mario_attacking(sp18)
/// @param		{s32}		sp18
/// @returns	s32
function check_mario_attacking(sp18) {
    var o = gCurrentObject;

    if (obj_check_if_collided_with_object(o, gMarioObject[0])) {
        if (abs_angle_diff(o.rawData[oMoveAngleYaw], gMarioObject[0].rawData[oMoveAngleYaw]) > 0x6000) {
            if (gMarioStates[0].action == ACT_SLIDE_KICK)
                return 1;
            if (gMarioStates[0].action == ACT_PUNCHING)
                return 1;
            if (gMarioStates[0].action == ACT_MOVE_PUNCHING)
                return 1;
            if (gMarioStates[0].action == ACT_SLIDE_KICK_SLIDE)
                return 1;
            if (gMarioStates[0].action == ACT_JUMP_KICK)
                return 2;
            if (gMarioStates[0].action == ACT_WALL_KICK_AIR)
                return 2;
        }
    }
    return 0;
}

/// <pygml?v=1.0&h=181f3afd0>
/// @function	init_kickable_board_rock()
function init_kickable_board_rock() {
    var o = gCurrentObject;

    o.rawData[oKickableBoardF8] = 1600;
    o.rawData[oKickableBoardF4] = 0;
}

/// <pygml?v=1.0&h=5764082dc>
/// @function	bhv_kickable_board_loop()
function bhv_kickable_board_loop() {
    var o = gCurrentObject;

    var sp24;
    switch (o.rawData[oAction]) {
        case (0):
            o.rawData[oFaceAnglePitch] = 0;
            if (check_mario_attacking(0)) {
                init_kickable_board_rock();
                o.rawData[oAction]++;
            }
            load_object_collision_model();
            break;
        case (1):
            o.rawData[oFaceAnglePitch] = 0;
            load_object_collision_model();
            o.rawData[oFaceAnglePitch] = -sins(o.rawData[oKickableBoardF4]) * o.rawData[oKickableBoardF8];
			sp24 = check_mario_attacking(0); 
            if (o.rawData[oTimer] > 30 && sp24) {
                if (gMarioObject[0].rawData[oPosY] > o.rawData[oPosY] + 160.0 && sp24 == 2) {
                    o.rawData[oAction]++;
                    cur_obj_play_sound_2(SOUND_GENERAL_BUTTON_PRESS_2);
                } else
                    o.rawData[oTimer] = 0;
            }
            if (o.rawData[oTimer] != 0) {
                o.rawData[oKickableBoardF8] -= 8;
                if (o.rawData[oKickableBoardF8] < 0)
                    o.rawData[oAction] = 0;
            } else
                init_kickable_board_rock();
            if (!(o.rawData[oKickableBoardF4] & 0x7FFF))
                cur_obj_play_sound_2(SOUND_GENERAL_BUTTON_PRESS_2);
            o.rawData[oKickableBoardF4] += 0x400;
            break;
        case (2):
            cur_obj_become_intangible();
            cur_obj_set_model(MODEL_WF_KICKABLE_BOARD_FELLED);
            o.rawData[oAngleVelPitch] -= 0x80;
            o.rawData[oFaceAnglePitch] += o.rawData[oAngleVelPitch];
            if (o.rawData[oFaceAnglePitch] < -0x4000) {
                o.rawData[oFaceAnglePitch] = -0x4000;
                o.rawData[oAngleVelPitch] = 0;
                o.rawData[oAction]++;
                cur_obj_shake_screen(SHAKE_POS_SMALL);
                cur_obj_play_sound_2(SOUND_GENERAL_UNKNOWN4);
            }
            load_object_collision_model();
            break;
        case (3):
            load_object_collision_model();
            break;
    }
    o.header.gfx.throwMatrix = null;
}
