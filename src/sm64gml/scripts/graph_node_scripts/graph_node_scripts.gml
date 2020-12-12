function graph_node_scripts_macros_init() {
#macro GRAPH_RENDER_ACTIVE						(1 << 0)
#macro GRAPH_RENDER_CHILDREN_FIRST				(1 << 1)
#macro GRAPH_RENDER_BILLBOARD					(1 << 2)
#macro GRAPH_RENDER_Z_BUFFER					(1 << 3)
#macro GRAPH_RENDER_INVISIBLE					(1 << 4)
#macro GRAPH_RENDER_HAS_ANIMATION				(1 << 5)
#macro GRAPH_RENDER_CYLBOARD					(1 << 6)

#macro GRAPH_NODE_TYPE_FUNCTIONAL               0x100

#macro GRAPH_NODE_TYPE_400                      0x400

#macro GRAPH_NODE_TYPE_ROOT                     0x001
#macro GRAPH_NODE_TYPE_ORTHO_PROJECTION         0x002
#macro GRAPH_NODE_TYPE_PERSPECTIVE              0x003 | GRAPH_NODE_TYPE_FUNCTIONAL
#macro GRAPH_NODE_TYPE_MASTER_LIST              0x004
#macro GRAPH_NODE_TYPE_START                    0x00A
#macro GRAPH_NODE_TYPE_LEVEL_OF_DETAIL			0x00B
#macro GRAPH_NODE_TYPE_CAMERA                   0x014 | GRAPH_NODE_TYPE_FUNCTIONAL
#macro GRAPH_NODE_TYPE_TRANSLATION_ROTATION     0x015
#macro GRAPH_NODE_TYPE_TRANSLATION              0x016
#macro GRAPH_NODE_TYPE_ROTATION                 0x017
#macro GRAPH_NODE_TYPE_OBJECT                   0x018
#macro GRAPH_NODE_TYPE_ANIMATED_PART            0x019
#macro GRAPH_NODE_TYPE_BILLBOARD                0x01A
#macro GRAPH_NODE_TYPE_DISPLAY_LIST             0x01B
#macro GRAPH_NODE_TYPE_SCALE                    0x01C
#macro GRAPH_NODE_TYPE_SHADOW                   0x028
#macro GRAPH_NODE_TYPE_OBJECT_PARENT            0x029
#macro GRAPH_NODE_TYPE_GENERATED_LIST           0x02A | GRAPH_NODE_TYPE_FUNCTIONAL
#macro GRAPH_NODE_TYPE_BACKGROUND               0x02C | GRAPH_NODE_TYPE_FUNCTIONAL
#macro GRAPH_NODE_TYPE_CULLING_RADIUS           0x02F
#macro GRAPH_NODE_TYPE_SWITCH_CASE              0x00C | GRAPH_NODE_TYPE_FUNCTIONAL

#macro GFX_NUM_MASTER_LISTS						8

#macro GEO_CONTEXT_CREATE						0
#macro GEO_CONTEXT_RENDER						1
#macro GEO_CONTEXT_AREA_UNLOAD					2
#macro GEO_CONTEXT_AREA_LOAD					3
#macro GEO_CONTEXT_AREA_INIT					4
#macro GEO_CONTEXT_HELD_OBJ						5	

boot("graph_node_scripts_macros_init");
}

/// @function	init_graph_node_object
function init_graph_node_object(graphNode, _sharedChild, _pos, _angle, _scale) {

	if (graphNode == null) graphNode = new GraphNodeLightweight();	
		
	graphNode.node = new GraphNodeNode();
	graphNode.pos = _pos;
	graphNode.angle = _angle;
	graphNode.scale = _scale;
	graphNode.sharedChild = _sharedChild;
	graphNode.unk38 = new GraphNodeunk38();
	graphNode.unk38.animID = 0;
	graphNode.unk38.curAnim = null;
	graphNode.unk38.animFrame = 0;
	graphNode.unk38.animFrameAccelAssist = 0;
	graphNode.unk38.animAccel = 0x10000;
	graphNode.unk38.animTimer = 0;			
	graphNode.node.flags |= GRAPH_RENDER_HAS_ANIMATION;
	
	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_OBJECT);

	return graphNode;

}

