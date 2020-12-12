// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mario_texture_define(){
/// <pygml?v=1.0&h=4d3e803fd>
global.__mario_texture_metal = sprite_add_from_rom("actors/mario/mario_metal.rgba16.inc.c");
#macro mario_texture_metal (global.__mario_texture_metal)

global.__mario_texture_yellow_button = sprite_add_from_rom("actors/mario/mario_overalls_button.rgba16.inc.c", true);
#macro mario_texture_yellow_button (global.__mario_texture_yellow_button)

global.__mario_texture_m_logo = sprite_add_from_rom("actors/mario/mario_logo.rgba16.inc.c", true);
#macro mario_texture_m_logo (global.__mario_texture_m_logo)

global.__mario_texture_hair_sideburn = sprite_add_from_rom("actors/mario/mario_sideburn.rgba16.inc.c", true);
#macro mario_texture_hair_sideburn (global.__mario_texture_hair_sideburn)

global.__mario_texture_mustache = sprite_add_from_rom("actors/mario/mario_mustache.rgba16.inc.c", true);
#macro mario_texture_mustache (global.__mario_texture_mustache)

global.__mario_texture_eyes_front = sprite_add_from_rom("actors/mario/mario_eyes_center.rgba16.inc.c", true);
#macro mario_texture_eyes_front (global.__mario_texture_eyes_front)

global.__mario_texture_eyes_half_closed = sprite_add_from_rom("actors/mario/mario_eyes_half_closed.rgba16.inc.c", true);
#macro mario_texture_eyes_half_closed (global.__mario_texture_eyes_half_closed)

global.__mario_texture_eyes_closed = sprite_add_from_rom("actors/mario/mario_eyes_closed.rgba16.inc.c", true);
#macro mario_texture_eyes_closed (global.__mario_texture_eyes_closed)

global.__mario_texture_eyes_closed_unused1 = sprite_add_from_rom("actors/mario/mario_eyes_closed_unused_0.rgba16.inc.c");
#macro mario_texture_eyes_closed_unused1 (global.__mario_texture_eyes_closed_unused1)

global.__mario_texture_eyes_closed_unused2 = sprite_add_from_rom("actors/mario/mario_eyes_closed_unused_1.rgba16.inc.c");
#macro mario_texture_eyes_closed_unused2 (global.__mario_texture_eyes_closed_unused2)

global.__mario_texture_eyes_right = sprite_add_from_rom("actors/mario/mario_eyes_left_unused.rgba16.inc.c", true);
#macro mario_texture_eyes_right (global.__mario_texture_eyes_right)

global.__mario_texture_eyes_left = sprite_add_from_rom("actors/mario/mario_eyes_right_unused.rgba16.inc.c", true);
#macro mario_texture_eyes_left (global.__mario_texture_eyes_left)

global.__mario_texture_eyes_up = sprite_add_from_rom("actors/mario/mario_eyes_up_unused.rgba16.inc.c", true);
#macro mario_texture_eyes_up (global.__mario_texture_eyes_up)

global.__mario_texture_eyes_down = sprite_add_from_rom("actors/mario/mario_eyes_down_unused.rgba16.inc.c", true);
#macro mario_texture_eyes_down (global.__mario_texture_eyes_down)

global.__mario_texture_eyes_dead = sprite_add_from_rom("actors/mario/mario_eyes_dead.rgba16.inc.c", true);
#macro mario_texture_eyes_dead (global.__mario_texture_eyes_dead)

global.__mario_texture_wings_half_1 = sprite_add_from_rom("actors/mario/mario_wing.rgba16.inc.c");
#macro mario_texture_wings_half_1 (global.__mario_texture_wings_half_1)

global.__mario_texture_wings_half_2 = sprite_add_from_rom("actors/mario/mario_wing_tip.rgba16.inc.c");
#macro mario_texture_wings_half_2 (global.__mario_texture_wings_half_2)

global.__mario_texture_metal_wings_half_1 = sprite_add_from_rom("actors/mario/mario_metal_wing_unused.rgba16.inc.c");
#macro mario_texture_metal_wings_half_1 (global.__mario_texture_metal_wings_half_1)

global.__mario_texture_metal_wings_half_2 = sprite_add_from_rom("actors/mario/mario_metal_wing_tip_unused.rgba16.inc.c");
#macro mario_texture_metal_wings_half_2 (global.__mario_texture_metal_wings_half_2)


}