function mario_c_macros_init() {
	
globalvar sSquishScaleOverTime;
sSquishScaleOverTime = [ 0x46, 0x32, 0x32, 0x3C, 0x46, 0x50, 0x50, 0x3C,
                                0x28, 0x14, 0x14, 0x1E, 0x32, 0x3C, 0x3C, 0x28];
globalvar sCapFlickerFrames;						
sCapFlickerFrames  = 0x4444449249255555;

globalvar mario_act_group_lut;
mario_act_group_lut	= [];

mario_act_group_lut[ACT_GROUP_STATIONARY]	= mario_execute_stationary_action;
mario_act_group_lut[ACT_GROUP_MOVING]		= mario_execute_moving_action;
mario_act_group_lut[ACT_GROUP_AIRBORNE]		= mario_execute_airborne_action;
mario_act_group_lut[ACT_GROUP_SUBMERGED]	= mario_execute_submerged_action;
mario_act_group_lut[ACT_GROUP_CUTSCENE]		= mario_execute_cutscene_action;
mario_act_group_lut[ACT_GROUP_AUTOMATIC]	= mario_execute_automatic_action;
mario_act_group_lut[ACT_GROUP_OBJECT]		= mario_execute_object_action;

globalvar sTerrainSounds;
sTerrainSounds = [
    // default,              hard,                 slippery,
    // very slippery,        noisy default,        noisy slippery
    [ SOUND_TERRAIN_DEFAULT, SOUND_TERRAIN_STONE,  SOUND_TERRAIN_GRASS,
      SOUND_TERRAIN_GRASS,   SOUND_TERRAIN_GRASS,  SOUND_TERRAIN_DEFAULT ], // TERRAIN_GRASS
    [ SOUND_TERRAIN_STONE,   SOUND_TERRAIN_STONE,  SOUND_TERRAIN_STONE,
      SOUND_TERRAIN_STONE,   SOUND_TERRAIN_GRASS,  SOUND_TERRAIN_GRASS ], // TERRAIN_STONE
    [ SOUND_TERRAIN_SNOW,    SOUND_TERRAIN_ICE,    SOUND_TERRAIN_SNOW,
      SOUND_TERRAIN_ICE,     SOUND_TERRAIN_STONE,  SOUND_TERRAIN_STONE ], // TERRAIN_SNOW
    [ SOUND_TERRAIN_SAND,    SOUND_TERRAIN_STONE,  SOUND_TERRAIN_SAND,
      SOUND_TERRAIN_SAND,    SOUND_TERRAIN_STONE,  SOUND_TERRAIN_STONE ], // TERRAIN_SAND
    [ SOUND_TERRAIN_SPOOKY,  SOUND_TERRAIN_SPOOKY, SOUND_TERRAIN_SPOOKY,
      SOUND_TERRAIN_SPOOKY,  SOUND_TERRAIN_STONE,  SOUND_TERRAIN_STONE ], // TERRAIN_SPOOKY
    [ SOUND_TERRAIN_DEFAULT, SOUND_TERRAIN_STONE,  SOUND_TERRAIN_GRASS,
      SOUND_TERRAIN_ICE,     SOUND_TERRAIN_STONE,  SOUND_TERRAIN_ICE ], // TERRAIN_WATER
    [ SOUND_TERRAIN_STONE,   SOUND_TERRAIN_STONE,  SOUND_TERRAIN_STONE,
      SOUND_TERRAIN_STONE,   SOUND_TERRAIN_ICE,    SOUND_TERRAIN_ICE ], // TERRAIN_SLIDE
];

boot("mario_c_macros_init");
}

/**************************************************
 *                    ANIMATIONS                  *
 **************************************************/


/// <pygml?v=1.0&h=bca7a5569>
/// @function	is_anim_at_end(m)
/// @desc		Checks if Mario's animation has reached its end point.
/// @param		{struct}	m
/// @returns	s32
function is_anim_at_end(m) {
    var o = m.marioObj;

    return (o.header.gfx.unk38.animFrame + 1) == o.header.gfx.unk38.curAnim.unk08;
}

/// <pygml?v=1.0&h=2e2280f18>
/// @function	is_anim_past_end(m)
/// @desc		Checks if Mario's animation has surpassed 2 frames before
///					its end point.
/// @param		{struct}	m
/// @returns	s32
function is_anim_past_end(m) {
    var o = m.marioObj;

    return o.header.gfx.unk38.animFrame >= (o.header.gfx.unk38.curAnim.unk08 - 2);
}

function set_mario_animation(m, targetAnimID) {
	var o = m.marioObj;
	m.animation.targetAnim = m.animation.animList[targetAnimID];

	if (o.header.gfx.unk38.animID != targetAnimID) {
	    o.header.gfx.unk38.animID = targetAnimID;
	    o.header.gfx.unk38.curAnim = m.animation.targetAnim;
	    o.header.gfx.unk38.animAccel = 0;
	    o.header.gfx.unk38.animYTrans = m.unkB0;

	    if (m.animation.targetAnim.flags & ANIM_FLAG_2) {
	        o.header.gfx.unk38.animFrame = m.animation.targetAnim.unk04;
	    } else {
	        if (m.animation.targetAnim.flags & ANIM_FLAG_FORWARD) {
	            o.header.gfx.unk38.animFrame = m.animation.targetAnim.unk04 + 1;
	        } else {
	            o.header.gfx.unk38.animFrame = m.animation.targetAnim.unk04 - 1;
	        }
	    }
	}
		
	return o.header.gfx.unk38.animFrame;
}


function set_mario_anim_with_accel(m, targetAnimID, accel) {
	var o = m.marioObj;
	m.animation.targetAnim = m.animation.animList[targetAnimID];

	if (o.header.gfx.unk38.animID != targetAnimID) {
	    o.header.gfx.unk38.animID = targetAnimID;
	    o.header.gfx.unk38.curAnim = m.animation.targetAnim;
	    o.header.gfx.unk38.animYTrans = m.unkB0;

	    if (m.animation.targetAnim.flags & ANIM_FLAG_2) {
	        o.header.gfx.unk38.animFrameAccelAssist = (m.animation.targetAnim << 0x10);
	    } else {
	        if (m.animation.targetAnim.flags & ANIM_FLAG_FORWARD) {
	            o.header.gfx.unk38.animFrameAccelAssist = (m.animation.targetAnim << 0x10) + accel;
	        } else {
	            o.header.gfx.unk38.animFrameAccelAssist = (m.animation.targetAnim << 0x10) - accel;
	        }
	    }

	    o.header.gfx.unk38.animFrame = (o.header.gfx.unk38.animFrameAccelAssist >> 0x10);
	}

	o.header.gfx.unk38.animAccel = accel;

	return o.header.gfx.unk38.animFrame;

}
/// <pygml?v=1.0&h=8595ee69c>
/// @function	set_anim_to_frame(m, animFrame)
/// @desc		Sets the animation to a specific "next" frame from the frame
///					given.
/// @param		{struct}	m
/// @param		{s16}		animFrame
function set_anim_to_frame(m, animFrame) {
    var animInfo = m.marioObj.header.gfx.unk38;
    var curAnim = animInfo.curAnim;

    if (animInfo.animAccel) {
        if (curAnim.flags & ANIM_FLAG_FORWARD) {
            animInfo.animFrameAccelAssist = (animFrame << 0x10) + animInfo.animAccel;
        } else {
            animInfo.animFrameAccelAssist = (animFrame << 0x10) - animInfo.animAccel;
        }
    } else {
        if (curAnim.flags & ANIM_FLAG_FORWARD) {
            animInfo.animFrame = animFrame + 1;
        } else {
            animInfo.animFrame = animFrame - 1;
        }
    }
}

function is_anim_past_frame(m, animFrame) {
	var isPastFrame;
	var acceleratedFrame = animFrame << 0x10;
	var animInfo = m.marioObj.header.gfx.unk38;
	var curAnim = animInfo.curAnim;

	if (animInfo.animAccel) {
	    if (curAnim.flags & ANIM_FLAG_FORWARD) {
	        isPastFrame =
	            (animInfo.animFrameAccelAssist > acceleratedFrame)
	            && (acceleratedFrame >= (animInfo.animFrameAccelAssist - animInfo.animAccel));
	    } else {
	        isPastFrame =
	            (animInfo.animFrameAccelAssist < acceleratedFrame)
	            && (acceleratedFrame <= (animInfo.animFrameAccelAssist + animInfo.animAccel));
	    }
	} else {
	    if (curAnim.flags & ANIM_FLAG_FORWARD) {
	        isPastFrame = (animInfo.animFrame == (animFrame + 1));
	    } else {
	        isPastFrame = ((animInfo.animFrame + 1) == animFrame);
	    }
	}

	return isPastFrame;
}



