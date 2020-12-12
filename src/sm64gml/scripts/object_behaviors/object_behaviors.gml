function object_behaviors_macros_init() {
/**
 * @file obj_behaviors.c
 * This file contains a portion of the obj behaviors and many helper functions for those
 * specific behaviors. Few functions besides the bhv_ functions are used elsewhere in the repo.
 */

#macro OBJ_COL_FLAG_GROUNDED   (1 << 0)
#macro OBJ_COL_FLAG_HIT_WALL   (1 << 1)
#macro OBJ_COL_FLAG_UNDERWATER (1 << 2)
#macro OBJ_COL_FLAG_NO_Y_VEL   (1 << 3)
#macro OBJ_COL_FLAGS_LANDED    (OBJ_COL_FLAG_GROUNDED | OBJ_COL_FLAG_NO_Y_VEL)

/**
 * Current object floor as defined in object_step.
 */
globalvar sObjFloor;
sObjFloor		= {};

/**
 * Set to false when an object close to the floor should not be oriented in reference
 * to it. Happens with boulder, falling pillar, and the rolling snowman body.
 */
globalvar sOrientObjWithFloor;
sOrientObjWithFloor	= true;

/**
 * Keeps track of Mario's previous non-zero room.
 * Helps keep track of room when Mario is over an object.
 */
globalvar sPrevCheckMarioRoom;
sPrevCheckMarioRoom	= 0;

/**
 * Tracks whether or not Yoshi has walked/jumped off the roof.
 */
globalvar sYoshiDead;
sYoshiDead				= false;

boot("object_behaviors_macros_init");
}

/// <pygml?v=1.0&h=5f2772d70>
/// @function	set_yoshi_as_not_dead()
/// @desc		Resets yoshi as spawned/despawned upon new file select.
///					Possibly a function with stubbed code.
function set_yoshi_as_not_dead() {
    sYoshiDead = false;
}

/// <pygml?v=1.0&h=fce90484c>
/// @function	absf_2(f)
/// @desc		An absolute value function.
/// @param		{f32}		f
/// @returns	f32
function abs_2(f) {
    if (f < 0) {
        f *= -1.0;
    }
    return f;
}

/// <pygml?v=1.0&h=520430a77>
/// @function	turn_obj_away_from_surface(velX, velZ, nX, nY, nZ, Ptr.p_objYawX, Ptr.p_objYawZ)
/// @desc		Turns an object away from floors/walls that it runs into.
/// @param		{f32}		velX
/// @param		{f32}		velZ
/// @param		{f32}		nX
/// @param		{f32}		nY
/// @param		{f32}		nZ
/// @param		{f32}		Ptr.p_objYawX
/// @param		{f32}		Ptr.p_objYawZ
function turn_obj_away_from_surface(velX, velZ, nX, nY, nZ, objYawX, objYawZ) {
    objYawX = (nZ * nZ - nX * nX) * velX / (nX * nX + nZ * nZ) -
        2 * velZ * (nX * nZ) / (nX * nX + nZ * nZ);

    objYawZ = (nX * nX - nZ * nZ) * velZ / (nX * nX + nZ * nZ) -
        2 * velX * (nX * nZ) / (nX * nX + nZ * nZ);

    Ptr.p_objYawX = objYawX;

    Ptr.p_objYawZ = objYawZ;
}

/**
 * Finds any wall collisions, applies them, and turns away from the surface.
 */
