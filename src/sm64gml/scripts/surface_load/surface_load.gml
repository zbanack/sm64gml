function surface_load_macros_init() {
	globalvar arr600;
	arr600 = array_create(600);

	#macro SPATIAL_PARTITION_FLOORS		(0)
	#macro SPATIAL_PARTITION_CEILS		(1)
	#macro SPATIAL_PARTITION_WALLS		(2)
	#macro NUM_CELLS					(16)

	globalvar gStaticSurfacePartition, gDynamicSurfacePartition;
	gStaticSurfacePartition	= -1;
	gDynamicSurfacePartition	= -1;
	
	for(var i = 15; i >= 0; i--) {
		for(var j = 15; j >= 0; j--) {
			for(var z = 2; z >= 0; z--) {
				gStaticSurfacePartition[i][j][z] = new SurfaceNode();
				gDynamicSurfacePartition[i][j][z] = new SurfaceNode();
			}
		}
	}

	globalvar gCCMEnteredSlide;
	gCCMEnteredSlide	= 0;

	globalvar sSurfaceNodePool;
	sSurfaceNodePool = null;

	globalvar sSurfacePool;
	sSurfacePool = null;

	globalvar sSurfacePoolSize;
	sSurfacePoolSize = 0;

	globalvar surface_force_lookup;
	surface_force_lookup = array_create(128, 0);
	surface_force_lookup[SURFACE_FLOWING_WATER]				= 1;
	surface_force_lookup[SURFACE_DEEP_MOVING_QUICKSAND]		= 1;
	surface_force_lookup[SURFACE_SHALLOW_MOVING_QUICKSAND]	= 1;
	surface_force_lookup[SURFACE_MOVING_QUICKSAND]			= 1;
	surface_force_lookup[SURFACE_HORIZONTAL_WIND]			= 1;
	surface_force_lookup[SURFACE_INSTANT_MOVING_QUICKSAND]	= 1;
	
	globalvar scope_dataIndex;
	scope_dataIndex			= null;
	globalvar scope_vertexDataIndex;
	scope_vertexDataIndex		= null;

	globalvar gSurfaceNodesAllocated;
	gSurfaceNodesAllocated = 0;

	globalvar gSurfacesAllocated;
	gSurfacesAllocated = 0;
	
	boot("surface_load_macros_init");
}

function SurfaceNode() constructor {
	next	= null;
	surface = null;
}
	

/**
 * Allocate some of the main pool for surfaces (2300 surf) and for surface nodes (7000 nodes).
 */
function alloc_surface_pools() {
	
    sSurfacePoolSize	= 2300;
	for(var i = 7000; i>=0; i--) {
		sSurfaceNodePool[i] = new SurfaceNode();
	}
	for(var i = sSurfacePoolSize; i>=0; i--) {
		sSurfacePool[i] = new Surface();
	}

    gCCMEnteredSlide = 0;
    reset_red_coins_collected();
}

function read_vertex_data(data, dataIndex, vertexDataIndex) {
    var numVertices = data[dataIndex++];
    vertexDataIndex = dataIndex;
    dataIndex += 3 * numVertices;
		
	scope_dataIndex = dataIndex;
	scope_vertexDataIndex = vertexDataIndex;
}

function surf_has_no_cam_collision(surfaceType) {

	return (
		surfaceType == SURFACE_NO_CAM_COLLISION ||
		surfaceType == SURFACE_NO_CAM_COL_VERY_SLIPPERY ||
		surfaceType == SURFACE_SWITCH
	) ? SURFACE_FLAG_NO_CAM_COLLISION : 0;

}

function read_surface_data(vertexData, vertexIndices) {

	var surface;

    var offset1 = 3 * vertexIndices[0];
    var offset2 = 3 * vertexIndices[1];
    var offset3 = 3 * vertexIndices[2];

    var x1 = vertexData[offset1 + 0];
    var y1 = vertexData[offset1 + 1];
    var z1 = vertexData[offset1 + 2];
						 
    var x2 = vertexData[offset2 + 0];
    var y2 = vertexData[offset2 + 1];
    var z2 = vertexData[offset2 + 2];
						
    var x3 = vertexData[offset3 + 0];
    var y3 = vertexData[offset3 + 1];
    var z3 = vertexData[offset3 + 2];

    var nx = (y2 - y1) * (z3 - z2) - (z2 - z1) * (y3 - y2);
    var ny = (z2 - z1) * (x3 - x2) - (x2 - x1) * (z3 - z2);
    var nz = (x2 - x1) * (y3 - y2) - (y2 - y1) * (x3 - x2);

    var mag = sqrt((nx * nx + ny * ny + nz * nz));
	if (mag < 0.0001) return null;
		
    var minY = min(y1, y2, y3);
    var maxY = max(y1, y2, y3);
		
    mag = 1.0 / mag;
    nx *= mag;
    ny *= mag;
    nz *= mag;

    //gSurfacesAllocated++;
	
	surface = alloc_surface();
    surface.vertex1[0] = x1;
    surface.vertex2[0] = x2;
    surface.vertex3[0] = x3;

    surface.vertex1[1] = y1;
    surface.vertex2[1] = y2;
    surface.vertex3[1] = y3;

    surface.vertex1[2] = z1;
    surface.vertex2[2] = z2;
    surface.vertex3[2] = z3;

    surface.normal = {
		x: nx,	
		y: ny,	
		z: nz,	
	}

    surface.originOffset = -(nx * x1 + ny * y1 + nz * z1);

    surface.lowerY = minY - 5;
    surface.upperY = maxY + 5;
	
	return surface;

}