function find_mario_anim_flags_and_translation (obj, yaw, translation) {
	var curAnim = obj.header.gfx.unk38.curAnim;
	var animFrame = geo_update_animation_frame(obj.header.gfx.unk38, null);
	var animValues = curAnim.values;

	var attribute = new ObjectDummy();
	attribute.indexToIndices = 0;
	attribute.indices = curAnim.indices;

	var s = sins(yaw);
	var c = coss(yaw);

	var dx = GeoRenderer.read_next_anim_value(animFrame, attribute, animValues) / 4.0; // @cv
	translation[@ 1] = GeoRenderer.read_next_anim_value(animFrame, attribute, animValues) / 4.0; // @cv
	var dz = GeoRenderer.read_next_anim_value(animFrame, attribute, animValues) / 4.0; // @cv

	translation[@ 0] = (dx * c) + (dz * s);
	translation[@ 2] = (-dx * s) + (dz * c);

	return curAnim.flags;
}
/// <pygml?v=1.0&h=b3702a4e2>
/// @function	update_mario_pos_for_anim(m)
/// @desc		Updates Mario's position from his animation's translation.
/// @param		{struct}	m
function update_mario_pos_for_anim(m) {
    var translation = Vec3s;
    var flags;

    flags = find_mario_anim_flags_and_translation(m.marioObj, m.faceAngle[1], translation);

    if (flags & (ANIM_FLAG_HOR_TRANS | ANIM_FLAG_6)) {
        m.pos[0] += translation[0];
        m.pos[2] += translation[2];
    }

    if (flags & (ANIM_FLAG_VERT_TRANS | ANIM_FLAG_6)) {
        m.pos[1] += translation[1];
    }
}
	
function return_mario_anim_y_translation(m) {
	var translation = Vec3;
	find_mario_anim_flags_and_translation(m.marioObj, 0, translation);
	return translation[1];
}

/**************************************************
 *                      AUDIO                     *
 **************************************************/
/// <pygml?v=1.0&h=57e18d2f9>
/// @function	play_sound_if_no_flag(m, soundBits, flags)
/// @desc		Plays a sound if if Mario doesn't have the flag being
///					checked.
/// @param		{struct}	m
/// @param		{u32}		soundBits
/// @param		{u32}		flags
function play_sound_if_no_flag(m, soundBits, flags) {
    if ((m.flags & flags) == 0) {
        play_sound(soundBits, m.marioObj.header.gfx.cameraToObject);
        m.flags |= flags;
    }
}
/// <pygml?v=1.0&h=1dc5914db>
/// @function	play_mario_jump_sound(m)
/// @desc		Plays a jump sound if one has not been played since the last
///					action change.
/// @param		{struct}	m
function play_mario_jump_sound(m) {
    if (!(m.flags & MARIO_MARIO_SOUND_PLAYED)) {
        if (m.action == ACT_TRIPLE_JUMP) {
            play_sound(SOUND_MARIO_YAHOO_WAHA_YIPPEE + ((gAudioRandom % 5) << 16),
                m.marioObj.header.gfx.cameraToObject);
        } else {
            play_sound(SOUND_MARIO_YAH_WAH_HOO + ((gAudioRandom % 3) << 16),
                m.marioObj.header.gfx.cameraToObject);
        }

        m.flags |= MARIO_MARIO_SOUND_PLAYED;
    }
}
/// <pygml?v=1.0&h=572caf651>
/// @function	adjust_sound_for_speed(m)
/// @desc		Adjusts the volume/pitch of sounds from Mario's speed.
/// @param		{struct}	m
function adjust_sound_for_speed(m) {
    var absForwardVel = (m.forwardVel > 0.0) ? m.forwardVel : -m.forwardVel;
    func_80320A4C(1, (absForwardVel > 100) ? 100 : absForwardVel);
}

/// <pygml?v=1.0&h=c1e48092e>
/// @function	play_sound_and_spawn_particles(m, soundBits, waveParticleType)
/// @desc		Spawns particles if the step sound says to, then either
///					plays a step sound or relevant other sound.
/// @param		{struct}	m
/// @param		{u32}		soundBits
/// @param		{u32}		waveParticleType
function play_sound_and_spawn_particles(m, soundBits, waveParticleType) {
    if (m.terrainSoundAddend == (SOUND_TERRAIN_WATER << 16)) {
        if (waveParticleType != 0) {
            m.particleFlags |= PARTICLE_SHALLOW_WATER_SPLASH;
        } else {
            m.particleFlags |= PARTICLE_SHALLOW_WATER_WAVE;
        }
    } else {
        if (m.terrainSoundAddend == (SOUND_TERRAIN_SAND << 16)) {
            m.particleFlags |= PARTICLE_DIRT;
        } else if (m.terrainSoundAddend == (SOUND_TERRAIN_SNOW << 16)) {
            m.particleFlags |= PARTICLE_SNOW;
        }
    }

    if ((m.flags & MARIO_METAL_CAP) || soundBits == SOUND_ACTION_UNSTUCK_FROM_GROUND ||
        soundBits == SOUND_MARIO_PUNCH_HOO) {
        play_sound(soundBits, m.marioObj.header.gfx.cameraToObject);
    } else {
        play_sound(m.terrainSoundAddend + soundBits, m.marioObj.header.gfx.cameraToObject);
    }
}
/// <pygml?v=1.0&h=79a789c21>
/// @function	play_mario_action_sound(m, soundBits, waveParticleType)
/// @desc		Plays an environmental sound if one has not been played
///					since the last action change.
/// @param		{struct}	m
/// @param		{u32}		soundBits
/// @param		{u32}		waveParticleType
function play_mario_action_sound(m, soundBits, waveParticleType) {
    if ((m.flags & MARIO_ACTION_SOUND_PLAYED) == 0) {
        play_sound_and_spawn_particles(m, soundBits, waveParticleType);
        m.flags |= MARIO_ACTION_SOUND_PLAYED;
    }
}
/// <pygml?v=1.0&h=373d24fd0>
/// @function	play_mario_landing_sound(m, soundBits)
/// @desc		Plays a landing sound, accounting for metal cap.
/// @param		{struct}	m
/// @param		{u32}		soundBits
function play_mario_landing_sound(m, soundBits) {
    play_sound_and_spawn_particles(
        m, (m.flags & MARIO_METAL_CAP) ? SOUND_ACTION_METAL_LANDING : soundBits, 1);
}

/// <pygml?v=1.0&h=468dcd41b>
/// @function	play_mario_landing_sound_once(m, soundBits)
/// @desc		Plays a landing sound, accounting for metal cap. Unlike
///					play_mario_landing_sound,  this function uses
///					play_mario_action_sound, making sure the sound is only
///					played once per action.
/// @param		{struct}	m
/// @param		{u32}		soundBits
function play_mario_landing_sound_once(m, soundBits) {
    play_mario_action_sound(m, (m.flags & MARIO_METAL_CAP) ? SOUND_ACTION_METAL_LANDING : soundBits,
        1);
}

/// <pygml?v=1.0&h=ca65ee683>
/// @function	play_mario_heavy_landing_sound(m, soundBits)
/// @desc		Plays a heavy landing (ground pound, etc.) sound, accounting
///					for metal cap.
/// @param		{struct}	m
/// @param		{u32}		soundBits
function play_mario_heavy_landing_sound(m, soundBits) {
    play_sound_and_spawn_particles(
        m, (m.flags & MARIO_METAL_CAP) ? SOUND_ACTION_METAL_HEAVY_LANDING : soundBits, 1);
}
/// <pygml?v=1.0&h=47308e9f0>
/// @function	play_mario_heavy_landing_sound_once(m, soundBits)
/// @desc		Plays a heavy landing (ground pound, etc.) sound, accounting
///					for metal cap.  Unlike play_mario_heavy_landing_sound, this
///					function uses play_mario_action_sound,  making sure the
///					sound is only played once per action.
/// @param		{struct}	m
/// @param		{u32}		soundBits
function play_mario_heavy_landing_sound_once(m, soundBits) {
    play_mario_action_sound(
        m, (m.flags & MARIO_METAL_CAP) ? SOUND_ACTION_METAL_HEAVY_LANDING : soundBits, 1);
}
/// <pygml?v=1.0&h=b9b888248>
/// @function	play_mario_sound(m, actionSound, marioSound)
/// @desc		Plays action and Mario sounds relevant to what was passed
///					into the function.
/// @param		{struct}	m
/// @param		{s32}		actionSound
/// @param		{s32}		marioSound
function play_mario_sound(m, actionSound, marioSound) {
    if (actionSound == SOUND_ACTION_TERRAIN_JUMP) {
        play_mario_action_sound(
            m, (m.flags & MARIO_METAL_CAP) ? SOUND_ACTION_METAL_JUMP :
            SOUND_ACTION_TERRAIN_JUMP, 1);
    } else {
        play_sound_if_no_flag(m, actionSound, MARIO_ACTION_SOUND_PLAYED);
    }

    if (marioSound == 0) {
        play_mario_jump_sound(m);
    }

    if (marioSound != -1) {
        play_sound_if_no_flag(m, marioSound, MARIO_MARIO_SOUND_PLAYED);
    }
}