/// @function	geo_obj_init_spawninfo
function geo_obj_init_spawninfo(graphNode, spawn) {
		
	if (graphNode == null) graphNode = new GraphNodeLightweight();	

	graphNode.scale = [ 1,1,1 ];
	graphNode.angle = spawn.startAngle ;
	graphNode.pos = spawn.startPos ;

	graphNode.unk18 = spawn.areaIndex;
	graphNode.unk19 = spawn.activeAreaIndex;
	graphNode.sharedChild = spawn.unk18;
	graphNode.unk4C = spawn;
	graphNode.throwMatrix = null;
	graphNode.unk38 = new GraphNodeunk38();
	graphNode.unk38.animID = 0;
	graphNode.unk38.curAnim = null;
	graphNode.unk38.animFrame = 0;
	graphNode.unk38.animFrameAccelAssist = 0;
	graphNode.unk38.animAccel = 0x10000;
	graphNode.unk38.animTimer = 0;		


	graphNode.node.flags |= GRAPH_RENDER_ACTIVE;
	graphNode.node.flags &= ~GRAPH_RENDER_INVISIBLE;
	graphNode.node.flags |= GRAPH_RENDER_HAS_ANIMATION;
	graphNode.node.flags &= ~GRAPH_RENDER_BILLBOARD;
	
	
} 

/// @function	geo_obj_init
function geo_obj_init(graphNode, _sharedChild, _pos, _angle) {

	if (graphNode == null) graphNode = new GraphNodeLightweight();	
	
	graphNode.pos = _pos;
	graphNode.angle = _angle;
	graphNode.scale = [1.0, 1.0, 1.0];
	graphNode.sharedChild = _sharedChild;
	graphNode.throwMatrix = null;
	graphNode.unk38 = new GraphNodeunk38();
	graphNode.unk38.curAnim = null;

	graphNode.node.flags |= GRAPH_RENDER_ACTIVE;
	graphNode.node.flags &= ~GRAPH_RENDER_INVISIBLE;
	graphNode.node.flags |= GRAPH_RENDER_HAS_ANIMATION;
	graphNode.node.flags &= ~GRAPH_RENDER_BILLBOARD;

}

/// @function	geo_reset_object_node
function geo_reset_object_node(graphNode) {
	var zeroVec = Vec3;
	var oneVec = [1, 1, 1]

	graphNode = init_graph_node_object(graphNode, 0, zeroVec, zeroVec, oneVec)
    
	geo_add_child(gObjParentGraphNode.node, graphNode.node)
	graphNode.node.flags &= ~GRAPH_RENDER_ACTIVE
	return graphNode
}

/// @function	geo_make_first_child
function geo_make_first_child(newFirstChild) {
	var parent = newFirstChild.parent;
		
	var firstChild = parent.children.content[(0)];

	var _find = 0;
	var _size = parent.children.size;
	for(var i = 0; i < _size; i++) {
		if (parent.children.content[i] == newFirstChild) {
			_find = i;
			break;
		}
	}
		
	var numRotations = parent.children.size - _find;
    
	if (firstChild != newFirstChild) {
			
	    if (firstChild.prev != newFirstChild) {
	        newFirstChild.prev.next = newFirstChild.next;
	        newFirstChild.next.prev = newFirstChild.prev;
			var lastSibling = firstChild.prev;
	        newFirstChild.prev = lastSibling;
	        newFirstChild.next = firstChild;

			firstChild.prev = newFirstChild;
			lastSibling.next = newFirstChild;

	    }
			
	    //rotate children n times
	    for (var i = 0; i < numRotations; i++) {
	        parent.children.insert(0, parent.children.pop());
	    }
	}

	return parent;
}