function alloc_surface() {

    var surface = sSurfacePool[gSurfacesAllocated];
    gSurfacesAllocated++;

    surface.type = 0;
    surface.force = 0;
    surface.flags = 0;
    surface._room = 0;
    surface.object = null;

    return surface;
}

function lower_cell_index(coord) {
		
	coord += LEVEL_BOUNDARY_MAX;
	if (coord<0) coord = 0;

    var index = coord / CELL_SIZE;

    if (coord % CELL_SIZE < 50) {
        index -= 1;
    }
	
    if (index < 0) {
        index = 0;
    }
	
    return index;
}

function upper_cell_index(coord) {
		
	coord += LEVEL_BOUNDARY_MAX;
	if (coord<0) coord = 0;

    var index = coord / CELL_SIZE;

    if (coord % CELL_SIZE > CELL_SIZE - 50) {
        index += 1;
    }

    if (index > (NUM_CELLS - 1)) {
        index = (NUM_CELLS - 1);
    }
	
    return index;
}

/**
 * Allocate the part of the surface node pool to contain a surface node.
 */
function alloc_surface_node() {
    var node = sSurfaceNodePool[gSurfaceNodesAllocated];
    gSurfaceNodesAllocated++;

    node.next = null;

    return node;
}

function add_surface_to_cell(dynamic, cellX, cellZ, surface) {

    var newNode = alloc_surface_node();
	
    var listIndex, sortDir, list;

    if (surface.normal.y > 0.01) {
        listIndex = SPATIAL_PARTITION_FLOORS;
        sortDir = 1;
    } else if (surface.normal.y < -0.01) {
        listIndex = SPATIAL_PARTITION_CEILS;
        sortDir = -1;
    } else {
        listIndex = SPATIAL_PARTITION_WALLS;
        sortDir = 0;

        if (surface.normal.x < -0.707 || surface.normal.x > 0.707) {
            surface.flags |= SURFACE_FLAG_X_PROJECTION;
        }
    }

    var surfacePriority = surface.vertex1[1] * sortDir;

	newNode.surface = surface;
		
    list = dynamic ? gDynamicSurfacePartition[cellZ][cellX][listIndex] :
		gStaticSurfacePartition[cellZ][cellX][listIndex];
	
    while (list.next!=null) {
        var priority = list.next.surface.vertex1[1] * sortDir;

        if (surfacePriority > priority) break;

        list = list.next;
    }

    newNode.next = list.next;
    list.next = newNode;

}

function add_surface(surface, dynamic) {

	var sv1, sv2, sv3;
	sv1 = surface.vertex1;
	sv2 = surface.vertex2;
	sv3 = surface.vertex3;
		
    var minX = min(sv1[0], sv2[0], sv3[0]);
    var minZ = min(sv1[2], sv2[2], sv3[2]);
    var maxX = max(sv1[0], sv2[0], sv3[0]);
    var maxZ = max(sv1[2], sv2[2], sv3[2]);

    var minCellX = floor(lower_cell_index(minX));
    var maxCellX = floor(upper_cell_index(maxX));
    var minCellZ = floor(lower_cell_index(minZ));
    var maxCellZ = floor(upper_cell_index(maxZ));

    for (var cellZ = minCellZ; cellZ <= maxCellZ; cellZ++) {
        for (var cellX = minCellX; cellX <= maxCellX; cellX++) {
            add_surface_to_cell(dynamic, (cellX), (cellZ), surface);
        }
    }

}

