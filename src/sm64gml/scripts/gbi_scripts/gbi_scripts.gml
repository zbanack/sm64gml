function gbi_scripts_macros_init() {
/// graphics opcodes	   
#macro G_MTX  1
#macro G_POPMTX  2
#macro G_MOVEMEM  3
#macro G_MOVEWORD  4
#macro G_TEXTURE  5
#macro G_VTX  6
#macro G_DL  7
#macro G_ENDDL  8
#macro G_SETGEOMETRYMODE  9
#macro G_CLEARGEOMETRYMODE  10
#macro G_TRI1  11
#macro G_SETOTHERMODE_L  12
#macro G_SETOTHERMODE_H  13
#macro G_SETTIMG  14
#macro G_LOADBLOCK  15
#macro G_SETTILE  16
#macro G_SETTILESIZE  17
#macro G_LOADTLUT  18
#macro G_SETENVCOLOR  19
#macro G_SETPRIMCOLOR  20
#macro G_SETFOGCOLOR  21
#macro G_SETFILLCOLOR  22
#macro G_SETCOMBINE  23
#macro G_TEXRECTFLIP  24
#macro G_FILLRECT  25
#macro G_SETSCISSOR  26
#macro G_SETZIMG  27
#macro G_SETCIMG  28
#macro G_RDPLOADSYNC  29
#macro G_TEXRECT		30
#macro G_TTYPE			31

#macro G_ZBUFFER  1
#macro G_SHADE  2
#macro G_TEXTURE_ENABLE  4
#macro G_SHADING_SMOOTH  8
#macro G_CULL_FRONT  16
#macro G_CULL_BACK  32
#macro G_FOG  16
#macro G_LIGHTING  32
#macro G_TEXTURE_GEN  64
#macro G_TEXTURE_GEN_LINEAR  128
#macro G_CLIPPING  256
#macro G_CULL_BOTH  512
#macro G_LOD  1024
	   
#macro G_ON	 1
#macro G_OFF  0

	/* flags to inhibit pushing of the display list (on branch) */
#macro G_DL_PUSH		0x00
#macro G_DL_NOPUSH		0x01


#macro G_TEXTURE_IMAGE_FRAC 2
#macro G_TEXTURE_SCALE_FRAC 16
#macro G_SCALE_FRAC		8
#macro G_ROTATE_FRAC  16



	/*
	 * G_SETOTHERMODE_L sft: shift count
	 */
#macro G_MDSFT_ALPHACOMPARE		0
#macro G_MDSFT_ZSRCSEL			2
#macro G_MDSFT_RENDERMODE		   3
#macro G_MDSFT_BLENDER			16

	/*
	 * G_SETOTHERMODE_H sft: shift count
	 */
#macro G_MDSFT_BLENDMASK		0	/* unsupported */
#macro G_MDSFT_ALPHADITHER		4
#macro G_MDSFT_RGBDITHER		6

#macro G_MDSFT_COMBKEY			8
#macro G_MDSFT_TEXTCONV		 9
#macro G_MDSFT_TEXTFILT		 12
#macro G_MDSFT_TEXTLUT			14
#macro G_MDSFT_TEXTLOD			16
#macro G_MDSFT_TEXTDETAIL		17
#macro G_MDSFT_TEXTPERSP		19
#macro G_MDSFT_CYCLETYPE		20
#macro G_MDSFT_COLORDITHER		22	/* unsupported in HW 2.0 */
#macro G_MDSFT_PIPELINE		23


	/* G_SETOTHERMODE_H gPipelineMode */
#macro G_PM_1PRIMITIVE   1
#macro G_PM_NPRIMITIVE   0

	/* G_SETOTHERMODE_H gSetCycleType */
#macro G_CYC_1CYCLE   0
#macro G_CYC_2CYCLE   1
#macro G_CYC_COPY   2
#macro G_CYC_FILL  3

	/* G_SETOTHERMODE_H gSetTexturePersp */
#macro G_TP_NONE    0
#macro G_TP_PERSP    1

	/* G_SETOTHERMODE_H gSetTextureDetail */
#macro G_TD_CLAMP    0
#macro G_TD_SHARPEN    1
#macro G_TD_DETAIL    2

	/* G_SETOTHERMODE_H gSetTextureLOD */
#macro G_TL_TILE    0
#macro G_TL_LOD    1

	/* G_SETOTHERMODE_H gSetTextureLUT */
#macro G_TT_NONE    0
#macro G_TT_RGBA16    2
#macro G_TT_IA16    3

	/* G_SETOTHERMODE_H gSetTextureFilter */
#macro G_TF_POINT    0
#macro G_TF_AVERAGE    3
#macro G_TF_BILERP    2

	/* G_SETOTHERMODE_H gSetTextureConvert */
#macro G_TC_CONV    0
#macro G_TC_FILTCONV    5
#macro G_TC_FILT    6

	/* G_SETOTHERMODE_H gSetCombineKey */
#macro G_CK_NONE    0
#macro G_CK_KEY    1

	/* G_SETOTHERMODE_H gSetColorDither */
#macro G_CD_MAGICSQ    0
#macro G_CD_BAYER    1
#macro G_CD_NOISE  2

	/* G_SETOTHERMODE_H gSetAlphaDither */
#macro G_AD_PATTERN  0
#macro G_AD_NOTPATTERN  1
#macro G_AD_NOISE  2
#macro G_AD_DISABLE  3

	/* G_SETOTHERMODE_L gSetAlphaCompare */
#macro G_AC_NONE  (0 << G_MDSFT_ALPHACOMPARE)
#macro G_AC_THRESHOLD  (1 << G_MDSFT_ALPHACOMPARE)
#macro G_AC_DITHER  (3 << G_MDSFT_ALPHACOMPARE)

	/* G_SETOTHERMODE_L gSetDepthSource */
#macro G_ZS_PIXEL  (0 << G_MDSFT_ZSRCSEL)
#macro G_ZS_PRIM  (1 << G_MDSFT_ZSRCSEL)

	/* G_SETOTHERMODE_L gSetRenderMode */
#macro AA_EN		0x8
#macro Z_CMP		0x10
#macro Z_UPD		0x20
#macro IM_RD		0x40
#macro CLR_ON_CVG	 0x80
#macro CVG_DST_CLAMP 0
#macro CVG_DST_WRAP 0x100
#macro CVG_DST_FULL 0x200
#macro CVG_DST_SAVE	 0x300
#macro ZMODE_OPA	 0
#macro ZMODE_INTER 0x400
#macro ZMODE_XLU	 0x800
#macro ZMODE_DEC	 0xC00
#macro CVG_X_ALPHA	 0x1000
#macro ALPHA_CVG_SEL  0x2000
#macro FORCE_BL	 0x4000
#macro TEX_EDGE	 0x0000 /* used to be 0x8000 */

#macro G_BL_CLR_IN	  0
#macro G_BL_CLR_MEM	  1
#macro G_BL_CLR_BL	  2
#macro G_BL_CLR_FOG	  3
#macro G_BL_1MA	  0
#macro G_BL_A_MEM	  1
#macro G_BL_A_IN	  0
#macro G_BL_A_FOG	  1
#macro G_BL_A_SHADE	  2
#macro G_BL_1		  2
#macro G_BL_0		  3

#macro CC_0  0
#macro CC_TEXEL0  1
#macro CC_TEXEL1  2
#macro CC_PRIM  3
#macro CC_SHADE  4
#macro CC_ENV  5
#macro CC_TEXEL0A  6
#macro CC_LOD  7

#macro SHADER_0  0
#macro SHADER_INPUT_1  1
#macro SHADER_INPUT_2  2
#macro SHADER_INPUT_3  3
#macro SHADER_INPUT_4  4
#macro SHADER_TEXEL0  5
#macro SHADER_TEXEL0A  6
#macro SHADER_TEXEL1  7

#macro SHADER_OPT_ALPHA  (1 << 24)
#macro SHADER_OPT_FOG  (1 << 25)
#macro SHADER_OPT_TEXTURE_EDGE  (1 << 26)

	/*
	 * G_SETCOMBINE: color combine modes
	 */
	/* Color combiner constants: */
#macro G_CCMUX_COMBINED         0
#macro G_CCMUX_TEXEL0           1
#macro G_CCMUX_TEXEL1           2
#macro G_CCMUX_PRIMITIVE        3
#macro G_CCMUX_SHADE            4
#macro G_CCMUX_ENVIRONMENT      5
#macro G_CCMUX_CENTER           6
#macro G_CCMUX_SCALE            6
#macro G_CCMUX_COMBINED_ALPHA   7
#macro G_CCMUX_TEXEL0_ALPHA     8
#macro G_CCMUX_TEXEL1_ALPHA     9
#macro G_CCMUX_PRIMITIVE_ALPHA  10
#macro G_CCMUX_SHADE_ALPHA      11
#macro G_CCMUX_ENV_ALPHA        12
#macro G_CCMUX_LOD_FRACTION     13
#macro G_CCMUX_PRIM_LOD_FRAC    14
#macro G_CCMUX_NOISE            7
#macro G_CCMUX_K4               7
#macro G_CCMUX_K5               15
#macro G_CCMUX_1                6
#macro G_CCMUX_0                31

	/* Alpha combiner constants: */
#macro G_ACMUX_COMBINED	     0
#macro G_ACMUX_TEXEL0		     1
#macro G_ACMUX_TEXEL1		     2
#macro G_ACMUX_PRIMITIVE	     3
#macro G_ACMUX_SHADE		     4
#macro G_ACMUX_ENVIRONMENT	     5
#macro G_ACMUX_LOD_FRACTION	 0
#macro G_ACMUX_PRIM_LOD_FRAC	 6
#macro G_ACMUX_1		         6
#macro G_ACMUX_0		         7


	/*
	 * G_SETIMG fmt: set image formats
	 */
#macro G_IM_FMT_RGBA  0
#macro G_IM_FMT_YUV	  1
#macro G_IM_FMT_CI	 2
#macro G_IM_FMT_IA 3
#macro G_IM_FMT_I	  4

	/*
	 * G_SETIMG siz: set image pixel size
	 */
#macro G_IM_SIZ_4b	 0
#macro G_IM_SIZ_8b	 1
#macro G_IM_SIZ_16b	 2
#macro G_IM_SIZ_32b	 3
#macro G_IM_SIZ_DD  5

globalvar G_IM_SIZ_INCR_TABLE, G_IM_SIZ_SHIFT_TABLE;
G_IM_SIZ_INCR_TABLE = [0, 1, 0];
G_IM_SIZ_SHIFT_TABLE = [0, 1, 0];

globalvar G_IM_SIZ_LOAD_BLOCK_TABLE;
G_IM_SIZ_LOAD_BLOCK_TABLE = [
	0,
	G_IM_SIZ_16b,
	G_IM_SIZ_16b
];

globalvar G_IM_SIZ_BYTES_TABLE;
G_IM_SIZ_BYTES_TABLE = [
	0, 
	G_IM_SIZ_8b,
	G_IM_SIZ_16b
];

globalvar G_IM_SIZ_LINE_BYTES_TABLE;
G_IM_SIZ_LINE_BYTES_TABLE = [
	0,
	G_IM_SIZ_8b,
	G_IM_SIZ_16b
];
	

#macro G_TX_LOADTILE	 7
#macro G_TX_RENDERTILE	 0

#macro G_TX_NOMIRROR	 0
#macro G_TX_WRAP	 0
#macro G_TX_MIRROR	 0x1
#macro G_TX_CLAMP	 0x2
#macro G_TX_NOMASK	 0
#macro G_TX_NOLOD  0

	//// Render Modes
#macro G_RM_OPA_SURF_SURF2  0xf0a4000
#macro G_RM_AA_OPA_SURF_SURF2  0x552048
#macro G_RM_AA_XLU_SURF_SURF2  0x5041c8

#macro G_RM_ZB_OPA_SURF_SURF2  0x552230
#macro G_RM_AA_ZB_TEX_EDGE_NOOP2  0x443078
#macro G_RM_AA_ZB_OPA_INTER_NOOP2  0x442478
#macro G_RM_AA_ZB_XLU_DECAL_DECAL2  0x504dd8
#macro G_RM_AA_ZB_XLU_SURF_SURF2  0x5049d8
#macro G_RM_AA_ZB_OPA_SURF_SURF2  0x552078
#macro G_RM_AA_ZB_OPA_DECAL_DECAL2  0x552d58
#macro G_RM_AA_ZB_XLU_INTER_INTER2 0x5045d8


#macro G_RM_AA_ZB_OPA_SURF	G_RM_AA_ZB_OPA_SURF_SURF2
#macro G_RM_AA_ZB_OPA_SURF2	G_RM_AA_ZB_OPA_SURF_SURF2

#macro G_RM_NOOP2	G_RM_AA_ZB_OPA_INTER_NOOP2
#macro G_RM_AA_ZB_TEX_EDGE	G_RM_AA_ZB_OPA_INTER_NOOP2
#macro G_RM_AA_ZB_XLU_SURF	G_RM_AA_ZB_OPA_INTER_NOOP2

	//G_MOVEWORD types
#macro G_MW_MATRIX  0x00 /* NOTE: also used by movemem */
#macro G_MW_NUMLIGHT  0x02
#macro G_MW_CLIP  0x04
#macro G_MW_SEGMENT  0x06
#macro G_MW_FOG  0x08
#macro G_MW_LIGHTCOL  0x0a
#macro G_MW_POINTS  0x0c
#macro G_MW_PERSPNORM  0x0e

	//G_MOVEMEM types
#macro G_MV_VIEWPORT  1
#macro G_MV_L  2

	/// G_MTX parameter flags
#macro G_MTX_MODELVIEW      0	/* matrix types */
#macro G_MTX_PROJECTION     1
#macro G_MTX_MUL            0	/* concat or load */
#macro G_MTX_LOAD           2
#macro G_MTX_NOPUSH         0	/* push or not */
#macro G_MTX_PUSH			4

boot("gbi_scripts_macros_init");
}

