function bhv_commands_macros_init() {
	#macro BHV_PROC_CONTINUE (0)
	#macro BHV_PROC_BREAK    (1)

	globalvar gBhvScript;
	gBhvScript = null;
	
	globalvar gRandomSeed16;
	gRandomSeed16	= 0;

	boot("bhv_commands_macros_init");
}

#macro BCMD_BEGIN						bhv_cmd_begin
#macro BCMD_SET_INT						bhv_cmd_set_int
#macro BCMD_SET_FLOAT					bhv_cmd_set_float
#macro BCMD_HITBOX 						bhv_cmd_set_hitbox
#macro BCMD_HURTBOX						bhv_cmd_set_hurtbox
#macro BCMD_LOOP_BEGIN					bhv_cmd_begin_loop
#macro BCMD_REPEAT_BEGIN				bhv_cmd_repeat_begin
#macro BCMD_LOOP_END					bhv_cmd_end_loop
#macro BCMD_REPEAT_END					bhv_cmd_repeat_end
#macro BCMD_CALL						bhv_cmd_call_native
#macro BCMD_CYCL						bhv_cmd_cyclboard
#macro BCMD_BILLBOARD					bhv_cmd_billboard
#macro BCMD_OR_INT						bhv_cmd_or_int
#macro BCMD_BREAK						bhv_cmd_break
#macro BCMD_ANIMATION					bhv_cmd_load_animation
#macro BCMD_ANIMATE						bhv_cmd_animate
#macro BCMD_MODEL						bhv_cmd_load_model
#macro BCMD_PHY							bhv_cmd_set_obj_physics
#macro BCMD_HOME						bhv_cmd_set_home
#macro BCMD_DROP_TO_FLOOR				bhv_cmd_drop_to_floor
#macro BCMD_ADD_INT						bhv_cmd_add_int
#macro BCMD_ADD_FLOAT					bhv_cmd_add_float
#macro BCMD_DEACTIVATE					bhv_cmd_deactivate
#macro BCMD_COLLISION_DATA				bhv_cmd_load_collision_data
#macro BCMD_SPAWN_CHILD					bhv_cmd_spawn_child
#macro BCMD_SCALE						bhv_cmd_scale
#macro BCMD_DISABLE_RENDERING			bhv_cmd_disable_rendering
#macro BCMD_HITBOX_WITH_OFFSET			bhv_cmd_set_hitbox_with_offset
#macro BCMD_INTERACT_TYPE				bhv_cmd_set_interact_type
#macro BCMD_INTERACT_SUBTYPE			bhv_cmd_set_interact_subtype
	
