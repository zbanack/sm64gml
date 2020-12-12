function behavior_spawn_particles_init() {
	globalvar D_8032F270;
	D_8032F270 = new SpawnParticlesInfo(2, 20, MODEL_MIST, 0, 40, 5, 30, 20, 252, 30, 330.0, 10.0);
	
	boot("behavior_spawn_particles_init");
}

/// <pygml?v=1.0&h=b8ea01e76>
/// @function	spawn_mist_particles_variable(count, offsetY, size)
/// @param		{s32}		count
/// @param		{s32}		offsetY
/// @param		{f32}		size
// generate_wind_puffs/dust (something like that)
function spawn_mist_particles_variable(count, offsetY, size) {
    D_8032F270.sizeBase = size;
    D_8032F270.sizeRange = size / 20.0;
    D_8032F270.offsetY = offsetY;
    if (count == 0) {
        D_8032F270.count = 20;
    } else if (count > 20) {
        D_8032F270.count = count;
    } else {
        D_8032F270.count = 4;
    }
    cur_obj_spawn_particles(D_8032F270);
}


function Struct8032F34C(_numBridgeSections, _bridgeRelativeStartingXorZ, _platformWidth, _model, _segAddr) constructor {
    numBridgeSections = _numBridgeSections;
    bridgeRelativeStartingXorZ = _bridgeRelativeStartingXorZ;
    platformWidth = _platformWidth;
    model = _model;
    segAddr = _segAddr;
}

function WFRotatingPlatformData(_pad, _scale, _collisionData, _collisionDistance) constructor {
    pad = _pad;
    scale = _scale;
    collisionData = _collisionData;
    collisionDistance = _collisionDistance;
}

function ANIMINDEX_NUMPARTS(arr) {
	return (array_length(arr) / 6 - 1);
}

function set_obj_anim_with_accel_and_sound(a0, a1, a2) {
	
	var o = gCurrentObject;
	
    var sp1C = o.header.gfx.unk38.animAccel / 0x10000;
    if (sp1C == 0) sp1C = 1.0;
    if (cur_obj_check_anim_frame_in_range(a0, sp1C) || cur_obj_check_anim_frame_in_range(a1, sp1C)) {
        cur_obj_play_sound_2(a2);
        return 1;
    }
    return 0;
}

function cur_obj_play_sound_2() {}
function cur_obj_play_sound_1() {}

function vec3f_copy_2(dest, src) {
    dest[@ 0] = src[0];
    dest[@ 1] = src[1];
    dest[@ 2] = src[2];
}
// @TODO //@z move to king_bobomb
/// <pygml?v=1.0&h=355407390>
/// @function	mario_is_far_below_object(arg0)
/// @param		{f32}		arg0
/// @returns	s32
function mario_is_far_below_object(arg0) {
    var o = gCurrentObject;

    if (arg0 < o.rawData[oPosY] - gMarioObject[0].rawData[oPosY]) {
        return true;
    } else {
        return false;
    }
}
