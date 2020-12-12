function n64_gfx_scripts_macros_init() {
	
globalvar opCount;
opCount	= 0;

globalvar vert_cnt, tri_cnt, totalTriangles;

#macro TRI_MODE_DEFAULT		0
#macro TRI_MODE_ORTHO		1
#macro TRI_MODE_ORTHO_BG	2
#macro TRI_MODE_ORTHO_1_1	4


#macro NUMLIGHTS_0		(1)
#macro NUMLIGHTS_1		(1)
#macro NUMLIGHTS_2		(2)
#macro NUMLIGHTS_3		(3)
#macro NUMLIGHTS_4		(4)

#macro MAX_BUFFERED		(256)
#macro MAX_LIGHTS		(2)
#macro MAX_VERTICES		(64)

globalvar G_CC_MODULATERGB,
G_CC_MODULATERGBA,
G_CC_MODULATEIA,
G_CC_MODULATERGBA_PRIM,
G_CC_SHADE,
G_CC_SHADEFADEA,
G_CC_BLENDRGBFADEA,
G_CC_DECALFADE,
G_CC_DECALRGBA,
G_CC_DECALRGB,
G_CC_HILITERGBA;

G_CC_MODULATERGB			= {alpha: [7, 7, 7, 4], rgb:[1, 15, 4, 7]		}
G_CC_MODULATERGBA			= {alpha: [1, 7, 4, 7], rgb:[1, 15, 4, 7]		}
G_CC_MODULATEIA				= {alpha: [1, 7, 4, 7], rgb:[1, 15, 4, 7]		}
G_CC_MODULATERGBA_PRIM		= {alpha: [1, 7, 3, 7], rgb:[1, 15, 3, 7]		}
G_CC_SHADE					= {alpha: [7, 7, 7, 4], rgb:[15, 15, 31, 4]		}
G_CC_SHADEFADEA				= {alpha: [7, 7, 7, 5], rgb:[15, 15, 31, 4]		}
G_CC_BLENDRGBFADEA			= {alpha: [7, 7, 7, 5], rgb:[1, 4, 8, 4]		}
G_CC_DECALFADE				= {alpha: [7, 7, 7, 5], rgb:[15, 15, 31, 1]		}
G_CC_DECALRGBA				= {alpha: [7, 7, 7, 1], rgb:[15, 15, 31, 1]		}
G_CC_DECALRGB				= {alpha: [7, 7, 7, 4], rgb:[15, 15, 31, 1]		}
G_CC_HILITERGBA				= {alpha: [3, 4, 1, 4], rgb:[3, 4, 1, 4]		}

#macro G_CC_FADE		G_CC_BLENDRGBFADEA
#macro G_RM_XLU_SURF	G_RM_AA_ZB_XLU_SURF_SURF2
#macro G_RM_XLU_SURF2	G_RM_AA_ZB_XLU_SURF_SURF2

 // @z
#macro G_CC_TRILERP				G_CC_MODULATERGB
#macro G_CC_DECALRGB2			G_CC_DECALRGBA
#macro G_RM_PASS				G_RM_AA_ZB_XLU_SURF_SURF2
#macro G_CC_MODULATERGBFADE			G_CC_MODULATERGBA
#macro G_CC_PASS2					G_CC_MODULATERGBA
#macro G_RM_FOG_SHADE_A			G_RM_AA_ZB_XLU_SURF_SURF2
#macro G_RM_AA_ZB_OPA_DECAL2	G_RM_AA_ZB_XLU_SURF_SURF2
#macro G_RM_AA_ZB_OPA_DECAL		G_RM_AA_ZB_XLU_SURF_SURF2
#macro G_RM_AA_ZB_TEX_EDGE2		G_RM_AA_ZB_XLU_SURF_SURF2
#macro G_RM_AA_ZB_XLU_SURF2		G_RM_AA_ZB_XLU_SURF_SURF2

globalvar rsp;
rsp	= new RspInstance();

rsp.modelview_matrix_stack = array_create(11, Mat4); // once
rsp.modelview_matrix_stack_size	= 0;

globalvar MP_matrix, P_matrix;
MP_matrix	= Mat4;
P_matrix	= Mat4;
rsp.current_lights = [];
	
for(var i = 0; i < MAX_LIGHTS + 1; i++) {
	rsp.current_lights[i] = {
		 col: [0,0,0],
		 colc: [0,0,0],
		 dir: [0,0,0],
	};
}

rsp.current_lights_coeffs = -1;
for(var i = 0; i < MAX_LIGHTS; i++) {
	rsp.current_lights_coeffs[i] = Vec3;
}
rsp.current_lookat_coeffs = [Vec3, Vec3];
rsp.current_num_lights = 0;
rsp.lights_changed = false;
rsp.geometry_mode = 0;
rsp.fog_mul = 0;
rsp.fog_offset = 0;

globalvar texture_scaling_factor_s, texture_scaling_factor_t;
texture_scaling_factor_s = 0;
texture_scaling_factor_t = 0;

globalvar rsp_loaded_vertices;
rsp_loaded_vertices		= ds_list_create();//= array_create(MAX_VERTICES + 4, null);

globalvar rdp;
rdp			= new RdpInstance();
rdp.palette				= new Array(); // once
rdp.texture_to_load		= new TextureToLoadInstance();
rdp.loaded_texture		= [new LoadedTextureInstance(), new LoadedTextureInstance()];
rdp.texture_tile		= new TextureTileInstance();
rdp.textures_changed	= array_create(2, false);
rdp.other_mode_l		= 0;  /// TODO other_mode_l
rdp.other_mode_h		= array_create(20, 0); //?
rdp.combine_mode		= 0;
rdp.env_color			= new ColorInstance();
rdp.prim_color			= new ColorInstance();
rdp.fog_color			= new ColorInstance();
rdp.fill_color			= new ColorInstance();
rdp.viewport			= new XYWHInstance();
rdp.scissor				= new XYWHInstance();
rdp.viewport_or_scissor_changed = false;
rdp.z_buf_address = null;
rdp.color_image_address = null;

globalvar gColorDummy;
gColorDummy	= new ObjectDummy();

globalvar prev_combiner,
buf_vbo_max_size,
buf_vbo,
buf_vbo_size,
buf_vbo_num_tris;
	
prev_combiner		= undefined;
buf_vbo_max_size	= 256*4;
buf_vbo			= ds_list_create();
for(var i = 0; i < buf_vbo_max_size; i++) {
	ds_list_add(buf_vbo, 0);	
}
buf_vbo_size		= 0;
buf_vbo_num_tris	= 0;


for(var i = 0; i < MAX_VERTICES + 4; i++) {
	var vert_list = ds_list_create();
	ds_list_add(rsp_loaded_vertices, vert_list);
	ds_list_mark_as_list(rsp_loaded_vertices, i);
}
		
globalvar color_combiner_pool;
color_combiner_pool	= ds_map_create(); // once

globalvar rendering_state;
rendering_state		= new RenderingStateInstance();
rendering_state.depth_test		= false;
rendering_state.depth_mask		= false;
rendering_state.decal_mode		= false;
rendering_state.alpha_blend		= false;
rendering_state.viewport		= new XYWHInstance();
rendering_state.scissor			= new XYWHInstance();
rendering_state.shader_program	= null;
rendering_state.textures		= [ null, null ];

globalvar color_comb_lookup;
color_comb_lookup = array_create(50, CC_0);
color_comb_lookup[G_CCMUX_TEXEL0]		= CC_TEXEL0;
color_comb_lookup[G_CCMUX_TEXEL1]		= CC_TEXEL1;
color_comb_lookup[G_CCMUX_PRIMITIVE]	= CC_PRIM;
color_comb_lookup[G_CCMUX_SHADE]		= CC_SHADE;
color_comb_lookup[G_CCMUX_ENVIRONMENT]	= CC_ENV;
color_comb_lookup[G_CCMUX_TEXEL0_ALPHA] = CC_TEXEL0A;
color_comb_lookup[G_CCMUX_LOD_FRACTION] = CC_LOD;

globalvar active_player, nametag_stack;
active_player			= -1;
nametag_stack			= ds_stack_create();

globalvar gfx_texture_cache,
sp_vertex_lookat_x,
sp_vertex_lookat_y,
rdp_env_color,
rdp_prim_color;

gfx_texture_cache		= new ObjectDummy();
gfx_texture_cache.pool	= ds_map_create();//new Array(); // once
sp_vertex_lookat_x		= [1, 0, 0];
sp_vertex_lookat_y		= [1, 0, 0];
rdp_env_color			= rdp.env_color;
rdp_prim_color			= rdp.prim_color;

globalvar g_func_list;
g_func_list = ds_list_create();
for(var i = 0; i < 40; i++) {
	ds_list_add(g_func_list, 0);	
}

g_func_list[| G_MOVEMEM]				= sp_movemem;
g_func_list[| G_MTX]					= sp_matrix;
g_func_list[| G_VTX]					= sp_vertex;
g_func_list[| G_TRI1]					= sp_tri1;
g_func_list[| G_MOVEWORD]				= sp_moveword;
g_func_list[| G_CLEARGEOMETRYMODE]		= sp_geometry_mode;
g_func_list[| G_SETGEOMETRYMODE]		= sp_geometry_mode;
g_func_list[| G_SETOTHERMODE_L]			= sp_set_other_mode_l;
g_func_list[| G_SETOTHERMODE_H]			= sp_set_other_mode_h;
g_func_list[| G_SETCOMBINE]				= g_func_G_SETCOMBINE;
g_func_list[| G_SETTIMG]				= dp_set_texture_image;
g_func_list[| G_SETTILE]				= dp_set_tile;
g_func_list[| G_SETTILESIZE]			= dp_set_tile_size;
g_func_list[| G_TEXTURE]				= sp_texture;	    
g_func_list[| G_LOADBLOCK]				= dp_load_block;		    
g_func_list[| G_SETFILLCOLOR]			= dp_set_fill_col;	    
g_func_list[| G_SETENVCOLOR]			= dp_set_env_color;	    
g_func_list[| G_SETPRIMCOLOR]			= dp_set_prim_color;	    
g_func_list[| G_FILLRECT]				= dp_fill_rect;		  	    	
g_func_list[| G_TEXRECT]				= dp_texrect;	
g_func_list[| G_POPMTX]					= sp_popmtx;	

globalvar rStack, rStackAt;
rStack			= ds_list_create();
rStackAt		= 0;

boot("n64_gfx_scripts_macros_init");
}
	
