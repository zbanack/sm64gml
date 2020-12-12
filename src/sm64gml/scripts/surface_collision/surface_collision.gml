function surface_collision_macros_init() {
	#macro LEVEL_BOUNDARY_MAX  0x2000
	#macro CELL_SIZE           0x400       
	#macro CELL_HEIGHT_LIMIT   20000.0
	#macro FLOOR_LOWER_LIMIT  -11000.0

	globalvar gNumStaticSurfaces, gNumStaticSurfaceNodes;
	gNumStaticSurfaces		= 0;
	gNumStaticSurfaceNodes	= 0;
	
	globalvar sFloorGeo;
	sFloorGeo = new FloorGeometry();

	boot("surface_collision_macros_init");
}

function WallCollisionData(_x, _y, _z, _offsetY, _radius, _unk14, _numWalls) constructor {
	x = _x;
	y = _y;
	z = _z;
	offsetY = _offsetY;
	radius = _radius;
	unk14 = _unk14;
	numWalls = _numWalls;
	walls = array_create(4);
}

function FloorGeometry(_normalX, _normalY, _normalZ, _originOffset) constructor {
    normalX = _normalX;
    normalY = _normalY;
    normalZ = _normalZ;
    originOffset = _originOffset;
}
/**************************************************
 *                      WALLS                     *
 **************************************************/

/**
 * Iterate through the list of walls until all walls are checked and
 * have given their wall push.
 */
function find_wall_collisions_from_list(surfaceNode, data) {

    var radius = min(data.radius, 200);
    var numCols = 0
    var xx = data.x;
	var yy = data.y + data.offsetY;
	var z = data.z;
		
	var radius = data.radius;

	var sv1, sv2, sv3;
		
    while (surfaceNode != null) {
        var surf = surfaceNode.surface;
		if (surf == null) break;
        surfaceNode = surfaceNode.next;

        // Exclude a large number of walls immediately to optimize.
        if (yy < surf.lowerY || yy > surf.upperY) continue;

        var offset = surf.normal.x * xx + surf.normal.y * yy + surf.normal.z * z + surf.originOffset;

        if (offset < -radius || offset > radius) continue;

        var px = xx;
		var pz = z;
			
		sv1 = surf.vertex1;
		sv2 = surf.vertex2;
		sv3 = surf.vertex3;

        if (surf.flags & SURFACE_FLAG_X_PROJECTION) {
            var w1 = -sv1[2];
			var w2 = -sv2[2];
			var w3 = -sv3[2];
            var y1 = sv1[1];
			var y2 = sv2[1];
			var y3 = sv3[1];

            if (surf.normal.x > 0) {
                if ((y1 - yy) * (w2 - w1) - (w1 - -pz) * (y2 - y1) > 0.0) continue;
                if ((y2 - yy) * (w3 - w2) - (w2 - -pz) * (y3 - y2) > 0.0) continue;
                if ((y3 - yy) * (w1 - w3) - (w3 - -pz) * (y1 - y3) > 0.0) continue;
            } else {
                if ((y1 - yy) * (w2 - w1) - (w1 - -pz) * (y2 - y1) < 0.0) continue;
                if ((y2 - yy) * (w3 - w2) - (w2 - -pz) * (y3 - y2) < 0.0) continue;
                if ((y3 - yy) * (w1 - w3) - (w3 - -pz) * (y1 - y3) < 0.0) continue;
            }

        } else {
            var w1 = sv1[0];
			var w2 = sv2[0];
			var w3 = sv3[0];
            var y1 = sv1[1];
			var y2 = sv2[1];
			var y3 = sv3[1];

            if (surf.normal.z > 0) {
                if ((y1 - yy) * (w2 - w1) - (w1 - px) * (y2 - y1) > 0.0) continue;
                if ((y2 - yy) * (w3 - w2) - (w2 - px) * (y3 - y2) > 0.0) continue;
                if ((y3 - yy) * (w1 - w3) - (w3 - px) * (y1 - y3) > 0.0) continue;
            } else {
                if ((y1 - yy) * (w2 - w1) - (w1 - px) * (y2 - y1) < 0.0) continue;
                if ((y2 - yy) * (w3 - w2) - (w2 - px) * (y3 - y2) < 0.0) continue;
                if ((y3 - yy) * (w1 - w3) - (w3 - px) * (y1 - y3) < 0.0) continue;
            }

        }


        // Determine if we are checking for the camera or not.
        if (gCheckingSurfaceCollisionsForCamera != 0) {
            if (surf.flags & SURFACE_FLAG_NO_CAM_COLLISION) continue;
        }
        else {
            if (surf.type == SURFACE_CAMERA_BOUNDARY) continue;
				
	        // If an object can pass through a vanish cap wall, pass through.
	        if (surf.type == SURFACE_VANISH_CAP_WALLS) {
	            // If an object can pass through a vanish cap wall, pass through.
	            if (gCurrentObject != null
	                && (gCurrentObject.activeFlags & ACTIVE_FLAG_MOVE_THROUGH_GRATE)) {
	                continue;
	            }

	            // If Mario has a vanish cap, pass through the vanish cap wall.
	            if (gCurrentObject != null && gCurrentObject == gMarioObject
	                && (gMarioState.flags & MARIO_VANISH_CAP)) {
	                continue;
	            }
	        }
        }

        //! (Wall Overlaps) Because this doesn't update the x and z local variables,
        //  multiple walls can push mario more than is required.
        data.x += surf.normal.x * (radius - offset);
        data.z += surf.normal.z * (radius - offset);

        //! (Unreferenced Walls) Since this only returns the first four walls,
        //  this can lead to wall interaction being missed. Typically unreferenced walls
        //  come from only using one wall, however.
        if (data.numWalls < 4) {
            data.walls[data.numWalls++] = (surf);
        }

        numCols++;
    }

    return numCols;
}

	
/// <pygml?v=1.0&h=2d84d9d06>
/// @function	f32_find_wall_collision(Ptr.p_xPtr, Ptr.p_yPtr, Ptr.p_zPtr, offsetY, radius)
/// @desc		Formats the position and wall search for
///					find_wall_collisions.
/// @param		{f32}		Ptr.p_xPtr
/// @param		{f32}		Ptr.p_yPtr
/// @param		{f32}		Ptr.p_zPtr
/// @param		{f32}		offsetY
/// @param		{f32}		radius
/// @returns	s32
function f32_find_wall_collision(xPtr, yPtr, zPtr, offsetY, radius) {
	
	var collision = {};
	var numCollisions = 0;

	collision.offsetY = offsetY;
	collision.radius = radius;

	collision.x = xPtr;
	collision.y = yPtr;
	collision.z = zPtr;

	collision.numWalls = 0;

	numCollisions = find_wall_collisions(collision);

	xPtr = collision.x;
	yPtr = collision.y;
	zPtr = collision.z;

	Ptr.p_xPtr = xPtr;
	Ptr.p_yPtr = yPtr;
	Ptr.p_zPtr = zPtr;
	return numCollisions;
}


