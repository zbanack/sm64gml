/// <pygml?v=1.0&h=779ce8bf1>
/// @function	bhv_giant_pole_loop()
/// @desc		Main loop for bhvGiantPole. It is equivalent to
///					bhv_pole_base_loop() except  for the fact that it spawns a
///					yellow sphere at the top of the pole on the  first frame.
function bhv_giant_pole_loop() {
    var o = gCurrentObject;

    var topBall;
    if (o.rawData[oTimer] == 0) {
        topBall = spawn_object(o, MODEL_YELLOW_SPHERE, Object1.bhvYellowBall);
        topBall.rawData[oPosY] += o.hitboxHeight + 50.0;
    }
    bhv_pole_base_loop();
}
