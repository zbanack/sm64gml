// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wooden_ship_init() {
// <pygml?v=1.0&h=75d527945>
jrb_seg7_collision_in_sunken_ship_3 = cList(
    COL_INIT(),
    COL_VERTEX_INIT(0x4F),
    COL_VERTEX(-613, 717, -48),
    COL_VERTEX(-716, 1126, -91),
    COL_VERTEX(-716, 717, -48),
    COL_VERTEX(717, 1126, -91),
    COL_VERTEX(-613, 1126, -91),
    COL_VERTEX(-716, 1229, -101),
    COL_VERTEX(-613, 1229, -101),
    COL_VERTEX(-613, 1126, -1330),
    COL_VERTEX(614, 1126, -91),
    COL_VERTEX(614, 1126, -1310),
    COL_VERTEX(-613, 1126, -1310),
    COL_VERTEX(-716, 1331, -1330),
    COL_VERTEX(-613, 1331, -1330),
    COL_VERTEX(717, 1229, -101),
    COL_VERTEX(614, 1126, -1330),
    COL_VERTEX(717, 1331, -1330),
    COL_VERTEX(614, 717, -48),
    COL_VERTEX(-306, 819, 2560),
    COL_VERTEX(-613, 717, 1946),
    COL_VERTEX(-716, 717, 1946),
    COL_VERTEX(-613, 614, -37),
    COL_VERTEX(614, 614, 1946),
    COL_VERTEX(614, 717, 1946),
    COL_VERTEX(717, 717, -48),
    COL_VERTEX(410, 819, 2560),
    COL_VERTEX(410, 1536, -1740),
    COL_VERTEX(512, 1536, -1740),
    COL_VERTEX(307, 1536, -1842),
    COL_VERTEX(-306, 1536, -1842),
    COL_VERTEX(307, 1536, -1945),
    COL_VERTEX(-40, 1024, 3482),
    COL_VERTEX(102, 1024, 2970),
    COL_VERTEX(41, 1126, 3482),
    COL_VERTEX(-101, 717, 3072),
    COL_VERTEX(-101, -101, 2662),
    COL_VERTEX(102, 717, 3072),
    COL_VERTEX(102, 922, 2867),
    COL_VERTEX(307, 819, 2560),
    COL_VERTEX(717, 0, 1946),
    COL_VERTEX(0, -511, 2048),
    COL_VERTEX(0, -306, -1637),
    COL_VERTEX(717, 0, -921),
    COL_VERTEX(410, 307, 2560),
    COL_VERTEX(614, 1229, -1330),
    COL_VERTEX(-409, 1229, -1709),
    COL_VERTEX(-306, 1536, -1945),
    COL_VERTEX(-511, 1536, -1740),
    COL_VERTEX(-409, 1536, -1740),
    COL_VERTEX(-102, -306, -1637),
    COL_VERTEX(307, 717, -1945),
    COL_VERTEX(-306, 717, -1945),
    COL_VERTEX(-101, 922, 2867),
    COL_VERTEX(-101, 1024, 2970),
    COL_VERTEX(-40, 1126, 3482),
    COL_VERTEX(-101, 922, 2970),
    COL_VERTEX(614, 614, -37),
    COL_VERTEX(102, 819, 2867),
    COL_VERTEX(-306, 614, 2560),
    COL_VERTEX(-409, 819, 2560),
    COL_VERTEX(-409, 307, 2560),
    COL_VERTEX(-716, 0, -921),
    COL_VERTEX(0, -511, -921),
    COL_VERTEX(-511, 717, -1740),
    COL_VERTEX(614, 1229, -101),
    COL_VERTEX(614, 1331, -1330),
    COL_VERTEX(-613, 614, 1946),
    COL_VERTEX(307, 614, 2560),
    COL_VERTEX(717, 717, 1946),
    COL_VERTEX(307, 1229, -1811),
    COL_VERTEX(410, 1229, -1709),
    COL_VERTEX(-306, 1229, -1812),
    COL_VERTEX(41, 1024, 3482),
    COL_VERTEX(102, -101, 2662),
    COL_VERTEX(-101, 819, 2867),
    COL_VERTEX(512, 717, -1740),
    COL_VERTEX(-634, 1126, -1310),
    COL_VERTEX(635, 1126, -1310),
    COL_VERTEX(-613, 1229, -1330),
    COL_VERTEX(-716, 0, 1946),
    COL_TRI_INIT(SURFACE_DEFAULT, 140),
    COL_TRI(2, 5, 11),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 3, 1),
    COL_TRI(1, 4, 5),
    COL_TRI(4, 6, 5),
    COL_TRI(6, 4, 7),
    COL_TRI(4, 8, 9),
    COL_TRI(4, 9, 10),
    COL_TRI(11, 5, 6),
    COL_TRI(11, 6, 12),
    COL_TRI(6, 7, 12),
    COL_TRI(8, 13, 63),
    COL_TRI(8, 3, 13),
    COL_TRI(14, 8, 63),
    COL_TRI(13, 15, 64),
    COL_TRI(13, 64, 63),
    COL_TRI(15, 13, 23),
    COL_TRI(14, 63, 64),
    COL_TRI(0, 16, 3),
    COL_TRI(16, 23, 3),
    COL_TRI(17, 18, 19),
    COL_TRI(17, 65, 18),
    COL_TRI(18, 0, 2),
    COL_TRI(19, 18, 2),
    COL_TRI(18, 65, 20),
    COL_TRI(18, 20, 0),
    COL_TRI(0, 20, 16),
    COL_TRI(20, 55, 16),
    COL_TRI(17, 57, 65),
    COL_TRI(17, 19, 58),
    COL_TRI(21, 16, 55),
    COL_TRI(21, 22, 16),
    COL_TRI(22, 21, 66),
    COL_TRI(23, 16, 67),
    COL_TRI(16, 22, 67),
    COL_TRI(15, 26, 25),
    COL_TRI(22, 66, 37),
    COL_TRI(24, 22, 37),
    COL_TRI(24, 67, 22),
    COL_TRI(15, 25, 64),
    COL_TRI(25, 43, 64),
    COL_TRI(26, 27, 25),
    COL_TRI(27, 68, 69),
    COL_TRI(26, 29, 27),
    COL_TRI(27, 69, 25),
    COL_TRI(28, 68, 27),
    COL_TRI(29, 28, 27),
    COL_TRI(25, 69, 43),
    COL_TRI(28, 70, 68),
    COL_TRI(29, 45, 28),
    COL_TRI(30, 32, 53),
    COL_TRI(30, 71, 32),
    COL_TRI(31, 32, 35),
    COL_TRI(32, 71, 35),
    COL_TRI(33, 35, 71),
    COL_TRI(33, 71, 30),
    COL_TRI(34, 72, 35),
    COL_TRI(34, 35, 33),
    COL_TRI(35, 72, 42),
    COL_TRI(33, 30, 53),
    COL_TRI(38, 41, 23),
    COL_TRI(24, 36, 31),
    COL_TRI(24, 37, 36),
    COL_TRI(36, 52, 31),
    COL_TRI(36, 51, 52),
    COL_TRI(37, 56, 36),
    COL_TRI(36, 73, 51),
    COL_TRI(36, 56, 73),
    COL_TRI(31, 35, 24),
    COL_TRI(37, 66, 56),
    COL_TRI(15, 23, 41),
    COL_TRI(42, 38, 24),
    COL_TRI(38, 39, 61),
    COL_TRI(39, 38, 72),
    COL_TRI(38, 42, 72),
    COL_TRI(38, 61, 41),
    COL_TRI(38, 23, 67),
    COL_TRI(40, 74, 41),
    COL_TRI(15, 41, 74),
    COL_TRI(41, 61, 40),
    COL_TRI(35, 42, 24),
    COL_TRI(38, 67, 24),
    COL_TRI(43, 75, 76),
    COL_TRI(43, 77, 75),
    COL_TRI(44, 77, 43),
    COL_TRI(44, 43, 69),
    COL_TRI(44, 69, 68),
    COL_TRI(44, 68, 70),
    COL_TRI(49, 50, 29),
    COL_TRI(45, 46, 47),
    COL_TRI(46, 12, 47),
    COL_TRI(46, 11, 12),
    COL_TRI(12, 44, 47),
    COL_TRI(12, 77, 44),
    COL_TRI(45, 47, 28),
    COL_TRI(47, 70, 28),
    COL_TRI(47, 44, 70),
    COL_TRI(40, 48, 49),
    COL_TRI(48, 50, 49),
    COL_TRI(50, 45, 29),
    COL_TRI(51, 73, 57),
    COL_TRI(51, 58, 52),
    COL_TRI(51, 17, 58),
    COL_TRI(51, 57, 17),
    COL_TRI(52, 54, 53),
    COL_TRI(53, 31, 52),
    COL_TRI(53, 32, 31),
    COL_TRI(55, 65, 21),
    COL_TRI(33, 53, 54),
    COL_TRI(39, 72, 34),
    COL_TRI(54, 52, 58),
    COL_TRI(55, 20, 65),
    COL_TRI(56, 57, 73),
    COL_TRI(57, 66, 21),
    COL_TRI(57, 21, 65),
    COL_TRI(56, 66, 57),
    COL_TRI(49, 74, 40),
    COL_TRI(48, 40, 61),
    COL_TRI(58, 33, 52),
    COL_TRI(58, 59, 33),
    COL_TRI(58, 19, 78),
    COL_TRI(34, 59, 78),
    COL_TRI(59, 34, 33),
    COL_TRI(34, 78, 39),
    COL_TRI(60, 61, 78),
    COL_TRI(61, 39, 78),
    COL_TRI(19, 2, 78),
    COL_TRI(2, 60, 78),
    COL_TRI(58, 78, 59),
    COL_TRI(60, 2, 11),
    COL_TRI(60, 62, 48),
    COL_TRI(62, 60, 11),
    COL_TRI(48, 61, 60),
    COL_TRI(48, 62, 50),
    COL_TRI(45, 50, 46),
    COL_TRI(50, 62, 46),
    COL_TRI(46, 62, 11),
    COL_TRI(15, 74, 26),
    COL_TRI(26, 74, 49),
    COL_TRI(26, 49, 29),
    COL_TRI_STOP(),
    COL_END(),
);


// 0x0700CE5C - 0x0700CEF0
jrb_seg7_collision_in_sunken_ship = cList(
    COL_INIT(),
    COL_VERTEX_INIT(0xA),
    COL_VERTEX(512, 819, -409),
    COL_VERTEX(307, 819, -409),
    COL_VERTEX(307, 819, -255),
    COL_VERTEX(512, 819, -255),
    COL_VERTEX(307, 1024, -101),
    COL_VERTEX(307, 819, -101),
    COL_VERTEX(307, 1024, -409),
    COL_VERTEX(512, 1024, -409),
    COL_VERTEX(512, 819, -101),
    COL_VERTEX(512, 1024, -101),
    COL_TRI_INIT(SURFACE_DEFAULT, 10),
    COL_TRI(4, 5, 1),
    COL_TRI(4, 1, 6),
    COL_TRI(7, 0, 8),
    COL_TRI(7, 8, 9),
    COL_TRI(5, 8, 3),
    COL_TRI(5, 3, 2),
    COL_TRI(6, 9, 4),
    COL_TRI(6, 7, 9),
    COL_TRI(7, 1, 0),
    COL_TRI(7, 6, 1),
    COL_TRI_INIT(SURFACE_WARP, 2),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI_STOP(),
    COL_END(),
);

