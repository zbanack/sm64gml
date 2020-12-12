function sm64_animated_floor_switch_init() {
	globalvar D_80331ACC;
	D_80331ACC = [250, 200, 200];
	
	boot("sm64_animated_floor_switch_init");
}

function Struct80331A54(_unk00, _unk04) constructor {
	unk00 = _unk00;	
	unk04 = _unk04;	
}

function animated_floor_switch_models_init() {
	globalvar D_80331A54;
    D_80331A54 = [[
        new Struct80331A54(bits_seg7_collision_0701B734, MODEL_BITS_STAIRCASE_FRAME4 ),
        new Struct80331A54(bits_seg7_collision_0701B59C, MODEL_BITS_STAIRCASE_FRAME3 ),
        new Struct80331A54(bits_seg7_collision_0701B404, MODEL_BITS_STAIRCASE_FRAME2 ),
        new Struct80331A54(bits_seg7_collision_0701B26C, MODEL_BITS_STAIRCASE_FRAME1 ),
        new Struct80331A54(bits_seg7_collision_0701B0D4, MODEL_BITS_STAIRCASE ),		
    ],
    [
        new Struct80331A54(bitdw_seg7_collision_0700FD9C, MODEL_BITDW_STAIRCASE ),
        new Struct80331A54(bitdw_seg7_collision_0700FC7C, MODEL_BITDW_STAIRCASE_FRAME1 ),
        new Struct80331A54(bitdw_seg7_collision_0700FB5C, MODEL_BITDW_STAIRCASE_FRAME2 ),
        new Struct80331A54(bitdw_seg7_collision_0700FA3C, MODEL_BITDW_STAIRCASE_FRAME3 ),
        new Struct80331A54(bitdw_seg7_collision_0700F91C, MODEL_BITDW_STAIRCASE_FRAME4 ),
    ],
    [
        new Struct80331A54(rr_seg7_collision_0702A6B4, MODEL_RR_TRICKY_TRIANGLES_FRAME4 ), 
        new Struct80331A54(rr_seg7_collision_0702A32C, MODEL_RR_TRICKY_TRIANGLES_FRAME3 ), 
        new Struct80331A54(rr_seg7_collision_07029FA4, MODEL_RR_TRICKY_TRIANGLES_FRAME2 ), 
        new Struct80331A54(rr_seg7_collision_07029C1C, MODEL_RR_TRICKY_TRIANGLES_FRAME1 ), 
        new Struct80331A54(rr_seg7_collision_07029924, MODEL_RR_TRICKY_TRIANGLES ),		   
    ]]	;																				   
	
}

/// <pygml?v=1.0&h=f147a1ada>
/// @function	bhv_animates_on_floor_switch_press_init()
function bhv_animates_on_floor_switch_press_init() {
	var o = gCurrentObject;
    o.parentObj = cur_obj_nearest_object_with_behavior(bhvFloorSwitchAnimatesObject);
}

/// <pygml?v=1.0&h=e6aa43591>
/// @function	bhv_animates_on_floor_switch_press_loop()
function bhv_animates_on_floor_switch_press_loop() {
    var o = gCurrentObject;

    if (o.rawData[oFloorSwitchPressAnimationUnk100] != 0) {
        if (o.parentObj.rawData[oAction] != 2) {
            o.rawData[oFloorSwitchPressAnimationUnk100] = 0;
        }

        if (o.rawData[oFloorSwitchPressAnimationUnkFC] != 0) {
            o.rawData[oFloorSwitchPressAnimationUnkF4] = D_80331ACC[o.rawData[oBehParams2ndByte]];
        } else {
            o.rawData[oFloorSwitchPressAnimationUnkF4] = 0;
        }
    } else if (o.parentObj.rawData[oAction] == 2) {
        o.rawData[oFloorSwitchPressAnimationUnkFC] ^= 1;
        o.rawData[oFloorSwitchPressAnimationUnk100] = 1;
    }

    if (o.rawData[oFloorSwitchPressAnimationUnkF4] != 0) {
        if (o.rawData[oFloorSwitchPressAnimationUnkF4] < 60) {
            cur_obj_play_sound_1(SOUND_GENERAL2_SWITCH_TICK_SLOW);
        } else {
            cur_obj_play_sound_1(SOUND_GENERAL2_SWITCH_TICK_FAST);
        }

        if (--o.rawData[oFloorSwitchPressAnimationUnkF4] == 0) {
            o.rawData[oFloorSwitchPressAnimationUnkFC] = 0;
        }

        if (o.rawData[oFloorSwitchPressAnimationUnkF8] < 9) {
            o.rawData[oFloorSwitchPressAnimationUnkF8] += 1;
        }
    } else {
		o.rawData[oFloorSwitchPressAnimationUnkF8] -= 2;
		
		if (o.rawData[oFloorSwitchPressAnimationUnkF8] < 0) {
	        o.rawData[oFloorSwitchPressAnimationUnkF8] = 0;
	        o.rawData[oFloorSwitchPressAnimationUnkFC] = 1;
		}
    }

    o.collisionData = (
        D_80331A54[o.rawData[oBehParams2ndByte]][o.rawData[oFloorSwitchPressAnimationUnkF8] / 2].unk00);

    cur_obj_set_model(D_80331A54[o.rawData[oBehParams2ndByte]][o.rawData[oFloorSwitchPressAnimationUnkF8] / 2].unk04);
}
