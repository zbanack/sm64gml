function gl_scripts_macros_init() {
	
globalvar COLOR_BUFFER_BIT, DEPTH_BUFFER_BIT;
COLOR_BUFFER_BIT = 16384;
DEPTH_BUFFER_BIT = 16384;

globalvar SCISSOR_TEST, CLEAR, SCISSOR_TEST;
SCISSOR_TEST		= 0;
CLEAR				= 0;
SCISSOR_TEST		= 0;

globalvar format_with_tex, format_without_tex;
format_with_tex		= -1;
format_without_tex	= -1;

globalvar shader_program_pool;
shader_program_pool	= ds_list_create();

globalvar LINEAR,
NEAREST,
TEXTURE_MIN_FILTER,
TEXTURE_MAG_FILTER,
CLAMP_TO_EDGE,
MIRRORED_REPEAT,
REPEAT,
TEXTURE_WRAP_S,
TEXTURE_WRAP_T,
POLYGON_OFFSET_FILL,
POLYGON_XOFFSET,
POLYGON_YOFFSET,
DEPTH_TEST_ENABLED,
USE_ALPHA,
DEPTH_MASK,
CLEAR_COLOR,
depthMask,
VERTEX_SHADER,
FRAGMENT_SHADER,
USING_SHADER,
ACTIVE_TEXTURE,
TEXTURE_2D,
prev_TEXTURE_2D;

LINEAR					= 0;
NEAREST					= 1;
TEXTURE_MIN_FILTER		= LINEAR;
TEXTURE_MAG_FILTER		= LINEAR;
REPEAT					= 0;
MIRRORED_REPEAT			= 1;
CLAMP_TO_EDGE			= 2;
TEXTURE_WRAP_S			= REPEAT;
TEXTURE_WRAP_T			= REPEAT;
LINEAR					= 0;
NEAREST					= 0;
POLYGON_OFFSET_FILL		= false;
POLYGON_XOFFSET			= 0;
POLYGON_YOFFSET			= 0;
DEPTH_TEST_ENABLED		= false;
USE_ALPHA				= false;
DEPTH_MASK				= true;
CLEAR_COLOR				= [];
depthMask				= 0;
VERTEX_SHADER			= 0;
FRAGMENT_SHADER			= 1;
USING_SHADER			= null;
ACTIVE_TEXTURE			= -1;
TEXTURE_2D				= [-1, -1];
prev_TEXTURE_2D			= [-1, -1];

// with texture
vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_color();

format_with_tex = vertex_format_end();
		
// without texture
vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_color();

format_without_tex = vertex_format_end();	

boot("gl_scripts_macros_init");
}

/**
 *
 */
globalvar d3d_zmode_decal;
d3d_zmode_decal		= -1;

globalvar d3d_polygon_xoffset;
d3d_polygon_xoffset	= 0;

globalvar d3d_polygon_yoffset;
d3d_polygon_yoffset	= 0;

#macro GL_POLYGON_OFFSET_FILL	0
#macro GL_POLYGON_OFFSET_LINE	1
#macro GL_POLYGON_OFFSET_POINT  2
globalvar d3d_enabled;
d3d_enabled	= array_create(3, false);
globalvar d3d_depth_test;
d3d_depth_test	= false;
globalvar d3d_use_alpha;
d3d_use_alpha	= false;
globalvar d3d_depth_mask;
d3d_depth_mask	= 0;

 
function set_zmode_decal(zmode_decal) {
	d3d_zmode_decal = zmode_decal;
}
function set_use_alpha(use_alpha) {
    d3d_use_alpha = use_alpha;
}
function set_depth_test(depth_test) {
    d3d_depth_test = depth_test;
}
function set_depth_mask(z_upd) {
    d3d_depth_mask = z_upd;
}

function gfx_opengl_set_zmode_decal(zmode_decal) {
    if (zmode_decal) {
        glPolygonOffset(-2, -2);
        glEnable(GL_POLYGON_OFFSET_FILL);
    } else {
        glPolygonOffset(0, 0);
        glDisable(GL_POLYGON_OFFSET_FILL);
    }
}

function glPolygonOffset(xoff, yoff) {
	d3d_polygon_xoffset = xoff;	
	d3d_polygon_yoffset = yoff;	
}

function glEnable(flag) {
	d3d_enabled[flag] = true;	
}

function glDisable(flag) {
	d3d_enabled[flag] = false;	
}
	
/**
 *
 */
 
