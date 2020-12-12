function object_list_processor_macros_init() {
	
#macro TIME_STOP_UNKNOWN_0         (1 << 0)
#macro TIME_STOP_ENABLED           (1 << 1)
#macro TIME_STOP_DIALOG            (1 << 2)
#macro TIME_STOP_MARIO_AND_DOORS   (1 << 3)
#macro TIME_STOP_ALL_OBJECTS       (1 << 4)
#macro TIME_STOP_MARIO_OPENED_DOOR (1 << 5)
#macro TIME_STOP_ACTIVE            (1 << 6)

global.__gTimeStopState = 0;
#macro gTimeStopState global.__gTimeStopState

globalvar gWDWWaterLevelChanging,
gMarioOnMerryGoRound;

globalvar gCurrentObject;
gCurrentObject = null;

globalvar gMarioObject;
gMarioObject	= null;

globalvar gPrevFrameObjectCount;
gPrevFrameObjectCount = 0;

globalvar gNumRoomedObjectsInMarioRoom, gNumRoomedObjectsNotInMarioRoom, gCheckingSurfaceCollisionsForCamera;
gNumRoomedObjectsInMarioRoom		 = 0;
gNumRoomedObjectsNotInMarioRoom		 = 0;
gCheckingSurfaceCollisionsForCamera  = null;

globalvar gObjectCounter;
gObjectCounter = 0;

#macro OBJECT_POOL_CAPACITY		240

globalvar sObjectListUpdateOrder;
sObjectListUpdateOrder = [ 
	OBJ_LIST_SPAWNER,
	OBJ_LIST_SURFACE,
	OBJ_LIST_POLELIKE,
	OBJ_LIST_PLAYER,
	OBJ_LIST_PUSHABLE,
	OBJ_LIST_GENACTOR,
	OBJ_LIST_DESTRUCTIVE,
	OBJ_LIST_LEVEL,
	OBJ_LIST_DEFAULT,
	OBJ_LIST_UNIMPORTANT,
];

globalvar gObjectLists;
gObjectLists	= array_create(13);
for(var i = 0; i < array_length(gObjectLists); i++) {
		
	gObjectLists[i] = new ObjectDummy();
	gObjectLists[i].blankObj = new ObjectDummy();
	gObjectLists[i].blankObj.prev = gObjectLists[i].blankObj;
	gObjectLists[i].blankObj.next = gObjectLists[i].blankObj;
		
}

	
gObjectCounter = 0;
gCCMEnteredSlide = 0;
gCheckingSurfaceCollisionsForCamera = 0;	

boot("object_list_processor_macros_init");
}
	
function update_objects() {
		
	gTimeStopState &= ~TIME_STOP_MARIO_OPENED_DOOR;
		
	gNumRoomedObjectsInMarioRoom		= 0;
	gNumRoomedObjectsNotInMarioRoom		= 0;
	gCheckingSurfaceCollisionsForCamera = false;
		
	clear_dynamic_surfaces();
		
	update_terrain_objects();
		
	apply_mario_platform_displacement();
		
    detect_object_collisions();
	
    update_non_terrain_objects();
		
	unload_deactivated_objects();
		
	update_mario_platform();
		
	// If time stop was enabled this frame, activate it now so that it will
	// take effect next frame
	if (gTimeStopState & TIME_STOP_ENABLED) {
	    gTimeStopState |= TIME_STOP_ACTIVE;
	} else {
	    gTimeStopState &= ~TIME_STOP_ACTIVE;
	}

	gPrevFrameObjectCount = gObjectCounter;
}
	
function update_terrain_objects() {
	gObjectCounter = update_objects_in_list(gObjectLists[OBJ_LIST_SPAWNER]);
	gObjectCounter += update_objects_in_list(gObjectLists[OBJ_LIST_SURFACE]);		
}
	
function update_non_terrain_objects() {
	for(var i = 2; i < array_length(sObjectListUpdateOrder); i++) {
		gObjectCounter += update_objects_in_list(gObjectLists[sObjectListUpdateOrder[i]]);
	}
}

