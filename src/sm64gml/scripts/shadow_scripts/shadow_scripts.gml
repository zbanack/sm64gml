function shadow_scripts_macros_init() {
#macro SHADOW_CIRCLE_9_VERTS				(0)
#macro SHADOW_CIRCLE_4_VERTS				(1)
#macro SHADOW_CIRCLE_4_VERTS_FLAT_UNUSED	(2)
#macro SHADOW_SQUARE_PERMANENT				(10)
#macro SHADOW_SQUARE_SCALABLE				(11)
#macro SHADOW_SQUARE_TOGGLABLE				(12)
#macro SHADOW_RECTANGLE_HARDCODED_OFFSET	(50)
#macro SHADOW_CIRCLE_PLAYER					(99)
#macro SHADOW_WITH_9_VERTS					(0)
#macro SHADOW_WITH_4_VERTS					(1)
#macro SHADOW_SHAPE_CIRCLE					(10)
#macro SHADOW_SHAPE_SQUARE					(20)
#macro SHADOW_SOLIDITY_NO_SHADOW			(0)
#macro SHADOW_SOILDITY_ALREADY_SET			(1)
#macro SHADOW_SOLIDITY_NOT_YET_SET			(2)

globalvar sSurfaceTypeBelowShadow,
gShadowAboveWaterOrLava,
gMarioOnIceOrCarpet,
sMarioOnFlyingCarpet;

sSurfaceTypeBelowShadow			= null;
gShadowAboveWaterOrLava			= false;
gMarioOnIceOrCarpet				= false;
sMarioOnFlyingCarpet				= false;

globalvar ShadowPlayerDisplayList;
ShadowPlayerDisplayList = new DisplayList();

boot("shadow_scripts_macros_init");
}

function atan2_deg(a, b) {
    return atan2s(a, b) / 65535 * 360;
}

function correct_shadow_solidity_for_animations(isLuigi, initialSolidity, shadow) {
    if (array_length(gMarioObject) > 1) throw("\nmultiple mario shadows not implemented, @TODO");
    var player = gMarioObject[0];
    var animFrame = player.header.gfx.unk38.animFrame;
    switch (player.header.gfx.unk38.animID) {
        default: return SHADOW_SOLIDITY_NOT_YET_SET;
    }
}

function dim_shadow_with_distance(solidity, distFromFloor) {
    if (solidity < 121) {
        return solidity;
    } else if (distFromFloor <= 0.0) {
        return solidity;
    } else if (distFromFloor >= 600.0) {
        return 120;
    } else {
        return ((120 - solidity) * distFromFloor) / 600.0 + solidity;
    }
}

function scale_shadow_with_distance(initial, distFromFloor) {
    if (distFromFloor <= 0.0) {
        return initial;
    } else if (distFromFloor >= 600.0) {
        return initial * 0.5;
    } else {
        return initial * (1.0 - (0.5 * distFromFloor / 600.0));
    }
}

function init_shadow(s, xPos, yPos, zPos, shadowScale, overwriteSolidity) {
    s.parentX = xPos;
    s.parentY = yPos;
    s.parentZ = zPos;

    var floorGeometry = new ObjectDummy();
    s.floorHeight = find_floor_height_and_data(s.parentX, s.parentY, s.parentZ, floorGeometry);

    if (gShadowAboveWaterOrLava) {
        throw("\nshadow above water or lava, @TODO");
    } else {
        if (s.floorHeight < -10000.0 || floorGeometry.normalY <= 0.0) return 1;

        s.floorNormalX = floorGeometry.normalX;
        s.floorNormalY = floorGeometry.normalY;
        s.floorNormalZ = floorGeometry.normalZ;
        s.floorOriginOffset = floorGeometry.originOffset;
    }

    if (overwriteSolidity) {
        s.solidity = dim_shadow_with_distance(overwriteSolidity, yPos - s.floorHeight);
    }

    s.shadowScale = scale_shadow_with_distance(shadowScale, yPos - s.floorHeight);

    s.floorDownwardAngle = atan2_deg(s.floorNormalZ, s.floorNormalX);

    var floorSteepness = sqrt(s.floorNormalX * s.floorNormalX + s.floorNormalZ * s.floorNormalZ);

    if (floorSteepness == 0.0) {
        s.floorTilt = 0;
    } else {
        s.floorTilt = 90.0 - atan2_deg(floorSteepness, s.floorNormalY);
    }

    return 0;
}

function get_vertex_coords(index, shadowVertexType, coords) {
    coords.x = floor(index % (3 - shadowVertexType) - 1);
    coords.z = floor(index / (3 - shadowVertexType) - 1);

    // This just corrects the 4-vertex case to have consistent results with the
    // 9-vertex case.
    if (shadowVertexType == SHADOW_WITH_4_VERTS) {
        if (coords.x == 0) {
            coords.x = 1;
        }
        if (coords.z == 0) {
            coords.z = 1;
        }
    }
}