// This is probably part of the "wooden ship" collision file as the standstill box.
// 0x0700CEF0 - 0x0700CF80
jrb_seg7_collision_0700CEF0 = cList(
    COL_INIT(),
    COL_VERTEX_INIT(0xA),
    COL_VERTEX(307, 1024, -101),
    COL_VERTEX(307, 819, -101),
    COL_VERTEX(307, 819, -409),
    COL_VERTEX(307, 1024, -409),
    COL_VERTEX(512, 1024, -409),
    COL_VERTEX(512, 819, -409),
    COL_VERTEX(512, 819, -101),
    COL_VERTEX(512, 1024, -101),
    COL_VERTEX(512, 819, -306),
    COL_VERTEX(307, 819, -306),
    COL_TRI_INIT(SURFACE_DEFAULT, 12),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI(4, 5, 6),
    COL_TRI(4, 6, 7),
    COL_TRI(1, 6, 8),
    COL_TRI(1, 8, 9),
    COL_TRI(3, 7, 0),
    COL_TRI(3, 4, 7),
    COL_TRI(4, 3, 2),
    COL_TRI(4, 2, 5),
    COL_TRI(5, 9, 8),
    COL_TRI(5, 2, 9),
    COL_TRI_STOP(),
    COL_END(),
);

// 0x0700CF80 - 0x0700D196
jrb_seg7_collision_in_sunken_ship_2 = cList(
    COL_INIT(),
    COL_VERTEX_INIT(0x20),
    COL_VERTEX(-409, 819, 2560),
    COL_VERTEX(-409, 307, 2560),
    COL_VERTEX(-101, 717, 3072),
    COL_VERTEX(-101, 1024, 2970),
    COL_VERTEX(-716, 0, 1946),
    COL_VERTEX(-716, 717, 1946),
    COL_VERTEX(102, 1024, 2970),
    COL_VERTEX(410, 819, 2560),
    COL_VERTEX(717, 1331, -1330),
    COL_VERTEX(717, 717, -101),
    COL_VERTEX(717, 0, -921),
    COL_VERTEX(717, 717, 1946),
    COL_VERTEX(-716, 717, -101),
    COL_VERTEX(717, 1229, -101),
    COL_VERTEX(717, 0, 1946),
    COL_VERTEX(307, 819, -101),
    COL_VERTEX(-716, 0, -921),
    COL_VERTEX(41, 1126, 3482),
    COL_VERTEX(-40, 1024, 3482),
    COL_VERTEX(102, 717, 3072),
    COL_VERTEX(-101, -101, 2662),
    COL_VERTEX(307, 1024, -101),
    COL_VERTEX(0, -511, 2048),
    COL_VERTEX(410, 307, 2560),
    COL_VERTEX(-40, 1126, 3482),
    COL_VERTEX(-716, 1229, -101),
    COL_VERTEX(0, -511, -921),
    COL_VERTEX(512, 819, -101),
    COL_VERTEX(-716, 1331, -1330),
    COL_VERTEX(41, 1024, 3482),
    COL_VERTEX(102, -101, 2662),
    COL_VERTEX(512, 1024, -101),
    COL_TRI_INIT(SURFACE_DEFAULT, 55),
    COL_TRI(8, 9, 10),
    COL_TRI(0, 1, 2),
    COL_TRI(0, 2, 3),
    COL_TRI(0, 4, 1),
    COL_TRI(0, 5, 4),
    COL_TRI(0, 3, 6),
    COL_TRI(7, 0, 6),
    COL_TRI(9, 15, 12),
    COL_TRI(15, 9, 27),
    COL_TRI(12, 25, 28),
    COL_TRI(16, 12, 28),
    COL_TRI(12, 16, 4),
    COL_TRI(5, 12, 4),
    COL_TRI(17, 29, 19),
    COL_TRI(6, 17, 19),
    COL_TRI(2, 29, 18),
    COL_TRI(18, 29, 17),
    COL_TRI(2, 19, 29),
    COL_TRI(19, 30, 23),
    COL_TRI(19, 23, 7),
    COL_TRI(6, 19, 7),
    COL_TRI(20, 30, 19),
    COL_TRI(20, 19, 2),
    COL_TRI(7, 11, 5),
    COL_TRI(7, 5, 0),
    COL_TRI(13, 8, 28),
    COL_TRI(11, 9, 12),
    COL_TRI(8, 13, 9),
    COL_TRI(11, 12, 5),
    COL_TRI(21, 31, 13),
    COL_TRI(13, 31, 27),
    COL_TRI(13, 27, 9),
    COL_TRI(21, 13, 25),
    COL_TRI(13, 28, 25),
    COL_TRI(2, 18, 24),
    COL_TRI(14, 22, 26),
    COL_TRI(14, 26, 10),
    COL_TRI(22, 14, 30),
    COL_TRI(14, 23, 30),
    COL_TRI(14, 10, 9),
    COL_TRI(14, 9, 11),
    COL_TRI(23, 14, 7),
    COL_TRI(14, 11, 7),
    COL_TRI(18, 17, 24),
    COL_TRI(22, 30, 20),
    COL_TRI(24, 17, 6),
    COL_TRI(24, 6, 3),
    COL_TRI(15, 21, 25),
    COL_TRI(25, 12, 15),
    COL_TRI(1, 20, 2),
    COL_TRI(20, 1, 4),
    COL_TRI(2, 24, 3),
    COL_TRI(20, 4, 22),
    COL_TRI(26, 22, 4),
    COL_TRI(16, 26, 4),
    COL_TRI_STOP(),
    COL_END(),
);


/// <pygml?v=1.0&h=cd17c699b>
// 0x070081A8 - 0x070081C0
jrb_seg7_lights_070081A8 = gdSPDefLights1(
    0x1e, 0x2c, 0x3a,
    0x79, 0xb2, 0xeb, 0x28, 0x28, 0x28
);

// 0x070081C0 - 0x070081D8
jrb_seg7_lights_070081C0 = gdSPDefLights1(
    0x3f, 0x3f, 0x3f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x070081D8 - 0x070082C8
jrb_seg7_vertex_070081D8 = vList(
    Vtx([  -726,    307,    102], 0, [ -4118,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    512,   -101], 0, [ -5140,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    307,   -101], 0, [ -5140,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    819,   -716], 0, [ -1052,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,   1024,   -921], 0, [ -2074,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    819,   -921], 0, [ -2074,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,   1024,   -716], 0, [ -1052,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    819,   -204], 0, [   990,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,   1024,   -409], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    819,   -409], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,   1024,   -204], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    307,   -409], 0, [   990,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    512,   -613], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    307,   -613], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    512,   -409], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
);

// 0x070082C8 - 0x070083B8
jrb_seg7_vertex_070082C8 = vList(
    Vtx([  -726,    307,   1638], 0, [   990,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    512,   1434], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    307,   1434], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    307,    102], 0, [ -4118,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    512,    102], 0, [ -4118,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    512,   -101], 0, [ -5140,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    307,    614], 0, [ -4118,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    512,    410], 0, [ -5140,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    307,    410], 0, [ -5140,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    512,    614], 0, [ -4118,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    307,   1126], 0, [   990,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    512,   1126], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    512,    922], 0, [     0,      0], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    307,    922], 0, [     0,    990], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -726,    512,   1638], 0, [   990,      0], [0x81, 0x00, 0x00, 0xff]),
);

// 0x070083B8 - 0x07008478
jrb_seg7_vertex_070083B8 = vList(
    Vtx([  -255,   1075,    -91], 0, [ -1052,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -562,    768,    -91], 0, [ -2074,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -255,    768,    -91], 0, [ -1052,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -562,   1075,    -91], 0, [ -2074,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   256,    768,   -101], 0, [     0,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   307,   1024,   -101], 0, [   138,    138], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   256,   1075,   -101], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   307,    819,   -101], 0, [   138,    820], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   512,   1024,   -101], 0, [   820,    138], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   563,   1075,   -101], 0, [   990,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   512,    819,   -101], 0, [   820,    820], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   563,    768,   -101], 0, [   990,    990], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07008478 - 0x07008578