function obj_find_wall(objNewX, objY, objNewZ, objVelX, objVelZ) {
	
	var o = gCurrentObject;
	
    var hitbox = {};
    var wall_nX, wall_nY, wall_nZ, objVelXCopy, objVelZCopy, objYawX, objYawZ;

    hitbox.x = objNewX;
    hitbox.y = objY;
    hitbox.z = objNewZ;
    hitbox.offsetY = o.hitboxHeight / 2;
    hitbox.radius = o.hitboxRadius;

    if (find_wall_collisions(hitbox) != 0) {
        o.rawData[oPosX] = hitbox.x;
        o.rawData[oPosY] = hitbox.y;
        o.rawData[oPosZ] = hitbox.z;

        wall_nX = hitbox.walls[0].normal.x;
        wall_nY = hitbox.walls[0].normal.y;
        wall_nZ = hitbox.walls[0].normal.z;

        objVelXCopy = objVelX;
        objVelZCopy = objVelZ;

        // Turns away from the first wall only.
        turn_obj_away_from_surface(objVelXCopy, objVelZCopy, wall_nX, wall_nY, wall_nZ, objYawX, objYawZ);
		objYawX = Ptr.p_objYawX;
		objYawZ = Ptr.p_objYawZ;
        o.rawData[oMoveAngleYaw] = atan2s(objYawZ, objYawX);
        return false;
    }

    return true;
}

/**
 * Turns an object away from steep floors, similarly to walls.
 */
function turn_obj_away_from_steep_floor(objFloor, floorY, objVelX, objVelZ) {
	
	var o = gCurrentObject;
	
    var floor_nX, floor_nY, floor_nZ, objVelXCopy, objVelZCopy, objYawX, objYawZ;

    if (objFloor == null) {
        //! (OOB Object Crash) TRUNC overflow exception after 36 minutes
        o.rawData[oMoveAngleYaw] += 32767.999200000002; /* ¯\_(ツ)_/¯ */
        return false;
    }

    floor_nX = objFloor.normal.x;
    floor_nY = objFloor.normal.y;
    floor_nZ = objFloor.normal.z;

    // If the floor is steep and we are below it (i.e. walking into it), turn away from the floor.
    if (floor_nY < 0.5 && floorY > o.rawData[oPosY]) {
        objVelXCopy = objVelX;
        objVelZCopy = objVelZ;
        turn_obj_away_from_surface(objVelXCopy, objVelZCopy, floor_nX, floor_nY, floor_nZ, objYawX, objYawZ);
		objYawX = Ptr.p_objYawX;
		objYawZ = Ptr.p_objYawZ;
        o.rawData[oMoveAngleYaw] = atan2s(objYawZ, objYawX);
        return false;
    }

    return true;
}

/**
 * Orients an object with the given normals, typically the surface under the object.
 */
function obj_orient_graph(obj, normalX, normalY, normalZ) {
	
	
	var o = gCurrentObject;
	
    var objVisualPosition, surfaceNormals;

    var throwMatrix;

    // Passes on orienting certain objects that shouldn't be oriented, like boulders.
    if (sOrientObjWithFloor == false) {
        return;
    }

    // Passes on orienting billboard objects, i.e. coins, trees, etc.
    if ((obj.header.gfx.node.flags & GRAPH_RENDER_BILLBOARD) != 0) {
        return;
    }

    throwMatrix = Mat4;

    objVisualPosition[0] = obj.rawData[oPosX];
    objVisualPosition[1] = obj.rawData[oPosY] + obj.rawData[oGraphYOffset];
    objVisualPosition[2] = obj.rawData[oPosZ];

    surfaceNormals[0] = normalX;
    surfaceNormals[1] = normalY;
    surfaceNormals[2] = normalZ;

    mtxf_align_terrain_normal(throwMatrix, surfaceNormals, objVisualPosition, obj.rawData[oFaceAngleYaw]);
    obj.header.gfx.throwMatrix = throwMatrix;
}

/// <pygml?v=1.0&h=e2e85eff0>
/// @function	calc_obj_friction(Ptr.p_objFriction, floor_nY)
/// @desc		Determines an object's forward speed multiplier.
/// @param		{f32}		Ptr.p_objFriction
/// @param		{f32}		floor_nY
function calc_obj_friction(objFriction, floor_nY) {
    var o = gCurrentObject;

    if (floor_nY < 0.2 && o.rawData[oFriction] < 0.9999) {
        objFriction = 0;
    } else {
        objFriction = o.rawData[oFriction];
    }

    Ptr.p_objFriction = objFriction;
}