function vList() {
	
	var list = ds_list_create();
	
	for(var i = 0; i < argument_count; i++) {
		ds_list_add(list, argument[i]);
		ds_list_mark_as_list(list, i);
	}

	return list;		
}

function gList() {
	var arr = array_create(argument_count);
	
	for(var i = 0; i < argument_count; i++) {
		arr[i] = argument[i];	
	}
	
	return arr;
}

function cList() {
	var arr = array_create(argument_count);
	
	for(var i = 0; i < argument_count; i++) {
		arr[i] = argument[i];	
	}
	
	return arr;
}

function dList() {
	
	var size = 0;
	
	var arr = new DisplayList(true);
	
	for(var i = 0; i < argument_count; i++) {
		var wrap = argument[i];
		
		if (!is_array(wrap[0])) {
			arr.push(wrap);
			continue;
		}
		
		for(var j = 0; j < array_length(wrap); j++) {
			arr.push(wrap[j]);
		}

	}


	return arr;
	
}
	
/// @function	gdSPDefLights1
function gdSPDefLights1(ar, ag, ab, r1, g1, b1, x1, y1, z1) {
    return {
        a: { col: [ar, ag, ab ] },
        l: [
            {
                col: [ r1, g1, b1 ],
                dir: [ x1, y1, z1 ]
            }
        ]
    }
}