jrb_seg7_vertex_07008478 = vList(
    Vtx([  -101,   1024,   2970], 0, [ -3334,   -770], [0xd1, 0x69, 0xcc, 0xff]),
    Vtx([  -101,    922,   2970], 0, [ -3372,   -622], [0x93, 0xf4, 0x3f, 0xff]),
    Vtx([   -40,   1126,   3482], 0, [ -4252,   -832], [0x9b, 0x44, 0x21, 0xff]),
    Vtx([   102,   1024,   2970], 0, [ -3252,   -486], [0x00, 0x75, 0xd0, 0xff]),
    Vtx([    41,   1126,   3482], 0, [ -4220,   -718], [0x00, 0x3c, 0x6f, 0xff]),
    Vtx([  -101,      0,   2560], 0, [ -2822,    260], [0x91, 0xd5, 0x2b, 0xff]),
    Vtx([  -101,   -101,   2662], 0, [ -3058,    406], [0xb9, 0xc2, 0x54, 0xff]),
    Vtx([  -101,    717,   3072], 0, [ -3648,   -328], [0x9c, 0xce, 0x3b, 0xff]),
    Vtx([  -101,   -511,   2048], 0, [ -2034,    994], [0xa5, 0xaf, 0x21, 0xff]),
    Vtx([  -101,   -409,   1946], 0, [ -1800,    848], [0x8d, 0xce, 0x0f, 0xff]),
    Vtx([   102,   -101,   2662], 0, [ -2976,    690], [0x00, 0xa4, 0x57, 0xff]),
    Vtx([   102,    717,   3072], 0, [ -3566,    -44], [0x00, 0xb7, 0x67, 0xff]),
    Vtx([    41,   1024,   3482], 0, [ -4260,   -570], [0x00, 0xb6, 0x66, 0xff]),
    Vtx([   -40,   1024,   3482], 0, [ -4292,   -684], [0xd7, 0xdf, 0x73, 0xff]),
    Vtx([  -101,   -511,   -921], 0, [  3662,    994], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([  -101,   -409,   -921], 0, [  3700,    848], [0xa4, 0xa9, 0x00, 0xff]),
);

// 0x07008578 - 0x07008668
jrb_seg7_vertex_07008578 = vList(
    Vtx([  -101,   -511,   2048], 0, [ -2034,    994], [0xa5, 0xaf, 0x21, 0xff]),
    Vtx([   102,   -511,   2048], 0, [ -1954,   1278], [0x00, 0x84, 0x18, 0xff]),
    Vtx([   102,   -101,   2662], 0, [ -2976,    690], [0x00, 0xa4, 0x57, 0xff]),
    Vtx([  -101,   -511,   -921], 0, [  3662,    994], [0xa7, 0xa7, 0x00, 0xff]),
    Vtx([  -101,    922,   2867], 0, [   990,    990], [0x36, 0x3b, 0x9e, 0xff]),
    Vtx([  -306,    819,   2560], 0, [  2522,      0], [0x4a, 0x53, 0xc5, 0xff]),
    Vtx([  -409,    819,   2560], 0, [  2522,   -542], [0xa3, 0x50, 0x1e, 0xff]),
    Vtx([   102,   -511,   -921], 0, [  3742,   1278], [0x00, 0x81, 0x00, 0xff]),
    Vtx([  -716,   1331,  -1330], 0, [  7122,      0], [0xa7, 0x59, 0x07, 0xff]),
    Vtx([  -716,   1229,   -101], 0, [  5078,      0], [0xb9, 0x47, 0x4d, 0xff]),
    Vtx([  -613,   1229,   -101], 0, [  5078,    480], [0x47, 0x47, 0x4d, 0xff]),
    Vtx([  -613,   1331,  -1330], 0, [  7122,    480], [0x59, 0x59, 0x07, 0xff]),
    Vtx([   102,    922,   2867], 0, [   990,   2010], [0x00, 0x30, 0x8b, 0xff]),
    Vtx([  -101,   1024,   2970], 0, [   480,    990], [0xd1, 0x69, 0xcc, 0xff]),
    Vtx([   102,   1024,   2970], 0, [   480,   2010], [0x00, 0x75, 0xd0, 0xff]),
);

// 0x07008668 - 0x070086C8
jrb_seg7_vertex_07008668 = vList(
    Vtx([  -306,    819,   2560], 0, [  2522,      0], [0x4a, 0x53, 0xc5, 0xff]),
    Vtx([  -613,    717,   1946], 0, [  5588,  -1564], [0x57, 0x5a, 0xee, 0xff]),
    Vtx([  -716,    717,   1946], 0, [  5588,  -2076], [0xa8, 0x5a, 0x03, 0xff]),
    Vtx([  -409,    819,   2560], 0, [  2522,   -542], [0xa3, 0x50, 0x1e, 0xff]),
    Vtx([  -716,    717,   -101], 0, [ 15808,  -2076], [0x92, 0x37, 0x1b, 0xff]),
    Vtx([  -613,    717,   -101], 0, [ 15808,  -1564], [0x1d, 0x1d, 0x77, 0xff]),
);

// 0x070086C8 - 0x070087B8
jrb_seg7_vertex_070086C8 = vList(
    Vtx([   563,   1075,   -101], 0, [ 12744,    478], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   717,    717,   -101], 0, [ 14276,   4054], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   717,   1126,   -101], 0, [ 14276,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   256,   1075,   -101], 0, [  9676,    478], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   563,    768,   -101], 0, [ 12744,   3542], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   614,    717,   -101], 0, [ 13256,   4054], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   256,    768,   -101], 0, [  9676,   3542], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   614,    614,   -101], 0, [ 13256,   5076], [0x00, 0x46, 0x69, 0xff]),
    Vtx([  -613,    614,   -101], 0, [   988,   5076], [0x54, 0x2a, 0x54, 0xff]),
    Vtx([  -613,    717,   -101], 0, [   988,   4054], [0x1d, 0x1d, 0x77, 0xff]),
    Vtx([  -716,   1126,   -101], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -716,    717,   -101], 0, [     0,   4054], [0x92, 0x37, 0x1b, 0xff]),
    Vtx([   102,    922,   2867], 0, [   480,      0], [0x00, 0x30, 0x8b, 0xff]),
    Vtx([  -101,    819,   2867], 0, [  1500,    990], [0x1f, 0x1f, 0x8a, 0xff]),
    Vtx([  -101,    922,   2867], 0, [  1500,      0], [0x36, 0x3b, 0x9e, 0xff]),
);

// 0x070087B8 - 0x070088A8
jrb_seg7_vertex_070087B8 = vList(
    Vtx([  -613,   1229,   -101], 0, [  3240,    990], [0x47, 0x47, 0x4d, 0xff]),
    Vtx([  -613,   1126,  -1330], 0, [ -1664,   2010], [0x59, 0x59, 0x00, 0xff]),
    Vtx([  -613,   1331,  -1330], 0, [ -1664,      0], [0x59, 0x59, 0x07, 0xff]),
    Vtx([   102,    922,   2867], 0, [   480,      0], [0x00, 0x30, 0x8b, 0xff]),
    Vtx([   102,    819,   2867], 0, [   480,    990], [0x00, 0x4e, 0x9d, 0xff]),
    Vtx([  -101,    819,   2867], 0, [  1500,    990], [0x1f, 0x1f, 0x8a, 0xff]),
    Vtx([  -101,    922,   2867], 0, [ -7388,    990], [0x36, 0x3b, 0x9e, 0xff]),
    Vtx([  -306,    614,   2560], 0, [ -6160,   4054], [0x3e, 0x59, 0xbf, 0xff]),
    Vtx([  -306,    819,   2560], 0, [ -6160,   2010], [0x4a, 0x53, 0xc5, 0xff]),
    Vtx([  -101,    819,   2867], 0, [ -7388,   2010], [0x1f, 0x1f, 0x8a, 0xff]),
    Vtx([  -613,    614,   1946], 0, [ -3708,   4054], [0x54, 0x5a, 0xe5, 0xff]),
    Vtx([  -613,    717,   1946], 0, [ -3708,   3032], [0x57, 0x5a, 0xee, 0xff]),
    Vtx([  -613,    614,   -101], 0, [  4464,   4054], [0x54, 0x2a, 0x54, 0xff]),
    Vtx([  -613,    717,   -101], 0, [  4464,   3032], [0x1d, 0x1d, 0x77, 0xff]),
    Vtx([  -613,   1126,   -101], 0, [  3240,   2010], [0x49, 0x49, 0x49, 0xff]),
);

// 0x070088A8 - 0x070089A8
jrb_seg7_vertex_070088A8 = vList(
    Vtx([  -409,    307,   2560], 0, [ -6160,   7120], [0x9c, 0xe5, 0x48, 0xff]),
    Vtx([  -101,    922,   2970], 0, [ -7796,    990], [0x93, 0xf4, 0x3f, 0xff]),
    Vtx([  -409,    819,   2560], 0, [ -6160,   2010], [0xa3, 0x50, 0x1e, 0xff]),
    Vtx([  -716,    717,   -101], 0, [  4464,   3032], [0x92, 0x37, 0x1b, 0xff]),
    Vtx([  -716,   1331,  -1330], 0, [  9372,  -3098], [0xa7, 0x59, 0x07, 0xff]),
    Vtx([  -716,    410,   -921], 0, [  7736,   6098], [0x81, 0x00, 0x00, 0xff]),
    Vtx([  -716,    205,   -921], 0, [  7736,   8142], [0x82, 0xf2, 0x00, 0xff]),
    Vtx([  -716,   1229,   -101], 0, [  4464,  -2076], [0xb9, 0x47, 0x4d, 0xff]),
    Vtx([  -716,    717,   1946], 0, [ -3708,   3032], [0xa8, 0x5a, 0x03, 0xff]),
    Vtx([  -716,    205,   1946], 0, [ -3708,   8142], [0x89, 0xe4, 0x1e, 0xff]),
    Vtx([  -306,    102,   2560], 0, [ -6160,   9164], [0xc0, 0xc3, 0x5a, 0xff]),
    Vtx([  -101,      0,   2560], 0, [ -6160,  10186], [0x91, 0xd5, 0x2b, 0xff]),
    Vtx([  -101,   1024,   2970], 0, [ -7796,      0], [0xd1, 0x69, 0xcc, 0xff]),
    Vtx([  -511,   -204,   1946], 0, [ -3708,  12230], [0xaf, 0xa7, 0x26, 0xff]),
    Vtx([  -511,   -204,   -921], 0, [  7736,  12230], [0x9d, 0xb1, 0x00, 0xff]),
    Vtx([  -101,   -409,   -921], 0, [  7736,  14274], [0xa4, 0xa9, 0x00, 0xff]),
);

// 0x070089A8 - 0x07008A98
jrb_seg7_vertex_070089A8 = vList(
    Vtx([  -511,   -204,   1946], 0, [ -3708,  12230], [0xaf, 0xa7, 0x26, 0xff]),
    Vtx([  -101,   -409,   -921], 0, [  7736,  14274], [0xa4, 0xa9, 0x00, 0xff]),
    Vtx([  -101,   -409,   1946], 0, [ -3708,  14274], [0x8d, 0xce, 0x0f, 0xff]),
    Vtx([  -716,    205,   1946], 0, [ -3708,   8142], [0x89, 0xe4, 0x1e, 0xff]),
    Vtx([  -511,   -204,   -921], 0, [  7736,  12230], [0x9d, 0xb1, 0x00, 0xff]),
    Vtx([  -101,      0,   2560], 0, [ -6160,  10186], [0x91, 0xd5, 0x2b, 0xff]),
    Vtx([  -409,    307,   2560], 0, [ -6160,   7120], [0x9c, 0xe5, 0x48, 0xff]),
    Vtx([  -306,    102,   2560], 0, [ -6160,   9164], [0xc0, 0xc3, 0x5a, 0xff]),
    Vtx([  -716,    205,   -921], 0, [  7736,   8142], [0x82, 0xf2, 0x00, 0xff]),
    Vtx([  -409,    819,   2560], 0, [ -6160,   2010], [0xa3, 0x50, 0x1e, 0xff]),
    Vtx([  -716,    717,   1946], 0, [ -3708,   3032], [0xa8, 0x5a, 0x03, 0xff]),
    Vtx([  -613,   1229,   -101], 0, [   988,  -1054], [0x47, 0x47, 0x4d, 0xff]),
    Vtx([  -716,   1229,   -101], 0, [     0,  -1054], [0xb9, 0x47, 0x4d, 0xff]),
    Vtx([  -716,   1126,   -101], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -613,   1126,   -101], 0, [   988,      0], [0x49, 0x49, 0x49, 0xff]),
);

// 0x07008A98 - 0x07008AC8
jrb_seg7_vertex_07008A98 = vList(
    Vtx([   256,   1075,   -101], 0, [  9676,    478], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   717,   1126,   -101], 0, [ 14276,      0], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -716,   1126,   -101], 0, [     0,      0], [0x00, 0x00, 0x7f, 0xff]),
);

