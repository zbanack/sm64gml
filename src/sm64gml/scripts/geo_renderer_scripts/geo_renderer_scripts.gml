function geo_renderer_scripts_macros_init() {
	
globalvar GeoRenderer;
GeoRenderer  	= new GeoRendererInstance();
	
#macro ANIM_TYPE_NONE                 0
#macro ANIM_TYPE_TRANSLATION          1
#macro ANIM_TYPE_VERTICAL_TRANSLATION 2
#macro ANIM_TYPE_LATERAL_TRANSLATION  3
#macro ANIM_TYPE_NO_TRANSLATION       4
#macro ANIM_TYPE_ROTATION             5

global.__list_node_at = 0;
global.__list_node_dummies = [];
for(var i = 0; i < 640; i++) {
	global.__list_node_dummies[i] = new ListNodeInstance();
}

globalvar gMatStack;
gMatStack = array_create(32);
for(var i = 31; i>=0; i--) {
	gMatStack[i] = Mat4;
}

globalvar gMatStackIndex;
gMatStackIndex = 0;

globalvar renderModeTable;
renderModeTable = [
	[
	    G_RM_OPA_SURF_SURF2,
	    G_RM_AA_OPA_SURF_SURF2,
	    G_RM_AA_OPA_SURF_SURF2,
	    G_RM_AA_OPA_SURF_SURF2,
	    null,
	    G_RM_AA_XLU_SURF_SURF2,
	    G_RM_AA_XLU_SURF_SURF2,
	    G_RM_AA_XLU_SURF_SURF2
	],
	[
	    G_RM_ZB_OPA_SURF_SURF2,
	    G_RM_AA_ZB_OPA_SURF_SURF2,
	    G_RM_AA_ZB_OPA_DECAL_DECAL2,
	    G_RM_AA_ZB_OPA_INTER_NOOP2,
	    G_RM_AA_ZB_TEX_EDGE_NOOP2,
	    G_RM_AA_ZB_XLU_SURF_SURF2,
	    G_RM_AA_ZB_XLU_DECAL_DECAL2,
	    G_RM_AA_ZB_XLU_INTER_INTER2
	]
];


globalvar previous_frame, previous_frame_can_render, previous_frame_texel;
previous_frame				= -1;
previous_frame_can_render	= false;
previous_frame_texel		= -1;

global.__znear	= 1000;
global.__zfar	= 3500000;

global.__triangles_to_render					= ds_stack_create();
global.__triangles_to_render_ortho				= ds_stack_create();
global.__triangles_to_render_ortho_background	= ds_stack_create();
global.__triangles_to_render_ortho_1_1			= ds_stack_create();

globalvar geo_script_lookup;
geo_script_lookup = array_create(256, null);
	
geo_script_lookup[GRAPH_NODE_TYPE_ORTHO_PROJECTION]		= GeoRenderer.geo_process_ortho_projection;
geo_script_lookup[GRAPH_NODE_TYPE_PERSPECTIVE]			= GeoRenderer.geo_process_perspective;
geo_script_lookup[GRAPH_NODE_TYPE_MASTER_LIST]			= GeoRenderer.geo_process_master_list;
geo_script_lookup[GRAPH_NODE_TYPE_CAMERA]				= GeoRenderer.geo_process_camera;
geo_script_lookup[GRAPH_NODE_TYPE_BACKGROUND]			= GeoRenderer.geo_process_background;
geo_script_lookup[GRAPH_NODE_TYPE_GENERATED_LIST]		= GeoRenderer.geo_process_generated_list;
geo_script_lookup[GRAPH_NODE_TYPE_DISPLAY_LIST]			= GeoRenderer.geo_process_display_list;
geo_script_lookup[GRAPH_NODE_TYPE_OBJECT_PARENT]		= GeoRenderer.geo_process_object_parent;
geo_script_lookup[GRAPH_NODE_TYPE_OBJECT]				= GeoRenderer.geo_process_object;
geo_script_lookup[GRAPH_NODE_TYPE_SCALE]				= GeoRenderer.geo_process_scale;
geo_script_lookup[GRAPH_NODE_TYPE_ANIMATED_PART]		= GeoRenderer.geo_process_animated_part;
geo_script_lookup[GRAPH_NODE_TYPE_ROTATION]				= GeoRenderer.geo_process_rotation;
geo_script_lookup[GRAPH_NODE_TYPE_SWITCH_CASE]			= GeoRenderer.geo_process_switch_case;
geo_script_lookup[GRAPH_NODE_TYPE_SHADOW]				= GeoRenderer.geo_process_shadow;
geo_script_lookup[GRAPH_NODE_TYPE_BILLBOARD]			= GeoRenderer.geo_process_billboard;
geo_script_lookup[GRAPH_NODE_TYPE_LEVEL_OF_DETAIL]		= GeoRenderer.geo_process_level_of_detail;
geo_script_lookup[GRAPH_NODE_TYPE_TRANSLATION]			= GeoRenderer.geo_process_translation;
geo_script_lookup[GRAPH_NODE_TYPE_TRANSLATION_ROTATION]	= GeoRenderer.geo_process_translation_rotation;

boot("geo_renderer_scripts_macros_init");
}
	
