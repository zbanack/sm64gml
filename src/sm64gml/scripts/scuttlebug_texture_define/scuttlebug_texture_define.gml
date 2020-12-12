function scuttlebug_texture_define(){
	// scuttlebugs
	global.__scuttlebug_seg6_texture_06010108 = sprite_add_from_rom("actors/scuttlebug/scuttlebug_eye.rgba16.inc.c");
	global.__scuttlebug_seg6_texture_06010908 = sprite_add_from_rom("actors/scuttlebug/scuttlebug_left_side.rgba16.inc.c");
	global.__scuttlebug_seg6_texture_06011908 = sprite_add_from_rom("actors/scuttlebug/scuttlebug_right_side.rgba16.inc.c");
	global.__scuttlebug_seg6_texture_06012908 = sprite_add_from_rom("actors/scuttlebug/scuttlebug_iris.rgba16.inc.c");
	global.__scuttlebug_seg6_texture_06013108 = sprite_add_from_rom("actors/scuttlebug/scuttlebug_leg.rgba16.inc.c");
		
	#macro scuttlebug_seg6_texture_06010108	global.__scuttlebug_seg6_texture_06010108
	#macro scuttlebug_seg6_texture_06010908	global.__scuttlebug_seg6_texture_06010908
	#macro scuttlebug_seg6_texture_06011908	global.__scuttlebug_seg6_texture_06011908
	#macro scuttlebug_seg6_texture_06012908	global.__scuttlebug_seg6_texture_06012908
	#macro scuttlebug_seg6_texture_06013108	global.__scuttlebug_seg6_texture_06013108	
}