/// @function	gSPPopMatrix
function gSPPopMatrix(displaylist, _parameters) {
	displaylist.push([G_POPMTX, _parameters]);
}

/// @function	gSPLight
function gSPLight(displaylist, _lightData, _index) {
	displaylist.push([G_MOVEMEM, G_MV_L, _lightData, _index-1]);
}
	
/// @function	gSPNumLights
function gSPNumLights(displaylist, _num) {
	displaylist.push([G_MOVEWORD, G_MW_NUMLIGHT, _num + 1]);
}
	
/// @function	gDPSetEnvColor
function gDPSetEnvColor(displaylist, _r, _g, _b, _a) {
	displaylist.push([G_SETENVCOLOR,_r, _g, _b, _a]);
}
	
/// @function	gDPSetTextureImage
function gDPSetTextureImage(displaylist, _format, _size, _width, _imageData) {
	displaylist.push([G_SETTIMG, _format, _size, _width, _imageData]);
}

/// @function	gDPSetTile
function gDPSetTile(displaylist, _t, _uls, _ult, _lrs, _lrt) {
	displaylist.push([G_SETTILESIZE, _t, _uls, _ult, _lrs, _lrt]);
}

/// @function	gDPSetFillColor
function gDPSetFillColor(displaylist, _color) {
	displaylist.push([G_SETFILLCOLOR, _color]);
}
	
