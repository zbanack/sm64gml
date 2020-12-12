/// <pygml?v=1.0&h=8def2b427>
/// @function	bhv_white_puff_smoke_init()
// bullet bill smoke
function bhv_white_puff_smoke_init() {
    cur_obj_scale(random_float() * 2 + 2.0);
}
/// <pygml?v=1.0&h=78e101266>
/// <pygml?v=1.0&h=e70b64629>
/// @function	bhv_bullet_bill_init()
function bhv_bullet_bill_init() {
    var o = gCurrentObject;

    o.rawData[oBulletBillInitialMoveYaw] = o.rawData[oMoveAngleYaw];
}

/// <pygml?v=1.0&h=18b6552df>
/// @function	bullet_bill_act_0()
function bullet_bill_act_0() {
    var o = gCurrentObject;

    cur_obj_become_tangible();
    o.rawData[oForwardVel] = 0.0;
    o.rawData[oMoveAngleYaw] = o.rawData[oBulletBillInitialMoveYaw];
    o.rawData[oFaceAnglePitch] = 0;
    o.rawData[oFaceAngleRoll] = 0;
    o.rawData[oMoveFlags] = 0;
    cur_obj_set_pos_to_home();
    o.rawData[oAction] = 1;
}
/// <pygml?v=1.0&h=a9ed35f45>
/// @function	bullet_bill_act_1()
function bullet_bill_act_1() {
    var o = gCurrentObject;

    var sp1E = abs_angle_diff(o.rawData[oAngleToMario], o.rawData[oMoveAngleYaw]);
    if (sp1E < 0x2000 && 400.0 < o.rawData[oDistanceToMario] && o.rawData[oDistanceToMario] < 1500.0)
        o.rawData[oAction] = 2;
}

/// <pygml?v=1.0&h=b57101f0a>
/// @function	bullet_bill_act_2()
function bullet_bill_act_2() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] < 40)
        o.rawData[oForwardVel] = 3.0;
    else if (o.rawData[oTimer] < 50) {
        if (o.rawData[oTimer] % 2)
            o.rawData[oForwardVel] = 3.0;
        else
            o.rawData[oForwardVel] = -3.0;
    } else {
        if (o.rawData[oTimer] > 70)
            cur_obj_update_floor_and_walls();
        spawn_object(o, MODEL_SMOKE, Object1.bhvWhitePuffSmoke);
        o.rawData[oForwardVel] = 30.0;
        if (o.rawData[oDistanceToMario] > 300.0)
            cur_obj_rotate_yaw_toward(o.rawData[oAngleToMario], 0x100);
        if (o.rawData[oTimer] == 50) {
            cur_obj_play_sound_2(SOUND_OBJ_POUNDING_CANNON);
            cur_obj_shake_screen(SHAKE_POS_SMALL);
        }
        if (o.rawData[oTimer] > 150 || o.rawData[oMoveFlags] & OBJ_MOVE_HIT_WALL) {
            o.rawData[oAction] = 3;
            spawn_mist_particles();
        }
    }
}

/// <pygml?v=1.0&h=8d824ede4>
/// @function	bullet_bill_act_3()
function bullet_bill_act_3() {
    var o = gCurrentObject;

    o.rawData[oAction] = 0;
}

/// <pygml?v=1.0&h=5b8e9e281>
/// @function	bullet_bill_act_4()
function bullet_bill_act_4() {
    var o = gCurrentObject;

    if (o.rawData[oTimer] == 0) {
        o.rawData[oForwardVel] = -30.0;
        cur_obj_become_intangible();
    }
    o.rawData[oFaceAnglePitch] += 0x1000;
    o.rawData[oFaceAngleRoll] += 0x1000;
    o.rawData[oPosY] += 20.0;
    if (o.rawData[oTimer] > 90)
        o.rawData[oAction] = 0;
}


/// <pygml?v=1.0&h=13bc9ae29>
/// @function	bhv_bullet_bill_loop()
function bhv_bullet_bill_loop() {
    var o = gCurrentObject;

    cur_obj_call_action_function(sBulletBillActions);
    if (cur_obj_check_interacted())
        o.rawData[oAction] = 4;
}

function bullet_bill_macros_init() {
global.__sBulletBillActions =[ bullet_bill_act_0, bullet_bill_act_1, bullet_bill_act_2,
                                       bullet_bill_act_3, bullet_bill_act_4 ];
#macro sBulletBillActions	global.__sBulletBillActions	
}