/// @function	sp_reset
function sp_reset() {
    rsp.modelview_matrix_stack_size = 1;
    rsp.current_num_lights = 2;
    rsp.lights_changed = true;
}

/// @function	lookup_or_create_color_combiner
function lookup_or_create_color_combiner(cc_id) {
	
	// @zoptimized
	var _prev_combiner = prev_combiner;
    if (_prev_combiner != null && _prev_combiner.cc_id == cc_id) {
        return _prev_combiner;
    }
	
	var _pool = color_combiner_pool;
	if (ds_map_exists(_pool, cc_id)) {
		prev_combiner = _pool[? cc_id];
		return prev_combiner;
	}

    flush();
		
    var new_combiner = generate_cc(cc_id);
	color_combiner_pool[? cc_id] = new_combiner;
    prev_combiner = new_combiner;
		
    return new_combiner;
}
	
/// @function	lookup_or_create_shader_program
function lookup_or_create_shader_program(shader_id) {

    var prg = lookup_shader(shader_id)
    if (prg == undefined) {
        unload_shader(rendering_state.shader_program);
        prg = create_and_load_new_shader(shader_id);
        rendering_state.shader_program = prg;
    }

    return prg;
}

/// @function	generate_cc
function generate_cc(cc_id) {
    var c = [[0,0,0,0],[0,0,0,0]];
    var shader_id = (cc_id >> 24) << 24
    var shader_input_mapping =[[0,0,0,0],[0,0,0,0]];

    c[0][0] = (cc_id >> (0 * 3)) & 7;
    c[1][0] = (cc_id >> (12 + 0 * 3)) & 7;
    c[0][1] = (cc_id >> (1 * 3)) & 7;
    c[1][1] = (cc_id >> (12 + 1 * 3)) & 7;
    c[0][2] = (cc_id >> (2 * 3)) & 7;
    c[1][2] = (cc_id >> (12 + 2 * 3)) & 7;
    c[0][3] = (cc_id >> (3 * 3)) & 7;
    c[1][3] = (cc_id >> (12 + 3 * 3)) & 7;

    for (var i = 0; i < 2; i++) {
        if (c[i][0] == c[i][1] || c[i][2] == CC_0) {
			c[i][2] = 0;
			c[i][1] = 0;
            c[i][0] = 0;
        }

        var input_number = array_create(8);
        var next_input_number = SHADER_INPUT_1;
        for (var j = 0; j < 4; j++) {
            var val = 0;
            switch (c[i][j]) {
                case CC_0: break
                case CC_TEXEL0: val = SHADER_TEXEL0; break
                case CC_TEXEL1: val = SHADER_TEXEL1; break
                case CC_TEXEL0A: val = SHADER_TEXEL0A; break
                case CC_PRIM:
                case CC_SHADE:
                case CC_ENV:
                case CC_LOD:
                    if (input_number[c[i][j]] == 0) {
                        shader_input_mapping[i][next_input_number - 1] = c[i][j];
                        input_number[c[i][j]] = next_input_number++;
                    } 
                    val = input_number[c[i][j]];
                    break;
            }
            shader_id |= val << (i * 12 + j * 3);
        }
    }

	var ret = new ObjectDummy();
	ret.cc_id = cc_id;
	ret.shader_input_mapping = shader_input_mapping;
	ret.prg = lookup_or_create_shader_program(shader_id);
	return ret;


}