/// @function	gDPFillRectangle
function gDPFillRectangle(displaylist, _ulx, _uly, _lrx, _lry) {
	var ortho_layer = argument_count > 5 ? argument[5] : TRI_MODE_ORTHO;
	displaylist.push([G_FILLRECT, _ulx, _uly, _lrx, _lry, ortho_layer]);
}

/// @function	gDPLoadBlock
function gDPLoadBlock(displaylist, _tile, _uls, _ult, _lrs) {
	var ortho_layer = argument_count > 5 ? argument[5] : TRI_MODE_ORTHO;
	displaylist.push([G_LOADBLOCK, _tile, _uls, _ult, _lrs, ortho_layer]);
}
	
/// @function	gSPTexture
function gSPTexture(displaylist, _s, _t, _level, _tile, _on) {
	displaylist.push([G_TEXTURE, _s, _t, _level, _tile, _on]);
}

/// @function gSPTextureRectangle
function gSPTextureRectangle(displaylist, _ulx, _uly, _lrx, _lry, _tile, _s, _t, _dsdx, _dsdy) {
	var ortho_layer = argument_count > 10 ? argument[10] : TRI_MODE_ORTHO;
	displaylist.push([G_TEXRECT, _ulx, _uly, _lrx, _lry, _tile, _s, _t, _dsdx, _dsdy, ortho_layer]);
}
		