// 0x07008AC8 - 0x07008B88
jrb_seg7_vertex_07008AC8 = vList(
    Vtx([   614,   1126,   -101], 0, [ 10188,   3544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   614,   1126,  -1330], 0, [ 14276,   3544], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -613,   1126,  -1330], 0, [ 14276,  -2586], [0x59, 0x59, 0x00, 0xff]),
    Vtx([  -613,   1126,   -101], 0, [ 10188,  -2586], [0x49, 0x49, 0x49, 0xff]),
    Vtx([   614,    614,   -101], 0, [  -540,    478], [0x00, 0x46, 0x69, 0xff]),
    Vtx([  -613,    614,   1946], 0, [  9676,   6610], [0x54, 0x5a, 0xe5, 0xff]),
    Vtx([   614,    614,   1946], 0, [  9676,    480], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([  -613,    614,   -101], 0, [  -540,   6608], [0x54, 0x2a, 0x54, 0xff]),
    Vtx([   102,    819,   2867], 0, [ 14276,   3032], [0x00, 0x4e, 0x9d, 0xff]),
    Vtx([  -306,    614,   2560], 0, [ 12744,   5076], [0x3e, 0x59, 0xbf, 0xff]),
    Vtx([  -101,    819,   2867], 0, [ 14276,   4054], [0x1f, 0x1f, 0x8a, 0xff]),
    Vtx([   307,    614,   2560], 0, [ 12744,   2010], [0x00, 0x79, 0xdc, 0xff]),
);

// 0x07008B88 - 0x07008C90
jrb_seg7_dl_07008B88 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09005800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(jrb_seg7_lights_070081A8.l[0], 1),
    gsSPLight(jrb_seg7_lights_070081A8.a, 2),
    gsSPVertex(jrb_seg7_vertex_070081D8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(jrb_seg7_vertex_070082C8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPVertex(jrb_seg7_vertex_070083B8, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 5,  8,  9, 0x0,  5,  9,  6, 0x0),
    gsSP2Triangles( 8, 10, 11, 0x0,  8, 11,  9, 0x0),
    gsSP2Triangles( 4, 11, 10, 0x0,  4, 10,  7, 0x0),
    gsSPEndDisplayList(),
);

// 0x07008C90 - 0x07008DD0
jrb_seg7_dl_07008C90 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09000000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(jrb_seg7_lights_070081C0.l[0], 1),
    gsSPLight(jrb_seg7_lights_070081C0.a, 2),
    gsSPVertex(jrb_seg7_vertex_07008478, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  2,  3,  0, 0x0),
    gsSP2Triangles( 2,  4,  3, 0x0,  5,  6,  7, 0x0),
    gsSP2Triangles( 5,  8,  6, 0x0,  5,  9,  8, 0x0),
    gsSP2Triangles( 5,  7,  1, 0x0,  6, 10, 11, 0x0),
    gsSP2Triangles( 8, 10,  6, 0x0,  6, 11,  7, 0x0),
    gsSP2Triangles( 7, 12, 13, 0x0,  7, 11, 12, 0x0),
    gsSP2Triangles( 7,  2,  1, 0x0,  7, 13,  2, 0x0),
    gsSP2Triangles(13,  4,  2, 0x0, 13, 12,  4, 0x0),
    gsSP2Triangles( 9, 14,  8, 0x0,  9, 15, 14, 0x0),
    gsSPVertex(jrb_seg7_vertex_07008578, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  1,  0,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  1,  3,  7, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(12,  4, 13, 0x0, 12, 13, 14, 0x0),
    gsSP1Triangle( 4,  6, 13, 0x0),
    gsSPVertex(jrb_seg7_vertex_07008668, 6, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 1,  4,  2, 0x0,  1,  5,  4, 0x0),
    gsSPEndDisplayList(),
);

// 0x07008DD0 - 0x07008F70
jrb_seg7_dl_07008DD0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09000800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(jrb_seg7_vertex_070086C8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 0,  4,  1, 0x0,  4,  5,  1, 0x0),
    gsSP2Triangles( 4,  6,  7, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 6,  8,  7, 0x0,  6,  3,  9, 0x0),
    gsSP2Triangles( 6,  9,  8, 0x0, 10, 11,  9, 0x0),
    gsSP2Triangles( 3, 10,  9, 0x0, 12, 13, 14, 0x0),
    gsSPVertex(jrb_seg7_vertex_070087B8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles( 8,  7, 10, 0x0,  8, 10, 11, 0x0),
    gsSP2Triangles(11, 10, 12, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle( 0, 14,  1, 0x0),
    gsSPVertex(jrb_seg7_vertex_070088A8, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  3,  7,  4, 0x0),
    gsSP2Triangles( 8,  3,  6, 0x0,  8,  6,  9, 0x0),
    gsSP2Triangles(10,  1,  0, 0x0, 10, 11,  1, 0x0),
    gsSP2Triangles( 1, 12,  2, 0x0, 10, 13, 11, 0x0),
    gsSP1Triangle(13, 14, 15, 0x0),
    gsSPVertex(jrb_seg7_vertex_070089A8, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  0, 0x0),
    gsSP2Triangles( 0,  2,  5, 0x0,  6,  0,  7, 0x0),
    gsSP2Triangles( 6,  3,  0, 0x0,  3,  8,  4, 0x0),
    gsSP2Triangles( 9,  3,  6, 0x0,  9, 10,  3, 0x0),
    gsSP2Triangles(11, 12, 13, 0x0, 11, 13, 14, 0x0),
    gsSPVertex(jrb_seg7_vertex_07008A98, 3, 0),
    gsSP1Triangle( 0,  1,  2, 0x0),
    gsSPEndDisplayList(),
);

// 0x07008F70 - 0x07008FD8
jrb_seg7_dl_07008F70 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_0900A800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(jrb_seg7_vertex_07008AC8, 12, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  9, 10, 0x0,  9,  6,  5, 0x0),
    gsSP2Triangles( 9, 11,  6, 0x0,  8, 11,  9, 0x0),
    gsSPEndDisplayList(),
);

// 0x07008FD8 - 0x070090B0
jrb_seg7_dl_07008FD8 = dList(
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_2CYCLE),
    gsDPSetRenderMode(G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2),
    //gsDPSetDepthSource(G_ZS_PIXEL),
    //gsDPSetFogColor(5, 80, 75, 255),
    //gsSPFogPosition(900, 1000),
    gsSPSetGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_PASS2),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_07008B88),
    gsSPDisplayList(jrb_seg7_dl_07008C90),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_07008DD0),
    gsSPDisplayList(jrb_seg7_dl_07008F70),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2),
    gsSPClearGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);

// 0x070090B0 - 0x07009190
jrb_seg7_dl_070090B0 = dList(
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_2CYCLE),
    gsDPSetRenderMode(G_RM_FOG_SHADE_A, G_RM_AA_ZB_XLU_SURF2),
    //gsDPSetDepthSource(G_ZS_PIXEL),
    //gsDPSetFogColor(5, 80, 75, 255),
    //gsSPFogPosition(900, 1000),
    gsSPSetGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_MODULATERGBFADE, G_CC_PASS2),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_07008B88),
    gsSPDisplayList(jrb_seg7_dl_07008C90),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_07008DD0),
    gsSPDisplayList(jrb_seg7_dl_07008F70),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(G_RM_AA_ZB_XLU_SURF, G_RM_NOOP2),
    gsSPClearGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsSPEndDisplayList(),
);

// 0x07009190 - 0x070091A8
jrb_seg7_lights_07009190 = gdSPDefLights1(
    0x1e, 0x2c, 0x3a,
    0x79, 0xb2, 0xeb, 0x28, 0x28, 0x28
);

// 0x070091A8 - 0x070091C0
jrb_seg7_lights_070091A8 = gdSPDefLights1(
    0x19, 0x2c, 0x3f,
    0x65, 0xb2, 0xff, 0x28, 0x28, 0x28
);