function find_wall_collisions(colData) {

	var numCollisions = 0;

	var xx = colData.x;
	var z = colData.z;

	colData.numWalls = 0;

	if (xx <= -LEVEL_BOUNDARY_MAX || xx >= LEVEL_BOUNDARY_MAX || z <= -LEVEL_BOUNDARY_MAX || z >= LEVEL_BOUNDARY_MAX) {
	    return numCollisions;
	}

	// World (level) consists of a 16x16 grid. Find where the collision is on
	// the grid (round toward -inf)
	var cellX, cellZ;
	cellX = ((xx + LEVEL_BOUNDARY_MAX) / CELL_SIZE) & (NUM_CELLS - 1);
	cellZ = ((z + LEVEL_BOUNDARY_MAX) / CELL_SIZE) & (NUM_CELLS - 1);

		
	// Check for surfaces belonging to objects.
	var node = gDynamicSurfacePartition[cellZ][cellX][SPATIAL_PARTITION_WALLS].next;
	numCollisions += find_wall_collisions_from_list(node, colData);

	// Check for surfaces that are a part of level geometry.
	node = gStaticSurfacePartition[cellZ][cellX][SPATIAL_PARTITION_WALLS].next;
	numCollisions += find_wall_collisions_from_list(node, colData);

	return numCollisions;
}

/**************************************************
 *                     CEILINGS                   *
 **************************************************/
 /// <pygml?v=1.0&h=41b8fcc91>