function cur_obj_update() {
		
	var o		= gCurrentObject;
	var mario	= gMarioObject[0];
	var distanceFromMario = 0;

    var objFlags = o.rawData[oFlags];
	
	// Calculate the distance from the object to Mario.
	if (objFlags & OBJ_FLAG_COMPUTE_DIST_TO_MARIO) {
	    o.rawData[oDistanceToMario] = dist_between_objects(o, mario);
	    distanceFromMario = o.rawData[oDistanceToMario];
	} else {
	    distanceFromMario = 0.0;
	}
	
	if (objFlags & OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO) {
	    o.rawData[oAngleToMario] = obj_angle_to_object(o, mario);
	}	
	
    if (o.rawData[oAction] != o.rawData[oPrevAction]) {
        o.rawData[oTimer] = 0;
        o.rawData[oSubAction] = 0;
        o.rawData[oPrevAction] = o.rawData[oAction];
    }
	
    gBhvScript = o.bhvScript;

    var bhvProcResult = BHV_PROC_CONTINUE;

    while (bhvProcResult == BHV_PROC_CONTINUE) {
        var bhvFunc = gBhvScript.commands[gBhvScript.index];
		var func = bhvFunc[0];
		bhvProcResult = func(bhvFunc);
    }
	
	o.bhvScript = gBhvScript;
	
    if (o.rawData[oTimer] < 0x3FFFFFFF) {
        o.rawData[oTimer]++;
    }
		
	// If the object's action has changed, reset the action timer.
	if (o.rawData[oAction] != o.rawData[oPrevAction]) {
	    o.rawData[oTimer] = 0;
		o.rawData[oSubAction] = 0;
	    o.rawData[oPrevAction] = o.rawData[oAction];
	}

	objFlags = o.rawData[oFlags];
	
    if (objFlags & OBJ_FLAG_SET_FACE_ANGLE_TO_MOVE_ANGLE) {
        obj_set_face_angle_to_move_angle(o);
    }

	if (objFlags & OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW) {
	    o.rawData[oFaceAngleYaw] = o.rawData[oMoveAngleYaw];
	}		
		
	if (objFlags & OBJ_FLAG_MOVE_XZ_USING_FVEL) {
	    cur_obj_move_xz_using_fvel_and_yaw();
	}
		
	if (objFlags & OBJ_FLAG_MOVE_Y_WITH_TERMINAL_VEL) {
	    cur_obj_move_y_with_terminal_vel();
	}
		
	if (objFlags & OBJ_FLAG_TRANSFORM_RELATIVE_TO_PARENT) {
	    obj_build_transform_relative_to_parent(o);
	}

	if (objFlags & OBJ_FLAG_SET_THROW_MATRIX_FROM_TRANSFORM) {
	    obj_set_throw_matrix_from_transform(o);
	}

    if (objFlags & OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE) {
        obj_update_gfx_pos_and_angle(o);
    }
		
	// Handle visibility of object
	if (o.rawData[oRoom] != -1) {
	    // If the object is in a room, only show it when Mario is in the room.
	    cur_obj_enable_rendering_if_mario_in_room();
	} else if ((objFlags & OBJ_FLAG_COMPUTE_DIST_TO_MARIO) && o.collisionData == null) {
	    if (!(objFlags & OBJ_FLAG_ACTIVE_FROM_AFAR)) {
	        // If the object has a render distance, check if it should be shown.
	        if (distanceFromMario > o.rawData[oDrawingDistance]) {
	            // Out of render distance, hide the object.
	            o.header.gfx.node.flags &= ~GRAPH_RENDER_ACTIVE;
	            o.activeFlags |= ACTIVE_FLAG_FAR_AWAY;
	        } else if (o.rawData[oHeldState] == HELD_FREE) {
	            // In render distance (and not being held), show the object.
	            o.header.gfx.node.flags |= GRAPH_RENDER_ACTIVE;
	            o.activeFlags &= ~ACTIVE_FLAG_FAR_AWAY;
	        }
	    }
	}
}
	
function obj_update_gfx_pos_and_angle(obj) {
	var obj_gfx = obj.header.gfx;
	
    obj_gfx.pos[0] = obj.rawData[oPosX];
    obj_gfx.pos[1] = obj.rawData[oPosY] + obj.rawData[oGraphYOffset];
    obj_gfx.pos[2] = obj.rawData[oPosZ];

    obj_gfx.angle[0] = obj.rawData[oFaceAnglePitch] & 0xFFFF;
    obj_gfx.angle[1] = obj.rawData[oFaceAngleYaw] & 0xFFFF;
    obj_gfx.angle[2] = obj.rawData[oFaceAngleRoll] & 0xFFFF;

}
	