// 0x070091C0 - 0x070091D8
jrb_seg7_lights_070091C0 = gdSPDefLights1(
    0x3f, 0x3f, 0x3f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x070091D8 - 0x07009218
jrb_seg7_vertex_070091D8 = vList(
    Vtx([  -679,   1024,  -1426], 0, [   990,      0], [0x8f, 0x00, 0xc8, 0xff]),
    Vtx([  -588,    819,  -1610], 0, [     0,    990], [0x8f, 0x00, 0xc8, 0xff]),
    Vtx([  -679,    819,  -1426], 0, [   990,    990], [0x8f, 0x00, 0xc8, 0xff]),
    Vtx([  -588,   1024,  -1610], 0, [     0,      0], [0x8f, 0x00, 0xc8, 0xff]),
);

// 0x07009218 - 0x07009258
jrb_seg7_vertex_07009218 = vList(
    Vtx([  -204,   1024,  -1955], 0, [  2012,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   205,   1024,  -1955], 0, [     0,      0], [0x00, 0x00, 0x81, 0xff]),
    Vtx([   205,    819,  -1955], 0, [     0,    990], [0x00, 0x00, 0x81, 0xff]),
    Vtx([  -204,    819,  -1955], 0, [  2012,    990], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07009258 - 0x07009358
jrb_seg7_vertex_07009258 = vList(
    Vtx([   103,   -306,  -1637], 0, [  5196,    984], [0x00, 0xcf, 0x8c, 0xff]),
    Vtx([  -101,   -306,  -1637], 0, [  5114,    700], [0x94, 0xcd, 0xd7, 0xff]),
    Vtx([  -101,    512,  -1637], 0, [  5466,   -622], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  -511,   1536,  -1740], 0, [  8144,    990], [0xad, 0x5c, 0xe9, 0xff]),
    Vtx([  -716,   1331,  -1330], 0, [  7122,      0], [0x8e, 0x36, 0x00, 0xff]),
    Vtx([  -613,   1331,  -1330], 0, [  7122,    480], [0x49, 0x49, 0x49, 0xff]),
    Vtx([  -306,   1536,  -1945], 0, [  8656,   2010], [0xd5, 0x5c, 0xb6, 0xff]),
    Vtx([  -409,   1536,  -1740], 0, [  8144,   1500], [0x43, 0x54, 0x43, 0xff]),
    Vtx([  -306,   1536,  -1842], 0, [  8400,   2010], [0x15, 0x5c, 0x53, 0xff]),
    Vtx([   307,   1536,  -1945], 0, [  8656,   5076], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([   307,   1536,  -1842], 0, [  8400,   5076], [0x00, 0x59, 0x59, 0xff]),
    Vtx([  -101,   -409,   -921], 0, [  3700,    848], [0x8a, 0xd8, 0xec, 0xff]),
    Vtx([  -101,   -511,   -921], 0, [  3662,    994], [0xa7, 0xaa, 0xe8, 0xff]),
    Vtx([  -101,   -204,  -1330], 0, [  4564,    554], [0xa1, 0xc0, 0xcb, 0xff]),
    Vtx([   102,   -511,   -921], 0, [  3742,   1278], [0x00, 0x86, 0xde, 0xff]),
    Vtx([   102,    512,  -1637], 0, [  5548,   -338], [0x00, 0x00, 0x81, 0xff]),
);

// 0x07009358 - 0x070093A8
jrb_seg7_vertex_07009358 = vList(
    Vtx([  -101,   -306,  -1637], 0, [   478,   1328], [0x94, 0xcd, 0xd7, 0xff]),
    Vtx([  -101,   -204,  -1330], 0, [  1160,   1442], [0xa1, 0xc0, 0xcb, 0xff]),
    Vtx([  -101,    205,  -1535], 0, [  1500,    308], [0x9f, 0xe8, 0xb3, 0xff]),
    Vtx([  -101,    512,  -1637], 0, [  1842,   -486], [0xa7, 0x00, 0xa7, 0xff]),
    Vtx([  -101,    410,  -1535], 0, [  1842,   -146], [0xc8, 0x00, 0x8f, 0xff]),
);

// 0x070093A8 - 0x07009488
jrb_seg7_vertex_070093A8 = vList(
    Vtx([   614,   1229,  -1330], 0, [  3648,    990], [0x00, 0x59, 0x59, 0xff]),
    Vtx([  -613,   1126,  -1330], 0, [ -1256,   2010], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   614,   1126,  -1330], 0, [  3648,   2010], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([  -613,   1229,  -1330], 0, [ -1256,    990], [0x39, 0x40, 0x5d, 0xff]),
    Vtx([  -409,   1536,  -1740], 0, [  -540,      0], [0x43, 0x54, 0x43, 0xff]),
    Vtx([  -306,   1229,  -1842], 0, [     0,   3032], [0x3c, 0x2a, 0x67, 0xff]),
    Vtx([  -306,   1536,  -1842], 0, [     0,      0], [0x15, 0x5c, 0x53, 0xff]),
    Vtx([   307,   1229,  -1842], 0, [  3036,   3032], [0x00, 0x59, 0x59, 0xff]),
    Vtx([   307,   1536,  -1842], 0, [  3036,      0], [0x00, 0x59, 0x59, 0xff]),
    Vtx([  -409,   1229,  -1740], 0, [  -540,   3032], [0x3f, 0x66, 0x28, 0xff]),
    Vtx([  -613,   1331,  -1330], 0, [ -1664,      0], [0x49, 0x49, 0x49, 0xff]),
    Vtx([  -613,   1229,  -1330], 0, [ -1664,    990], [0x39, 0x40, 0x5d, 0xff]),
    Vtx([  -409,   1229,  -1740], 0, [ -3300,    990], [0x3f, 0x66, 0x28, 0xff]),
    Vtx([  -409,   1536,  -1740], 0, [ -3300,  -2076], [0x43, 0x54, 0x43, 0xff]),
);

// 0x07009488 - 0x07009588
jrb_seg7_vertex_07009488 = vList(
    Vtx([   307,    717,  -1945], 0, [  -540,   8142], [0x00, 0xb6, 0x9a, 0xff]),
    Vtx([   307,    410,  -1535], 0, [  -540,  11208], [0x00, 0x9b, 0xb4, 0xff]),
    Vtx([  -306,    410,  -1535], 0, [  2524,  11208], [0xd6, 0xb8, 0xa1, 0xff]),
    Vtx([  -716,    614,  -1330], 0, [  9372,   4054], [0x90, 0xdd, 0xd2, 0xff]),
    Vtx([  -511,    717,  -1740], 0, [ 11004,   3032], [0xa6, 0xd3, 0xb4, 0xff]),
    Vtx([  -511,    410,  -1330], 0, [  9372,   6098], [0x9f, 0xda, 0xba, 0xff]),
    Vtx([  -306,    410,  -1535], 0, [ 10188,   6098], [0xd6, 0xb8, 0xa1, 0xff]),
    Vtx([  -306,    717,  -1945], 0, [ 11824,   3032], [0xdc, 0xd4, 0x8f, 0xff]),
    Vtx([  -306,   1536,  -1945], 0, [ 11824,  -5142], [0xd5, 0x5c, 0xb6, 0xff]),
    Vtx([  -511,   1536,  -1740], 0, [ 11004,  -5142], [0xad, 0x5c, 0xe9, 0xff]),
    Vtx([  -306,    307,  -1535], 0, [ 10188,   7120], [0xce, 0xee, 0x8d, 0xff]),
    Vtx([  -306,    717,  -1945], 0, [  2524,   8142], [0xdc, 0xd4, 0x8f, 0xff]),
    Vtx([  -306,   -101,  -1330], 0, [  2524,  16318], [0xc7, 0xbc, 0xa6, 0xff]),
    Vtx([  -306,    307,  -1535], 0, [  2524,  12230], [0xce, 0xee, 0x8d, 0xff]),
    Vtx([  -101,    205,  -1535], 0, [  1500,  13252], [0x9f, 0xe8, 0xb3, 0xff]),
    Vtx([  -101,    410,  -1535], 0, [  1500,  11208], [0xc8, 0x00, 0x8f, 0xff]),
);

// 0x07009588 - 0x07009688
jrb_seg7_vertex_07009588 = vList(
    Vtx([  -716,    205,   -921], 0, [  7736,   8142], [0x90, 0xef, 0xc8, 0xff]),
    Vtx([  -716,    410,   -921], 0, [  7736,   6098], [0x8b, 0xe2, 0xdd, 0xff]),
    Vtx([  -511,    410,  -1330], 0, [  9372,   6098], [0x9f, 0xda, 0xba, 0xff]),
    Vtx([  -716,    614,  -1330], 0, [  9372,   4054], [0x90, 0xdd, 0xd2, 0xff]),
    Vtx([  -716,   1331,  -1330], 0, [  9372,  -3098], [0x8e, 0x36, 0x00, 0xff]),
    Vtx([  -511,   1536,  -1740], 0, [ 11004,  -5142], [0xad, 0x5c, 0xe9, 0xff]),
    Vtx([  -101,    205,  -1535], 0, [  1500,  13252], [0x9f, 0xe8, 0xb3, 0xff]),
    Vtx([  -306,    307,  -1535], 0, [  2524,  12230], [0xce, 0xee, 0x8d, 0xff]),
    Vtx([  -101,    410,  -1535], 0, [  1500,  11208], [0xc8, 0x00, 0x8f, 0xff]),
    Vtx([   307,    717,  -1945], 0, [  -540,   8142], [0x00, 0xb6, 0x9a, 0xff]),
    Vtx([  -306,    717,  -1945], 0, [  2524,   8142], [0xdc, 0xd4, 0x8f, 0xff]),
    Vtx([   307,   1536,  -1945], 0, [  -540,      0], [0x00, 0x59, 0xa7, 0xff]),
    Vtx([  -306,   -101,  -1330], 0, [  2524,  16318], [0xc7, 0xbc, 0xa6, 0xff]),
    Vtx([  -101,   -204,  -1330], 0, [  1500,  17340], [0xa1, 0xc0, 0xcb, 0xff]),
    Vtx([  -306,    307,  -1535], 0, [ 10188,   7120], [0xce, 0xee, 0x8d, 0xff]),
    Vtx([  -511,    205,  -1330], 0, [  9372,   8142], [0x9f, 0xdf, 0xb7, 0xff]),
);

// 0x07009688 - 0x07009738
jrb_seg7_vertex_07009688 = vList(
    Vtx([  -511,    205,  -1330], 0, [  9372,   8142], [0x9f, 0xdf, 0xb7, 0xff]),
    Vtx([  -306,    307,  -1535], 0, [ 10188,   7120], [0xce, 0xee, 0x8d, 0xff]),
    Vtx([  -306,   -101,  -1330], 0, [  9372,  11208], [0xc7, 0xbc, 0xa6, 0xff]),
    Vtx([  -716,    205,   -921], 0, [  7736,   8142], [0x90, 0xef, 0xc8, 0xff]),
    Vtx([  -511,    410,  -1330], 0, [  9372,   6098], [0x9f, 0xda, 0xba, 0xff]),
    Vtx([  -511,   -204,   -921], 0, [  7736,  12230], [0xb3, 0xad, 0xc8, 0xff]),
    Vtx([  -101,   -204,  -1330], 0, [  9372,  12230], [0xa1, 0xc0, 0xcb, 0xff]),
    Vtx([  -101,   -409,   -921], 0, [  7736,  14274], [0x8a, 0xd8, 0xec, 0xff]),
    Vtx([  -306,    717,  -1945], 0, [  2524,   8142], [0xdc, 0xd4, 0x8f, 0xff]),
    Vtx([  -306,   1536,  -1945], 0, [  2524,      0], [0xd5, 0x5c, 0xb6, 0xff]),
    Vtx([   307,   1536,  -1945], 0, [  -540,      0], [0x00, 0x59, 0xa7, 0xff]),
);

// 0x07009738 - 0x07009798
jrb_seg7_vertex_07009738 = vList(
    Vtx([  -409,   1229,  -1740], 0, [ 16320,  -1566], [0x3f, 0x66, 0x28, 0xff]),
    Vtx([  -613,   1229,  -1330], 0, [ 14276,  -2586], [0x39, 0x40, 0x5d, 0xff]),
    Vtx([   614,   1229,  -1330], 0, [ 14276,   3544], [0x00, 0x59, 0x59, 0xff]),
    Vtx([   410,   1229,  -1740], 0, [ 16320,   2520], [0x00, 0x7f, 0x00, 0xff]),
    Vtx([   307,   1229,  -1842], 0, [ 16832,   2010], [0x00, 0x59, 0x59, 0xff]),
    Vtx([  -306,   1229,  -1842], 0, [ 16832,  -1054], [0x3c, 0x2a, 0x67, 0xff]),
);

// 0x07009798 - 0x07009808
jrb_seg7_dl_07009798 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09005800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(jrb_seg7_lights_07009190.l[0], 1),
    gsSPLight(jrb_seg7_lights_07009190.a, 2),
    gsSPVertex(jrb_seg7_vertex_070091D8, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSPLight(jrb_seg7_lights_070091A8.l[0], 1),
    gsSPLight(jrb_seg7_lights_070091A8.a, 2),
    gsSPVertex(jrb_seg7_vertex_07009218, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x07009808 - 0x070098C0
jrb_seg7_dl_07009808 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09000000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(jrb_seg7_lights_070091C0.l[0], 1),
    gsSPLight(jrb_seg7_lights_070091C0.a, 2),
    gsSPVertex(jrb_seg7_vertex_07009258, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  3,  7, 0x0,  3,  5,  7, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9,  6,  8, 0x0),
    gsSP2Triangles( 9,  8, 10, 0x0, 11,  1, 12, 0x0),
    gsSP2Triangles(11, 13,  1, 0x0, 14,  1,  0, 0x0),
    gsSP2Triangles(14, 12,  1, 0x0,  0,  2, 15, 0x0),
    gsSPVertex(jrb_seg7_vertex_07009358, 5, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP1Triangle( 2,  4,  3, 0x0),
    gsSPEndDisplayList(),
);

// 0x070098C0 - 0x07009A10
jrb_seg7_dl_070098C0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09000800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(jrb_seg7_vertex_070093A8, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  6,  5,  7, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  4,  9,  5, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 12, 13, 0x0),
    gsSPVertex(jrb_seg7_vertex_07009488, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 5,  4,  6, 0x0,  4,  7,  6, 0x0),
    gsSP2Triangles( 8,  7,  4, 0x0,  9,  4,  3, 0x0),
    gsSP2Triangles( 8,  4,  9, 0x0, 10,  5,  6, 0x0),
    gsSP2Triangles(11,  0,  2, 0x0, 12, 13, 14, 0x0),
    gsSP1Triangle(13,  2, 15, 0x0),
    gsSPVertex(jrb_seg7_vertex_07009588, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  1,  3,  2, 0x0),
    gsSP2Triangles( 4,  3,  1, 0x0,  5,  3,  4, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles(12,  6, 13, 0x0, 14, 15,  2, 0x0),
    gsSPVertex(jrb_seg7_vertex_07009688, 11, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  4, 0x0),
    gsSP2Triangles( 3,  0,  5, 0x0,  0,  2,  5, 0x0),
    gsSP2Triangles( 5,  2,  6, 0x0,  5,  6,  7, 0x0),
    gsSP1Triangle( 8,  9, 10, 0x0),
    gsSPEndDisplayList(),
);

// 0x07009A10 - 0x07009A58
jrb_seg7_dl_07009A10 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_0900A800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(jrb_seg7_vertex_07009738, 6, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 0,  4,  5, 0x0,  0,  3,  4, 0x0),
    gsSPEndDisplayList(),
);

// 0x07009A58 - 0x07009B30
jrb_seg7_dl_07009A58 = dList(
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_2CYCLE),
    gsDPSetRenderMode(G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2),
    //gsDPSetDepthSource(G_ZS_PIXEL),
    //gsDPSetFogColor(5, 80, 75, 255),
    //gsSPFogPosition(900, 1000),
    gsSPSetGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_PASS2),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_07009798),
    gsSPDisplayList(jrb_seg7_dl_07009808),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_070098C0),
    gsSPDisplayList(jrb_seg7_dl_07009A10),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2),
    gsSPClearGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);

