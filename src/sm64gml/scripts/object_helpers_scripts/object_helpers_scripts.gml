function object_helpers_scripts_macros_init() {
#macro WATER_DROPLET_FLAG_RAND_ANGLE                (0x02)
#macro WATER_DROPLET_FLAG_RAND_OFFSET_XZ            (0x04)
#macro WATER_DROPLET_FLAG_RAND_OFFSET_XYZ           (0x08)
#macro WATER_DROPLET_FLAG_SET_Y_TO_WATER_LEVEL      (0x20)
#macro WATER_DROPLET_FLAG_RAND_ANGLE_INCR_PLUS_8000 (0x40)
#macro WATER_DROPLET_FLAG_RAND_ANGLE_INCR           (0x80)

#macro WAYPOINT_FLAGS_END -1
#macro WAYPOINT_FLAGS_INITIALIZED 0x8000
#macro WAYPOINT_MASK_00FF 0x00FF
#macro WAYPOINT_FLAGS_PLATFORM_ON_TRACK_PAUSE 3

#macro PATH_NONE 0
#macro PATH_REACHED_END -1
#macro PATH_REACHED_WAYPOINT 1

globalvar D_8032F0A0, D_8032F0A4;
D_8032F0A0		= [ 0xF8, 0x08, 0xFC, 0x04 ];
D_8032F0A4		= [ 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80 ];

globalvar sLevelsWithRooms;
sLevelsWithRooms	= [LEVEL_BBH, LEVEL_CASTLE, LEVEL_HMC, -1];

boot("object_helpers_scripts_macros_init");
}

function Hitbox(_interactType, _downOffset, _damageOrCoinValue, __health, _numLootCoins, _radius, _height, _hurtboxRadius, _hurtboxHeight) constructor {
	interactType		= _interactType;
	downOffset			= _downOffset;
	damageOrCoinValue	= _damageOrCoinValue;
	_health				= __health;
	numLootCoins		= _numLootCoins;
	radius				= _radius;
	height				= _height;
	hurtboxRadius		= _hurtboxRadius;
	hurtboxHeight		= _hurtboxHeight;

}

function behaviors_equal(bhv1, bhv2) {
	if (!is_array(bhv1)) return false;
	if (!is_array(bhv2)) return false;
	
	return array_equals(bhv1, bhv2);
}	

function ChainSegment(_posX, _posY, _posZ, _pitch, _yaw, _roll) constructor {
	posX = _posX;
	posY = _posY;
	posZ = _posZ;
	pitch = _pitch;
	yaw = _yaw;
	roll = _roll;
}

function WaterDropletParams(_flags, _model, _behavior, _moveAngleRange, _moveRange, _randForwardVelOffset,
	_randForwardVelScale, _randYVelOffset, _randYVelScale, _randSizeOffset, _randSizeScale) constructor {
    flags				 = _flags;
    model				 = _model;
    behavior			 = _behavior;
    moveAngleRange		 = _moveAngleRange;
    moveRange			 = _moveRange;
    randForwardVelOffset = _randForwardVelOffset;
    randForwardVelScale	 = _randForwardVelScale;
    randYVelOffset		 = _randYVelOffset;
    randYVelScale		 = _randYVelScale;
    randSizeOffset		 = _randSizeOffset;
    randSizeScale		 = _randSizeScale;
}

function struct802A1230(_unk00, _unk02) constructor {
	unk00 = _unk00;
	unk02 = _unk02;
}
function Struct802A272C(_vecF, _vecS) constructor {
	vecF = Vec3f;
	vecS = Vec3s;
}
function SpawnParticlesInfo(_behParam,_count,_model,_offsetY,
	_forwardVelBase,_forwardVelRange,_velYBase,_velYRange,__gravity,
	_dragStrength,_sizeBase,_sizeRange) constructor {
    behParam		= _behParam;
    count			= _count;
    model			= _model;
    offsetY			= _offsetY;
    forwardVelBase	= _forwardVelBase;
    forwardVelRange	= _forwardVelRange;
    velYBase		= _velYBase;
    velYRange		= _velYRange;
    _gravity		= __gravity;
    dragStrength	= _dragStrength;
    sizeBase		= _sizeBase;
    sizeRange		= _sizeRange;
}



function GraphNode_802A45E4(_unk18, _unk1A, _unk1C, _unk1E, _unk20, _unk22) constructor {
    filler0 = array_create(0x18 - 0x00);
    unk18 = _unk18;
    unk1A = _unk1A;
    unk1C = _unk1C;
    unk1E = _unk1E;
    unk20 = _unk20;
    unk22 = _unk22;
}



function geo_update_projectile_pos_from_parent(callContext, node, mtx) {
    var sp20 = Mat4;
    var sp1C;

    if (callContext == GEO_CONTEXT_RENDER) {
        sp1C = gCurGraphNodeObjectRaw; // @z?
        if (sp1C.revObj) {
            create_transformation_from_matrices(sp20, mtx, gCurGraphNodeCamera.matrixPtr);
            obj_update_pos_from_parent_transformation(sp20, sp1C.prevObj);
            obj_set_gfx_pos_from_pos(sp1C.prevObj);
        }
    }
    return null;
}

function geo_update_layer_transparency(callContext, node, context) {
    var dlStart, dlHead;
    var objectGraphNode;
    var currentGraphNode;
    var sp2C;
    var objectOpacity;

    dlStart = null;

    if (callContext == GEO_CONTEXT_RENDER) {
        objectGraphNode = gCurGraphNodeObject; // TODO: change this to object pointer?
        currentGraphNode = node;
        sp2C =  node;

        if (gCurGraphNodeHeldObject) {
            objectGraphNode = gCurGraphNodeHeldObject.objNode;
        }

        objectOpacity = objectGraphNode.rawData[oOpacity];
        dlStart = 3;

        dlHead = dlStart;

        if (objectOpacity == 0xFF) {
            if (currentGraphNode.parameter == 20) {
                currentGraphNode.fnNode.node.flags =
                0x600 | (currentGraphNode.fnNode.node.flags & 0xFF);
            } else {
                currentGraphNode.fnNode.node.flags =
                0x100 | (currentGraphNode.fnNode.node.flags & 0xFF);
            }

            objectGraphNode.rawData[oAnimState] = 0;
        } else {
            if (currentGraphNode.parameter == 20) {
                currentGraphNode.fnNode.node.flags =
                0x600 | (currentGraphNode.fnNode.node.flags & 0xFF);
            } else {
                currentGraphNode.fnNode.node.flags =
                0x500 | (currentGraphNode.fnNode.node.flags & 0xFF);
            }

            objectGraphNode.rawData[oAnimState] = 1;


            if (objectOpacity == 0 && behaviors_equal(Object1.bhvBowser, objectGraphNode.behavior)) {
                objectGraphNode.rawData[oAnimState] = 2;
            }
            // the debug info check was removed in US. so we need to
            // perform the only necessary check instead of the debuginfo
            // one.
            if (currentGraphNode.parameter != 10) {
                if (objectGraphNode.activeFlags & ACTIVE_FLAG_DITHERED_ALPHA) {
                    gDPSetAlphaCompare(dlHead++, G_AC_DITHER);
                }
            }
        }

        gDPSetEnvColor(dlHead++, 255, 255, 255, objectOpacity);
        gSPEndDisplayList(dlHead);
    }

    return dlStart;
}


function geo_switch_anim_state(callContext, node, context) {

    var obj;
    var switchCase;
    if (callContext == GEO_CONTEXT_RENDER) {
        obj = GeoRenderer.gCurGraphNodeObjectRaw; // @z // @cv

        switchCase = node;

       if (GeoRenderer.gCurGraphNodeHeldObject != null) { // @cv
           obj = GeoRenderer.gCurGraphNodeHeldObject.objNode; // @cv
       }
		
		//if (obj == null) return null;

        // if the case is greater than the number of cases, set to 0 to avoid overflowing
        // the switch.
        if (obj.rawData[oAnimState] >= switchCase.numCases) {
            obj.rawData[oAnimState] = 0;
        }

        // assign the case number for execution.
        switchCase.selectedCase = obj.rawData[oAnimState];
    }

    return null;
}

globalvar gMarioCurrentRoom;
gMarioCurrentRoom = 0;

function geo_switch_area(callContext, node) {
	
	/* @z @TODO */
	
	return;
    var sp26;
    var sp20 = {};
    var switchCase = node;

    if (callContext == GEO_CONTEXT_RENDER) {
        if (gMarioObject == null) {
            switchCase.selectedCase = 0;
        } else {
           // gFindFloorIncludeSurfaceIntangible = TRUE;

            find_floor(gMarioObject.rawData[oPosX], gMarioObject.rawData[oPosY], gMarioObject.rawData[oPosZ], sp20);
			sp20 = sp20._floor;

            if (sp20) {
                gMarioCurrentRoom = sp20._room;
                sp26 = sp20._room - 1;
                log("areainfo", sp20._room);

                if (sp26 >= 0) {
                    switchCase.selectedCase = sp26;
                }
            }
        }
    } else {
        switchCase.selectedCase = 0;
    }

    return null;	
	
}

/// <pygml?v=1.0&h=870272884>
/// @function	obj_update_pos_from_parent_transformation(a0, a1)
/// @param		{Mat4}		a0
/// @param		{struct}	a1
function obj_update_pos_from_parent_transformation(a0, a1) {
    var spC, sp8, sp4;

    spC = a1.rawData[oParentRelativePosX];
    sp8 = a1.rawData[oParentRelativePosY];
    sp4 = a1.rawData[oParentRelativePosZ];

    a1.rawData[oPosX] = spC * a0[@ M00] + sp8 * a0[@ M10] + sp4 * a0[@ M20] + a0[@ M30];
    a1.rawData[oPosY] = spC * a0[@ M01] + sp8 * a0[@ M11] + sp4 * a0[@ M21] + a0[@ M31];
    a1.rawData[oPosZ] = spC * a0[@ M02] + sp8 * a0[@ M12] + sp4 * a0[@ M22] + a0[@ M32];
}

function obj_apply_scale_to_matrix(obj, dst, src) {
    dst[@ M00] = src[M00] * obj.header.gfx.scale[0];
    dst[@ M10] = src[M10] * obj.header.gfx.scale[1];
    dst[@ M20] = src[M20] * obj.header.gfx.scale[2];
    dst[@ M30] = src[M30];	   
						   
    dst[@ M01] = src[M01] * obj.header.gfx.scale[0];
    dst[@ M11] = src[M11] * obj.header.gfx.scale[1];
    dst[@ M21] = src[M21] * obj.header.gfx.scale[2];
    dst[@ M31] = src[M31];	   
				   
    dst[@ M02] = src[M02] * obj.header.gfx.scale[0];
    dst[@ M12] = src[M12] * obj.header.gfx.scale[1];
    dst[@ M22] = src[M22] * obj.header.gfx.scale[2];
    dst[@ M32] = src[M32];

    dst[@ M03] = src[M03];
    dst[@ M13] = src[M13];
    dst[@ M23] = src[M23];
    dst[@ M33] = src[M33];
}

/// <pygml?v=1.0&h=22e3bdde7>
/// @function	create_transformation_from_matrices(a0, a1, a2)
/// @param		{Mat4}		a0
/// @param		{Mat4}		a1
/// @param		{Mat4}		a2
function create_transformation_from_matrices(a0, a1, a2) {
    var spC, sp8, sp4;

    spC = a2[M30] * a2[M00] + a2[M31] * a2[M01] + a2[M32] * a2[M02];
    sp8 = a2[M30] * a2[M10] + a2[M31] * a2[M11] + a2[M32] * a2[M12];
    sp4 = a2[M30] * a2[M20] + a2[M31] * a2[M21] + a2[M32] * a2[M22];

    a0[@ M00] = a1[M00] * a2[M00] + a1[M01] * a2[M01] + a1[M02] * a2[M02];
    a0[@ M01] = a1[M00] * a2[M10] + a1[M01] * a2[M11] + a1[M02] * a2[M12];
    a0[@ M02] = a1[M00] * a2[M20] + a1[M01] * a2[M21] + a1[M02] * a2[M22];

    a0[@ M10] = a1[M10] * a2[M00] + a1[M11] * a2[M01] + a1[M12] * a2[M02];
    a0[@ M11] = a1[M10] * a2[M10] + a1[M11] * a2[M11] + a1[M12] * a2[M12];
    a0[@ M12] = a1[M10] * a2[M20] + a1[M11] * a2[M21] + a1[M12] * a2[M22];

    a0[@ M20] = a1[M20] * a2[M00] + a1[M21] * a2[M01] + a1[M22] * a2[M02];
    a0[@ M21] = a1[M20] * a2[M10] + a1[M21] * a2[M11] + a1[M22] * a2[M12];
    a0[@ M22] = a1[M20] * a2[M20] + a1[M21] * a2[M21] + a1[M22] * a2[M22];

    a0[@ M30] = a1[M30] * a2[M00] + a1[M31] * a2[M01] + a1[M32] * a2[M02] - spC;
    a0[@ M31] = a1[M30] * a2[M10] + a1[M31] * a2[M11] + a1[M32] * a2[M12] - sp8;
    a0[@ M32] = a1[M30] * a2[M20] + a1[M31] * a2[M21] + a1[M32] * a2[M22] - sp4;

    a0[@ M03] = 0;
    a0[@ M13] = 0;
    a0[@ M23] = 0;
    a0[@ M33] = 1.0;
}

/// <pygml?v=1.0&h=fd7e11fa4>
/// @function	obj_set_held_state(obj, heldBehavior)
/// @param		{struct}	obj
/// @param		{const}		heldBehavior
function obj_set_held_state(obj, heldBehavior) {
    var o = gCurrentObject;
    obj.parentObj = o;

    if (obj.rawData[oFlags] & OBJ_FLAG_HOLDABLE) {
        if (behaviors_equal(heldBehavior, bhvCarrySomething3)) {
            obj.rawData[oHeldState] = HELD_HELD;
        }

        if (behaviors_equal(heldBehavior, bhvCarrySomething5)) {
            obj.rawData[oHeldState] = HELD_THROWN;
        }

        if (behaviors_equal(heldBehavior, bhvCarrySomething4)) {
            obj.rawData[oHeldState] = HELD_DROPPED;
        }
    } else {
        obj.curBhvCommand = heldBehavior;
        obj.bhvStackIndex = 0;
    }
}

/// <pygml?v=1.0&h=f3fadfe5c>
/// @function	lateral_dist_between_objects(obj1, obj2)
/// @param		{struct}	obj1
/// @param		{struct}	obj2
/// @returns	f32
function lateral_dist_between_objects(obj1, obj2) {
    var dx = obj1.rawData[oPosX] - obj2.rawData[oPosX];
    var dz = obj1.rawData[oPosZ] - obj2.rawData[oPosZ];

    return sqrt(dx * dx + dz * dz);
}

function dist_between_objects(obj1, obj2) {
    var dx = obj1.rawData[oPosX] - obj2.rawData[oPosX];
    var dy = obj1.rawData[oPosY] - obj2.rawData[oPosY];
    var dz = obj1.rawData[oPosZ] - obj2.rawData[oPosZ];

    return sqrt(dx * dx + dy * dy + dz * dz);
}

/// <pygml?v=1.0&h=75cff1fb3>
/// @function	cur_obj_forward_vel_approach_upward(target, increment)
/// @param		{f32}		target
/// @param		{f32}		increment
function cur_obj_forward_vel_approach_upward(target, increment) {
    var o = gCurrentObject;

    if (o.rawData[oForwardVel] >= target) {
        o.rawData[oForwardVel] = target;
    } else {
        o.rawData[oForwardVel] += increment;
    }
}

/// <pygml?v=1.0&h=7aa4b8abd>
/// @function	approach_f32_signed(Ptr.p_value, target, increment)
/// @param		{f32}		Ptr.p_value
/// @param		{f32}		target
/// @param		{f32}		increment
/// @returns	s32
function approach_f32_signed(value, target, increment) {
    var reachedTarget = false;

    value += increment;

    if (increment >= 0.0) {
        if (value > target) {
            value = target;
            reachedTarget = true;
        }
    } else {
        if (value < target) {
            value = target;
            reachedTarget = true;
        }
    }

    Ptr.p_value = value;
    return reachedTarget;
}

/// <pygml?v=1.0&h=7e4d99eed>
/// @function	approach_f32_symmetric(value, target, increment)
/// @param		{f32}		value
/// @param		{f32}		target
/// @param		{f32}		increment
/// @returns	f32
function approach_f32_symmetric(value, target, increment) {
    var dist;

	var dist = target - value;
    if (dist >= 0.0) {
        if (dist > increment) {
            value += increment;
        } else {
            value = target;
        }
    } else {
        if (dist < -increment) {
            value -= increment;
        } else {
            value = target;
        }
    }

    return value;
}

function approach_s16_symmetric(value, target, increment) {
    var dist = target - value;

    if (dist >= 0) {
        if (dist > increment) {
            value += increment;
        } else {
            value = target;
        }
    } else {
        if (dist < -increment) {
            value -= increment;
        } else {
            value = target;
        }
    }

    return value;
}


