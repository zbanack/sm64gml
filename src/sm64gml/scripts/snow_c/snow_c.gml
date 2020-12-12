function sm64_init_bin_snow(){
globalvar snow_09000000,
snow_09000800,
snow_09001000,
snow_09002000,
snow_09002800,
snow_09003000,
snow_09003800,
snow_09004000,
snow_09004800,
snow_09005000,
snow_09005800,
snow_09006000,
snow_09006800,
snow_09007000,
snow_09008000,
snow_09008800,
snow_09009000,
snow_09009800;

snow_09000000 = sprite_add_from_rom("textures/snow/ccm_textures.00000.rgba16.inc.c");
snow_09000800 = sprite_add_from_rom("textures/snow/ccm_textures.00800.rgba16.inc.c");
snow_09001000 = sprite_add_from_rom("textures/snow/ccm_textures.01000.rgba16.inc.c");
snow_09002000 = sprite_add_from_rom("textures/snow/ccm_textures.02000.rgba16.inc.c");
snow_09002800 = sprite_add_from_rom("textures/snow/ccm_textures.02800.rgba16.inc.c");
snow_09003000 = sprite_add_from_rom("textures/snow/ccm_textures.03000.rgba16.inc.c");
snow_09003800 = sprite_add_from_rom("textures/snow/ccm_textures.03800.rgba16.inc.c");
snow_09004000 = sprite_add_from_rom("textures/snow/ccm_textures.04000.rgba16.inc.c");
snow_09004800 = sprite_add_from_rom("textures/snow/ccm_textures.04800.rgba16.inc.c");
snow_09005000 = sprite_add_from_rom("textures/snow/ccm_textures.05000.rgba16.inc.c");
snow_09005800 = sprite_add_from_rom("textures/snow/ccm_textures.05800.rgba16.inc.c");
snow_09006000 = sprite_add_from_rom("textures/snow/ccm_textures.06000.rgba16.inc.c");
snow_09006800 = sprite_add_from_rom("textures/snow/ccm_textures.06800.rgba16.inc.c");
snow_09007000 = sprite_add_from_rom("textures/snow/ccm_textures.07000.rgba16.inc.c");
snow_09008000 = sprite_add_from_rom("textures/snow/ccm_textures.08000.rgba16.inc.c");
snow_09008800 = sprite_add_from_rom("textures/snow/ccm_textures.08800.rgba16.inc.c");
snow_09009000 = sprite_add_from_rom("textures/snow/ccm_textures.09000.ia16.inc.c");
snow_09009800 = sprite_add_from_rom("textures/snow/ccm_textures.09800.ia16.inc.c");

boot("sm64_init_bin_snow");
}