/// @function	find_ceil_from_list(surfaceNode, x, y, z, Ptr.p_pheight)
/// @desc		Iterate through the list of ceilings and find the first
///					ceiling over a given point.
/// @param		{struct}	surfaceNode
/// @param		{s32}		x
/// @param		{s32}		y
/// @param		{s32}		z
/// @param		{f32}		Ptr.p_pheight
/// @returns	s32
function find_ceil_from_list(surfaceNode, _x, _y, _z, pheight) {
	var surf;
	var x1, z1, x2, z2, x3, z3;
	var _ceil = null;

	_ceil = null;

	// Stay in this loop until out of ceilings.
	while (surfaceNode != null) {
		
	    surf = surfaceNode.surface;
	    surfaceNode = surfaceNode.next;

	    x1 = surf.vertex1[0];
	    z1 = surf.vertex1[2];
	    z2 = surf.vertex2[2];
	    x2 = surf.vertex2[0];

	    // Checking if point is in bounds of the triangle laterally.
	    if ((z1 - _z) * (x2 - x1) - (x1 - _x) * (z2 - z1) > 0) {
	        continue;
	    }

	    // Slight optimization by checking these later.
	    x3 = surf.vertex3[0];
	    z3 = surf.vertex3[2];
	    if ((z2 - _z) * (x3 - x2) - (x2 - _x) * (z3 - z2) > 0) {
	        continue;
	    }
	    if ((z3 - _z) * (x1 - x3) - (x3 - _x) * (z1 - z3) > 0) {
	        continue;
	    }

	    // Determine if checking for the camera or not.
	    if (gCheckingSurfaceCollisionsForCamera != 0) {
	        if (surf.flags & SURFACE_FLAG_NO_CAM_COLLISION) {
	            continue;
	        }
	    }
	    // Ignore camera only surfaces.
	    else if (surf.type == SURFACE_CAMERA_BOUNDARY) {
	        continue;
	    }

	    {
	        var nx = surf.normal.x;
	        var ny = surf.normal.y;
	        var nz = surf.normal.z;
	        var oo = surf.originOffset;
	        var height;

	        // If a wall, ignore it. Likely a remnant, should never occur.
	        if (ny == 0.0) {
	            continue;
	        }

	        // Find the _ceil height at the specific point.
	        height = -(_x * nx + nz * _z + oo) / ny;

	        // Checks for ceiling interaction with a 78 unit buffer.
	        //! (Exposed Ceilings) Because any point above a ceiling counts
	        //  as interacting with a ceiling, ceilings far below can cause
	        // "invisible walls" that are really just exposed ceilings.
	        if (_y - (height - -78.0) > 0.0) {
	            continue;
	        }

	        pheight = height;
	        _ceil = surf;
	        Ptr.p_pheight = pheight;
	        break;
	    }
	}

	//! (Surface Cucking) Since only the first _ceil is returned and not the lowest,
	//  lower ceilings can be "cucked" by higher ceilings.
	Ptr.p_pheight = pheight;
	return _ceil;
}
	
/// <pygml?v=1.0&h=371ee84c0>
/// @function	find_ceil(posX, posY, posZ, pceil)
/// @desc		Find the lowest ceiling above a given position and return
///					the height.
/// @param		{f32}		posX
/// @param		{f32}		posY
/// @param		{f32}		posZ
/// @param		{struct}	pceil
/// @returns	f32
function find_ceil(posX, posY, posZ, pceil) {
	var cellZ, cellX;
	var _ceil, dynamicCeil;
	var surfaceList;
	var height = 20000.0;
	var dynamicHeight = 20000.0;
	var _x, _y, _z;

	//! (Parallel Universes) Because position is casted to an s16, reaching higher
	// float locations  can Ptr.p_pceil = pceil;
	_x = posX;
	_y = posY;
	_z = posZ;
	pceil = null;

	if (_x <= -LEVEL_BOUNDARY_MAX || _x >= LEVEL_BOUNDARY_MAX) {
	    Ptr.p_pceil = pceil;
	    return height;
	}
	if (_z <= -LEVEL_BOUNDARY_MAX || _z >= LEVEL_BOUNDARY_MAX) {
	    Ptr.p_pceil = pceil;
	    return height;
	}

	// Each level is split into cells to limit load, find the appropriate cell.
	cellX = ((_x + LEVEL_BOUNDARY_MAX) / CELL_SIZE) & 0xF;
	cellZ = ((_z + LEVEL_BOUNDARY_MAX) / CELL_SIZE) & 0xF;

	// Check for surfaces belonging to objects.
	surfaceList = gDynamicSurfacePartition[cellZ][cellX][SPATIAL_PARTITION_CEILS].next;
	dynamicCeil = find_ceil_from_list(surfaceList, _x, _y, _z, dynamicHeight);
	dynamicHeight = Ptr.p_pheight;

	// Check for surfaces that are a part of level geometry.
	surfaceList = gStaticSurfacePartition[cellZ][cellX][SPATIAL_PARTITION_CEILS].next;
	_ceil = find_ceil_from_list(surfaceList, _x, _y, _z, height);
	height = Ptr.p_pheight;

	if (dynamicHeight < height) {
	    _ceil = dynamicCeil;
	    height = dynamicHeight;
	}

	pceil = _ceil;

	// Increment the debug tracker.
	//gNumCalls._ceil += 1;

	Ptr.p_pceil = pceil;
	return height;
}	

/**************************************************
 *                     FLOORS                     *
 **************************************************/
 /// <pygml?v=1.0&h=aac9beed3>
/// @function	unused_obj_find_floor_height(obj)
/// @desc		Find the height of the highest floor below an object.
/// @param		{struct}	obj
/// @returns	f32
function unused_obj_find_floor_height(obj) {
    var _floor = {};
    var floorHeight = find_floor(obj.rawData[oPosX], obj.rawData[oPosY], obj.rawData[oPosZ], _floor)
    _floor = _floor._floor;
    return floorHeight;
}



