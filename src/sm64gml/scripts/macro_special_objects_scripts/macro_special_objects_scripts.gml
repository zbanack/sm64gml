/// <pygml?v=1.0&h=068c09d82>
/// @function	convert_rotation(inRotation)
/// @desc		Converts the rotation value supplied by macro objects into
///					one  that can be used by in-game objects.
/// @param		{s16}		inRotation
/// @returns	s16
function convert_rotation(inRotation) {
    var rotation = floor(inRotation & 0xFF);
    rotation = rotation << 8;
	
	//var rotation = floor(inRotation * ((256*256)/360)); 

    if (rotation == 0x3F00) {
        rotation = 0x4000;
    }

    if (rotation == 0x7F00) {
        rotation = 0x8000;
    }

    if (rotation == 0xBF00) {
        rotation = 0xC000;
    }

    if (rotation == 0xFF00) {
        rotation = 0x0000;
    }
	

    return rotation;
}


function spawn_macro_abs_yrot_2params(model, behavior, x, y, z, ry, params) {
    if (behavior!=null) {
        var newObj = spawn_object_abs_with_rot(gMacroObjectDefaultParent, 0,
            model, behavior, x, y, z, 0, convert_rotation(ry), 0);
        newObj.rawData[oBehParams] = params << 16;
    }
}

/*
 * Spawns an object at an absolute location with currently 3 unknown variables that get converted to
 * floats. Oddly enough, this function doesn't care if 'behavior' is null or not.
 */
function spawn_macro_abs_special(model, behavior, x, y, z, unkA, unkB, unkC) {
    var newObj = spawn_object_abs_with_rot(gMacroObjectDefaultParent, 0, model, behavior, x, y, z, 0, 0, 0);

    // Are all three of these values unused?
    newObj.rawData[oMacroUnk108] = unkA;
    newObj.rawData[oMacroUnk10C] = unkB;
    newObj.rawData[oMacroUnk110] = unkC;
}

/*
 * Spawns an object at an absolute location with rotation around the y-axis and
 * a single parameter filling up the upper byte of newObj->oBehParams.
 * The object will not spawn if 'behavior' is null.
 */
function spawn_macro_abs_yrot_param1(model, behavior, x, y, z, ry, param) {
    if (behavior != null) {
        var newObj = spawn_object_abs_with_rot(gMacroObjectDefaultParent, 0, model, behavior, x, y, z, 0, convert_rotation(ry), 0);
        newObj.rawData[oBehParams] = param << 24;
    }
}

function spawn_special_objects(areaIndex, specialObjList, dataIndex) {
	var numOfSpecialObjects = specialObjList[dataIndex++];

    for (var i = 0; i < numOfSpecialObjects; i++) {
        var presetID = specialObjList[dataIndex++];
        var xx = specialObjList[dataIndex++];
        var yy = specialObjList[dataIndex++];
        var zz = specialObjList[dataIndex++];

		if (SpecialObjectPresets[presetID]!=null) {
			
			var  model, behavior, type, defParam;
			model		= SpecialObjectPresets[presetID].model;
			behavior	= SpecialObjectPresets[presetID].behavior;
			type		= SpecialObjectPresets[presetID].type;
			defParam	= SpecialObjectPresets[presetID].defParam;
			

	        switch (type) {
	            case(SPTYPE_NO_YROT_OR_PARAMS):
	                spawn_macro_abs_yrot_2params(model, behavior, xx, yy, zz, 0, 0);
	            break;
	            case(SPTYPE_YROT_NO_PARAMS):
	                var yaw = specialObjList[dataIndex++];
	                spawn_macro_abs_yrot_2params(model, behavior, xx, yy, zz, yaw, 0);
	            break;
	            case(SPTYPE_PARAMS_AND_YROT):
	                var yaw = specialObjList[dataIndex++];
					var params = specialObjList[dataIndex++];
	                spawn_macro_abs_yrot_2params(model, behavior, xx, yy, zz, yaw, params);
	            break;
	            case SPTYPE_UNKNOWN:
	                var extraA = specialObjList[dataIndex++];
					var extraB = specialObjList[dataIndex++];
					var extraC = specialObjList[dataIndex++];
	                spawn_macro_abs_special(model, behavior, xx, yy, zz, extraA, extraB, extraC);
	                break;

	            case SPTYPE_DEF_PARAM_AND_YROT:
	                var extraA = specialObjList[dataIndex++];
	                spawn_macro_abs_yrot_param1(model, behavior, xx, yy, zz, extraA, defParam);
	                break;
	            default:
	                break;
	        }
		}
    }

    return dataIndex
}

function MacroObjectInstance() constructor {
}