/// @function	sp_popmtx()
function sp_popmtx(args) {
	var parameters	= args[1];
	
    if (rsp.modelview_matrix_stack_size > 0) {
        --rsp.modelview_matrix_stack_size;
        if (rsp.modelview_matrix_stack_size > 0) {
		array_copy(MP_matrix, 0,
			matrix_multiply(rsp.modelview_matrix_stack[rsp.modelview_matrix_stack_size - 1], P_matrix),
			0, 16);
	    }
	}
}
	
/// @function	sp_matrix
function sp_matrix(args) {
		
	var parameters, og_matrix;
	parameters	= args[2];
	og_matrix	= args[1];
		
	var matrix = array_create(0);
	array_copy(matrix, 0, og_matrix, 0, 16);
	
	var _rsp = rsp;
		
    if (parameters & G_MTX_PROJECTION) {

        if (parameters & G_MTX_LOAD) {
            P_matrix = matrix;
        } else {
			array_copy(P_matrix, 0, matrix_multiply(matrix, P_matrix), 0, 16);
        }
		
			
    } else { // G_MTX_MODELVIEW
		
			
        if ((parameters & G_MTX_PUSH) && _rsp.modelview_matrix_stack_size < 11) {
            _rsp.modelview_matrix_stack_size++;
            array_copy(
				_rsp.modelview_matrix_stack[_rsp.modelview_matrix_stack_size - 1], 0,
				_rsp.modelview_matrix_stack[_rsp.modelview_matrix_stack_size - 2],
				0, 16
			);
        }
        if (parameters & G_MTX_LOAD) {
            _rsp.modelview_matrix_stack[_rsp.modelview_matrix_stack_size - 1] = matrix;
        } else {

			array_copy(_rsp.modelview_matrix_stack[_rsp.modelview_matrix_stack_size - 1], 0,
			matrix_multiply(matrix, _rsp.modelview_matrix_stack[_rsp.modelview_matrix_stack_size - 1]),
			0, 16);
        }
        _rsp.lights_changed = true;
    }
		
	array_copy(MP_matrix, 0, matrix_multiply(P_matrix, _rsp.modelview_matrix_stack[_rsp.modelview_matrix_stack_size - 1]), 0, 16);
		

}
	
/// @function	sp_geometry_mode
function sp_geometry_mode(args) {
	
	var _rsp = rsp;
    _rsp.geometry_mode &= ~args[1];
    _rsp.geometry_mode |= args[2];
	
}

function scale_5_8(val) { return ((val * 0xFF) / 0x1F); }
function scale_4_8(val) { return (val * 0x11); }
	
/// @function dp_set_fill_col
function dp_set_fill_col(args) {
		
	var color = args[1];
		
	var _rdp = rdp;
    _rdp.fill_color.r = (((color >> 11) * 0xFF) / 0x1F);
    _rdp.fill_color.g = ((((color >> 6) & 0x1f) * 0xFF) / 0x1F);
    _rdp.fill_color.b = ((((color >> 1) & 0x1f) * 0xFF) / 0x1F);
    _rdp.fill_color.a = (color & 1) * 255;
		
}
	
/// @function	dp_set_combine_mode
function dp_set_combine_mode(rgb, alpha) {
		
    rdp.combine_mode = rgb | (alpha << 12);
}
	
/// @function	viewportsEqual
function viewportsEqual(vp1, vp2) {
    return	((vp1.x == vp2.x) &&
			(vp1.y == vp2.y) &&
			(vp1.width == vp2.width) &&
			(vp1.height == vp2.height));
}

	
/// @function	color_comb
function color_comb(a, b, c, d) {
	var lut = color_comb_lookup;
    return (lut[a] | (lut[b] << 3) | (lut[c] << 6) | (lut[d] << 9));
}
	
function calc_and_set_viewport(viewport) {
		
	var _rdp = rdp;
	
    var width = 2.0 * viewport.vscale[0] >> 2;
    var height = 2.0 * viewport.vscale[1] >> 2;
    var xx = (viewport.vtrans[0] >> 2) - width / 2.0;
    var yy = 240 - ((viewport.vtrans[1] >> 2) + height / 2.0);

    width *= 2.0;
    height *= 2.0;
    xx *= 2.0;
    yy *= 2.0;
		
	_rdp.viewport.xx = xx;
	_rdp.viewport.yy = yy;
	_rdp.viewport.width = width;
	_rdp.viewport.height = height;
   
    _rdp.viewport_or_scissor_changed = true;
}

	
/// @function	sp_movemem
function sp_movemem(args) {
		
	if (args[1] == G_MV_L) {
		rsp.current_lights[args[3]] = args[2];
		return;
	}
		
	//if (args[1] == G_MV_VIEWPORT) {
	//	calc_and_set_viewport(args[2]);
	//	return;
	//}

}
	
