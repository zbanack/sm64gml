/// <pygml?v=1.0&h=e1e5f9c29>
/// @function	update_angle_from_move_flags(Ptr.p_angle)
/// @param		{s32}		Ptr.p_angle
/// @returns	s32
function update_angle_from_move_flags(angle) {
    var o = gCurrentObject;

    if (o.rawData[oMoveFlags] & OBJ_MOVE_HIT_WALL) {
        angle = o.rawData[oWallAngle];
        Ptr.p_angle = angle;
        return 1;
    } else if (o.rawData[oMoveFlags] & OBJ_MOVE_HIT_EDGE) {
        angle = o.rawData[oMoveAngleYaw] + 0x8000;
        Ptr.p_angle = angle;
        return -1;
    }
    Ptr.p_angle = angle;
    return 0;
}

function bhv_scuttlebug_loop() {
	
	var o = gCurrentObject;

    var unused;
    var sp18;
    cur_obj_update_floor_and_walls();
	
    if (o.rawData[oSubAction] != 0 &&
			cur_obj_set_hitbox_and_die_if_attacked(sScuttlebugHitbox, -1, o.rawData[oScuttlebugUnkF4])) {
        o.rawData[oSubAction] = 3;
	}
		
	if (o.rawData[oSubAction] != 1)
        o.rawData[oScuttlebugUnkF8] = 0;
		
	switch (o.rawData[oSubAction]) {
        case 0:
            if (o.rawData[oMoveFlags] & OBJ_MOVE_LANDED)
                cur_obj_play_sound_2(-1);
            if (o.rawData[oMoveFlags] & OBJ_MOVE_MASK_ON_GROUND) {
                o.rawData[oHomeX] = o.rawData[oPosX];
                o.rawData[oHomeY] = o.rawData[oPosY];
                o.rawData[oHomeZ] = o.rawData[oPosZ];
                o.rawData[oSubAction]++;
            }
            break;
        case 1:
            o.rawData[oForwardVel] = 5.0;
            if (cur_obj_lateral_dist_from_mario_to_home() > 1000.0)
                o.rawData[oAngleToMario] = cur_obj_angle_to_home()
            else {
                if (o.rawData[oScuttlebugUnkF8] == 0) {
                    o.rawData[oScuttlebugUnkFC] = 0;
                    o.rawData[oAngleToMario] = obj_angle_to_object(o, gMarioObject[0]);
                    if (abs_angle_diff(o.rawData[oAngleToMario], o.rawData[oMoveAngleYaw]) < 0x800) {
                        o.rawData[oScuttlebugUnkF8] = 1;
                        o.rawData[oVelY] = 20.0;
                        cur_obj_play_sound_2(-1);
                    }
                } else if (o.rawData[oScuttlebugUnkF8] == 1) {
                    o.rawData[oForwardVel] = 15.0;
                    o.rawData[oScuttlebugUnkFC]++;
                    if (o.rawData[oScuttlebugUnkFC] > 50)
                        o.rawData[oScuttlebugUnkF8] = 0;
                }
            }
            if (update_angle_from_move_flags(o.rawData[oAngleToMario])) {
                o.rawData[oSubAction] = 2;
			}
			o.rawData[oAngleToMario] = Ptr.p_angle;
            cur_obj_rotate_yaw_toward(o.rawData[oAngleToMario], 0x200);
            break;
        case 2:
            o.rawData[oForwardVel] = 5.0;
            if (o.rawData[oMoveAngleYaw] == o.rawData[oAngleToMario])
                o.rawData[oSubAction] = 1;
            if (o.rawData[oPosY] - o.rawData[oHomeY] < -200.0)
                obj_mark_for_deletion(o);
            cur_obj_rotate_yaw_toward(o.rawData[oAngleToMario], 0x400);
            break;
        case 3:
            o.rawData[oFlags] &= ~8;
            o.rawData[oForwardVel] = -10.0;
            o.rawData[oVelY] = 30.0;
			cur_obj_play_sound_2(-1);
            o.rawData[oSubAction]++;
            break;
        case 4:
            o.rawData[oForwardVel] = -10.0;
            if (o.rawData[oMoveFlags] & OBJ_MOVE_LANDED) {
                o.rawData[oSubAction]++;
                o.rawData[oVelY] = 0.0;
                o.rawData[oScuttlebugUnkFC] = 0;
                o.rawData[oFlags] |= 8;
                o.rawData[oInteractStatus] = 0;
            }
            break;
        case 5:
            o.rawData[oForwardVel] = 2.0;
            o.rawData[oScuttlebugUnkFC]++;
            if (o.rawData[oScuttlebugUnkFC] > 30)
                o.rawData[oSubAction] = 0;
            break;
    }
    if (o.rawData[oForwardVel] < 10.0)
        sp18 = 1.0;
    else
        sp18 = 3.0;
    cur_obj_init_animation_with_accel_and_sound(0, sp18);
    if (o.rawData[oMoveFlags] & OBJ_MOVE_MASK_ON_GROUND)
        set_obj_anim_with_accel_and_sound(1, 23, -1);
    if (o.parentObj != o) {
        if (obj_is_hidden(o))
            obj_mark_for_deletion(o);
        if (o.activeFlags == ACTIVE_FLAG_DEACTIVATED)
            o.parentObj.rawData[oScuttlebugSpawnerUnk88] = 1;
    }
   cur_obj_move_standard(-50);
}

function scuttlebug_macros_init() {
	global.__sScuttlebugHitbox = new Hitbox(
	    INTERACT_BOUNCE_TOP,
	    0,
	    1,
	    1,
	    3,
	    130,
	    70,
	    90,
	    60,	
	);

	#macro sScuttlebugHitbox	global.__sScuttlebugHitbox	
}