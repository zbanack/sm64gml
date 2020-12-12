function gd_types_macros_init() {
	#macro VIEW_2_COL_BUF   0x000008
	#macro VIEW_ALLOC_ZBUF   0x000010
	#macro VIEW_SAVE_TO_GLOBAL   0x000040
	#macro VIEW_DEFAULT_PARENT   0x000100
	#macro VIEW_BORDERED   0x000400
	#macro VIEW_UPDATE   0x000800
	#macro VIEW_UNK_1000   0x001000 // used in setup_view_buffers
	#macro VIEW_UNK_2000   0x002000 // only see together with 0x4000
	#macro VIEW_UNK_4000   0x004000
	#macro VIEW_COLOUR_BUF   0x008000
	#macro VIEW_Z_BUF   0x010000
	#macro VIEW_1_CYCLE   0x020000
	#macro VIEW_MOVEMENT   0x040000
	#macro VIEW_DRAW   0x080000
	#macro VIEW_WAS_UPDATED   0x100000
	#macro VIEW_LIGHT   0x200000

	#macro OBJ_TYPE_GROUPS   0x00000001
	#macro OBJ_TYPE_BONES   0x00000002
	#macro OBJ_TYPE_JOINTS   0x00000004
	#macro OBJ_TYPE_PARTICLES   0x00000008
	#macro OBJ_TYPE_SHAPES   0x00000010
	#macro OBJ_TYPE_NETS   0x00000020
	#macro OBJ_TYPE_PLANES   0x00000040
	#macro OBJ_TYPE_FACES   0x00000080
	#macro OBJ_TYPE_VERTICES   0x00000100
	#macro OBJ_TYPE_CAMERAS   0x00000200
	// 0x400 was not used
	#macro OBJ_TYPE_MATERIALS   0x00000800
	#macro OBJ_TYPE_WEIGHTS   0x00001000
	#macro OBJ_TYPE_GADGETS   0x00002000
	#macro OBJ_TYPE_VIEWS   0x00004000
	#macro OBJ_TYPE_LABELS   0x00008000
	#macro OBJ_TYPE_ANIMATORS   0x00010000
	#macro OBJ_TYPE_VALPTRS   0x00020000
	// 0x40000 was not used
	#macro OBJ_TYPE_LIGHTS   0x00080000
	#macro OBJ_TYPE_ZONES   0x00100000
	#macro OBJ_TYPE_UNK200000   0x00200000

	#macro OBJ_TYPE_ALL   0x00FFFFFF

	#macro LIGHT_UNK02   0x02 // old type of light?
	#macro LIGHT_NEW_UNCOUNTED   0x10
	#macro LIGHT_UNK20   0x20 // new, actually used type of light? used for phong shading?

	#macro OBJ_DRAW_UNK01   0x01
	#macro OBJ_NOT_DRAWABLE   0x02 ///< This `GdObj` shouldn't be drawn when updating a scene
	#macro OBJ_PICKED   0x04 ///< This `GdObj` is held by the cursor
	#macro OBJ_IS_GRABBALE   0x08 ///< This `GdObj` can be grabbed/picked by the cursor
	#macro OBJ_USE_ENV_COLOUR   0x10

	#macro GD_ANIM_EMPTY   0  // Listed types are how the data are arranged in memory; maybe not be exact type
	#macro GD_ANIM_MATRIX   1  // f32[4][4]
	#macro GD_ANIM_TRI_F_2   2  // f32[3][3]
	#macro GD_ANIM_9H   3  // s16[9]
	#macro GD_ANIM_TRI_F_4   4  // f32[3][3]
	#macro GD_ANIM_STUB   5
	#macro GD_ANIM_3H_SCALED   6  // s16[3]
	#macro GD_ANIM_3H   7  // s16[3]
	#macro GD_ANIM_6H_SCALED   8  // s16[6]
	#macro GD_ANIM_MTX_VEC   9  // {f32 mtx[4][4]; f32 vec[3];}
	#macro GD_ANIM_CAMERA   11  // s16[6]

	globalvar END_ANIMDATA_INFO_ARR;
	END_ANIMDATA_INFO_ARR = { type: GD_ANIM_EMPTY }

	#macro GD_MTL_STUB_DL   0x01
	#macro GD_MTL_BREAK   0x04
	#macro GD_MTL_SHINE_DL   0x10
	#macro GD_MTL_TEX_OFF   0x20
	#macro GD_MTL_LIGHTS   0x40 // uses default case


	#macro GD_PROP_OVERLAY   4
	#macro GD_PROP_LIGHTING   11
	#macro GD_PROP_AMB_COLOUR   12
	#macro GD_PROP_DIFUSE_COLOUR   13
	#macro GD_PROP_LIGHT_DIR   15
	#macro GD_PROP_CULLING   16
	#macro GD_PROP_STUB17   17
	#macro GD_PROP_STUB18   18
	#macro GD_PROP_STUB19   19
	#macro GD_PROP_STUB20   20
	#macro GD_PROP_STUB21   21
	#macro GD_PROP_ZBUF_FN   22	
	
	boot("gd_types_macros_init");
}