/// @function	gDPSetCombineMode
function gDPSetCombineMode(displaylist, _mode) {
	displaylist.push([G_SETCOMBINE, _mode]);
}

/// @function	gDPSetTileSize
function gDPSetTileSize(displaylist, _t, _uls, _ult, _lrs, _lrt) {
	displaylist.push([G_SETTILESIZE, _t, _uls, _ult, _lrs, _lrt]);
}

/// @function	gDPSetHilite1Tile
function gDPSetHilite1Tile(displaylist, tile, hilite, width, height) {

	gDPSetTileSize(displaylist, tile,
	    hilite.x1 & 0xfff,
	    hilite.y1 & 0xfff,
	    (((width - 1) * 4) + hilite.x1) & 0xfff,
	    (((height - 1) * 4) + hilite.y1) & 0xfff
	);
		
}


/// @function	gSPMatrix
function gSPMatrix(displaylist, _matrix, _parameters) {
	displaylist.push([G_MTX, _matrix, _parameters]);
}

/// @function	gDPSetRenderMode
function gDPSetRenderMode(displaylist, _mode) {
	displaylist.push([G_SETOTHERMODE_L, _mode]);
}

/// @function	gDPSetTextureFilter
function gDPSetTextureFilter(displaylist, _newmode) {
	displaylist.push([G_SETOTHERMODE_H, G_MDSFT_TEXTFILT, _newmode]);
}

/// @function	gDPSetCycleType
function gDPSetCycleType(displaylist, _newmode) {
	displaylist.push([G_SETOTHERMODE_H, G_MDSFT_CYCLETYPE, _newmode]);
}

/// @function	gSPVertex
function gSPVertex(displaylist, _vertices, _num_vertices, _dest_index) {
	displaylist.push([G_VTX, _vertices, _dest_index, _num_vertices]);
}

/// @function	gSP1Triangle
function gSP1Triangle(displaylist, _v0, _v1, _v2, _flag) {
	displaylist.push([G_TRI1, _v0, _v1, _v2, _flag]);
}
	
function gSPViewport(displaylist, viewportData) {
	displaylist.push([G_MOVEMEM, G_MV_VIEWPORT, viewportData, null]);
}