/**************************************************
 *                     ACTIONS                    *
 **************************************************/
 
 /// <pygml?v=1.0&h=e54c820d8>
/// @function	mario_set_forward_vel(m, forwardVel)
/// @desc		Sets Mario's other velocities from his forward speed.
/// @param		{struct}	m
/// @param		{f32}		forwardVel
function mario_set_forward_vel(m, forwardVel) {
    m.forwardVel = forwardVel;

    m.slideVelX = sins(m.faceAngle[1]) * m.forwardVel;
    m.slideVelZ = coss(m.faceAngle[1]) * m.forwardVel;

    m.vel[0] = m.slideVelX;
    m.vel[2] = m.slideVelZ;
}

function mario_get_floor_class(m) {
	var floorClass;

	// The slide terrain type defaults to slide slipperiness.
	// This doesn't matter too much since normally the slide terrain
	// is checked for anyways.
	if ((m.area.terrainType & TERRAIN_MASK) == TERRAIN_SLIDE) {
	    floorClass = SURFACE_CLASS_VERY_SLIPPERY;
	} else {
	    floorClass = SURFACE_CLASS_DEFAULT;
	}

	if (m._floor) {
	    switch (m._floor.type) {
	        case SURFACE_NOT_SLIPPERY:
	        case SURFACE_HARD_NOT_SLIPPERY:
	        case SURFACE_SWITCH:
	            floorClass = SURFACE_CLASS_NOT_SLIPPERY;
	            break;

	        case SURFACE_SLIPPERY:
	        case SURFACE_NOISE_SLIPPERY:
	        case SURFACE_HARD_SLIPPERY:
	        case SURFACE_NO_CAM_COL_SLIPPERY:
	            floorClass = SURFACE_CLASS_SLIPPERY;
	            break;

	        case SURFACE_VERY_SLIPPERY:
	        case SURFACE_ICE:
	        case SURFACE_HARD_VERY_SLIPPERY:
	        case SURFACE_NOISE_VERY_SLIPPERY_73:
	        case SURFACE_NOISE_VERY_SLIPPERY_74:
	        case SURFACE_NOISE_VERY_SLIPPERY:
	        case SURFACE_NO_CAM_COL_VERY_SLIPPERY:
	            floorClass = SURFACE_CLASS_VERY_SLIPPERY;
	            break;
	    }
	}

	// Crawling allows Mario to not slide on certain steeper surfaces.
	if (m.action == ACT_CRAWLING && m._floor.normal.y > 0.5 && floorClass == SURFACE_CLASS_DEFAULT) {
	    floorClass = SURFACE_CLASS_NOT_SLIPPERY;
	}

	return floorClass;
}



/// <pygml?v=1.0&h=2e030499b>
/// @function	mario_get_terrain_sound_addend(m)
/// @desc		Computes a value that should be added to terrain sounds
///					before playing them.  This depends on surfaces and terrain.
/// @param		{struct}	m
/// @returns	u32
function mario_get_terrain_sound_addend(m) {
    var floorSoundType;
    var terrainType = m.area.terrainType & TERRAIN_MASK;
    var ret = SOUND_TERRAIN_DEFAULT << 16;
    var floorType;

    if (m._floor!=null) {
        
            floorType = m._floor.type;

            if ((gCurrLevelNum != LEVEL_LLL) && (m.floorHeight < (m.waterLevel - 10))) {
                // Water terrain sound, excluding LLL since it uses water in the volcano.
                ret = SOUND_TERRAIN_WATER << 16;
            } else if (SURFACE_IS_QUICKSAND(floorType)) {
                ret = SOUND_TERRAIN_SAND << 16;
            } else {
                switch (floorType) {
                    default:
                        floorSoundType = 0;
                        break;

                    case (SURFACE_NOT_SLIPPERY):
                    case (SURFACE_HARD):
                    case (SURFACE_HARD_NOT_SLIPPERY):
                    case (SURFACE_SWITCH):
                        floorSoundType = 1;
                        break;

                    case (SURFACE_SLIPPERY):
                    case (SURFACE_HARD_SLIPPERY):
                    case (SURFACE_NO_CAM_COL_SLIPPERY):
                        floorSoundType = 2;
                        break;

                    case (SURFACE_VERY_SLIPPERY):
                    case (SURFACE_ICE):
                    case (SURFACE_HARD_VERY_SLIPPERY):
                    case (SURFACE_NOISE_VERY_SLIPPERY_73):
                    case (SURFACE_NOISE_VERY_SLIPPERY_74):
                    case (SURFACE_NOISE_VERY_SLIPPERY):
                    case (SURFACE_NO_CAM_COL_VERY_SLIPPERY):
                        floorSoundType = 3;
                        break;

                    case (SURFACE_NOISE_DEFAULT):
                        floorSoundType = 4;
                        break;

                    case (SURFACE_NOISE_SLIPPERY):
                        floorSoundType = 5;
                        break;
                }

                ret = sTerrainSounds[terrainType][floorSoundType] << 16;
            }
        }

    return ret;
}

function resolve_and_return_wall_collisions(pos, offset, radius) {
		
	var collisionData = new ObjectDummy();
	collisionData.radius = radius;
	collisionData.offsetY = offset;
	collisionData.x = pos[0];
	collisionData.y = pos[1];
	collisionData.z = pos[2];
	collisionData.walls = [];

	var wall = null;

	if (find_wall_collisions(collisionData)>0) {
	    wall = collisionData.walls[collisionData.numWalls - 1];
	}

	pos[@ 0] = collisionData.x;
	pos[@ 1] = collisionData.y;
	pos[@ 2] = collisionData.z;

	return wall;
}
/// <pygml?v=1.0&h=17d59630f>
/// @function	vec3f_find_ceil(pos, height, ceil)
/// @desc		Finds the ceiling from a vec3f horizontally and a height
///					(with 80 vertical buffer).
/// @param		{Vec3f}		pos
/// @param		{f32}		height
/// @param		{struct}	ceil
/// @returns	f32
function vec3f_find_ceil(pos, height, _ceil) {
    var unused;

    return find_ceil(pos[0], height + 80.0, pos[2], _ceil);
}
/// <pygml?v=1.0&h=7d65ea85b>
/// @function	mario_facing_downhill(m, turnYaw)
/// @desc		Determines if Mario is facing "downhill."
/// @param		{struct}	m
/// @param		{s32}		turnYaw
/// @returns	s32
function mario_facing_downhill(m, turnYaw) {
    var faceAngleYaw = m.faceAngle[1];

    // This is never used in practice, as turnYaw is
    // always passed as zero.
    if (turnYaw && m.forwardVel < 0.0) {
        faceAngleYaw += 0x8000;
    }

    faceAngleYaw = m.floorAngle - faceAngleYaw;

    return (-0x4000 < faceAngleYaw) && (faceAngleYaw < 0x4000);
}
	
function mario_floor_is_slippery(m) {
	var normY;

	if ((m.area.terrainType & TERRAIN_MASK) == TERRAIN_SLIDE
	    && m._floor.normal.y < 0.9998477 //~cos(1 deg)
	) {
	    return true;
	}

	switch (mario_get_floor_class(m)) {
	    case SURFACE_VERY_SLIPPERY:
	        normY = 0.9848077; //~cos(10 deg)
	        break;

	    case SURFACE_SLIPPERY:
	        normY = 0.9396926; //~cos(20 deg)
	        break;

	    default:
	        normY = 0.7880108; //~cos(38 deg)
	        break;

	    case SURFACE_NOT_SLIPPERY:
	        normY = 0.0;
	        break;
	}

	return m._floor.normal.y <= normY;
}


function mario_floor_is_slope(m) {
	var normY;

	if ((m.area.terrainType & TERRAIN_MASK) == TERRAIN_SLIDE
	    && m._floor.normal.y < 0.9998477 //~cos(1 deg)
	) {
	    return true;
	}

	switch (mario_get_floor_class(m)) {
	    case SURFACE_VERY_SLIPPERY:
	        normY = 0.9961947; //~cos(10 deg)
	        break;

	    case SURFACE_SLIPPERY:
	        normY = 0.9848077; //~cos(20 deg)
	        break;

	    default:
	        normY = 0.9659258; //~cos(38 deg)
	        break;

	    case SURFACE_NOT_SLIPPERY:
	        normY = 0.9396926;
	        break;
	}

	return m._floor.normal.y <= normY;
}
	/// <pygml?v=1.0&h=91690cf0a>