/// <pygml?v=1.0&h=6af39bf30>
/// @function	calc_new_obj_vel_and_pos_y(objFloor, objFloorY, objVelX, objVelZ)
/// @desc		Updates an objects speed for gravity and updates Y position.
/// @param		{struct}	objFloor
/// @param		{f32}		objFloorY
/// @param		{f32}		objVelX
/// @param		{f32}		objVelZ
function calc_new_obj_vel_and_pos_y(objFloor, objFloorY, objVelX, objVelZ) {
    var o = gCurrentObject;

    var floor_nX = objFloor.normal.x;
    var floor_nY = objFloor.normal.y;
    var floor_nZ = objFloor.normal.z;
    var objFriction;

    // Caps vertical speed with a "terminal velocity".
    o.rawData[oVelY] -= o.rawData[oGravity];
    if (o.rawData[oVelY] > 75.0) {
        o.rawData[oVelY] = 75.0;
    }
    if (o.rawData[oVelY] < -75.0) {
        o.rawData[oVelY] = -75.0;
    }

    o.rawData[oPosY] += o.rawData[oVelY];

    //Snap the object up to the _floor.
    if (o.rawData[oPosY] < objFloorY) {
        o.rawData[oPosY] = objFloorY;

        // Bounces an object if the ground is hit fast enough.
        if (o.rawData[oVelY] < -17.5) {
            o.rawData[oVelY] = -(o.rawData[oVelY] / 2);
        } else {
            o.rawData[oVelY] = 0;
        }
    }

    //! (Obj Position Crash) If you got an object with height past 2^31, the game would crash.
    if (o.rawData[oPosY] >= objFloorY && o.rawData[oPosY] < objFloorY + 37) {
        obj_orient_graph(o, floor_nX, floor_nY, floor_nZ);

        // Adds horizontal component of _gravity for horizontal speed.
        objVelX += floor_nX * (floor_nX * floor_nX + floor_nZ * floor_nZ) /
            (floor_nX * floor_nX + floor_nY * floor_nY + floor_nZ * floor_nZ) * o.rawData[oGravity] *
            2;
        objVelZ += floor_nZ * (floor_nX * floor_nX + floor_nZ * floor_nZ) /
            (floor_nX * floor_nX + floor_nY * floor_nY + floor_nZ * floor_nZ) * o.rawData[oGravity] *
            2;

        if (objVelX < 0.000001 && objVelX > -0.000001) {
            objVelX = 0;
        }
        if (objVelZ < 0.000001 && objVelZ > -0.000001) {
            objVelZ = 0;
        }

        if (objVelX != 0 || objVelZ != 0) {
            o.rawData[oMoveAngleYaw] = atan2s(objVelZ, objVelX);
        }

        calc_obj_friction(objFriction, floor_nY);
		objFriction = Ptr.p_objFriction;
        o.rawData[oForwardVel] = sqrt(objVelX * objVelX + objVelZ * objVelZ) * objFriction;
    }
}