function cur_obj_rotate_yaw_toward(target, increment) {

	var o = gCurrentObject;
	
    var startYaw;

    startYaw = o.rawData[oMoveAngleYaw];
    o.rawData[oMoveAngleYaw] = approach_s16_symmetric(o.rawData[oMoveAngleYaw], target, increment);
	
	o.rawData[oAngleVelYaw] = o.rawData[oMoveAngleYaw] - startYaw;
    if (o.rawData[oAngleVelYaw] == 0) {
        return true;
    } else {
        return false;
    }
}

function obj_angle_to_object(obj1, obj2) {
	
	var o = gCurrentObject;
	
    var z1, x1, z2, x2;
    var angle;

    z1 = obj1.rawData[oPosZ]; z2 = obj2.rawData[oPosZ]; //ordering of instructions..
    x1 = obj1.rawData[oPosX]; x2 = obj2.rawData[oPosX];

    angle = atan2s(z2 - z1, x2 - x1);
	
    return angle;
}


function obj_turn_toward_object(obj, target, angleIndex, turnAmount) {
	
	var o = gCurrentObject;

    var a, b, c, d;
    var targetAngle, startAngle;

    switch (angleIndex) {
        case O_MOVE_ANGLE_PITCH_INDEX:
        case O_FACE_ANGLE_PITCH_INDEX:
            a = target.rawData[oPosX] - obj.rawData[oPosX];
            c = target.rawData[oPosZ] - obj.rawData[oPosZ];
            a = sqrt(a * a + c * c);

            b = -obj.rawData[oPosY];
            d = -target.rawData[oPosY];

            targetAngle = atan2s(a, d - b);
            break;

        case O_MOVE_ANGLE_YAW_INDEX:
        case O_FACE_ANGLE_YAW_INDEX:
            a = obj.rawData[oPosZ];
            c = target.rawData[oPosZ];
            b = obj.rawData[oPosX];
            d = target.rawData[oPosX];

            targetAngle = atan2s(c - a, d - b);
            break;
    }

    startAngle = o.rawData[angleIndex];
    o.rawData[angleIndex] = approach_s16_symmetric(startAngle, targetAngle, turnAmount);
    return targetAngle;
}


/// <pygml?v=1.0&h=25cf8d8f1>
/// @function	obj_set_parent_relative_pos(obj, relX, relY, relZ)
/// @param		{struct}	obj
/// @param		{s16}		relX
/// @param		{s16}		relY
/// @param		{s16}		relZ
function obj_set_parent_relative_pos(obj, relX, relY, relZ) {
    obj.rawData[oParentRelativePosX] = relX;
    obj.rawData[oParentRelativePosY] = relY;
    obj.rawData[oParentRelativePosZ] = relZ;
}


function obj_set_pos(obj, x, y, z) {

	obj.rawData[oPosX] = x;
	obj.rawData[oPosY] = y;
	obj.rawData[oPosZ] = z;
}

function obj_set_angle(obj, pitch, yaw, roll) {

	obj.rawData[oFaceAnglePitch] = pitch;
	obj.rawData[oFaceAngleYaw] = yaw;
	obj.rawData[oFaceAngleRoll] = roll;

	obj.rawData[oMoveAnglePitch] = pitch;
	obj.rawData[oMoveAngleYaw] = yaw;
	obj.rawData[oMoveAngleRoll] = roll;
}

/// <pygml?v=1.0&h=a817d0952>
/// @function	spawn_object_abs_with_rot(parent, uselessArg, model, behavior, x, y, z, rx, ry, rz)
/// @desc		Spawns an object at an absolute location with a specified
///					angle.
/// @param		{struct}	parent
/// @param		{s16}		uselessArg
/// @param		{u32}		model
/// @param		{const}		behavior
/// @param		{s16}		x
/// @param		{s16}		y
/// @param		{s16}		z
/// @param		{s16}		rx
/// @param		{s16}		ry
/// @param		{s16}		rz
/// @returns	struct
function spawn_object_abs_with_rot(parent, uselessArg, model, behavior, _x, _y, _z, rx, ry, rz) {
    // 'uselessArg' is unused in the function spawn_object_at_origin()
    var newObj = spawn_object_at_origin(parent, uselessArg, model, behavior);
    obj_set_pos(newObj, _x, _y, _z);
    obj_set_angle(newObj, rx, ry, rz);

    return newObj;
}

/// <pygml?v=1.0&h=3c07f9c1b>
/// @function	spawn_object_rel_with_rot(parent, model, behavior, xOff, yOff, zOff, rx, ry, rz)
/// @desc		Spawns an object relative to the parent with a specified
///					angle... is what it is supposed to do.  The rz argument is
///					never used, and the z offset is used for z-rotation instead.
///					This is most likely  a copy-paste typo by one of the
///					programmers.
/// @param		{struct}	parent
/// @param		{u32}		model
/// @param		{const}		behavior
/// @param		{s16}		xOff
/// @param		{s16}		yOff
/// @param		{s16}		zOff
/// @param		{s16}		rx
/// @param		{s16}		ry
/// @param		{s16}		rz
/// @returns	struct
function spawn_object_rel_with_rot(parent, model, behavior, xOff, yOff, zOff, rx, ry, rz) {
    var newObj = spawn_object_at_origin(parent, 0, model, behavior);
    newObj.rawData[oFlags] |= OBJ_FLAG_TRANSFORM_RELATIVE_TO_PARENT;
    obj_set_parent_relative_pos(newObj, xOff, yOff, zOff);
    obj_set_angle(newObj, rx, ry, zOff); // Nice typo you got there Nintendo.

    return newObj;
}

/// <pygml?v=1.0&h=c47683071>
/// @function	spawn_obj_with_transform_flags(sp20, model, sp28)
/// @param		{struct}	sp20
/// @param		{s32}		model
/// @param		{const}		sp28
/// @returns	struct
function spawn_obj_with_transform_flags(sp20, model, sp28) {
    var sp1C = spawn_object(sp20, model, sp28);
    sp1C.rawData[oFlags] |= OBJ_FLAG_0020 | OBJ_FLAG_SET_THROW_MATRIX_FROM_TRANSFORM;
    return sp1C;
}

/// <pygml?v=1.0&h=f9b97274f>
/// @function	spawn_water_droplet(parent, params)
/// @param		{struct}	parent
/// @param		{struct}	params
/// @returns	s32
function spawn_water_droplet(parent, params) {
    var randomScale;
    var newObj = spawn_object(parent, params.model, params.behavior);

    if (params.flags & WATER_DROPLET_FLAG_RAND_ANGLE) {
        newObj.rawData[oMoveAngleYaw] = random_u16();
    }

    if (params.flags & WATER_DROPLET_FLAG_RAND_ANGLE_INCR_PLUS_8000) {
        newObj.rawData[oMoveAngleYaw] = (newObj.rawData[oMoveAngleYaw] + 0x8000) +
            random_f32_around_zero(params.moveAngleRange);
    }

    if (params.flags & WATER_DROPLET_FLAG_RAND_ANGLE_INCR) {
        newObj.rawData[oMoveAngleYaw] =
            newObj.rawData[oMoveAngleYaw] + random_f32_around_zero(params.moveAngleRange);
    }

    if (params.flags & WATER_DROPLET_FLAG_SET_Y_TO_WATER_LEVEL) {
        newObj.rawData[oPosY] = find_water_level(newObj.rawData[oPosX], newObj.rawData[oPosZ]);
    }

    if (params.flags & WATER_DROPLET_FLAG_RAND_OFFSET_XZ) {
        obj_translate_xz_random(newObj, params.moveRange);
    }

    if (params.flags & WATER_DROPLET_FLAG_RAND_OFFSET_XYZ) {
        obj_translate_xyz_random(newObj, params.moveRange);
    }

    newObj.rawData[oForwardVel] = random_float() * params.randForwardVelScale + params.randForwardVelOffset;
    newObj.rawData[oVelY] = random_float() * params.randYVelScale + params.randYVelOffset;

    randomScale = random_float() * params.randSizeScale + params.randSizeOffset;
    obj_scale(newObj, randomScale);

    return newObj;
}

function spawn_object_at_origin(parent, zero, model, behavior) {

	var obj = create_object(behavior);

	obj.parentObj = parent;
	obj.header.gfx.unk18 = parent.header.gfx.unk18;
	obj.header.gfx.unk19 = parent.header.gfx.unk18;

	geo_obj_init(obj.header.gfx, gLoadedGraphNodes[model], [0,0,0], [0,0,0]);

	return obj;

}

/// <pygml?v=1.0&h=dc32f1b5e>
/// @function	spawn_object(parent, model, behavior)
/// @param		{struct}	parent
/// @param		{s32}		model
/// @param		{const}		behavior
/// @returns	struct
function spawn_object(parent, model, behavior) {
    var obj;

    obj = spawn_object_at_origin(parent, 0, model, behavior);
    obj_copy_pos_and_angle(obj, parent);

    return obj;
}

/// <pygml?v=1.0&h=f8d3ef309>
/// @function	try_to_spawn_object(offsetY, scale, parent, model, behavior)
/// @param		{s16}		offsetY
/// @param		{f32}		scale
/// @param		{struct}	parent
/// @param		{s32}		model
/// @param		{const}		behavior
/// @returns	struct
function try_to_spawn_object(offsetY, scale, parent, model, behavior) {
    var obj;

    if (gFreeObjectList.next != null) {
        obj = spawn_object(parent, model, behavior);
        obj.rawData[oPosY] += offsetY;
        obj_scale(obj, scale);
        return obj;
    } else {
        return null;
    }
}

/// <pygml?v=1.0&h=591140753>
/// @function	spawn_object_with_scale(parent, model, behavior, scale)
/// @param		{struct}	parent
/// @param		{s32}		model
/// @param		{const}		behavior
/// @param		{f32}		scale
/// @returns	s32
function spawn_object_with_scale(parent, model, behavior, scale) {
    var obj;

    obj = spawn_object_at_origin(parent, 0, model, behavior);
    obj_copy_pos_and_angle(obj, parent);
    obj_scale(obj, scale);

    return obj;
}

/// <pygml?v=1.0&h=7a84e44c1>
/// @function	obj_build_relative_transform(obj)
/// @param		{struct}	obj
function obj_build_relative_transform(obj) {
    obj_build_transform_from_pos_and_angle(obj, O_PARENT_RELATIVE_POS_INDEX, O_FACE_ANGLE_INDEX);
    obj_translate_local(obj, O_POS_INDEX, O_PARENT_RELATIVE_POS_INDEX);
}

/// <pygml?v=1.0&h=3a7756eaf>
/// @function	spawn_object_relative(behaviorParam, relativePosX, relativePosY, relativePosZ, parent, model, behavior)
/// @param		{s16}		behaviorParam
/// @param		{s16}		relativePosX
/// @param		{s16}		relativePosY
/// @param		{s16}		relativePosZ
/// @param		{struct}	parent
/// @param		{s32}		model
/// @param		{const}		behavior
/// @returns	{struct}
function spawn_object_relative(behaviorParam, relativePosX, relativePosY, relativePosZ, parent, model, behavior) {
    var obj = spawn_object_at_origin(parent, 0, model, behavior);

    obj_copy_pos_and_angle(obj, parent);
    obj_set_parent_relative_pos(obj, relativePosX, relativePosY, relativePosZ);
    obj_build_relative_transform(obj);

    obj.rawData[oBehParams2ndByte] = behaviorParam;
    obj.rawData[oBehParams] = (behaviorParam & 0xFF) << 16;

    return obj;
}

/// <pygml?v=1.0&h=18d115a43>
/// @function	spawn_object_relative_with_scale(behaviorParam, relativePosX, relativePosY, relativePosZ, scale, parent, model, behavior)
/// @param		{s16}		behaviorParam
/// @param		{s16}		relativePosX
/// @param		{s16}		relativePosY
/// @param		{s16}		relativePosZ
/// @param		{f32}		scale
/// @param		{struct}	parent
/// @param		{s32}		model
/// @param		{const}		behavior
/// @returns	s32
function spawn_object_relative_with_scale(behaviorParam, relativePosX, relativePosY, relativePosZ, scale, parent, model, behavior) {
    var obj;

    obj = spawn_object_relative(behaviorParam, relativePosX, relativePosY, relativePosZ, parent, model,
        behavior);
    obj_scale(obj, scale);

    return obj;
}

/// <pygml?v=1.0&h=2ab9bf674>
/// @function	cur_obj_move_using_vel()
function cur_obj_move_using_vel() {
    var o = gCurrentObject;

    o.rawData[oPosX] += o.rawData[oVelX];
    o.rawData[oPosY] += o.rawData[oVelY];
    o.rawData[oPosZ] += o.rawData[oVelZ];
}


/// <pygml?v=1.0&h=95a5d4584>
/// @function	obj_copy_graph_y_offset(dst, src)
/// @param		{struct}	dst
/// @param		{struct}	src
function obj_copy_graph_y_offset(dst, src) {
    dst.rawData[oGraphYOffset] = src.rawData[oGraphYOffset];
}



/// <pygml?v=1.0&h=4ec60b35c>
/// @function	obj_copy_pos_and_angle(dst, src)
/// @param		{struct}	dst
/// @param		{struct}	src
function obj_copy_pos_and_angle(dst, src) {
    obj_copy_pos(dst, src);
    obj_copy_angle(dst, src);
}


/// <pygml?v=1.0&h=ba6d0c307>
/// @function	obj_copy_pos(dst, src)
/// @param		{struct}	dst
/// @param		{struct}	src
function obj_copy_pos(dst, src) {
    dst.rawData[@ oPosX] = src.rawData[oPosX];
    dst.rawData[@ oPosY] = src.rawData[oPosY];
    dst.rawData[@ oPosZ] = src.rawData[oPosZ];
}

/// <pygml?v=1.0&h=6fcbe23d7>
/// @function	obj_copy_angle(dst, src)
/// @param		{struct}	dst
/// @param		{struct}	src
function obj_copy_angle(dst, src) {
    dst.rawData[@ oMoveAnglePitch] = src.rawData[oMoveAnglePitch];
    dst.rawData[@ oMoveAngleYaw] = src.rawData[oMoveAngleYaw];
    dst.rawData[@ oMoveAngleRoll] = src.rawData[oMoveAngleRoll];

    dst.rawData[@ oFaceAnglePitch] = src.rawData[oFaceAnglePitch];
    dst.rawData[@ oFaceAngleYaw] = src.rawData[oFaceAngleYaw];
    dst.rawData[@ oFaceAngleRoll] = src.rawData[oFaceAngleRoll];
}

/// <pygml?v=1.0&h=682d46a85>
/// @function	obj_set_gfx_pos_from_pos(obj)
/// @param		{struct}	obj
function obj_set_gfx_pos_from_pos(obj) {
    obj.header.gfx.pos[0] = obj.rawData[oPosX];
    obj.header.gfx.pos[1] = obj.rawData[oPosY];
    obj.header.gfx.pos[2] = obj.rawData[oPosZ];
}

/// <pygml?v=1.0&h=1eebde0ab>
/// @function	obj_init_animation(obj, animIndex)
/// @param		{struct}	obj
/// @param		{s32}		animIndex
function obj_init_animation(obj, animIndex) {
    var o = gCurrentObject;

    var anims = o.rawData[oAnimations];
    geo_obj_init_animation(obj.header.gfx, anims[animIndex]);
}

/// <pygml?v=1.0&h=e5a2b3836>
/// @function	linear_mtxf_mul_vec3f(m, dst, v)
/// @desc		Multiply a vector by a matrix of the form  | ? ? ? 0 |  | ?
///					? ? 0 |  | ? ? ? 0 |  | 0 0 0 1 |  i.e. a matrix
///					representing a linear transformation over 3 space.
/// @param		{Mat4}		m
/// @param		{Vec3f}		dst
/// @param		{Vec3f}		v
function linear_mtxf_mul_vec3f(m, dst, v) {
    
    dst[@ 0] = m[@ M00] * v[@ 0] + m[@ M10] * v[@ 1] + m[@ M20] * v[@ 2];
    dst[@ 1] = m[@ M01] * v[@ 0] + m[@ M11] * v[@ 1] + m[@ M21] * v[@ 2];
    dst[@ 2] = m[@ M02] * v[@ 0] + m[@ M12] * v[@ 1] + m[@ M22] * v[@ 2];
}

/// <pygml?v=1.0&h=415527dbf>
/// @function	linear_mtxf_transpose_mul_vec3f(m, dst, v)
/// @desc		Multiply a vector by the transpose of a matrix of the form
///					| ? ? ? 0 |  | ? ? ? 0 |  | ? ? ? 0 |  | 0 0 0 1 |  i.e. a
///					matrix representing a linear transformation over 3 space.
/// @param		{Mat4}		m
/// @param		{Vec3f}		dst
/// @param		{Vec3f}		v
function linear_mtxf_transpose_mul_vec3f(m, dst, v) {
	
    dst[@ 0] = m[@ M00] * v[@ 0] + m[@ M01] * v[@ 1] + m[@ M02] * v[@ 2];
    dst[@ 1] = m[@ M10] * v[@ 0] + m[@ M11] * v[@ 1] + m[@ M12] * v[@ 2];
    dst[@ 2] = m[@ M20] * v[@ 0] + m[@ M21] * v[@ 1] + m[@ M22] * v[@ 2];
}