/// @function	geo_add_child
function geo_add_child(parent, childNode) {

	if (childNode==null) return null;
		
	childNode.parent = parent;

	var parentFirstChild = null;
	
	if (parent.children.size>0) {
		parentFirstChild = parent.children.content[0];	
	}

	if (parentFirstChild == null) {
		parent.children.push(childNode);
	    childNode.prev = childNode;
	    childNode.next = childNode;

	} else {
	    var parentLastChild = parent.children.content[parent.children.size - 1];
	    var parentLastChild2 = parentFirstChild.prev;
			
	    childNode.prev = parentLastChild;
	    childNode.next = parentFirstChild;
	    parentFirstChild.prev = childNode;
	    parentLastChild.next = childNode;
	    parent.children.push(childNode);

	}

	return childNode;

}

/// <pygml?v=1.0&h=2a36b1f17>
/// @function	geo_remove_child(graphNode)
/// @desc		Remove a node from the scene graph. It changes the links
///					with its  siblings and with its parent, it doesn't
///					deallocate the memory  since geo nodes are allocated in a
///					pointer-bumping pool that  gets thrown out when changing
///					areas.
/// @param		{struct}	graphNode
/// @returns	struct
function geo_remove_child(graphNode) {
    var parent;
    var firstChild;

    parent = graphNode.parent;
    firstChild = parent.children;

    // Remove link with siblings
    graphNode.prev.next = graphNode.next;
    graphNode.next.prev = graphNode.prev;

    // If this node was the first child, a new first child must be chosen
    if (firstChild == graphNode) {
        // The list is circular, so this checks whether it was the only child
        if (graphNode.next == graphNode) {
            firstChild = null; // Parent has no children anymore
        } else {
            firstChild = graphNode.next; // Choose a new first child
        }
    }

    return parent;
}


/// @function	getTopBits
function getTopBits(number) {
	number = number >> 16;
	return number > 32767 ? number - 65536 : number;
}

/// @function	setTopBits
function setTopBits(number32, number16) { return (number16 << 16) | (number32 & 0xFFFF); }

/// @function	retrieve_animation_index
function retrieve_animation_index(curFrame, attributes) {

	var result;

	if (curFrame < attributes.indices[attributes.indexToIndices]) {
		result = attributes.indices[attributes.indexToIndices + 1] + curFrame;
	} else {
		result = attributes.indices[attributes.indexToIndices + 1] + attributes.indices[attributes.indexToIndices] - 1;
	}

	attributes.indexToIndices += 2;

	return result;
}

// @function	geo_update_animation_frame
function geo_update_animation_frame(obj, accelAssist) {

	var result;
	var anim = obj.curAnim;
	
	for(var i = 0; i < LAG_FRAMES; i++) {
		if (obj.animTimer == GeoRenderer.gAreaUpdateCounter || anim.flags & ANIM_FLAG_2) {
			return obj.animFrame;
		}

		if (anim.flags & ANIM_FLAG_FORWARD) {
			if (obj.animAccel) {
			    result = (obj.animFrameAccelAssist - obj.animAccel);
			} else {
			    result = ((obj.animFrame - 1) << 16);
			}

			if (getTopBits(result) < anim.unk06) {
			    if (anim.flags & ANIM_FLAG_NOLOOP) {
			        result = setTopBits(result, anim.unk06);
			    } else {
			        result = setTopBits(result, anim.unk08 - 1);
			    }
			}
		} else {
			if (obj.animAccel != 0) {
			    result = (obj.animFrameAccelAssist + obj.animAccel);
			} else {
			    result = (obj.animFrame + 1) << 16;
			}

			if (getTopBits(result) >= anim.unk08) {
			    if (anim.flags & ANIM_FLAG_NOLOOP) {
			        result = setTopBits(result, anim.unk08 - 1);
			    } else {
			        result = setTopBits(result, anim.unk06);
			    }
			}
		}
		obj.animFrameAccelAssist = result;
	}


	return getTopBits(result);
}

/// @function	init_scene_graph_node_links
function init_scene_graph_node_links(graphNode, _type) {
		
	graphNode.node.type = _type
	graphNode.node.flags = GRAPH_RENDER_ACTIVE;
	graphNode.node.prev = graphNode.node;
	graphNode.node.next = graphNode.node;
	graphNode.node.parent = null;
	graphNode.node.children = new Array();
	graphNode.node.wrapper = graphNode;
	
}