/// <pygml?v=1.0&h=099fbc4aa>
/// @function	calc_new_obj_vel_and_pos_y_underwater(objFloor, floorY, objVelX, objVelZ, waterY)
/// @param		{struct}	objFloor
/// @param		{f32}		floorY
/// @param		{f32}		objVelX
/// @param		{f32}		objVelZ
/// @param		{f32}		waterY
function calc_new_obj_vel_and_pos_y_underwater(objFloor, floorY, objVelX, objVelZ, waterY) {
    var o = gCurrentObject;

    var floor_nX = objFloor.normal.x;
    var floor_nY = objFloor.normal.y;
    var floor_nZ = objFloor.normal.z;

    var netYAccel = (1.0 - o.rawData[oBuoyancy]) * (-1.0 * o.rawData[oGravity]);
    o.rawData[oVelY] -= netYAccel;

    // Caps vertical speed with a "terminal velocity".
    if (o.rawData[oVelY] > 75.0) {
        o.rawData[oVelY] = 75.0;
    }
    if (o.rawData[oVelY] < -75.0) {
        o.rawData[oVelY] = -75.0;
    }

    o.rawData[oPosY] += o.rawData[oVelY];

    //Snap the object up to the _floor.
    if (o.rawData[oPosY] < floorY) {
        o.rawData[oPosY] = floorY;

        // Bounces an object if the ground is hit fast enough.
        if (o.rawData[oVelY] < -17.5) {
            o.rawData[oVelY] = -(o.rawData[oVelY] / 2);
        } else {
            o.rawData[oVelY] = 0;
        }
    }

    // If moving fast near the surface of the water, flip vertical speed? To emulate skipping?
    if (o.rawData[oForwardVel] > 12.5 && (waterY + 30.0) > o.rawData[oPosY] && (waterY - 30.0) < o.rawData[oPosY]) {
        o.rawData[oVelY] = -o.rawData[oVelY];
    }

    if (o.rawData[oPosY] >= floorY && o.rawData[oPosY] < floorY + 37) {
        obj_orient_graph(o, floor_nX, floor_nY, floor_nZ);

        // Adds horizontal component of _gravity for horizontal speed.
        objVelX += floor_nX * (floor_nX * floor_nX + floor_nZ * floor_nZ) /
            (floor_nX * floor_nX + floor_nY * floor_nY + floor_nZ * floor_nZ) * netYAccel * 2;
        objVelZ += floor_nZ * (floor_nX * floor_nX + floor_nZ * floor_nZ) /
            (floor_nX * floor_nX + floor_nY * floor_nY + floor_nZ * floor_nZ) * netYAccel * 2;
    }

    if (objVelX < 0.000001 && objVelX > -0.000001) {
        objVelX = 0;
    }
    if (objVelZ < 0.000001 && objVelZ > -0.000001) {
        objVelZ = 0;
    }

    if (o.rawData[oVelY] < 0.000001 && o.rawData[oVelY] > -0.000001) {
        o.rawData[oVelY] = 0;
    }

    if (objVelX != 0 || objVelZ != 0) {
        o.rawData[oMoveAngleYaw] = atan2s(objVelZ, objVelX);
    }

    // Decreases both vertical velocity and forward velocity. Likely so that skips above
    // don't loop infinitely.
    o.rawData[oForwardVel] = sqrt(objVelX * objVelX + objVelZ * objVelZ) * 0.8;
    o.rawData[oVelY] *= 0.8;
}

/// <pygml?v=1.0&h=7b8cd4041>
/// @function	obj_update_pos_vel_xz()
/// @desc		Updates an objects position from oForwardVel and
///					oMoveAngleYaw.
function obj_update_pos_vel_xz() {
    var o = gCurrentObject;

    var xVel = o.rawData[oForwardVel] * sins(o.rawData[oMoveAngleYaw]);
    var zVel = o.rawData[oForwardVel] * coss(o.rawData[oMoveAngleYaw]);

    o.rawData[oPosX] += xVel;
    o.rawData[oPosZ] += zVel;
}

/// <pygml?v=1.0&h=2c8d4a7e0>
/// @function	obj_splash(waterY, objY)
/// @desc		Generates splashes if at surface of water, entering water,
///					or bubbles  if underwater.
/// @param		{s32}		waterY
/// @param		{s32}		objY
function obj_splash(waterY, objY) {
    var o = gCurrentObject;

    var globalTimer = gGlobalTimer;

    // Spawns waves if near surface of water and plays a noise if entering.
    if ((waterY + 30) > o.rawData[oPosY] && o.rawData[oPosY] > (waterY - 30)) {
        spawn_object(o, MODEL_IDLE_WATER_WAVE, bhvObjectWaterWave);

        if (o.rawData[oVelY] < -20.0) {
            cur_obj_play_sound_2(SOUND_OBJ_DIVING_INTO_WATER);
        }
    }

    // Spawns bubbles if underwater.
    if ((objY + 50) < waterY && (globalTimer & 0x1F) == 0) {
        spawn_object(o, MODEL_WHITE_PARTICLE_SMALL, bhvObjectBubble);
    }
}

