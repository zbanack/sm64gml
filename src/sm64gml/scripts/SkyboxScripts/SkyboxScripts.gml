function geo_skybox_main(callContext, graphNode) {
	
    if (callContext == GEO_CONTEXT_AREA_LOAD) return null;
	
	if (callContext == GEO_CONTEXT_RENDER) {
	    var camNode = GeoRenderer.gCurGraphNodeRoot.wrapper.views[0];
	    var camFrustum = camNode.node.parent.wrapper;

	    var gfx = create_skybox_facing_camera(0,
			graphNode.background,
			camFrustum.fov,
			gLakituState.pos[0],
			gLakituState.pos[1],
			gLakituState.pos[2],
			gLakituState.focus[0],
			gLakituState.focus[1],
			gLakituState.focus[2]
		);
		return gfx.dl_arr;
	}
}	

function skybox_constructor() {
	
	globalvar skybox_vlist_at;
	skybox_vlist_at = 0;
	
	globalvar skybox_vlist;
	skybox_vlist = array_create(15);

	for(var i = 0; i < 15; i++) {
		skybox_vlist[i] = vList();
	}
	
	#macro SKYBOX_WIDTH			(SCREEN_WIDTH * 4)
	#macro SKYBOX_HEIGHT		(SCREEN_HEIGHT * 4)
	#macro SKYBOX_TILE_WIDTH	(SCREEN_WIDTH / 2)
	#macro SKYBOX_TILE_HEGIHT	(SCREEN_HEIGHT / 2)
	#macro SKYBOX_COLS			(10)
	#macro SKYBOX_ROWS			(8)
		
	globalvar sSkyBoxInfo;
	sSkyBoxInfo = {
		yaw : 0,
		pitch : 0,
		scaledX : 0,
		scaledY : 0,
		upperLeftTile : 0,	
	}

	// @TODO fill out
	globalvar sSkyboxTextures;
	sSkyboxTextures = [
	    water_skybox_ptrlist,
	    water_skybox_ptrlist,//bitfs_skybox_ptrlist,
	    water_skybox_ptrlist,//wdw_skybox_ptrlist,
	    cloud_floor_skybox_ptrlist,//cloud_floor_skybox_ptrlist,
	    ccm_skybox_ptrlist,
	    ssl_skybox_ptrlist,
	    bbh_skybox_ptrlist,
	    bidw_skybox_ptrlist,
	    water_skybox_ptrlist,//clouds_skybox_ptrlist,
	    water_skybox_ptrlist,//bits_skybox_ptrlist,
	];

	globalvar sSkyboxColors;
	sSkyboxColors = [
	    [0x50, 0x64, 0x5A],
	    [0xFF, 0xFF, 0xFF]
	];	
	
	globalvar SkyboxDisplayList;
	SkyboxDisplayList = new DisplayList();
	
}

function calculate_skybox_scaled_x(fov) {
    var yaw = sSkyBoxInfo.yaw;
    var yawScaled = SCREEN_WIDTH * 360.0 * yaw / (fov * 65536.0);
    var scaledX = floor(yawScaled + 0.5);

    if (scaledX > SKYBOX_WIDTH) {
        scaledX -= (scaledX / SKYBOX_WIDTH * SKYBOX_WIDTH);
    }

    return SKYBOX_WIDTH - scaledX;
}

function calculate_skybox_scaled_y() {
    var pitchInDegrees = sSkyBoxInfo.pitch * 360.0 / 65535.0;
    var degreesToScale = 360 * pitchInDegrees / 90;
    var roundedY = round_float(degreesToScale);

    var scaledY = roundedY + 5 * SKYBOX_TILE_HEGIHT;

    if (scaledY > SKYBOX_HEIGHT) scaledY = SKYBOX_HEIGHT;
    if (scaledY < SCREEN_HEIGHT) scaledY = SCREEN_HEIGHT;

    return scaledY;
}

function get_top_left_tile_idx() {
    var tileCol = floor(sSkyBoxInfo.scaledX / SKYBOX_TILE_WIDTH);
    var tileRow = floor((SKYBOX_HEIGHT - sSkyBoxInfo.scaledY) / SKYBOX_TILE_HEGIHT);

    return tileRow * SKYBOX_COLS + tileCol;
}