/// @function	init_graph_node_start
function init_graph_node_start(pool, graphNode) {
		
		
	if (graphNode == null) graphNode = new GraphNodeLightweight();	
	graphNode.node = new GraphNodeNode();
		
	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_START);

	return graphNode;
}


/// @function	init_graph_node_root
function init_graph_node_root(pool, graphNode, _areaIndex, _x, _y, _width, _height) {

	if (graphNode == null) graphNode = new GraphNodeLightweight();	
	graphNode.node = new GraphNodeNode();
	graphNode.areaIndex = _areaIndex;
	graphNode.x = _x;
	graphNode.y = _y;
	graphNode.width = _width;
	graphNode.height = _height;
	graphNode.unk15 = 0;
	graphNode.views = null;
	graphNode.numViews = 0;
		
	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_ROOT);

	return graphNode;
}

/// @function	init_graph_node_culling_radius
function init_graph_node_culling_radius(_radius) {

	var graphNode = new GraphNodeLightweight();	
	graphNode.node = new GraphNodeNode();
	graphNode.radius = _radius;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_CULLING_RADIUS);

	return graphNode;
}

/// @function	init_graph_node_render_range
function init_graph_node_render_range(minDistance, maxDistance) {
	
	var graphNode = new GraphNodeLightweight();	
	graphNode.node = new GraphNodeNode();
	graphNode.minDistance = minDistance;
	graphNode.maxDistance = maxDistance;

    init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_LEVEL_OF_DETAIL);

    return graphNode;
}

/// @function	init_graph_node_switch_case
function init_graph_node_switch_case(_numCases, _selectedCase, _nodeFunc) {

	var graphNode = new GraphNodeLightweight();	
	graphNode.node = new GraphNodeNode();
	graphNode.numCases = _numCases;
	graphNode.selectedCase = _selectedCase;
	graphNode.fnNode = new GraphNodeFnNode();
	graphNode.fnNode.func = _nodeFunc;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_SWITCH_CASE);

	if (_nodeFunc!=null) {
		_nodeFunc(GEO_CONTEXT_CREATE, graphNode);
	}

	return graphNode;
}

/// @function	init_graph_node_perspective
function init_graph_node_perspective(pool, graphNode, _fov, _near, _far, nodeFunc, unused) {

	if (graphNode == null) graphNode = new GraphNodeLightweight();	
	graphNode.node = new GraphNodeNode();
	graphNode.fov = _fov;
	graphNode.near = _near;
	graphNode.far = _far;
	graphNode.fnNode = new GraphNodeFnNode();
	graphNode.fnNode.func = nodeFunc;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_PERSPECTIVE);

	if (nodeFunc!=null) {
		var fnc = nodeFunc;
		fnc(GEO_CONTEXT_CREATE, graphNode);
	}

	return graphNode;

}

/// @function	init_graph_node_generated
function init_graph_node_generated(pool, graphNode, gfxFunc, _param) {

		
	if (graphNode == null) graphNode = new GraphNodeLightweight();	
	graphNode.node = new GraphNodeNode();
	graphNode.param = _param;
	graphNode.func = gfxFunc;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_GENERATED_LIST);

	if (gfxFunc!=null) {
	    gfxFunc(GEO_CONTEXT_CREATE,  graphNode.node, null);
	}

	return graphNode;
}

/// @function	init_graph_node_object_parent
function init_graph_node_object_parent(_sharedChild) {

		
	var graphNode = new GraphNodeLightweight();
	graphNode.node = new GraphNodeNode();
	graphNode.sharedChild = _sharedChild.node;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_OBJECT_PARENT);

	return graphNode;

}

