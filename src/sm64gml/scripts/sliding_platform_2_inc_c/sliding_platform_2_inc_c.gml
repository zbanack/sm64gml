/// <pygml?v=1.0&h=4a690fa22>
/// @function	bhv_sliding_plat_2_init()
function bhv_sliding_plat_2_init() {
    var o = gCurrentObject;

    var val04;

    val04 = ((o.rawData[oBehParams] >> 16) & 0x0380) >> 7;
    o.collisionData = (D_80331A24[val04]);
    o.rawData[oBackAndForthPlatformUnkF8] = 50.0 * ((o.rawData[oBehParams] >> 16) & 0x003F);

    if (val04 < 5 || val04 > 6) {
        o.rawData[oBackAndForthPlatformUnk100] = 15.0;
        if ((o.rawData[oBehParams] >> 16) & 0x0040) {
            o.rawData[oMoveAngleYaw] += 0x8000;
        }
    } else {
        o.rawData[oBackAndForthPlatformUnk100] = 10.0;
        if ((o.rawData[oBehParams] >> 16) & 0x0040) {
            o.rawData[oBackAndForthPlatformUnkF4] = -1.0;
        } else {
            o.rawData[oBackAndForthPlatformUnkF4] = 1.0;
        }
    }
}

/// <pygml?v=1.0&h=58cfaefc8>
/// @function	bhv_sliding_plat_2_loop()
function bhv_sliding_plat_2_loop() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] > 10) {
        o.rawData[oBackAndForthPlatformUnkFC] += o.rawData[oBackAndForthPlatformUnk100];
        if (clamp_f32(o.rawData[oBackAndForthPlatformUnkFC], -o.rawData[oBackAndForthPlatformUnkF8], 0.0)) {
            o.rawData[oBackAndForthPlatformUnk100] = -o.rawData[oBackAndForthPlatformUnk100];
            o.rawData[oTimer] = 0;
        }
    }

    obj_perform_position_op(0);

    if (o.rawData[oBackAndForthPlatformUnkF4] != 0.0) {
        o.rawData[oPosY] = o.rawData[oHomeY] + o.rawData[oBackAndForthPlatformUnkFC] * o.rawData[oBackAndForthPlatformUnkF4];
    } else {
        obj_set_dist_from_home(o.rawData[oBackAndForthPlatformUnkFC]);
    }

    obj_perform_position_op(1);
}

function sliding_platform_2_collision_models_init() {
	globalvar D_80331A24;
	D_80331A24 = [
	    bits_seg7_collision_0701A9A0,
	    bits_seg7_collision_0701AA0C,
	    bitfs_seg7_collision_07015714,
	    bitfs_seg7_collision_07015768,
	    rr_seg7_collision_070295F8,
	    rr_seg7_collision_0702967C,
	    null,
	    bitdw_seg7_collision_0700F688,
	]; 
}