function find_floor_height_and_data(xPos, yPos, zPos, floorGeo) {
		
	var floorWrapper = {};
	var floorHeight = find_floor(xPos, yPos, zPos, floorWrapper)

	var floorWrapperFloor	= floorWrapper._floor;
		
	if (floorWrapperFloor != null) {
			
	    floorGeo.normalX		= floorWrapperFloor.normal.x;
	    floorGeo.normalY		= floorWrapperFloor.normal.y;
	    floorGeo.normalZ		= floorWrapperFloor.normal.z;
	    floorGeo.originOffset	= floorWrapperFloor.originOffset;
	}
		
	delete floorWrapper;

	return floorHeight;
}


function find_floor_from_list(surfaceNode, xx, yy, z, pheightWrapper) {
    var _floor = null;
	
    while (surfaceNode!=null) {
        var surf = surfaceNode.surface;
        surfaceNode = surfaceNode.next;

        var x1 = surf.vertex1[0]
        var z1 = surf.vertex1[2]
        var x2 = surf.vertex2[0]
        var z2 = surf.vertex2[2]

        // Check that the point is within the triangle bounds.
        if ((z1 - z) * (x2 - x1) - (x1 - xx) * (z2 - z1) < 0) continue;
    
        // To slightly save on computation time, set this later.
        var x3 = surf.vertex3[0];
        var z3 = surf.vertex3[2];
    
        if ((z2 - z) * (x3 - x2) - (x2 - xx) * (z3 - z2) < 0) continue;
        if ((z3 - z) * (x1 - x3) - (x3 - xx) * (z1 - z3) < 0) continue;

        // Determine if we are checking for the camera or not.
        if (gCheckingSurfaceCollisionsForCamera != 0) {
            if (surf.flags & SURFACE_FLAG_NO_CAM_COLLISION) continue;
        }
        // If we are not checking for the camera, ignore camera only floors.
        else if (surf.type == SURFACE_CAMERA_BOUNDARY) continue;

        var nx = surf.normal.x;
        var ny = surf.normal.y;
        var nz = surf.normal.z;
        var oo = surf.originOffset;

        // Find the height of the floor at a given location.
        var height = -(xx * nx + nz * z + oo) / ny;
        // Checks for floor interaction with a 78 unit buffer.
        if (yy - (height + -78.0) < 0.0) continue;

        pheightWrapper.height = height;
        _floor = surf;
        break;
    }

    return _floor;
}
	

/**
	* Find the height of the highest floor below a point.
	*/
function find_floor_height(x, y, z) {
	var _floor = {};

	var floorHeight = find_floor(x, y, z, _floor);
	_floor = _floor._floor;
	return floorHeight;
}
	
	
function find_floor(xPos, yPos, zPos, floorWrapper) {

    floorWrapper._floor = null;
		
	var _dynamicHeight = {};
	_dynamicHeight.height = -11000.0;

    if (xPos <= -LEVEL_BOUNDARY_MAX || xPos >= LEVEL_BOUNDARY_MAX || zPos <= -LEVEL_BOUNDARY_MAX || zPos >= LEVEL_BOUNDARY_MAX) { 
        return -11000.0;
    }
		
    // Each level is split into cells to limit load, find the appropriate cell.
	var cellX, cellZ;
    cellX = ((xPos + LEVEL_BOUNDARY_MAX) / CELL_SIZE) & 0xF;
    cellZ = ((zPos + LEVEL_BOUNDARY_MAX) / CELL_SIZE) & 0xF;

	// Check for surfaces belonging to objects.
	var surfaceList = gDynamicSurfacePartition[cellZ][cellX][SPATIAL_PARTITION_FLOORS].next;
	var dynamicFloor = find_floor_from_list(surfaceList, xPos, yPos, zPos, _dynamicHeight);
	var dynamicHeight = _dynamicHeight.height;
	_dynamicHeight._floor = dynamicFloor;
		
    surfaceList = gStaticSurfacePartition[cellZ][cellX][SPATIAL_PARTITION_FLOORS].next;
    var heightWrapper = {};
	heightWrapper.height = 0;
    floorWrapper._floor = find_floor_from_list(surfaceList, xPos, yPos, zPos, heightWrapper);

	var _height = heightWrapper.height;
		
	if (dynamicHeight > _height) {
	    floorWrapper._floor = dynamicFloor;
	    _height = dynamicHeight;
	}
		
		
    return _height;

}
	
/**************************************************
 *               ENVIRONMENTAL BOXES              *
 **************************************************/
 
function find_water_level(x, z) {
	return -20000.0; // @TODO // @z	
}

function find_poison_gas_level(x, z) {
	return -20000.0; // @TODO // @z	
}

