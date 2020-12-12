/// <pygml?v=1.0&h=d6c2c63ea>
/// @function	bhv_wf_breakable_wall_loop()
function bhv_wf_breakable_wall_loop() {
    var o = gCurrentObject;

    if (gMarioStates[0].action == ACT_SHOT_FROM_CANNON) {
        cur_obj_become_tangible();
        if (obj_check_if_collided_with_object(o, gMarioObject[0])) {
            if (cur_obj_has_behavior(Object1.bhvWfBreakableWallRight))
                play_puzzle_jingle();
            create_sound_spawner(SOUND_GENERAL_WALL_EXPLOSION);
            o.rawData[oInteractType] = 8;
            o.rawData[oDamageOrCoinValue] = 1;
            obj_explode_and_spawn_coins(80.0, 0);
        }
    } else
        cur_obj_become_intangible();
}
