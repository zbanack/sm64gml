function spawn_scripts_macros_init() {
globalvar gFreeObjectList;
gFreeObjectList	= new ObjectNodeInstance();
boot("spawn_scripts_macros_init");
}

//function init_free_object_list() {
//    var i;
//    var poolLength = OBJECT_POOL_CAPACITY;
//
//    // Add the first object in the pool to the free list
//    obj = gObjectPool[0];
//    gFreeObjectList.next = obj;
//
//    // Link each object in the pool to the following object
//    for (i = 0; i < poolLength - 1; i++) {
//        obj[i].next = obj[i+1].header;
//    }
//
//    // End the list
//    obj[i].next = null;
//}

function clear_object_lists() {
    for (var i = 0; i < NUM_OBJ_LISTS; i++) {
        gObjectLists[i].next = gObjectLists[i];
        gObjectLists[i].prev = gObjectLists[i];
    }
}
	
function try_allocate_object(destList) {
		
	var nextObj = new ObjectNodeInstance();
	nextObj.wrapperObject = null;
	nextObj.next = null;
	nextObj.prev = null;
	nextObj.gfx = new ObjectNodeGfx();
	nextObj.gfx.node = new ObjectNodeGfxNode();
	nextObj.gfx.wrapperObjectNode = null;
	nextObj.gfx.angle = Vec3s;
	nextObj.gfx.pos = Vec3f;
	nextObj.gfx.scale = Vec3f;
		
	nextObj.gfx.node.type = GRAPH_NODE_TYPE_OBJECT;
	nextObj.gfx.node.flags = 0;
	nextObj.gfx.node.prev = null;
	nextObj.gfx.node.next = null;
	nextObj.gfx.node.children = new Array(); // once
	nextObj.gfx.node.wrapper = null;
		
	nextObj.gfx.sharedChild = new ObjectNodeSharedChild();
    nextObj.gfx.sharedChild.type = null;
    nextObj.gfx.sharedChild.flags = null;
    nextObj.gfx.sharedChild.prev = null;
    nextObj.gfx.sharedChild.next = null;
    nextObj.gfx.sharedChild.children = new Array();

    nextObj.gfx.wrapperObjectNode = nextObj;
    nextObj.gfx.node.wrapper = nextObj.gfx;
		
	var newObject = new NewObjectInstance();
	newObject.header = nextObj;
	newObject.rawData = array_create(0x50, 0);
		
    nextObj.wrapperObject = newObject;

    nextObj.prev = destList.prev;
    nextObj.next = destList;
    destList.prev.next = nextObj;
    destList.prev = nextObj;

    geo_add_child(gObjParentGraphNode.node, nextObj.gfx.node);
    return nextObj.wrapperObject;
}
	
function allocate_object(objList) {
		
    var obj = try_allocate_object(objList, gFreeObjectList);

    obj.parentObj = obj;
    obj.prevObj = null;
    obj.collidedObjInteractTypes = 0;
    obj.numCollidedObjs = 0; /// possibly unnecessary
    obj.collidedObjs = new Array(); // once

    obj.unused1 = 0;
    obj.bhvStackIndex = 0;
    obj.bhvDelayTimer = 0;
    
    obj.hitboxRadius = 50.0;
    obj.hitboxHeight = 100.0;
    obj.hurtboxRadius = 0.0;
    obj.hurtboxHeight = 0.0;
    obj.hitboxDownOffset = 0.0;
    obj.unused2 = 0;
	
	obj.rawData = array_create(0x50);
    
    obj.platform = null;
    obj.collisionData = null;
    obj.rawData[oIntangibleTimer] = -1;
    obj.rawData[oDamageOrCoinValue] = 0;
    obj.rawData[oHealth] = 2048;
    obj.activeFlags = ACTIVE_FLAG_ACTIVE | ACTIVE_FLAG_UNK8;
		
	obj.first_frame_of_life = true;

    obj.rawData[oCollisionDistance] = 1000.0;
    obj.rawData[oDrawingDistance] = 4000.0;

    obj.transform = matrix_build_identity();

    obj.respawnInfoType = RESPAWN_INFO_TYPE_NULL;
    obj.respawnInfo = null;

    obj.rawData[oDistanceToMario] = 19000.0;
    obj.rawData[oRoom] = -1;
		
	obj.behavior = null;
    
    obj.header.gfx.node.flags &= ~GRAPH_RENDER_INVISIBLE;
    obj.header.gfx.pos = [ -10000.0, -10000.0, -10000.0 ];
    obj.header.gfx.throwMatrix = null;

    return obj;
}
	