function GeoRendererInstance() constructor {
	
	gCurGraphNodeHeldObject = null;
	gCurAnimEnabled = false;
	
	gCurAnimType = null;
	
	gCurGraphNodeMasterList = null;
	
	gCurrAnimAttribute = new ObjectDummy();
	

	gAreaUpdateCounter = 0;
	
    function geo_process_master_list_sub(node) {
		
        var enableZBuffer = (node.flags & GRAPH_RENDER_Z_BUFFER) != 0;
        var modeList = enableZBuffer ? renderModeTable[1] : renderModeTable[0];

        if (enableZBuffer) {
            gSPSetGeometryMode(gDisplayList, G_ZBUFFER);
        }
		
		var gdisp = gDisplayList;

        for (var i = 0; i < GFX_NUM_MASTER_LISTS; i++) {
            if (node.wrapper.listHeads[i] == null) continue;
			
                if (modeList[i] == null) continue;//break;
				
				gDPSetRenderMode(gdisp, modeList[i]);

				var sz = node.wrapper.listHeads[i].size;
				
				for(var j = 0; j < sz; j++) {
					var displayNode = node.wrapper.listHeads[i].content[j];
	                gSPMatrix(gdisp, displayNode.transform, G_MTX_MODELVIEW | G_MTX_LOAD | G_MTX_NOPUSH);
	                gSPDisplayList(gdisp, displayNode.displayList);
				}



        }

        if (enableZBuffer) {
            gSPClearGeometryMode(gDisplayList, G_ZBUFFER)
        }
    }
	
    function geo_process_master_list(node) {

        if (gCurGraphNodeMasterList == null && node.children.content[0]!=null) {
            gCurGraphNodeMasterList = node;
			for(var i = 0; i < GFX_NUM_MASTER_LISTS; i++) {
				 node.wrapper.listHeads[i].clear();
			}

            geo_process_node_and_siblings(node.children);
            geo_process_master_list_sub(node);
            gCurGraphNodeMasterList = null;
        }

    }
	
    function geo_process_ortho_projection(node) {
		
        if (node.children.content[0]==null) return;
			
        var mtx = Mat4;
		
		var wr = gCurGraphNodeRoot.wrapper;
		
		var wx, wy, ww, wh;
		wx = wr.x;
		wy = wr.y;
		ww = wr.width;
		wh = wr.height;
		
		var sc = node.wrapper.scale;

        var left	= (wx - ww) / 2.0 * sc;
        var right	= (wx + ww) / 2.0 * sc;
        var top		= (wy - wh) / 2.0 * sc;
        var bottom	= (wy + wh) / 2.0 * sc;

        guOrtho(mtx, left, right, bottom, top, -2.0, 2.0, 1.0);
        gSPMatrix(gDisplayList, mtx, G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH);
		
        geo_process_node_and_siblings(node.children);
		
    }


    function geo_process_perspective(node) {
                
        if (node.wrapper.fnNode.func!=null) {
			var fnc = node.wrapper.fnNode.func;
			fnc(GEO_CONTEXT_RENDER, node.wrapper);
        }

        if (node.children.content[0]!=null) {
            var aspect = SCREEN_WIDTH / SCREEN_HEIGHT;
            var mtx = Mat4;
            var perspNorm = new ObjectDummy();

            guPerspective(mtx, perspNorm,
                node.wrapper.fov, aspect, node.wrapper.near, node.wrapper.far, 1.0)


            //gSPPerspNormalize(gDisplayList, perspNorm.value)
            gSPMatrix(gDisplayList, mtx, G_MTX_PROJECTION | G_MTX_LOAD | G_MTX_NOPUSH);

            gCurGraphNodeCamFrustum = node;
            geo_process_node_and_siblings(node.children);
            gCurGraphNodeCamFrustum = null;
        }
    }
	
    function geo_process_camera(node) {

        if (node.wrapper.fnNode.func!=null) {
			var fnc = node.wrapper.fnNode.func;
			fnc(GEO_CONTEXT_RENDER, node.wrapper);
        }

        var rollMtx = Mat4;
        var cameraTransform = Mat4;
        var mtx = Mat4;

        mtxf_rotate_xy(rollMtx, node.wrapper.rollScreen)

        gSPMatrix(gDisplayList, rollMtx, G_MTX_PROJECTION | G_MTX_MUL | G_MTX_NOPUSH);
		
        mtxf_lookat(cameraTransform, node.wrapper.pos, node.wrapper.focus, node.wrapper.roll);

        mtxf_mul(gMatStack[gMatStackIndex + 1], cameraTransform, gMatStack[gMatStackIndex]);
		
        gMatStackIndex++;
        if (node.children.content[0]!=null) {
            gCurGraphNodeCamera = node;
            node.wrapper.matrixPtr = gMatStack[gMatStackIndex];
            geo_process_node_and_siblings(node.children);
            gCurGraphNodeCamera = null;
        }
        gMatStackIndex--;

    }
	
	global.___bkgList1	= new DisplayList();
	global.___bkgListGfx = new DisplayList();
	#macro _bkgList1	global.___bkgList1
	#macro _bkgListGfx	global.___bkgListGfx
	
    function geo_process_background(node) {
		
		var skip_bkg = false;
		if (!skip_bkg) {
		
	        _bkgList1.clear();
			var list = null;
		
			if (node.wrapper.backgroundFunc!=null) {
				var fnc = node.wrapper.backgroundFunc;
				list = fnc(GEO_CONTEXT_RENDER, node.wrapper);
			}

	        if (list != null) {
				array_copy(_bkgList1.dl_arr, 0, list, 0, array_length(list));
				_bkgList1.dl_size = array_length(_bkgList1.dl_arr);
	            geo_append_display_list(_bkgList1, node.flags >> 8);
			
	        } else if (gCurGraphNodeMasterList!=null) {
				// @uncalled on non-menus (?)
				_bkgListGfx.clear();
			
		        gDPSetCycleType(_bkgListGfx, G_CYC_FILL);
		        gDPSetFillColor(_bkgListGfx, node.wrapper.background);
				//log(node.wrapper.background);
		        gDPFillRectangle(_bkgListGfx, 0, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1);
		        gDPSetCycleType(_bkgListGfx, G_CYC_1CYCLE);
		        gSPEndDisplayList(_bkgListGfx);

		        geo_append_display_list(_bkgListGfx, 0);
		
		    }
		}

        geo_process_node_and_siblings(node.children)
		
		
    }
	
    function geo_process_generated_list(node) {
		
        if (node.wrapper.func==null) return;
			
        var list = node.wrapper.func(GEO_CONTEXT_RENDER, node, gMatStack[gMatStackIndex]);
        if (array_length(list) < 1) return;
		
		geo_append_display_list(list, node.flags >> 8);
	
        
    }
	
    function geo_process_scale(node) {

		var sc = node.wrapper.scale;
        mtxf_scale_vec3f(gMatStack[gMatStackIndex + 1], gMatStack[gMatStackIndex],
			[ sc, sc, sc ]
		);
		
        gMatStackIndex++;
        geo_process_node_and_siblings(node.children);
        gMatStackIndex--;

    }
	
	gCurGraphNodeObjectRaw = null;
	
	/**
	 * Process a billboard node. A transformation matrix is created that makes its
	 * children face the camera, and it is pushed on the floating point and fixed
	 * point matrix stacks.
	 * For the rest it acts as a normal display list node.
	 */
	function geo_process_billboard(node) {
		
	    var translation = Vec3;
	    var mtx = Mat4;
		
		gMatStackIndex++

	    array_copy(translation, 0, node.wrapper.translation, 0, 3);
		
	    mtxf_billboard(gMatStack[gMatStackIndex], gMatStack[gMatStackIndex - 1],
			translation, gCurGraphNodeCamera.wrapper.roll);
					   
		if (gCurGraphNodeHeldObject != null) {
			
			mtxf_scale_vec3f(gMatStack[gMatStackIndex], gMatStack[gMatStackIndex],
			            gCurGraphNodeHeldObject.objNode.wrapper.header.gfx.scale);
			 
		} else if (gCurGraphNodeObject != null) {
			mtxf_scale_vec3f(gMatStack[gMatStackIndex], gMatStack[gMatStackIndex],
				gCurGraphNodeObject.scale);//gCurGraphNodeObject.header.gfx.scale); // @z
		}

	    mtxf_to_mtx(mtx, gMatStack[gMatStackIndex]);
        
        if (node.wrapper.displayList!=null) {
            geo_append_display_list(node.wrapper.displayList, node.flags >> 8);
        }

        geo_process_node_and_siblings(node.children);

        gMatStackIndex--;
	}
	
    function geo_process_rotation(node) {
        var mtxf = Mat4;
        mtxf_rotate_zxy_and_translate(mtxf, Vec3, node.wrapper.rotation)
        mtxf_mul(gMatStack[gMatStackIndex + 1], mtxf, gMatStack[gMatStackIndex]);
        gMatStackIndex++;
		
        if (node.wrapper.displayList!=null) {
            geo_append_display_list(node.wrapper.displayList, node.flags >> 8)
        }

        geo_process_node_and_siblings(node.children);
        gMatStackIndex--;
    }
	
    function read_next_anim_value() {
        var index = retrieve_animation_index(gCurrAnimFrame, gCurrAnimAttribute);
        var value = gCurAnimData[clamp(index, 0, array_length(gCurAnimData)-1)];
        return value > 32767 ? value - 65536 : value;
    }
	
	
    function geo_process_animated_part(node) {
		
		var matrix, rotation, translation;
	    matrix = Mat4;
	    rotation = Vec3;
	    translation = node.wrapper.translation;

	    if (gCurAnimType == ANIM_TYPE_TRANSLATION) {
	        translation[0] += read_next_anim_value() + gCurAnimTranslationMultiplier;
	        translation[1] += read_next_anim_value() + gCurAnimTranslationMultiplier;
	        translation[2] += read_next_anim_value() * gCurAnimTranslationMultiplier;
	        gCurAnimType = ANIM_TYPE_ROTATION;
	    } else {
	        if (gCurAnimType == ANIM_TYPE_LATERAL_TRANSLATION) {
	            translation[0] += read_next_anim_value() + gCurAnimTranslationMultiplier;
	            gCurrAnimAttribute.indexToIndices += 2;
	            translation[2] += read_next_anim_value() + gCurAnimTranslationMultiplier;
	            gCurAnimType = ANIM_TYPE_ROTATION;
	        } else {
	            if (gCurAnimType == ANIM_TYPE_VERTICAL_TRANSLATION) {
	                gCurrAnimAttribute.indexToIndices += 2;
	                translation[1] += read_next_anim_value() + gCurAnimTranslationMultiplier;
	                gCurrAnimAttribute.indexToIndices += 2;
	                gCurAnimType = ANIM_TYPE_ROTATION;
	            } else if (gCurAnimType == ANIM_TYPE_NO_TRANSLATION) {
	                gCurrAnimAttribute.indexToIndices += 6;
	                gCurAnimType = ANIM_TYPE_ROTATION;
	            } 
	        }
	    }

	    if (gCurAnimType == ANIM_TYPE_ROTATION) {
	        rotation[0] = read_next_anim_value();
	        rotation[1] = read_next_anim_value();
	        rotation[2] = read_next_anim_value();
	    }

        mtxf_rotate_xyz_and_translate(matrix, translation, rotation)
        mtxf_mul(gMatStack[gMatStackIndex + 1], matrix, gMatStack[gMatStackIndex]);
		
        gMatStackIndex++
        
        if (node.wrapper.displayList!=null) {
            geo_append_display_list(node.wrapper.displayList, node.flags >> 8);
        }

        geo_process_node_and_siblings(node.children);

        gMatStackIndex--;
		

    }
	
	function geo_set_animation_globals(node, hasAnimation) {
		
        var anim = node.curAnim;
		
        node.animFrame = geo_update_animation_frame(node, node.animFrameAccelAssist);

        node.animTimer = gAreaUpdateCounter;
		
        if (anim.flags & ANIM_FLAG_HOR_TRANS) {
            gCurAnimType = ANIM_TYPE_VERTICAL_TRANSLATION;
        } else if (anim.flags & ANIM_FLAG_VERT_TRANS) {
            gCurAnimType = ANIM_TYPE_LATERAL_TRANSLATION;
        } else if (anim.flags & ANIM_FLAG_6) {
            gCurAnimType = ANIM_TYPE_NO_TRANSLATION;
        } else {
            gCurAnimType = ANIM_TYPE_TRANSLATION;
        }

        gCurrAnimFrame	= node.animFrame;
        gCurAnimEnabled = (anim.flags & ANIM_FLAG_5) == 0;
        
		gCurrAnimAttribute.indexToIndices = 0;
		gCurrAnimAttribute.indices = anim.indices;
		
        gCurAnimData = anim.values;
		
		gCurAnimTranslationMultiplier = anim.unk02 == 0 ? 1.0 : node.animYTrans / anim.unk02;

    }
	
    function geo_process_object(node) {
		
        var mtxf = Mat4;

        var object = node.wrapper.wrapperObjectNode.wrapperObject;
		var _header = object.header.gfx;
		
		gCurGraphNodeObjectRaw = object;
		
        var hasAnimation = (_header.node.flags & GRAPH_RENDER_HAS_ANIMATION) != 0;

        //if (_header.unk18 != gCurGraphNodeRoot.wrapper.areaIndex) return;
        if (_header.node.flags & GRAPH_RENDER_CYLBOARD) {
            mtxf_cylboard(gMatStack[gMatStackIndex + 1], gMatStack[gMatStackIndex], _header.pos, gCurGraphNodeCamera.wrapper.roll)
        } else if (_header.node.flags & GRAPH_RENDER_BILLBOARD) {
            mtxf_billboard(gMatStack[gMatStackIndex + 1], gMatStack[gMatStackIndex], _header.pos, gCurGraphNodeCamera.wrapper.roll);
        }
		else {
            mtxf_rotate_zxy_and_translate(mtxf, _header.pos, _header.angle)
            mtxf_mul(gMatStack[gMatStackIndex + 1], mtxf, gMatStack[gMatStackIndex]);
        }
	
		
        mtxf_scale_vec3f(gMatStack[gMatStackIndex + 1], gMatStack[gMatStackIndex + 1], _header.scale);

        _header.throwMatrix = gMatStack[++gMatStackIndex];
        _header.cameraToObject = [ 
            gMatStack[gMatStackIndex][M30],
            gMatStack[gMatStackIndex][M31],
            gMatStack[gMatStackIndex][M32]
        ];

        if (_header.unk38.curAnim!=null) {
            geo_set_animation_globals(object.header.gfx.unk38, hasAnimation)
        }

        if (obj_is_in_view(_header, gMatStack[gMatStackIndex]) && _header.sharedChild) {
		
            gCurGraphNodeObject = node.wrapper
            _header.sharedChild.parent = _header.node;
            geo_process_node(_header.sharedChild);
            _header.sharedChild.parent = null;
            gCurGraphNodeObject = null;

        }

        gMatStackIndex--;
        gCurAnimType = ANIM_TYPE_NONE;
        _header.throwMatrix = null;


    }
	
    function geo_process_object_parent(node) {
		
		var _shared = node.wrapper.sharedChild;
        if (_shared==null) return;

        _shared.parent = node;
         geo_process_node_and_siblings(_shared.children)
        _shared.parent = null;

    }
	
    function geo_process_display_list(node) {
        if (node.wrapper.displayList!=null) {
            geo_append_display_list(node.wrapper.displayList, node.flags >> 8);
        }

        geo_process_node_and_siblings(node.children);
    }
	
    function geo_append_display_list(displayList, _layer) {

        var gMatStackCopy = Mat4;
		
        array_copy(gMatStackCopy, 0, gMatStack[gMatStackIndex], 0, 16);

        if (gCurGraphNodeMasterList != null) {

			var listNode			=  global.__list_node_dummies[global.__list_node_at++];
			listNode.transform		= gMatStackCopy;
			listNode.displayList	= displayList;
		
			var head = gCurGraphNodeMasterList.wrapper.listHeads;
			
	        if (head[_layer].size>0) {
	            head[_layer].push(listNode);
	        } else {
	            head[_layer].clear();
	            head[_layer].push(listNode);
	        }
		}
    }
	
	function geo_process_shadow(node) {
		
		// @TODO shadow
		/*
		var shadowPos, shadowScale

        if (gCurGraphNodeCamera && gCurGraphNodeObject) {
            if (gCurGraphNodeHeldObject) {
                throw("\nheld object shadow @TODO");
            } else {
                shadowPos = gCurGraphNodeObject.pos;
                shadowScale = node.wrapper.shadowScale * gCurGraphNodeObject.scale[0];
            }

            var objScale = 1.0;

            if (gCurAnimEnabled) {
                if (gCurAnimType == ANIM_TYPE_TRANSLATION || gCurAnimType == ANIM_TYPE_LATERAL_TRANSLATION) {
                    var geo = node.children.get(0);
                    if (geo && geo.type == GRAPH_NODE_TYPE_SCALE) {
                        objScale = geo.wrapper.scale;
                    }
                    var animOffset = Vec3;
                    animOffset[0] = read_next_anim_value() * gCurAnimTranslationMultiplier * objScale;
                    animOffset[1] = 0.0;
                    gCurrAnimAttribute.indexToIndices += 2;
                    animOffset[2] = read_next_anim_value() * gCurAnimTranslationMultiplier * objScale;
                    gCurrAnimAttribute.indexToIndices -= 6;

                    var sinAng = sins(gCurGraphNodeObject.angle[1]);
                    var cosAng = coss(gCurGraphNodeObject.angle[1]);

                    shadowPos[0] += animOffset[0] * cosAng + animOffset[2] * sinAng
                    shadowPos[2] += -animOffset[0] * sinAng + animOffset[2] * cosAng

                }
            }
            var shadowList = create_shadow_below_xyz(shadowPos[0], shadowPos[1], shadowPos[2], shadowScale, node.wrapper.shadowSolidity, node.wrapper.shadowType);

            if (shadowList) {
                var mtxf = Mat4;
                gMatStackIndex++;
                mtxf_translate(mtxf, shadowPos);
                mtxf_mul(gMatStack[gMatStackIndex], mtxf, gCurGraphNodeCamera.wrapper.matrixPtr);
                geo_append_display_list(shadowList, 6);
                gMatStackIndex--;
            }
        }

		
		*/
		
		geo_process_node_and_siblings(node.children);
		
	}
	
    function geo_process_switch_case(node) {

		var node_wrapper = node.wrapper;
        var fnNode = node_wrapper.fnNode.func;
		
        if (fnNode) {
           fnNode(GEO_CONTEXT_RENDER, node_wrapper, gMatStack[gMatStackIndex]);
        }

        geo_process_node(node.children.content[node_wrapper.selectedCase]);

    }
	
    function geo_process_level_of_detail(node) {
        var mtx = gMatStack[gMatStackIndex];
        var distanceFromCam = -mtx[M32];
		
		var node_wrapper = node.wrapper;

        if (node_wrapper.minDistance <= distanceFromCam && distanceFromCam < node_wrapper.maxDistance) {
			geo_process_node_and_siblings(node.children);
        }
    }
	
	/// <pygml?v=1.0&h=2ab3f50ac>
	/// @function	geo_process_translation(node)
	/// @desc		Process a translation node. A transformation matrix based on
	///					the node's  translation is created and pushed on both the
	///					float and fixed point matrix stacks.  For the rest it acts
	///					as a normal display list node.
	/// @param		{struct}	node
	function geo_process_translation(node) {
	    var mtxf = Mat4;
		
		var node_wrapper = node.wrapper;

	    mtxf_rotate_zxy_and_translate(mtxf, node_wrapper.translation, gVec3sZero);
	    mtxf_mul(gMatStack[gMatStackIndex + 1], mtxf, gMatStack[gMatStackIndex]);
	    gMatStackIndex++;
		
	    if (node_wrapper.displayList != null) {
	        geo_append_display_list(node_wrapper.displayList, node.flags >> 8);
	    }
	    
		geo_process_node_and_siblings(node.children);
	    
	    gMatStackIndex--;
	}

	function geo_process_translation_rotation(node) {
	    var mtxf = Mat4;
		var translation = Vec3f;
		
		var node_wrapper = node.wrapper;
		
		vec3s_to_vec3f(translation, node_wrapper.translation);
	    mtxf_rotate_zxy_and_translate(mtxf, translation, node_wrapper.rotation);
	    mtxf_mul(gMatStack[gMatStackIndex + 1], mtxf, gMatStack[gMatStackIndex]);
	    gMatStackIndex++;
		
	    if (node_wrapper.displayList != null) {
	        geo_append_display_list(node_wrapper.displayList, node.flags >> 8);
	    }
	    
		geo_process_node_and_siblings(node.children);
	    
	    gMatStackIndex--;
	}
	
	function geo_process_node(node) {
		
		if (!is_struct(node)) return; // @z
		
		var func = geo_script_lookup[node.type];

		if (func != null) {
			func(node);
			return;
		}
		
		geo_process_node_and_siblings(node.children);

    }

	
	
	function geo_process_node_and_siblings(children) {
		
		var sz = children.size;
		
		var contents = children.content;
		
        for (var i = 0; i < sz; i++) {
			
			var child = contents[i];

            if (!(child.flags & GRAPH_RENDER_ACTIVE)) {
                if (child.type == GRAPH_NODE_TYPE_OBJECT) {
                    child.wrapper.throwMatrix = null;
                }
                continue;
            }
			
            geo_process_node(child);

        }		
	}
	
	function geo_process_root(root, b, c, clearColor) {

		global.__list_node_at = 0;
		
        if (root.node.flags & GRAPH_RENDER_ACTIVE) {
			gMatStack[gMatStackIndex] = matrix_build_identity();
            gCurGraphNodeRoot = root.node;
            geo_process_node_and_siblings(root.node.children);
            gCurGraphNodeRoot = null;
        }
		
	}	

	function obj_is_in_view(node, matrix) {
	
	    if (node.node.flags & GRAPH_RENDER_INVISIBLE) return false;

	    var geo = node.sharedChild;
		var _fov = sFOVState.fov;
	    var halfFov = (_fov / 2 + 1) * 32768 / 180 + 0.5;
	    var hScreenEdge = -matrix[M32] * sins(halfFov) / coss(halfFov);

	    var cullingRadius = 300;
	    if (!is_undefined(geo) && variable_struct_exists(geo, "type") && geo.type == GRAPH_NODE_TYPE_CULLING_RADIUS) {
			cullingRadius = geo.wrapper.radius;
	    }

	    return !(
			matrix[M32] > -100.0 + cullingRadius ||
			matrix[M32] < -20000.0 - cullingRadius ||
			matrix[M30] > hScreenEdge + cullingRadius ||
			matrix[M30] < -hScreenEdge - cullingRadius
		);
	}
}

function ListNodeInstance() constructor {
	transform	  = null;
	displayList	  = null;
}
