function sm64_init_bin_inside(){
	
globalvar inside_09000000,
inside_09001000,
inside_09002000,
inside_09003000,
inside_09003800,
inside_09004000,
inside_09004800,
inside_09005000,
inside_09005800,
inside_09006000,
inside_09007000,
inside_09008000,
inside_09008800,
inside_09009000,
inside_0900A000,
inside_0900B000,
inside_0900B800;

inside_09000000 = sprite_add_from_rom("textures/inside/inside_castle_textures.00000.rgba16.inc.c");
inside_09001000 = sprite_add_from_rom("textures/inside/inside_castle_textures.01000.rgba16.inc.c");
inside_09002000 = sprite_add_from_rom("textures/inside/inside_castle_textures.02000.rgba16.inc.c");
inside_09003000 = sprite_add_from_rom("textures/inside/inside_castle_textures.03000.rgba16.inc.c");
inside_09003800 = sprite_add_from_rom("textures/inside/inside_castle_textures.03800.rgba16.inc.c");
inside_09004000 = sprite_add_from_rom("textures/inside/inside_castle_textures.04000.rgba16.inc.c");
inside_09004800 = sprite_add_from_rom("textures/inside/inside_castle_textures.04800.rgba16.inc.c");
inside_09005000 = sprite_add_from_rom("textures/inside/inside_castle_textures.05000.rgba16.inc.c");
inside_09005800 = sprite_add_from_rom("textures/inside/inside_castle_textures.05800.rgba16.inc.c");
inside_09006000 = sprite_add_from_rom("textures/inside/inside_castle_textures.06000.rgba16.inc.c");
inside_09007000 = sprite_add_from_rom("textures/inside/inside_castle_textures.07000.rgba16.inc.c");
inside_09008000 = sprite_add_from_rom("textures/inside/inside_castle_textures.08000.rgba16.inc.c");
inside_09008800 = sprite_add_from_rom("textures/inside/inside_castle_textures.08800.rgba16.inc.c");
inside_09009000 = sprite_add_from_rom("textures/inside/inside_castle_textures.09000.rgba16.inc.c");
inside_0900A000 = sprite_add_from_rom("textures/inside/inside_castle_textures.0A000.rgba16.inc.c");
inside_0900B000 = sprite_add_from_rom("textures/inside/inside_castle_textures.0B000.rgba16.inc.c");
inside_0900B800 = sprite_add_from_rom("textures/inside/inside_castle_textures.0B800.rgba16.inc.c");

boot("sm64_init_bin_inside");
}