// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function castle_grounds_texture_define(){
	global.__castle_grounds_seg7_texture_07000000 = sprite_add_from_rom("levels/castle_grounds/0.rgba16.png");
	global.__castle_grounds_seg7_texture_07001000 = sprite_add_from_rom("levels/castle_grounds/1.rgba16.png");
	global.__castle_grounds_seg7_texture_07002000 = sprite_add_from_rom("levels/castle_grounds/2.rgba16.png");
	#macro castle_grounds_seg7_texture_07000000 global.__castle_grounds_seg7_texture_07000000
	#macro castle_grounds_seg7_texture_07001000 global.__castle_grounds_seg7_texture_07001000
	#macro castle_grounds_seg7_texture_07002000 global.__castle_grounds_seg7_texture_07002000
}