function draw_triangles() {
		
	var skip_amount = buf_vbo_size / (buf_vbo_num_tris*3);
		
	var _until, _skip;
	_skip = skip_amount*3;
	_until = buf_vbo_size-_skip;

	var d = buf_vbo;
	var using_uv = d[| 5] != null;
		
	var this_model = vertex_create_buffer();
	vertex_begin(this_model, using_uv ? format_with_tex : format_without_tex);	
		
	var active_texture = TEXTURE_2D[ACTIVE_TEXTURE];
	var texture = (active_texture == null) ? -1 : sprite_get_texture(active_texture, 0);
	
	var ortho_type = d[| skip_amount-1];
	for(var i = 0; i <= _until; i+=_skip) {
			
		var t1 = i;
			
		for(var j = 0; j < 3; j++) {
			// 1
			var x1 = d[| t1++];
			var y1 = d[| t1++];
			var z1 = d[| t1++];
			var w1 = d[| t1++];
			var u1 = d[| t1++];
			var v1 = d[| t1++];
			var r1 = d[| t1++];
			var g1 = d[| t1++];
			var b1 = d[| t1++];
			var a1 = d[| t1++];
			var f1 = d[| t1++]; // flag
			
			vertex_position_3d(this_model, x1, y1, z1);
			if (using_uv) {
				//if (TEXTURE_WRAP_S == CLAMP_TO_EDGE) {
				//	u1 = clamp(u1, 0, 1);
				//}
				//if (TEXTURE_WRAP_T == CLAMP_TO_EDGE) {
				//	v1 = clamp(v1, 0, 1);
				//}
				vertex_texcoord(this_model, u1, v1);
			}
			

			vertex_color(this_model, make_color_rgb(r1, g1, b1), a1);	
		}

	}
		
	vertex_end(this_model);
		
	var list;
	switch(ortho_type) {
		case(TRI_MODE_ORTHO):
			list = global.__triangles_to_render_ortho;	
		break;
		case(TRI_MODE_ORTHO_BG):
			list = global.__triangles_to_render_ortho_background;	
		break;
		case(TRI_MODE_ORTHO_1_1):
			list = global.__triangles_to_render_ortho_1_1;
		break;
		default:
			list = global.__triangles_to_render;
		break;
	}

	// push actual triangle to stack
	ds_stack_push(
		list,
		[this_model, texture]
	);
		
}
	
function createShader(sourceCode, type) {
		
	var shader;
    switch(type) {
		case(VERTEX_SHADER):
			shader = new VertexShaderInstance();
		break;
		case(FRAGMENT_SHADER):
			shader = new FragmentShaderInstance();
			
		break;
	}
		
	shader.code = sourceCode;

    return shader;
}
	
function shader_item_to_str(item, with_alpha, only_alpha, inputs_have_alpha, hint_single_element) {
    if (!only_alpha) {
        switch (item) {
            case SHADER_0:
                return with_alpha ? "vec4(0.0, 0.0, 0.0, 0.0)" : "vec3(0.0, 0.0, 0.0)";
            case SHADER_INPUT_1:
                return with_alpha || !inputs_have_alpha ? "vInput1" : "vInput1.rgb";
            case SHADER_INPUT_2:
                return with_alpha || !inputs_have_alpha ? "vInput2" : "vInput2.rgb";
            case SHADER_INPUT_3:
                return with_alpha || !inputs_have_alpha ? "vInput3" : "vInput3.rgb";
            case SHADER_INPUT_4:
                return with_alpha || !inputs_have_alpha ? "vInput4" : "vInput4.rgb";
            case SHADER_TEXEL0:
                return with_alpha ? "texVal0" : "texVal0.rgb";
            case SHADER_TEXEL0A:
                return hint_single_element ? "texVal0.a" :
                    (with_alpha ? "vec4(texelVal0.a, texelVal0.a, texelVal0.a, texelVal0.a)" : "vec3(texelVal0.a, texelVal0.a, texelVal0.a)");
            case SHADER_TEXEL1:
                return with_alpha ? "texVal1" : "texVal1.rgb";
        }
    } else {
        switch (item) {
            case SHADER_0:
                return "0.0";
            case SHADER_INPUT_1:
                return "vInput1.a";
            case SHADER_INPUT_2:
                return "vInput2.a";
            case SHADER_INPUT_3:
                return "vInput3.a";
            case SHADER_INPUT_4:
                return "vInput4.a";
            case SHADER_TEXEL0:
                return "texVal0.a";
            case SHADER_TEXEL0A:
                return "texVal0.a";
            case SHADER_TEXEL1:
                return "texVal1.a";
        }
    }
}
	
