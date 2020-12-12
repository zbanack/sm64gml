/// <pygml?v=1.0&h=d6a284201>
/// @function	bhv_blue_coin_switch_loop()
/// @desc		Update function for bhvBlueCoinSwitch.
function bhv_blue_coin_switch_loop() {
    var o = gCurrentObject;

    // The switch's model is 1/3 size.
    cur_obj_scale(3.0);

    switch (o.rawData[oAction]) {
        case (BLUE_COIN_SWITCH_ACT_IDLE):
            // If Mario is on the switch and has ground-pounded,
            // recede and get ready to start ticking.
            if (gMarioObject[0].platform == o) {
                if (gMarioState.action == ACT_GROUND_POUND_LAND) {
                    // Set to BLUE_COIN_SWITCH_ACT_RECEDING
                    o.rawData[oAction]++;

                    // Recede at a rate of 20 units/frame.
                    o.rawData[oVelY] = -20.0;
                    // Set _gravity to 0 so it doesn't accelerate when receding.
                    o.rawData[oGravity] = 0.0;
					

                    cur_obj_play_sound_2(SOUND_GENERAL_SWITCH_DOOR_OPEN);
                }
            }

            // Have collision
            load_object_collision_model();

            break;
        case (BLUE_COIN_SWITCH_ACT_RECEDING):
            // Recede for 6 frames before going invisible and ticking.
            // This is probably an off-by-one error, since the switch is 100 units tall
            // and recedes at 20 units/frame, which means it will fully recede after 5 frames.
            if (o.rawData[oTimer] > 5) {
                cur_obj_hide();

                // Set to BLUE_COIN_SWITCH_ACT_TICKING
                o.rawData[oAction]++;
                // ???
                o.rawData[oPosY] = gMarioObject[0].rawData[oPosY] - 40.0;

                // Spawn particles. There's a function that calls this same function
                // with the same arguments, spawn_mist_particles, why didn't they just call that?
                spawn_mist_particles_variable(0, 0, 46.0);
            } else {
                // Have collision while receding
                load_object_collision_model();
                // Recede
                cur_obj_move_using_fvel_and_gravity();
            }

            break;
        case (BLUE_COIN_SWITCH_ACT_TICKING):
            // Tick faster when the blue coins start blinking
            if (o.rawData[oTimer] < 200) {
                play_sound(SOUND_GENERAL2_SWITCH_TICK_FAST, gDefaultSoundArgs);
            } else {
                play_sound(SOUND_GENERAL2_SWITCH_TICK_SLOW, gDefaultSoundArgs);
            }

            // Delete the switch (which stops the sound) after the last coin is collected,
            // or after the coins unload after the 240-frame timer expires.
            if (cur_obj_nearest_object_with_behavior(Object1.bhvHiddenBlueCoin) == null || o.rawData[oTimer] > 240) {
                obj_mark_for_deletion(o);
            }

            break;
    }
}