function vertex_indices_macros_init() {
	#macro NAMETAG_LOC		(0)
	#macro HAT_LOC			(1)
	#macro SKYBOX_LOC		(2)
	#macro ORTHO_RECT		(3)

	#macro VTX_ALIGNMENT	2
	#macro VTX_TYPE			buffer_s16
	#macro VTX_R			0
	#macro VTX_G			1
	#macro VTX_B			2
	#macro VTX_A			3
	#macro VTX_X			4
	#macro VTX_Y			5
	#macro VTX_Z			6
	#macro VTX_U			7
	#macro VTX_V			8
	#macro VTX_SF			9
	#macro VTX_REJ			10
	#macro VTX_W			11
	
	boot("vertex_indices_macros_init");
}
function log() {
	var str = "";
	for(var i = 0; i < argument_count; i++) {
		if (i>0) str += " ";
		str += string(argument[i]);
	}
	show_debug_message(str);
}

function Animation(_flags, _unk02, _unk04, _unk06, _unk08, _unk0A, _indices, _vals, _length) constructor {
	
	_self = self;
	
	flags	= _flags;
	unk02	= _unk02;
	unk04	= _unk04;
	unk06	= _unk06;
	unk08	= _unk08;
	unk0A	= _unk0A;
	values	= _vals;
	indices	= _indices;
	length	= _length;
	
}

function Vtx(pos, zero, uv, rgba) {

	var sflag = argument_count > 4 ? argument[4] : TRI_MODE_DEFAULT;
	
	//log("vtx created");
	
	//var list = ds_list_create();
	//ds_list_add(list, rgba[0], rgba[1], rgba[2], rgba[3], pos[0], pos[1], pos[2], uv[0], uv[1], sflag);
	//return list;
	
	return [rgba[0], rgba[1], rgba[2], rgba[3], pos[0], pos[1], pos[2], uv[0], uv[1], sflag];
	//var buff = buffer_create(10 * VTX_TYPE, buffer_fixed, VTX_ALIGNMENT);
	//
	//buffer_write(buff, VTX_TYPE, rgba[0]);
	//buffer_write(buff, VTX_TYPE, rgba[1]);
	//buffer_write(buff, VTX_TYPE, rgba[2]);
	//buffer_write(buff, VTX_TYPE, rgba[3]);
	//buffer_write(buff, VTX_TYPE, pos[0]);
	//buffer_write(buff, VTX_TYPE, pos[1]);
	//buffer_write(buff, VTX_TYPE, pos[2]);
	//buffer_write(buff, VTX_TYPE, uv[0]);
	//buffer_write(buff, VTX_TYPE, uv[1]);
	//buffer_write(buff, VTX_TYPE, special_flag);
	//
	//return buff;

}

function make_vertex(vtx, n, x, y, z, tx, ty, r, g, b, a) {
	var ortho_mode = argument_count>11 ? argument[11] : TRI_MODE_DEFAULT;
	vtx[| n] = Vtx([x, y, z], 0, [tx, ty], [r, g, b, a], ortho_mode);
}

function RspInstance() constructor {
}
function RdpInstance() constructor {
}
function RenderingStateInstance() constructor {
}
function GfxTextureCacheInstance() constructor {
}
function CurrentLightsInstance() constructor {
}
function TextureScalingInstance() constructor {
}
function VerticeInstance() constructor {
}
function ColorInstance() constructor {
	r = 0;
	g = 0;
	b = 0;
	a = 255;
}
function XYWHInstance() constructor {
	x = 0;
	y = 0;
	width = 0;
	height = 0;
}
function TextureTileInstance() constructor {
	fmt = 0;
	siz = 0;
	cms = 0;
	cmt = 0;
	uls = 0;
	ult = 0;
	lrs = 0;
	lrt = 0;
	line_size_bytes = 0;
}

function LoadedTextureInstance() constructor {
	textureData = null;
	size_bytes = 0;
}

function TextureToLoadInstance() constructor {
	textureData = null;
	tile_number = 0;
	size = 0;
}