function adjust_x_for_aspect_ratio(_x) {
	return _x * ADJUST_ASPECT;
}
	
function draw_rect(ulx, uly, lrx, lry) {
		
	var _rdp = rdp;
	var _rsp = rsp;
	
    // U10.2 coordinates
    var ulxf = ulx;
    var ulyf = uly;
    var lrxf = lrx;
    var lryf = lry;
	
	var ortho_layer = argument_count > 4 ? argument[4] : TRI_MODE_ORTHO;
	
	var saved_other_mode_h = _rdp.other_mode_h;
			
	var cycle_type = _rdp.other_mode_h[G_MDSFT_CYCLETYPE];

	if (cycle_type == G_CYC_COPY) {
	    _rdp.other_mode_h[G_MDSFT_TEXTFILT] = G_TF_POINT;
	}

	ulxf = (ulxf / (4 * (SCREEN_WIDTH / 2.0))) - 1.0;
	ulyf = -(ulyf / (4 * (SCREEN_HEIGHT / 2.0))) + 1.0;
	lrxf = (lrxf / (4 * (SCREEN_WIDTH / 2.0))) - 1.0;
	lryf = -(lryf / (4 * (SCREEN_HEIGHT / 2.0))) + 1.0;
		
	ulxf = adjust_x_for_aspect_ratio(ulxf);
	lrxf = adjust_x_for_aspect_ratio(lrxf);

	var ul = rsp_loaded_vertices[| MAX_VERTICES + 0];
	var ll = rsp_loaded_vertices[| MAX_VERTICES + 1];
	var lr = rsp_loaded_vertices[| MAX_VERTICES + 2];
	var ur = rsp_loaded_vertices[| MAX_VERTICES + 3];

	var zz = -1;
		
    ul[| VTX_X] = ulxf;
    ul[| VTX_Y] = ulyf;
    ul[| VTX_Z] = zz;
    ul[| VTX_W] = 1.0;
  	
    ll[| VTX_X] = ulxf;
    ll[| VTX_Y] = lryf;
    ll[| VTX_Z] = zz;
    ll[| VTX_W] = 1.0;
   
    lr[| VTX_X] = lrxf;
    lr[| VTX_Y] = lryf;
    lr[| VTX_Z] = zz;
    lr[| VTX_W] = 1.0;
  	
    ur[| VTX_X] = lrxf;
    ur[| VTX_Y] = ulyf;
    ur[| VTX_Z] = zz;
    ur[| VTX_W] = 1.0;

	var default_viewport = new ObjectDummy();
	default_viewport.x = 0;
	default_viewport.y = 0;
	default_viewport.width = SCREEN_WIDTH;
	default_viewport.height = SCREEN_HEIGHT;
		
	var viewport_saved = _rdp.viewport;
	var geometry_mode_saved = _rsp.geometry_mode;
		
	_rdp.viewport = default_viewport;
	_rdp.viewport_or_scissor_changed = true;
	_rsp.geometry_mode = 0;
	
	sp_tri1([G_TRI1, MAX_VERTICES + 0, MAX_VERTICES + 1, MAX_VERTICES + 3, ortho_layer]);
	sp_tri1([G_TRI1, MAX_VERTICES + 1, MAX_VERTICES + 2, MAX_VERTICES + 3, ortho_layer]);

	_rsp.geometry_mode = geometry_mode_saved;
	_rdp.viewport = viewport_saved;
	_rdp.viewport_or_scissor_changed = true;
	


	if (cycle_type == G_CYC_COPY) {
	    _rdp.other_mode_h = saved_other_mode_h;
	}

}
	
/// @function	dp_set_env_color
function dp_set_env_color(args) {
		
	var _rdp_env_color = rdp_env_color;
	_rdp_env_color.r = args[1];
	_rdp_env_color.g = args[2];
	_rdp_env_color.b = args[3];
	_rdp_env_color.a = args[4];
		
}
/// @function	dp_set_prim_color
function dp_set_prim_color(args) {
		
	var _rdp_prim_color = rdp_prim_color;
	_rdp_prim_color.r = args[3];
	_rdp_prim_color.g = args[4];
	_rdp_prim_color.b = args[4];
	_rdp_prim_color.a = args[6];
		
}

/// @function	dp_fill_rect
function dp_fill_rect(args) {
	
	var _rdp = rdp;
	var _rsp = rsp;
		
	var ulx, uly, lrx, lry, ortho_layer;
	ulx = args[1];
	uly = args[2];
	lrx = args[3];
	lry = args[4];
	ortho_layer = array_length(args) > 5 ? args[5] : TRI_MODE_ORTHO;
		
    var mode = _rdp.other_mode_h[G_MDSFT_CYCLETYPE];

    if (mode == G_CYC_COPY || mode == G_CYC_FILL) {
        lrx++;
        lry++;
    }

	var vertices = rsp_loaded_vertices;
	var fcol = _rdp.fill_color;
	
    for (var i = MAX_VERTICES; i < MAX_VERTICES + 4; i++) {
		//var vi = vertices[i];
        rsp_loaded_vertices[| i][| VTX_R] = fcol.r;
        rsp_loaded_vertices[| i][| VTX_G] = fcol.g;
        rsp_loaded_vertices[| i][| VTX_B] = fcol.b;
        rsp_loaded_vertices[| i][| VTX_A] = fcol.a;
    }

    var saved_combine_mode = _rdp.combine_mode;
		
    dp_set_combine_mode(
		color_comb(0, 0, 0, G_CCMUX_SHADE),
		color_comb(0, 0, 0, G_CCMUX_SHADE)
	);
		
    draw_rect(ulx, uly, lrx, lry, ortho_layer);
    _rdp.combine_mode = saved_combine_mode;

}

/// @function	sp_texture
function sp_texture(args) {
	
	texture_scaling_factor_s = args[1];
	texture_scaling_factor_t = args[2];
	
}

/// @function	sp_set_other_mode_h
function sp_set_other_mode_h(args) {
	if (array_length(args)<3) return;
    rdp.other_mode_h[args[1]] = args[2];
}

