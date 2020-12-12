function geo_layout_scripts_macros_init() {
// Layers
#macro LAYER_FORCE					0
#macro LAYER_OPAQUE					1
#macro LAYER_OPAQUE_DECAL			2
#macro LAYER_OPAQUE_INTER			3
#macro LAYER_ALPHA					4
#macro LAYER_TRANSPARENT			5
#macro LAYER_TRANSPARENT_DECAL		6
#macro LAYER_TRANSPARENT_INTER		7
	
// sky background params
#macro BACKGROUND_OCEAN_SKY			0
#macro BACKGROUND_FLAMING_SKY		1
#macro BACKGROUND_UNDERWATER_CITY	2
#macro BACKGROUND_BELOW_CLOUDS		3
#macro BACKGROUND_SNOW_MOUNTAINS	4
#macro BACKGROUND_DESERT			5
#macro BACKGROUND_HAUNTED			6
#macro BACKGROUND_GREEN_SKY			7
#macro BACKGROUND_ABOVE_CLOUDS		8
#macro BACKGROUND_PURPLE_SKY		9
	
globalvar sCurrentLayout;
sCurrentLayout		= new ObjectDummy();

globalvar gGeoLayoutStack;
gGeoLayoutStack	= new Array();

globalvar gGeoViews;
gGeoViews			= [];	

globalvar gObjParentGraphNode;
gObjParentGraphNode = null;

globalvar gDrawClearColor;
gDrawClearColor = c_black;

boot("geo_layout_scripts_macros_init");
}

/// @function	copy3argsToObject
function copy3argsToObject(pos, argIndex, args) {
	for (var i = argIndex; i < argIndex + 3; i++) {
	    pos[@ array_length(pos)] = args[i];
	}
	return 3;
}

/// @function	branch
function branch(args) {
	
    if (args[0] == 1) {
        sCurrentLayout.index++;
		var _copy = new ObjectDummy();
		_copy.index = sCurrentLayout.index;
		_copy.layout = sCurrentLayout.layout;
        gGeoLayoutStack.push(_copy);
    }

	//sCurrentLayout = new ObjectDummy();
	sCurrentLayout.index = 0;
	sCurrentLayout.layout = args[1];
}
	
/// @function	Return
function Return(args) {
    sCurrentLayout = gGeoLayoutStack.pop();
}
	
/// @function	node_screen_area
function node_screen_area(args) {

    var _x = args[1];
	var _y = args[2];
	var width = args[3];
	var height = args[4];
    var i = 0;

    gGeoNumViews = args[0] + 2;

    var graphNode = init_graph_node_root(null, null, 0, _x, _y, width, height);

    graphNode.numViews = gGeoNumViews;

    graphNode.views = gGeoViews;

    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}
	
/// @function	open_node
function open_node(args) {
    gCurGraphNodeList.push(gCurGraphNodeList.content[gCurGraphNodeIndex++]);
    sCurrentLayout.index++;
}

/// @function	close_node
function close_node(args) {
    gCurGraphNodeIndex--;
    sCurrentLayout.index++;
}

/// @function	node_master_list
function node_master_list(args) {

    var graphNode = init_graph_node_master_list(null, null, args[0]);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}
	
/// @function	display_list
function display_list(args) {

    var graphNode = init_graph_node_display_list(args[0], args[1]);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}
	
/// @function	node_render_object_parent
function node_render_object_parent(args) {

    var graphNode = init_graph_node_object_parent(gObjParentGraphNode);

    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}
	
/// @function	node_animated_part
function node_animated_part(args) {

    var graphNode = init_graph_node_animated_part(args[0], args[4], [args[1], args[2], args[3]]);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;

}

/// @function	node_ortho
function node_ortho(args) {

    var graphNode = init_graph_node_ortho(null, null, args[0] / 100);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}

/// @function	node_perspective
function node_perspective(args) {

    var graphNode = init_graph_node_perspective(null, null, args[0], args[1], args[2], args[3], 0);

    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}