function update_objects_during_time_stop(objList, firstObj) {
    var count = 0;
    var unfrozen;

    while (objList != firstObj) {
        gCurrentObject = firstObj.wrapperObject;

        unfrozen = false;

        // Selectively unfreeze certain objects
        if (!(gTimeStopState & TIME_STOP_ALL_OBJECTS)) {
            if (gCurrentObject == gMarioObject && !(gTimeStopState & TIME_STOP_MARIO_AND_DOORS)) {
                unfrozen = true;
            }

            if ((gCurrentObject.rawData[oInteractType] & (INTERACT_DOOR | INTERACT_WARP_DOOR))
                && !(gTimeStopState & TIME_STOP_MARIO_AND_DOORS)) {
                unfrozen = true;
            }

            if (gCurrentObject.activeFlags
                & (ACTIVE_FLAG_UNIMPORTANT | ACTIVE_FLAG_INITIATED_TIME_STOP)) {
                unfrozen = true;
            }
        }

        // Only update if unfrozen
        if (unfrozen) {
            gCurrentObject.header.gfx.node.flags |= GRAPH_RENDER_HAS_ANIMATION;
            cur_obj_update();
        } else {
            gCurrentObject.header.gfx.node.flags &= ~GRAPH_RENDER_HAS_ANIMATION;
        }

        firstObj = firstObj.next;
        count++;
    }

    return count;
}
	
function update_objects_in_list(objList) {
    var firstObj = objList.next;
	
	var count = 0;
	if (!(gTimeStopState & TIME_STOP_ACTIVE)) {
		count = update_objects_starting_at(objList, firstObj);
	}
	else {
		count = update_objects_during_time_stop(objList, firstObj);
	}
	
	return count;
}
	
function update_objects_starting_at(objList, firstObj) {
	
	var count = 0;
	
	while (objList != firstObj) {
		
		gCurrentObject = firstObj.wrapperObject;
		gCurrentObject.header.gfx.node.flags |= GRAPH_RENDER_HAS_ANIMATION;
		
		cur_obj_update();
		firstObj = firstObj.next;
		count++;
	}
	
	return count;
}
	
function bhv_mario_update() {
	
    var particleFlags = execute_mario_action(gCurrentObject);
	gCurrentObject.rawData[oMarioParticleFlags] = particleFlags;
	 
    copy_mario_state_to_object();
}
	
function copy_mario_state_to_object() {
	
    var i = 0;
    // L is real
    //if (gCurrentObject != gMarioObject) i = i+1;
	
	var o = gCurrentObject;
	var g = gMarioStates[i];
	var gfx = o.header.gfx;

    o.rawData[oPosX]			= g.pos[0];
    o.rawData[oPosY]			= g.pos[1];
    o.rawData[oPosZ]			= g.pos[2];

    o.rawData[oFaceAnglePitch]	= gfx.angle[0];
    o.rawData[oFaceAngleYaw]	= gfx.angle[1];
    o.rawData[oFaceAngleRoll]	= gfx.angle[2];

    o.rawData[oMoveAnglePitch]	= gfx.angle[0];
    o.rawData[oMoveAngleYaw]	= gfx.angle[1];
    o.rawData[oMoveAngleRoll]	= gfx.angle[2];

    o.rawData[oVelX]			= g.vel[0];
    o.rawData[oVelY]			= g.vel[1];
    o.rawData[oVelZ]			= g.vel[2];

    o.rawData[oAngleVelPitch]	= g.angleVel[0];
    o.rawData[oAngleVelYaw]		= g.angleVel[1];
    o.rawData[oAngleVelRoll]	= g.angleVel[2];
		
}
	