/// @function	mario_floor_is_steep(m)
/// @desc		Determines if a surface is steep based on the surface class.
/// @param		{struct}	m
/// @returns	s32
function mario_floor_is_steep(m) {
    var normY;
    var result = false;

    // Interestingly, this function does not check for the
    // slide terrain type. This means that steep behavior persists for
    // non-slippery and slippery surfaces.
    // This does not matter in vanilla game practice.
    if (!mario_facing_downhill(m, false)) {
        switch (mario_get_floor_class(m)) {
            case (SURFACE_VERY_SLIPPERY):
                normY = 0.9659258; //~cos(15 deg)
                break;

            case (SURFACE_SLIPPERY):
                normY = 0.9396926; //~cos(20 deg)
                break;

            default:
                normY = 0.8660254; //~cos(30 deg)
                break;

            case (SURFACE_NOT_SLIPPERY):
                normY = 0.8660254; //~cos(30 deg)
                break;
        }

        result = m._floor.normal.y <= normY;
    }

    return result;
}
/// <pygml?v=1.0&h=33483f9a6>
/// @function	find_floor_height_relative_polar(m, angleFromMario, distFromMario)
/// @desc		Finds the floor height relative from Mario given polar
///					displacement.
/// @param		{struct}	m
/// @param		{s16}		angleFromMario
/// @param		{f32}		distFromMario
/// @returns	f32
function find_floor_height_relative_polar(m, angleFromMario, distFromMario) {
    var _floor = {};
    var floorY;

    var _y = sins(m.faceAngle[1] + angleFromMario) * distFromMario;
    var _x = coss(m.faceAngle[1] + angleFromMario) * distFromMario;

    floorY = find_floor(m.pos[0] + _y, m.pos[1] + 100.0, m.pos[2] + _x, _floor)
    _floor = _floor._floor;

    return floorY;
}


/// <pygml?v=1.0&h=4cf3da82f>
/// @function	find_floor_slope(m, yawOffset)
/// @desc		Returns the slope of the floor based off points around
///					Mario.
/// @param		{struct}	m
/// @param		{s16}		yawOffset
/// @returns	s16
function find_floor_slope(m, yawOffset) {
    var _floor = {};
    var forwardFloorY, backwardFloorY;
    var forwardYDelta, backwardYDelta;
    var result;

    var _x = sins(m.faceAngle[1] + yawOffset) * 5.0;
    var _z = coss(m.faceAngle[1] + yawOffset) * 5.0;

    forwardFloorY = find_floor(m.pos[0] + _x, m.pos[1] + 100.0, m.pos[2] + _z, _floor)
	_floor = _floor._floor;
    backwardFloorY = find_floor(m.pos[0] - _x, m.pos[1] + 100.0, m.pos[2] - _z, _floor)
    _floor = _floor._floor;

    //! If Mario is near OOB, these floorY's can sometimes be -11000.
    //  This will cause these to be off and give improper slopes.
    forwardYDelta = forwardFloorY - m.pos[1];
    backwardYDelta = m.pos[1] - backwardFloorY;

    if (forwardYDelta * forwardYDelta < backwardYDelta * backwardYDelta) {
        result = atan2s(5.0, forwardYDelta);
    } else {
        result = atan2s(5.0, backwardYDelta);
    }

    return result;
}

/// <pygml?v=1.0&h=da0bb23c6>
/// @function	update_mario_sound_and_camera(m)
/// @desc		Adjusts Mario's camera and sound based on his action status.
/// @param		{struct}	m
function update_mario_sound_and_camera(m) {
    var action = m.action;
    var camPreset = m.area.camera.mode;

    if (action == ACT_FIRST_PERSON) {
        raise_background_noise(2);
        gCameraMovementFlags &= ~CAM_MOVE_C_UP_MODE;
        // Go back to the last camera mode
        set_camera_mode(m.area.camera, -1, 1);
    } else if (action == ACT_SLEEPING) {
        raise_background_noise(2);
    }

    if (!(action & (ACT_FLAG_SWIMMING | ACT_FLAG_METAL_WATER))) {
        if (camPreset == CAMERA_MODE_BEHIND_MARIO || camPreset == CAMERA_MODE_WATER_SURFACE) {
            set_camera_mode(m.area.camera, m.area.camera.defMode, 1);
        }
    }
}

/// <pygml?v=1.0&h=bd6b01f95>
/// @function	set_steep_jump_action(m)
/// @desc		Transitions Mario to a steep jump action.
/// @param		{struct}	m
function set_steep_jump_action(m) {
    m.marioObj.rawData[oMarioSteepJumpYaw] = m.faceAngle[1];

    if (m.forwardVel > 0.0) {
        //! (0x8000) has undefined behavior. Therefore, this downcast has
        // undefined behavior if m.floorAngle >= 0.
        var angleTemp = m.floorAngle + 0x8000;
        var faceAngleTemp = m.faceAngle[1] - angleTemp;

        var _y = sins(faceAngleTemp) * m.forwardVel;
        var _x = coss(faceAngleTemp) * m.forwardVel * 0.75;

        m.forwardVel = sqrt(_y * _y + _x * _x);
        m.faceAngle[1] = atan2s(_x, _y) + angleTemp;
    }

    drop_and_set_mario_action(m, ACT_STEEP_JUMP, 0);
}

	
/// <pygml?v=1.0&h=fdc914185>
/// @function	set_mario_y_vel_based_on_fspeed(m, initialVelY, multiplier)
/// @desc		Sets Mario's vertical speed from his forward speed.
/// @param		{struct}	m
/// @param		{f32}		initialVelY
/// @param		{f32}		multiplier
function set_mario_y_vel_based_on_fspeed(m, initialVelY, multiplier) {
    // get_additive_y_vel_for_jumps is always 0 and a stubbed function.
    // It was likely trampoline related based on code location.
    m.vel[1] = initialVelY + get_additive_y_vel_for_jumps() + m.forwardVel * multiplier;

    if (m.squishTimer != 0 || m.quicksandDepth > 1.0) {
        m.vel[1] *= 0.5;
    }
}


/// <pygml?v=1.0&h=1aa2b8dae>
/// @function	set_mario_action_airborne(m, action, actionArg)
/// @desc		Transitions for a variety of airborne actions.
/// @param		{struct}	m
/// @param		{u32}		action
/// @param		{u32}		actionArg
/// @returns	u32
function set_mario_action_airborne(m, action, actionArg) {
    var fowardVel;

    if (m.squishTimer != 0 || m.quicksandDepth >= 1.0) {
        if (action == ACT_DOUBLE_JUMP || action == ACT_TWIRLING) {
            action = ACT_JUMP;
        }
    }

    switch (action) {
        case (ACT_DOUBLE_JUMP):
            set_mario_y_vel_based_on_fspeed(m, 52.0, 0.25);
            m.forwardVel *= 0.8;
            break;

        case (ACT_BACKFLIP):
            m.marioObj.header.gfx.unk38.animID = -1;
            m.forwardVel = -16.0;
            set_mario_y_vel_based_on_fspeed(m, 62.0, 0.0);
            break;

        case (ACT_TRIPLE_JUMP):
            set_mario_y_vel_based_on_fspeed(m, 69.0, 0.0);
            m.forwardVel *= 0.8;
            break;

        case (ACT_FLYING_TRIPLE_JUMP):
            set_mario_y_vel_based_on_fspeed(m, 82.0, 0.0);
            break;

        case (ACT_WATER_JUMP):
        case (ACT_HOLD_WATER_JUMP):
            if (actionArg == 0) {
                set_mario_y_vel_based_on_fspeed(m, 42.0, 0.0);
            }
            break;

        case (ACT_BURNING_JUMP):
            m.vel[1] = 31.5;
            m.forwardVel = 8.0;
            break;

        case (ACT_RIDING_SHELL_JUMP):
            set_mario_y_vel_based_on_fspeed(m, 42.0, 0.25);
            break;

        case (ACT_JUMP):
        case (ACT_HOLD_JUMP):
            m.marioObj.header.gfx.unk38.animID = -1;
            set_mario_y_vel_based_on_fspeed(m, 42.0, 0.25);
            m.forwardVel *= 0.8;
            break;

        case (ACT_WALL_KICK_AIR):
        case (ACT_TOP_OF_POLE_JUMP):
            set_mario_y_vel_based_on_fspeed(m, 62.0, 0.0);
            if (m.forwardVel < 24.0) {
                m.forwardVel = 24.0;
            }
            m.wallKickTimer = 0;
            break;

        case (ACT_SIDE_FLIP):
            set_mario_y_vel_based_on_fspeed(m, 62.0, 0.0);
            m.forwardVel = 8.0;
            m.faceAngle[1] = m.intendedYaw;
            break;

        case (ACT_STEEP_JUMP):
            m.marioObj.header.gfx.unk38.animID = -1;
            set_mario_y_vel_based_on_fspeed(m, 42.0, 0.25);
            m.faceAngle[0] = -0x2000;
            break;

        case (ACT_LAVA_BOOST):
            m.vel[1] = 84.0;
            if (actionArg == 0) {
                m.forwardVel = 0.0;
            }
            break;

        case (ACT_DIVE):
			fowardVel = m.forwardVel + 15.0;
            if (fowardVel > 48.0) {
                fowardVel = 48.0;
            }
            mario_set_forward_vel(m, fowardVel);
            break;

        case (ACT_LONG_JUMP):
            m.marioObj.header.gfx.unk38.animID = -1;
            set_mario_y_vel_based_on_fspeed(m, 30.0, 0.0);
            m.marioObj.rawData[oMarioLongJumpIsSlow] = m.forwardVel > 16.0 ? false : true;

            //! (BLJ's) This properly handles long jumps from getting forward speed with
            //  too much velocity, but misses backwards longs allowing high negative speeds.
			m.forwardVel *= 1.5;
            if (m.forwardVel > 48.0) {
                m.forwardVel = 48.0;
            }
            break;

        case (ACT_SLIDE_KICK):
            m.vel[1] = 12.0;
            if (m.forwardVel < 32.0) {
                m.forwardVel = 32.0;
            }
            break;

        case (ACT_JUMP_KICK):
            m.vel[1] = 20.0;
            break;
    }

    m.peakHeight = m.pos[1];
    m.flags |= MARIO_UNKNOWN_08;

    return action;
}



