/// <pygml?v=1.0&h=f6b875a03>
/// @function	bhv_orange_number_init()
function bhv_orange_number_init() {
	
	
    var o = gCurrentObject;

    o.rawData[oAnimState] = o.rawData[oBehParams2ndByte];
    o.rawData[oVelY] = 26.0;
}

/// <pygml?v=1.0&h=fc0e16863>
/// @function	bhv_orange_number_loop()
function bhv_orange_number_loop() {
    var o = gCurrentObject;

    var sp1C;
    o.rawData[oPosY] += o.rawData[oVelY];
    o.rawData[oVelY] -= 2.0;
    if (o.rawData[oVelY] < -21.0)
        o.rawData[oVelY] = 14.0;

    if (o.rawData[oTimer] == 35) {
        sp1C = spawn_object(o, MODEL_SPARKLES, Object1.bhvGoldenCoinSparkles);
        sp1C.rawData[oPosY] -= 30.0;
        o.activeFlags = ACTIVE_FLAG_DEACTIVATED;
    }
}