function calculate_vertex_xyz(index, s, posVtx, shadowVertexType) {
    var tiltedScale = cos(s.floorTilt * pi / 180.0) * s.shadowScale;
    var downwardAngle = s.floorDownwardAngle * pi / 180.0;

    var coords = new ObjectDummy();
    get_vertex_coords(index, shadowVertexType, coords);

    var halfScale = (coords.x * s.shadowScale) / 2.0;
    var halfTiltedScale = (coords.z * tiltedScale) / 2.0;

    posVtx[@ 0] = (halfTiltedScale * sin(downwardAngle)) + (halfScale * cos(downwardAngle)) + s.parentX;
    posVtx[@ 2] = (halfTiltedScale * cos(downwardAngle)) - (halfScale * sin(downwardAngle)) + s.parentZ;


    if (gShadowAboveWaterOrLava) {
        posVtx[@ 1] = s.floorHeight;
    } else {
        switch (shadowVertexType) {
            case SHADOW_WITH_9_VERTS:
                posVtx[@ 1] = find_floor_height_and_data(posVtx[0], s.parentY, posVtx[2], new ObjectDummy());
                break
            default: throw("\nshadow vertex @TODO");
        }
    }

}

function round_float(num) {
    if (num >= 0.0) {
        return round(num + 0.5);
    } else {
        return round(num - 0.5);
    }
}

function get_texture_coords_9_vertices(vertexNum, textures) {
    textures.X = vertexNum % 3 * 15 - 15;
    textures.Y = vertexNum / 3 * 15 - 15;
}

function make_shadow_vertex_at_xyz(vertices, index, relX, relY, relZ, alpha, shadowVertexType) {

    var vtxX = round_float(relX);
    var vtxY = round_float(relY);
    var vtxZ = round_float(relZ);

    var textures = new ObjectDummy();

    switch (shadowVertexType) {
        case SHADOW_WITH_9_VERTS:
            get_texture_coords_9_vertices(index, textures);
            break
        default: throw("\nshadow vertex @TODO");
    }

    make_vertex(vertices, index, vtxX, vtxY, vtxZ, textures.X << 5, textures.Y << 5, 255, 255, 255, alpha);

}

function extrapolate_vertex_y_position(s, vtxX, vtxZ) {
    return -(s.floorNormalX * vtxX + s.floorNormalZ * vtxZ + s.floorOriginOffset) / s.floorNormalY;
} 

function make_shadow_vertex(vertices, index, s, shadowVertexType) {
    var posVtx = Vec3;

    calculate_vertex_xyz(index, s, posVtx, shadowVertexType);

    posVtx[1] = extrapolate_vertex_y_position(s, posVtx[0], posVtx[2]);

    var relX = posVtx[0] - s.parentX;
    var relY = posVtx[1] - s.parentY;
    var relZ = posVtx[2] - s.parentZ;

    make_shadow_vertex_at_xyz(vertices, index, relX, relY, relZ, s.solidity, shadowVertexType);

}

function add_shadow_to_display_list(displayList, verts, shadowVertexType, shadowShape) {
    switch (shadowShape) {
        case SHADOW_SHAPE_CIRCLE:
            gSPDisplayList(displayList, dl_shadow_circle);
            break;
        case SHADOW_SHAPE_SQUARE:
            throw("\nshadow square @TODO");
		break;
    }
    switch (shadowVertexType) {
        case SHADOW_WITH_9_VERTS:
            gSPVertex(displayList, verts, 9, 0);
            gSPDisplayList(displayList, dl_shadow_9_verts);
            break;
        case SHADOW_WITH_4_VERTS:
            throw("\n4 verts shadow @TODO");
		break;
    }
    gSPDisplayList(displayList, dl_shadow_end);
    gSPEndDisplayList(displayList);
}

function create_shadow_player(xPos, yPos, zPos, shadowScale, solidity, isLuigi) {
    var shadow = new ObjectDummy();
    var ret;
    switch (correct_shadow_solidity_for_animations(isLuigi, solidity, shadow)) {
        case SHADOW_SOLIDITY_NOT_YET_SET:
            ret = init_shadow(shadow, xPos, yPos, zPos, shadowScale, solidity);
            break
        default: throw("\nshadow solidity @TODO");
    }

    if (ret != 0) return null;

    var verts = [0,0,0,0];
    var displayList = ShadowPlayerDisplayList;

    for (var i = 0; i < 9; i++) {
        make_shadow_vertex(verts, i, shadow, SHADOW_WITH_9_VERTS);
    }
    add_shadow_to_display_list(displayList, verts, SHADOW_WITH_9_VERTS, SHADOW_SHAPE_CIRCLE);
    return displayList;
}

function create_shadow_below_xyz(xPos, yPos, zPos, shadowScale, shadowSolidity, shadowType) {

    var floorWrapper = new ObjectDummy();
    find_floor(xPos, yPos, zPos, floorWrapper);

    if (floorWrapper._floor) {
        sSurfaceTypeBelowShadow = floorWrapper._floor.type;
    } else throw("\nno floor @TODO");

    switch (shadowType) {
		// @TODO fixme
        default:
			return create_shadow_player(xPos, yPos, zPos, shadowScale, shadowSolidity, false);
    }

}