function set_mario_action_moving(m, action, actionArg) {
	var floorClass = mario_get_floor_class(m);
	var forwardVel = m.forwardVel;
	var mag = min(m.intendedMag, 8.0);

	switch (action) {
	    case ACT_WALKING:
	        if (floorClass != SURFACE_CLASS_VERY_SLIPPERY) {
	            if (0.0 <= forwardVel && forwardVel < mag) {
	                m.forwardVel = mag;
	            }
	        }

	        m.marioObj.rawData[oMarioWalkingPitch] = 0;
	        break;
        case ACT_HOLD_WALKING:
            if (0.0 <= forwardVel && forwardVel < mag / 2.0) {
                m.forwardVel = mag / 2.0;
            }
            break;

        case ACT_BEGIN_SLIDING:
            if (mario_facing_downhill(m, false)) {
                action = ACT_BUTT_SLIDE;
            } else {
                action = ACT_STOMACH_SLIDE;
            }
            break;

        case ACT_HOLD_BEGIN_SLIDING:
            if (mario_facing_downhill(m, false)) {
                action = ACT_HOLD_BUTT_SLIDE;
            } else {
                action = ACT_HOLD_STOMACH_SLIDE;
            }
            break;			
	}

	return action;
}
/// <pygml?v=1.0&h=d6d55d5f2>
/// @function	set_mario_action_submerged(m, action, actionArg)
/// @param		{struct}	m
/// @param		{u32}		action
/// @param		{u32}		actionArg
/// @returns	u32
function set_mario_action_submerged(m, action, actionArg) {
    if (action == ACT_METAL_WATER_JUMP || action == ACT_HOLD_METAL_WATER_JUMP) {
        m.vel[1] = 32.0;
    }

    return action;
}
/// <pygml?v=1.0&h=d341f2854>
/// @function	set_mario_action_cutscene(m, action, actionArg)
/// @desc		Transitions for a variety of cutscene actions.
/// @param		{struct}	m
/// @param		{u32}		action
/// @param		{u32}		actionArg
/// @returns	u32
function set_mario_action_cutscene(m, action, actionArg) {
    switch (action) {
        case (ACT_EMERGE_FROM_PIPE):
            m.vel[1] = 52.0;
            break;

        case (ACT_FALL_AFTER_STAR_GRAB):
            mario_set_forward_vel(m, 0.0);
            break;

        case (ACT_SPAWN_SPIN_AIRBORNE):
            mario_set_forward_vel(m, 2.0);
            break;

        case (ACT_SPECIAL_EXIT_AIRBORNE):
        case (ACT_SPECIAL_DEATH_EXIT):
            m.vel[1] = 64.0;
            break;
    }

    return action;
}

function set_mario_action(m, action, actionArg) {

	switch (action & ACT_GROUP_MASK) {
	    case ACT_GROUP_MOVING:
	        action = set_mario_action_moving(m, action, actionArg); break;
	    case ACT_GROUP_AIRBORNE:
	        action = set_mario_action_airborne(m, action, actionArg); break;
        case ACT_GROUP_SUBMERGED:
            action = set_mario_action_submerged(m, action, actionArg);
            break;
        case ACT_GROUP_CUTSCENE:
            action = set_mario_action_cutscene(m, action, actionArg);
            break;
	}

	m.flags &= ~(MARIO_ACTION_SOUND_PLAYED | MARIO_MARIO_SOUND_PLAYED);

	m.prevAction = m.action;
	m.action = action;
	m.actionArg = actionArg;
	m.actionState = 0;
	m.actionTimer = 0;

	return 1;
}

/// <pygml?v=1.0&h=428c26356>
/// @function	set_jump_from_landing(m)
/// @desc		Puts Mario into a specific jumping action from a landing
///					action.
/// @param		{struct}	m
/// @returns	s32
function set_jump_from_landing(m) {
    if (m.quicksandDepth >= 11.0) {
        if (m.heldObj == null) {
            return set_mario_action(m, ACT_QUICKSAND_JUMP_LAND, 0);
        } else {
            return set_mario_action(m, ACT_HOLD_QUICKSAND_JUMP_LAND, 0);
        }
    }

    if (mario_floor_is_steep(m)) {
        set_steep_jump_action(m);
    } else {
        if ((m.doubleJumpTimer == 0) || (m.squishTimer != 0)) {
            set_mario_action(m, ACT_JUMP, 0);
        } else {
            switch (m.prevAction) {
                case (ACT_JUMP_LAND):
                    set_mario_action(m, ACT_DOUBLE_JUMP, 0);
                    break;

                case (ACT_FREEFALL_LAND):
                    set_mario_action(m, ACT_DOUBLE_JUMP, 0);
                    break;

                case (ACT_SIDE_FLIP_LAND_STOP):
                    set_mario_action(m, ACT_DOUBLE_JUMP, 0);
                    break;

                case (ACT_DOUBLE_JUMP_LAND):
                    // If Mario has a wing cap, he ignores the typical speed
                    // requirement for a triple jump.
                    if (m.flags & MARIO_WING_CAP) {
                        set_mario_action(m, ACT_FLYING_TRIPLE_JUMP, 0);
                    } else if (m.forwardVel > 20.0) {
                        set_mario_action(m, ACT_TRIPLE_JUMP, 0);
                    } else {
                        set_mario_action(m, ACT_JUMP, 0);
                    }
                    break;

                default:
                    set_mario_action(m, ACT_JUMP, 0);
                    break;
            }
        }
    }

    m.doubleJumpTimer = 0;

    return true;
}

