// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ttm_texture_define(){
	
globalvar ttm_seg7_texture_07000000,
ttm_seg7_texture_07000800,
ttm_seg7_texture_07001000,
ttm_seg7_texture_07001800,
ttm_seg7_texture_07002000,
ttm_seg7_texture_07002800,
ttm_seg7_texture_07003000,
ttm_seg7_texture_07004000;

ttm_seg7_texture_07000000 = sprite_add_from_rom("levels/ttm/0.ia16.inc.c");
ttm_seg7_texture_07000800 = sprite_add_from_rom("levels/ttm/1.rgba16.inc.c");
ttm_seg7_texture_07001000 = sprite_add_from_rom("levels/ttm/2.rgba16.inc.c");
ttm_seg7_texture_07001800 = sprite_add_from_rom("levels/ttm/3.rgba16.inc.c");
ttm_seg7_texture_07002000 = sprite_add_from_rom("levels/ttm/4.rgba16.inc.c");
ttm_seg7_texture_07002800 = sprite_add_from_rom("levels/ttm/5.rgba16.inc.c");
ttm_seg7_texture_07003000 = sprite_add_from_rom("levels/ttm/6.rgba16.inc.c");
ttm_seg7_texture_07004000 = sprite_add_from_rom("levels/ttm/7.rgba16.inc.c");
}