/// <pygml?v=1.0&h=c06600aa3>
/// @function	bhv_tower_door_loop()
function bhv_tower_door_loop() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] == 0)
        o.rawData[oMoveAngleYaw] -= 0x4000;
    if (check_mario_attacking(0)) {
        obj_explode_and_spawn_coins(80.0, 0);
        create_sound_spawner(SOUND_GENERAL_WALL_EXPLOSION);
    }
}