// 0x07009B30 - 0x07009C10
jrb_seg7_dl_07009B30 = dList(
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_2CYCLE),
    gsDPSetRenderMode(G_RM_FOG_SHADE_A, G_RM_AA_ZB_XLU_SURF2),
    //gsDPSetDepthSource(G_ZS_PIXEL),
    //gsDPSetFogColor(5, 80, 75, 255),
    //gsSPFogPosition(900, 1000),
    gsSPSetGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_MODULATERGBFADE, G_CC_PASS2),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_07009798),
    gsSPDisplayList(jrb_seg7_dl_07009808),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_070098C0),
    gsSPDisplayList(jrb_seg7_dl_07009A10),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(G_RM_AA_ZB_XLU_SURF, G_RM_NOOP2),
    gsSPClearGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsDPSetEnvColor(255, 255, 255, 255),
    gsSPEndDisplayList(),
);

// 0x07009C10 - 0x07009C28
jrb_seg7_lights_07009C10 = gdSPDefLights1(
    0x1e, 0x2c, 0x3a,
    0x79, 0xb2, 0xeb, 0x28, 0x28, 0x28
);

// 0x07009C28 - 0x07009C40
jrb_seg7_lights_07009C28 = gdSPDefLights1(
    0x3f, 0x3f, 0x3f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x07009C40 - 0x07009C58
jrb_seg7_lights_07009C40 = gdSPDefLights1(
    0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x28, 0x28, 0x28
);

// 0x07009C58 - 0x07009D48
jrb_seg7_vertex_07009C58 = vList(
    Vtx([   727,    307,   -613], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    512,   -613], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    512,   -409], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    819,   -409], 0, [ -1052,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,   1024,   -409], 0, [ -1052,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,   1024,   -204], 0, [ -2074,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    819,   -204], 0, [ -2074,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    819,   -921], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,   1024,   -716], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    819,   -716], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,   1024,   -921], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    307,   1434], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    512,   1638], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    307,   1638], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    512,   1434], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07009D48 - 0x07009E38
jrb_seg7_vertex_07009D48 = vList(
    Vtx([   727,    307,    410], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    512,    410], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    512,    614], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    307,   -613], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    512,   -409], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    307,   -409], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    307,   -101], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    512,    102], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    307,    102], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    512,   -101], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    307,    922], 0, [   990,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    512,   1126], 0, [     0,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    307,   1126], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    512,    922], 0, [   990,      0], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   727,    307,    614], 0, [     0,    990], [0x7f, 0x00, 0x00, 0xff]),
);

// 0x07009E38 - 0x07009F38
jrb_seg7_vertex_07009E38 = vList(
    Vtx([   410,    819,   2560], 0, [  2524,   3542], [0x50, 0x60, 0x15, 0xff]),
    Vtx([   717,    717,   1946], 0, [  5590,   5076], [0x43, 0x6a, 0x0a, 0xff]),
    Vtx([   614,    717,   1946], 0, [  5590,   4564], [0xad, 0x58, 0xdc, 0xff]),
    Vtx([    41,   1126,   3482], 0, [ -4220,   -718], [0x7e, 0x02, 0x0f, 0xff]),
    Vtx([    41,   1024,   3482], 0, [ -4260,   -570], [0x7d, 0x00, 0x12, 0xff]),
    Vtx([   102,    717,   3072], 0, [ -3566,    -44], [0x7e, 0x02, 0x0a, 0xff]),
    Vtx([   102,    922,   2970], 0, [ -3292,   -338], [0x71, 0xf5, 0x37, 0xff]),
    Vtx([   102,   -101,   2662], 0, [ -2976,    690], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   1024,   2970], 0, [ -3252,   -486], [0x72, 0x35, 0x06, 0xff]),
    Vtx([   102,      0,   2560], 0, [ -2740,    544], [0x5d, 0xc3, 0x3c, 0xff]),
    Vtx([   102,    922,   2867], 0, [   990,   2010], [0xc2, 0x50, 0xb5, 0xff]),
    Vtx([   102,   1024,   2970], 0, [   480,   2010], [0x72, 0x35, 0x06, 0xff]),
    Vtx([   307,    819,   2560], 0, [  2524,   3032], [0xab, 0x40, 0xbc, 0xff]),
    Vtx([   614,    717,   -101], 0, [ 15810,   4566], [0xa7, 0x59, 0x00, 0xff]),
    Vtx([   717,    717,   -101], 0, [ 15810,   5076], [0x7c, 0x18, 0x00, 0xff]),
    Vtx([   102,   -409,   1946], 0, [ -1718,   1130], [0x6c, 0xc0, 0x0c, 0xff]),
);

// 0x07009F38 - 0x07009FC8
jrb_seg7_vertex_07009F38 = vList(
    Vtx([   102,   -101,   2662], 0, [ -2976,    690], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   -511,   2048], 0, [ -1954,   1278], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   102,   -409,   1946], 0, [ -1718,   1130], [0x6c, 0xc0, 0x0c, 0xff]),
    Vtx([   102,   -409,   -921], 0, [  3782,   1130], [0x77, 0xd5, 0x00, 0xff]),
    Vtx([   102,   -511,   -921], 0, [  3742,   1278], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   717,   1229,   -101], 0, [  5078,   7120], [0x28, 0x51, 0x58, 0xff]),
    Vtx([   717,   1331,  -1330], 0, [  7122,   7120], [0x71, 0x38, 0x04, 0xff]),
    Vtx([   614,   1331,  -1330], 0, [  7122,   6610], [0xa7, 0x59, 0x07, 0xff]),
    Vtx([   614,   1229,   -101], 0, [  5078,   6610], [0xb9, 0x47, 0x4d, 0xff]),
);

// 0x07009FC8 - 0x0700A048
jrb_seg7_vertex_07009FC8 = vList(
    Vtx([   512,   1024,   -306], 0, [  5284,      0], [0xac, 0xd6, 0x54, 0xff]),
    Vtx([   512,    819,   -306], 0, [  5284,   2010], [0xcd, 0x67, 0x33, 0xff]),
    Vtx([   512,    819,   -101], 0, [  4464,   2010], [0x8f, 0x38, 0x00, 0xff]),
    Vtx([   307,    819,   -306], 0, [  5284,   2010], [0x54, 0x2a, 0x54, 0xff]),
    Vtx([   307,   1024,   -306], 0, [  5284,      0], [0x33, 0x99, 0x33, 0xff]),
    Vtx([   512,   1024,   -101], 0, [  4464,      0], [0xc8, 0x8f, 0x00, 0xff]),
    Vtx([   307,   1024,   -101], 0, [  4464,      0], [0x71, 0xc8, 0x00, 0xff]),
    Vtx([   307,    819,   -101], 0, [  4464,   2010], [0x38, 0x71, 0x00, 0xff]),
);

// 0x0700A048 - 0x0700A128
jrb_seg7_vertex_0700A048 = vList(
    Vtx([   717,   1229,   -101], 0, [  5692,      0], [0x28, 0x51, 0x58, 0xff]),
    Vtx([   614,   1126,   -101], 0, [  5284,    990], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   717,   1126,   -101], 0, [  5692,    990], [0x00, 0x00, 0x7f, 0xff]),
    Vtx([   614,   1229,   -101], 0, [  5284,      0], [0xb9, 0x47, 0x4d, 0xff]),
    Vtx([   410,    307,   2560], 0, [ -6160,   7120], [0x63, 0xeb, 0x4c, 0xff]),
    Vtx([   102,    922,   2970], 0, [ -7796,    990], [0x71, 0xf5, 0x37, 0xff]),
    Vtx([   307,    102,   2560], 0, [ -6160,   9164], [0x48, 0xc4, 0x54, 0xff]),
    Vtx([   410,    819,   2560], 0, [ -6160,   2010], [0x50, 0x60, 0x15, 0xff]),
    Vtx([   102,      0,   2560], 0, [ -6160,  10186], [0x5d, 0xc3, 0x3c, 0xff]),
    Vtx([   102,   1024,   2970], 0, [ -7796,      0], [0x72, 0x35, 0x06, 0xff]),
    Vtx([   614,    717,   1946], 0, [ -3708,   3032], [0xad, 0x58, 0xdc, 0xff]),
    Vtx([   307,    614,   2560], 0, [ -6160,   4054], [0x91, 0x00, 0xc3, 0xff]),
    Vtx([   307,    819,   2560], 0, [ -6160,   2010], [0xab, 0x40, 0xbc, 0xff]),
    Vtx([   102,    819,   2867], 0, [ -7388,   2010], [0x97, 0x00, 0xba, 0xff]),
);

// 0x0700A128 - 0x0700A228
jrb_seg7_vertex_0700A128 = vList(
    Vtx([   717,    410,   -921], 0, [  7736,   6098], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   717,   1331,  -1330], 0, [  9372,  -3098], [0x71, 0x38, 0x04, 0xff]),
    Vtx([   717,    717,   -101], 0, [  4464,   3032], [0x7c, 0x18, 0x00, 0xff]),
    Vtx([   307,    819,   2560], 0, [ -6160,   2010], [0xab, 0x40, 0xbc, 0xff]),
    Vtx([   102,    819,   2867], 0, [ -7388,   2010], [0x97, 0x00, 0xba, 0xff]),
    Vtx([   102,    922,   2867], 0, [ -7388,    990], [0xc2, 0x50, 0xb5, 0xff]),
    Vtx([   614,    717,   1946], 0, [ -3708,   3032], [0xad, 0x58, 0xdc, 0xff]),
    Vtx([   614,    614,   1946], 0, [ -3708,   4054], [0x83, 0x00, 0xed, 0xff]),
    Vtx([   307,    614,   2560], 0, [ -6160,   4054], [0x91, 0x00, 0xc3, 0xff]),
    Vtx([   614,    717,   -101], 0, [  4464,   3032], [0xa7, 0x59, 0x00, 0xff]),
    Vtx([   614,    614,   -101], 0, [  4464,   4054], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   614,   1331,  -1330], 0, [ -1664,      0], [0xa7, 0x59, 0x07, 0xff]),
    Vtx([   614,   1126,  -1330], 0, [ -1664,   2010], [0x81, 0x00, 0x00, 0xff]),
    Vtx([   614,   1126,   -101], 0, [  3240,   2010], [0xa7, 0x00, 0x59, 0xff]),
    Vtx([   614,   1229,   -101], 0, [  3240,    990], [0xb9, 0x47, 0x4d, 0xff]),
    Vtx([   717,   1229,   -101], 0, [  4464,  -2076], [0x28, 0x51, 0x58, 0xff]),
);

