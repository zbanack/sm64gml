function surface_terrain_macros_init() {
#macro SURFACE_DEFAULT                      0x0000 
#macro SURFACE_BURNING                      0x0001 
#macro SURFACE_0004                         0x0004 
#macro SURFACE_HANGABLE                     0x0005 
#macro SURFACE_SLOW                         0x0009 
#macro SURFACE_DEATH_PLANE                  0x000A 
#macro SURFACE_CLOSE_CAMERA                 0x000B 
#macro SURFACE_WATER                        0x000D 
#macro SURFACE_FLOWING_WATER                0x000E 
#macro SURFACE_INTANGIBLE                   0x0012 
#macro SURFACE_VERY_SLIPPERY                0x0013 
#macro SURFACE_SLIPPERY                     0x0014 
#macro SURFACE_NOT_SLIPPERY                 0x0015 
#macro SURFACE_TTM_VINES                    0x0016 
#macro SURFACE_MGR_MUSIC                    0x001A
#macro SURFACE_INSTANT_WARP_1B              0x001B
#macro SURFACE_INSTANT_WARP_1C              0x001C 
#macro SURFACE_INSTANT_WARP_1D              0x001D 
#macro SURFACE_INSTANT_WARP_1E              0x001E 
#macro SURFACE_SHALLOW_QUICKSAND            0x0021 
#macro SURFACE_DEEP_QUICKSAND               0x0022 
#macro SURFACE_INSTANT_QUICKSAND            0x0023 
#macro SURFACE_DEEP_MOVING_QUICKSAND        0x0024 
#macro SURFACE_SHALLOW_MOVING_QUICKSAND     0x0025 
#macro SURFACE_QUICKSAND                    0x0026 
#macro SURFACE_MOVING_QUICKSAND             0x0027 
#macro SURFACE_WALL_MISC                    0x0028 
#macro SURFACE_NOISE_DEFAULT                0x0029 
#macro SURFACE_NOISE_SLIPPERY               0x002A 
#macro SURFACE_HORIZONTAL_WIND              0x002C 
#macro SURFACE_INSTANT_MOVING_QUICKSAND     0x002D 
#macro SURFACE_ICE                          0x002E 
#macro SURFACE_LOOK_UP_WARP                 0x002F 
#macro SURFACE_HARD                         0x0030 
#macro SURFACE_WARP                         0x0032 
#macro SURFACE_TIMER_START                  0x0033 
#macro SURFACE_TIMER_END                    0x0034 
#macro SURFACE_HARD_SLIPPERY                0x0035 
#macro SURFACE_HARD_VERY_SLIPPERY           0x0036 
#macro SURFACE_HARD_NOT_SLIPPERY            0x0037 
#macro SURFACE_VERTICAL_WIND                0x0038 
#macro SURFACE_BOSS_FIGHT_CAMERA            0x0065 
#macro SURFACE_CAMERA_FREE_ROAM             0x0066 
#macro SURFACE_THI3_WALLKICK                0x0068 
#macro SURFACE_CAMERA_8_DIR                 0x0069 
#macro SURFACE_CAMERA_MIDDLE                0x006E 
#macro SURFACE_CAMERA_ROTATE_RIGHT          0x006F 
#macro SURFACE_CAMERA_ROTATE_LEFT           0x0070 
#macro SURFACE_CAMERA_BOUNDARY              0x0072 
#macro SURFACE_NOISE_VERY_SLIPPERY_73       0x0073 
#macro SURFACE_NOISE_VERY_SLIPPERY_74       0x0074 
#macro SURFACE_NOISE_VERY_SLIPPERY          0x0075 
#macro SURFACE_NO_CAM_COLLISION             0x0076 
#macro SURFACE_NO_CAM_COLLISION_77          0x0077 
#macro SURFACE_NO_CAM_COL_VERY_SLIPPERY     0x0078 
#macro SURFACE_NO_CAM_COL_SLIPPERY          0x0079 
#macro SURFACE_SWITCH                       0x007A 
#macro SURFACE_VANISH_CAP_WALLS             0x007B 
#macro SURFACE_PAINTING_WOBBLE_A6           0x00A6 
#macro SURFACE_PAINTING_WOBBLE_A7           0x00A7 
#macro SURFACE_PAINTING_WOBBLE_A8           0x00A8 
#macro SURFACE_PAINTING_WOBBLE_A9           0x00A9 
#macro SURFACE_PAINTING_WOBBLE_AA           0x00AA 
#macro SURFACE_PAINTING_WOBBLE_AB           0x00AB 
#macro SURFACE_PAINTING_WOBBLE_AC           0x00AC 
#macro SURFACE_PAINTING_WOBBLE_AD           0x00AD 
#macro SURFACE_PAINTING_WOBBLE_AE           0x00AE 
#macro SURFACE_PAINTING_WOBBLE_AF           0x00AF 
#macro SURFACE_PAINTING_WOBBLE_B0           0x00B0 
#macro SURFACE_PAINTING_WOBBLE_B1           0x00B1 
#macro SURFACE_PAINTING_WOBBLE_B2           0x00B2 
#macro SURFACE_PAINTING_WOBBLE_B3           0x00B3 
#macro SURFACE_PAINTING_WOBBLE_B4           0x00B4 
#macro SURFACE_PAINTING_WOBBLE_B5           0x00B5 
#macro SURFACE_PAINTING_WOBBLE_B6           0x00B6 
#macro SURFACE_PAINTING_WOBBLE_B7           0x00B7 
#macro SURFACE_PAINTING_WOBBLE_B8           0x00B8 
#macro SURFACE_PAINTING_WOBBLE_B9           0x00B9 
#macro SURFACE_PAINTING_WOBBLE_BA           0x00BA 
#macro SURFACE_PAINTING_WOBBLE_BB           0x00BB 
#macro SURFACE_PAINTING_WOBBLE_BC           0x00BC 
#macro SURFACE_PAINTING_WOBBLE_BD           0x00BD 
#macro SURFACE_PAINTING_WOBBLE_BE           0x00BE 
#macro SURFACE_PAINTING_WOBBLE_BF           0x00BF 
#macro SURFACE_PAINTING_WOBBLE_C0           0x00C0 
#macro SURFACE_PAINTING_WOBBLE_C1           0x00C1 
#macro SURFACE_PAINTING_WOBBLE_C2           0x00C2 
#macro SURFACE_PAINTING_WOBBLE_C3           0x00C3 
#macro SURFACE_PAINTING_WOBBLE_C4           0x00C4 
#macro SURFACE_PAINTING_WOBBLE_C5           0x00C5 
#macro SURFACE_PAINTING_WOBBLE_C6           0x00C6 
#macro SURFACE_PAINTING_WOBBLE_C7           0x00C7 
#macro SURFACE_PAINTING_WOBBLE_C8           0x00C8 
#macro SURFACE_PAINTING_WOBBLE_C9           0x00C9 
#macro SURFACE_PAINTING_WOBBLE_CA           0x00CA 
#macro SURFACE_PAINTING_WOBBLE_CB           0x00CB 
#macro SURFACE_PAINTING_WOBBLE_CC           0x00CC 
#macro SURFACE_PAINTING_WOBBLE_CD           0x00CD 
#macro SURFACE_PAINTING_WOBBLE_CE           0x00CE 
#macro SURFACE_PAINTING_WOBBLE_CF           0x00CF 
#macro SURFACE_PAINTING_WOBBLE_D0           0x00D0 
#macro SURFACE_PAINTING_WOBBLE_D1           0x00D1 
#macro SURFACE_PAINTING_WOBBLE_D2           0x00D2 
#macro SURFACE_PAINTING_WARP_D3             0x00D3 
#macro SURFACE_PAINTING_WARP_D4             0x00D4 
#macro SURFACE_PAINTING_WARP_D5             0x00D5 
#macro SURFACE_PAINTING_WARP_D6             0x00D6 
#macro SURFACE_PAINTING_WARP_D7             0x00D7 
#macro SURFACE_PAINTING_WARP_D8             0x00D8 
#macro SURFACE_PAINTING_WARP_D9             0x00D9 
#macro SURFACE_PAINTING_WARP_DA             0x00DA 
#macro SURFACE_PAINTING_WARP_DB             0x00DB 
#macro SURFACE_PAINTING_WARP_DC             0x00DC 
#macro SURFACE_PAINTING_WARP_DD             0x00DD 
#macro SURFACE_PAINTING_WARP_DE             0x00DE 
#macro SURFACE_PAINTING_WARP_DF             0x00DF 
#macro SURFACE_PAINTING_WARP_E0             0x00E0 
#macro SURFACE_PAINTING_WARP_E1             0x00E1 
#macro SURFACE_PAINTING_WARP_E2             0x00E2 
#macro SURFACE_PAINTING_WARP_E3             0x00E3 
#macro SURFACE_PAINTING_WARP_E4             0x00E4 
#macro SURFACE_PAINTING_WARP_E5             0x00E5 
#macro SURFACE_PAINTING_WARP_E6             0x00E6 
#macro SURFACE_PAINTING_WARP_E7             0x00E7 
#macro SURFACE_PAINTING_WARP_E8             0x00E8 
#macro SURFACE_PAINTING_WARP_E9             0x00E9 
#macro SURFACE_PAINTING_WARP_EA             0x00EA 
#macro SURFACE_PAINTING_WARP_EB             0x00EB 
#macro SURFACE_PAINTING_WARP_EC             0x00EC 
#macro SURFACE_PAINTING_WARP_ED             0x00ED 
#macro SURFACE_PAINTING_WARP_EE             0x00EE 
#macro SURFACE_PAINTING_WARP_EF             0x00EF 
#macro SURFACE_PAINTING_WARP_F0             0x00F0 
#macro SURFACE_PAINTING_WARP_F1             0x00F1 
#macro SURFACE_PAINTING_WARP_F2             0x00F2 
#macro SURFACE_PAINTING_WARP_F3             0x00F3 
#macro SURFACE_TTC_PAINTING_1               0x00F4 
#macro SURFACE_TTC_PAINTING_2               0x00F5 
#macro SURFACE_TTC_PAINTING_3               0x00F6 
#macro SURFACE_PAINTING_WARP_F7             0x00F7 
#macro SURFACE_PAINTING_WARP_F8             0x00F8 
#macro SURFACE_PAINTING_WARP_F9             0x00F9 
#macro SURFACE_PAINTING_WARP_FA             0x00FA 
#macro SURFACE_PAINTING_WARP_FB             0x00FB 
#macro SURFACE_PAINTING_WARP_FC             0x00FC 
#macro SURFACE_WOBBLING_WARP                0x00FD 
#macro SURFACE_TRAPDOOR                     0x00FF 

#macro SURFACE_CLASS_DEFAULT                   0x0000
#macro SURFACE_CLASS_VERY_SLIPPERY             0x0013
#macro SURFACE_CLASS_SLIPPERY                  0x0014
#macro SURFACE_CLASS_NOT_SLIPPERY              0x0015

#macro SURFACE_FLAG_DYNAMIC            (1 << 0)
#macro SURFACE_FLAG_NO_CAM_COLLISION   (1 << 1)
#macro SURFACE_FLAG_X_PROJECTION       (1 << 3)

#macro TERRAIN_LOAD_VERTICES	(0x0040)
#macro TERRAIN_LOAD_CONTINUE	(0x0041)
#macro TERRAIN_LOAD_END			(0x0042)
#macro TERRAIN_LOAD_OBJECTS		(0x0043)
#macro TERRAIN_LOAD_ENVIRONMENT (0x0044)

// Terrain types defined by the level script command terrain_type (cmd_31)
#macro TERRAIN_GRASS    0x0000
#macro TERRAIN_STONE    0x0001
#macro TERRAIN_SNOW     0x0002
#macro TERRAIN_SAND     0x0003
#macro TERRAIN_SPOOKY   0x0004
#macro TERRAIN_WATER    0x0005
#macro TERRAIN_SLIDE    0x0006
#macro TERRAIN_MASK		0x0007	

boot("surface_terrain_macros_init");
}