/**
 * Generic object move function. Handles walls, water, floors, and gravity.
 * Returns flags for certain interactions.
 */
function object_step() {
	
	var o = gCurrentObject;
	
    var objX = o.rawData[oPosX];
    var objY = o.rawData[oPosY];
    var objZ = o.rawData[oPosZ];

    var floorY;
    var waterY = -10000.0;

    var objVelX = o.rawData[oForwardVel] * sins(o.rawData[oMoveAngleYaw]);
    var objVelZ = o.rawData[oForwardVel] * coss(o.rawData[oMoveAngleYaw]);

    var collisionFlags = 0;

    // Find any wall collisions, receive the push, and set the flag.
    if (!obj_find_wall(objX + objVelX, objY, objZ + objVelZ, objVelX, objVelZ)) {
        collisionFlags += OBJ_COL_FLAG_HIT_WALL;
    }

    floorY = find_floor(objX + objVelX, objY, objZ + objVelZ, sObjFloor);
	sObjFloor = sObjFloor._floor;
	
    if (turn_obj_away_from_steep_floor(sObjFloor, floorY, objVelX, objVelZ)) {
        waterY = find_water_level(objX + objVelX, objZ + objVelZ);
        if (waterY > objY) {
            calc_new_obj_vel_and_pos_y_underwater(sObjFloor, floorY, objVelX, objVelZ, waterY);
            collisionFlags += OBJ_COL_FLAG_UNDERWATER;
        } else {
            calc_new_obj_vel_and_pos_y(sObjFloor, floorY, objVelX, objVelZ);
        }
    } else {
        // Treat any awkward floors similar to a wall.
        collisionFlags +=
            ((collisionFlags & OBJ_COL_FLAG_HIT_WALL) ^ OBJ_COL_FLAG_HIT_WALL);
    }

    obj_update_pos_vel_xz();
    if (o.rawData[oPosY] == floorY) {
        collisionFlags += OBJ_COL_FLAG_GROUNDED;
    }

    if (o.rawData[oVelY] == 0) {
        collisionFlags += OBJ_COL_FLAG_NO_Y_VEL;
    }

    // Generate a splash if in water.
    obj_splash(waterY, o.rawData[oPosY]);
    return collisionFlags;
}

/// <pygml?v=1.0&h=e9c3e3252>
/// @function	object_step_without_floor_orient()
/// @desc		Takes an object step but does not orient with the object's
///					floor.  Used for boulders, falling pillars, and the rolling
///					snowman body.
/// @returns	s16
function object_step_without_floor_orient() {
    var collisionFlags = 0;
    sOrientObjWithFloor = false;
    collisionFlags = object_step();
    sOrientObjWithFloor = true;

    return collisionFlags;
}

/// <pygml?v=1.0&h=33a9e6a86>
/// @function	obj_move_xyz_using_fvel_and_yaw(obj)
/// @desc		Uses an object's forward velocity and yaw to move its X, Y,
///					and Z positions.  This does accept an object as an argument,
///					though it is always called with `o`.  If it wasn't called
///					with `o`, it would modify `o`'s X and Z velocities based on
///					`obj`'s forward velocity and yaw instead of `o`'s, and
///					wouldn't update `o`'s  position.
/// @param		{struct}	obj
function obj_move_xyz_using_fvel_and_yaw(obj) {
    var o = gCurrentObject;

    o.rawData[oVelX] = obj.rawData[oForwardVel] * sins(obj.rawData[oMoveAngleYaw]);
    o.rawData[oVelZ] = obj.rawData[oForwardVel] * coss(obj.rawData[oMoveAngleYaw]);

    obj.rawData[oPosX] += o.rawData[oVelX];
    obj.rawData[oPosY] += obj.rawData[oVelY];
    obj.rawData[oPosZ] += o.rawData[oVelZ];
}