function create_formula(c, do_single, do_multiply, do_mix, with_alpha, only_alpha_bool, opt_alpha) {
    var only_alpha = only_alpha_bool ? 1 : 0;
    var newString = "";
    if (do_single) {
        newString += shader_item_to_str(c[only_alpha][3], with_alpha, only_alpha, opt_alpha, false);
    } else if (do_multiply) {
        newString += shader_item_to_str(c[only_alpha][0], with_alpha, only_alpha, opt_alpha, false);
        newString += " * "
        newString += shader_item_to_str(c[only_alpha][2], with_alpha, only_alpha, opt_alpha, true);
    } else if (do_mix) {
        newString += "mix("
        newString += shader_item_to_str(c[only_alpha][1], with_alpha, only_alpha, opt_alpha, false);
        newString += ", "
        newString += shader_item_to_str(c[only_alpha][0], with_alpha, only_alpha, opt_alpha, false);
        newString += ", "
        newString += shader_item_to_str(c[only_alpha][2], with_alpha, only_alpha, opt_alpha, true);
        newString += ")"
    } else {
        newString += "("
        newString += shader_item_to_str(c[only_alpha][0], with_alpha, only_alpha, opt_alpha, false);
        newString += " - "
        newString += shader_item_to_str(c[only_alpha][1], with_alpha, only_alpha, opt_alpha, false);
        newString += ") * "
        newString += shader_item_to_str(c[only_alpha][2], with_alpha, only_alpha, opt_alpha, true);
        newString += " + "
        newString += shader_item_to_str(c[only_alpha][3], with_alpha, only_alpha, opt_alpha, false);
    }
    return newString;
}
	