/// @function	node_camera
function node_camera(args) {
	
	var pos, focus;
	pos			= [];
	focus		= [];

	var argIndex = 1;
    argIndex	+= copy3argsToObject(pos, argIndex, args);
    argIndex	+= copy3argsToObject(focus, argIndex, args);
		
    var graphNode = init_graph_node_camera(null, null, pos, focus, args[7], args[0]);

    register_scene_graph_node(Object1, graphNode);
    gGeoViews[0] = graphNode;

    sCurrentLayout.index++;
}

/// @function	node_generated
function node_generated(args) {

    var graphNode = init_graph_node_generated(null, null, args[1], args[0]);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}

/// @function	node_background
function node_background(args) {

    var graphNode = init_graph_node_background(null, null, args[0], args[1], 0);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}

/// @function	node_switch_case
function node_switch_case(args) {

    var graphNode = init_graph_node_switch_case(args[0], 0, args[1]);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;

}
	
/// @function	node_culling_radius
function node_culling_radius(args) {

    var graphNode = init_graph_node_culling_radius(args[0]);
    register_scene_graph_node(Object1, graphNode);
		
    sCurrentLayout.index++;
}

/// @function	node_render_range
function node_render_range(args) {
	
    var graphNode = init_graph_node_render_range(args[0], args[1])
    register_scene_graph_node(Object1, graphNode)
    sCurrentLayout.index++
	
}
	
function node_shadow(args) {
	
    var graphNode = init_graph_node_shadow(args[2], args[1], args[0]);
    register_scene_graph_node(Object1, graphNode);
    sCurrentLayout.index++;
	
}

/// @function	node_scale
function node_scale(args) {

    var graphNode = init_graph_node_scale(0, null, args[1] / 65536);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}


/// @function	node_translation
function node_translation(args) {

    var graphNode = init_graph_node_translation(0, null, [args[1], args[2], args[3]]);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}

/// @function	node_translation_rotation
function node_translation_rotation(args) {

    var graphNode = init_graph_node_translation_rotation(0, null, [args[1], args[2], args[3]], [arg[4], arg[5], arg[6]]);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}

/// @function	node_background_color
function node_background_color(args) {
	
	// @TODO, quick and dirty implementation
	gDrawClearColor = args[0];
    sCurrentLayout.index++;
}


/// @function	node_rotation
function node_rotation(args) {
	
    var graphNode = init_graph_node_rotation(0, null, [args[1], args[2], args[3]]);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;

}

/// @function	node_start
function node_start(args) {

    register_scene_graph_node(Object1, init_graph_node_start());
    sCurrentLayout.index++;

}


/// @function	node_end
function node_end(args) {
	
    gGeoLayoutStackIndex	= gGeoLayoutReturnIndex;
    gGeoLayoutReturnIndex	= gGeoLayoutStack.content[--gGeoLayoutStackIndex];
    gCurGraphNodeIndex		= gGeoLayoutStack.content[gGeoLayoutStackIndex];
    gGeoLayoutCommand		= gGeoLayoutStack.content[--gGeoLayoutStackIndex];
	
    sCurrentLayout.index++;
	
}
	
/// @function	node_billboard
function node_billboard() {

    var graphNode = init_graph_node_billboard(0, null, [0, 0, 0]);
    register_scene_graph_node(Object1, graphNode);

    sCurrentLayout.index++;
}

/// @function	process_geo_layout
function process_geo_layout(geoLayout) {
		
		
    sCurrentLayout.layout = geoLayout;
    sCurrentLayout.index = 0;

    /// set a bunch of other initial globals
    gCurRootGraphNode = null;
    gGeoNumViews = 0;

    gCurGraphNodeList = new Array(0);
    gCurGraphNodeIndex = 0;

    gGeoLayoutStackIndex = 2;
    gGeoLayoutReturnIndex = 2; // stack index is often copied here?

    gGeoLayoutStack = new Array(0, 0);//0, 0);

	while (sCurrentLayout.index < array_length(sCurrentLayout.layout)) {
	    var cmd = sCurrentLayout.layout[sCurrentLayout.index];

		var _func = GCMD_JUMP_TABLE[cmd[0]];
		
		var _args = [];
		array_copy(_args, 0, cmd, 1, array_length(cmd)-1);
			
		_func(_args);

	}

    return gCurRootGraphNode;

}	