function TERRAIN_LOAD_IS_SURFACE_TYPE_LOW(cmd)  { gml_pragma("forceinline"); return (cmd < 0x40);}
function TERRAIN_LOAD_IS_SURFACE_TYPE_HIGH(cmd) { gml_pragma("forceinline"); return (cmd >= 0x65);}
function SURFACE_IS_QUICKSAND(cmd)     { gml_pragma("forceinline"); return (cmd >= 0x21 && cmd < 0x28); }
function SURFACE_IS_NOT_HARD(cmd)      { gml_pragma("forceinline"); return (cmd != SURFACE_HARD && !(cmd >= 0x35 && cmd <= 0x37));}
function SURFACE_IS_PAINTING_WARP(cmd) { gml_pragma("forceinline"); return (cmd >= 0xD3 && cmd < 0xFD);}

function COL_INIT() { gml_pragma("forceinline"); return (TERRAIN_LOAD_VERTICES); }
function COL_VERTEX_INIT(vtxNum) { gml_pragma("forceinline"); return vtxNum; }
function COL_VERTEX(x, y, z) { gml_pragma("forceinline"); return [x, y, z]; }
function COL_TRI_INIT(surfType, triNum) { gml_pragma("forceinline"); return [surfType, triNum]; }
function COL_TRI(v1, v2, v3) { gml_pragma("forceinline"); return [v1, v2, v3]; }
function COL_TRI_SPECIAL(v1, v2, v3, param) { gml_pragma("forceinline"); return [v1, v2, v3, param]; }
function COL_TRI_STOP() { gml_pragma("forceinline"); return (TERRAIN_LOAD_CONTINUE); }
function COL_END() { gml_pragma("forceinline"); return (TERRAIN_LOAD_END); }
function COL_SPECIAL_INIT(num) { gml_pragma("forceinline"); return [(TERRAIN_LOAD_OBJECTS), num]; }
function COL_WATER_BOX_INIT(num) { gml_pragma("forceinline"); return [(TERRAIN_LOAD_ENVIRONMENT), num]; }
function COL_WATER_BOX(_id, _x1, _z1, _x2, _z2, _y) { gml_pragma("forceinline"); return [_id, _x1, _z1, _x2, _z2, _y]; }

function SPECIAL_OBJECT(preset, posX, posY, posZ) { gml_pragma("forceinline"); return [preset, posX, posY, posZ]; }
function SPECIAL_OBJECT_WITH_YAW(preset, posX, posY, posZ, yaw) { gml_pragma("forceinline"); return [preset, posX, posY, posZ, yaw]; }


														  