// 0x0700A228 - 0x0700A2F8
jrb_seg7_vertex_0700A228 = vList(
    Vtx([   717,    205,   -921], 0, [  7736,   8142], [0x7b, 0xe3, 0x00, 0xff]),
    Vtx([   717,    410,   -921], 0, [  7736,   6098], [0x7f, 0x00, 0x00, 0xff]),
    Vtx([   717,    717,   -101], 0, [  4464,   3032], [0x7c, 0x18, 0x00, 0xff]),
    Vtx([   717,    205,   1946], 0, [ -3708,   8142], [0x77, 0xe9, 0x22, 0xff]),
    Vtx([   717,    717,   1946], 0, [ -3708,   3032], [0x43, 0x6a, 0x0a, 0xff]),
    Vtx([   512,   -204,   1946], 0, [ -3708,  12230], [0x57, 0xab, 0x22, 0xff]),
    Vtx([   512,   -204,   -921], 0, [  7736,  12230], [0x4f, 0x9d, 0x00, 0xff]),
    Vtx([   102,      0,   2560], 0, [ -6160,  10186], [0x5d, 0xc3, 0x3c, 0xff]),
    Vtx([   102,   -409,   1946], 0, [ -3708,  14274], [0x6c, 0xc0, 0x0c, 0xff]),
    Vtx([   307,    102,   2560], 0, [ -6160,   9164], [0x48, 0xc4, 0x54, 0xff]),
    Vtx([   410,    307,   2560], 0, [ -6160,   7120], [0x63, 0xeb, 0x4c, 0xff]),
    Vtx([   102,   -409,   -921], 0, [  7736,  14274], [0x77, 0xd5, 0x00, 0xff]),
    Vtx([   410,    819,   2560], 0, [ -6160,   2010], [0x50, 0x60, 0x15, 0xff]),
);

// 0x0700A2F8 - 0x0700A3A8
jrb_seg7_dl_0700A2F8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09005800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(jrb_seg7_lights_07009C10.l[0], 1),
    gsSPLight(jrb_seg7_lights_07009C10.a, 2),
    gsSPVertex(jrb_seg7_vertex_07009C58, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  5,  6, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 7, 10,  8, 0x0, 11, 12, 13, 0x0),
    gsSP1Triangle(11, 14, 12, 0x0),
    gsSPVertex(jrb_seg7_vertex_07009D48, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  6,  9,  7, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 10, 13, 11, 0x0),
    gsSP1Triangle( 0,  2, 14, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700A3A8 - 0x0700A470
jrb_seg7_dl_0700A3A8 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09000000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(jrb_seg7_lights_07009C28.l[0], 1),
    gsSPLight(jrb_seg7_lights_07009C28.a, 2),
    gsSPVertex(jrb_seg7_vertex_07009E38, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  3,  5, 0x0,  6,  5,  7, 0x0),
    gsSP2Triangles( 6,  8,  3, 0x0,  6,  7,  9, 0x0),
    gsSP2Triangles( 0, 10, 11, 0x0,  0, 12, 10, 0x0),
    gsSP2Triangles( 0,  2, 12, 0x0,  1, 13,  2, 0x0),
    gsSP2Triangles( 1, 14, 13, 0x0,  7, 15,  9, 0x0),
    gsSPVertex(jrb_seg7_vertex_07009F38, 9, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  1,  3,  2, 0x0),
    gsSP2Triangles( 1,  4,  3, 0x0,  5,  6,  7, 0x0),
    gsSP1Triangle( 5,  7,  8, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700A470 - 0x0700A608
jrb_seg7_dl_0700A470 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09000800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPLight(jrb_seg7_lights_07009C40.l[0], 1),
    gsSPLight(jrb_seg7_lights_07009C40.a, 2),
    gsSPVertex(jrb_seg7_vertex_07009FC8, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 0,  4,  3, 0x0,  4,  5,  6, 0x0),
    gsSP2Triangles( 4,  0,  5, 0x0,  7,  1,  3, 0x0),
    gsSP2Triangles( 7,  2,  1, 0x0,  6,  7,  3, 0x0),
    gsSP2Triangles( 0,  2,  5, 0x0,  6,  3,  4, 0x0),
    gsSPLight(jrb_seg7_lights_07009C28.l[0], 1),
    gsSPLight(jrb_seg7_lights_07009C28.a, 2),
    gsSPVertex(jrb_seg7_vertex_0700A048, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  3,  1, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  7,  5, 0x0),
    gsSP2Triangles( 8,  6,  5, 0x0,  5,  7,  9, 0x0),
    gsSP2Triangles(10, 11, 12, 0x0, 12, 11, 13, 0x0),
    gsSPVertex(jrb_seg7_vertex_0700A128, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9,  7,  6, 0x0),
    gsSP2Triangles( 9, 10,  7, 0x0, 11, 12, 13, 0x0),
    gsSP2Triangles(11, 13, 14, 0x0,  1, 15,  2, 0x0),
    gsSPVertex(jrb_seg7_vertex_0700A228, 13, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  2,  4, 0x0),
    gsSP2Triangles( 3,  0,  2, 0x0,  5,  6,  0, 0x0),
    gsSP2Triangles( 5,  0,  3, 0x0,  7,  8,  5, 0x0),
    gsSP2Triangles( 7,  5,  9, 0x0,  8,  6,  5, 0x0),
    gsSP2Triangles( 9,  5,  3, 0x0,  9,  3, 10, 0x0),
    gsSP2Triangles( 8, 11,  6, 0x0, 10,  3, 12, 0x0),
    gsSP1Triangle( 3,  4, 12, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700A608 - 0x0700A6D8
jrb_seg7_dl_0700A608 = dList(
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_2CYCLE),
    gsDPSetRenderMode(G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2),
    //gsDPSetDepthSource(G_ZS_PIXEL),
    //gsDPSetFogColor(5, 80, 75, 255),
    //gsSPFogPosition(900, 1000),
    gsSPSetGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_PASS2),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_0700A2F8),
    gsSPDisplayList(jrb_seg7_dl_0700A3A8),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_0700A470),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2),
    gsSPClearGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);

// 0x0700A6D8 - 0x0700A6F0
jrb_seg7_lights_0700A6D8 = gdSPDefLights1(
    0x1e, 0x2c, 0x3a,
    0x79, 0xb2, 0xeb, 0x28, 0x28, 0x28
);

// 0x0700A6F0 - 0x0700A708
jrb_seg7_lights_0700A6F0 = gdSPDefLights1(
    0x3f, 0x3f, 0x3f,
    0xff, 0xff, 0xff, 0x28, 0x28, 0x28
);

// 0x0700A708 - 0x0700A748
jrb_seg7_vertex_0700A708 = vList(
    Vtx([   680,    819,  -1426], 0, [   990,    990], [0x71, 0x00, 0xc8, 0xff]),
    Vtx([   589,    819,  -1610], 0, [     0,    990], [0x71, 0x00, 0xc8, 0xff]),
    Vtx([   680,   1024,  -1426], 0, [   990,      0], [0x71, 0x00, 0xc8, 0xff]),
    Vtx([   589,   1024,  -1610], 0, [     0,      0], [0x71, 0x00, 0xc8, 0xff]),
);

// 0x0700A748 - 0x0700A838
jrb_seg7_vertex_0700A748 = vList(
    Vtx([   102,    205,  -1535], 0, [   110,    596], [0x6d, 0xf2, 0xc1, 0xff]),
    Vtx([   102,    512,  -1637], 0, [   534,    440], [0x7e, 0x00, 0x00, 0xff]),
    Vtx([   102,    410,  -1535], 0, [   330,    440], [0x38, 0x00, 0x8f, 0xff]),
    Vtx([   102,   -511,   -921], 0, [  3742,   1278], [0x7e, 0x00, 0x00, 0xff]),
    Vtx([   103,   -306,  -1637], 0, [  5196,    984], [0x7e, 0x00, 0x00, 0xff]),
    Vtx([   102,   -204,  -1330], 0, [  4646,    838], [0x61, 0xc7, 0xc6, 0xff]),
    Vtx([   102,    205,  -1535], 0, [  5194,    250], [0x6d, 0xf2, 0xc1, 0xff]),
    Vtx([   102,    512,  -1637], 0, [  5548,   -338], [0x7e, 0x00, 0x00, 0xff]),
    Vtx([   102,   -409,   -921], 0, [  3782,   1130], [0x6a, 0xc3, 0xe2, 0xff]),
    Vtx([   717,   1331,  -1330], 0, [  7122,   7120], [0x6a, 0x44, 0x00, 0xff]),
    Vtx([   512,   1536,  -1740], 0, [  8144,   6098], [0x49, 0x5c, 0xd3, 0xff]),
    Vtx([   410,   1536,  -1740], 0, [  8144,   5588], [0xba, 0x4e, 0x46, 0xff]),
    Vtx([   307,   1536,  -1842], 0, [  8400,   5076], [0xc1, 0x59, 0x3f, 0xff]),
    Vtx([   307,   1536,  -1945], 0, [  8656,   5076], [0x3f, 0x59, 0xc1, 0xff]),
    Vtx([   614,   1331,  -1330], 0, [  7122,   6610], [0xb7, 0x49, 0x49, 0xff]),
);

