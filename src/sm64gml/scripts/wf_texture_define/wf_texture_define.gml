function wf_texture_define(){
	
	// wf
	global.__wf_seg7_texture_07000000  = sprite_add_from_rom("levels/wf/0.rgba16.inc.c");
	global.__wf_seg7_texture_07000800  = sprite_add_from_rom("levels/wf/1.rgba16.inc.c");
	global.__wf_seg7_texture_07001000  = sprite_add_from_rom("levels/wf/2.rgba16.inc.c");
	global.__wf_seg7_texture_07001800  = sprite_add_from_rom("levels/wf/3.rgba16.inc.c");
	global.__wf_seg7_texture_07002000  = sprite_add_from_rom("levels/wf/4.rgba16.inc.c");
	global.__wf_seg7_texture_07002800  = sprite_add_from_rom("levels/wf/5.ia8.inc.c");
	#macro wf_seg7_texture_07000000		   global.__wf_seg7_texture_07000000
	#macro wf_seg7_texture_07000800		   global.__wf_seg7_texture_07000800
	#macro wf_seg7_texture_07001000		   global.__wf_seg7_texture_07001000
	#macro wf_seg7_texture_07001800		   global.__wf_seg7_texture_07001800
	#macro wf_seg7_texture_07002000		   global.__wf_seg7_texture_07002000
	#macro wf_seg7_texture_07002800		   global.__wf_seg7_texture_07002800
}