function create_and_load_new_shader(shader_id) {
		
    var c = [[0,0,0,0],[0,0,0,0]];
		
    for (var i = 0; i < 4; i++) {
        c[0][i] = (shader_id >> (i * 3)) & 7;
        c[1][i] = (shader_id >> (12 + i * 3)) & 7;
    }
    var opt_alpha = (shader_id & SHADER_OPT_ALPHA) != 0;
    var opt_fog = (shader_id & SHADER_OPT_FOG) != 0;
    var opt_texture_edge = (shader_id & SHADER_OPT_TEXTURE_EDGE) != 0;
    var used_textures = [ false, false ];
    var num_inputs = 0;

    for (var i = 0; i < 2; i++) {
        for (var j = 0; j < 4; j++) {
            if (c[i][j] >= SHADER_INPUT_1 && c[i][j] <= SHADER_INPUT_4) {
                if (c[i][j] > num_inputs) {
                    num_inputs = c[i][j];
                }
            }
            if (c[i][j] == SHADER_TEXEL0 || c[i][j] == SHADER_TEXEL0A) {
                used_textures[0] = true;
            }
            if (c[i][j] == SHADER_TEXEL1) {
                used_textures[1] = true;
            }
        }
    }
    var do_single = [ c[0][2] == 0, c[1][2] == 0 ];
    var do_multiply = [ c[0][1] == 0 && c[0][3] == 0, c[1][1] == 0 && c[1][3] == 0 ];
    var do_mix = [ c[0][1] == c[0][3], c[1][1] == c[1][3] ];
    var color_alpha_same = (shader_id & 0xfff) == ((shader_id >> 12) & 0xfff);

    var vs_buf = "";
    var fs_buf = "";
    var num_floats = 4;

    // Vertex Shader
    vs_buf += "#version 100\n"
    vs_buf += "attribute vec4 aVtxPos;\n"
    if (used_textures[0] || used_textures[1]) {
        vs_buf += "attribute vec2 aTexCoord;\n"
        vs_buf += "varying vec2 vTexCoord;\n"
        num_floats += 2
    }
    if (opt_fog) {
        vs_buf += "attribute vec4 aFog;\n"
        vs_buf += "varying vec4 vFog;\n"
        num_floats += 4
    }
    for (var i = 0; i < num_inputs; i++) {
        var suffix1 = opt_alpha ? 4 : 3;
        var suffix2 = i + 1;
        var newString1 = "attribute vec" + string(suffix1) + " aInput" + string(suffix2) + ";\n";
        var newString2 = "varying vec" + string(suffix1) + " vInput" + string(suffix2) + ";\n";
        vs_buf += newString1;
        vs_buf += newString2;
        num_floats += opt_alpha ? 4 : 3;
    }
    vs_buf += "void main() {\n"
    if (used_textures[0] || used_textures[1]) {
        vs_buf += "vTexCoord = aTexCoord;\n";
    }
    if (opt_fog) {
        vs_buf += "vFog = aFog;\n";
    }
    for (var i = 0; i < num_inputs; i++) {
        vs_buf += "vInput" + string(i+1) + " = aInput" + string(i+1) + ";\n";
    }
    vs_buf += "gl_Position = aVtxPos;\n";
    vs_buf += "}\n";

    // Fragment shader
    fs_buf += "#version 100\n";
    fs_buf += "precision mediump float;\n";
    if (used_textures[0] || used_textures[1]) {
        fs_buf += "varying vec2 vTexCoord;\n";
    }
    if (opt_fog) {
        fs_buf += "varying vec4 vFog;\n";
    }
    for (var i = 0; i < num_inputs; i++) {
        fs_buf += "varying vec" + string(opt_alpha ? 4 : 3) +" vInput" + string(i+1)+";\n";
    }
    if (used_textures[0]) {
        fs_buf += "uniform sampler2D uTex0;\n";
    }
    if (used_textures[1]) {
        fs_buf += "uniform sampler2D uTex1;\n";
    }
    fs_buf += "void main() {\n";

    if (used_textures[0]) {
        fs_buf += "vec4 texVal0 = texture2D(uTex0, vTexCoord);\n";
    }
    if (used_textures[1]) {
        fs_buf += "vec4 texVal1 = texture2D(uTex1, vTexCoord);\n";
    }

    fs_buf += opt_alpha ? "vec4 texel = " : "vec3 texel = ";
    if (!color_alpha_same && opt_alpha) {
        fs_buf += "vec4("
        fs_buf += create_formula(c, do_single[0], do_multiply[0], do_mix[0], false, false, true);
        fs_buf += ", "
        fs_buf += create_formula(c, do_single[1], do_multiply[1], do_mix[1], true, true, true);
        fs_buf += ")"
    } else {
        fs_buf += create_formula(c, do_single[0], do_multiply[0], do_mix[0], opt_alpha, false, opt_alpha);
    }
    fs_buf += ";\n";

    if (opt_texture_edge && opt_alpha) {
        fs_buf += "if (texel.a > 0.3) texel.a = 1.0; else discard;\n";
    }

    if (opt_fog) {
        if (opt_alpha) {
            fs_buf += "texel = vec4(mix(texel.rgb, vFog.rgb, vFog.a), texel.a);\n";
        } else {
            fs_buf += "texel = mix(texel, vFog.rgb, vFog.a);\n";
        }
    }

    if (opt_alpha) {
        fs_buf += "gl_FragColor = texel;\n";
    } else {
        fs_buf += "gl_FragColor = vec4(texel, 1.0);\n";
    }
    fs_buf += "}\n";


    var vertex_shader = createShader(vs_buf, VERTEX_SHADER)
    var fragment_shader = createShader(fs_buf, FRAGMENT_SHADER)


    var new_shader_program_obj = new ShaderInstance();
    new_shader_program_obj.shader_id = shader_id;
	new_shader_program_obj.opengl_program = new ShaderProgramInstance();
	new_shader_program_obj.opengl_program.vertex_shader = vertex_shader;
	new_shader_program_obj.opengl_program.fragment_shader = fragment_shader;
	new_shader_program_obj.num_inputs		= num_inputs;
	new_shader_program_obj.num_floats		= num_floats;
	new_shader_program_obj.used_textures	= [used_textures[0], used_textures[1]];
	new_shader_program_obj.attrib_locations = new Array(); // once
	new_shader_program_obj.attrib_sizes		= new Array(); // once
		
	//log("created shader: #", ds_list_size(shader_program_pool));
		
		
	// copy :x
	var shader_program = new_shader_program_obj;

    new_shader_program_obj.attrib_sizes.push(4);
    new_shader_program_obj.attrib_locations.push(getAttribLocation(shader_program, "aVtxPos"))

    if (used_textures[0] || used_textures[1]) {
        new_shader_program_obj.attrib_sizes.push(2)
        new_shader_program_obj.attrib_locations.push(getAttribLocation(shader_program, "aTexCoord"))
    }

    if (opt_fog) {
        new_shader_program_obj.attrib_sizes.push(4)
        new_shader_program_obj.attrib_locations.push(getAttribLocation(shader_program, "aFog"))
    }

    for (var i = 0; i < num_inputs; i++) {
        var name = "aInput" + string(i+1);
        new_shader_program_obj.attrib_sizes.push(opt_alpha ? 4 : 3);
        new_shader_program_obj.attrib_locations.push(getAttribLocation(shader_program, name));
    }
		
	new_shader_program_obj.dump();

    ds_list_add(shader_program_pool, new_shader_program_obj);

    load_shader(new_shader_program_obj);

    if (used_textures[0]) {
        var sampler_attrib = getUniformLocation(shader_program, "uTex0");
        uniform1i(sampler_attrib, 0);
    }

    if (used_textures[1]) {
        var sampler_attrib = getUniformLocation(shader_program, "uTex1");
        uniform1i(sampler_attrib, 1);
    }

    return new_shader_program_obj;

}
	