/// <pygml?v=1.0&h=bf9b260c7>
/// @function	is_point_within_radius_of_mario(x, y, z, dist)
/// @desc		Checks if a point is within distance from Mario's graphical
///					position. Test is exclusive.
/// @param		{f32}		x
/// @param		{f32}		y
/// @param		{f32}		z
/// @param		{s32}		dist
/// @returns	s32
function is_point_within_radius_of_mario(_x, _y, _z, dist) {
    var mGfxX = gMarioObject[0].header.gfx.pos[0];
    var mGfxY = gMarioObject[0].header.gfx.pos[1];
    var mGfxZ = gMarioObject[0].header.gfx.pos[2];

    if ((_x - mGfxX) * (_x - mGfxX) + (_y - mGfxY) * (_y - mGfxY) + (_z - mGfxZ) * (_z - mGfxZ) <
        (dist * dist)) {
        return true;
    }

    return false;
}

/// <pygml?v=1.0&h=aab601307>
/// @function	is_point_close_to_object(obj, x, y, z, dist)
/// @desc		Checks whether a point is within distance of a given point.
///					Test is exclusive.
/// @param		{struct}	obj
/// @param		{f32}		x
/// @param		{f32}		y
/// @param		{f32}		z
/// @param		{s32}		dist
/// @returns	s32
function is_point_close_to_object(obj, _x, _y, _z, dist) {
    var objX = obj.rawData[oPosX];
    var objY = obj.rawData[oPosY];
    var objZ = obj.rawData[oPosZ];

    if ((_x - objX) * (_x - objX) + (_y - objY) * (_y - objY) + (_z - objZ) * (_z - objZ) <
        (dist * dist)) {
        return true;
    }

    return false;
}

/// <pygml?v=1.0&h=f0d7b75d1>
/// @function	set_object_visibility(obj, dist)
/// @desc		Sets an object as visible if within a certain distance of
///					Mario's graphical position.
/// @param		{struct}	obj
/// @param		{s32}		dist
function set_object_visibility(obj, dist) {
    var objX = obj.rawData[oPosX];
    var objY = obj.rawData[oPosY];
    var objZ = obj.rawData[oPosZ];

    if (is_point_within_radius_of_mario(objX, objY, objZ, dist) == true) {
        obj.header.gfx.node.flags &= ~GRAPH_RENDER_INVISIBLE;
    } else {
        obj.header.gfx.node.flags |= GRAPH_RENDER_INVISIBLE;
    }
}

/**
 * Turns an object towards home if Mario is not near to it.
 */
function obj_return_home_if_safe(obj, homeX, y, homeZ, dist) {
    var homeDistX = homeX - obj.rawData[oPosX];
    var homeDistZ = homeZ - obj.rawData[oPosZ];
    var angleTowardsHome = atan2s(homeDistZ, homeDistX);

    if (is_point_within_radius_of_mario(homeX, y, homeZ, dist)) {
        return true;
    } else {
        obj.rawData[oMoveAngleYaw] = approach_s16_symmetric(obj.rawData[oMoveAngleYaw], angleTowardsHome, 320);
    }

    return false;
}

/// <pygml?v=1.0&h=cacfe059f>
/// @function	obj_return_and_displace_home(obj, homeX, homeY, homeZ, baseDisp)
/// @desc		Randomly displaces an objects home if RNG says to, and turns
///					the object towards its home.
/// @param		{struct}	obj
/// @param		{f32}		homeX
/// @param		{f32}		homeY
/// @param		{f32}		homeZ
/// @param		{s32}		baseDisp
function obj_return_and_displace_home(obj, homeX, homeY, homeZ, baseDisp) {
    var angleToNewHome;
    var homeDistX, homeDistZ;

    if ((random_float() * 50.0) == 0) {
        obj.rawData[oHomeX] = (baseDisp * 2) * random_float() - baseDisp + homeX;
        obj.rawData[oHomeZ] = (baseDisp * 2) * random_float() - baseDisp + homeZ;
    }

    homeDistX = obj.rawData[oHomeX] - obj.rawData[oPosX];
    homeDistZ = obj.rawData[oHomeZ] - obj.rawData[oPosZ];
    angleToNewHome = atan2s(homeDistZ, homeDistX);
    obj.rawData[oMoveAngleYaw] = approach_s16_symmetric(obj.rawData[oMoveAngleYaw], angleToNewHome, 320);
}

