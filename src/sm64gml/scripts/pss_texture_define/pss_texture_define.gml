function pss_texture_define(){
	
	globalvar pss_seg7_texture_07000000,
	pss_seg7_texture_07000800,
	pss_seg7_texture_07001000;
	pss_seg7_texture_07000000  = sprite_add_from_rom("levels/pss/0.rgba16.inc.c");
	pss_seg7_texture_07000800  = sprite_add_from_rom("levels/pss/1.ia16.inc.c");
	pss_seg7_texture_07001000  = sprite_add_from_rom("levels/pss/2.rgba16.inc.c");
}