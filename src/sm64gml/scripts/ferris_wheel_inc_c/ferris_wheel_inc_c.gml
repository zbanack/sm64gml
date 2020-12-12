/// <pygml?v=1.0&h=c739ee107>
/// @function	bhv_ferris_wheel_axle_init()
/// @desc		Init function for bhvFerrisWheelAxle.  It doesn't have an
///					update function, but it increments its roll in its  behavior
///					script.
function bhv_ferris_wheel_axle_init() {
    var o = gCurrentObject;

    var platform;
    var i;

    o.collisionData = (sFerrisWheelProperties[o.rawData[oBehParams2ndByte]].axleCollision);

    for (i = 0; i < 4; i++) {
        platform = spawn_object_relative(i, 0, 0, 0, o,
            sFerrisWheelProperties[o.rawData[oBehParams2ndByte]].platformModel,
            Object1.bhvFerrisWheelPlatform);

        if (platform != null) {
            platform.collisionData =
                (sFerrisWheelProperties[o.rawData[oBehParams2ndByte]].platformCollision);
        }
    }
}


/// <pygml?v=1.0&h=b83a7ce0c>
/// @function	bhv_ferris_wheel_platform_update()
/// @desc		Update function for bhvFerrisWheelPlatform.  Position self
///					relative to parent using the parent's roll.
function bhv_ferris_wheel_platform_update() {
    var o = gCurrentObject;

    var offsetXZ;
    var offsetAngle;

    obj_perform_position_op(POS_OP_SAVE_POSITION);

    offsetAngle = o.parentObj.rawData[oFaceAngleRoll] + o.rawData[oBehParams2ndByte] * 0x4000;
    offsetXZ = 400.0 * coss(offsetAngle);

    o.rawData[oPosX] = o.parentObj.rawData[oPosX] + offsetXZ * sins(o.parentObj.rawData[oMoveAngleYaw]) +
        300.0 * coss(o.parentObj.rawData[oMoveAngleYaw]);

    o.rawData[oPosY] = o.parentObj.rawData[oPosY] + 400.0 * sins(offsetAngle);

    o.rawData[oPosZ] = o.parentObj.rawData[oPosZ] + offsetXZ * coss(o.parentObj.rawData[oMoveAngleYaw]) +
        300.0 * sins(o.parentObj.rawData[oMoveAngleYaw]);

    obj_perform_position_op(POS_OP_COMPUTE_VELOCITY);
}

function bhv_ferris_wheel_collision_models_init() {
	globalvar sFerrisWheelProperties;
	sFerrisWheelProperties = [
		new FerrisWheelProperties(bits_seg7_collision_0701ACAC, bits_seg7_collision_0701AC28, MODEL_BITS_BLUE_PLATFORM ),
		new FerrisWheelProperties(bitdw_seg7_collision_0700F7F0, bitdw_seg7_collision_0700F898, MODEL_BITDW_BLUE_PLATFORM ),
	];
	
}

function FerrisWheelProperties(_axleCollision, _platformCollision, _platformModel) constructor {
	axleCollision = _axleCollision;
	platformCollision = _platformCollision;
	platformModel = _platformModel;
}