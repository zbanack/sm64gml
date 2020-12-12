/// <pygml?v=1.0&h=e1eb694a4>
/// @function	bhv_white_puff_exploding_loop()
function bhv_white_puff_exploding_loop() {
    var o = gCurrentObject;

    var sp24;
    if (o.rawData[oTimer] == 0) {
        cur_obj_compute_vel_xz();
        o.rawData[oWhitePuffUnkF4] = o.header.gfx.scale[0];
        switch (o.rawData[oBehParams2ndByte]) {
            case (2):
                o.rawData[oOpacity] = 254;
                o.rawData[oWhitePuffUnkF8] = -21;
                o.rawData[oWhitePuffUnkFC] = 0;
                break;
            case (3):
                o.rawData[oOpacity] = 254;
                o.rawData[oWhitePuffUnkF8] = -13;
                o.rawData[oWhitePuffUnkFC] = 1;
                break;
        }
    }
    cur_obj_move_using_vel_and_gravity();
    cur_obj_apply_drag_xz(o.rawData[oDragStrength]);
    if (o.rawData[oVelY] > 100.0)
        o.rawData[oVelY] = 100.0;
    if (o.rawData[oTimer] > 20)
        obj_mark_for_deletion(o);
    if (o.rawData[oOpacity]) {
        o.rawData[oOpacity] += o.rawData[oWhitePuffUnkF8];
        if (o.rawData[oOpacity] < 2)
            obj_mark_for_deletion(o);
        if (o.rawData[oWhitePuffUnkFC])
            sp24 = o.rawData[oWhitePuffUnkF4] * ((254 - o.rawData[oOpacity]) / 254.0);
        else
            sp24 = o.rawData[oWhitePuffUnkF4] * (o.rawData[oOpacity] / 254.0);
        cur_obj_scale(sp24);
    }
}