/// <pygml?v=1.0&h=8556719fa>
/// @function	obj_apply_scale_to_transform(obj)
/// @param		{struct}	obj
function obj_apply_scale_to_transform(obj) {
    var scaleX, scaleY, scaleZ;

    scaleX = obj.header.gfx.scale[0];
    scaleY = obj.header.gfx.scale[1];
    scaleZ = obj.header.gfx.scale[2];

    obj.transform[@ M00] *= scaleX;
    obj.transform[@ M01] *= scaleX;
    obj.transform[@ M02] *= scaleX;
				  
    obj.transform[@ M10] *= scaleY;
    obj.transform[@ M11] *= scaleY;
    obj.transform[@ M12] *= scaleY;
				  
    obj.transform[@ M20] *= scaleZ;
    obj.transform[@ M21] *= scaleZ;
    obj.transform[@ M22] *= scaleZ;
}

/// <pygml?v=1.0&h=73ecaed0d>
/// @function	obj_copy_scale(dst, src)
/// @param		{struct}	dst
/// @param		{struct}	src
function obj_copy_scale(dst, src) {
    dst.header.gfx.scale[0] = src.header.gfx.scale[0];
    dst.header.gfx.scale[1] = src.header.gfx.scale[1];
    dst.header.gfx.scale[2] = src.header.gfx.scale[2];
}

/// <pygml?v=1.0&h=c98864b89>
/// @function	obj_scale_xyz(obj, xScale, yScale, zScale)
/// @param		{struct}	obj
/// @param		{f32}		xScale
/// @param		{f32}		yScale
/// @param		{f32}		zScale
function obj_scale_xyz(obj, xScale, yScale, zScale) {
    obj.header.gfx.scale[0] = xScale;
    obj.header.gfx.scale[1] = yScale;
    obj.header.gfx.scale[2] = zScale;
}

/// <pygml?v=1.0&h=bb03f5156>
/// @function	obj_scale(obj, scale)
/// @param		{struct}	obj
/// @param		{f32}		scale
function obj_scale(obj, scale) {
    obj.header.gfx.scale[@ 0] = scale;
    obj.header.gfx.scale[@ 1] = scale;
    obj.header.gfx.scale[@ 2] = scale;
}

/// <pygml?v=1.0&h=2cc6e6cac>
/// @function	cur_obj_scale(scale)
/// @param		{f32}		scale
function cur_obj_scale(scale) {
    var o = gCurrentObject;

    o.header.gfx.scale[@ 0] = scale;
    o.header.gfx.scale[@ 1] = scale;
    o.header.gfx.scale[@ 2] = scale;
}

/// <pygml?v=1.0&h=2c99724f4>
/// @function	cur_obj_init_animation(animIndex)
/// @param		{s32}		animIndex
function cur_obj_init_animation(animIndex) {
    var o = gCurrentObject;

    var anims = o.rawData[oAnimations];
    geo_obj_init_animation(o.header.gfx, anims[animIndex]);
}

/// <pygml?v=1.0&h=ce4975b53>
/// @function	cur_obj_init_animation_with_sound(animIndex)
/// @param		{s32}		animIndex
function cur_obj_init_animation_with_sound(animIndex) {
    var o = gCurrentObject;

    var anims = o.rawData[oAnimations];
    geo_obj_init_animation(o.header.gfx, anims[animIndex]);
    o.rawData[oSoundStateID] = animIndex;
}

function cur_obj_init_animation_with_accel_and_sound(animIndex, accel) {
	
	var o = gCurrentObject;
	
    var anims = o.animation.animList;
	
    var animAccel = (accel * 65536.0);
    geo_obj_init_animation_accel(o.header.gfx, anims[animIndex], animAccel);
    o.rawData[oSoundStateID] = animIndex;
}

/// <pygml?v=1.0&h=f28bfb58f>
/// @function	obj_init_animation_with_sound(obj, animations, animIndex)
/// @param		{struct}	obj
/// @param		{const}		animations
/// @param		{s32}		animIndex
function obj_init_animation_with_sound(obj, animations, animIndex) {
    var anims = animations;
    obj.rawData[oAnimations] = animations;
    geo_obj_init_animation(obj.header.gfx, anims[animIndex]);
    obj.rawData[oSoundStateID] = animIndex;
}

/// <pygml?v=1.0&h=4eb39c3d6>
/// @function	cur_obj_enable_rendering_and_become_tangible(obj)
/// @param		{struct}	obj
function cur_obj_enable_rendering_and_become_tangible(obj) {
    obj.header.gfx.node.flags |= GRAPH_RENDER_ACTIVE;
    obj.rawData[oIntangibleTimer] = 0;
}

/// <pygml?v=1.0&h=538d97554>
/// @function	cur_obj_enable_rendering()
function cur_obj_enable_rendering() {
    var o = gCurrentObject;

    o.header.gfx.node.flags |= GRAPH_RENDER_ACTIVE;
}

/// <pygml?v=1.0&h=2bff86f89>
/// @function	cur_obj_disable_rendering_and_become_intangible(obj)
/// @param		{struct}	obj
function cur_obj_disable_rendering_and_become_intangible(obj) {
    obj.header.gfx.node.flags &= ~GRAPH_RENDER_ACTIVE;
    obj.rawData[oIntangibleTimer] = -1;
}

/// <pygml?v=1.0&h=437f36634>
/// @function	cur_obj_disable_rendering()
function cur_obj_disable_rendering() {
    var o = gCurrentObject;

    o.header.gfx.node.flags &= ~GRAPH_RENDER_ACTIVE;
}

/// <pygml?v=1.0&h=7ac641892>
/// @function	cur_obj_unhide()
function cur_obj_unhide() {
    var o = gCurrentObject;

    o.header.gfx.node.flags &= ~GRAPH_RENDER_INVISIBLE;
}

/// <pygml?v=1.0&h=04d680b6c>
/// @function	cur_obj_hide()
function cur_obj_hide() {
    var o = gCurrentObject;

    o.header.gfx.node.flags |= GRAPH_RENDER_INVISIBLE;
}

/// <pygml?v=1.0&h=27d7072d7>
/// @function	cur_obj_set_pos_relative(other, dleft, dy, dforward)
/// @param		{struct}	other
/// @param		{f32}		dleft
/// @param		{f32}		dy
/// @param		{f32}		dforward
function cur_obj_set_pos_relative(_other, dleft, dy, dforward) {
    var o = gCurrentObject;

    var facingZ = coss(_other.rawData[oMoveAngleYaw]);
    var facingX = sins(_other.rawData[oMoveAngleYaw]);

    var dz = dforward * facingZ - dleft * facingX;
    var dx = dforward * facingX + dleft * facingZ;

    o.rawData[oMoveAngleYaw] = other.rawData[oMoveAngleYaw];

    o.rawData[oPosX] = _other.rawData[oPosX] + dx;
    o.rawData[oPosY] = _other.rawData[oPosY] + dy;
    o.rawData[oPosZ] = _other.rawData[oPosZ] + dz;
}

/// <pygml?v=1.0&h=b502fd784>
/// @function	cur_obj_set_pos_relative_to_parent(dleft, dy, dforward)
/// @param		{f32}		dleft
/// @param		{f32}		dy
/// @param		{f32}		dforward
function cur_obj_set_pos_relative_to_parent(dleft, dy, dforward) {
    cur_obj_set_pos_relative(o.parentObj, dleft, dy, dforward);
}

/// <pygml?v=1.0&h=248da7937>
/// @function	cur_obj_enable_rendering_2()
function cur_obj_enable_rendering_2() {
    cur_obj_enable_rendering();
}

/// <pygml?v=1.0&h=9094a1bb1>
/// @function	cur_obj_unused_init_on_floor()
function cur_obj_unused_init_on_floor() {
    var o = gCurrentObject;

    cur_obj_enable_rendering();

    o.rawData[oPosY] = find_floor_height(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ]);
    if (o.rawData[oPosY] < -10000.0) {
        cur_obj_set_pos_relative_to_parent(0, 0, -70);
        o.rawData[oPosY] = find_floor_height(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ]);
    }
}

/// <pygml?v=1.0&h=20a2607b7>
/// @function	obj_set_face_angle_to_move_angle(obj)
/// @param		{struct}	obj
function obj_set_face_angle_to_move_angle(obj) {
    obj.rawData[oFaceAnglePitch] = obj.rawData[oMoveAnglePitch];
    obj.rawData[oFaceAngleYaw] = obj.rawData[oMoveAngleYaw];
    obj.rawData[oFaceAngleRoll] = obj.rawData[oMoveAngleRoll];
}

/// <pygml?v=1.0&h=0a1a0b687>
/// @function	get_object_list_from_behavior(behavior)
/// @param		{const}		behavior
/// @returns	u32
function get_object_list_from_behavior(behavior) {
    var objectList;

    // If the first behavior command is "begin", then get the object list header
    // from there
    if (behavior[0][0] == BCMD_BEGIN) {
        objectList = behavior[0][1];
    } else {
        objectList = OBJ_LIST_DEFAULT;
    }

    return objectList;
}

function cur_obj_nearest_object_with_behavior(behavior) {
    var obj;
    var dist = 0;

    obj = cur_obj_find_nearest_object_with_behavior(behavior, dist);
    dist = Ptr.p_dist;
	
    return obj;
}

/// <pygml?v=1.0&h=f237910d5>
/// @function	cur_obj_dist_to_nearest_object_with_behavior(behavior)
/// @param		{const}		behavior
/// @returns	f32
function cur_obj_dist_to_nearest_object_with_behavior(behavior) {
    var obj;
    var dist;

    obj = cur_obj_find_nearest_object_with_behavior(behavior, dist);
    if (obj == null) {
        dist = 15000.0;
    }

    return dist;
}

/// <pygml?v=1.0&h=1dfed003b>
/// @function	cur_obj_find_nearest_object_with_behavior(behavior, Ptr.p_dist)
/// @param		{const}		behavior
/// @param		{f32}		Ptr.p_dist
/// @returns	s32
function cur_obj_find_nearest_object_with_behavior(behavior, dist) {
	
    var o = gCurrentObject;
    var behaviorAddr = behavior;
    var closestObj = null;
    var closestObj2 = null;
    var obj;
    var listHead;
    var minDist = 0x20000;

    listHead = gObjectLists[get_object_list_from_behavior(behaviorAddr)];
    obj = listHead.next;

	var counts = 0;
    while (obj != listHead) {
	    var _obj = obj.wrapperObject;
        if (behaviors_equal(_obj.behavior, behaviorAddr)) {//_obj.behavior[0][1] == behaviorAddr[0][1]) {//behaviors_equal(_obj.behavior, behaviorAddr)) { // @z
            if (_obj.activeFlags != ACTIVE_FLAG_DEACTIVATED && _obj != o && obj != o) {
                var objDist = dist_between_objects(o, _obj);
                if (objDist < minDist) {
                    closestObj = _obj;
                    minDist = objDist;
                }
            } 
        }
        obj = obj.wrapperObject.header.next;
    }

    dist = minDist;
    Ptr.p_dist = dist;
    return closestObj;
}

/// <pygml?v=1.0&h=8c632f900>
/// @function	find_unimportant_object()
/// @returns	s32
function find_unimportant_object() {
    var listHead = gObjectLists[OBJ_LIST_UNIMPORTANT];
    var obj = listHead.next;

    if (listHead == obj) {
        obj = null;
    }

    return obj;
}

/// <pygml?v=1.0&h=9b4e75afb>
/// @function	count_unimportant_objects()
/// @returns	s32
function count_unimportant_objects() {
    var listHead = gObjectLists[OBJ_LIST_UNIMPORTANT];
    var obj = listHead.next;
    var count = 0;

    while (listHead != obj) {
        count++;
        obj = obj.wrapperObject.header.next;
    }

    return count;
}

/// <pygml?v=1.0&h=7b541741d>
/// @function	count_objects_with_behavior(behavior)
/// @param		{const}		behavior
/// @returns	s32
function count_objects_with_behavior(behavior) {
    var behaviorAddr = behavior;
    var listHead = gObjectLists[get_object_list_from_behavior(behaviorAddr)];
    var obj = listHead.next;
    var count = 0;

    while (listHead != obj) {
        if (obj.behavior == behaviorAddr) {
            count++;
        }

        obj = obj.next;
    }

    Ptr.p_behavior = behavior;
    return count;
}


function cur_obj_find_nearby_held_actor() { /* @z @TODO */ }

/// <pygml?v=1.0&h=39fdde37b>
/// @function	cur_obj_reset_timer_and_subaction()
function cur_obj_reset_timer_and_subaction() {
    var o = gCurrentObject;

    o.rawData[oTimer] = 0;
    o.rawData[oSubAction] = 0;
}

/// <pygml?v=1.0&h=28c846c21>
/// @function	cur_obj_set_vel_from_mario_vel(f12, f14)
/// @param		{f32}		f12
/// @param		{f32}		f14
function cur_obj_set_vel_from_mario_vel(f12, f14) {
    var o = gCurrentObject;

    var sp4 = gMarioStates[0].forwardVel;
    var sp0 = f12 * f14;

    if (sp4 < sp0) {
        o.rawData[oForwardVel] = sp0;
    } else {
        o.rawData[oForwardVel] = sp4 * f14;
    }
}

/// <pygml?v=1.0&h=ef9aa6b8b>
/// @function	cur_obj_reverse_animation()
function cur_obj_reverse_animation() {
    var o = gCurrentObject;

    if (o.header.gfx.unk38.animFrame >= 0) {
        o.header.gfx.unk38.animFrame--;
    }
}


/// <pygml?v=1.0&h=539e961d0>
/// @function	cur_obj_extend_animation_if_at_end()
function cur_obj_extend_animation_if_at_end() {
    var o = gCurrentObject;

    var sp4 = o.header.gfx.unk38.animFrame;
    var sp0 = o.header.gfx.unk38.curAnim.unk08 - 2;

    if (sp4 == sp0) o.header.gfx.unk38.animFrame--;
}

/// <pygml?v=1.0&h=03d6c0ce9>
/// @function	cur_obj_check_if_near_animation_end()
/// @returns	s32
function cur_obj_check_if_near_animation_end() {
    var o = gCurrentObject;

    var spC = o.header.gfx.unk38.curAnim.flags;
    var sp8 = o.header.gfx.unk38.animFrame;
    var sp4 = o.header.gfx.unk38.curAnim.unk08 - 2;
    var sp0 = false;

    if (spC & 0x01) {
        if (sp4 + 1 == sp8) {
            sp0 = true;
        }
    }

    if (sp8 == sp4) {
        sp0 = true;
    }

    return sp0;
}

