/// <pygml?v=1.0&h=d302692a5>
/// @function	bhv_purple_switch_loop()
/// @desc		Set the switch's model and scale. If Mario is standing near
///					the          switch's middle section, transition to the
///					pressed state.
function bhv_purple_switch_loop() {
    var o = gCurrentObject;

    var unused;
    switch (o.rawData[oAction]) {

        case (PURPLE_SWITCH_IDLE):
            cur_obj_set_model(MODEL_PURPLE_SWITCH);
            cur_obj_scale(1.5);
            if (gMarioObject[0].platform == o && !(gMarioStates[0].action & MARIO_UNKNOWN_13)) {
                if (lateral_dist_between_objects(o, gMarioObject[0]) < 127.5) {
                    o.rawData[oAction] = PURPLE_SWITCH_PRESSED;
                }
            }
            break;
            /**
             * Collapse the switch downward, play a sound, and shake the screen.
             * Immediately transition to the ticking state.
             */
        case (PURPLE_SWITCH_PRESSED):
            cur_obj_scale_over_time(2, 3, 1.5, 0.2);
            if (o.rawData[oTimer] == 3) {
                cur_obj_play_sound_2(SOUND_GENERAL2_PURPLE_SWITCH);
                o.rawData[oAction] = PURPLE_SWITCH_TICKING;
                cur_obj_shake_screen(SHAKE_POS_SMALL);
            }
            break;
            /**
             * Play a continuous ticking sound that gets faster when time is almost
             * up. When time is up, move to a waiting-while-pressed state.
             */
        case (PURPLE_SWITCH_TICKING):
            if (o.rawData[oBehParams2ndByte] != 0) {
                if (o.rawData[oBehParams2ndByte] == 1 && gMarioObject[0].platform != o) {
                    o.rawData[oAction]++;
                } else {
                    if (o.rawData[oTimer] < 360) {
                        play_sound(SOUND_GENERAL2_SWITCH_TICK_FAST, gDefaultSoundArgs);
                    } else {
                        play_sound(SOUND_GENERAL2_SWITCH_TICK_SLOW, gDefaultSoundArgs);
                    }
                    if (o.rawData[oTimer] > 400) {
                        o.rawData[oAction] = PURPLE_SWITCH_WAIT_FOR_MARIO_TO_GET_OFF;
                    }
                }
            }
            break;
            /**
             * Make the switch look unpressed again, and transition back to the
             * idle state.
             */
        case (PURPLE_SWITCH_UNPRESSED):
            cur_obj_scale_over_time(2, 3, 0.2, 1.5);
            if (o.rawData[oTimer] == 3) {
                o.rawData[oAction] = PURPLE_SWITCH_IDLE;
            }
            break;
            /**
             * Mario is standing on the switch, but time has expired. Wait for
             * him to get off the switch, and when he does so, transition to the
             * unpressed state.
             */
        case (PURPLE_SWITCH_WAIT_FOR_MARIO_TO_GET_OFF):
            if (!cur_obj_is_mario_on_platform()) {
                o.rawData[oAction] = PURPLE_SWITCH_UNPRESSED;
            }
            break;
    }
}