/// @function	sp_set_other_mode_l
function sp_set_other_mode_l(args) {
		
    rdp.other_mode_l = (rdp.other_mode_l & 0x7) | args[1];
		
}

/// @function	dp_set_tile
function dp_set_tile(args) {

	var _rdp = rdp;
    if (args[5] == G_TX_RENDERTILE) {
			
		var rdp_texture_tile = _rdp.texture_tile;

		rdp_texture_tile.fmt = args[1];
		rdp_texture_tile.siz = args[2];
		rdp_texture_tile.cms = args[8];
		rdp_texture_tile.cmt = args[7];
			
		_rdp.textures_changed[0] = true;
		_rdp.textures_changed[1] = true;	

    }
		
	if (args[5] != G_TX_LOADTILE) return;
		
    _rdp.texture_to_load.tile_number = args[4] >> 8;
}

/// @function	dp_set_tile_size
function dp_set_tile_size(args) {
		
    if (args[1] != G_TX_RENDERTILE) return;
		
	var _rdp = rdp;
	var rdp_texture_tile = _rdp.texture_tile;
			
	rdp_texture_tile.uls = args[2];
	rdp_texture_tile.ult = args[3];
	rdp_texture_tile.lrs = args[4];
	rdp_texture_tile.lrt = args[5];
    _rdp.textures_changed[0] = true;
    _rdp.textures_changed[1] = true;

}

/// @function	dp_set_texture_image
function dp_set_texture_image(args) {
		
	var _rdp = rdp.texture_to_load;
	_rdp.size = args[2];
	_rdp.textureData = args[4];

}
	
/// @function	sp_moveword
function sp_moveword(args) {
		
	if (args[1] != G_MW_NUMLIGHT) return;
		
	var _rsp = rsp;
    _rsp.current_num_lights = args[2];
    _rsp.lights_changed = true;

}
	
/// @function	dp_load_block
function dp_load_block(args) {
		
    if (args[1] != G_TX_LOADTILE &&
		args[2] != 0 &&
		args[3] != 0) return;
		
	var _rdp = rdp;
		
	var ltexture = _rdp.loaded_texture;
	var ttl = _rdp.texture_to_load;
	
    ltexture[@ ttl.tile_number].textureData = ttl.textureData;
    _rdp.textures_changed[ttl.tile_number] = true;
	
	//llog("data", rdp.loaded_texture[ttl.tile_number].textureData);
	//log(rdp.textures_changed);
		
}


/// @function	calculate_normal_dir
function calculate_normal_dir(light, coeffs, _rsp) {

	var cnt = _rsp.modelview_matrix_stack[_rsp.modelview_matrix_stack_size - 1];
		
    var _a = light[0] * cnt[M00] + light[1] * cnt[M01] + light[2] * cnt[M02];
    var _b = light[0] * cnt[M10] + light[1] * cnt[M11] + light[2] * cnt[M12];
    var _c = light[0] * cnt[M20] + light[1] * cnt[M21] + light[2] * cnt[M22];
		
    var s = sqrt(((_a*_a) + (_b*_b) + (_c*_c)));
    coeffs[@ 0] = _a / s;
    coeffs[@ 1] = _b / s;
    coeffs[@ 2] = _c / s;
}
	
	
/// @function	sp_vertex
function sp_vertex(args) {
	
	var dest_index, vertices, len;
	dest_index	= args[2];
	vertices	= args[1];
	len			= args[3];

	var _rsp = rsp;
	
	var mp_mat = MP_matrix;
	
	var mp00 = mp_mat[M00];
	var mp01 = mp_mat[M01];
	var mp02 = mp_mat[M02];
	var mp03 = mp_mat[M03];
	
	var mp10 = mp_mat[M10];
	var mp11 = mp_mat[M11];
	var mp12 = mp_mat[M12];
	var mp13 = mp_mat[M13];
	
	var mp20 = mp_mat[M20];
	var mp21 = mp_mat[M21];
	var mp22 = mp_mat[M22];
	var mp23 = mp_mat[M23];
	
	var mp30 = mp_mat[M30];
	var mp31 = mp_mat[M31];
	var mp32 = mp_mat[M32];
	var mp33 = mp_mat[M33];
	
	var r_geo_mode	= rsp.geometry_mode;
	var lighting	= r_geo_mode & G_LIGHTING;
	var texture_gen = r_geo_mode & G_TEXTURE_GEN;
	
	var sp_vertex_lookat_xy = array_create(3);
	
	var i = -1;
    while(i++ < len-1) {
        var v = vertices[| i];
        
        var final_r =	v[VTX_R];
		var final_g =	v[VTX_G];
		var final_b =	v[VTX_B];
		var final_a =	v[VTX_A];
		var vp1		=	v[VTX_X];
		var vp2		=	v[VTX_Y];
		var vp3		=	v[VTX_Z];
        var U		=	v[VTX_U] * texture_scaling_factor_s >> 16;
        var V		=	v[VTX_V] * texture_scaling_factor_t >> 16;
		var sflag	=	v[VTX_SF];
			
        var xx	= vp1 * mp00 + vp2 * mp10 + vp3 * mp20 + mp30;
        var yy	= vp1 * mp01 + vp2 * mp11 + vp3 * mp21 + mp31;
        var zz	= vp1 * mp02 + vp2 * mp12 + vp3 * mp22 + mp32;
        var ww	= vp1 * mp03 + vp2 * mp13 + vp3 * mp23 + mp33;
		
        if (lighting) {
			
			var clights = _rsp.current_lights_coeffs;
			var clookat = _rsp.current_lookat_coeffs;
			

            if (_rsp.lights_changed) {
					
                for (var ii = 0; ii < _rsp.current_num_lights - 1; ii++) {
					var cl = _rsp.current_lights;
					var _current_lights = [cl[ii].dir[0]/127, cl[ii].dir[1]/127, cl[ii].dir[2]/127];
                    calculate_normal_dir(_current_lights, clights[ii], _rsp);
                }

                calculate_normal_dir(sp_vertex_lookat_xy, clookat[0], _rsp);
                calculate_normal_dir(sp_vertex_lookat_xy, clookat[1], _rsp);
                _rsp.lights_changed = false;
            }

            /// the ambient light?
			var lgt_col = _rsp.current_lights[_rsp.current_num_lights - 1].col;
            var r = lgt_col[0];
            var g = lgt_col[1];
            var b = lgt_col[2];
			
			var sp_vertex_normal0 = final_r > 127 ? final_r - 256: final_r;
		    var sp_vertex_normal1 = final_g > 127 ? final_g - 256: final_g;
		    var sp_vertex_normal2 = final_b > 127 ? final_b - 256: final_b;

            for (var ii = 0; ii < _rsp.current_num_lights - 1; ii++) {
					
                var intensity = (
	                sp_vertex_normal0 * clights[ii][0] +
	                sp_vertex_normal1 * clights[ii][1] +
	                sp_vertex_normal2 * clights[ii][2]
				) / 127;
					
                if (intensity <= 0) continue;
					
				var lgt_ii_col = _rsp.current_lights[ii].col;
                r += intensity * lgt_ii_col[0];
                g += intensity * lgt_ii_col[1];
                b += intensity * lgt_ii_col[2];
                   
            }

			final_r = r > 255 ? 255 : r;
			final_g = g > 255 ? 255 : g;
			final_b = b > 255 ? 255 : b;

            if (texture_gen) {
				
				var clookat0 = clookat[0];
				var clookat1 = clookat[1];
					
                var dotx = (
	                sp_vertex_normal0 * clookat0[0] +
	                sp_vertex_normal1 * clookat0[1] +
	                sp_vertex_normal2 * clookat0[2]
				);
					
				var doty = (
	                sp_vertex_normal0 * clookat1[0] +
	                sp_vertex_normal1 * clookat1[1] +
	                sp_vertex_normal2 * clookat1[2]
				);

                U = (dotx / 127.0 + 1.0) >> 2 * texture_scaling_factor_s >> 16;
                V = (doty / 127.0 + 1.0) >> 2 * texture_scaling_factor_t >> 16;
            }

        }

        var rej = 0;
        if (xx < -ww)	rej |= 1;
        else if (xx > ww)	rej |= 2;
        if (yy < -ww)	rej |= 4;
        else if (yy > ww)	rej |= 8;
        if (zz < -ww)	rej |= 16;
        else if (zz > ww)	rej |= 32;
		
		var vert_list	= rsp_loaded_vertices[| dest_index+i];
		vert_list[| 0]	= final_r;
		vert_list[| 1]	= final_g;
		vert_list[| 2]	= final_b;
		vert_list[| 3]	= final_a;
		vert_list[| 4]	= xx;
		vert_list[| 5]	= yy;
		vert_list[| 6]	= zz;
		vert_list[| 7]	= U;
		vert_list[| 8]	= V;
		vert_list[| 9]	= sflag;
		vert_list[| 10] = rej;
		vert_list[| 11] = ww;
		
		//_rsp.loaded_vertices[| dest_index+i] = [final_r, final_g, final_b, final_a, xx, yy, zz, U, V, sflag, rej, ww];
		//_rsp.loaded_vertices[dest_index+i][VTX_REJ] = 1 | 2 | 4 | 8 | 16 | 32;//
		//continue;
    }
	
	vert_cnt += len;
}
	

	
function sp_nametag(x, y, z, width) {
		
	var aspect_hor = (x / width)/2;
	var aspect_vert = (y / width)/2;
		
	var GUI_width	= SCREEN_WIDTH;
	var GUI_height	= SCREEN_HEIGHT;
			
	var xpos, ypos, zpos;
	xpos = ((aspect_hor + 0.5) * GUI_width) - 48;
	ypos = ((-aspect_vert + 0.5) * GUI_height) - 32;
	zpos = 0;
		
	var str = "Player #" + string(active_player);
	ds_stack_push(nametag_stack, [xpos, ypos, zpos, 96, 28, str]);
}