/// <pygml?v=1.0&h=79f1aa4dc>
/// @function	set_jumping_action(m, action, actionArg)
/// @desc		Puts Mario in a given action, as long as it is not overruled
///					by  either a quicksand or steep jump.
/// @param		{struct}	m
/// @param		{u32}		action
/// @param		{u32}		actionArg
/// @returns	s32
function set_jumping_action(m, action, actionArg) {
    var currAction = m.action;

    if (m.quicksandDepth >= 11.0) {
        // Checks whether Mario is holding an object or not.
        if (m.heldObj == null) {
            return set_mario_action(m, ACT_QUICKSAND_JUMP_LAND, 0);
        } else {
            return set_mario_action(m, ACT_HOLD_QUICKSAND_JUMP_LAND, 0);
        }
    }

    if (mario_floor_is_steep(m)) {
        set_steep_jump_action(m);
    } else {
        set_mario_action(m, action, actionArg);
    }

    return true;
}
/// <pygml?v=1.0&h=79cd37452>
/// @function	drop_and_set_mario_action(m, action, actionArg)
/// @desc		Drop anything Mario is holding and set a new action.
/// @param		{struct}	m
/// @param		{u32}		action
/// @param		{u32}		actionArg
/// @returns	s32
function drop_and_set_mario_action(m, action, actionArg) {
    //mario_stop_riding_and_holding(m); // @z @TODO

    return set_mario_action(m, action, actionArg);
}
/// <pygml?v=1.0&h=1703840d6>
/// @function	hurt_and_set_mario_action(m, action, actionArg, hurtCounter)
/// @desc		Increment Mario's hurt counter and set a new action.
/// @param		{struct}	m
/// @param		{u32}		action
/// @param		{u32}		actionArg
/// @param		{s16}		hurtCounter
/// @returns	s32
function hurt_and_set_mario_action(m, action, actionArg, hurtCounter) {
    m.hurtCounter = hurtCounter;

    return set_mario_action(m, action, actionArg);
}
/// <pygml?v=1.0&h=eb0716466>
/// @function	check_common_action_exits(m)
/// @desc		Checks a variety of inputs for common transitions between
///					many different  actions. A common variant of the below
///					function.
/// @param		{struct}	m
/// @returns	s32
function check_common_action_exits(m) {
    if (m.input & INPUT_A_PRESSED) {
        return set_mario_action(m, ACT_JUMP, 0);
    }
    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_FREEFALL, 0);
    }
    if (m.input & INPUT_NONZERO_ANALOG) {
        return set_mario_action(m, ACT_WALKING, 0);
    }
    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
    }

    return false;
}
/// <pygml?v=1.0&h=3434b7625>
/// @function	check_common_hold_action_exits(m)
/// @desc		Checks a variety of inputs for common transitions between
///					many different  object holding actions. A holding variant of
///					the above function.
/// @param		{struct}	m
/// @returns	s32
function check_common_hold_action_exits(m) {
    if (m.input & INPUT_A_PRESSED) {
        return set_mario_action(m, ACT_HOLD_JUMP, 0);
    }
    if (m.input & INPUT_OFF_FLOOR) {
        return set_mario_action(m, ACT_HOLD_FREEFALL, 0);
    }
    if (m.input & INPUT_NONZERO_ANALOG) {
        return set_mario_action(m, ACT_HOLD_WALKING, 0);
    }
    if (m.input & INPUT_ABOVE_SLIDE) {
        return set_mario_action(m, ACT_HOLD_BEGIN_SLIDING, 0);
    }

    return false;
}
/// <pygml?v=1.0&h=a9511793e>
/// @function	transition_submerged_to_walking(m)
/// @desc		Transitions Mario from a submerged action to a walking
///					action.
/// @param		{struct}	m
/// @returns	s32
function transition_submerged_to_walking(m) {
    set_camera_mode(m.area.camera, m.area.camera.defMode, 1);

    vec3s_set(m.angleVel, 0, 0, 0);

    if (m.heldObj == null) {
        return set_mario_action(m, ACT_WALKING, 0);
    } else {
        return set_mario_action(m, ACT_HOLD_WALKING, 0);
    }
}
/// <pygml?v=1.0&h=8a2786b62>
/// @function	set_water_plunge_action(m)
/// @desc		This is the transition function typically for entering a
///					submerged action for a  non-submerged action. This also
///					applies the water surface camera preset.
/// @param		{struct}	m
/// @returns	s32
function set_water_plunge_action(m) {
    m.forwardVel = m.forwardVel / 4.0;
    m.vel[1] = m.vel[1] / 2.0;

    m.pos[1] = m.waterLevel - 100;

    m.faceAngle[2] = 0;

    vec3s_set(m.angleVel, 0, 0, 0);

    if ((m.action & ACT_FLAG_DIVING) == 0) {
        m.faceAngle[0] = 0;
    }

    if (m.area.camera.mode != CAMERA_MODE_WATER_SURFACE) {
        set_camera_mode(m.area.camera, CAMERA_MODE_WATER_SURFACE, 1);
    }

    return set_mario_action(m, ACT_WATER_PLUNGE, 0);
}



/// <pygml?v=1.0&h=5eaf69b85>
/// @function	squish_mario_model(m)
/// @desc		Applies the squish to Mario's model via scaling.
/// @param		{struct}	m
function squish_mario_model(m) {
    if (m.squishTimer == 0xFF) return;
	
    // If no longer squished, scale back to default.
    if (m.squishTimer == 0) {
        vec3f_set(m.marioObj.header.gfx.scale, 1.0, 1.0, 1.0);
    }
    // If timer is less than 16, rubber-band Mario's size scale up and down.
    else if (m.squishTimer <= 16) {
        m.squishTimer -= 1;

        m.marioObj.header.gfx.scale[1] =
            1.0 - ((sSquishScaleOverTime[15 - m.squishTimer] * 0.6) / 100.0);
        m.marioObj.header.gfx.scale[0] =
            ((sSquishScaleOverTime[15 - m.squishTimer] * 0.4) / 100.0) + 1.0;

        m.marioObj.header.gfx.scale[2] = m.marioObj.header.gfx.scale[0];
    } else {
        m.squishTimer -= 1;

        vec3f_set(m.marioObj.header.gfx.scale, 1.4, 0.4, 1.4);
    }
}

/// <pygml?v=1.0&h=bd6cb1c63>
/// @function	update_mario_button_inputs(m)
/// @desc		Update the button inputs for Mario.
/// @param		{struct}	m
function update_mario_button_inputs(m) {
    if (m.controller.buttonPressed & A_BUTTON) {
        m.input |= INPUT_A_PRESSED;
    }

    if (m.controller.buttonDown & A_BUTTON) {
        m.input |= INPUT_A_DOWN;
    }

    // Don't update for these buttons if squished.
    if (m.squishTimer == 0) {
        if (m.controller.buttonPressed & B_BUTTON) {
            m.input |= INPUT_B_PRESSED;
        }

        if (m.controller.buttonDown & Z_TRIG) {
            m.input |= INPUT_Z_DOWN;
        }

        if (m.controller.buttonPressed & Z_TRIG) {
            m.input |= INPUT_Z_PRESSED;
        }
    }

    if (m.input & INPUT_A_PRESSED) {
        m.framesSinceA = 0;
    } else if (m.framesSinceA < 0xFF) {
        m.framesSinceA += 1;
    }

    if (m.input & INPUT_B_PRESSED) {
        m.framesSinceB = 0;
    } else if (m.framesSinceB < 0xff) {
        m.framesSinceB += 1;
    }
}

function update_mario_joystick_inputs(m) {

	//var mag = m.controller.stickMag;
	var mag = ((m.controller.stickMag / 64.0) * (m.controller.stickMag / 64.0)) * 64.0;

    if (m.squishTimer == 0) {
		m.intendedMag = mag / 2.0;
    } else {
		m.intendedMag = mag / 8.0;
    }

	if (m.intendedMag > 0.0) {
	    m.intendedYaw = atan2s(-m.controller.stickY, m.controller.stickX) + m.area.camera.yaw;
	    m.input |= INPUT_NONZERO_ANALOG;
	} else {
	    m.intendedYaw = m.faceAngle[1];
	}

}