/// @function	gDPSetPrimColor
function gDPSetPrimColor(displaylist, _m, _l, _r, _g, _b, _a) {
	displaylist.push([G_SETPRIMCOLOR, _m, _l, _r, _g, _b, _a]);
}

/// @function	gSPSetGeometryMode
function gSPSetGeometryMode(displaylist, _mode) {
	displaylist.push([G_SETGEOMETRYMODE, 0, _mode]);
}

/// @function	gSPClearGeometryMode
function gSPClearGeometryMode(displaylist, _mode) {
	displaylist.push([G_CLEARGEOMETRYMODE, _mode, 0]);
}

/// @function	gSPEndDisplayList
function gSPEndDisplayList(displaylist) {
	displaylist.push([G_ENDDL]);
}

/// @function	gSPBranchList
function gSPBranchList(displaylist, _childDisplayList) {
	displaylist.push([G_DL, _childDisplayList, G_DL_NOPUSH]);
}

/// @function	gSPDisplayList
function gSPDisplayList(displaylist, _childDisplayList) {
	displaylist.push([G_DL, _childDisplayList, G_DL_PUSH]);
}
	
/// @function	gDPLoadBlockTexture
function gDPLoadBlockTexture(displaylist, width, height, format, image) {
	displaylist.push(
	    gsDPSetTextureImage(format, G_IM_SIZ_16b, 1, image),
	    gsDPSetTile(format, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
	    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, (width * height) - 1)
	)
}
	
/// @function	gDPLoadTextureBlock
function gDPLoadTextureBlock(displaylist, timg, fmt, siz, width, height, pal, cms, cmt, masks, maskt, shifts, shiftt) {

	displaylist.push(
	    gsDPSetTextureImage(fmt, siz, 1, timg),
	    gsDPSetTile(fmt, G_IM_SIZ_LOAD_BLOCK_TABLE[siz], 0, 0, G_TX_LOADTILE, 0, cmt, maskt, shiftt, cms, masks, shifts),
	    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, (((width) * (height) + G_IM_SIZ_INCR_TABLE[siz]) >> G_IM_SIZ_SHIFT_TABLE[siz]) - 1),
	    gsDPSetTile(fmt, siz,
	        ((((width) * G_IM_SIZ_LINE_BYTES_TABLE[siz]) + 7) >> 3),
	        0, G_TX_RENDERTILE, pal, cmt, maskt, shiftt, cms, masks, shifts),
	    gsDPSetTileSize(G_TX_RENDERTILE, 0, 0, ((width) - 1) << G_TEXTURE_IMAGE_FRAC, ((height) - 1) << G_TEXTURE_IMAGE_FRAC)
	);
		
}
	
/// @function	gsSPDisplayList
function gsSPDisplayList(_childDisplayList) {
	return [G_DL, _childDisplayList, G_DL_PUSH];
}

/// @function	gsSPBranchList
function gsSPBranchList(_childDisplayList) {
	return [G_DL, _childDisplayList, G_DL_NOPUSH];
}

/// @function	gsDPTriType
function gsDPTriType(_type) {
	return [G_TTYPE, _type];
}

/// @function	gsSPEndDisplayList
function gsSPEndDisplayList() {
	return [G_ENDDL];
}

/// @function	gsDPSetRenderMode
function gsDPSetRenderMode(_mode) {
	return [G_SETOTHERMODE_L, _mode];
}

/// @function	gsDPSetTextureFilter
function gsDPSetTextureFilter(_newmode) {
	return [G_SETOTHERMODE_H, G_MDSFT_TEXTFILT];
}

/// @function	gsDPSetCycleType
function gsDPSetCycleType(_newmode) {
	return [G_SETOTHERMODE_H, G_MDSFT_CYCLETYPE];
}

/// @function	gsSPLight
function gsSPLight(_lightData, _index) {
	return [G_MOVEMEM, G_MV_L, _lightData, _index - 1];
}

/// @function	gsSPClearGeometryMode
function gsSPClearGeometryMode(_mode) {
	return [G_CLEARGEOMETRYMODE, _mode, 0];
}

/// @function	gsSPSetGeometryMode
function gsSPSetGeometryMode(_mode) {
	return [G_SETGEOMETRYMODE, 0, _mode];
}

