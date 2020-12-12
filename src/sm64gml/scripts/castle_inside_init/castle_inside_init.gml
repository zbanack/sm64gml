function castle_inside_init(){
	castle_inside_model_area_1A_init();
	castle_inside_model_area_1B_init();
	castle_inside_model_area_1C_init();
	castle_inside_rooms_init();
	paintings_inc_c_init();
	castle_inside_geo_init();
	castle_inside_macros_init();
	paintings_scripts_init_macros();
}

function castle_inside_textures() {
/// <pygml?v=1.0&h=09bf62fce>
global.__texture_castle_light = sprite_add_from_rom("levels/castle_inside/castle_light.ia16.inc.c");
#macro texture_castle_light (global.__texture_castle_light)

global.__inside_castle_seg7_texture_07000800 = sprite_add_from_rom("levels/castle_inside/1.rgba16.inc.c");
#macro inside_castle_seg7_texture_07000800 (global.__inside_castle_seg7_texture_07000800)

global.__inside_castle_seg7_texture_07001000 = sprite_add_from_rom("levels/castle_inside/2.ia16.inc.c");
#macro inside_castle_seg7_texture_07001000 (global.__inside_castle_seg7_texture_07001000)

global.__inside_castle_seg7_texture_07002000 = sprite_add_from_rom("levels/castle_inside/3.rgba16.inc.c");
#macro inside_castle_seg7_texture_07002000 (global.__inside_castle_seg7_texture_07002000)

global.__inside_castle_seg7_texture_07003000 = sprite_add_from_rom("levels/castle_inside/4.rgba16.inc.c");
#macro inside_castle_seg7_texture_07003000 (global.__inside_castle_seg7_texture_07003000)

global.__inside_castle_seg7_texture_07003800 = sprite_add_from_rom("levels/castle_inside/5.rgba16.inc.c");
#macro inside_castle_seg7_texture_07003800 (global.__inside_castle_seg7_texture_07003800)

global.__inside_castle_seg7_texture_07004800 = sprite_add_from_rom("levels/castle_inside/6.rgba16.inc.c");
#macro inside_castle_seg7_texture_07004800 (global.__inside_castle_seg7_texture_07004800)

global.__inside_castle_seg7_texture_07005800 = sprite_add_from_rom("levels/castle_inside/7.rgba16.inc.c");
#macro inside_castle_seg7_texture_07005800 (global.__inside_castle_seg7_texture_07005800)

global.__inside_castle_seg7_texture_07006000 = sprite_add_from_rom("levels/castle_inside/8.rgba16.inc.c");
#macro inside_castle_seg7_texture_07006000 (global.__inside_castle_seg7_texture_07006000)

global.__inside_castle_seg7_texture_07006800 = sprite_add_from_rom("levels/castle_inside/9.rgba16.inc.c");
#macro inside_castle_seg7_texture_07006800 (global.__inside_castle_seg7_texture_07006800)

global.__inside_castle_seg7_texture_07007000 = sprite_add_from_rom("levels/castle_inside/10.rgba16.inc.c");
#macro inside_castle_seg7_texture_07007000 (global.__inside_castle_seg7_texture_07007000)

global.__inside_castle_seg7_texture_07007800 = sprite_add_from_rom("levels/castle_inside/11.rgba16.inc.c");
#macro inside_castle_seg7_texture_07007800 (global.__inside_castle_seg7_texture_07007800)

global.__inside_castle_seg7_texture_07008000 = sprite_add_from_rom("levels/castle_inside/12.rgba16.inc.c");
#macro inside_castle_seg7_texture_07008000 (global.__inside_castle_seg7_texture_07008000)

global.__inside_castle_seg7_texture_07008800 = sprite_add_from_rom("levels/castle_inside/13.rgba16.inc.c");
#macro inside_castle_seg7_texture_07008800 (global.__inside_castle_seg7_texture_07008800)

global.__inside_castle_seg7_texture_07009000 = sprite_add_from_rom("levels/castle_inside/14.rgba16.inc.c");
#macro inside_castle_seg7_texture_07009000 (global.__inside_castle_seg7_texture_07009000)

global.__inside_castle_seg7_texture_07009800 = sprite_add_from_rom("levels/castle_inside/15.rgba16.inc.c");
#macro inside_castle_seg7_texture_07009800 (global.__inside_castle_seg7_texture_07009800)

global.__inside_castle_seg7_texture_0700A000 = sprite_add_from_rom("levels/castle_inside/16.ia16.inc.c");
#macro inside_castle_seg7_texture_0700A000 (global.__inside_castle_seg7_texture_0700A000)

global.__inside_castle_seg7_texture_0700A800 = sprite_add_from_rom("levels/castle_inside/17.rgba16.inc.c");
#macro inside_castle_seg7_texture_0700A800 (global.__inside_castle_seg7_texture_0700A800)

global.__inside_castle_seg7_texture_0700B800 = sprite_add_from_rom("levels/castle_inside/18.rgba16.inc.c");
#macro inside_castle_seg7_texture_0700B800 (global.__inside_castle_seg7_texture_0700B800)

global.__inside_castle_seg7_texture_0700C800 = sprite_add_from_rom("levels/castle_inside/19.rgba16.inc.c");
#macro inside_castle_seg7_texture_0700C800 (global.__inside_castle_seg7_texture_0700C800)

global.__inside_castle_seg7_texture_0700D800 = sprite_add_from_rom("levels/castle_inside/20.rgba16.inc.c");
#macro inside_castle_seg7_texture_0700D800 (global.__inside_castle_seg7_texture_0700D800)

global.__inside_castle_seg7_texture_0700E800 = sprite_add_from_rom("levels/castle_inside/21.rgba16.inc.c");
#macro inside_castle_seg7_texture_0700E800 (global.__inside_castle_seg7_texture_0700E800)

global.__inside_castle_seg7_texture_0700F800 = sprite_add_from_rom("levels/castle_inside/22.rgba16.inc.c");
#macro inside_castle_seg7_texture_0700F800 (global.__inside_castle_seg7_texture_0700F800)

global.__inside_castle_seg7_texture_07010800 = sprite_add_from_rom("levels/castle_inside/23.rgba16.inc.c");
#macro inside_castle_seg7_texture_07010800 (global.__inside_castle_seg7_texture_07010800)

global.__inside_castle_seg7_texture_07011800 = sprite_add_from_rom("levels/castle_inside/24.rgba16.inc.c");
#macro inside_castle_seg7_texture_07011800 (global.__inside_castle_seg7_texture_07011800)

global.__inside_castle_seg7_texture_07012800 = sprite_add_from_rom("levels/castle_inside/25.rgba16.inc.c");
#macro inside_castle_seg7_texture_07012800 (global.__inside_castle_seg7_texture_07012800)

global.__inside_castle_seg7_texture_07013800 = sprite_add_from_rom("levels/castle_inside/26.rgba16.inc.c");
#macro inside_castle_seg7_texture_07013800 (global.__inside_castle_seg7_texture_07013800)

global.__inside_castle_seg7_texture_07014800 = sprite_add_from_rom("levels/castle_inside/27.rgba16.inc.c");
#macro inside_castle_seg7_texture_07014800 (global.__inside_castle_seg7_texture_07014800)

global.__inside_castle_seg7_texture_07015800 = sprite_add_from_rom("levels/castle_inside/28.rgba16.inc.c");
#macro inside_castle_seg7_texture_07015800 (global.__inside_castle_seg7_texture_07015800)

global.__inside_castle_seg7_texture_07016800 = sprite_add_from_rom("levels/castle_inside/29.rgba16.inc.c");
#macro inside_castle_seg7_texture_07016800 (global.__inside_castle_seg7_texture_07016800)

global.__inside_castle_seg7_texture_07017000 = sprite_add_from_rom("levels/castle_inside/30.rgba16.inc.c");
#macro inside_castle_seg7_texture_07017000 (global.__inside_castle_seg7_texture_07017000)

global.__inside_castle_seg7_texture_07017800 = sprite_add_from_rom("levels/castle_inside/31.rgba16.inc.c");
#macro inside_castle_seg7_texture_07017800 (global.__inside_castle_seg7_texture_07017800)

global.__inside_castle_seg7_texture_07018800 = sprite_add_from_rom("levels/castle_inside/32.rgba16.inc.c");
#macro inside_castle_seg7_texture_07018800 (global.__inside_castle_seg7_texture_07018800)

global.__inside_castle_seg7_texture_07019800 = sprite_add_from_rom("levels/castle_inside/33.rgba16.inc.c");
#macro inside_castle_seg7_texture_07019800 (global.__inside_castle_seg7_texture_07019800)

global.__inside_castle_seg7_texture_0701A800 = sprite_add_from_rom("levels/castle_inside/34.rgba16.inc.c");
#macro inside_castle_seg7_texture_0701A800 (global.__inside_castle_seg7_texture_0701A800)

global.__inside_castle_seg7_texture_0701B800 = sprite_add_from_rom("levels/castle_inside/35.rgba16.inc.c");
#macro inside_castle_seg7_texture_0701B800 (global.__inside_castle_seg7_texture_0701B800)

global.__inside_castle_seg7_texture_0701C800 = sprite_add_from_rom("levels/castle_inside/36.rgba16.inc.c");
#macro inside_castle_seg7_texture_0701C800 (global.__inside_castle_seg7_texture_0701C800)

global.__inside_castle_seg7_texture_0701D800 = sprite_add_from_rom("levels/castle_inside/37.rgba16.inc.c");
#macro inside_castle_seg7_texture_0701D800 (global.__inside_castle_seg7_texture_0701D800)

global.__inside_castle_seg7_texture_0701E800 = sprite_add_from_rom("levels/castle_inside/38.rgba16.inc.c");
#macro inside_castle_seg7_texture_0701E800 (global.__inside_castle_seg7_texture_0701E800)

global.__inside_castle_seg7_texture_0701F800 = sprite_add_from_rom("levels/castle_inside/39.rgba16.inc.c");
#macro inside_castle_seg7_texture_0701F800 (global.__inside_castle_seg7_texture_0701F800)

global.__inside_castle_seg7_texture_07020800 = sprite_add_from_rom("levels/castle_inside/40.rgba16.inc.c");
#macro inside_castle_seg7_texture_07020800 (global.__inside_castle_seg7_texture_07020800)

	
}