function spawn_objects_from_info(spawnInfo) {
		
    gWDWWaterLevelChanging = false;
    gMarioOnMerryGoRound = 0;

	clear_mario_platform();

    gCCMEnteredSlide |= 1;

    while (spawnInfo!=null) {

        var script = spawnInfo.behaviorScript;

        if ((spawnInfo.behaviorArg & (RESPAWN_INFO_DONT_RESPAWN << 8)) != (RESPAWN_INFO_DONT_RESPAWN << 8)) {

            var object = create_object(script);

            object.rawData[oBehParams] = spawnInfo.behaviorArg;

            object.rawData[oBehParams2ndByte] = ((spawnInfo.behaviorArg) >> 16) & 0xFF;

            object.behavior = script;

            // Record death/collection in the SpawnInfo
            object.respawnInfoType = RESPAWN_INFO_TYPE_32;
            object.respawnInfo = spawnInfo.behaviorArg;

				
                if (spawnInfo.behaviorArg & 0x01) {
                if (gMarioObject != null) { 
                    gMarioObject[1] = object;
                } else { 
                    gMarioObject[0] = object;
                    geo_make_first_child(object.header.gfx.node);
                }
            }

            geo_obj_init_spawninfo(object.header.gfx, spawnInfo);


            object.rawData[oPosX] = spawnInfo.startPos[0];
            object.rawData[oPosY] = spawnInfo.startPos[1];
            object.rawData[oPosZ] = spawnInfo.startPos[2];
    
            object.rawData[oFaceAnglePitch] = spawnInfo.startAngle[0];
            object.rawData[oFaceAngleYaw]	= spawnInfo.startAngle[1];
            object.rawData[oFaceAngleRoll]	= spawnInfo.startAngle[2];
    
            object.rawData[oMoveAnglePitch] = spawnInfo.startAngle[0];
            object.rawData[oMoveAngleYaw]	= spawnInfo.startAngle[1];
            object.rawData[oMoveAngleRoll]	= spawnInfo.startAngle[2];
                
        }

        spawnInfo = spawnInfo.next;
    }

}
	
function clear_objects() {
	clear_object_lists();
}


/// <pygml?v=1.0&h=67e989df2>
/// @function	set_object_respawn_info_bits(obj, bits)
/// @desc		OR the object's respawn info with bits << 8. If bits = 0xFF,
///					this prevents  the object from respawning after leaving and
///					re-entering the area.  For macro objects, respawnInfo points
///					to the 16 bit entry in the macro object  list. For other
///					objects, it points to the 32 bit behaviorArg in the
///					SpawnInfo.
/// @param		{struct}	obj
/// @param		{u8}		bits
function set_object_respawn_info_bits(obj, bits) {

    switch (obj.respawnInfoType) {
        case (RESPAWN_INFO_TYPE_32):
            obj.respawnInfo |= bits << 8;
            break;

        case (RESPAWN_INFO_TYPE_16):
            obj.respawnInfo |= bits << 8;
            break;
    }
}


/// <pygml?v=1.0&h=e2ec53006>
/// @function	unload_deactivated_objects_in_list(objList)
/// @desc		Unload any objects in the list that have been deactivated.
/// @param		{struct}	objList
/// @returns	s32
function unload_deactivated_objects_in_list(objList) {
    var obj = objList.next;

    while (objList != obj) {
        gCurrentObject = obj.wrapperObject;
        obj = obj.next;

        if ((gCurrentObject.activeFlags & ACTIVE_FLAG_ACTIVE) != ACTIVE_FLAG_ACTIVE) {
            // Prevent object from respawning after exiting and re-entering the
            // area
            if (!(gCurrentObject.rawData[oFlags] & OBJ_FLAG_PERSISTENT_RESPAWN)) {
                set_object_respawn_info_bits(gCurrentObject, RESPAWN_INFO_DONT_RESPAWN);
            }

            unload_object(gCurrentObject);
        }
    }

    return 0;
}

/// <pygml?v=1.0&h=765591d0c>
/// @function	unload_deactivated_objects()
/// @desc		Unload deactivated objects in any object list.
function unload_deactivated_objects() {
    var unused;
    var listIndex;

	for(var i = 0; i < array_length(sObjectListUpdateOrder); i++) {
        unload_deactivated_objects_in_list(gObjectLists[sObjectListUpdateOrder[i]]);
    }

    // TIME_STOP_UNKNOWN_0 was most likely intended to be used to track whether
    // any objects had been deactivated
    // gTimeStopState &= ~TIME_STOP_UNKNOWN_0;
}