/// @function	sp_tri1
function sp_tri1(args) {
	
	var _rsp = rsp;
	var _rdp = rdp;
	
	var arg0 = args;
		
	var v1, v2, v3;
	v1 = rsp_loaded_vertices[| arg0[1]];
	v2 = rsp_loaded_vertices[| arg0[2]];		
	v3 = rsp_loaded_vertices[| arg0[3]];
	
    if (v1[| VTX_REJ] & v2[| VTX_REJ] & v3[| VTX_REJ]) return;
	
	var v = [v1, v2, v3];
	var ortho_mode = arg0[4] | TRI_MODE_DEFAULT;
	
	var rsp_geometry_mode = _rsp.geometry_mode; // opt

	if ((rsp_geometry_mode & G_CULL_BOTH) != 0) {
		
		var v1_x = v1[| VTX_X];
		var v1_y = v1[| VTX_Y];
		var v1_w = v1[| VTX_W];
		var v2_x = v2[| VTX_X];
		var v2_y = v2[| VTX_Y];
		var v2_w = v2[| VTX_W];
		var v3_x = v3[| VTX_X];
		var v3_y = v3[| VTX_Y];
		var v3_w = v3[| VTX_W];
	    var dx1 = v1_x / (v1_w) - v2_x / (v2_w);
	    var dy1 = v1_y / (v1_w) - v2_y / (v2_w);
	    var dx2 = v3_x / (v3_w) - v2_x / (v2_w);
	    var dy2 = v3_y / (v3_w) - v2_y / (v2_w);
		
        var cross = dx1 * dy2 - dy1 * dx2;
        
        //if ((v1_w < 0) ^ (v2_w < 0) ^ (v3_w < 0)) {
        //    cross = -cross;
        //}

        switch (rsp_geometry_mode & G_CULL_BOTH) {
            case G_CULL_FRONT:
                if (cross <= 0) return;
                break;
            case G_CULL_BACK:
                if (cross >= 0) return;
                break;
        }
    
	}
	
	var rdp_other_mode_l = _rdp.other_mode_l;
	
    var depth_test = (rsp.geometry_mode & G_ZBUFFER) == G_ZBUFFER;
    if (depth_test != rendering_state.depth_test) {
        flush();
        set_depth_test(depth_test);
        rendering_state.depth_test = depth_test;
    }
	
    var z_upd = (rdp_other_mode_l & Z_UPD) == Z_UPD;
    if (z_upd != rendering_state.depth_mask) {
        flush();
        set_depth_mask(z_upd);
        rendering_state.depth_mask = z_upd;
    }
	
	
    var zmode_decal = (rdp_other_mode_l & ZMODE_DEC) == ZMODE_DEC;
    if (zmode_decal != rendering_state.decal_mode) {
        flush();
        set_zmode_decal(zmode_decal);
        rendering_state.decal_mode = zmode_decal;
    }
	
	var cc_id = _rdp.combine_mode;
	
    var use_alpha		= (rdp_other_mode_l & (G_BL_A_MEM << 18)) == 0;
    //var use_fog		= (rdp_other_mode_l >> 30) == G_BL_CLR_FOG;
    var texture_edge	= (rdp_other_mode_l & CVG_X_ALPHA) == CVG_X_ALPHA;
    //var use_noise		= (rdp_other_mode_l & G_AC_DITHER) == G_AC_DITHER;
    
    if (texture_edge) use_alpha = true;
    
    if (use_alpha) cc_id |= SHADER_OPT_ALPHA;
    //if (use_fog) cc_id |= SHADER_OPT_FOG;
    if (texture_edge) cc_id |= SHADER_OPT_TEXTURE_EDGE;
    
    if (!use_alpha) cc_id &= ~0xfff000;

    var comb = lookup_or_create_color_combiner(cc_id);
    var prg = comb.prg;

    if (prg != rendering_state.shader_program) {
        flush();
        unload_shader(rendering_state.shader_program);
        load_shader(prg);
        rendering_state.shader_program = prg;
    }

    if (use_alpha != rendering_state.alpha_blend) {
        flush();
		set_use_alpha(use_alpha);
        rendering_state.alpha_blend = use_alpha;
		//log("alpha_blend changed to", use_alpha, "(" + string(get_timer()) + ")");
    }

    var num_inputs			= prg.num_inputs;
	var used_textures		= prg.used_textures;
	var rdp_texture_tile	= _rdp.texture_tile;
	
	//log(used_textures);
	//@z figure out why prg doesn't say to use textures here
	if (ortho_mode>0) used_textures[0] = true;
	
	var rendering_state_textures = rendering_state.textures;
		
    for (var i = 0; i < 2; i++) {
        if (!used_textures[i]) continue;
			
        if (_rdp.textures_changed[i]) {
			flush();
            import_texture(i);
            _rdp.textures_changed[i] = false;
        }
			
        var linear_filter = _rdp.other_mode_h[G_MDSFT_TEXTFILT] != 0;
		
        if (linear_filter != rendering_state_textures[i].linear_filter ||
            rdp_texture_tile.cms != rendering_state_textures[i].cms ||
            rdp_texture_tile.cmt != rendering_state_textures[i].cmt) {

            flush();
            set_sampler_parameters(i, linear_filter, rdp_texture_tile.cms, rdp_texture_tile.cmt);
            rendering_state_textures[@ i].linear_filter = linear_filter;
            rendering_state_textures[@ i].cms = rdp_texture_tile.cms;
            rendering_state_textures[@ i].cmt = rdp_texture_tile.cmt;

        }
	}
		
    var use_texture = used_textures[0] || used_textures[1];
    var tex_width = (rdp_texture_tile.lrs - rdp_texture_tile.uls + 4) >> 2;
    var tex_height = (rdp_texture_tile.lrt - rdp_texture_tile.ult + 4) >> 2;
		
	var _rdp_other_mode_h = _rdp.other_mode_h[G_MDSFT_TEXTFILT];
	var offset = buf_vbo_size;
    for (var i = 0; i < 3; i++) {
		
		var vi = v[i];
		
        buf_vbo[| offset++]=vi[| VTX_X];
        buf_vbo[| offset++]=vi[| VTX_Y];
        buf_vbo[| offset++]=vi[| VTX_Z];
        buf_vbo[| offset++]=vi[| VTX_W];
		   
        if (use_texture) {
				
            var u = ((vi[| VTX_U]) - rdp_texture_tile.uls * 8) / 32.0;
            var vv = ((vi[| VTX_V]) - rdp_texture_tile.ult * 8) / 32.0;
				
            if (_rdp_other_mode_h != G_TF_POINT) {
                u += 0.5;
                vv += 0.5;
            }

			buf_vbo[| offset++] = (u / tex_width);
            buf_vbo[| offset++] = (vv / tex_height);

 
        }
		else {
			buf_vbo[| offset++] = null;
			buf_vbo[| offset++] = null;
		}
			
		var use_r = 255;
		var use_g = 255;
		var use_b = 255;
		var use_a = 1;

		var k = 0;
		if (ortho_mode<1) { // @z :x
	        for (var j = 0; j < num_inputs; j++) {
	            switch (comb.shader_input_mapping[k][j]) {
	                case CC_SHADE:
						use_r = vi[| VTX_R];
						use_g = vi[| VTX_G];
						use_b = vi[| VTX_B];
					break;
	                case CC_PRIM:
						var prime = _rdp.prim_color;
						use_r = prime.r;
						use_g = prime.g;
						use_b = prime.b;
					break;
	                case CC_ENV:
						var enviro = _rdp.env_color;
						use_r = enviro.r;
						use_g = enviro.g;
						use_b = enviro.b;
					break;
	                case CC_LOD:
						var distance_frac = clamp((((vi[| VTX_W]) - 3000.0) / 3000.0) * 255, 0, 1);
						use_r = distance_frac;
						use_g = distance_frac;
						use_b = distance_frac;
					break;
				}
	        }
		}

		buf_vbo[| offset++]=use_r;
		buf_vbo[| offset++]=use_g;
		buf_vbo[| offset++]=use_b;			
		buf_vbo[| offset++]=use_a;			
		buf_vbo[| offset++]=ortho_mode;	
			
    }
	buf_vbo_size = offset;
	
	tri_cnt = buf_vbo_num_tris;

    if (++buf_vbo_num_tris == MAX_BUFFERED) {
        flush();
    }
		
}

	
/// @function	texture_cache_lookup
function texture_cache_lookup(tile, textureData) {

	// @zoptimized
	var _pool = gfx_texture_cache.pool;
	
	if (ds_map_exists(_pool, textureData)) {
		var node = _pool[? textureData];
        select_texture(tile, node.texture_object);
		//log(TEXTURE_2D);
        rendering_state.textures[tile] = node;
		Ptr.p_texture = node;
        return true;
	}

    var node = new ObjectDummy();
    _pool[? textureData] = node;
    node.texture_object = new_texture();
	node.texture_object.textureData = textureData;
    select_texture(tile, node.texture_object)
    set_sampler_parameters(tile, false, 0, 0)
	node.cms = 0;
	node.cmt = 0;
	node.linear_filter = false;
    rendering_state.textures[tile] = node;
		
	Ptr.p_texture = node;
		
    return false;
}
	
