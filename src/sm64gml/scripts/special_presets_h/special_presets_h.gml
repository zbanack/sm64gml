function special_presets_h_macros_init() {
	#macro SPTYPE_NO_YROT_OR_PARAMS   0
	#macro SPTYPE_YROT_NO_PARAMS      1
	#macro SPTYPE_PARAMS_AND_YROT     2
	#macro SPTYPE_UNKNOWN             3
	#macro SPTYPE_DEF_PARAM_AND_YROT  4	
	
	globalvar gMacroObjectDefaultParent;
	gMacroObjectDefaultParent	= null;
	gMacroObjectDefaultParent = new MacroObjectInstance();
	gMacroObjectDefaultParent.header = new MacroObjectInstance();
	gMacroObjectDefaultParent.header.gfx = new MacroObjectInstance();
	gMacroObjectDefaultParent.header.gfx.unk18 = 0;
	gMacroObjectDefaultParent.header.gfx.unk19 = 0;

	boot("special_presets_h_macros_init");
}

function SpecialPreset(_preset_id, _type, _defParam, _model, _behavior) constructor {
	preset_id	= _preset_id;
	type		= _type;
	defParam	= _defParam;
	model		= _model;
	behavior	= _behavior;
}

function special_object_presets_define() {
	
	globalvar SpecialObjectPresets;
	SpecialObjectPresets	= [];
	
	SpecialObjectPresets = array_create(0xFF);
	for(var i = 0; i < 0xFF; i++) {
		SpecialObjectPresets[i] = null;
	}
	
    SpecialObjectPresets[0x00] = new SpecialPreset(0x00, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_NONE, null);
    SpecialObjectPresets[0x01] = new SpecialPreset(0x01, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_YELLOW_COIN, Object1.bhvYellowCoin);
    SpecialObjectPresets[0x02] = new SpecialPreset(0x02, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_YELLOW_COIN, Object1.bhvYellowCoin);
    SpecialObjectPresets[0x03] = new SpecialPreset(0x03, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_UNKNOWN_B8, Object1.bhvStaticObject);
    SpecialObjectPresets[0x04] = new SpecialPreset(0x04, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_BOO, Object1.bhvCourtyardBooTriplet);
    SpecialObjectPresets[0x05] = new SpecialPreset(0x05, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_UNKNOWN_AC, Object1.bhvCastleFloorTrap);
    SpecialObjectPresets[0x06] = new SpecialPreset(0x06, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_LLL_MOVING_OCTAGONAL_MESH_PLATFORM, Object1.bhvLllMovingOctagonalMeshPlatform);
    SpecialObjectPresets[0x07] = new SpecialPreset(0x07, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_CCM_SNOWMAN_HEAD, Object1.bhvSnowBall);
    SpecialObjectPresets[0x08] = new SpecialPreset(0x08, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LLL_DRAWBRIDGE_PART, Object1.bhvLllDrawbridgeSpawner);
    SpecialObjectPresets[0x09] = new SpecialPreset(0x09, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvStaticObject);
    SpecialObjectPresets[0x0A] = new SpecialPreset(0x0A, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_LLL_ROTATING_BLOCK_FIRE_BARS, Object1.bhvLllRotatingBlockWithFireBars);
    SpecialObjectPresets[0x0B] = new SpecialPreset(0x0B, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvLllFloatingWoodBridge);
    SpecialObjectPresets[0x0C] = new SpecialPreset(0x0C, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvLllTumblingBridge);
    SpecialObjectPresets[0x0D] = new SpecialPreset(0x0D, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_LLL_ROTATING_HEXAGONAL_RING , Object1.bhvLllRotatingHexagonalRing);
    SpecialObjectPresets[0x0E] = new SpecialPreset(0x0E, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LLL_SINKING_RECTANGULAR_PLATFORM, Object1.bhvLllSinkingRectangularPlatform);
    SpecialObjectPresets[0x0F] = new SpecialPreset(0x0F, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_LLL_SINKING_SQUARE_PLATFORMS, Object1.bhvLllSinkingSquarePlatforms);
    SpecialObjectPresets[0x10] = new SpecialPreset(0x10, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_LLL_TILTING_SQUARE_PLATFORM, Object1.bhvLllTiltingInvertedPyramid);
    SpecialObjectPresets[0x11] = new SpecialPreset(0x11, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvLllBowserPuzzle);
    SpecialObjectPresets[0x12] = new SpecialPreset(0x12, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvMrI);
    SpecialObjectPresets[0x13] = new SpecialPreset(0x13, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_BULLY, Object1.bhvSmallBully);
    SpecialObjectPresets[0x14] = new SpecialPreset(0x14, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_BULLY_BOSS, Object1.bhvBigBully);
    SpecialObjectPresets[0x15] = new SpecialPreset(0x15, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvStaticObject);
    SpecialObjectPresets[0x16] = new SpecialPreset(0x16, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvStaticObject);
    SpecialObjectPresets[0x17] = new SpecialPreset(0x17, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvStaticObject);
    SpecialObjectPresets[0x18] = new SpecialPreset(0x18, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvStaticObject);
    SpecialObjectPresets[0x19] = new SpecialPreset(0x19, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvStaticObject);
    SpecialObjectPresets[0x1A] = new SpecialPreset(0x1A, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_YELLOW_COIN, Object1.bhvMovingBlueCoin);
    SpecialObjectPresets[0x1B] = new SpecialPreset(0x1B, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_TREASURE_CHEST_BASE, Object1.bhvBetaChestBottom);
    SpecialObjectPresets[0x1C] = new SpecialPreset(0x1C, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_WATER_RING, Object1.bhvJetStreamRingSpawner);
    SpecialObjectPresets[0x1D] = new SpecialPreset(0x1D, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_WATER_MINE, Object1.bhvBowserBomb);
    SpecialObjectPresets[0x1E] = new SpecialPreset(0x1E, SPTYPE_UNKNOWN           , 0x00, MODEL_NONE, Object1.bhvStaticObject);
    SpecialObjectPresets[0x1F] = new SpecialPreset(0x1F, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvStaticObject);
    SpecialObjectPresets[0x20] = new SpecialPreset(0x20, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_BUTTERFLY, Object1.bhvButterfly);
    SpecialObjectPresets[0x21] = new SpecialPreset(0x21, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_BOWSER, Object1.bhvBowser);
    SpecialObjectPresets[0x22] = new SpecialPreset(0x22, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_WF_ROTATING_WOODEN_PLATFORM, Object1.bhvWfRotatingWoodenPlatform);
    SpecialObjectPresets[0x23] = new SpecialPreset(0x23, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_WF_SMALL_BOMP, Object1.bhvSmallBomp);
    SpecialObjectPresets[0x24] = new SpecialPreset(0x24, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_WF_SLIDING_PLATFORM, Object1.bhvWfSlidingPlatform);
    SpecialObjectPresets[0x25] = new SpecialPreset(0x25, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvTowerPlatformGroup);
    SpecialObjectPresets[0x26] = new SpecialPreset(0x26, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, Object1.bhvRotatingCounterClockwise);
    SpecialObjectPresets[0x27] = new SpecialPreset(0x27, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_WF_TUMBLING_BRIDGE, Object1.bhvWfTumblingBridge);
    SpecialObjectPresets[0x28] = new SpecialPreset(0x28, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_WF_LARGE_BOMP, Object1.bhvLargeBomp);
    SpecialObjectPresets[0x65] = new SpecialPreset(0x65, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_03, Object1.bhvStaticObject);
    SpecialObjectPresets[0x66] = new SpecialPreset(0x66, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_04, Object1.bhvStaticObject);
    SpecialObjectPresets[0x67] = new SpecialPreset(0x67, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_05, Object1.bhvStaticObject);
    SpecialObjectPresets[0x68] = new SpecialPreset(0x68, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_06, Object1.bhvStaticObject);
    SpecialObjectPresets[0x69] = new SpecialPreset(0x69, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_07, Object1.bhvStaticObject);
    SpecialObjectPresets[0x6A] = new SpecialPreset(0x6A, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_08, Object1.bhvStaticObject);
    SpecialObjectPresets[0x6B] = new SpecialPreset(0x6B, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_09, Object1.bhvStaticObject);
    SpecialObjectPresets[0x6C] = new SpecialPreset(0x6C, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_0A, Object1.bhvStaticObject);
    SpecialObjectPresets[0x6D] = new SpecialPreset(0x6D, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_0B, Object1.bhvStaticObject);
    SpecialObjectPresets[0x6E] = new SpecialPreset(0x6E, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_0C, Object1.bhvStaticObject);
    SpecialObjectPresets[0x6F] = new SpecialPreset(0x6F, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_0D, Object1.bhvStaticObject);
    SpecialObjectPresets[0x70] = new SpecialPreset(0x70, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_0E, Object1.bhvStaticObject);
    SpecialObjectPresets[0x71] = new SpecialPreset(0x71, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_0F, Object1.bhvStaticObject);
    SpecialObjectPresets[0x72] = new SpecialPreset(0x72, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_10, Object1.bhvStaticObject);
    SpecialObjectPresets[0x73] = new SpecialPreset(0x73, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_11, Object1.bhvStaticObject);
    SpecialObjectPresets[0x74] = new SpecialPreset(0x74, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_12, Object1.bhvStaticObject);
    SpecialObjectPresets[0x75] = new SpecialPreset(0x75, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_13, Object1.bhvStaticObject);
    SpecialObjectPresets[0x76] = new SpecialPreset(0x76, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_14, Object1.bhvStaticObject);
    SpecialObjectPresets[0x77] = new SpecialPreset(0x77, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_15, Object1.bhvStaticObject);
    SpecialObjectPresets[0x78] = new SpecialPreset(0x78, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_LEVEL_GEOMETRY_16, Object1.bhvStaticObject);
    SpecialObjectPresets[0x79] = new SpecialPreset(0x79, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_BOB_BUBBLY_TREE, Object1.bhvTree);
    SpecialObjectPresets[0x7A] = new SpecialPreset(0x7A, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_COURTYARD_SPIKY_TREE, Object1.bhvTree);
    SpecialObjectPresets[0x7B] = new SpecialPreset(0x7B, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_CCM_SNOW_TREE, Object1.bhvTree);
    SpecialObjectPresets[0x7C] = new SpecialPreset(0x7C, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_UNKNOWN_TREE_1A, Object1.bhvTree);
    SpecialObjectPresets[0x7D] = new SpecialPreset(0x7D, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_SSL_PALM_TREE, Object1.bhvTree);
    SpecialObjectPresets[0x89] = new SpecialPreset(0x89, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_CASTLE_CASTLE_DOOR_UNUSED, Object1.bhvDoor);
    SpecialObjectPresets[0x7E] = new SpecialPreset(0x7E, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_CASTLE_WOODEN_DOOR_UNUSED, Object1.bhvDoor);
    SpecialObjectPresets[0x7F] = new SpecialPreset(0x7F, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_UNKNOWN_DOOR_1E, Object1.bhvDoor);
    SpecialObjectPresets[0x80] = new SpecialPreset(0x80, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_HMC_METAL_DOOR, Object1.bhvDoor);
    SpecialObjectPresets[0x81] = new SpecialPreset(0x81, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_HMC_HAZY_MAZE_DOOR, Object1.bhvDoor);
    SpecialObjectPresets[0x82] = new SpecialPreset(0x82, SPTYPE_YROT_NO_PARAMS    , 0x00, MODEL_UNKNOWN_DOOR_21, Object1.bhvDoor);
    SpecialObjectPresets[0x8A] = new SpecialPreset(0x8A, SPTYPE_DEF_PARAM_AND_YROT, 0x00, MODEL_CASTLE_DOOR_0_STARS, Object1.bhvDoor);
    SpecialObjectPresets[0x8B] = new SpecialPreset(0x8B, SPTYPE_DEF_PARAM_AND_YROT, 0x01, MODEL_CASTLE_DOOR_1_STAR, Object1.bhvDoor);
    SpecialObjectPresets[0x8C] = new SpecialPreset(0x8C, SPTYPE_DEF_PARAM_AND_YROT, 0x03, MODEL_CASTLE_DOOR_3_STARS, Object1.bhvDoor);
    SpecialObjectPresets[0x8D] = new SpecialPreset(0x8D, SPTYPE_DEF_PARAM_AND_YROT, 0x00, MODEL_CASTLE_KEY_DOOR, Object1.bhvDoor);
    SpecialObjectPresets[0x88] = new SpecialPreset(0x88, SPTYPE_PARAMS_AND_YROT   , 0x00, MODEL_CASTLE_CASTLE_DOOR, Object1.bhvDoorWarp);
    SpecialObjectPresets[0x83] = new SpecialPreset(0x83, SPTYPE_PARAMS_AND_YROT   , 0x00, MODEL_CASTLE_WOODEN_DOOR, Object1.bhvDoorWarp);
    SpecialObjectPresets[0x84] = new SpecialPreset(0x84, SPTYPE_PARAMS_AND_YROT   , 0x00, MODEL_UNKNOWN_DOOR_28, Object1.bhvDoorWarp);
    SpecialObjectPresets[0x85] = new SpecialPreset(0x85, SPTYPE_PARAMS_AND_YROT   , 0x00, MODEL_CASTLE_METAL_DOOR, Object1.bhvDoorWarp);
    SpecialObjectPresets[0x86] = new SpecialPreset(0x86, SPTYPE_PARAMS_AND_YROT   , 0x00, MODEL_UNKNOWN_DOOR_2A, Object1.bhvDoorWarp);
    SpecialObjectPresets[0x87] = new SpecialPreset(0x87, SPTYPE_PARAMS_AND_YROT   , 0x00, MODEL_UNKNOWN_DOOR_2B, Object1.bhvDoorWarp);
    SpecialObjectPresets[0xFF] = new SpecialPreset(0xFF, SPTYPE_NO_YROT_OR_PARAMS , 0x00, MODEL_NONE, null);

	boot("special_object_presets_define");
}