function create_skybox_ortho_matrix() {
    var left = sSkyBoxInfo.scaledX;
    var right = sSkyBoxInfo.scaledX + SCREEN_WIDTH;
    var top = sSkyBoxInfo.scaledY;
    var bottom = sSkyBoxInfo.scaledY - SCREEN_HEIGHT;

    var mtx = Mat4;

    var half_width = (ASPECT_4_3) / ASPECT_RATIO * SCREEN_WIDTH / 2;
    var center = (sSkyBoxInfo.scaledX + SCREEN_WIDTH / 2);
    if (half_width < SCREEN_WIDTH / 2) {
	    left = center - half_width;
	    right = center + half_width;
    }
		
    guOrtho(mtx, left, right, bottom, top, 0.1, 3.0, 1.0);

    return mtx;
}

function make_skybox_rect(tileIndex, colorIndex) {

    var xx = tileIndex % SKYBOX_COLS * SKYBOX_TILE_WIDTH;
    var yy = SKYBOX_HEIGHT - floor(tileIndex / SKYBOX_COLS) * SKYBOX_TILE_HEGIHT;

	var s_vlist = skybox_vlist[skybox_vlist_at];
    make_vertex(s_vlist, 0, xx, yy, -1, 0, 0, sSkyboxColors[colorIndex][0], sSkyboxColors[colorIndex][1], sSkyboxColors[colorIndex][2], 255, 0);
    make_vertex(s_vlist, 1, xx, yy - SKYBOX_TILE_HEGIHT, -1, 0, 31 << 5, sSkyboxColors[colorIndex][0], sSkyboxColors[colorIndex][1], sSkyboxColors[colorIndex][2], 255, 0);
    make_vertex(s_vlist, 2, xx + SKYBOX_TILE_WIDTH, yy - SKYBOX_TILE_HEGIHT, -1, 31 << 5, 31 << 5, sSkyboxColors[colorIndex][0], sSkyboxColors[colorIndex][1], sSkyboxColors[colorIndex][2], 255, 0);
    make_vertex(s_vlist, 3, xx + SKYBOX_TILE_WIDTH, yy, -1, 31 << 5, 0, sSkyboxColors[colorIndex][0], sSkyboxColors[colorIndex][1], sSkyboxColors[colorIndex][2], 255, 0);

    return s_vlist;
}

function draw_skybox_tile_grid(dlist, background, colorIndex) {

	skybox_vlist_at = 0;
    for (var row = 0; row < 3; row++) {
        for (var col = 0; col < 3; col++) {
            var tileIndex	= sSkyBoxInfo.upperLeftTile + row * SKYBOX_COLS + col;
            var texture		= sSkyboxTextures[background][tileIndex % 80];
            var vertices	= make_skybox_rect(tileIndex, colorIndex);
			skybox_vlist_at++;

	
            gDPLoadBlockTexture(dlist, 32, 32, G_IM_FMT_RGBA, texture);
            gSPVertex(dlist, vertices, 4, 0);
            gSPDisplayList(dlist, dl_draw_quad_verts_0123);
        }
    }
}
	
function init_skybox_display_list(background, colorIndex) {
	SkyboxDisplayList.clear();

    var ortho = create_skybox_ortho_matrix();
    gSPDisplayList(SkyboxDisplayList, dl_skybox_begin);
    gSPMatrix(SkyboxDisplayList, ortho, G_MTX_PROJECTION | G_MTX_MUL | G_MTX_NOPUSH);
    gSPDisplayList(SkyboxDisplayList, dl_skybox_tile_tex_settings);
    draw_skybox_tile_grid(SkyboxDisplayList, background, colorIndex);
    gSPDisplayList(SkyboxDisplayList, dl_skybox_end);
    gSPEndDisplayList(SkyboxDisplayList);

    return SkyboxDisplayList;
}

function create_skybox_facing_camera(player, background, fov, posX, posY, posZ, focX, focY, focZ) {
    var cameraFaceX = focX - posX;
    var cameraFaceY = focY - posY;
    var cameraFaceZ = focZ - posZ;
    var colorIndex = 1;

    fov = 90.0;
    sSkyBoxInfo.yaw = atan2s(cameraFaceZ, cameraFaceX);
    if (sSkyBoxInfo.yaw < 0) sSkyBoxInfo.yaw += 65536;
    sSkyBoxInfo.pitch = atan2s(sqrt(cameraFaceX * cameraFaceX + cameraFaceZ * cameraFaceZ), cameraFaceY);

    sSkyBoxInfo.scaledX = calculate_skybox_scaled_x(fov);
    sSkyBoxInfo.scaledY = calculate_skybox_scaled_y();

    sSkyBoxInfo.upperLeftTile = get_top_left_tile_idx();
		
    return init_skybox_display_list(background, colorIndex);
}