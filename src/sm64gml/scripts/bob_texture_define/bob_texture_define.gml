// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bob_texture_define(){
	// bob
	global.__bob_seg7_texture_07000000 = sprite_add_from_rom("levels/bob/0.rgba16.inc.c");
	global.__bob_seg7_texture_07000800 = sprite_add_from_rom("levels/bob/1.rgba16.inc.c");
	global.__bob_seg7_texture_07001000 = sprite_add_from_rom("levels/bob/2.rgba16.inc.c");
	global.__bob_seg7_texture_07001800 = sprite_add_from_rom("levels/bob/3.rgba16.inc.c");
	global.__bob_seg7_texture_07002000 = sprite_add_from_rom("levels/bob/4.rgba16.inc.c");
		
	#macro bob_seg7_texture_07000000	global.__bob_seg7_texture_07000000
	#macro bob_seg7_texture_07000800	global.__bob_seg7_texture_07000800
	#macro bob_seg7_texture_07001000	global.__bob_seg7_texture_07001000
	#macro bob_seg7_texture_07001800	global.__bob_seg7_texture_07001800
	#macro bob_seg7_texture_07002000	global.__bob_seg7_texture_07002000
}