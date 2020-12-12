function macro_preset_scripts_macros_init() {
#macro MACRO_OBJ_Y_ROT 0
#macro MACRO_OBJ_X 1
#macro MACRO_OBJ_Y 2
#macro MACRO_OBJ_Z 3
#macro MACRO_OBJ_PARAMS 4
	
boot("macro_preset_scripts_macros_init");
}

function OBJECT_WITH_ACTS(model, posX, posY, posZ, angleX, angleY, angleZ, behParam, beh, acts) {
	return [LCMD_OBJECT_WITH_ACTS, model, posX, posY, posZ, angleX, angleY, angleZ, behParam, beh, acts];
}

function OBJECT(model, posX, posY, posZ, angleX, angleY, angleZ, behParam, beh) {
	return OBJECT_WITH_ACTS(model, posX, posY, posZ, angleX, angleY, angleZ, behParam, beh, 0x1F);
}

function MACRO_OBJECT(_preset, _yaw, _posX, _posY, _posZ) {
	return MACRO_OBJECT_WITH_BEH_PARAM(_preset, _yaw, _posX, _posY, _posZ, 0)
}

function MACRO_OBJECT_WITH_BEH_PARAM(_preset, _yaw, _posX, _posY, _posZ, _behParam) {
	return [ (((_yaw * 0x10 / 45) << 9) | (_preset + 0x1F)), _posX, _posY, _posZ, _behParam];
}



/// <pygml?v=1.0&h=af5666dba>
/// @function	spawn_macro_objects(areaIndex, Ptr.p_macroObjList)
/// @param		{s16}		areaIndex
/// @param		{s16}		Ptr.p_macroObjList
function spawn_macro_objects(areaIndex, macroObjList) {
    var pad5C;
    var presetID;

    var macroObject = array_create(5); // see the 5 var statements above
    var newObj;
    var preset = {};

    gMacroObjectDefaultParent.header.gfx.unk18 = areaIndex;
    gMacroObjectDefaultParent.header.gfx.unk19 = areaIndex;

	var at = 0;
    while (true) {
        if (at >= array_length(macroObjList)) { // An encountered value of -1 means the list has ended.
            break;
        }
		
        presetID = (macroObjList[at][0] & 0x1FF) - 31; // @z added 10 for match??? // Preset identifier for MacroObjectPresets array

		//log("PRESETID:", presetID);
        if (presetID < 0) {
            break;
        }

        // Set macro object properties from the list
        macroObject[MACRO_OBJ_Y_ROT] = ((macroObjList[at][0] >> 9) & 0x7F) << 1; // Y-Rotation
        macroObject[MACRO_OBJ_X] = macroObjList[at][1]; // X position
        macroObject[MACRO_OBJ_Y] = macroObjList[at][2]; // Y position
        macroObject[MACRO_OBJ_Z] = macroObjList[at][3]; // Z position
        macroObject[MACRO_OBJ_PARAMS] = macroObjList[at][4]; // Behavior params

        // Get the preset values from the MacroObjectPresets list.
        preset.model = MacroObjectPresets[presetID].model;
        preset.behavior = MacroObjectPresets[presetID].behavior;
        preset.param = MacroObjectPresets[presetID].param;
	
        if (preset.param != 0) {
            macroObject[MACRO_OBJ_PARAMS] =
                (macroObject[MACRO_OBJ_PARAMS] & 0xFF00) + (preset.param & 0x00FF);
        }
		

        // If object has been killed, prevent it from respawning
        if (((macroObject[MACRO_OBJ_PARAMS] >> 8) & RESPAWN_INFO_DONT_RESPAWN) !=
            RESPAWN_INFO_DONT_RESPAWN) {
            // Spawn the new macro object.
            newObj =
                spawn_object_abs_with_rot(gMacroObjectDefaultParent, // Parent object
					0,
                    preset.model, // Model ID
                    preset.behavior, // Behavior address
                    macroObject[MACRO_OBJ_X], // X-position
                    macroObject[MACRO_OBJ_Y], // Y-position
                    macroObject[MACRO_OBJ_Z], // Z-position
                    0, // X-rotation
                    convert_rotation(macroObject[MACRO_OBJ_Y_ROT]), // Y-rotation
                    0 // Z-rotation
                );

            newObj.rawData[oUnk1A8] = macroObject[MACRO_OBJ_PARAMS];
            newObj.rawData[oBehParams] = ((macroObject[MACRO_OBJ_PARAMS] & 0x00FF) << 16) +
                (macroObject[MACRO_OBJ_PARAMS] & 0xFF00);
            newObj.rawData[oBehParams2ndByte] = macroObject[MACRO_OBJ_PARAMS] & 0x00FF;
            newObj.respawnInfoType = RESPAWN_INFO_TYPE_16;
            newObj.respawnInfo = macroObjList[at][5 - 1]; // @z ?
            newObj.parentObj = newObj;
			
			at++;
        }
    }

}