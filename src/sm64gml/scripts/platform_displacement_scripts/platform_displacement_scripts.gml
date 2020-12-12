function platform_displacement_macros_init() {
globalvar D_8032FEC0;
D_8032FEC0 = 0;

globalvar gMarioPlatform;
gMarioPlatform = null;
boot("platform_displacement_macros_init");
}

/// <pygml?v=1.0&h=dcfc199e2>
/// @function	update_mario_platform()
/// @desc		Determine if Mario is standing on a platform object, meaning
///					that he is  within 4 units of the floor. Set his referenced
///					platform object accordingly.
function update_mario_platform() {
    var _floor = {};
    var unused;
    var marioX;
    var marioY;
    var marioZ;
    var floorHeight;
    var awayFromFloor;

    if (gMarioObject[0] == null) {
        return;
    }

    //! If Mario moves onto a rotating platform in a PU, the find_floor call
    //  will detect the platform and he will end up receiving a large amount
    //  of displacement since he is considered to be far from the platform's
    //  axis of rotation.

    marioX = gMarioObject[0].rawData[oPosX];
    marioY = gMarioObject[0].rawData[oPosY];
    marioZ = gMarioObject[0].rawData[oPosZ];
    floorHeight = find_floor(marioX, marioY, marioZ, _floor);
    _floor = _floor._floor;

    if (abs(marioY - floorHeight) < 4.0) {
        awayFromFloor = 0;
    } else {
        awayFromFloor = 1;
    }

    switch (awayFromFloor) {
        case (1):
            gMarioPlatform = null;
            gMarioObject[0].platform = null;
            break;

        case (0):
            if (_floor != null && _floor.object != null) {
                gMarioPlatform = _floor.object;
                gMarioObject[0].platform = _floor.object;
            } else {
                gMarioPlatform = null;
                gMarioObject[0].platform = null;
            }
            break;
    }
}

/// <pygml?v=1.0&h=934ec47fc>
/// @function	get_mario_pos(Ptr.p_x, Ptr.p_y, Ptr.p_z)
/// @desc		Get Mario's position and store it in x, y, and z.
/// @param		{f32}		Ptr.p_x
/// @param		{f32}		Ptr.p_y
/// @param		{f32}		Ptr.p_z
function get_mario_pos(_x, _y, _z) {
    _x = gMarioState.pos[0];
    _y = gMarioState.pos[1];
    _z = gMarioState.pos[2];

    Ptr.p_x = _x;
    Ptr.p_y = _y;
    Ptr.p_z = _z;
}

/// <pygml?v=1.0&h=eeba18ac4>
/// @function	set_mario_pos(x, y, z)
/// @desc		Set Mario's position.
/// @param		{f32}		x
/// @param		{f32}		y
/// @param		{f32}		z
function set_mario_pos(_x, _y, _z) {
    gMarioState.pos[0] = _x;
    gMarioState.pos[1] = _y;
    gMarioState.pos[2] = _z;
}

/// <pygml?v=1.0&h=7f8dce41a>
/// @function	apply_platform_displacement(isMario, platform)
/// @desc		Apply one frame of platform rotation to Mario or an object
///					using the given  platform. If isMario is 0, use
///					gCurrentObject.
/// @param		{u32}		isMario
/// @param		{struct}	platform
function apply_platform_displacement(isMario, platform) {
    var _x = 0;
    var _y = 0;
    var _z = 0;
    var platformPosX = 0;
    var platformPosY = 0;
    var platformPosZ = 0;
    var currentObjectOffset = Vec3;
    var relativeOffset = Vec3;
    var newObjectOffset = Vec3;
    var rotation = Vec3;
    var unused1;
    var unused2;
    var unused3;
    var displaceMatrix = Mat4;

    rotation[0] = platform.rawData[oAngleVelPitch];
    rotation[1] = platform.rawData[oAngleVelYaw];
    rotation[2] = platform.rawData[oAngleVelRoll];

    if (isMario) {
        D_8032FEC0 = 0;
        get_mario_pos(_x, _y, _z);
		_x = Ptr.p_x;
		_y = Ptr.p_y;
		_z = Ptr.p_z;
    } else {
        _x = gCurrentObject.rawData[oPosX];
        _y = gCurrentObject.rawData[oPosY];
        _z = gCurrentObject.rawData[oPosZ];
    }

    _x += platform.rawData[oVelX];
    _z += platform.rawData[oVelZ];

    if (rotation[0] != 0 || rotation[1] != 0 || rotation[2] != 0) {
        unused1 = rotation[0];
        unused2 = rotation[2];
        unused3 = platform.rawData[oFaceAngleYaw];

        if (isMario) {
            gMarioState.faceAngle[1] += rotation[1];
        }

        platformPosX = platform.rawData[oPosX];
        platformPosY = platform.rawData[oPosY];
        platformPosZ = platform.rawData[oPosZ];

        currentObjectOffset[0] = _x - platformPosX;
        currentObjectOffset[1] = _y - platformPosY;
        currentObjectOffset[2] = _z - platformPosZ;

        rotation[0] = platform.rawData[oFaceAnglePitch] - platform.rawData[oAngleVelPitch]
        rotation[1] = platform.rawData[oFaceAngleYaw] - platform.rawData[oAngleVelYaw];
        rotation[2] = platform.rawData[oFaceAngleRoll] - platform.rawData[oAngleVelRoll];

        mtxf_rotate_zxy_and_translate(displaceMatrix, currentObjectOffset, rotation);
        linear_mtxf_transpose_mul_vec3f(displaceMatrix, relativeOffset, currentObjectOffset);

        rotation[0] = platform.rawData[oFaceAnglePitch];
        rotation[1] = platform.rawData[oFaceAngleYaw];
        rotation[2] = platform.rawData[oFaceAngleRoll];

        mtxf_rotate_zxy_and_translate(displaceMatrix, currentObjectOffset, rotation);
        linear_mtxf_mul_vec3f(displaceMatrix, newObjectOffset, relativeOffset);

        _x = platformPosX + newObjectOffset[0];
        _y = platformPosY + newObjectOffset[1];
        _z = platformPosZ + newObjectOffset[2];
    }

    if (isMario) {
        set_mario_pos(_x, _y, _z);
    } else {
        gCurrentObject.rawData[oPosX] = _x;
        gCurrentObject.rawData[oPosY] = _y;
        gCurrentObject.rawData[oPosZ] = _z;
    }
}

/// <pygml?v=1.0&h=8ba6c1b01>
/// @function	apply_mario_platform_displacement()
/// @desc		If Mario's platform is not null, apply platform
///					displacement.
function apply_mario_platform_displacement() {
    var platform;

    platform = gMarioPlatform;
    if (!(gTimeStopState & TIME_STOP_ACTIVE) && gMarioObject[0] != null && platform != null) {
        apply_platform_displacement(1, platform);
    }
}

/// <pygml?v=1.0&h=c5363054f>
/// @function	clear_mario_platform()
/// @desc		Set Mario's platform to null.
function clear_mario_platform() {
    gMarioPlatform = null;
}
