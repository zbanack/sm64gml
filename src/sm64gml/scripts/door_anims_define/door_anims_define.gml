// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function door_anims_define(){
/// <pygml?v=1.0&h=2bb8b6238>
// 0x030151C8
door_seg3_animvalue_030151C8 = [
    0x0000, 0xFED4,
];

// 0x030151CC
door_seg3_animindex_030151CC = [
    0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000,
    0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000,
    0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000,
    0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000,
];

// 0x03015208
door_seg3_anim_03015208 = new Animation(
    0,
    0,
    0,
    0,
    0x50,
    ANIMINDEX_NUMPARTS(door_seg3_animindex_030151CC),
    door_seg3_animvalue_030151C8,
    door_seg3_animindex_030151CC,
    0,
);
/// <pygml?v=1.0&h=48cd77c54>
// 0x03015220
door_seg3_animvalue_03015220 = [
    0x0000, 0xFED4, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0002, 0x0006, 0x0005,
    0x0003, 0x0001, 0x0000, 0x0000, 0x0000, 0xFFFF, 0xFFFE, 0xFFFF,
    0x0000, 0x0002, 0x0007, 0x000D, 0x0014, 0x001B, 0x0023, 0x002B,
    0x0034, 0x003D, 0x0046, 0x004F, 0x0058, 0x0061, 0x006A, 0x0073,
    0x007C, 0x0085, 0x008D, 0x0095, 0x009D, 0x00A4, 0x00AB, 0x00B1,
    0x00B6, 0x00BB, 0x00BF, 0x00C3, 0x00C7, 0x00CA, 0x00CD, 0x00CF,
    0x00D1, 0x00D2, 0x00D3, 0x00D3, 0x00D3, 0x00D1, 0x00D0, 0x00CD,
    0x00CA, 0x00C6, 0x00C1, 0x00BB, 0x00B3, 0x00A8, 0x009A, 0x008A,
    0x0078, 0x0066, 0x0053, 0x0040, 0x002E, 0x001C, 0x000D, 0x0000,
    0xFFF9, 0xFFF7, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0068, 0x0285, 0x0803,
    0x0DAB, 0x0FB3, 0x1184, 0x1529, 0x194B, 0x1DAB, 0x220E, 0x2635,
    0x29E2, 0x2CD9, 0x2EDA, 0x3048, 0x31AC, 0x3305, 0x3451, 0x3591,
    0x36C2, 0x37E3, 0x38F4, 0x39F4, 0x3AE1, 0x3BBA, 0x3C7F, 0x3D2E,
    0x3DC6, 0x3E45, 0x3EAC, 0x3EF9, 0x3F2B, 0x3F40, 0x3F38, 0x3F12,
    0x3ECC, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66,
    0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66,
    0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3CAC, 0x3AF1, 0x3937, 0x377D,
    0x35C2, 0x3408, 0x324E, 0x3093, 0x246E, 0x1849, 0x0C24, 0x0000,
    0x012E, 0x01EB, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0002, 0x0006, 0x0005,
    0x0003, 0x0003, 0x0005, 0x0005, 0x0005, 0x0005, 0x0005, 0x0005,
    0x0007, 0x000A, 0x000F, 0x0015, 0x001C, 0x0023, 0x002B, 0x0033,
    0x003C, 0x0044, 0x004D, 0x0056, 0x005F, 0x0068, 0x0071, 0x007A,
    0x0083, 0x008B, 0x0094, 0x009C, 0x00A3, 0x00AA, 0x00B1, 0x00B7,
    0x00BC, 0x00C1, 0x00C5, 0x00C9, 0x00CC, 0x00D0, 0x00D3, 0x00D5,
    0x00D7, 0x00D8, 0x00D9, 0x00D9, 0x00D9, 0x00D8, 0x00D6, 0x00D3,
    0x00D0, 0x00CC, 0x00C7, 0x00C1, 0x00B9, 0x00AD, 0x009F, 0x008E,
    0x007C, 0x0069, 0x0056, 0x0042, 0x002F, 0x001E, 0x000D, 0x0000,
    0xFFF8, 0xFFF6,
];

// 0x03015404
door_seg3_animindex_03015404 = [
    0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000,
    0x0050, 0x0002, 0x0050, 0x0052, 0x0050, 0x00A2,
    0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000,
    0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000,
];