// 0x0700A838 - 0x0700A938
jrb_seg7_vertex_0700A838 = vList(
    Vtx([   512,   -204,   -921], 0, [  7736,  12230], [0x4d, 0xad, 0xc8, 0xff]),
    Vtx([   512,    205,  -1330], 0, [  9372,   8142], [0x61, 0xdf, 0xb7, 0xff]),
    Vtx([   717,    205,   -921], 0, [  7736,   8142], [0x70, 0xef, 0xc8, 0xff]),
    Vtx([   512,    410,  -1330], 0, [  9372,   6098], [0x61, 0xda, 0xba, 0xff]),
    Vtx([   512,    717,  -1740], 0, [ 11004,   3032], [0x5e, 0xd3, 0xba, 0xff]),
    Vtx([   717,    614,  -1330], 0, [  9372,   4054], [0x6e, 0xd4, 0xd5, 0xff]),
    Vtx([   307,    410,  -1535], 0, [ 10188,   6098], [0x3e, 0xcf, 0x9e, 0xff]),
    Vtx([   717,    410,   -921], 0, [  7736,   6098], [0x75, 0xe2, 0xdd, 0xff]),
    Vtx([   307,    307,  -1535], 0, [ 10188,   7120], [0x2f, 0xe8, 0x8d, 0xff]),
    Vtx([   717,   1331,  -1330], 0, [  9372,  -3098], [0x6a, 0x44, 0x00, 0xff]),
    Vtx([   102,    410,  -1535], 0, [   480,  11208], [0x38, 0x00, 0x8f, 0xff]),
    Vtx([   307,    307,  -1535], 0, [  -540,  12230], [0x2f, 0xe8, 0x8d, 0xff]),
    Vtx([   102,    205,  -1535], 0, [   480,  13252], [0x6d, 0xf2, 0xc1, 0xff]),
    Vtx([   307,    410,  -1535], 0, [  -540,  11208], [0x3e, 0xcf, 0x9e, 0xff]),
    Vtx([   307,   -101,  -1330], 0, [  9372,  11208], [0x3f, 0xba, 0xad, 0xff]),
    Vtx([   102,   -204,  -1330], 0, [  9372,  12230], [0x61, 0xc7, 0xc6, 0xff]),
);

// 0x0700A938 - 0x0700AA18
jrb_seg7_vertex_0700A938 = vList(
    Vtx([   102,   -409,   -921], 0, [  7736,  14274], [0x6a, 0xc3, 0xe2, 0xff]),
    Vtx([   102,   -204,  -1330], 0, [  9372,  12230], [0x61, 0xc7, 0xc6, 0xff]),
    Vtx([   512,   -204,   -921], 0, [  7736,  12230], [0x4d, 0xad, 0xc8, 0xff]),
    Vtx([   102,   -204,  -1330], 0, [   480,  17340], [0x61, 0xc7, 0xc6, 0xff]),
    Vtx([   307,    307,  -1535], 0, [  -540,  12230], [0x2f, 0xe8, 0x8d, 0xff]),
    Vtx([   307,   -101,  -1330], 0, [  -540,  16318], [0x3f, 0xba, 0xad, 0xff]),
    Vtx([   102,    205,  -1535], 0, [   480,  13252], [0x6d, 0xf2, 0xc1, 0xff]),
    Vtx([   512,   1536,  -1740], 0, [ 11004,  -5142], [0x49, 0x5c, 0xd3, 0xff]),
    Vtx([   307,    717,  -1945], 0, [ 11824,   3032], [0x57, 0xe1, 0xa9, 0xff]),
    Vtx([   307,   1536,  -1945], 0, [ 11824,  -5142], [0x3f, 0x59, 0xc1, 0xff]),
    Vtx([   512,    717,  -1740], 0, [ 11004,   3032], [0x5e, 0xd3, 0xba, 0xff]),
    Vtx([   307,    410,  -1535], 0, [ 10188,   6098], [0x3e, 0xcf, 0x9e, 0xff]),
    Vtx([   717,   1331,  -1330], 0, [  9372,  -3098], [0x6a, 0x44, 0x00, 0xff]),
    Vtx([   717,    614,  -1330], 0, [  9372,   4054], [0x6e, 0xd4, 0xd5, 0xff]),
);

// 0x0700AA18 - 0x0700AA98
jrb_seg7_vertex_0700AA18 = vList(
    Vtx([   307,   1536,  -1842], 0, [  3036,      0], [0xc1, 0x59, 0x3f, 0xff]),
    Vtx([   307,   1229,  -1842], 0, [  3036,   3032], [0xa7, 0x00, 0x5a, 0xff]),
    Vtx([   410,   1229,  -1740], 0, [  3544,   3032], [0x9e, 0x00, 0x4f, 0xff]),
    Vtx([   410,   1536,  -1740], 0, [  3544,      0], [0xba, 0x4e, 0x46, 0xff]),
    Vtx([   410,   1536,  -1740], 0, [ -3300,  -2076], [0xba, 0x4e, 0x46, 0xff]),
    Vtx([   410,   1229,  -1740], 0, [ -3300,    990], [0x9e, 0x00, 0x4f, 0xff]),
    Vtx([   614,   1229,  -1330], 0, [ -1664,    990], [0x8f, 0x00, 0x38, 0xff]),
    Vtx([   614,   1331,  -1330], 0, [ -1664,      0], [0xb7, 0x49, 0x49, 0xff]),
);

// 0x0700AA98 - 0x0700AAE0
jrb_seg7_dl_0700AA98 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09005800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(jrb_seg7_lights_0700A6D8.l[0], 1),
    gsSPLight(jrb_seg7_lights_0700A6D8.a, 2),
    gsSPVertex(jrb_seg7_vertex_0700A708, 4, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  1,  3,  2, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700AAE0 - 0x0700AB60
jrb_seg7_dl_0700AAE0 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09000000),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 32 * 32 - 1), //CALC_DXT(32, G_IM_SIZ_16b_BYTES)),
    gsSPLight(jrb_seg7_lights_0700A6F0.l[0], 1),
    gsSPLight(jrb_seg7_lights_0700A6F0.a, 2),
    gsSPVertex(jrb_seg7_vertex_0700A748, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 4,  6,  5, 0x0,  4,  7,  6, 0x0),
    gsSP2Triangles( 3,  5,  8, 0x0,  9, 10, 11, 0x0),
    gsSP2Triangles(10, 12, 11, 0x0, 10, 13, 12, 0x0),
    gsSP1Triangle( 9, 11, 14, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700AB60 - 0x0700AC68
jrb_seg7_dl_0700AB60 = dList(
    gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, water_09000800),
    //gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 64 * 32 - 1), //CALC_DXT(64, G_IM_SIZ_16b_BYTES)),
    gsSPVertex(jrb_seg7_vertex_0700A838, 16, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  4,  3, 0x0,  3,  7,  2, 0x0),
    gsSP2Triangles( 3,  2,  1, 0x0,  3,  1,  8, 0x0),
    gsSP2Triangles( 6,  3,  8, 0x0,  5,  7,  3, 0x0),
    gsSP2Triangles( 7,  5,  9, 0x0, 10, 11, 12, 0x0),
    gsSP2Triangles(10, 13, 11, 0x0, 14,  8,  1, 0x0),
    gsSP2Triangles(15, 14,  0, 0x0,  0, 14,  1, 0x0),
    gsSPVertex(jrb_seg7_vertex_0700A938, 14, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 3,  6,  4, 0x0,  7,  8,  9, 0x0),
    gsSP2Triangles( 8, 10, 11, 0x0, 12, 13, 10, 0x0),
    gsSP2Triangles(12, 10,  7, 0x0,  7, 10,  8, 0x0),
    gsSPVertex(jrb_seg7_vertex_0700AA18, 8, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  0,  2,  3, 0x0),
    gsSP2Triangles( 4,  5,  6, 0x0,  4,  6,  7, 0x0),
    gsSPEndDisplayList(),
);

// 0x0700AC68 - 0x0700AD38
jrb_seg7_dl_0700AC68 = dList(
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_2CYCLE),
    gsDPSetRenderMode(G_RM_FOG_SHADE_A, G_RM_AA_ZB_OPA_SURF2),
    //gsDPSetDepthSource(G_ZS_PIXEL),
    //gsDPSetFogColor(5, 80, 75, 255),
    //gsSPFogPosition(900, 1000),
    gsSPSetGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_MODULATERGB, G_CC_PASS2),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 0, 0, G_TX_LOADTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, G_TX_NOMASK, G_TX_NOLOD),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_ON),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 8, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (32 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_0700AA98),
    gsSPDisplayList(jrb_seg7_dl_0700AAE0),
    //gsDPTileSync(),
    gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, G_TX_RENDERTILE, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, G_TX_NOLOD, G_TX_WRAP | G_TX_NOMIRROR, 6, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (64 - 1) << G_TEXTURE_IMAGE_FRAC, (32 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPDisplayList(jrb_seg7_dl_0700AB60),
    gsSPTexture(0xFFFF, 0xFFFF, 0, G_TX_RENDERTILE, G_OFF),
    //gsDPPipeSync(),
    gsDPSetCycleType(G_CYC_1CYCLE),
    gsDPSetRenderMode(G_RM_AA_ZB_OPA_SURF, G_RM_NOOP2),
    gsSPClearGeometryMode(G_FOG),
    gsDPSetCombineMode(G_CC_SHADE, G_CC_SHADE),
    gsSPEndDisplayList(),
);



/// <pygml?v=1.0&h=4b50b70ba>
// 0x0E000978
jrb_geo_000978 = gList(
   [GCMD_CULL, 5000],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_07008FD8],
   [GCMD_CLOSE],
   [GCMD_END],
);

// 0x0E000990
jrb_geo_000990 = gList(
   [GCMD_CULL, 5000],
   [GCMD_OPEN],
      //[GCMD_ASM, 0, geo_update_layer_transparency],
      [GCMD_DLIST, LAYER_TRANSPARENT, jrb_seg7_dl_070090B0],
   [GCMD_CLOSE],
   [GCMD_END],
);

// 0x0E0009B0
jrb_geo_0009B0 = gList(
   [GCMD_CULL, 5000],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_07009A58],
   [GCMD_CLOSE],
   [GCMD_END],
);

// 0x0E0009C8
jrb_geo_0009C8 = gList(
   [GCMD_CULL, 5000],
   [GCMD_OPEN],
      //[GCMD_ASM, 0, geo_update_layer_transparency],
      [GCMD_DLIST, LAYER_TRANSPARENT, jrb_seg7_dl_07009B30],
   [GCMD_CLOSE],
   [GCMD_END],
);

// 0x0E0009E8
jrb_geo_0009E8 = gList(
   [GCMD_CULL, 5000],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_0700A608],
   [GCMD_CLOSE],
   [GCMD_END],
);

// 0x0E000A00
jrb_geo_000A00 = gList(
   [GCMD_CULL, 5000],
   [GCMD_OPEN],
      [GCMD_DLIST, LAYER_OPAQUE, jrb_seg7_dl_0700AC68],
   [GCMD_CLOSE],
   [GCMD_END],
);

/// <pygml?v=1.0&h=81497a3d8>
bhvShipPart3 = [
    [BCMD_BEGIN, OBJ_LIST_DEFAULT],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_HOME],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_ship_part_3_loop],
    [BCMD_LOOP_END],
];
/// <pygml?v=1.0&h=cc6dffdf8>

bhvInSunkenShip3 = [
    [BCMD_BEGIN, OBJ_LIST_SURFACE],
    [BCMD_OR_INT, oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE],
    [BCMD_COLLISION_DATA, jrb_seg7_collision_in_sunken_ship_3],
    [BCMD_HOME],
    [BCMD_SET_FLOAT, oCollisionDistance, 4000],
    [BCMD_LOOP_BEGIN],
        [BCMD_CALL, bhv_ship_part_3_loop],
        [BCMD_CALL, load_object_collision_model],
    [BCMD_LOOP_END],
];

}