/// @function	import_texture
function import_texture(tile) {

    if (texture_cache_lookup(tile, rdp.loaded_texture[tile].textureData)) {
		return;	
	}
	
	var texture = Ptr.p_texture;
	texture.textureData = rdp.loaded_texture[tile].textureData;
}


function g_func_G_SETCOMBINE(command) {
	var md = command[1];
	var mdr = md.rgb;
	var mda = md.alpha;
	var rgb		= color_comb(mdr[0], mdr[1], mdr[2], mdr[3]);
	var alpha	= color_comb(mda[0], mda[1], mda[2], mda[3]);
	dp_set_combine_mode(rgb, alpha);	
}
	
function sp_player(args) {
	active_player = args[1];
}

	
function sp_unset_player(args) {
	//active_player = args[1];
}
	
// displaylist, _ulx, _uly, _lrx, _lry, _tile, _s, _t, _dsdx, _dsdy
function dp_texrect(args) {
	
	var _rsp = rsp;
	var _rdp = rdp;
	
	var arg0 = args;
		
	var ulx, uly, lrx, lry, tile, uls, ult, dsdx, dtdy, ortho_layer;
	ulx		= arg0[1];
	uly		= arg0[2];
	lrx		= arg0[3];
	lry		= arg0[4];
	tile	= arg0[5];
	uls		= arg0[6];
	ult		= arg0[7];
	dsdx	= arg0[8];
	dtdy	= arg0[9];
	
	ortho_layer = array_length(args) > 10 ? args[10] : TRI_MODE_ORTHO;
		
	var flip = false;
		
	var saved_combine_mode = _rdp.combine_mode;
		
	var cycle_type = _rdp.other_mode_h[G_MDSFT_CYCLETYPE];

	//if (cycle_type == G_CYC_COPY) {
	    // Per RDP Command Summary Set Tile's shift s and this dsdx should be set to 4 texels
	    // Divide by 4 to get 1 instead
	    dsdx = dsdx >> 2;
        
	    // Color combiner is turned off in copy mode
	    dp_set_combine_mode(color_comb(0, 0, 0, G_CCMUX_TEXEL0), color_comb(0, 0, 0, G_ACMUX_TEXEL0));
        
	    // Per documentation one extra pixel is added in this modes to each edge
	    lrx += 1 << 2;
	    lry += 1 << 2;
	//}
	

	// uls and ult are S10.5
	// dsdx and dtdy are S5.10
	// lrx, lry, ulx, uly are U10.2
	// lrs, lrt are S10.5
	if (flip) {
	    dsdx = -dsdx;
	    dtdy = -dtdy;
	}
	var width = !flip ? lrx - ulx : lry - uly;
	var height = !flip ? lry - uly : lrx - ulx;
	var lrs = ((uls << 7) + dsdx * width) >> 7;
	var lrt = ((ult << 7) + dtdy * height) >> 7;
    
	var ul = rsp_loaded_vertices[| MAX_VERTICES + 0];
	var ll = rsp_loaded_vertices[| MAX_VERTICES + 1];
	var lr = rsp_loaded_vertices[| MAX_VERTICES + 2];
	var ur = rsp_loaded_vertices[| MAX_VERTICES + 3];
	ul[| VTX_U] = uls;
	ul[| VTX_V] = ult;
	lr[| VTX_U] = lrs;
	lr[| VTX_V] = lrt;
	if (!flip) {
	    ll[| VTX_U] = uls;
	    ll[| VTX_V] = lrt;
	    ur[| VTX_U] = lrs;
	    ur[| VTX_V] = ult;
	} else {
	    ll[| VTX_U] = lrs;
	    ll[| VTX_V] = ult;
	    ur[| VTX_U] = uls;
	    ur[| VTX_V] = lrt;
	}
	
		
	//log(ulx, uly, lrx, lry);
    
	draw_rect(ulx, uly, lrx, lry, ortho_layer);
	_rdp.combine_mode = saved_combine_mode;
} 