/// @function	init_graph_node_animated_part
function init_graph_node_animated_part(drawingLayer, _displayList, _translation) {

	var graphNode = new GraphNodeLightweight();
	graphNode.node = new GraphNodeNode();
	graphNode.translation =  _translation;
	graphNode.displayList = _displayList;
		
		
	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_ANIMATED_PART);

	graphNode.node.flags = (drawingLayer << 8) | (graphNode.node.flags & 0xFF);

	return graphNode;

}

/// @function	init_graph_node_camera
function init_graph_node_camera(pool, graphNode, _pos, _focus, _func, mode) {

	if (graphNode == null) graphNode = new GraphNodeLightweight();	
	graphNode.node = new GraphNodeNode();
	graphNode.roll = 0;
	graphNode.rollScreen = 0;
	graphNode.config = new GraphNodeConfig();
	graphNode.config.mode = 0;
	graphNode.config.camera = null;
	graphNode.pos = _pos;
	graphNode.focus = _focus;
	graphNode.fnNode = new GraphNodeFnNode();
	graphNode.fnNode.func = _func;
		
	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_CAMERA);

	if (_func!=null) {
	    if (_func != geo_camera_main) {
			throw("\nbad camera init");	
		}
		var fnc = _func;
		fnc(GEO_CONTEXT_CREATE, graphNode);
	}

	return graphNode;

}

/// @function	init_graph_node_display_list
function init_graph_node_display_list(drawingLayer, _displayList) {

	var graphNode = new GraphNodeLightweight();
	graphNode.node = new GraphNodeNode();
	graphNode.displayList = _displayList;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_DISPLAY_LIST);

	graphNode.node.flags = drawingLayer << 8 | graphNode.node.flags & 0xFF;

	return graphNode;
}
	
/// @function	init_graph_node_billboard
function init_graph_node_billboard(drawingLayer, _displayList, _translation) {

	var graphNode = new GraphNodeLightweight();
	graphNode.node = new GraphNodeNode();
	graphNode.displayList = _displayList;
	graphNode.translation = [_translation[0], _translation[1], _translation[2]];

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_BILLBOARD);

	graphNode.node.flags = drawingLayer << 8 | graphNode.node.flags & 0xFF;

	return graphNode;
}

/// @function	init_graph_node_background
function init_graph_node_background(pool, graphNode, _background, backgroundFunc, _zero) {

	graphNode = new GraphNodeLightweight();	
	graphNode.node = new GraphNodeNode();
	graphNode.background = _background;
	graphNode.backgroundFunc = backgroundFunc;
	graphNode.zero = _zero;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_BACKGROUND);

	backgroundFunc(GEO_CONTEXT_CREATE, graphNode);

	return graphNode;

}

/// @function	init_graph_node_shadow
function init_graph_node_shadow(_shadowScale, _shadowSolidity, _shadowType) {

		
	var graphNode = new GraphNodeLightweight();
	graphNode.node = new GraphNodeNode();
	graphNode.shadowType = _shadowType;
	graphNode.shadowScale = _shadowScale;
	graphNode.shadowSolidity = _shadowSolidity;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_SHADOW)

	return graphNode;
}

/// @function	init_graph_node_scale
function init_graph_node_scale(drawingLayer, _displayList, _scale) {
		

	var graphNode = new GraphNodeLightweight();
	graphNode.node = new GraphNodeNode();
	graphNode.scale = _scale;
	graphNode.displayList = _displayList;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_SCALE);

	graphNode.node.flags = (drawingLayer << 8) | (graphNode.node.flags & 0xFF);

	return graphNode;
}

/// @function	init_graph_node_rotation
function init_graph_node_rotation(drawingLayer, _displayList, _rotation) {
		
	var graphNode = new GraphNodeLightweight();
	graphNode.node = new GraphNodeNode();
	graphNode.rotation = _rotation;
	graphNode.displayList = _displayList;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_ROTATION)

	graphNode.node.flags = (drawingLayer << 8) | (graphNode.node.flags & 0xFF)

	return graphNode

}