function bhv_cmd_call_native(args) {

	var func = args[1];
	func();
		
    gBhvScript.index++;
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_set_int(args) {
    gCurrentObject.rawData[args[1]] = args[2];
    gBhvScript.index++
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_set_interact_type(args) {
    gCurrentObject.rawData[oInteractType] = args[1];
    gBhvScript.index++
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_set_interact_subtype(args) {
    gCurrentObject.rawData[oInteractionSubtype] = args[1];
    gBhvScript.index++
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_set_float(args) {
    gCurrentObject.rawData[args[1]] = args[2];
    gBhvScript.index++
    return BHV_PROC_CONTINUE;
}

function bhv_cmd_or_int(args) {
    gCurrentObject.rawData[args[1]] |= args[2] & 0xFFFF;
    gBhvScript.index++;
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_add_int(args) {
    gCurrentObject.rawData[args[1]] += args[2];
    gBhvScript.index++
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_add_float(args) {
    gCurrentObject.rawData[args[1]] += args[2];
    gBhvScript.index++
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_load_animation(args) {
		
	var _arr = args[2];
	if (!is_array(_arr)) _arr = [_arr];
	gCurrentObject.animation				= new ObjectDummy();
	gCurrentObject.animation.animList		= _arr;
		
	gCurrentObject.header.gfx.unk38 = new GraphNodeunk38();
	gCurrentObject.header.gfx.unk38.animID = 0;
	gCurrentObject.header.gfx.unk38.curAnim = null;
	gCurrentObject.header.gfx.unk38.animFrame = 0;
	gCurrentObject.header.gfx.unk38.animFrameAccelAssist = 0;
	gCurrentObject.header.gfx.unk38.animAccel = 0x10000;
	gCurrentObject.header.gfx.unk38.animTimer = 0;			
	gCurrentObject.header.gfx.node.flags |= GRAPH_RENDER_HAS_ANIMATION;
		
    gBhvScript.index++;
    return BHV_PROC_CONTINUE;		
}

function bhv_cmd_load_model() {
}

function bhv_cmd_set_obj_physics(args) {
		
	gCurrentObject.rawData[oWallHitboxRadius]	= args[1];
	gCurrentObject.rawData[oGravity]			= args[2] / 100;
	gCurrentObject.rawData[oBounciness]			= args[3] / 100;
	gCurrentObject.rawData[oDragStrength]		= args[4] / 100;
	gCurrentObject.rawData[oFriction]			= args[5] / 100;
	gCurrentObject.rawData[oBuoyancy]			= args[6] / 100;
		
	gBhvScript.index++;
	return BHV_PROC_CONTINUE;
		
}

function bhv_cmd_set_home() {
		
	gCurrentObject.rawData[oHomeX] = gCurrentObject.rawData[oPosX];
	gCurrentObject.rawData[oHomeY] = gCurrentObject.rawData[oPosY];
	gCurrentObject.rawData[oHomeZ] = gCurrentObject.rawData[oPosZ];
		
	gBhvScript.index++;
	return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_cyclboard(args) {
    gCurrentObject.header.gfx.node.flags |= GRAPH_RENDER_CYLBOARD;
    gBhvScript.index++;
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_billboard(args) {
    gCurrentObject.header.gfx.node.flags |= GRAPH_RENDER_BILLBOARD;
    gBhvScript.index++;
    return BHV_PROC_CONTINUE;
}

function bhv_cmd_set_hitbox(args) {
    gCurrentObject.hitboxRadius = args[1];
    gCurrentObject.hitboxHeight = args[2];
    gBhvScript.index++;
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_set_hurtbox(args) {
    gCurrentObject.hurtboxRadius  = args[1];
    gCurrentObject.hurtboxHeight = args[2];
    gBhvScript.index++;
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_set_hitbox_with_offset(args) {
    gCurrentObject.hitboxRadius = args[1];
    gCurrentObject.hitboxHeight = args[2];
    gCurrentObject.hitboxDownOffset = args[3];
    gBhvScript.index++;
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_break(args) {
    return BHV_PROC_BREAK;
}

function bhv_cmd_begin_loop(args) {
    gCurrentObject.bhvStack.push(gBhvScript.index);
    gBhvScript.index++;
	
    return BHV_PROC_CONTINUE;
}

function bhv_cmd_end_loop(args) {
    gBhvScript.index = gCurrentObject.bhvStack.content[(gCurrentObject.bhvStack.size)-1];
    return BHV_PROC_BREAK;
}

function bhv_cmd_begin(args) {
    gCurrentObject.bhvStack = new Array();
    gBhvScript.index++;
    return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_deactivate(args) {
	obj_mark_for_deletion(gCurrentObject);
    return BHV_PROC_BREAK;
}
	
function bhv_cmd_animate(args) {
        
	/*gCurrentObject.animation				= new ObjectDummy();
	gCurrentObject.animation.animList		= [args[0]];
		
	gCurrentObject.header.gfx.unk38 = new GraphNodeunk38();
	gCurrentObject.header.gfx.unk38.animID = 0;
	gCurrentObject.header.gfx.unk38.curAnim = null;
	gCurrentObject.header.gfx.unk38.animFrame = 0;
	gCurrentObject.header.gfx.unk38.animFrameAccelAssist = 0;
	gCurrentObject.header.gfx.unk38.animAccel = 0x10000;
	gCurrentObject.header.gfx.unk38.animTimer = 0;			
	gCurrentObject.header.gfx.node.flags |= GRAPH_RENDER_HAS_ANIMATION;*/
		
	geo_obj_init_animation_accel(
		gCurrentObject.header.gfx,
		gCurrentObject.animation.animList[args[1]],
		1
	);
		
    gBhvScript.index++;
    return BHV_PROC_CONTINUE;		
}	
	
function bhv_cmd_drop_to_floor() {
	var xx = gCurrentObject.rawData[oPosX];
	var yy = gCurrentObject.rawData[oPosY];
	var zz = gCurrentObject.rawData[oPosZ];

	var _floor = find_floor_height(xx, yy + 200.0, zz);
	gCurrentObject.rawData[oPosY] = _floor;
	gCurrentObject.rawData[oMoveFlags] |= OBJ_MOVE_ON_GROUND;

	gBhvScript.index++;
	return BHV_PROC_CONTINUE;
}
	
function bhv_cmd_repeat_begin(args) {
    gBhvScript.index++;
	gCurrentObject.bhvStack.push(gBhvScript.index);
	gCurrentObject.bhvStack.push(args[1]);

    return BHV_PROC_CONTINUE;		
}
	
function bhv_cmd_repeat_end() {
		
	var count = (gCurrentObject.bhvStack.pop())-1;
			
	if (count!=0) {
		gBhvScript.index = gCurrentObject.bhvStack.pop();
			
		gCurrentObject.bhvStack.push(gBhvScript.index);
		gCurrentObject.bhvStack.push(count);
	}
	else {
		gCurrentObject.bhvStack.pop();
		gBhvScript.index++;	
	}
		
    return BHV_PROC_BREAK;		
}
	
function bhv_cmd_load_collision_data(args) {
	gCurrentObject.collisionData = args[1];
	gBhvScript.index++;
    return BHV_PROC_CONTINUE;		
}
	
function bhv_cmd_spawn_child(args) {
		
	var child = spawn_object_at_origin(gCurrentObject, 0, args[1], args[2]);
	obj_copy_pos_and_angle(child, gCurrentObject);
		
	gBhvScript.index++;
    return BHV_PROC_CONTINUE;			
}
	
// Command 0x32: Sets the object's size to the specified percentage.
// Usage: SCALE(unusedField, percent)
function bhv_cmd_scale(args) {
	cur_obj_scale(args[2] * 0.01);
	gBhvScript.index++;
    return BHV_PROC_CONTINUE;	
}
	
/// <pygml?v=1.0&h=e232a4bb3>
/// @function	bhv_cmd_disable_rendering()
/// @returns	s32
function bhv_cmd_disable_rendering() {
	gCurrentObject.header.gfx.node.flags &= ~GRAPH_RENDER_ACTIVE;
	gBhvScript.index++;
    return BHV_PROC_CONTINUE;	
}


function random_u16() {
    var temp1, temp2;

    if (gRandomSeed16 == 22026) {
        gRandomSeed16 = 0;
    }

    temp1 = (gRandomSeed16 & 0x00FF) << 8;
    temp1 = temp1 ^ gRandomSeed16;

    gRandomSeed16 = ((temp1 & 0x00FF) << 8) + ((temp1 & 0xFF00) >> 8);

    temp1 = ((temp1 & 0x00FF) << 1) ^ gRandomSeed16;
    temp2 = (temp1 >> 1) ^ 0xFF80;

    if ((temp1 & 1) == 0) {
        if (temp2 == 43605) {
            gRandomSeed16 = 0;
        } else {
            gRandomSeed16 = temp2 ^ 0x1FF4;
        }
    } else {
        gRandomSeed16 = temp2 ^ 0x8180;
    }

    return gRandomSeed16;
}

function random_float() {
    return (random_u16() / 0x10000);
}

function random_sign() {
	return (random_u16() >= 0x7FFF) ? 1 : -1;
}
