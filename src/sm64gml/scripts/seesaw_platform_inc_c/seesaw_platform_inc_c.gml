/// <pygml?v=1.0&h=0f8c8abf3>
/// @function	bhv_seesaw_platform_init()
/// @desc		Init function for bhvSeesawPlatform.
function bhv_seesaw_platform_init() {
    var o = gCurrentObject;

    o.collisionData = (sSeesawPlatformCollisionModels[o.rawData[oBehParams2ndByte]]);

    // The S-shaped seesaw platform in BitS is large, so increase its collision
    // distance
    if (o.rawData[oBehParams2ndByte] == 2) {
        o.rawData[oCollisionDistance] = 2000.0;
    }
}

/// <pygml?v=1.0&h=d20d95285>
/// @function	bhv_seesaw_platform_update()
/// @desc		Update function for bhvSeesawPlatform.
function bhv_seesaw_platform_update() {
    var o = gCurrentObject;

    var startPitch = o.rawData[oFaceAnglePitch];
    o.rawData[oFaceAnglePitch] += o.rawData[oSeesawPlatformPitchVel];

    if (abs(o.rawData[oSeesawPlatformPitchVel]) > 10.0) {
        cur_obj_play_sound_1(SOUND_ENV_BOAT_ROCKING1);
    }

    if (gMarioObject[0].platform == o) {
        // Rotate toward mario
        var rotation = o.rawData[oDistanceToMario] * coss(o.rawData[oAngleToMario] - o.rawData[oMoveAngleYaw]);
        var unused;

        // Deceleration is faster than acceleration
        if (o.rawData[oSeesawPlatformPitchVel] * rotation < 0) {
            rotation *= 0.04;
        } else {
            rotation *= 0.02;
        }

        o.rawData[oSeesawPlatformPitchVel] += rotation;
        clamp_f32(o.rawData[oSeesawPlatformPitchVel], -50.0, 50.0);
    } else {
        // Rotate back to 0
        oscillate_toward(
            /* value          */
            o.rawData[oFaceAnglePitch],
            /* vel            */
            o.rawData[oSeesawPlatformPitchVel],
            /* target         */
            0.0,
            /* velCloseToZero */
            6.0,
            /* accel          */
            3.0,
            /* slowdown       */
            3.0);
    }
}

function seesaw_platform_collision_models_init() {
	
	globalvar sSeesawPlatformCollisionModels;
	sSeesawPlatformCollisionModels = [
	    bitdw_seg7_collision_0700F70C, bits_seg7_collision_0701ADD8,  bits_seg7_collision_0701AE5C,
	    bob_seg7_collision_bridge,     bitfs_seg7_collision_07015928, rr_seg7_collision_07029750,
	    rr_seg7_collision_07029858,    vcutm_seg7_collision_0700AC44,
	];

}