/// @function	init_graph_node_translation
function init_graph_node_translation(drawingLayer, _displayList, _translation) {
		
	var graphNode = new GraphNodeLightweight();
	graphNode.node = new GraphNodeNode();
	graphNode.translation = _translation;
	graphNode.displayList = _displayList;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_TRANSLATION)

	graphNode.node.flags = (drawingLayer << 8) | (graphNode.node.flags & 0xFF)

	return graphNode

}

/// @function	init_graph_node_translation_rotation
function init_graph_node_translation_rotation(drawingLayer, _displayList, _translation, _rotation) {
		
	var graphNode = new GraphNodeLightweight();
	graphNode.node = new GraphNodeNode();
	graphNode.translation = _translation;
	graphNode.rotation = _rotation;
	graphNode.displayList = _displayList;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_TRANSLATION_ROTATION)

	graphNode.node.flags = (drawingLayer << 8) | (graphNode.node.flags & 0xFF)

	return graphNode

}

/// @function	init_graph_node_ortho
function 	init_graph_node_ortho(pool, graphNode, _scale) {

		
	if (graphNode == null) graphNode = new GraphNodeLightweight();	
	graphNode.node = new GraphNodeNode();
	graphNode.scale = _scale;

	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_ORTHO_PROJECTION)

	return graphNode
}

/// @function	init_graph_node_master_list
function init_graph_node_master_list(pool, graphNode, on) {

		
	if (graphNode == null) graphNode = new GraphNodeLightweight();	
	graphNode.node = new GraphNodeNode();
	graphNode.listHeads = -1;
	for(var i = 0; i < GFX_NUM_MASTER_LISTS; i++) {
		graphNode.listHeads[i] = new Array();
	}
		
	init_scene_graph_node_links(graphNode, GRAPH_NODE_TYPE_MASTER_LIST)

	if (on) graphNode.node.flags |= GRAPH_RENDER_Z_BUFFER

	return graphNode

}

/// @function	register_scene_graph_node
function register_scene_graph_node(g, graphNode) {
		
	if (graphNode != null) {
	    g.gCurGraphNodeList.set(g.gCurGraphNodeIndex, graphNode);
		
	    if (g.gCurGraphNodeIndex == 0) {
	        if (g.gCurRootGraphNode == null) g.gCurRootGraphNode = graphNode;
	    } else {

			if (g.gCurGraphNodeList.content[(g.gCurGraphNodeIndex - 1)].node.type == GRAPH_NODE_TYPE_OBJECT_PARENT) {
			    g.gCurGraphNodeList.content[(g.gCurGraphNodeIndex - 1)].sharedChild = graphNode;
			} else {
			    geo_add_child(g.gCurGraphNodeList.content[g.gCurGraphNodeIndex - 1].node, graphNode.node)
			}

	    }
			
	}
}
	
function geo_obj_init_animation_accel(graphNode, animPtrAddr, animAccel) {
	var anim = animPtrAddr;

	if (graphNode.unk38.curAnim != anim) {
	    graphNode.unk38.curAnim = anim;
	    graphNode.unk38.animYTrans = 0;
	    graphNode.unk38.animFrameAccelAssist =
	        (anim.unk04 << 16) + ((anim.flags & ANIM_FLAG_FORWARD) ? animAccel : -animAccel);
	    graphNode.unk38.animFrame = graphNode.unk38.animFrameAccelAssist >> 16;
	}

	graphNode.unk38.animAccel = animAccel;
}

function geo_obj_init_animation(graphNode, animPtrAddr) {
	var anim = animPtrAddr;

	if (graphNode.unk38.curAnim != anim) {
	    graphNode.unk38.curAnim = anim;
	    graphNode.unk38.animFrame = anim.startFrame + ((anim.flags & ANIM_FLAG_FORWARD) ? 1 : -1);
	    graphNode.unk38.animYTrans = 0;
		graphNode.unk38.animAccel = 0;
	}
	
	graphNode.unk38.animFrameAccelAssist = 0;

}

function GraphNodeLightweight() constructor {
}
function GraphNodeNode() constructor {
}
function GraphNodeConfig() constructor {
}
function GraphNodeFnNode() constructor {
}
function GraphNodeunk38() constructor {
}