function update_mario_geometry_inputs(m) {
	
	var gasLevel;
	var ceilToFloorDist;
		
	f32_find_wall_collision(m.pos[0], m.pos[1], m.pos[2], 60.0, 50.0);
	var _ptr = Ptr;
	m.pos[0] =	_ptr.p_xPtr;
	m.pos[1] =	_ptr.p_yPtr;
	m.pos[2] =	_ptr.p_zPtr;
	f32_find_wall_collision(m.pos[0], m.pos[1], m.pos[2], 30.0, 24.0);
	m.pos[0] =	_ptr.p_xPtr;
	m.pos[1] =	_ptr.p_yPtr;
	m.pos[2] =	_ptr.p_zPtr;	
	
	m.floorHeight = find_floor(m.pos[0], m.pos[1], m.pos[2], m);
	
    if (m._floor == null) {
        vec3f_copy(m.pos, m.marioObj.header.gfx.pos);
        m._floorHeight = find_floor(m.pos[0], m.pos[1], m.pos[2], m);
    }

	m.ceilHeight	= vec3f_find_ceil(m.pos, m.floorHeight, m._ceil);
	gasLevel		= find_poison_gas_level(m.pos[0], m.pos[2]);
	m.waterLevel	= find_water_level(m.pos[0], m.pos[2]);

	if (m._floor!=null) {
	    m.floorAngle = atan2s(m._floor.normal.z, m._floor.normal.x)
		m.terrainSoundAddend = mario_get_terrain_sound_addend(m);

	    if ((m.pos[1] > m.waterLevel - 40) && mario_floor_is_slippery(m)) {
	        m.input |= INPUT_ABOVE_SLIDE
	    }

	    if ((m._floor.flags & SURFACE_FLAG_DYNAMIC)
	        || (m._ceil && m._ceil.flags & SURFACE_FLAG_DYNAMIC)) {
	        var ceilToFloorDist = m.ceilHeight - m.floorHeight;

	        if ((0.0 <= ceilToFloorDist) && (ceilToFloorDist <= 150.0)) {
	            m.input |= INPUT_SQUISHED
	        }
	    }

	    if (m.pos[1] > m.floorHeight + 100.0) {
	        m.input |= INPUT_OFF_FLOOR;
	    }

	    if (m.pos[1] < (m.waterLevel - 10)) {
	        m.input |= INPUT_IN_WATER
	    }
		
        if (m.pos[1] < (gasLevel - 100.0)) {
            m.input |= INPUT_IN_POISON_GAS;
        }

	} else {
	    level_trigger_warp(m, WARP_OP_DEATH);
	}
}

	
function update_mario_inputs(m) {
	m.particleFlags = 0;
	m.input = 0;
	m.collidedObjInteractTypes = m.marioObj.collidedObjInteractTypes;
	m.flags &= 0xFFFFFF;

	update_mario_joystick_inputs(m);
	update_mario_button_inputs(m);
	update_mario_geometry_inputs(m);

	if (gCameraMovementFlags & CAM_MOVE_C_UP_MODE) {
	    if (m.action & ACT_FLAG_ALLOW_FIRST_PERSON) {
	        m.input |= INPUT_FIRST_PERSON;
	    } else {
	        gCameraMovementFlags &= ~CAM_MOVE_C_UP_MODE;
	    }
	}

	if (!(m.input & (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED))) {
	    m.input |= INPUT_UNKNOWN_5;
	}

	if (m.marioObj.rawData[oInteractStatus]
	    & (INT_STATUS_HOOT_GRABBED_BY_MARIO | INT_STATUS_MARIO_UNK1 | INT_STATUS_MARIO_UNK4)) {
	    m.input |= INPUT_UNKNOWN_10
	}
	
	if (m.wallKickTimer > 0) {
	    m.wallKickTimer--;
	}

	if (m.doubleJumpTimer > 0) {
	    m.doubleJumpTimer--;
	}
}
/// <pygml?v=1.0&h=3ffdffd7a>
/// @function	set_submerged_cam_preset_and_spawn_bubbles(m)
/// @desc		Set's the camera preset for submerged action behaviors.
/// @param		{struct}	m
function set_submerged_cam_preset_and_spawn_bubbles(m) {
    var heightBelowWater;
    var camPreset;

    if ((m.action & ACT_GROUP_MASK) == ACT_GROUP_SUBMERGED) {
        heightBelowWater = (m.waterLevel - 80) - m.pos[1];
        camPreset = m.area.camera.mode;

        if ((m.action & ACT_FLAG_METAL_WATER)) {
            if (camPreset != CAMERA_MODE_CLOSE) {
                set_camera_mode(m.area.camera, CAMERA_MODE_CLOSE, 1);
            }
        } else {
            if ((heightBelowWater > 800.0) && (camPreset != CAMERA_MODE_BEHIND_MARIO)) {
                set_camera_mode(m.area.camera, CAMERA_MODE_BEHIND_MARIO, 1);
            }

            if ((heightBelowWater < 400.0) && (camPreset != CAMERA_MODE_WATER_SURFACE)) {
                set_camera_mode(m.area.camera, CAMERA_MODE_WATER_SURFACE, 1);
            }

            // As long as Mario isn't drowning or at the top
            // of the water with his head out, spawn bubbles.
            if ((m.action & ACT_FLAG_INTANGIBLE) == 0) {
                if ((m.pos[1] < (m.waterLevel - 160)) || (m.faceAngle[0] < -0x800)) {
                    m.particleFlags |= PARTICLE_BUBBLE;
                }
            }
        }
    }
}

/// <pygml?v=1.0&h=68e16edaf>
/// @function	update_mario_health(m)
/// @desc		Both increments and decrements Mario's HP.
/// @param		{struct}	m
function update_mario_health(m) {
    var terrainIsSnow;

    if (m._health >= 0x100) {
        // When already healing or hurting Mario, Mario's HP is not changed any more here.
        if ((m.healCounter | m.hurtCounter) == 0) {
            if ((m.input & INPUT_IN_POISON_GAS) && ((m.action & ACT_FLAG_INTANGIBLE) == 0)) {
                if (((m.flags & MARIO_METAL_CAP) == 0) && (gDebugLevelSelect == 0)) {
                    m._health -= 4;
                }
            } else {
                if ((m.action & ACT_FLAG_SWIMMING) && ((m.action & ACT_FLAG_INTANGIBLE) == 0)) {
                    terrainIsSnow = (m.area.terrainType & TERRAIN_MASK) == TERRAIN_SNOW;

                    // When Mario is near the water surface, recover _health (unless in snow),
                    // when in snow terrains lose 3 _health.
                    // If using the debug level select, do not lose any HP to water.
                    if ((m.pos[1] >= (m.waterLevel - 140)) && !terrainIsSnow) {
                        m._health += 0x1A;
                    } else if (gDebugLevelSelect == 0) {
                        m._health -= (terrainIsSnow ? 3 : 1);
                    }
                }
            }
        }

        if (m.healCounter > 0) {
            m._health += 0x40;
            m.healCounter--;
        }
        if (m.hurtCounter > 0) {
            m._health -= 0x40;
            m.hurtCounter--;
        }

        if (m._health >= 0x881) {
            m._health = 0x880;
        }
        if (m._health < 0x100) {
            m._health = 0xFF;
        }

        // Play a noise to alert the player when Mario is close to drowning.
        if (((m.action & ACT_GROUP_MASK) == ACT_GROUP_SUBMERGED) && (m._health < 0x300)) {
            play_sound(SOUND_MOVING_ALMOST_DROWNING, gDefaultSoundArgs);
        }
    }
}

function update_mario_info_for_cam(m) {
	m.marioBodyState.action = m.action;
	m.statusForCamera.action = m.action;
	
	vec3f_copy(m.statusForCamera.faceAngle, m.faceAngle);

	if ((m.flags & MARIO_UNKNOWN_25) == 0) {
	    vec3f_copy(m.statusForCamera.pos, m.pos);
	}
}
/// <pygml?v=1.0&h=4a16593e5>
/// @function	mario_reset_bodystate(m)
/// @desc		Resets Mario's model, done every time an action is executed.
/// @param		{struct}	m
function mario_reset_bodystate(m) {
    var bodyState = m.marioBodyState;

    bodyState.capState		= MARIO_HAS_DEFAULT_CAP_OFF;
    bodyState.eyeState		= MARIO_EYES_BLINK;
    bodyState.handState		= MARIO_HAND_FISTS;
    bodyState.modelState	= 0;
    bodyState.wingFlutter	= false;

    m.flags &= ~MARIO_METAL_SHOCK;
}
/// <pygml?v=1.0&h=86671e444>
/// @function	sink_mario_in_quicksand(m)
/// @desc		Adjusts Mario's graphical height for quicksand.
/// @param		{struct}	m
function sink_mario_in_quicksand(m) {
    var o = gCurrentObject;

    var o = m.marioObj;

    if (o.header.gfx.throwMatrix!=null) {
       o.header.gfx.throwMatrix[M31] -= m.quicksandDepth;
    }

    o.header.gfx.pos[1] -= m.quicksandDepth;
}


/// <pygml?v=1.0&h=517cbecae>
/// @function	update_and_return_cap_flags(m)
/// @desc		Updates the cap flags mainly based on the cap timer.
/// @param		{struct}	m
/// @returns	u32
function update_and_return_cap_flags(m) {
    var flags = m.flags;
    var action;

    if (m.capTimer > 0) {
        action = m.action;

        if ((m.capTimer <= 60) ||
            ((action != ACT_READING_AUTOMATIC_DIALOG) && (action != ACT_READING_NPC_DIALOG) &&
                (action != ACT_READING_SIGN) && (action != ACT_IN_CANNON))) {
            m.capTimer -= 1;
        }

        if (m.capTimer == 0) {
            stop_cap_music();

            m.flags &= ~(MARIO_VANISH_CAP | MARIO_METAL_CAP | MARIO_WING_CAP);
            if ((m.flags & (MARIO_NORMAL_CAP | MARIO_VANISH_CAP | MARIO_METAL_CAP | MARIO_WING_CAP)) ==
                0) {
                m.flags &= ~MARIO_CAP_ON_HEAD;
            }
        }

        if (m.capTimer == 0x3C) {
            fadeout_cap_music();
        }

        // This code flickers the cap through a long binary string, increasing in how
        // common it flickers near the end.
        if ((m.capTimer < 0x40) && (( /*1ULL*/ 1 << m.capTimer) & sCapFlickerFrames)) {
            flags &= ~(MARIO_VANISH_CAP | MARIO_METAL_CAP | MARIO_WING_CAP);
            if ((flags & (MARIO_NORMAL_CAP | MARIO_VANISH_CAP | MARIO_METAL_CAP | MARIO_WING_CAP)) ==
                0) {
                flags &= ~MARIO_CAP_ON_HEAD;
            }
        }
    }

    return flags;
}