/// @function	run_dl
function run_dl(_commands) {

	var commands	= _commands.dl_arr;
	var _len		= _commands.dl_size;
	
	var i = -1;
	
    while(i++<_len-1) {
		
		var command, opcode;
		command = commands[i];
		opcode	= command[0];
		
		if (opcode == G_DL) {
			
			run_dl(command[1]);
			
		    if (command[2] == G_DL_PUSH) {
				continue;
			}
			
			return;
			
		}
		
		var func = g_func_list[| opcode];
		
		rStack[| rStackAt++] = func;
		rStack[| rStackAt++] = command;
		

    }
}
	

function flush() {
				
	if (buf_vbo_size < 1) return;

	draw_triangles();
	buf_vbo_size		= 0;
	buf_vbo_num_tris	= 0;
		
}

function test_func_00() {
	var a = 1;
	var b = 2;
	var c = a + b;
}
	
/// @function	run
function run() {
		
	vert_cnt = 0;
	tri_cnt = 0;
	totalTriangles = 0;
	
	opCount = 0;
	sp_reset();

	start_frame();

	rStackAt = 0;
	
	run_dl(gDisplayList);
	
	//TIMER_START(0);
	var operation = 0;
	var _rStack		= rStack;
	var _stackAt	= rStackAt;
	
	while(operation < _stackAt) {
		var func = _rStack[| operation++];
		
		if (func == 0) {
			operation++;
			continue;
		}
		
		
		//func = test_func_00;
		//func();
		func(_rStack[| operation++]);
	}
	
	opCount+=rStackAt;
	//TIMER_STOP(0);
	flush();

}