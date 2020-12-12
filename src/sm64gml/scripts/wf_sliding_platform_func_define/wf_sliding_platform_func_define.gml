/// <pygml?v=1.0&h=caef9fee2>
/// @function	bhv_wf_sliding_platform_init()
function bhv_wf_sliding_platform_init() {
    var o = gCurrentObject;

    o.rawData[oFaceAngleYaw] -= 0x4000;
    o.rawData[oPosX] += 2.0;
    o.rawData[oHomeX] = o.rawData[oPosX];

    switch (o.rawData[oBehParams2ndByte]) {
        case (WF_SLID_BRICK_PTFM_BP_MOV_VEL_10):
            o.rawData[oWFSlidBrickPtfmMovVel] = 10.0;
            break;

        case (WF_SLID_BRICK_PTFM_BP_MOV_VEL_15):
            o.rawData[oWFSlidBrickPtfmMovVel] = 15.0;
            break;

        case (WF_SLID_BRICK_PTFM_BP_MOV_VEL_20):
            o.rawData[oWFSlidBrickPtfmMovVel] = 20.0;
            break;
    }

    o.rawData[oTimer] = random_float() * 100.0;
}

/// <pygml?v=1.0&h=e7c440b0c>
/// @function	bhv_wf_sliding_platform_loop()
function bhv_wf_sliding_platform_loop() {
    var o = gCurrentObject;

    switch (o.rawData[oAction]) {
        case (WF_SLID_BRICK_PTFM_ACT_WAIT):
            if (o.rawData[oTimer] >= 101) {
                o.rawData[oAction] = WF_SLID_BRICK_PTFM_ACT_EXTEND;
                o.rawData[oForwardVel] = o.rawData[oWFSlidBrickPtfmMovVel];
            }
            break;

        case (WF_SLID_BRICK_PTFM_ACT_EXTEND):
            if (o.rawData[oTimer] >= 500.0 / o.rawData[oWFSlidBrickPtfmMovVel]) {
                o.rawData[oForwardVel] = 0;
                o.rawData[oPosX] = o.rawData[oHomeX] + 510.0;
            }

            if (o.rawData[oTimer] == 60) {
                o.rawData[oAction] = WF_SLID_BRICK_PTFM_ACT_RETRACT;
                o.rawData[oForwardVel] = o.rawData[oWFSlidBrickPtfmMovVel];
                o.rawData[oMoveAngleYaw] -= 0x8000;
            }
            break;

        case (WF_SLID_BRICK_PTFM_ACT_RETRACT):
            if (o.rawData[oTimer] >= 500.0 / o.rawData[oWFSlidBrickPtfmMovVel]) {
                o.rawData[oForwardVel] = 0;
                o.rawData[oPosX] = o.rawData[oHomeX];
            }

            if (o.rawData[oTimer] == 90) {
                o.rawData[oAction] = WF_SLID_BRICK_PTFM_ACT_EXTEND;
                o.rawData[oForwardVel] = o.rawData[oWFSlidBrickPtfmMovVel];
                o.rawData[oMoveAngleYaw] -= 0x8000;
            }
            break;
    }
	
	
}