#macro GCMD_ROT						(0)
#macro GCMD_SWITCH					(1)
#macro GCMD_OPEN					(2)
#macro GCMD_DLIST					(3)
#macro GCMD_CLOSE					(4)
#macro GCMD_RETURN					(5)
#macro GCMD_ANIM					(6)
#macro GCMD_BRANCH					(7)
#macro GCMD_SHADOW					(8)
#macro GCMD_SCALE					(9)
#macro GCMD_CULL					(10)
#macro GCMD_PARENT					(11)
#macro GCMD_ZBUFFER					(12)
#macro GCMD_PERSP					(13)
#macro GCMD_CAMERA					(14)
#macro GCMD_ORTHO					(15)
#macro GCMD_BACKGROUND				(16)
#macro GCMD_GENERATED				(17)
#macro GCMD_SCREEN					(18)
#macro GCMD_END						(19)
#macro GCMD_BILLBOARD				(20)
#macro GCMD_RENDER_RANGE			(21)
#macro GCMD_START					(22)
#macro GCMD_TRANSLATE_NODE			(23)
#macro GCMD_TRANSLATE_ROT_NODE		(24)
#macro GCMD_BACKGROUND_COLOR		(41) // @z

globalvar GCMD_JUMP_TABLE;
GCMD_JUMP_TABLE		= array_create(50, null);
											
GCMD_JUMP_TABLE[GCMD_ROT]					= node_rotation;		
GCMD_JUMP_TABLE[GCMD_SWITCH]				= node_switch_case;		
GCMD_JUMP_TABLE[GCMD_OPEN]					= open_node;		
GCMD_JUMP_TABLE[GCMD_DLIST]					= display_list;		
GCMD_JUMP_TABLE[GCMD_CLOSE]					= close_node;		
GCMD_JUMP_TABLE[GCMD_RETURN]				= Return;	
GCMD_JUMP_TABLE[GCMD_ANIM]					= node_animated_part;		
GCMD_JUMP_TABLE[GCMD_BRANCH]				= branch;		
GCMD_JUMP_TABLE[GCMD_SHADOW]				= node_shadow;		
GCMD_JUMP_TABLE[GCMD_SCALE]					= node_scale;	
GCMD_JUMP_TABLE[GCMD_CULL]					= node_culling_radius;	
GCMD_JUMP_TABLE[GCMD_PARENT]				= node_render_object_parent;	
GCMD_JUMP_TABLE[GCMD_ZBUFFER]				= node_master_list;	
GCMD_JUMP_TABLE[GCMD_PERSP]					= node_perspective;	
GCMD_JUMP_TABLE[GCMD_CAMERA]				= node_camera;	
GCMD_JUMP_TABLE[GCMD_ORTHO]					= node_ortho;	
GCMD_JUMP_TABLE[GCMD_BACKGROUND]			= node_background;	
GCMD_JUMP_TABLE[GCMD_GENERATED]				= node_generated;	
GCMD_JUMP_TABLE[GCMD_SCREEN]				= node_screen_area;	
GCMD_JUMP_TABLE[GCMD_END]					= node_end;	
GCMD_JUMP_TABLE[GCMD_BILLBOARD]				= node_billboard;	
GCMD_JUMP_TABLE[GCMD_RENDER_RANGE]			= node_render_range;
GCMD_JUMP_TABLE[GCMD_START]					= node_start;
GCMD_JUMP_TABLE[GCMD_TRANSLATE_NODE]		= node_translation;
GCMD_JUMP_TABLE[GCMD_TRANSLATE_ROT_NODE]	= node_translation_rotation;
GCMD_JUMP_TABLE[GCMD_BACKGROUND_COLOR]		= node_background_color;