function snap_object_to_floor(obj) {
    var surface = {};

    obj.rawData[oFloorHeight] = find_floor(obj.rawData[oPosX], obj.rawData[oPosY], obj.rawData[oPosZ], surface);
	
	surface = surface._floor;

    if (obj.rawData[oFloorHeight] + 2.0 > obj.rawData[oPosY] && obj.rawData[oPosY] > obj.rawData[oFloorHeight] - 10.0) {
        obj.rawData[oPosY] = obj.rawData[oFloorHeight];
        obj.rawData[oMoveFlags] |= OBJ_MOVE_ON_GROUND;
    }		
}
	
function create_object(bhvScript) {

    var objListIndex;
	var behavior = bhvScript;
	
    if (bhvScript[0][0] == BCMD_BEGIN) {
        objListIndex = bhvScript[0][1];
    } else {
        objListIndex =  OBJ_LIST_DEFAULT;
    }

    var objList = gObjectLists[objListIndex];

    var obj = allocate_object(objList);
    obj.bhvScript = new BhvScriptInstance();
	obj.bhvScript.commands = bhvScript;
	obj.bhvScript.index = 0;
	obj.behavior = bhvScript;
	obj.online_ID = -1;

    if (objListIndex == OBJ_LIST_UNIMPORTANT) {
        obj.activeFlags |= ACTIVE_FLAG_UNIMPORTANT;
    }

    if (objListIndex == OBJ_LIST_POLELIKE || 
        objListIndex == OBJ_LIST_GENACTOR ||
        objListIndex == OBJ_LIST_PUSHABLE) {
            snap_object_to_floor(obj);
	}

    return obj;
}

/// <pygml?v=1.0&h=09494723c>
/// @function	deallocate_object(freeList, obj)
/// @desc		Remove the given object from the object list that it's
///					currently in, and  insert it at the beginning of the free
///					list (singly linked).
/// @param		{struct}	freeList
/// @param		{struct}	obj
function deallocate_object(freeList, obj) {
    // Remove from object list
    obj.next.prev = obj.prev;
    obj.prev.next = obj.next;

    // Insert at beginning of free list
    //obj.next = freeList.next;
    //freeList.next = obj;
}

/// <pygml?v=1.0&h=2ab931ffb>
/// @function	unload_object(obj)
/// @desc		Free the given object.
/// @param		{struct}	obj
function unload_object(obj) {
    obj.activeFlags = ACTIVE_FLAG_DEACTIVATED;
    obj.prevObj = null;

    obj.header.gfx.throwMatrix = null;
    //func_803206F8(obj.header.gfx.cameraToObject);
    geo_remove_child(obj.header.gfx.node);
    geo_add_child(gObjParentGraphNode.node, obj.header.gfx.node);

    obj.header.gfx.node.flags &= ~GRAPH_RENDER_BILLBOARD;
    obj.header.gfx.node.flags &= ~GRAPH_RENDER_ACTIVE;

	//log("Unloaded object!");
    deallocate_object(gFreeObjectList, obj.header); //@z @TODO @object pooling
} 

/// <pygml?v=1.0&h=ff88625e0>
/// @function	mark_obj_for_deletion(obj)
/// @desc		Mark an object to be unloaded at the end of the frame.
/// @param		{struct}	obj
function mark_obj_for_deletion(obj) {
    //! Same issue as obj_mark_for_deletion
    obj.activeFlags = ACTIVE_FLAG_DEACTIVATED;
}




function BhvScriptInstance() constructor {
	
}

function ObjectNodeInstance() constructor {
}

function ObjectNodeGfx() constructor {
}

function ObjectNodeGfxNode() constructor {
}

function ObjectNodeSharedChild() constructor {
}

function NewObjectInstance() constructor {
}