function load_static_surfaces(data, dataIndex, vertexDataIndex, surfaceType, surfaceRooms) {
    var _room = 0

    var hasForce = surfaceType >= 128 ? false : surface_force_lookup[surfaceType];
    var flags = surf_has_no_cam_collision(surfaceType);

    var numSurfaces = data[dataIndex++];

	var _v1 = [];
	var _v2 = [];
		
    for (var i = 0; i < numSurfaces; i++) {
			
       if (surfaceRooms != null) {
           _room = surfaceRooms;
           surfaceRooms += 1;
       }

		array_copy(_v1, 0, data, vertexDataIndex, (dataIndex - vertexDataIndex));
		array_copy(_v2, 0, data, dataIndex, 3);

        var surface = read_surface_data(_v1, _v2);
		
        if (surface!=null) {

            surface._room = _room;
            surface.type = surfaceType;
            surface.flags = flags;
            surface.force = hasForce ? data[dataIndex + 3] : 0;

            add_surface(surface, false);
				
        }

        dataIndex += hasForce ? 4 : 3;

    }

    return dataIndex;
}

/// <pygml?v=1.0&h=6353ab8dd>
/// @function	clear_dynamic_surfaces()
/// @desc		If not in time stop, clear the surface partitions.
function clear_dynamic_surfaces() {
	if (!(gTimeStopState & TIME_STOP_ACTIVE)) {
        gSurfacesAllocated		= gNumStaticSurfaces;
        gSurfaceNodesAllocated	= gNumStaticSurfaceNodes;

		for(var i = 0; i < 16; i++) {
			for(var j = 0; j < 16; j++) {
			    gDynamicSurfacePartition[i][j][SPATIAL_PARTITION_FLOORS].next = null;
			    gDynamicSurfacePartition[i][j][SPATIAL_PARTITION_CEILS].next = null;
			    gDynamicSurfacePartition[i][j][SPATIAL_PARTITION_WALLS].next = null;
			}
		}
		
	}
}



/**
 * Clears the static (level) surface partitions for new use.
 */
function clear_static_surfaces() {
	
	for(var i = 0; i < 16; i++) {
		for(var j = 0; j < 16; j++) {
		    gStaticSurfacePartition[i][j][SPATIAL_PARTITION_FLOORS].next = null;
		    gStaticSurfacePartition[i][j][SPATIAL_PARTITION_CEILS].next = null;
		    gStaticSurfacePartition[i][j][SPATIAL_PARTITION_WALLS].next = null;
		}
	}
	
}

function load_area_terrain(index, _data, surfaceRooms, macroObjects) {
		
    var dataIndex = 0;
    var vertexDataIndex = 0;

    gSurfaceNodesAllocated = 0;
    gSurfacesAllocated = 0;

	clear_static_surfaces();
		
	var data_len = 5000;
		
	var data = array_create(data_len);
	var max_len = array_length(_data);
	var at = 0;
	for(var i = 0; i < data_len; i++) {
		
		if (i>=max_len-1) break;
		
		var nested_array = _data[i];
			
		if (!is_array(nested_array)) {
			data[at++] = nested_array;
			continue;
		}
			
		var nest_len = array_length(nested_array);
		for(var j = 0; j < nest_len; j++) {
			data[at++] = nested_array[j];
		}
		
		
	}
		
		
	data_len = at;
		
	dataIndex = 0;
		
	var terrainLoadType;

    while (dataIndex < data_len) {
			
        terrainLoadType = data[dataIndex++];
				
		switch(terrainLoadType) {
			case(TERRAIN_LOAD_VERTICES):
		        read_vertex_data(data, dataIndex, vertexDataIndex);

		        dataIndex = scope_dataIndex;
		        vertexDataIndex = scope_vertexDataIndex;			
					
			break;
			case(TERRAIN_LOAD_OBJECTS):
				dataIndex = spawn_special_objects(index, data, dataIndex);
			break;
			default:
				if (terrainLoadType < 0x40) { 
			        dataIndex = load_static_surfaces(data, dataIndex, vertexDataIndex, terrainLoadType, surfaceRooms);
			    }
				else if (terrainLoadType > 0x65) {
			        dataIndex = load_static_surfaces(data, dataIndex, vertexDataIndex, terrainLoadType, surfaceRooms);
			        continue;
			    }					
			break;
		}
			
    }
		
	spawn_macro_objects(index, macroObjects);
		
	gNumStaticSurfaceNodes = gSurfaceNodesAllocated;
	gNumStaticSurfaces = gSurfacesAllocated;
		
	data = -1;		
}

