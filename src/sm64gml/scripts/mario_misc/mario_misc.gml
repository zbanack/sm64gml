function mario_misc_macros_init() {
globalvar gBodyState;
gBodyState = {
    action: 0, capState: 0, eyeState: 0, handState: 0,
    wingFlutter: 0, modelState: 0, grabPos: 0, punchState: 0,
    torsoAngle: Vec3, headAngle: Vec3,
    heldObjLastPosition: Vec3
}

boot("mario_misc_macros_init");
}


function geo_draw_mario_head_goddard(callContext, node, c) {
    var gfx = []
    var asGenerated = node.wrapper
    if (callContext == GEO_CONTEXT_CREATE) { // Create
    } else if (callContext == GEO_CONTEXT_RENDER) { // Render
        gfx = GoddardRenderer.gdm_gettestdl(asGenerated.param)
        D_8032C6A0_vsyncFunc = GoddardRenderer.gd_vblank;
        D_8032C6A0_classObject = GoddardRenderer;
    }
    return gfx;
}

function geo_switch_mario_eyes(callContext, switchCase) {

    var marioBlinkAnimation = [ 1, 2, 1, 0, 1, 2, 1 ];

	var bodyState = gBodyState;
    if (callContext == GEO_CONTEXT_RENDER) {
        if (bodyState.eyeState == 0) {
            var blinkFrame = ((switchCase.numCases * 32 + GeoRenderer.gAreaUpdateCounter) >> 1) & 0x1F; // @cv
            if (blinkFrame < 7) {
                switchCase.selectedCase = marioBlinkAnimation[blinkFrame];
            } else {
                switchCase.selectedCase = 0;
            }
        }else {
            switchCase.selectedCase = bodyState.eyeState - 1;
        }
    }
}

function geo_mario_tilt_torso(callContext, node) {

    var asGenerated = node.wrapper;
    var action = gBodyState.action;

    if (callContext == GEO_CONTEXT_RENDER) {
        var rotNode = node.next;
		
        if (action != ACT_BUTT_SLIDE && action != ACT_HOLD_BUTT_SLIDE && action != ACT_WALKING
            && action != ACT_RIDING_SHELL_GROUND) {
            vec3f_copy(gBodyState.torsoAngle, [0, 0, 0]);
        }
        rotNode.wrapper.rotation[0] = gBodyState.torsoAngle[1];
        rotNode.wrapper.rotation[1] = gBodyState.torsoAngle[2];
        rotNode.wrapper.rotation[2] = gBodyState.torsoAngle[0];
    }
    return null;
}