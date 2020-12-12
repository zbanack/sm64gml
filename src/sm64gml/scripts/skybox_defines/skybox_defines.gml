function skybox_split(sprite) {
	
	var fit_width, fit_height;
	fit_width		= 256;
	fit_height		= 256;
	
	var asset_width, asset_height;
	asset_width		= sprite_get_width(sprite);
	asset_height	= sprite_get_height(sprite);
	
	var surface		= surface_create(fit_width, fit_height);
	
	var slice_count = 64;
	var columns		= 8;
	var rows		= 8;
	var slice_width = 32;
	var slice_height = 32;
	
	surface_set_target(surface);
	draw_clear_alpha(c_black, 0);
	draw_sprite_stretched(sprite, 0, 0, 0, fit_width, fit_height);
	surface_reset_target();
		
	var sprite_array = array_create(slice_count);
		
	var count = 0;
	for(var j = 0; j < rows; j++) {
		for(var i = 0; i < columns; i++) {
			sprite_array[count] = sprite_create_from_surface(surface, i * slice_width, j * slice_height, slice_width, slice_height, false, false, 0, 0);
			count++;
		}
	}
	
	var sprite_array_final = array_create(slice_count + 16);
	count = 0;
	for(var j = 0; j < rows; j++) {
		for(var i = 0; i < columns + 2; i++) {
			
			var pos = (j * rows) + (i%columns);
			sprite_array_final[count] = sprite_array[pos];
			count++;
		}
	}
	
		
	surface_free(surface);	
	
	return sprite_array_final;
}

function water_skybox_init() {
	globalvar water_skybox_whole, water_skybox_ptrlist;
	water_skybox_whole			= sprite_add_from_rom("textures/skyboxes/water.png");
	water_skybox_ptrlist		= skybox_split(water_skybox_whole);
	boot("water_skybox_init");
}

function cloud_floor_skybox_init() {
	globalvar cloud_floor_skybox_whole, cloud_floor_skybox_ptrlist;
	cloud_floor_skybox_whole	= sprite_add_from_rom("textures/skyboxes/cloud_floor.png");
	cloud_floor_skybox_ptrlist	= skybox_split(cloud_floor_skybox_whole);
	boot("cloud_floor_skybox_init");
}

function bidw_skybox_init() {
	globalvar bidw_skybox_whole, bidw_skybox_ptrlist;
	bidw_skybox_whole		= sprite_add_from_rom("textures/skyboxes/bidw.png");
	bidw_skybox_ptrlist		= skybox_split(bidw_skybox_whole);
	boot("bidw_skybox_init");
}

function ssl_skybox_init() {
	globalvar ssl_skybox_whole, ssl_skybox_ptrlist;
	ssl_skybox_whole		= sprite_add_from_rom("textures/skyboxes/ssl.png");
	ssl_skybox_ptrlist		= skybox_split(ssl_skybox_whole);
	boot("ssl_skybox_init");
}
function ccm_skybox_init() {
	globalvar ccm_skybox_whole, ccm_skybox_ptrlist;
	ccm_skybox_whole		= sprite_add_from_rom("textures/skyboxes/ccm.png");
	ccm_skybox_ptrlist		= skybox_split(ccm_skybox_whole);
	boot("ccm_skybox_init");
}
function bbh_skybox_init() {
	globalvar bbh_skybox_whole, bbh_skybox_ptrlist;
	bbh_skybox_whole		= sprite_add_from_rom("textures/skyboxes/bbh.png");
	bbh_skybox_ptrlist		= skybox_split(bbh_skybox_whole);
	boot("bbh_skybox_init");
}

function sm64_init_skyboxes() {
	water_skybox_init();
	cloud_floor_skybox_init();
	bidw_skybox_init();
	bbh_skybox_init();
	ssl_skybox_init();
	ccm_skybox_init();
	
	skybox_constructor();
	
	boot("sm64_init_skyboxes");
}