function load_shader(new_prg) {
    //console.log("loading new shader: " + new_prg.shader_id);
    useProgram(new_prg.opengl_program);
    vertex_array_set_attribs(new_prg);
}
	
function lookup_shader(shader_id) {
		
	for(var i = 0; i < ds_list_size(shader_program_pool); i++) {
		var shd = shader_program_pool[| i];
			
		if (shd.shader_id == shader_id) {
			return shd;	
		}
	}
}
	
function unload_shader(old_prg) {
	//delete old_prog;
}
	
function start_frame() {

	SCISSOR_TEST	= false;
	DEPTH_MASK		= true;
	CLEAR_COLOR		= [0,0,0,1];
	CLEAR			= COLOR_BUFFER_BIT | DEPTH_BUFFER_BIT;
	SCISSOR_TEST	= true;
		
}


function vertex_array_set_attribs(prg) {
    var num_floats = prg.num_floats;
    var pos = 0

    for (var i = 0; i < prg.attrib_locations.size; i++) {
        //enableVertexAttribArray(prg.attrib_locations.get(i));
        // vertexAttribPointer(prg.attrib_locations.get(i), prg.attrib_sizes[i], this.FLOAT, false, num_floats * 4, pos * 4)
        pos += prg.attrib_sizes.content[i];
    }
}
	
function new_texture() {
	return new NewTextureInstance();	
}
	
function select_texture(tile, texture_object) {
	
    activeTexture(tile);
    bindTexture(tile, texture_object);
}
	
function cm_to_opengl(val) {
    if (val & G_TX_CLAMP) {
        return CLAMP_TO_EDGE;
    }
    return (val & G_TX_MIRROR) ? MIRRORED_REPEAT : REPEAT;
}
	
function set_sampler_parameters(tile, linear_filter, cms, cmt) {
		
    activeTexture(tile);
	TEXTURE_MIN_FILTER	= linear_filter ? LINEAR : NEAREST;
	TEXTURE_MAG_FILTER	= linear_filter ? LINEAR : NEAREST;
	TEXTURE_WRAP_S		= cm_to_opengl(cms);
	TEXTURE_WRAP_T		= cm_to_opengl(cmt);
}


	
function set_viewport(vp) {
		
}


function NewTextureInstance()  constructor {
}

function polygonOffset(xo, yo) {
	POLYGON_XOFFSET = xo;
	POLYGON_YOFFSET = yo;
}

function activeTexture(tile) {
	ACTIVE_TEXTURE = tile;
}
	
function bindTexture(tile, texture_object) {

	prev_TEXTURE_2D[tile] = TEXTURE_2D[tile];
	TEXTURE_2D[tile] = texture_object.textureData;
}
	
function getAttribLocation(_shader_instance, _str) {
		
	return _str;
		
}
	
function getUniformLocation(_shader_instance, _str) {
		
	return _str;
		
}
	
function useProgram(_shader_program) {
	USING_SHADER = _shader_program;	
}
	
function uniform1i (loc, v) {
	return v;	
}
	
function enableDepthTest() {
	DEPTH_TEST_ENABLED = true;
}
	
function disableDepthTest() {
	DEPTH_TEST_ENABLED = false;
}
	
function enableBlend() {
	USE_ALPHA = true;	
}
	
function disableBlend() {
	USE_ALPHA = false;	
}
	

function ShaderProgramInstance()  constructor {
}

function ShaderInstance()  constructor {

	uuid = string_copy(md5_string_utf8(string(current_time)), 1, 8);
	
	function dump() {
		/*log(" ");
		log(" ");
		log("===Shader dump===");
		log("shader_id: " + string(shader_id));
		log("UUID: " + string(uuid));
		log(" ");
		log("==Vertex Shader==");
		log(opengl_program.vertex_shader.code);
		log("==Fragment Shader==");
		log(opengl_program.fragment_shader.code);
		log(" ");
		log("num_inputs", num_inputs);
		log("num_floats", num_floats);
		log("used_textures", used_textures);
		log("attrib_locations", attrib_locations);
		log("attrib_sizes", attrib_sizes);*/
	}
}

function FragVertShaderInstance()  constructor {
	
	name = "";
	code = "";
	
}
	
function VertexShaderInstance() : FragVertShaderInstance() constructor {
	name = "VERTEX_SHADER";
}
	
function FragmentShaderInstance() : FragVertShaderInstance()  constructor {
	name = "FRAGMENT_SHADER";
}