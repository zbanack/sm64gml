function sm64_init_bin_sky() {
globalvar sky_09000000,
sky_09000800,
sky_09001000,
sky_09001800,
sky_09002000,
sky_09003000,
sky_09003800,
sky_09004800,
sky_09005000,
sky_09005800,
sky_09006000,
sky_09007000,
sky_09007800,
sky_09008000;
sky_09000000 = sprite_add_from_rom("textures/sky/rr_textures.00000.rgba16.inc.c");
sky_09000800 = sprite_add_from_rom("textures/sky/rr_textures.00800.rgba16.inc.c");
sky_09001000 = sprite_add_from_rom("textures/sky/rr_textures.01000.rgba16.inc.c");
sky_09001800 = sprite_add_from_rom("textures/sky/rr_textures.01800.rgba16.inc.c");
sky_09002000 = sprite_add_from_rom("textures/sky/rr_textures.02000.rgba16.inc.c");
sky_09003000 = sprite_add_from_rom("textures/sky/rr_textures.03000.rgba16.inc.c");
sky_09003800 = sprite_add_from_rom("textures/sky/rr_textures.03800.rgba16.inc.c");
sky_09004800 = sprite_add_from_rom("textures/sky/rr_textures.04800.rgba16.inc.c");
sky_09005000 = sprite_add_from_rom("textures/sky/rr_textures.05000.rgba16.inc.c");
sky_09005800 = sprite_add_from_rom("textures/sky/rr_textures.05800.rgba16.inc.c");
sky_09006000 = sprite_add_from_rom("textures/sky/rr_textures.06000.rgba16.inc.c");
sky_09007000 = sprite_add_from_rom("textures/sky/rr_textures.07000.rgba16.inc.c");
sky_09007800 = sprite_add_from_rom("textures/sky/rr_textures.07800.rgba16.inc.c");
sky_09008000 = sprite_add_from_rom("textures/sky/rr_textures.08000.rgba16.inc.c");
	
boot("sm64_init_bin_sky");
}