/// <pygml?v=1.0&h=f63243c48>
/// @function	mario_update_hitbox_and_cap_model(m)
/// @desc		Updates the Mario's cap, rendering, and hitbox.
/// @param		{struct}	m
function mario_update_hitbox_and_cap_model(m) {
    var bodyState = m.marioBodyState;
    var flags = update_and_return_cap_flags(m);

    if (flags & MARIO_VANISH_CAP) {
        bodyState.modelState = MODEL_STATE_NOISE_ALPHA;
    }

    if (flags & MARIO_METAL_CAP) {
        bodyState.modelState |= MODEL_STATE_METAL;
    }

    if (flags & MARIO_METAL_SHOCK) {
        bodyState.modelState |= MODEL_STATE_METAL;
    }

    if (m.invincTimer >= 3) {
        //! (Pause buffered hitstun) Since the global timer increments while paused,
        //  this can be paused through to give continual invisibility. This leads to
        //  no interaction with objects.
        if (gGlobalTimer & 1) {
            gMarioState.marioObj.header.gfx.node.flags |= GRAPH_RENDER_INVISIBLE;
        }
    }

    if (flags & MARIO_CAP_IN_HAND) {
        if (flags & MARIO_WING_CAP) {
            bodyState.handState = MARIO_HAND_HOLDING_WING_CAP;
        } else {
            bodyState.handState = MARIO_HAND_HOLDING_CAP;
        }
    }

    if (flags & MARIO_CAP_ON_HEAD) {
        if (flags & MARIO_WING_CAP) {
            bodyState.capState = MARIO_HAS_WING_CAP_ON;
        } else {
            bodyState.capState = MARIO_HAS_DEFAULT_CAP_ON;
        }
    }

    // Short hitbox for crouching/crawling/etc.
    if (m.action & ACT_FLAG_SHORT_HITBOX) {
        m.marioObj.hitboxHeight = 100.0;
    } else {
        m.marioObj.hitboxHeight = 160.0;
    }

    if ((m.flags & MARIO_TELEPORTING) && (m.fadeWarpOpacity != 0xFF)) {
        bodyState.modelState &= ~0xFF;
        bodyState.modelState |= (0x100 | m.fadeWarpOpacity);
    }
}

		
function mario_execute_submerged_action() {throw("@TODO add me");}

function execute_mario_action(o) {
	
	var inLoop = true;
	
	
	if (gMarioState.action) {
	    gMarioState.marioObj.header.gfx.node.flags &= ~GRAPH_RENDER_INVISIBLE;
		
		mario_reset_bodystate(gMarioState);
		update_mario_inputs(gMarioState);
        mario_handle_special_floors(gMarioState);
		mario_process_interactions(gMarioState);
		
        // If Mario is OOB, stop executing actions.
        if (gMarioState._floor == null) {
            return 0;
        }

		while (inLoop) {
			var func = mario_act_group_lut[(gMarioState.action & ACT_GROUP_MASK)];
			inLoop = func(gMarioState);
		}
		
        sink_mario_in_quicksand(gMarioState);
        squish_mario_model(gMarioState);
        set_submerged_cam_preset_and_spawn_bubbles(gMarioState);
        update_mario_health(gMarioState);
        update_mario_info_for_cam(gMarioState);
        mario_update_hitbox_and_cap_model(gMarioState)
			
        // Both of the wind handling portions play wind audio only in
        // non-Japanese releases.
        if (gMarioState._floor.type == SURFACE_HORIZONTAL_WIND) {
            spawn_wind_particles(0, (gMarioState._floor.force << 8));
            play_sound(SOUND_ENV_WIND2, gMarioState.marioObj.header.gfx.cameraToObject);
        }
		
        if (gMarioState._floor.type == SURFACE_VERTICAL_WIND) {
            spawn_wind_particles(1, 0);
            play_sound(SOUND_ENV_WIND2, gMarioState.marioObj.header.gfx.cameraToObject);
        }
		
        play_infinite_stairs_music();

	    gMarioState.marioObj.rawData[oInteractStatus] = 0;
		
		return gMarioState.particleFlags;
	}
	
	return 0;
}
 
 
function init_marios () {
	for(var i = 0; i < array_length(gMarioObject); i++) {
			
		//log("init mario", i);
			
		gMarioStates[i].actionTimer = 0;
		gMarioStates[i].framesSinceA = 0xFF;
		gMarioStates[i].framesSinceB = 0xFF;
		gMarioStates[i].invincTimer = 0;
		gMarioStates[i].flags = MARIO_CAP_ON_HEAD | MARIO_NORMAL_CAP;
		gMarioStates[i].forwardVel = 0.0;
		gMarioStates[i].squishTimer = 0;
		gMarioStates[i].hurtCounter = 0;
		gMarioStates[i].healCounter = 0;
		gMarioStates[i].capTimer = 0; 
		gMarioStates[i].quicksandDepth = 0.0;
	    gMarioStates[i].heldObj = null;
	    gMarioStates[i].riddenObj = null;
	    gMarioStates[i].usedObj = null;
	    gMarioStates[i].waterLevel = find_water_level(gMarioSpawnInfo.startPos[0], gMarioSpawnInfo.startPos[2]);
		gMarioStates[i].area = gCurrentArea;
		gMarioStates[i].marioObj = gMarioObject[i];
		gMarioStates[i].faceAngle = gMarioObject[i].header.gfx.angle;
		gMarioStates[i].angleVel = Vec3;
		gMarioStates[i].pos = gMarioObject[i].header.gfx.pos;
		gMarioStates[i].vel = Vec3;
		gMarioStates[i].action = ACT_IDLE;
		gMarioStates[i]._floor = null;
		gMarioStates[i]._ceil = null;
		gMarioStates[i].controller = gControllers[i];
		
		
	    //vec3f_copy(gMarioStates[i].faceAngle, gMarioSpawnInfo[i].startAngle);
	    //vec3s_set(gMarioStates[i].angleVel, 0, 0, 0);
	    //vec3s_set(gMarioStates[i].pos, gMarioSpawnInfo[i].startPos[0], gMarioSpawnInfo[i].startPos[1], gMarioSpawnInfo[i].startPos[2]);
	    //vec3f_set(gMarioStates[i].vel, 0, 0, 0);
	
	    //gMarioStates[i].floorHeight =
	    //    find_floor(gMarioStates[i].pos[0], gMarioStates[i].pos[1], gMarioStates[i].pos[2], gMarioStates[i]._floor);
		//gMarioStates[i]._floor = gMarioStates[i]._floor._floor;
		
	    //if (gMarioStates[i].pos[1] < gMarioStates[i].floorHeight) {
	    //    gMarioStates[i].pos[1] = gMarioStates[i].floorHeight;
	    //}
		
	    gMarioStates[i].marioObj.header.gfx.pos[1] = gMarioStates[i].pos[1];

	    gMarioStates[i].action =
	        (gMarioStates[i].pos[1] <= (gMarioStates[i].waterLevel - 100)) ? ACT_WATER_IDLE : ACT_IDLE;
		
	    mario_reset_bodystate(gMarioStates[i]);
	    update_mario_info_for_cam(gMarioStates[i]);		
		gMarioStates[i].marioBodyState.punchState = 0;

	    gMarioStates[i].marioObj.rawData[oPosX] = gMarioStates[i].pos[0];
	    gMarioStates[i].marioObj.rawData[oPosY] = gMarioStates[i].pos[1];
	    gMarioStates[i].marioObj.rawData[oPosZ] = gMarioStates[i].pos[2];
	    gMarioStates[i].marioObj.rawData[oMoveAnglePitch] = gMarioStates[i].faceAngle[0];
	    gMarioStates[i].marioObj.rawData[oMoveAngleYaw] = gMarioStates[i].faceAngle[1];
	    gMarioStates[i].marioObj.rawData[oMoveAngleRoll] = gMarioStates[i].faceAngle[2];
		
	    vec3f_copy(gMarioStates[i].marioObj.header.gfx.pos, gMarioStates[i].pos);
	    vec3s_set(gMarioStates[i].marioObj.header.gfx.angle, 0, gMarioStates[i].faceAngle[1], 0);

	}
}

		
function init_mario_from_save_file() {
	for(var i = 0; i < array_length(gMarioStates); i++) {
		var m = gMarioStates[i];

	    m.unk00					= 0;
		m.flags					= 0;
		m.action				= 0;
	    m.spawnInfo				= gMarioSpawnInfo
		
		m.terrainSoundAddend	= 0;
			
	    m.statusForCamera		= gPlayerCameraState[0];
	    m.marioBodyState		= gBodyState;
	    m.controller			= null;
			
		m.animation				= new ObjectDummy();
		m.animation.animList	= Object1.gMarioAnimData;
		m.animation.targetAnim	= null;
			
	    m.numCoins				= 0;
		m.numStars				= 0;
		m.numKeys				= 0;
	    m.numLives				= 4;
		m._health				= 0x880;
	    m.unkB8					= 0;
		m.unkB0					= 0xBD;
			
		gMarioStates[i] = m;

	}
}
	
function set_forward_vel(m, forwardVel) {
	m.forwardVel = forwardVel;

	m.slideVelX = m.forwardVel * sins(m.faceAngle[1]);
	m.slideVelZ = m.forwardVel * coss(m.faceAngle[1]);

	m.vel[0] = m.slideVelX;
	m.vel[2] = m.slideVelZ;
}