/// <pygml?v=1.0&h=7a11aa26a>
/// @function	cur_obj_check_if_at_animation_end()
/// @returns	s32
function cur_obj_check_if_at_animation_end() {
    var o = gCurrentObject;

    var sp4 = o.header.gfx.unk38.animFrame;
    var sp0 = o.header.gfx.unk38.curAnim.unk08 - 1;

    if (sp4 == sp0) {
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=0d49c9084>
/// @function	cur_obj_check_anim_frame(frame)
/// @param		{s32}		frame
/// @returns	s32
function cur_obj_check_anim_frame(frame) {
    var o = gCurrentObject;

    var animFrame = o.header.gfx.unk38.animFrame;

    if (animFrame == frame) {
        return true;
    } else {
        return false;
    }
}

function cur_obj_check_anim_frame_in_range(startFrame, rangeLength) {
	
	var o = gCurrentObject;
	
    var animFrame = o.header.gfx.unk38.animFrame;

    if (animFrame >= startFrame && animFrame < startFrame + rangeLength) {
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=d7a34c9e5>
/// @function	cur_obj_check_frame_prior_current_frame(Ptr.p_a0)
/// @param		{s16}		Ptr.p_a0
/// @returns	s32
function cur_obj_check_frame_prior_current_frame(a0) {
    var o = gCurrentObject;

    var sp6 = o.header.gfx.unk38.animFrame;

    while (a0 != -1) {
        if (a0 == sp6) {
            Ptr.p_a0 = a0;
            return true;
        }

        a0++;
    }

    Ptr.p_a0 = a0;
    return false;
}

/// <pygml?v=1.0&h=5228eb690>
/// @function	mario_is_in_air_action()
/// @returns	s32
function mario_is_in_air_action() {
    if (gMarioStates[0].action & ACT_FLAG_AIR) {
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=e49ffaac4>
/// @function	mario_is_dive_sliding()
/// @returns	s32
function mario_is_dive_sliding() {
    if (gMarioStates[0].action == ACT_DIVE_SLIDE) {
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=f912b56b2>
/// @function	cur_obj_set_y_vel_and_animation(sp18, sp1C)
/// @param		{f32}		sp18
/// @param		{s32}		sp1C
function cur_obj_set_y_vel_and_animation(sp18, sp1C) {
    var o = gCurrentObject;

    o.rawData[oVelY] = sp18;
    cur_obj_init_animation_with_sound(sp1C);
}

/// <pygml?v=1.0&h=8734e8621>
/// @function	cur_obj_unrender_and_reset_state(sp18, sp1C)
/// @param		{s32}		sp18
/// @param		{s32}		sp1C
function cur_obj_unrender_and_reset_state(sp18, sp1C) {
    var o = gCurrentObject;

    cur_obj_become_intangible();
    cur_obj_disable_rendering();

    if (sp18 >= 0) {
        cur_obj_init_animation_with_sound(sp18);
    }

    o.rawData[oAction] = sp1C;
}

/// <pygml?v=1.0&h=f650adc00>
/// @function	cur_obj_move_after_thrown_or_dropped(forwardVel, velY)
/// @desc		gravity
/// @param		{f32}		forwardVel
/// @param		{f32}		velY
function cur_obj_move_after_thrown_or_dropped(forwardVel, velY) {
    var o = gCurrentObject;

    o.rawData[oMoveFlags] = 0;
    o.rawData[oFloorHeight] = find_floor_height(o.rawData[oPosX], o.rawData[oPosY] + 160.0, o.rawData[oPosZ]);

    if (o.rawData[oFloorHeight] > o.rawData[oPosY]) {
        o.rawData[oPosY] = o.rawData[oFloorHeight];
    } else if (o.rawData[oFloorHeight] < -10000.0) {
        //! OoB failsafe
        obj_copy_pos(o, gMarioObject[0]);
        o.rawData[oFloorHeight] = find_floor_height(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ]);
    }

    o.rawData[oForwardVel] = forwardVel;
    o.rawData[oVelY] = velY;

    if (o.rawData[oForwardVel] != 0) {
        cur_obj_move_y(-4.0, /*bounciness*/ -0.1, /*buoyancy*/ 2.0);
    }
}

/// <pygml?v=1.0&h=f3a174675>
/// @function	cur_obj_get_thrown_or_placed(forwardVel, velY, thrownAction)
/// @param		{f32}		forwardVel
/// @param		{f32}		velY
/// @param		{s32}		thrownAction
function cur_obj_get_thrown_or_placed(forwardVel, velY, thrownAction) {
    var o = gCurrentObject;

    if (o.behavior == (bhvBowser)) {
        // Interestingly, when bowser is thrown, he is offset slightly to
        // Mario's right
        cur_obj_set_pos_relative_to_parent(-41.684, 85.859, 321.577);
    } else {}

    cur_obj_become_tangible();
    cur_obj_enable_rendering();

    o.rawData[oHeldState] = HELD_FREE;

    if ((o.rawData[oInteractionSubtype] & INT_SUBTYPE_HOLDABLE_NPC) || forwardVel == 0.0) {
        cur_obj_move_after_thrown_or_dropped(0.0, 0.0);
    } else {
        o.rawData[oAction] = thrownAction;
        cur_obj_move_after_thrown_or_dropped(forwardVel, velY);
    }
}

/// <pygml?v=1.0&h=8b32cf020>
/// @function	cur_obj_get_dropped()
function cur_obj_get_dropped() {
    var o = gCurrentObject;

    cur_obj_become_tangible();
    cur_obj_enable_rendering();

    o.rawData[oHeldState] = HELD_FREE;
    cur_obj_move_after_thrown_or_dropped(0.0, 0.0);
}


/// <pygml?v=1.0&h=d7fbf3fac>
/// @function	cur_obj_set_model(modelID)
/// @param		{s32}		modelID
function cur_obj_set_model(modelID) {
    var o = gCurrentObject;

    o.header.gfx.sharedChild = gLoadedGraphNodes[modelID];
}

/// <pygml?v=1.0&h=a9ac6f107>
/// @function	mario_set_flag(flag)
/// @param		{s32}		flag
function mario_set_flag(flag) {
    gMarioStates[0].flags |= flag;
}

/// <pygml?v=1.0&h=825ff8a66>
/// @function	cur_obj_clear_interact_status_flag(flag)
/// @param		{s32}		flag
/// @returns	s32
function cur_obj_clear_interact_status_flag(flag) {
    var o = gCurrentObject;

    if (o.rawData[oInteractStatus] & flag) {
        o.rawData[oInteractStatus] &= flag ^ ~(0);
        return true;
    }
    return false;
}



/**
 * Mark an object to be unloaded at the end of the frame.
 */
function obj_mark_for_deletion(obj) {
    //! This clears all activeFlags. Since some of these flags disable behavior,
    //  setting it to 0 could potentially enable unexpected behavior. After an
    //  object is marked for deletion, it still updates on that frame (I think),
    //  so this is worth looking into.
    obj.activeFlags = ACTIVE_FLAG_DEACTIVATED;
}


/// <pygml?v=1.0&h=c5fb28ccb>
/// @function	cur_obj_disable()
function cur_obj_disable() {
    cur_obj_disable_rendering();
    cur_obj_hide();
    cur_obj_become_intangible();
}

/// <pygml?v=1.0&h=77a5614ed>
/// @function	cur_obj_become_intangible()
function cur_obj_become_intangible() {
    var o = gCurrentObject;

    // When the timer is negative, the object is intangible and the timer
    // doesn't count down
    o.rawData[oIntangibleTimer] = -1;
}

/// <pygml?v=1.0&h=edc3d417d>
/// @function	cur_obj_become_tangible()
function cur_obj_become_tangible() {
    var o = gCurrentObject;

    o.rawData[oIntangibleTimer] = 0;
}

/// <pygml?v=1.0&h=c99afeab2>
/// @function	cur_obj_update_floor_height()
function cur_obj_update_floor_height() {
    var o = gCurrentObject;

    var _floor = {};
    o.rawData[oFloorHeight] = find_floor(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ], _floor)
    _floor = _floor._floor;
}


function cur_obj_update_floor_height_and_get_floor() {
	var _floor = {};
	var o = gCurrentObject;
	o.rawData[oFloorHeight] = find_floor(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ], _floor);
	return _floor._floor;
}
	
/// <pygml?v=1.0&h=97750eaf0>
/// @function	apply_drag_to_value(Ptr.p_value, dragStrength)
/// @param		{f32}		Ptr.p_value
/// @param		{f32}		dragStrength
function apply_drag_to_value(value, dragStrength) {
	var decel;

	if (value != 0) {
	    //! Can overshoot if |value| > 1/(dragStrength * 0.0001)
	    decel = (value) * (value) * (dragStrength * 0.0001);

	    if (value > 0) {
	        value -= decel;
	        if (value < 0.001) {
	            value = 0;
	        }
	    } else {
	        value += decel;
	        if (value > -0.001) {
	            value = 0;
	        }
	    }
	}

	Ptr.p_value = value;
}

function cur_obj_apply_drag_xz(dragStrength) {
	var o = gCurrentObject;
	o.rawData[oVelX] = apply_drag_to_value(o.rawData[oVelX], dragStrength);
	o.rawData[oVelX] = Ptr.p_value;
	o.rawData[oVelZ] = apply_drag_to_value(o.rawData[oVelZ], dragStrength);
	o.rawData[oVelZ] = Ptr.p_value;
}
	
function cur_obj_move_xz(steepSlopeNormalY, careAboutEdgesAndSteepSlopes) {
		
	var o = gCurrentObject;
		
	var intendedFloor = {};

	var intendedX = o.rawData[oPosX] + o.rawData[oVelX];
	var intendedZ = o.rawData[oPosZ] + o.rawData[oVelZ];

	var intendedFloorHeight = find_floor(intendedX, o.rawData[oPosY], intendedZ, intendedFloor);
	intendedFloor = intendedFloor._floor;
	var deltaFloorHeight = intendedFloorHeight - o.rawData[oFloorHeight];

	var unused;
	var ny;

	o.rawData[oMoveFlags] &= ~OBJ_MOVE_HIT_EDGE;

	if (o.rawData[oRoom] != -1 && intendedFloor != null) {
	    if (intendedFloor._room != 0 && o.rawData[oRoom] != intendedFloor._room && intendedFloor._room != 18) {
	        // Don't leave native room
	        return false;
	    }
	}

	if (intendedFloorHeight < -10000.0) {
	    // Don't move into OoB
	    o.rawData[oMoveFlags] |= OBJ_MOVE_HIT_EDGE;
	    return false;
	} else if (deltaFloorHeight < 5.0) {
	    if (!careAboutEdgesAndSteepSlopes) {
	        // If we don't care about edges or steep slopes, okay to move
	        o.rawData[oPosX] = intendedX;
	        o.rawData[oPosZ] = intendedZ;
	        return false;
	    } else if (deltaFloorHeight < -50.0 && (o.rawData[oMoveFlags] & OBJ_MOVE_ON_GROUND)) {
	        // Don't walk off an edge
	        o.rawData[oMoveFlags] |= OBJ_MOVE_HIT_EDGE;
	        return false;
	    } else if (intendedFloor.normal.y > steepSlopeNormalY) {
	        // Allow movement onto a slope, provided it's not too steep
	        o.rawData[oPosX] = intendedX;
	        o.rawData[oPosZ] = intendedZ;
	        return true;
	    } else {
	        // We are likely trying to move onto a steep downward slope
	        o.rawData[oMoveFlags] |= OBJ_MOVE_HIT_EDGE;
	        return false;
	    }
	} else if ((ny = intendedFloor.normal.y) > steepSlopeNormalY || o.rawData[oPosY] > intendedFloorHeight) {
	    // Allow movement upward, provided either:
	    // - The target floor is flat enough (e.g. walking up stairs)
	    // - We are above the target floor (most likely in the air)
	    o.rawData[oPosX] = intendedX;
	    o.rawData[oPosZ] = intendedZ;
	    //! Returning FALSE but moving anyway (not exploitable; return value is
	    //  never used)
	}

	// We are likely trying to move onto a steep upward slope
	return false;
}
	
/// <pygml?v=1.0&h=9d8f30d07>
/// @function	cur_obj_move_update_underwater_flags()
function cur_obj_move_update_underwater_flags() {
    var o = gCurrentObject;

    var decelY = (sqrt(o.rawData[oVelY] * o.rawData[oVelY]) * (o.rawData[oDragStrength] * 7.0)) / 100.0;

    if (o.rawData[oVelY] > 0) {
        o.rawData[oVelY] -= decelY;
    } else {
        o.rawData[oVelY] += decelY;
    }

    if (o.rawData[oPosY] < o.rawData[oFloorHeight]) {
        o.rawData[oPosY] = o.rawData[oFloorHeight];
        o.rawData[oMoveFlags] |= OBJ_MOVE_UNDERWATER_ON_GROUND;
    } else {
        o.rawData[oMoveFlags] |= OBJ_MOVE_UNDERWATER_OFF_GROUND;
    }
}

	
function cur_obj_move_update_ground_air_flags(gravity, bounciness) {
		
		
	var o = gCurrentObject;
	o.rawData[oMoveFlags] &= ~OBJ_MOVE_BOUNCE;

	if (o.rawData[oPosY] < o.rawData[oFloorHeight]) {
	    // On the first frame that we touch the ground, set OBJ_MOVE_LANDED.
	    // On subsequent frames, set OBJ_MOVE_ON_GROUND
	    if (!(o.rawData[oMoveFlags] & OBJ_MOVE_ON_GROUND)) {
	        if (clear_move_flag(oMoveFlags, OBJ_MOVE_LANDED)) {
	            o.rawData[oMoveFlags] |= OBJ_MOVE_ON_GROUND;
	        } else {
	            o.rawData[oMoveFlags] |= OBJ_MOVE_LANDED;
	        }
	    }

	    o.rawData[oPosY] = o.rawData[oFloorHeight];

	    if (o.rawData[oVelY] < 0.0) {
	        o.rawData[oVelY] *= abs(bounciness); // @z wasn't abs
	    }

	    if (o.rawData[oVelY] > 5.0) {
	        //! This overestimates since velY could be > 5 here
	        //! without bounce (e.g. jump into misa).
	        o.rawData[oMoveFlags] |= OBJ_MOVE_BOUNCE;
	    }
	} else {
	    o.rawData[oMoveFlags] &= ~OBJ_MOVE_LANDED;
	    if (clear_move_flag(oMoveFlags, OBJ_MOVE_ON_GROUND)) {
	        o.rawData[oMoveFlags] |= OBJ_MOVE_LEFT_GROUND;
	    }
	}

	o.rawData[oMoveFlags] &= ~OBJ_MOVE_MASK_IN_WATER;
}


function cur_obj_move_y_and_get_water_level(gravity, buoyancy) {
		
		
	var o = gCurrentObject;
		
	var waterLevel;

	o.rawData[oVelY] += gravity + buoyancy;
	if (o.rawData[oVelY] < -78.0) {
	    o.rawData[oVelY] = -78.0;
	}

	o.rawData[oPosY] += o.rawData[oVelY];
	if (o.activeFlags & ACTIVE_FLAG_UNK10) {
	    waterLevel = -11000.0;
	} else {
	    waterLevel = find_water_level(o.rawData[oPosX], o.rawData[oPosZ]);
	}

	return waterLevel;
}

function cur_obj_move_y(gravity, bounciness, buoyancy) {
		
	var o = gCurrentObject;
		
	var waterLevel;

	o.rawData[oMoveFlags] &= ~OBJ_MOVE_LEFT_GROUND;

	if (o.rawData[oMoveFlags] & OBJ_MOVE_AT_WATER_SURFACE) {
	    if (o.rawData[oVelY] > 5.0) {
	        o.rawData[oMoveFlags] &= ~OBJ_MOVE_MASK_IN_WATER;
	        o.rawData[oMoveFlags] |= OBJ_MOVE_LEAVING_WATER;
	    }
	}

	if (!(o.rawData[oMoveFlags] & OBJ_MOVE_MASK_IN_WATER)) {
	    waterLevel = cur_obj_move_y_and_get_water_level(gravity, 0.0);
	    if (o.rawData[oPosY] > waterLevel) {
	        //! We only handle floor collision if the object does not enter
	        //  water. This allows e.g. coins to clip through floors if they
	        //  enter water on the same frame.
	        cur_obj_move_update_ground_air_flags(gravity, bounciness);
	    } else {
	        o.rawData[oMoveFlags] |= OBJ_MOVE_ENTERED_WATER;
	        o.rawData[oMoveFlags] &= ~OBJ_MOVE_MASK_ON_GROUND;
	    }
	} else {
	    o.rawData[oMoveFlags] &= ~OBJ_MOVE_ENTERED_WATER;

	    waterLevel = cur_obj_move_y_and_get_water_level(gravity, buoyancy);

	    if (o.rawData[oPosY] < waterLevel) {
	        cur_obj_move_update_underwater_flags();
	    } else {
	        if (o.rawData[oPosY] < o.rawData[oFloorHeight]) {
	            o.rawData[oPosY] = o.rawData[oFloorHeight];
	            o.rawData[oMoveFlags] &= ~OBJ_MOVE_MASK_IN_WATER;
	        } else {
	            o.rawData[oPosY] = waterLevel;
	            o.rawData[oVelY] = 0.0;
	            o.rawData[oMoveFlags] &= ~(OBJ_MOVE_UNDERWATER_OFF_GROUND | OBJ_MOVE_UNDERWATER_ON_GROUND);
	            o.rawData[oMoveFlags] |= OBJ_MOVE_AT_WATER_SURFACE;
	        }
	    }
	}

	if (o.rawData[oMoveFlags] & (OBJ_MOVE_MASK_ON_GROUND | OBJ_MOVE_AT_WATER_SURFACE
	    | OBJ_MOVE_UNDERWATER_OFF_GROUND)) {
	    o.rawData[oMoveFlags] &= ~OBJ_MOVE_IN_AIR;
	} else {
	    o.rawData[oMoveFlags] |= OBJ_MOVE_IN_AIR;
	}
}

/// <pygml?v=1.0&h=c915d96c5>
/// @function	stub_obj_helpers_1()
function stub_obj_helpers_1() {}


function clear_move_flag(ISOLATEbitSet, flag) {
		
	var o = gCurrentObject;
		
	if (o.rawData[ISOLATEbitSet] & flag) {
	    o.rawData[ISOLATEbitSet] = o.rawData[ISOLATEbitSet] & (flag ^ 0xFFFFFFFF);
	    return true;
	} else {
	    return false;
	}
}
	
/// <pygml?v=1.0&h=2805da03a>
/// @function	cur_obj_unused_resolve_wall_collisions(offsetY, radius)
/// @param		{f32}		offsetY
/// @param		{f32}		radius
function cur_obj_unused_resolve_wall_collisions(offsetY, radius) {
    var o = gCurrentObject;

    if (radius > 0.1) {
        f32_find_wall_collision(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ], offsetY, radius);
    }
}

function abs_angle_diff(x0, x1) {
	var diff = x1 - x0;

	if (diff == -0x8000) {
	    diff = -0x7FFF;
	}

	if (diff < 0) {
	    diff = -diff;
	}

	return diff;
}
	

/// <pygml?v=1.0&h=eb7155515>
/// @function	cur_obj_move_xz_using_fvel_and_yaw()
function cur_obj_move_xz_using_fvel_and_yaw() {
    var o = gCurrentObject;

    o.rawData[oVelX] = o.rawData[oForwardVel] * sins(o.rawData[oMoveAngleYaw]);
    o.rawData[oVelZ] = o.rawData[oForwardVel] * coss(o.rawData[oMoveAngleYaw]);

    o.rawData[oPosX] += o.rawData[oVelX];
    o.rawData[oPosZ] += o.rawData[oVelZ];
}


/// <pygml?v=1.0&h=04d7be533>
/// @function	cur_obj_move_y_with_terminal_vel()
function cur_obj_move_y_with_terminal_vel() {
    var o = gCurrentObject;

    if (o.rawData[oVelY] < -70.0) {
        o.rawData[oVelY] = -70.0;
    }

    o.rawData[oPosY] += o.rawData[oVelY];
}



function cur_obj_compute_vel_xz(void) {
	var o = gCurrentObject;
	o.rawData[oVelX] = o.rawData[oForwardVel] * sins((o.rawData[oMoveAngleYaw]));
	o.rawData[oVelZ] = o.rawData[oForwardVel] * coss((o.rawData[oMoveAngleYaw]));
}

/// <pygml?v=1.0&h=b566a5303>
/// @function	increment_velocity_toward_range(value, center, zeroThreshold, increment)
/// @param		{f32}		value
/// @param		{f32}		center
/// @param		{f32}		zeroThreshold
/// @param		{f32}		increment
/// @returns	f32
function increment_velocity_toward_range(value, center, zeroThreshold, increment) {
    var relative;
    if ((relative = value - center) > 0) {
        if (relative < zeroThreshold) {
            return 0.0;
        } else {
            return -increment;
        }
    } else {
        if (relative > -zeroThreshold) {
            return 0.0;
        } else {
            return increment;
        }
    }
}


/// <pygml?v=1.0&h=f06dd986a>
/// @function	obj_check_if_collided_with_object(obj1, obj2)
/// @param		{struct}	obj1
/// @param		{struct}	obj2
/// @returns	s32
function obj_check_if_collided_with_object(obj1, obj2) {
    var i;
    for (i = 0; i < obj1.numCollidedObjs; i++) {
        if (obj1.collidedObjs.content[i] == obj2) {
            return true;
        }
    }

    return false;
}

/// <pygml?v=1.0&h=1ca2feb2d>
/// @function	cur_obj_set_behavior(behavior)
/// @param		{const}		behavior
function cur_obj_set_behavior(behavior) {
	var o = gCurrentObject;
	//o.bhvScript.commands = behavior; // @z?
    o.behavior = behavior;
}
/// <pygml?v=1.0&h=83cc8445f>
/// @function	obj_set_behavior(obj, behavior)
/// @param		{struct}	obj
/// @param		{const}		behavior
function obj_set_behavior(obj, behavior) {
    obj.behavior = (behavior);
}

/// <pygml?v=1.0&h=5b1a9f7ec>
/// @function	cur_obj_has_behavior(behavior)
/// @param		{const}		behavior
/// @returns	s32
function cur_obj_has_behavior(behavior) {
	var o = gCurrentObject;
    if (o.behavior == behavior) {
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=3de784bde>
/// @function	obj_has_behavior(obj, behavior)
/// @param		{struct}	obj
/// @param		{const}		behavior
/// @returns	s32
function obj_has_behavior(obj, behavior) {
    if (obj.behavior == (behavior)) {
        return true;
    } else {
        return false;
    }
}

function cur_obj_lateral_dist_from_mario_to_home(void) {
	
	var o = gCurrentObject;
	
	var mario = gMarioObject[0];
    var dist;
    var dx = o.rawData[oHomeX] - mario.rawData[oPosX];
    var dz = o.rawData[oHomeZ] - mario.rawData[oPosZ];

    dist = sqrt(dx * dx + dz * dz);
    return dist;
}
/// <pygml?v=1.0&h=9e4902def>
/// @function	cur_obj_lateral_dist_to_home()
/// @returns	f32
function cur_obj_lateral_dist_to_home() {
    var o = gCurrentObject;

    var dist;
    var dx = o.rawData[oHomeX] - o.rawData[oPosX];
    var dz = o.rawData[oHomeZ] - o.rawData[oPosZ];

    dist = sqrt(dx * dx + dz * dz);
    return dist;
}
/// <pygml?v=1.0&h=24454be1d>
/// @function	cur_obj_outside_home_square(halfLength)
/// @param		{f32}		halfLength
/// @returns	s32
function cur_obj_outside_home_square(halfLength) {
    var o = gCurrentObject;

    if (o.rawData[oHomeX] - halfLength > o.rawData[oPosX]) {
        return true;
    }

    if (o.rawData[oHomeX] + halfLength < o.rawData[oPosX]) {
        return true;
    }

    if (o.rawData[oHomeZ] - halfLength > o.rawData[oPosZ]) {
        return true;
    }

    if (o.rawData[oHomeZ] + halfLength < o.rawData[oPosZ]) {
        return true;
    }

    return 0;
}
/// <pygml?v=1.0&h=7e637e3ca>
/// @function	cur_obj_outside_home_rectangle(minX, maxX, minZ, maxZ)
/// @param		{f32}		minX
/// @param		{f32}		maxX
/// @param		{f32}		minZ
/// @param		{f32}		maxZ
/// @returns	s32
function cur_obj_outside_home_rectangle(minX, maxX, minZ, maxZ) {
    var o = gCurrentObject;

    if (o.rawData[oHomeX] + minX > o.rawData[oPosX]) {
        return true;
    }

    if (o.rawData[oHomeX] + maxX < o.rawData[oPosX]) {
        return true;
    }

    if (o.rawData[oHomeZ] + minZ > o.rawData[oPosZ]) {
        return true;
    }

    if (o.rawData[oHomeZ] + maxZ < o.rawData[oPosZ]) {
        return true;
    }

    return false;
}
/// <pygml?v=1.0&h=ef2d2e8a7>
/// @function	cur_obj_set_pos_to_home()
function cur_obj_set_pos_to_home() {
    var o = gCurrentObject;

    o.rawData[oPosX] = o.rawData[oHomeX];
    o.rawData[oPosY] = o.rawData[oHomeY];
    o.rawData[oPosZ] = o.rawData[oHomeZ];
}
/// <pygml?v=1.0&h=dc69d2f6f>
/// @function	cur_obj_set_pos_to_home_and_stop()
function cur_obj_set_pos_to_home_and_stop() {
    var o = gCurrentObject;

    cur_obj_set_pos_to_home();

    o.rawData[oForwardVel] = 0;
    o.rawData[oVelY] = 0;
}
/// <pygml?v=1.0&h=a9bb1a7cd>
/// @function	cur_obj_shake_y(amount)
/// @param		{f32}		amount
function cur_obj_shake_y(amount) {
    var o = gCurrentObject;

    //! Technically could cause a bit of drift, but not much
    if (o.rawData[oTimer] % 2 == 0) {
        o.rawData[oPosY] += amount;
    } else {
        o.rawData[oPosY] -= amount;
    }
}

/// <pygml?v=1.0&h=7817a6c17>
/// @function	cur_obj_start_cam_event(obj, cameraEvent)
/// @param		{struct}	obj
/// @param		{s32}		cameraEvent
function cur_obj_start_cam_event(obj, cameraEvent) {
    var o = gCurrentObject;
    gPlayerCameraState.cameraEvent = cameraEvent;
    gSecondCameraFocus = o;
}
/// <pygml?v=1.0&h=c9a6db25d>
/// @function	set_mario_interact_hoot_if_in_range(sp0, sp4, sp8)
/// @param		{s32}		sp0
/// @param		{s32}		sp4
/// @param		{f32}		sp8
function set_mario_interact_hoot_if_in_range(sp0, sp4, sp8) {
    var o = gCurrentObject;

    if (o.rawData[oDistanceToMario] < sp8) {
        gMarioObject[0].rawData[oInteractStatus] = 1;
    }
}
/// <pygml?v=1.0&h=bf1d60f04>
/// @function	obj_set_billboard(obj)
/// @param		{struct}	obj
function obj_set_billboard(obj) {
    obj.header.gfx.node.flags |= GRAPH_RENDER_BILLBOARD;
}

function cur_obj_set_hitbox_radius_and_height(radius, height) {
	
	var o = gCurrentObject;
	
    o.hitboxRadius = radius;
    o.hitboxHeight = height;
}
/// <pygml?v=1.0&h=df8a38712>
/// @function	cur_obj_set_hurtbox_radius_and_height(radius, height)
/// @param		{f32}		radius
/// @param		{f32}		height
function cur_obj_set_hurtbox_radius_and_height(radius, height) {
	
	var o = gCurrentObject;

    o.hurtboxRadius = radius;
    o.hurtboxHeight = height;
}
/// <pygml?v=1.0&h=f3bbcb4f1>
/// @function	obj_spawn_loot_coins(obj, numCoins, sp30, coinBehavior, posJitter, model)
/// @param		{struct}	obj
/// @param		{s32}		numCoins
/// @param		{f32}		sp30
/// @param		{const}		coinBehavior
/// @param		{s16}		posJitter
/// @param		{s16}		model
function obj_spawn_loot_coins(obj, numCoins, sp30, coinBehavior, posJitter, model) {
    var i;
    var spawnHeight;
    var _floor = {};
    var coin;

    spawnHeight = find_floor(obj.rawData[oPosX], obj.rawData[oPosY], obj.rawData[oPosZ], _floor)
    _floor = _floor._floor;
    if (obj.rawData[oPosY] - spawnHeight > 100.0) {
        spawnHeight = obj.rawData[oPosY];
    }

    for (i = 0; i < numCoins; i++) {
        if (obj.rawData[oNumLootCoins] <= 0) {
            break;
        }

        obj.rawData[oNumLootCoins]--;

        coin = spawn_object(obj, model, coinBehavior);
        obj_translate_xz_random(coin, posJitter);
        coin.rawData[oPosY] = spawnHeight;
        coin.rawData[oCoinUnk110] = sp30;
    }
}
/// <pygml?v=1.0&h=d80c3c093>
/// @function	obj_spawn_loot_blue_coins(obj, numCoins, sp28, posJitter)
/// @param		{struct}	obj
/// @param		{s32}		numCoins
/// @param		{f32}		sp28
/// @param		{s16}		posJitter
function obj_spawn_loot_blue_coins(obj, numCoins, sp28, posJitter) {
    obj_spawn_loot_coins(obj, numCoins, sp28,Object1.bhvBlueCoinJumping, posJitter, MODEL_BLUE_COIN);
}
/// <pygml?v=1.0&h=1e92d4778>
/// @function	obj_spawn_loot_yellow_coins(obj, numCoins, sp28)
/// @param		{struct}	obj
/// @param		{s32}		numCoins
/// @param		{f32}		sp28
function obj_spawn_loot_yellow_coins(obj, numCoins, sp28) {
    obj_spawn_loot_coins(obj, numCoins, sp28, Object1.bhvSingleCoinGetsSpawned, 0, MODEL_YELLOW_COIN);
}
/// <pygml?v=1.0&h=db4b164c9>
/// @function	cur_obj_spawn_loot_coin_at_mario_pos()
function cur_obj_spawn_loot_coin_at_mario_pos() {
    var o = gCurrentObject;

    var coin;
    if (o.rawData[oNumLootCoins] <= 0) {
        return;
    }

    o.rawData[oNumLootCoins]--;

    coin = spawn_object(o, MODEL_YELLOW_COIN, Object1.bhvSingleCoinGetsSpawned);
    coin.rawData[oVelY] = 30.0;

    obj_copy_pos(coin, gMarioObject[0]);
}
/// <pygml?v=1.0&h=02024770a>
/// @function	cur_obj_abs_y_dist_to_home()
/// @returns	f32
function cur_obj_abs_y_dist_to_home() {
    var o = gCurrentObject;

    var dist = o.rawData[oHomeY] - o.rawData[oPosY];

    if (dist < 0) {
        dist = -dist;
    }

    return dist;
}
/// <pygml?v=1.0&h=e72b6f3f8>
/// @function	cur_obj_advance_looping_anim()
/// @returns	s32
function cur_obj_advance_looping_anim() {
    var o = gCurrentObject;

    var spC = o.header.gfx.unk38.animFrame;
    var sp8 = o.header.gfx.unk38.curAnim.unk08;
    var sp4;

    if (spC < 0) {
        spC = 0;
    } else if (sp8 - 1 == spC) {
        spC = 0;
    } else {
        spC++;
    }

    sp4 = (spC << 16) / sp8;

    return sp4;
}


function cur_obj_detect_steep_floor(steepAngleDegrees) {
		
	var o = gCurrentObject;
		
	var intendedFloor = {};
	var intendedX, intendedFloorHeight, intendedZ;
	var deltaFloorHeight;
	var steepNormalY = cos((steepAngleDegrees * (0x10000 / 360)) / 0x8000 * pi);

	if (o.rawData[oForwardVel] != 0) {
	    intendedX = o.rawData[oPosX] + o.rawData[oVelX];
	    intendedZ = o.rawData[oPosZ] + o.rawData[oVelZ];
	    intendedFloorHeight = find_floor(intendedX, o.rawData[oPosY], intendedZ, intendedFloor);
		intendedFloor = intendedFloor._floor;
	    deltaFloorHeight = intendedFloorHeight - o.rawData[oFloorHeight];

	    if (intendedFloorHeight < -10000.0) {
	        o.rawData[oWallAngle] = o.rawData[oMoveAngleYaw] + 0x8000;
	        return 2;
	    } else if (intendedFloor.normal.y < steepNormalY && deltaFloorHeight > 0
	                && intendedFloorHeight > o.rawData[oPosY]) {
	        o.rawData[oWallAngle] = atan2s(intendedFloor.normal.z, intendedFloor.normal.x);
	        return 1;
	    } else {
	        return 0;
	    }
	}

	return 0;
}
function cur_obj_resolve_wall_collisions(void) {
		 
	var o = gCurrentObject;
		
	var numCollisions;
	var wall;
	var collisionData = {};

	var offsetY = 10.0;
	var radius = o.rawData[oWallHitboxRadius];

	if (radius > 0.1) {
	    collisionData.offsetY = offsetY;
	    collisionData.radius = radius;
	    collisionData.x = o.rawData[oPosX];
	    collisionData.y = o.rawData[oPosY];
	    collisionData.z = o.rawData[oPosZ];

	    numCollisions = find_wall_collisions(collisionData);
	    if (numCollisions != 0) {
	        o.rawData[oPosX] = collisionData.x;
	        o.rawData[oPosY] = collisionData.y;
	        o.rawData[oPosZ] = collisionData.z;
	        wall = collisionData.walls[collisionData.numWalls - 1];

	        o.rawData[oWallAngle] = atan2s(wall.normal.z, wall.normal.x);
	        if (abs_angle_diff(o.rawData[oWallAngle], o.rawData[oMoveAngleYaw]) > 0x4000) {
	            return 1;
	        } else {
	            return 0;
	        }
	    }
	}

	return 0;
	}
	

/// <pygml?v=1.0&h=bcf897154>
/// @function	cur_obj_update_floor()
function cur_obj_update_floor() {
	var o = gCurrentObject;

	var _floor = cur_obj_update_floor_height_and_get_floor();
	o.rawData[oFloor] = _floor;

	if (_floor != null) {
	    if (_floor.type == SURFACE_BURNING) {
	        o.rawData[oMoveFlags] |= OBJ_MOVE_ABOVE_LAVA;
	    } else if (_floor.type == SURFACE_DEATH_PLANE) {
	        //! This misses SURFACE_VERTICAL_WIND (and maybe SURFACE_WARP)
	        o.rawData[oMoveFlags] |= OBJ_MOVE_ABOVE_DEATH_BARRIER;
	    }

	    o.rawData[oFloorType][0] = _floor.type;
	    o.rawData[oFloorRoom][1] = _floor._room;
	} else {
	    o.rawData[oFloorType][0] = 0;
	    o.rawData[oFloorRoom][1] = 0;
	}
}
	
function cur_obj_update_floor_and_resolve_wall_collisions(steepSlopeDegrees) {

	var o = gCurrentObject;
	o.rawData[oMoveFlags] &= ~(OBJ_MOVE_ABOVE_LAVA | OBJ_MOVE_ABOVE_DEATH_BARRIER);

	if (o.activeFlags & (ACTIVE_FLAG_FAR_AWAY | ACTIVE_FLAG_IN_DIFFERENT_ROOM)) {
	    cur_obj_update_floor();
	    o.rawData[oMoveFlags] &= ~(OBJ_MOVE_HIT_WALL | OBJ_MOVE_MASK_IN_WATER);

	    if (o.rawData[oPosY] > o.rawData[oFloorHeight]) {
	        o.rawData[oMoveFlags] |= OBJ_MOVE_IN_AIR;
	    }
	} else {
	    o.rawData[oMoveFlags] &= ~OBJ_MOVE_HIT_WALL;
	    if (cur_obj_resolve_wall_collisions()) {
	        o.rawData[oMoveFlags] |= OBJ_MOVE_HIT_WALL;
	    }

	    cur_obj_update_floor();

	    if (o.rawData[oPosY] > o.rawData[oFloorHeight]) {
	        o.rawData[oMoveFlags] |= OBJ_MOVE_IN_AIR;
	    }

	    if (cur_obj_detect_steep_floor(steepSlopeDegrees)) {
	        o.rawData[oMoveFlags] |= OBJ_MOVE_HIT_WALL;
	    }
	}
}
	

function cur_obj_update_floor_and_walls() {
	cur_obj_update_floor_and_resolve_wall_collisions(60);
}
	
function cur_obj_move_standard(steepSlopeAngleDegrees) {
		
var o = gCurrentObject;
		
var _gravity = o.rawData[oGravity];
var bounciness = o.rawData[oBounciness];
var buoyancy = o.rawData[oBuoyancy];
var dragStrength = o.rawData[oDragStrength];
var steepSlopeNormalY;
var careAboutEdgesAndSteepSlopes = false;
var negativeSpeed = false;

if (!(o.activeFlags & (ACTIVE_FLAG_FAR_AWAY | ACTIVE_FLAG_IN_DIFFERENT_ROOM))) {

    if (steepSlopeAngleDegrees < 0) {
        careAboutEdgesAndSteepSlopes = true;
		steepSlopeAngleDegrees = -steepSlopeAngleDegrees;
    }

    steepSlopeNormalY = cos((steepSlopeAngleDegrees * (0x10000 / 360)) / 0x8000 * pi);

    cur_obj_compute_vel_xz();
    cur_obj_apply_drag_xz(dragStrength);

    cur_obj_move_xz(steepSlopeNormalY, careAboutEdgesAndSteepSlopes);
    cur_obj_move_y(_gravity, bounciness, buoyancy);

    if (o.rawData[oForwardVel] < 0) {
        negativeSpeed = true;
    }
    o.rawData[oForwardVel] = sqrt(sqr(o.rawData[oVelX]) + sqr(o.rawData[oVelZ]));
    if (negativeSpeed == true) {
        o.rawData[oForwardVel] = -o.rawData[oForwardVel];
    }
}
}

/// <pygml?v=1.0&h=a3d9f0425>
/// @function	cur_obj_within_12k_bounds()
/// @returns	s32
function cur_obj_within_12k_bounds() {
    var o = gCurrentObject;

    if (o.rawData[oPosX] < -12000.0 || 12000.0 < o.rawData[oPosX]) {
        return false;
    }

    if (o.rawData[oPosY] < -12000.0 || 12000.0 < o.rawData[oPosY]) {
        return false;
    }

    if (o.rawData[oPosZ] < -12000.0 || 12000.0 < o.rawData[oPosZ]) {
        return false;
    }

    return true;
}

/// <pygml?v=1.0&h=61ad03b38>
/// @function	cur_obj_move_using_vel_and_gravity()
function cur_obj_move_using_vel_and_gravity() {
    var o = gCurrentObject;

    if (cur_obj_within_12k_bounds()) {
        o.rawData[oPosX] += o.rawData[oVelX];
        o.rawData[oPosZ] += o.rawData[oVelZ];
        o.rawData[oVelY] += o.rawData[oGravity]; //! No terminal velocity
        o.rawData[oPosY] += o.rawData[oVelY];
    }
}

/// <pygml?v=1.0&h=c2004b982>
/// @function	obj_set_pos_relative(obj, other, dleft, dy, dforward)
/// @param		{struct}	obj
/// @param		{struct}	other
/// @param		{f32}		dleft
/// @param		{f32}		dy
/// @param		{f32}		dforward
function obj_set_pos_relative(obj, _other, dleft, dy, dforward) {
    var facingZ = coss(_other.rawData[oMoveAngleYaw]);
    var facingX = sins(_other.rawData[oMoveAngleYaw]);

    var dz = dforward * facingZ - dleft * facingX;
    var dx = dforward * facingX + dleft * facingZ;

    obj.rawData[oMoveAngleYaw] = other.rawData[oMoveAngleYaw];

    obj.rawData[oPosX] = _other.rawData[oPosX] + dx;
    obj.rawData[oPosY] = _other.rawData[oPosY] + dy;
    obj.rawData[oPosZ] = _other.rawData[oPosZ] + dz;
}


function cur_obj_angle_to_home(void) {
	
	var o = gCurrentObject;
    var angle;
    var dx = o.rawData[oHomeX] - o.rawData[oPosX];
    var dz = o.rawData[oHomeZ] - o.rawData[oPosZ];

    angle = atan2s(dz, dx);
    return angle;
}
/// <pygml?v=1.0&h=1a1973e88>
/// @function	obj_set_gfx_pos_at_obj_pos(obj1, obj2)
/// @param		{struct}	obj1
/// @param		{struct}	obj2
function obj_set_gfx_pos_at_obj_pos(obj1, obj2) {
    obj1.header.gfx.pos[0] = obj2.rawData[oPosX];
    obj1.header.gfx.pos[1] = obj2.rawData[oPosY] + obj2.rawData[oGraphYOffset];
    obj1.header.gfx.pos[2] = obj2.rawData[oPosZ];

    obj1.header.gfx.angle[0] = obj2.rawData[oMoveAnglePitch] & 0xFFFF;
    obj1.header.gfx.angle[1] = obj2.rawData[oMoveAngleYaw] & 0xFFFF;
    obj1.header.gfx.angle[2] = obj2.rawData[oMoveAngleRoll] & 0xFFFF;
}

/// <pygml?v=1.0&h=3024e5a93>
/// @function	obj_translate_local(obj, posIndex, localTranslateIndex)
/// @desc		Transform the vector at localTranslateIndex into the
///					object's local  coordinates, and then add it to the vector
///					at posIndex.
/// @param		{struct}	obj
/// @param		{s16}		posIndex
/// @param		{s16}		localTranslateIndex
function obj_translate_local(obj, posIndex, localTranslateIndex) {
	
	// @z asF32
    var dx = obj.rawData[localTranslateIndex + 0];//obj.asF32[localTranslateIndex + 0];
    var dy = obj.rawData[localTranslateIndex + 1];//obj.asF32[localTranslateIndex + 1];
    var dz = obj.rawData[localTranslateIndex + 2];//obj.asF32[localTranslateIndex + 2];

    //obj.asF32[posIndex + 0] +=
	obj.rawData[posIndex + 0] += 
        obj.transform[M00] * dx + obj.transform[M10] * dy + obj.transform[M20] * dz;
    //obj.asF32[posIndex + 1] +=
	obj.rawData[posIndex + 1] += 
        obj.transform[M01] * dx + obj.transform[M11] * dy + obj.transform[M21] * dz;
    //obj.asF32[posIndex + 2] +=
	obj.rawData[posIndex + 2] += 
        obj.transform[M02] * dx + obj.transform[M12] * dy + obj.transform[M22] * dz;
}

/// <pygml?v=1.0&h=8101d506d>
/// @function	obj_build_transform_from_pos_and_angle(obj, posIndex, angleIndex)
/// @param		{struct}	obj
/// @param		{s16}		posIndex
/// @param		{s16}		angleIndex
function obj_build_transform_from_pos_and_angle(obj, posIndex, angleIndex) {
    var translate = array_create(3);
    var rotation  = array_create(3);

    translate[0] = obj.rawData[posIndex + 0];//obj.asF32[posIndex + 0];
    translate[1] = obj.rawData[posIndex + 1];//obj.asF32[posIndex + 1];
    translate[2] = obj.rawData[posIndex + 2];//obj.asF32[posIndex + 2];

    rotation[0] = obj.rawData[angleIndex + 0];//obj.asS32[angleIndex + 0];
    rotation[1] = obj.rawData[angleIndex + 1];//obj.asS32[angleIndex + 1];
    rotation[2] = obj.rawData[angleIndex + 2];//obj.asS32[angleIndex + 2];

    mtxf_rotate_zxy_and_translate(obj.transform, translate, rotation);
}
/// <pygml?v=1.0&h=0a7c39e56>
/// @function	obj_set_throw_matrix_from_transform(obj)
/// @param		{struct}	obj
function obj_set_throw_matrix_from_transform(obj) {
    if (obj.rawData[oFlags] & OBJ_FLAG_0020) {
        obj_build_transform_from_pos_and_angle(obj, O_POS_INDEX, O_FACE_ANGLE_INDEX);
        obj_apply_scale_to_transform(obj);
    }

    obj.header.gfx.throwMatrix = obj.transform;

    //! Sets scale of gCurrentObject instead of obj. Not exploitable since this
    //  function is only called with obj = gCurrentObject
    cur_obj_scale(1.0);
}

/// <pygml?v=1.0&h=246b35d44>
/// @function	obj_build_transform_relative_to_parent(obj)
/// @param		{struct}	obj
function obj_build_transform_relative_to_parent(obj) {
    var parent = obj.parentObj;

    obj_build_transform_from_pos_and_angle(obj, O_PARENT_RELATIVE_POS_INDEX, O_FACE_ANGLE_INDEX);
    obj_apply_scale_to_transform(obj);
    mtxf_mul(obj.transform, obj.transform, parent.transform);

    obj.rawData[oPosX] = obj.transform[M30];
    obj.rawData[oPosY] = obj.transform[M31];
    obj.rawData[oPosZ] = obj.transform[M32];

    obj.header.gfx.throwMatrix = obj.transform;

    //! Sets scale of gCurrentObject instead of obj. Not exploitable since this
    //  function is only called with obj = gCurrentObject
    cur_obj_scale(1.0);
}
/// <pygml?v=1.0&h=c9a39cbb4>
/// @function	obj_create_transform_from_self(obj)
/// @param		{struct}	obj
function obj_create_transform_from_self(obj) {
    obj.rawData[oFlags] &= ~OBJ_FLAG_TRANSFORM_RELATIVE_TO_PARENT;
    obj.rawData[oFlags] |= OBJ_FLAG_SET_THROW_MATRIX_FROM_TRANSFORM;

    obj.transform[M30] = obj.rawData[oPosX];
    obj.transform[M31] = obj.rawData[oPosY];
    obj.transform[M32] = obj.rawData[oPosZ];
}
/// <pygml?v=1.0&h=a22474cdd>
/// @function	cur_obj_rotate_move_angle_using_vel()
function cur_obj_rotate_move_angle_using_vel() {
    var o = gCurrentObject;

    o.rawData[oMoveAnglePitch] += o.rawData[oAngleVelPitch];
    o.rawData[oMoveAngleYaw] += o.rawData[oAngleVelYaw];
    o.rawData[oMoveAngleRoll] += o.rawData[oAngleVelRoll];
}
/// <pygml?v=1.0&h=29fdfaa42>
/// @function	cur_obj_rotate_face_angle_using_vel()
function cur_obj_rotate_face_angle_using_vel() {
    var o = gCurrentObject;

    o.rawData[oFaceAnglePitch] += o.rawData[oAngleVelPitch];
    o.rawData[oFaceAngleYaw] += o.rawData[oAngleVelYaw];
    o.rawData[oFaceAngleRoll] += o.rawData[oAngleVelRoll];
}
/// <pygml?v=1.0&h=003f43704>
/// @function	cur_obj_set_face_angle_to_move_angle()
function cur_obj_set_face_angle_to_move_angle() {
    var o = gCurrentObject;

    o.rawData[oFaceAnglePitch] = o.rawData[oMoveAnglePitch];
    o.rawData[oFaceAngleYaw] = o.rawData[oMoveAngleYaw];
    o.rawData[oFaceAngleRoll] = o.rawData[oMoveAngleRoll];
}
/// <pygml?v=1.0&h=805aa9dfc>
/// @function	cur_obj_follow_path(unusedArg)
/// @param		{s32}		unusedArg
/// @returns	s32
function cur_obj_follow_path(unusedArg) {
    var o = gCurrentObject;

    var startWaypoint;
    var lastWaypoint;
    var targetWaypoint;
    var prevToNextX, prevToNextY, prevToNextZ;
    var sp2C;
    var objToNextXZ;
    var objToNextX, objToNextY, objToNextZ;

    if (o.rawData[oPathedPrevWaypointFlags] == 0) {
        o.rawData[oPathedPrevWaypoint] = o.rawData[oPathedStartWaypoint];
        o.rawData[oPathedPrevWaypointFlags] = WAYPOINT_FLAGS_INITIALIZED;
    }

    startWaypoint = o.rawData[oPathedStartWaypoint];
    lastWaypoint = o.rawData[oPathedPrevWaypoint];

    if ((lastWaypoint + 1).flags != WAYPOINT_FLAGS_END) {
        targetWaypoint = lastWaypoint + 1;
    } else {
        targetWaypoint = startWaypoint;
    }

    o.rawData[oPathedPrevWaypointFlags] = lastWaypoint.flags | WAYPOINT_FLAGS_INITIALIZED;

    prevToNextX = targetWaypoint.pos[0] - lastWaypoint.pos[0];
    prevToNextY = targetWaypoint.pos[1] - lastWaypoint.pos[1];
    prevToNextZ = targetWaypoint.pos[2] - lastWaypoint.pos[2];

    objToNextX = targetWaypoint.pos[0] - o.rawData[oPosX];
    objToNextY = targetWaypoint.pos[1] - o.rawData[oPosY];
    objToNextZ = targetWaypoint.pos[2] - o.rawData[oPosZ];
    objToNextXZ = sqrt(sqr(objToNextX) + sqr(objToNextZ));

    o.rawData[oPathedTargetYaw] = atan2s(objToNextZ, objToNextX);
    o.rawData[oPathedTargetPitch] = atan2s(objToNextXZ, -objToNextY);

    // If dot(prevToNext, objToNext) <= 0 (i.e. reached other side of target waypoint)
    if (prevToNextX * objToNextX + prevToNextY * objToNextY + prevToNextZ * objToNextZ <= 0.0) {
        o.rawData[oPathedPrevWaypoint] = targetWaypoint;
        if ((targetWaypoint + 1).flags == WAYPOINT_FLAGS_END) {
            return PATH_REACHED_END;
        } else {
            return PATH_REACHED_WAYPOINT;
        }
    }

    return PATH_NONE;
}

/// <pygml?v=1.0&h=e6fb07ed0>
/// @function	chain_segment_init(segment)
/// @param		{struct}	segment
function chain_segment_init(segment) {
    segment.posX = 0.0;
    segment.posY = 0.0;
    segment.posZ = 0.0;

    segment.pitch = 0;
    segment.yaw = 0;
    segment.roll = 0;
}

/// <pygml?v=1.0&h=1ed80ea17>
/// @function	random_f32_around_zero(diameter)
/// @param		{f32}		diameter
/// @returns	f32
function random_f32_around_zero(diameter) {
    return random_float() * diameter - diameter / 2;
}

/// <pygml?v=1.0&h=aea42f6fa>
/// @function	obj_scale_random(obj, rangeLength, minScale)
/// @param		{struct}	obj
/// @param		{f32}		rangeLength
/// @param		{f32}		minScale
function obj_scale_random(obj, rangeLength, minScale) {
    var scale = random_float() * rangeLength + minScale;
    obj_scale_xyz(obj, scale, scale, scale);
}
/// <pygml?v=1.0&h=26e3fce19>
/// @function	obj_translate_xyz_random(obj, rangeLength)
/// @param		{struct}	obj
/// @param		{f32}		rangeLength
function obj_translate_xyz_random(obj, rangeLength) {
    obj.rawData[oPosX] += random_float() * rangeLength - rangeLength * 0.5;
    obj.rawData[oPosY] += random_float() * rangeLength - rangeLength * 0.5;
    obj.rawData[oPosZ] += random_float() * rangeLength - rangeLength * 0.5;
}


/// <pygml?v=1.0&h=23af5ddbd>
/// @function	obj_translate_xz_random(obj, rangeLength)
/// @param		{struct}	obj
/// @param		{f32}		rangeLength
function obj_translate_xz_random(obj, rangeLength) {
    obj.rawData[oPosX] += random_float() * rangeLength - rangeLength * 0.5;
    obj.rawData[oPosZ] += random_float() * rangeLength - rangeLength * 0.5;
}

/// <pygml?v=1.0&h=ddf97008c>
/// @function	cur_obj_move_using_fvel_and_gravity()
function cur_obj_move_using_fvel_and_gravity() {
    cur_obj_compute_vel_xz();
    cur_obj_move_using_vel_and_gravity(); //! No terminal velocity
}



/// <pygml?v=1.0&h=8983dbbff>
/// @function	obj_build_vel_from_transform(a0)
/// @param		{struct}	a0
function obj_build_vel_from_transform(a0) {
    var spC = a0.rawData[oUnkC0];
    var sp8 = a0.rawData[oUnkBC];
    var sp4 = a0.rawData[oForwardVel];

    a0.rawData[oVelX] = a0.transform[M00] * spC + a0.transform[M10] * sp8 + a0.transform[M20] * sp4;
    a0.rawData[oVelY] = a0.transform[M01] * spC + a0.transform[M11] * sp8 + a0.transform[M21] * sp4;
    a0.rawData[oVelZ] = a0.transform[M02] * spC + a0.transform[M12] * sp8 + a0.transform[M22] * sp4;
}



/// <pygml?v=1.0&h=981e05851>
/// @function	cur_obj_set_pos_via_transform()
function cur_obj_set_pos_via_transform() {
    var o = gCurrentObject;

    obj_build_transform_from_pos_and_angle(o, O_PARENT_RELATIVE_POS_INDEX, O_MOVE_ANGLE_INDEX);
    obj_build_vel_from_transform(o);
    o.rawData[oPosX] += o.rawData[oVelX];
    o.rawData[oPosY] += o.rawData[oVelY];
    o.rawData[oPosZ] += o.rawData[oVelZ];
}


/// <pygml?v=1.0&h=172634d25>
/// @function	cur_obj_reflect_move_angle_off_wall()
/// @returns	s16
function cur_obj_reflect_move_angle_off_wall() {
    var o = gCurrentObject;

    var angle = o.rawData[oWallAngle] - (o.rawData[oMoveAngleYaw] - o.rawData[oWallAngle]) + 0x8000;
    return angle;
}

/// <pygml?v=1.0&h=9f853bba9>
/// @function	cur_obj_spawn_particles(info)
/// @param		{struct}	info
function cur_obj_spawn_particles(info) {
    var o = gCurrentObject;

    var particle;
    var i;
    var scale;
    var numParticles = info.count;

    // If there are a lot of objects already, limit the number of particles
    if (gPrevFrameObjectCount > 150 && numParticles > 10) {
        numParticles = 10;
    }

    // We're close to running out of object slots, so don't spawn particles at
    // all
    if (gPrevFrameObjectCount > 210) {
        numParticles = 0;
    }

    for (i = 0; i < numParticles; i++) {
        scale = random_float() * (info.sizeRange * 0.1) + info.sizeBase * 0.1;

        particle = spawn_object(o, info.model, Object1.bhvWhitePuffExplosion);

        particle.rawData[oBehParams2ndByte] = info.behParam;
        particle.rawData[oMoveAngleYaw] = random_u16();
        particle.rawData[oGravity] = info._gravity;
        particle.rawData[oDragStrength] = info.dragStrength;

        particle.rawData[oPosY] += info.offsetY;
        particle.rawData[oForwardVel] = random_float() * info.forwardVelRange + info.forwardVelBase;
        particle.rawData[oVelY] = random_float() * info.velYRange + info.velYBase;

        obj_scale_xyz(particle, scale, scale, scale);
    }
}

function obj_set_hitbox(obj, hitbox) {

	
    if (!(obj.rawData[oFlags] & OBJ_FLAG_30)) {
        obj.rawData[oFlags] |= OBJ_FLAG_30;

        obj.rawData[oInteractType] = hitbox.interactType;
        obj.rawData[oDamageOrCoinValue] = hitbox.damageOrCoinValue;
        obj.rawData[oHealth] = hitbox._health;
        obj.rawData[oNumLootCoins] = hitbox.numLootCoins;

        cur_obj_become_tangible();
    }

    obj.hitboxRadius = obj.header.gfx.scale[0] * hitbox.radius;
    obj.hitboxHeight = obj.header.gfx.scale[1] * hitbox.height;
    obj.hurtboxRadius = obj.header.gfx.scale[0] * hitbox.hurtboxRadius;
    obj.hurtboxHeight = obj.header.gfx.scale[1] * hitbox.hurtboxHeight;
    obj.hitboxDownOffset = obj.header.gfx.scale[1] * hitbox.downOffset;
}

/// <pygml?v=1.0&h=5279cf99e>
/// @function	signum_positive(x)
/// @param		{s32}		x
/// @returns	s32
function signum_positive(_x) {
    if (_x >= 0) {
        return 1;
    } else {
        return -1;
    }
}

/// <pygml?v=1.0&h=b5318b6c1>
/// @function	absf(x)
/// @param		{f32}		x
/// @returns	f32
function absf(_x) {
    if (_x >= 0) {
        return _x;
    } else {
        return -_x;
    }
}

/// <pygml?v=1.0&h=fd4849c29>
/// @function	absi(a0)
/// @param		{s32}		a0
/// @returns	s32
function absi(a0) {
    if (a0 >= 0) {
        return a0;
    } else {
        return -a0;
    }
}

/// <pygml?v=1.0&h=38458ee3c>
/// @function	cur_obj_wait_then_blink(timeUntilBlinking, numBlinks)
/// @param		{s32}		timeUntilBlinking
/// @param		{s32}		numBlinks
/// @returns	s32
function cur_obj_wait_then_blink(timeUntilBlinking, numBlinks) {
    var o = gCurrentObject;

    var done = false;
    var timeBlinking;

    if (o.rawData[oTimer] >= timeUntilBlinking) {
		timeBlinking = o.rawData[oTimer] - timeUntilBlinking;
        if (timeBlinking % 2 != 0) {
            o.header.gfx.node.flags |= GRAPH_RENDER_INVISIBLE;
            if (timeBlinking / 2 > numBlinks) {
                done = true;
            }
        } else {
            o.header.gfx.node.flags &= ~GRAPH_RENDER_INVISIBLE;
        }
    }

    return done;
}

/// <pygml?v=1.0&h=7a5eddf9b>
/// @function	cur_obj_is_mario_ground_pounding_platform()
/// @returns	s32
function cur_obj_is_mario_ground_pounding_platform() {
	
	var o = gCurrentObject;
	
    if (gMarioObject[0].platform == o) {
        if (gMarioState.action == ACT_GROUND_POUND_LAND) {
            return true;
        }
    }

    return false;
}

/// <pygml?v=1.0&h=1e61e84a4>
/// @function	spawn_mist_particles()
function spawn_mist_particles() {
    spawn_mist_particles_variable(0, 0, 46.0);
}

/// <pygml?v=1.0&h=cd1ee4d9d>
/// @function	spawn_mist_particles_with_sound(sp18)
/// @param		{u32}		sp18
function spawn_mist_particles_with_sound(sp18) {
    spawn_mist_particles_variable(0, 0, 46.0);
    create_sound_spawner(sp18);
}


function cur_obj_push_mario_away(radius) {
	var o = gCurrentObject;
	var marioRelX = gMarioObject[0].rawData[oPosX] - o.rawData[oPosX];
	var marioRelZ = gMarioObject[0].rawData[oPosZ] - o.rawData[oPosZ];
	var marioDist = sqrt(power(marioRelX, 2) + power(marioRelZ, 2));

	if (marioDist < radius) {
	    gMarioState.pos[0] += (radius - marioDist) / radius * marioRelX;
	    gMarioState.pos[2] += (radius - marioDist) / radius * marioRelZ;
	}
}

/// <pygml?v=1.0&h=e72520f47>
/// @function	cur_obj_push_mario_away_from_cylinder(radius, extentY)
/// @param		{f32}		radius
/// @param		{f32}		extentY
function cur_obj_push_mario_away_from_cylinder(radius, extentY) {
    var o = gCurrentObject;

    var marioRelY = gMarioObject[0].rawData[oPosY] - o.rawData[oPosY];

    if (marioRelY < 0) {
        marioRelY = -marioRelY;
    }

    if (marioRelY < extentY) {
        cur_obj_push_mario_away(radius);
    }
}

/// <pygml?v=1.0&h=d8060321a>
/// @function	bhv_dust_smoke_loop()
function bhv_dust_smoke_loop() {
    var o = gCurrentObject;

    o.rawData[oPosX] += o.rawData[oVelX];
    o.rawData[oPosY] += o.rawData[oVelY];
    o.rawData[oPosZ] += o.rawData[oVelZ];

    if (o.rawData[oSmokeTimer] == 10) {
        obj_mark_for_deletion(o);
    }

    o.rawData[oSmokeTimer]++;
}

/// <pygml?v=1.0&h=8b7f6542a>
/// @function	stub_obj_helpers_2()
function stub_obj_helpers_2() {}

/// <pygml?v=1.0&h=e7ef323fd>
/// @function	cur_obj_set_direction_table(Ptr.p_a0)
/// @param		{s8}		Ptr.p_a0
/// @returns	s32
function cur_obj_set_direction_table(a0) {
    var o = gCurrentObject;

    o.rawData[oToxBoxMovementPattern] = a0;
    o.rawData[oToxBoxMovementStep] = 0;

    return o.rawData[oToxBoxMovementPattern][0];
}

/// <pygml?v=1.0&h=061817ca9>
/// @function	cur_obj_progress_direction_table()
/// @returns	s32
function cur_obj_progress_direction_table() {
    var o = gCurrentObject;

    var spF;
    var sp8 = o.rawData[oToxBoxMovementPattern];
    var sp4 = o.rawData[oToxBoxMovementStep] + 1;

    if (sp8[sp4] != -1) {
        spF = sp8[sp4];
        o.rawData[oToxBoxMovementStep]++;
    } else {
        spF = sp8[0];
        o.rawData[oToxBoxMovementStep] = 0;
    }

    return spF;
}

/// <pygml?v=1.0&h=7dfe160a7>
/// @function	stub_obj_helpers_3(sp0, sp4)
/// @param		{s32}		sp0
/// @param		{s32}		sp4
function stub_obj_helpers_3(sp0, sp4) {}

/// <pygml?v=1.0&h=798ceba03>
/// @function	cur_obj_scale_over_time(a0, a1, sp10, sp14)
/// @param		{s32}		a0
/// @param		{s32}		a1
/// @param		{f32}		sp10
/// @param		{f32}		sp14
function cur_obj_scale_over_time(a0, a1, sp10, sp14) {
    var o = gCurrentObject;

    var sp4 = sp14 - sp10;
    var sp0 = o.rawData[oTimer] / a1;

    if (a0 & 0x01) {
        o.header.gfx.scale[0] = sp4 * sp0 + sp10;
    }

    if (a0 & 0x02) {
        o.header.gfx.scale[1] = sp4 * sp0 + sp10;
    }

    if (a0 & 0x04) {
        o.header.gfx.scale[2] = sp4 * sp0 + sp10;
    }
}
/// <pygml?v=1.0&h=253766cfd>
/// @function	cur_obj_set_pos_to_home_with_debug()
function cur_obj_set_pos_to_home_with_debug() {
    var o = gCurrentObject;

    o.rawData[oPosX] = o.rawData[oHomeX] + gDebugInfo[5][0];
    o.rawData[oPosY] = o.rawData[oHomeY] + gDebugInfo[5][1];
    o.rawData[oPosZ] = o.rawData[oHomeZ] + gDebugInfo[5][2];
    cur_obj_scale(gDebugInfo[5][3] / 100.0 + 1.0);
}

/// <pygml?v=1.0&h=e538d899d>
/// @function	stub_obj_helpers_4()
function stub_obj_helpers_4() {}

/// <pygml?v=1.0&h=51b33c46d>
/// @function	cur_obj_is_mario_on_platform()
/// @returns	s32
function cur_obj_is_mario_on_platform() {
	
	var o = gCurrentObject;

    if (gMarioObject[0].platform == o) {
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=deb6f2e6b>
/// @function	cur_obj_shake_y_until(cycles, amount)
/// @param		{s32}		cycles
/// @param		{s32}		amount
/// @returns	s32
function cur_obj_shake_y_until(cycles, amount) {
    var o = gCurrentObject;

    if (o.rawData[oTimer] % 2 != 0) {
        o.rawData[oPosY] -= amount;
    } else {
        o.rawData[oPosY] += amount;
    }

    if (o.rawData[oTimer] == cycles * 2) {
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=7b81c895a>
/// @function	cur_obj_move_up_and_down(a0)
/// @param		{s32}		a0
/// @returns	s32
function cur_obj_move_up_and_down(a0) {
    var o = gCurrentObject;

    if (a0 >= 4 || a0 < 0) {
        return 1;
    }

    o.rawData[oPosY] += D_8032F0A0[a0];
    return 0;
}

/// <pygml?v=1.0&h=2f80a1cbd>
/// @function	cur_obj_call_action_function(actionFunctions)
/// @param		{void}		actionFunctions
function cur_obj_call_action_function(actionFunctions) {
    var o = gCurrentObject;

	var ind = o.rawData[oAction];
	
    var func = actionFunctions[ind];
	func();
}

/// <pygml?v=1.0&h=0deb87fe9>
/// @function	spawn_star_with_no_lvl_exit(sp20, sp24)
/// @param		{s32}		sp20
/// @param		{s32}		sp24
/// @returns	s32
function spawn_star_with_no_lvl_exit(sp20, sp24) {
    var o = gCurrentObject;

    var sp1C = spawn_object(o, MODEL_STAR, bhvSpawnedStarNoLevelExit);
    sp1C.rawData[oSparkleSpawnUnk1B0] = sp24;
    sp1C.rawData[oBehParams] = o.rawData[oBehParams];
    sp1C.rawData[oBehParams2ndByte] = sp20;

    return sp1C;
}

/// <pygml?v=1.0&h=2ae54ff62>
/// @function	spawn_base_star_with_no_lvl_exit()
// old unused initializer for 2d star spawn behavior.
// uses behavior parameters not used in the current sparkle code.
function spawn_base_star_with_no_lvl_exit() {
    spawn_star_with_no_lvl_exit(0, 0);
}

/// <pygml?v=1.0&h=3aa10a8e4>
/// @function	bit_shift_left(a0)
/// @param		{s32}		a0
/// @returns	s32
function bit_shift_left(a0) {
	
	a0 = 0;
    return D_8032F0A4[a0];
}

/// <pygml?v=1.0&h=84a449eb9>
/// @function	cur_obj_mario_far_away()
/// @returns	s32
function cur_obj_mario_far_away() {
    var o = gCurrentObject;

    var dx = o.rawData[oHomeX] - gMarioObject[0].rawData[oPosX];
    var dy = o.rawData[oHomeY] - gMarioObject[0].rawData[oPosY];
    var dz = o.rawData[oHomeZ] - gMarioObject[0].rawData[oPosZ];
    var marioDistToHome = sqrt(dx * dx + dy * dy + dz * dz);

    if (o.rawData[oDistanceToMario] > 2000.0 && marioDistToHome > 2000.0) {
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=f5fbdbcc0>
/// @function	is_mario_moving_fast_or_in_air(speedThreshold)
/// @param		{s32}		speedThreshold
/// @returns	s32
function is_mario_moving_fast_or_in_air(speedThreshold) {
    if (gMarioStates[0].forwardVel > speedThreshold) {
        return true;
    }

    if (gMarioStates[0].action & ACT_FLAG_AIR) {
        return true;
    } else {
        return false;
    }
}

	
function is_item_in_array(item, array) {
		
	var len = array_length(array);
		
	for(var i = 0; i < len; i++) {
		if (array[i] == item) return true;
	}
		
	return false;
}

/// <pygml?v=1.0&h=aa0648256>
/// @function	stub_obj_helpers_5()
function stub_obj_helpers_5() {}


function bhv_init_room() {
	
	var o = gCurrentObject;
	
	var _floor = {};
	var floorHeight;

	if (is_item_in_array(gCurrLevelNum, sLevelsWithRooms)) {
	    floorHeight = find_floor(o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ], _floor);
		_floor = _floor._floor;

	    if (_floor != null) {
	        if (_floor._room != 0) {
	            o.rawData[oRoom] = _floor._room;
	        } else {
	            find_floor(o.rawData[oPosX], floorHeight - 100.0, o.rawData[oPosZ], _floor);
				_floor = _floor._floor;
	            if (_floor != null) {
	                o.rawData[oRoom] = _floor._room;
	            }
	        }
	    }
	} else {
	    o.rawData[oRoom] = -1;
	}
}

function cur_obj_enable_rendering_if_mario_in_room(void) {
	
	
	var o = gCurrentObject;
	
    var marioInRoom;
	
	 // @z @TODO
    cur_obj_enable_rendering(); // <-- x
	return true;

    if (o.rawData[oRoom] != -1 && gMarioCurrentRoom != 0) {
        if (gMarioCurrentRoom == o.rawData[oRoom]) {
            marioInRoom = true;
        } else if (gDoorAdjacentRooms[gMarioCurrentRoom][0] == o.rawData[oRoom]) {
            marioInRoom = true;
        } else if (gDoorAdjacentRooms[gMarioCurrentRoom][1] == o.rawData[oRoom]) {
            marioInRoom = true;
        } else {
            marioInRoom = true;
        }

        if (marioInRoom) {
            cur_obj_enable_rendering();
            o.activeFlags &= ~ACTIVE_FLAG_IN_DIFFERENT_ROOM;
            gNumRoomedObjectsInMarioRoom++;
        } else {
            cur_obj_disable_rendering();
            o.activeFlags |= ACTIVE_FLAG_IN_DIFFERENT_ROOM;
            gNumRoomedObjectsNotInMarioRoom++;
        }
    }
}

function cur_obj_set_hitbox_and_die_if_attacked(hitbox, deathSound, noLootCoins) {
	
	var o = gCurrentObject;
	
    var interacted = false;

    obj_set_hitbox(o, hitbox);

    if (noLootCoins) {
        o.rawData[oNumLootCoins] = 0;
    }

    if (o.rawData[oInteractStatus] & INT_STATUS_INTERACTED) {
        if (o.rawData[oInteractStatus] & INT_STATUS_WAS_ATTACKED) {
            spawn_mist_particles();
            obj_spawn_loot_yellow_coins(o, o.rawData[oNumLootCoins], 20.0);
            obj_mark_for_deletion(o);
            create_sound_spawner(deathSound);
        } else {
            interacted = true;
        }
    }

    o.rawData[oInteractStatus] = 0;
    return interacted;
}

/// <pygml?v=1.0&h=150814d14>
/// @function	obj_explode_and_spawn_coins(sp18, sp1C)
/// @param		{f32}		sp18
/// @param		{s32}		sp1C
function obj_explode_and_spawn_coins(sp18, sp1C) {
    var o = gCurrentObject;

    spawn_mist_particles_variable(0, 0, sp18);
    spawn_triangle_break_particles(30, 138, 3.0, 4);
    obj_mark_for_deletion(o);

    if (sp1C == 1) {
        obj_spawn_loot_yellow_coins(o, o.rawData[oNumLootCoins], 20.0);
    } else if (sp1C == 2) {
        obj_spawn_loot_blue_coins(o, o.rawData[oNumLootCoins], 20.0, 150);
    }
}

/// <pygml?v=1.0&h=a1e2266a9>
/// @function	obj_set_collision_data(obj, segAddr)
/// @param		{struct}	obj
/// @param		{const}		segAddr
function obj_set_collision_data(obj, segAddr) {
    obj.collisionData = (segAddr);
}


/// <pygml?v=1.0&h=60873a28b>
/// @function	cur_obj_if_hit_wall_bounce_away()
function cur_obj_if_hit_wall_bounce_away() {
    var o = gCurrentObject;

    if (o.rawData[oMoveFlags] & OBJ_MOVE_HIT_WALL) {
        o.rawData[oMoveAngleYaw] = o.rawData[oWallAngle];
    }
}

/// <pygml?v=1.0&h=ef0563c3e>
/// @function	cur_obj_hide_if_mario_far_away_y(distY)
/// @param		{f32}		distY
/// @returns	s32
function cur_obj_hide_if_mario_far_away_y(distY) {
    var o = gCurrentObject;

    if (abs(o.rawData[oPosY] - gMarioObject[0].rawData[oPosY]) < distY) {
        cur_obj_unhide();
        return false;
    } else {
        cur_obj_hide();
        return true;
    }
}

/// <pygml?v=1.0&h=7f28bb241>
function geo_offset_klepto_held_object(callContext, node, mtx) {
    if (callContext == GEO_CONTEXT_RENDER) {
        node.next.translation[0] = 300;
        node.next.translation[1] = 300;
        node.next.translation[2] = 0;
    }

    return null;
}

function obj_is_hidden(obj) {
    if (obj.header.gfx.node.flags & GRAPH_RENDER_INVISIBLE) {
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=c7ff780cb>
/// @function	enable_time_stop()
function enable_time_stop() {
    gTimeStopState |= TIME_STOP_ENABLED;
}

/// <pygml?v=1.0&h=a9c8c7f65>
/// @function	disable_time_stop()
function disable_time_stop() {
    gTimeStopState &= ~TIME_STOP_ENABLED;
}

/// <pygml?v=1.0&h=658803f31>
/// @function	set_time_stop_flags(flags)
/// @param		{s32}		flags
function set_time_stop_flags(flags) {
    gTimeStopState |= flags;
}

/// <pygml?v=1.0&h=3c7f94c94>
/// @function	clear_time_stop_flags(flags)
/// @param		{s32}		flags
function clear_time_stop_flags(flags) {
    gTimeStopState = gTimeStopState & (flags ^ 0xFFFFFFFF);
}

/// <pygml?v=1.0&h=708c10e6c>
/// @function	cur_obj_can_mario_activate_textbox(radius, height, unused)
/// @param		{f32}		radius
/// @param		{f32}		height
/// @param		{s32}		unused
/// @returns	s32
function cur_obj_can_mario_activate_textbox(radius, height, unused) {
    var o = gCurrentObject;

    var latDistToMario;
    var angleFromMario;

    if (o.rawData[oDistanceToMario] < 1500.0) {
        latDistToMario = lateral_dist_between_objects(o, gMarioObject[0]);
        angleFromMario = obj_angle_to_object(gMarioObject[0], o);

        if (latDistToMario < radius && o.rawData[oPosY] < gMarioObject[0].rawData[oPosY] + 160.0 &&
            gMarioObject[0].rawData[oPosY] < o.rawData[oPosY] + height && !(gMarioStates[0].action & ACT_FLAG_AIR) &&
            mario_ready_to_speak()) {
            return true;
        }
    }

    return false;
}

/// <pygml?v=1.0&h=ead847044>
/// @function	cur_obj_can_mario_activate_textbox_2(radius, height)
/// @param		{f32}		radius
/// @param		{f32}		height
/// @returns	s32
function cur_obj_can_mario_activate_textbox_2(radius, height) {
    // The last argument here is unused. When this function is called directly the argument is always set to 0x7FFF.
    return cur_obj_can_mario_activate_textbox(radius, height, 0x1000);
}

/// <pygml?v=1.0&h=b7f32c09f>
/// @function	cur_obj_end_dialog(dialogFlags, dialogResult)
/// @param		{s32}		dialogFlags
/// @param		{s32}		dialogResult
function cur_obj_end_dialog(dialogFlags, dialogResult) {
    var o = gCurrentObject;

    o.rawData[oDialogResponse][0] = dialogResult;
    o.rawData[oDialogState][1]++;

    if (!(dialogFlags & DIALOG_UNK1_FLAG_4)) {
        set_mario_npc_dialog(0);
    }
}

/// <pygml?v=1.0&h=99c3ebb17>
/// @function	cur_obj_update_dialog_with_cutscene(actionArg, dialogFlags, cutsceneTable, dialogID)
/// @param		{s32}		actionArg
/// @param		{s32}		dialogFlags
/// @param		{s32}		cutsceneTable
/// @param		{s32}		dialogID
/// @returns	s32
function cur_obj_update_dialog_with_cutscene(actionArg, dialogFlags, cutsceneTable, dialogID) {
    var o = gCurrentObject;

    var dialogResponse = 0;
    var doneTurning = true;

    switch (o.rawData[oDialogState][1]) {

        case (DIALOG_UNK2_TURN_AND_INTERRUPT_MARIO_ACTION):
            if (dialogFlags & DIALOG_UNK2_FLAG_0) {
                doneTurning = cur_obj_rotate_yaw_toward(obj_angle_to_object(o, gMarioObject[0]), 0x800);
                if (o.rawData[oDialogResponse][0] >= 33) {
                    doneTurning = true;
                }
            }

            if (set_mario_npc_dialog(actionArg) == 2 && doneTurning) {
                o.rawData[oDialogResponse][0] = 0;
                o.rawData[oDialogState][1]++;
            } else {
                o.rawData[oDialogResponse][0]++;
            }
            break;

        case (DIALOG_UNK2_AWAIT_DIALOG):
            if (cutsceneTable == CUTSCENE_CAP_SWITCH_PRESS) {
                if ((o.rawData[oDialogResponse][0] = cutscene_object_without_dialog(cutsceneTable, o)) != 0) {
                    o.rawData[oDialogState][1]++;
                }
            } else {
                if ((o.rawData[oDialogResponse][0] = cutscene_object_with_dialog(cutsceneTable, o, dialogID)) != 0) {
                    o.rawData[oDialogState][1]++;
                }
            }
            break;

        case (DIALOG_UNK2_END_DIALOG):
            if (dialogFlags & DIALOG_UNK2_LEAVE_TIME_STOP_ENABLED) {
                dialogResponse = o.rawData[oDialogResponse][0];
                o.rawData[oDialogState][1] = DIALOG_UNK2_ENABLE_TIME_STOP;
            } else if (gMarioState.action != ACT_READING_NPC_DIALOG) {
                gTimeStopState &= ~TIME_STOP_ENABLED;
                o.activeFlags &= ~ACTIVE_FLAG_INITIATED_TIME_STOP;
                dialogResponse = o.rawData[oDialogResponse][0];
                o.rawData[oDialogState][1] = DIALOG_UNK2_ENABLE_TIME_STOP;
            } else {
                set_mario_npc_dialog(0);
            }
            break;
    }

    return dialogResponse;
}


/// <pygml?v=1.0&h=07981ee9c>
/// @function	cur_obj_has_model(modelID)
/// @param		{u16}		modelID
/// @returns	s32
function cur_obj_has_model(modelID) {
    var o = gCurrentObject;

    if (o.header.gfx.sharedChild == gLoadedGraphNodes[modelID]) {
        return true;
    } else {
        return false;
    }
}
/// <pygml?v=1.0&h=e537374c9>
/// @function	cur_obj_align_gfx_with_floor()
function cur_obj_align_gfx_with_floor() {
    var o = gCurrentObject;

    var _floor = {};
    var floorNormal = Vec3f;
    var position = Vec3f;

    position[0] = o.rawData[oPosX];
    position[1] = o.rawData[oPosY];
    position[2] = o.rawData[oPosZ];

    find_floor(position[0], position[1], position[2], _floor)
    _floor = _floor._floor;
    if (_floor != null) {
        floorNormal[0] = _floor.normal.x;
        floorNormal[1] = _floor.normal.y;
        floorNormal[2] = _floor.normal.z;

        mtxf_align_terrain_normal(o.transform, floorNormal, position, o.rawData[oFaceAngleYaw]);
        o.header.gfx.throwMatrix = o.transform;
    }
}

/// <pygml?v=1.0&h=7adebe906>
/// @function	mario_is_within_rectangle(minX, maxX, minZ, maxZ)
/// @param		{s16}		minX
/// @param		{s16}		maxX
/// @param		{s16}		minZ
/// @param		{s16}		maxZ
/// @returns	s32
function mario_is_within_rectangle(minX, maxX, minZ, maxZ) {
    if (gMarioObject[0].rawData[oPosX] < minX || maxX < gMarioObject[0].rawData[oPosX]) {
        return false;
    }

    if (gMarioObject[0].rawData[oPosZ] < minZ || maxZ < gMarioObject[0].rawData[oPosZ]) {
        return false;
    }

    return true;
}

/// <pygml?v=1.0&h=0666e20af>
/// @function	cur_obj_shake_screen(shake)
/// @param		{s32}		shake
function cur_obj_shake_screen(shake) {
    var o = gCurrentObject;

    set_camera_shake_from_point(shake, o.rawData[oPosX], o.rawData[oPosY], o.rawData[oPosZ]);
}


function obj_attack_collided_from_other_object(obj) {
    var numCollidedObjs;
    var _other;
    var touchedOtherObject = false;

    numCollidedObjs = obj.numCollidedObjs;
    if (numCollidedObjs != 0) {
        _other = obj.collidedObjs.content[0];

        if (_other != gMarioObject[0]) {
            _other.rawData[oInteractStatus] |= ATTACK_PUNCH | INT_STATUS_WAS_ATTACKED | INT_STATUS_INTERACTED
                                      | INT_STATUS_TOUCHED_BOB_OMB;
            touchedOtherObject = true;
        }
    }

    return touchedOtherObject;
}


/// <pygml?v=1.0&h=762968c67>
/// @function	cur_obj_was_attacked_or_ground_pounded()
/// @returns	s32
function cur_obj_was_attacked_or_ground_pounded() {
    var o = gCurrentObject;

    var attacked = false;

    if ((o.rawData[oInteractStatus] & INT_STATUS_INTERACTED) &&
        (o.rawData[oInteractStatus] & INT_STATUS_WAS_ATTACKED)) {
        attacked = true;
    }

    if (cur_obj_is_mario_ground_pounding_platform()) {
        attacked = true;
    }

    o.rawData[oInteractStatus] = 0;
    return attacked;
}
/// <pygml?v=1.0&h=087d15e17>
/// @function	obj_copy_behavior_params(dst, src)
/// @param		{struct}	dst
/// @param		{struct}	src
function obj_copy_behavior_params(dst, src) {
    dst.rawData[oBehParams] = src.rawData[oBehParams];
    dst.rawData[oBehParams2ndByte] = src.rawData[oBehParams2ndByte];
}

/// <pygml?v=1.0&h=4732661b8>
/// @function	cur_obj_init_animation_and_anim_frame(animIndex, animFrame)
/// @param		{s32}		animIndex
/// @param		{s32}		animFrame
function cur_obj_init_animation_and_anim_frame(animIndex, animFrame) {
    var o = gCurrentObject;

    cur_obj_init_animation_with_sound(animIndex);
    o.header.gfx.unk38.animFrame = animFrame;
}

/// <pygml?v=1.0&h=b91134c6a>
/// @function	cur_obj_init_animation_and_check_if_near_end(animIndex)
/// @param		{s32}		animIndex
/// @returns	s32
function cur_obj_init_animation_and_check_if_near_end(animIndex) {
    cur_obj_init_animation_with_sound(animIndex);
    return cur_obj_check_if_near_animation_end();
}

/// <pygml?v=1.0&h=954811e3e>
/// @function	cur_obj_init_animation_and_extend_if_at_end(animIndex)
/// @param		{s32}		animIndex
function cur_obj_init_animation_and_extend_if_at_end(animIndex) {
    cur_obj_init_animation_with_sound(animIndex);
    cur_obj_extend_animation_if_at_end();
}

/// <pygml?v=1.0&h=8d2414b57>
/// @function	cur_obj_check_grabbed_mario()
/// @returns	s32
function cur_obj_check_grabbed_mario() {
    var o = gCurrentObject;

    if (o.rawData[oInteractStatus] & INT_STATUS_GRABBED_MARIO) {
        o.rawData[oKingBobombUnk88] = 1;
        cur_obj_become_intangible();
        return true;
    }

    return false;
}

/// <pygml?v=1.0&h=600d368b0>
/// @function	player_performed_grab_escape_action()
/// @returns	s32
function player_performed_grab_escape_action() {
    static
    var grabReleaseState;
    var result = false;

    if (gPlayer1Controller.stickMag < 30.0) {
        grabReleaseState = 0;
    }

    if (grabReleaseState == 0 && gPlayer1Controller.stickMag > 40.0) {
        grabReleaseState = 1;
        result = true;
    }

    if (gPlayer1Controller.buttonPressed & A_BUTTON) {
        result = true;
    }

    return result;
}

/// <pygml?v=1.0&h=8d356ae44>
/// @function	cur_obj_unused_play_footstep_sound(animFrame1, animFrame2, sound)
/// @param		{s32}		animFrame1
/// @param		{s32}		animFrame2
/// @param		{s32}		sound
function cur_obj_unused_play_footstep_sound(animFrame1, animFrame2, sound) {
    if (cur_obj_check_anim_frame(animFrame1) || cur_obj_check_anim_frame(animFrame2)) {
        cur_obj_play_sound_2(sound);
    }
}

/// <pygml?v=1.0&h=1c5ebb6f5>
/// @function	enable_time_stop_including_mario()
function enable_time_stop_including_mario() {
    var o = gCurrentObject;
    gTimeStopState |= TIME_STOP_ENABLED | TIME_STOP_MARIO_AND_DOORS;
    o.activeFlags |= ACTIVE_FLAG_INITIATED_TIME_STOP;
}

/// <pygml?v=1.0&h=b49c299e3>
/// @function	cur_obj_check_interacted()
/// @returns	s32
function cur_obj_check_interacted() {
    var o = gCurrentObject;

    if (o.rawData[oInteractStatus] & INT_STATUS_INTERACTED) {
        o.rawData[oInteractStatus] = 0;
        return true;
    } else {
        return false;
    }
}

/// <pygml?v=1.0&h=5701fdcda>
/// @function	cur_obj_spawn_loot_blue_coin()
function cur_obj_spawn_loot_blue_coin() {
    var o = gCurrentObject;

    if (o.rawData[oNumLootCoins] >= 5) {
        spawn_object(o, MODEL_BLUE_COIN, bhvMrIBlueCoin);
        o.rawData[oNumLootCoins] -= 5;
    }
}

/// <pygml?v=1.0&h=c606f57e1>
/// @function	cur_obj_spawn_star_at_y_offset(targetX, targetY, targetZ, offsetY)
/// @param		{f32}		targetX
/// @param		{f32}		targetY
/// @param		{f32}		targetZ
/// @param		{f32}		offsetY
function cur_obj_spawn_star_at_y_offset(targetX, targetY, targetZ, offsetY) {
    var o = gCurrentObject;

    var objectPosY = o.rawData[oPosY];
    o.rawData[oPosY] += offsetY + gDebugInfo[5][0];
    spawn_default_star(targetX, targetY, targetZ);
    o.rawData[oPosY] = objectPosY;
}

/// <pygml?v=1.0&h=936dcb498>
/// @function	cur_obj_change_action(action)
/// @param		{s32}		action
function cur_obj_change_action(action) {
    var o = gCurrentObject;

    o.rawData[oAction] = action;
    o.rawData[oPrevAction] = action;
    cur_obj_reset_timer_and_subaction();
}

/// <pygml?v=1.0&h=46cde771e>
/// @function	approach_forward_vel(Ptr.p_arr, spC, sp10)
/// @param		{f32}		Ptr.p_arr
/// @param		{f32}		spC
/// @param		{f32}		sp10
/// @returns	s32
function approach_forward_vel(arr, spC, sp10) {
    var sp4 = 0;
    if (arr > spC) {
        arr -= sp10;
        if (arr < spC)
            arr = spC;
    } else if (arr < spC) {
        arr += sp10;
        if (arr > spC)
            arr = spC;
    } else
        sp4 = 1;
    return sp4;
}