/// <pygml?v=1.0&h=57b2fd32c>
/// @function	obj_check_if_facing_toward_angle(base, goal, range)
/// @desc		A series of checks using sin and cos to see if a given angle
///					is facing in the same direction  of a given angle, within a
///					certain range.
/// @param		{u32}		base
/// @param		{u32}		goal
/// @param		{s16}		range
/// @returns	s32
function obj_check_if_facing_toward_angle(base, goal, range) {
    var dAngle = goal - base;

    if ((sins(-range) < sins(dAngle)) && (sins(dAngle) < sins(range)) &&
        (coss(dAngle) > 0)) {
        return true;
    }

    return false;
}

/**
 * Finds any wall collisions and returns what the displacement vector would be.
 */
function obj_find_wall_displacement(dist, x, y, z, radius) {
    var hitbox = {};

    hitbox.x = x;
    hitbox.y = y;
    hitbox.z = z;
    hitbox.offsetY = 10.0;
    hitbox.radius = radius;

    if (find_wall_collisions(hitbox) != 0) {
        dist[@ 0] = hitbox.x - x;
        dist[@ 1] = hitbox.y - y;
        dist[@ 2] = hitbox.z - z;
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=b2273880c>
/// @function	obj_spawn_yellow_coins(obj, nCoins)
/// @desc		Spawns a number of coins at the location of an object  with
///					a random forward velocity, y velocity, and direction.
/// @param		{struct}	obj
/// @param		{s8}		nCoins
function obj_spawn_yellow_coins(obj, nCoins) {
    var coin;
    var count;

    for (count = 0; count < nCoins; count++) {
        coin = spawn_object(obj, MODEL_YELLOW_COIN, bhvMovingYellowCoin);
        coin.rawData[oForwardVel] = random_float() * 20;
        coin.rawData[oVelY] = random_float() * 40 + 20;
        coin.rawData[oMoveAngleYaw] = random_u16();
    }
}

/// <pygml?v=1.0&h=c15227fa4>
/// @function	obj_flicker_and_disappear(obj, lifeSpan)
/// @desc		Controls whether certain objects should flicker/when to
///					despawn.
/// @param		{struct}	obj
/// @param		{s16}		lifeSpan
/// @returns	s32
function obj_flicker_and_disappear(obj, lifeSpan) {
    if (obj.rawData[oTimer] < lifeSpan) {
        return false;
    }

    if (obj.rawData[oTimer] < lifeSpan + 40) {
        if (obj.rawData[oTimer] % 2 != 0) {
            obj.header.gfx.node.flags |= GRAPH_RENDER_INVISIBLE;
        } else {
            obj.header.gfx.node.flags &= ~GRAPH_RENDER_INVISIBLE;
        }
    } else {
        obj.activeFlags = ACTIVE_FLAG_DEACTIVATED;
        return true;
    }

    return false;
}

/// <pygml?v=1.0&h=9e00f6b67>
/// @function	current_mario_room_check(room)
/// @desc		Checks if a given room is Mario's current room, even if on
///					an object.
/// @param		{s16}		room
/// @returns	s8
function current_mario_room_check(_room) {
    var result;
	
	// @TODO fixme
	return true;

    // Since object surfaces have _room 0, this tests if the surface is an
    // object first and uses the last _room if so.
    if (gMarioCurrentRoom == 0) {
        if (_room == sPrevCheckMarioRoom) {
            return true;
        } else {
            return false;
        }
    } else {
        if (_room == gMarioCurrentRoom) {
            result = true;
        } else {
            result = false;
        }

        sPrevCheckMarioRoom = gMarioCurrentRoom;
    }

    return result;
}

/// <pygml?v=1.0&h=dbe796d4e>
/// @function	trigger_obj_dialog_when_facing(Ptr.p_inDialog, dialogID, dist, actionArg)
/// @desc		Triggers dialog when Mario is facing an object and controls
///					it while in the dialog.
/// @param		{s32}		Ptr.p_inDialog
/// @param		{s16}		dialogID
/// @param		{f32}		dist
/// @param		{s32}		actionArg
/// @returns	s16
function trigger_obj_dialog_when_facing(inDialog, dialogID, dist, actionArg) {
    var o = gCurrentObject;

    var dialogueResponse;

    if ((is_point_within_radius_of_mario(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ], dist) == 1 &&
            obj_check_if_facing_toward_angle(o.rawData[oFaceAngleYaw], gMarioObject[0].header.gfx.angle[1] + 0x8000, 0x1000) == 1 &&
            obj_check_if_facing_toward_angle(o.rawData[oMoveAngleYaw], o.rawData[oAngleToMario], 0x1000) == 1) ||
        (inDialog == 1)) {
        inDialog = 1;

        if (set_mario_npc_dialog(actionArg) == 2) { //If Mario is speaking.
            dialogueResponse = cutscene_object_with_dialog(CUTSCENE_DIALOG, o, dialogID);
            if (dialogueResponse != 0) {
                set_mario_npc_dialog(0);
                inDialog = 0;
                Ptr.p_inDialog = inDialog;
                return dialogueResponse;
            }
            Ptr.p_inDialog = inDialog;
            return 0;
        }
    }

    Ptr.p_inDialog = inDialog;
    return 0;
}

/**
 *Checks if a floor is one that should cause an object to "die".
 */
function obj_check_floor_death(collisionFlags, _floor) {
    if (_floor == null) {
        return;
    }

    if ((collisionFlags & OBJ_COL_FLAG_GROUNDED) == 1)
    {
        switch (_floor.type) {
            case SURFACE_BURNING:
                o.rawData[oAction] = OBJ_ACT_LAVA_DEATH;
                break;
            //! @BUG Doesn't check for the vertical wind death floor.
            case SURFACE_DEATH_PLANE:
                o.rawData[oAction] = OBJ_ACT_DEATH_PLANE_DEATH;
                break;
            default:
                break;
        }
    }
}

/// <pygml?v=1.0&h=a2975ade4>
/// @function	obj_lava_death()
/// @desc		Controls an object dying in lava by creating smoke, sinking
///					the object, playing  audio, and eventually despawning it.
///					Returns TRUE when the obj is dead.
/// @returns	s32
function obj_lava_death() {
    var o = gCurrentObject;

    var deathSmoke;

    if (o.rawData[oTimer] >= 31) {
        o.activeFlags = ACTIVE_FLAG_DEACTIVATED;
        return true;
    } else {
        // Sinking effect
        o.rawData[oPosY] -= 10.0;
    }

    if ((o.rawData[oTimer] % 8) == 0) {
        cur_obj_play_sound_2(SOUND_OBJ_BULLY_EXPLODE_2);
        deathSmoke = spawn_object(o, MODEL_SMOKE, bhvBobombBullyDeathSmoke);
        deathSmoke.rawData[oPosX] += random_float() * 20.0;
        deathSmoke.rawData[oPosY] += random_float() * 20.0;
        deathSmoke.rawData[oPosZ] += random_float() * 20.0;
        deathSmoke.rawData[oForwardVel] = random_float() * 10.0;
    }

    return false;
}

/// <pygml?v=1.0&h=cb08bfdb2>
/// @function	spawn_orange_number(behParam, relX, relY, relZ)
/// @desc		Spawns an orange number object relatively, such as those
///					that count up for secrets.
/// @param		{s8}		behParam
/// @param		{s16}		relX
/// @param		{s16}		relY
/// @param		{s16}		relZ
function spawn_orange_number(behParam, relX, relY, relZ) {
    var o = gCurrentObject;
    var orangeNumber;

    if (behParam >= 10) {
        return;
    }

    orangeNumber = spawn_object_relative(behParam, relX, relY, relZ, o, MODEL_NUMBER, Object1.bhvOrangeNumber);
    orangeNumber.rawData[oPosY] += 25.0;
}