// 0x03015440
door_seg3_anim_03015440 = new Animation(
    1,
    0,
    0,
    0,
    0x50,
    ANIMINDEX_NUMPARTS(door_seg3_animindex_03015404),
    door_seg3_animvalue_03015220,
    door_seg3_animindex_03015404,
    0,
);
/// <pygml?v=1.0&h=a5cf2ad19>
// 0x03015458
door_seg3_anim_03015458 = new Animation(
    1,
    0,
    40,
    40,
    0x50,
    ANIMINDEX_NUMPARTS(door_seg3_animindex_03015404),
    door_seg3_animvalue_03015220,
    door_seg3_animindex_03015404,
    0,
);
/// <pygml?v=1.0&h=33ce90014>
// 0x03015470
door_seg3_animvalue_03015470 = [
    0x0000, 0xFED4, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0001, 0x0003, 0x0001, 0x0000, 0xFFF7, 0xFFDF,
    0xFFC1, 0xFFA6, 0xFF98, 0xFF9F, 0xFFC6, 0x0013, 0x00A5, 0x017E,
    0x0281, 0x0395, 0x049C, 0x057C, 0x061A, 0x065A, 0x0650, 0x0629,
    0x05E7, 0x058F, 0x0525, 0x04AE, 0x042D, 0x03A6, 0x031E, 0x0299,
    0x021B, 0x01A8, 0x0144, 0x00F4, 0x00BB, 0x0094, 0x0077, 0x0063,
    0x0056, 0x004F, 0x004F, 0x0053, 0x005C, 0x0067, 0x0074, 0x0083,
    0x0091, 0x009F, 0x00AC, 0x00B6, 0x00BC, 0x00BE, 0x00BB, 0x00B3,
    0x00A8, 0x009A, 0x008A, 0x0078, 0x0066, 0x0053, 0x0040, 0x002E,
    0x001C, 0x000D, 0x0000, 0xFFF9, 0xFFF7, 0xFFF9, 0xFFFA, 0xFFFC,
    0xFFFF, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x05B0, 0x0DAB, 0x101D, 0x1255, 0x16C3, 0x1BA6,
    0x20C9, 0x25F7, 0x2AFB, 0x2FA1, 0x33B5, 0x3700, 0x3983, 0x3B6E,
    0x3CDA, 0x3DDE, 0x3E91, 0x3F0C, 0x3F65, 0x3FB4, 0x3FFF, 0x403B,
    0x4069, 0x4088, 0x4099, 0x409C, 0x4091, 0x4078, 0x4053, 0x4020,
    0x3FE1, 0x3F94, 0x3F3C, 0x3ED7, 0x3E66, 0x3E66, 0x3E66, 0x3E66,
    0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66,
    0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3E66, 0x3CAC,
    0x3AF1, 0x3937, 0x377D, 0x35C2, 0x3408, 0x324E, 0x3093, 0x246E,
    0x1849, 0x0C24, 0x0000, 0x012E, 0x01EB, 0x024D, 0x0268, 0x0214,
    0x0137, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
    0x0000, 0x0000, 0x0001, 0x0003, 0x0001, 0x0000, 0xFFF7, 0xFFDF,
    0xFFC1, 0xFFA5, 0xFF97, 0xFF9E, 0xFFC5, 0x0013, 0x00A6, 0x0180,
    0x0285, 0x039A, 0x04A3, 0x0585, 0x0624, 0x0664, 0x065B, 0x0633,
    0x05F1, 0x0599, 0x052F, 0x04B7, 0x0436, 0x03AE, 0x0326, 0x02A0,
    0x0222, 0x01AE, 0x014A, 0x00FA, 0x00C1, 0x009A, 0x007D, 0x0068,
    0x005B, 0x0055, 0x0055, 0x0059, 0x0062, 0x006D, 0x007A, 0x0089,
    0x0098, 0x00A6, 0x00B2, 0x00BC, 0x00C2, 0x00C4, 0x00C1, 0x00B9,
    0x00AD, 0x009F, 0x008E, 0x007C, 0x0069, 0x0056, 0x0042, 0x002F,
    0x001E, 0x000D, 0x0000, 0xFFF8, 0xFFF6, 0xFFF7, 0xFFF8, 0xFFFB,
    0xFFFE, 0x0000,
];

// 0x03015654
door_seg3_animindex_03015654 = [
    0x0001, 0x0001, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000,
    0x0050, 0x0002, 0x0050, 0x0052, 0x0050, 0x00A2,
    0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000,
    0x0001, 0x0000, 0x0001, 0x0000, 0x0001, 0x0000,
];

// 0x03015690
door_seg3_anim_03015690 = new Animation(
    0,
    0,
    0,
    0,
    0x50,
    ANIMINDEX_NUMPARTS(door_seg3_animindex_03015654),
    door_seg3_animvalue_03015470,
    door_seg3_animindex_03015654,
    0,
);
/// <pygml?v=1.0&h=c12a19d2c>
// 0x030156A8
door_seg3_anim_030156A8 = new Animation(
    1,
    0,
    40,
    40,
    0x50,
    ANIMINDEX_NUMPARTS(door_seg3_animindex_03015654),
    door_seg3_animvalue_03015470,
    door_seg3_animindex_03015654,
    0,
);
/// <pygml?v=1.0&h=75b9ff7ad>
// 0x030156C0
door_seg3_anims_030156C0 = [
    door_seg3_anim_03015208,
    door_seg3_anim_03015440,
    door_seg3_anim_03015690,
    door_seg3_anim_03015458,
    door_seg3_anim_030156A8,
    null,
];

}