/// @function	gsDPSetCombineMode
function gsDPSetCombineMode(_mode) {
	return [G_SETCOMBINE, _mode];
}

/// @function	gsSPMatrix
function gsSPMatrix(_matrix, _parameters) {
	return [G_MTX, _matrix, _parameters];
}

/// @function	gsDPSetEnvColor
function gsDPSetEnvColor(_r, _g, _b, _a) {
	return [G_SETENVCOLOR, _r, _g, _b, _a];
}

/// @function	gsDPSetPrimColor
function gsDPSetPrimColor(_m, _l, _r, _g, _b, _a) {
	return [G_SETPRIMCOLOR, _m, _l, _r, _g, _b, _a];
}

/// @function	gsDPSetTile
function gsDPSetTile(_fmt, _siz, _line, _tmem, _tile, _palette, _cmt, _maskt, _shiftt, _cms, _masks, _shifts) {
	return [G_SETTILE, _fmt, _siz, _line, _tmem, _tile, _palette, _cmt, _cms];
}

/// @function	gsSPTexture
function gsSPTexture(_s, _t, _level, _tile, _on) {
	return [G_TEXTURE, _s, _t, _level, _tile, _on];
}

/// @function	gsDPSetTileSize
function gsDPSetTileSize(_t, _uls, _ult, _lrs, _lrt) {
	return [G_SETTILESIZE, _t, _uls, _ult, _lrs, _lrt];
}

/// @function	gsDPSetTextureImage
function gsDPSetTextureImage(_format, _size, _width, _imageData) {
	return [G_SETTIMG, _format, _size, _width, _imageData];
}

/// @function	gsDPLoadSync
function gsDPLoadSync() {
	return [G_RDPLOADSYNC];
}

/// @function	gsDPLoadBlock
function gsDPLoadBlock(_tile, _uls, _ult, _lrs) {
	return [G_LOADBLOCK, _tile, _uls, _ult, _lrs];
}

/// @function	gsSPVertex
function gsSPVertex(_vertices, _num_vertices, _dest_index) {
	return [G_VTX, _vertices, _dest_index, _num_vertices];
}

/// @function	gsSP1Triangle
function gsSP1Triangle(_v0, _v1, _v2, _flag) {
	return [G_TRI1, _v0, _v1, _v2, _flag];
}

/// @function	gsSP2Triangles
function gsSP2Triangles(_v00, _v01, _v02, _flag0, _v10, _v11, _v12, _flag1) {
	return [[G_TRI1, _v00, _v01, _v02, _flag0], [G_TRI1, _v10, _v11, _v12, _flag1]];
}


/// @function	gsSPNumLights
function gsSPNumLights(_num) {
	return [G_MOVEWORD, G_MW_NUMLIGHT, _num + 1];
}
	
/// @function	gsDPLoadTextureBlock
// @z drastically changed
function gsDPLoadTextureBlock(timg, fmt, siz, width, height, pal, cms, cmt, masks, maskt, shifts, shiftt) {

	return [
		gsDPSetTextureImage(fmt, G_IM_SIZ_LOAD_BLOCK_TABLE[siz], 1, timg),
		gsDPSetTile(fmt, G_IM_SIZ_LOAD_BLOCK_TABLE[siz], 0, 0, G_TX_LOADTILE, 0, cmt, maskt, shiftt, cms, masks, shifts),
		gsDPLoadBlock(G_TX_LOADTILE, 0, 0, (((width) * (height) + G_IM_SIZ_INCR_TABLE[siz]) >> G_IM_SIZ_SHIFT_TABLE[siz]) - 1),
		gsDPSetTile(fmt, siz, ((((width) * G_IM_SIZ_LINE_BYTES_TABLE[siz]) + 7) >> 3), 0, G_TX_RENDERTILE, pal, cmt, maskt, shiftt, cms, masks, shifts),
		gsDPSetTileSize(G_TX_RENDERTILE, 0, 0, ((width) - 1) << G_TEXTURE_IMAGE_FRAC, ((height) - 1) << G_TEXTURE_IMAGE_FRAC),
	];

}