/// <pygml?v=1.0&h=0283d64a4>
/// @function	transform_object_vertices(Ptr.p_data, Ptr.p_vertexData)
/// @desc		Applies an object's transformation to the object's vertices.
/// @param		{s16}		Ptr.p_data
/// @param		{s16}		Ptr.p_vertexData
function transform_object_vertices(data, collisionIndex, vertexData) {
    var vertices;
    var vx, vy, vz;
    var numVertices;

    var objectTransform = Mat4;
    var m = Mat4;

    objectTransform = gCurrentObject.transform;

    numVertices = data[collisionIndex++];
	
	var verticesIndex = collisionIndex;
    vertices = data[verticesIndex];

    if (gCurrentObject.header.gfx.throwMatrix == null) {
        gCurrentObject.header.gfx.throwMatrix = objectTransform;
        obj_build_transform_from_pos_and_angle(gCurrentObject, O_POS_INDEX, O_FACE_ANGLE_INDEX);
    }

    obj_apply_scale_to_matrix(gCurrentObject, m, objectTransform);

	var at = 0;
    // Go through all vertices, rotating and translating them to transform the object.
    while (numVertices-- >0) {
		vertices = data[verticesIndex];

        vx = vertices[0];
        vy = vertices[1];
        vz = vertices[2];
		verticesIndex++;

        //! No bounds check on vertex data
        vertexData[@ at++] = (vx * m[M00] + vy * m[M10] + vz * m[M20] + m[M30]);
        vertexData[@ at++] = (vx * m[M01] + vy * m[M11] + vz * m[M21] + m[M31]);
        vertexData[@ at++] = (vx * m[M02] + vy * m[M12] + vz * m[M22] + m[M32]);
    }

    Ptr.p_data = verticesIndex;
}


/// <pygml?v=1.0&h=915ab70f7>
/// @function	load_object_collision_model()
/// @desc		Transform an object's vertices, reload them, and render the
///					object.
function load_object_collision_model() {
    var unused;
    var vertexData = arr600;

	var collisionIndex = 0;
    var collisionData = gCurrentObject.collisionData;
    var marioDist = gCurrentObject.rawData[oDistanceToMario];
    var tangibleDist = gCurrentObject.rawData[oCollisionDistance];

    // On an object's first frame, the distance is set to 19000.0.
    // If the distance hasn't been updated, update it now.
    if (gCurrentObject.rawData[oDistanceToMario] == 19000.0) {
        marioDist = dist_between_objects(gCurrentObject, gMarioObject[0]);
    }

    // If the object collision is supposed to be loaded more than the
    // drawing distance of 4000, extend the drawing range.
    if (gCurrentObject.rawData[oCollisionDistance] > 4000.0) {
        gCurrentObject.rawData[oDrawingDistance] = gCurrentObject.rawData[oCollisionDistance];
    }

    // Update if no Time Stop, in range, and in the current _room.
    if (!(gTimeStopState & TIME_STOP_ACTIVE) && marioDist < tangibleDist &&
        !(gCurrentObject.activeFlags & ACTIVE_FLAG_IN_DIFFERENT_ROOM)) {
        collisionIndex++;
        transform_object_vertices(collisionData, collisionIndex, vertexData);
		
		collisionIndex = Ptr.p_data;

        // TERRAIN_LOAD_CONTINUE acts as an "end" to the terrain data.
        while (collisionData[collisionIndex] != TERRAIN_LOAD_CONTINUE) {
            load_object_surfaces(collisionData, collisionIndex, vertexData);
			collisionIndex = Ptr.p_data;
			
        }
    }

    if (marioDist < gCurrentObject.rawData[oDrawingDistance]) {
        gCurrentObject.header.gfx.node.flags |= GRAPH_RENDER_ACTIVE;
    } else {
        gCurrentObject.header.gfx.node.flags &= ~GRAPH_RENDER_ACTIVE;
    }
}

/// <pygml?v=1.0&h=a13ae19a1>
/// @function	load_object_surfaces(Ptr.p_data, Ptr.p_vertexData)
/// @desc		Load in the surfaces for the gCurrentObject. This includes
///					setting the flags, exertion, and room.
/// @param		{s16}		Ptr.p_data
/// @param		{s16}		Ptr.p_vertexData
function load_object_surfaces(data, collisionIndex, vertexData) {
    var surfaceType;
    var numSurfaces;
    var hasForce;
    var flags;
    var _room;

	var at = collisionIndex;
    surfaceType = data[at][0];
    numSurfaces = data[at][1];
	at++;

    hasForce = surface_force_lookup[surfaceType];

    flags = surf_has_no_cam_collision(surfaceType) | SURFACE_FLAG_DYNAMIC;

    // The DDD warp is initially loaded at the origin and moved to the proper
    // position in paintings.c and doesn't update its _room, so set it here.
    //if (gCurrentObject.behavior == bhvDddWarp) {
    //    _room = 5; // @z
   // } else {
        _room = 0;
   // }
   
	var _v2 = [];

    for (var i = 0; i < numSurfaces; i++) {

		array_copy(_v2, 0, data[at], 0, 3);

        var surface = read_surface_data(vertexData, _v2);

        if (surface != null) {
            surface.object = gCurrentObject;
            surface.type = surfaceType;
			
            surface.force = hasForce ? (data[at][4]) : 0;
            surface.flags |= flags;
            surface._room = _room;
            add_surface(surface, true);
        }

		at++;
    }

    Ptr.p_data = at;
}


function ObjectDummy() constructor {
}
