function sprite_add_from_rom(_name) {
	
	if (BROWSER) { return sTextureUndefined; }
	
	var opaque = false;
	if (argument_count > 1) opaque = argument[1];
		
	var fast = false;
		
	var nm = string_replace_all(_name, "inc.c", "png");
	
	if (ds_map_exists(sprite_dir_dict, nm)) return sprite_dir_dict[? nm];
	
	var fname = ROM_DIR + nm;
	
	if (!file_exists(fname)) return sTextureUndefined;
		
	var new_spr = sTextureUndefined;
	
	if (!fast) {
		new_spr = sprite_add(fname, 0, false, false, 0, 0);	
	}
	
	var use_surf = opaque;
	
	if (use_surf) {
		if (sprite_exists(new_spr)) {
			var ww, hh;
			ww = sprite_get_width(new_spr);
			hh = sprite_get_height(new_spr);
			var surf = surface_create(ww, hh);
			surface_set_target(surf);
			draw_clear_alpha(c_white, 1);
			draw_sprite_ext(new_spr, 0, 0, 0, 1, 1, 0, c_white, 1);
			surface_reset_target();
	
			var n2 = sprite_create_from_surface(surf, 0, 0, ww, hh, false, false, 0, 0);
	
			sprite_delete(new_spr);
		
			new_spr = n2;
		}
	}
	
	var ret = sprite_exists(new_spr) ? new_spr : sTextureUndefined;
	
	//ret = sTextureUndefined;
	sprite_dir_dict[? nm] = ret;
	
	return ret;
}

/// @function	undefined_texture_generate()
/// @desc		generate fallback texture for when a texture cannot be loaded
function undefined_texture_generate() {
	
	var w, h;
	w = 64;
	h = 64;
	
	var surf = surface_create(w, h);
	
	surface_set_target(surf);
	draw_clear_alpha(c_fuchsia, 1);
	draw_set_color($450075);
	draw_rectangle(w/2, 0, w, h/2, false);
	draw_rectangle(0, h/2, w/2, h, false);
	surface_reset_target();
	
	globalvar sTextureUndefined;
	sTextureUndefined = sprite_create_from_surface(surf, 0, 0, w, h, false, false, 0, 0);
	
	surface_free(surf);
	
	boot("undefined texture generated from surface");
	
}

	
function texture_scripts_macros_init() {
	
	undefined_texture_generate();
	
	globalvar sprite_dir_dict;
	sprite_dir_dict = ds_map_create();

	// outside
	globalvar outside_09000000,
	outside_09000800,
	outside_09001000,
	outside_09002000,
	outside_09003000,
	outside_09003800,
	outside_09004000,
	outside_09004800,
	outside_09005800,
	outside_09006000,
	outside_09006800,
	outside_09007800,
	outside_09008000,
	outside_09008800,
	outside_09009000,
	outside_09009800,
	outside_0900A000,
	outside_0900A800,
	outside_0900B000,
	outside_0900B400,
	outside_0900BC00;
	
	outside_09000000 = sprite_add_from_rom("textures/outside/castle_grounds_textures.00000.rgba16.inc.c");
	outside_09000800 = sprite_add_from_rom("textures/outside/castle_grounds_textures.00800.rgba16.inc.c");
	outside_09001000 = sprite_add_from_rom("textures/outside/castle_grounds_textures.01000.rgba16.inc.c");
	outside_09002000 = sprite_add_from_rom("textures/outside/castle_grounds_textures.02000.rgba16.inc.c");
	outside_09003000 = sprite_add_from_rom("textures/outside/castle_grounds_textures.03000.rgba16.inc.c");
	outside_09003800 = sprite_add_from_rom("textures/outside/castle_grounds_textures.03800.rgba16.inc.c");
	outside_09004000 = sprite_add_from_rom("textures/outside/castle_grounds_textures.04000.rgba16.inc.c");
	outside_09004800 = sprite_add_from_rom("textures/outside/castle_grounds_textures.04800.rgba16.inc.c");
	outside_09005800 = sprite_add_from_rom("textures/outside/castle_grounds_textures.05800.rgba16.inc.c");
	outside_09006000 = sprite_add_from_rom("textures/outside/castle_grounds_textures.06000.rgba16.inc.c");
	outside_09006800 = sprite_add_from_rom("textures/outside/castle_grounds_textures.06800.rgba16.inc.c");
	outside_09007800 = sprite_add_from_rom("textures/outside/castle_grounds_textures.07800.rgba16.inc.c");
	outside_09008000 = sprite_add_from_rom("textures/outside/castle_grounds_textures.08000.rgba16.inc.c");
	outside_09008800 = sprite_add_from_rom("textures/outside/castle_grounds_textures.08800.rgba16.inc.c");
	outside_09009000 = sprite_add_from_rom("textures/outside/castle_grounds_textures.09000.rgba16.inc.c");
	outside_09009800 = sprite_add_from_rom("textures/outside/castle_grounds_textures.09800.rgba16.inc.c");
	outside_0900A000 = sprite_add_from_rom("textures/outside/castle_grounds_textures.0A000.rgba16.inc.c");
	outside_0900A800 = sprite_add_from_rom("textures/outside/castle_grounds_textures.0A800.rgba16.inc.c");
	outside_0900B000 = sprite_add_from_rom("textures/outside/castle_grounds_textures.0B000.rgba16.inc.c");
	outside_0900B400 = sprite_add_from_rom("textures/outside/castle_grounds_textures.0B400.rgba16.inc.c");
	outside_0900BC00 = sprite_add_from_rom("textures/outside/castle_grounds_textures.0BC00.ia16.inc.c");
	
	// trees
	globalvar tree_seg3_texture_0302DE28,
	tree_seg3_texture_0302EE28,
	tree_seg3_texture_0302FF60,
	tree_seg3_texture_03031048,
	tree_seg3_texture_03032218;

	tree_seg3_texture_0302DE28 = sprite_add_from_rom("actors/tree/tree_left_side.rgba16.inc.c");
	tree_seg3_texture_0302EE28 = sprite_add_from_rom("actors/tree/tree_right_side.rgba16.inc.c");
	tree_seg3_texture_0302FF60 = sprite_add_from_rom("actors/tree/pine_tree.rgba16.inc.c");
	tree_seg3_texture_03031048 = sprite_add_from_rom("actors/tree/snowy_pine_tree.rgba16.inc.c");
	tree_seg3_texture_03032218 = sprite_add_from_rom("actors/tree/palm_tree.rgba16.inc.c");

	globalvar grass_09000000,
	grass_09000800,
	grass_09001000,
	grass_09001800,
	grass_09002000,
	grass_09002800,
	grass_09003000,
	grass_09003800,
	grass_09004000,
	grass_09004800,
	grass_09005000,
	grass_09005800,
	grass_09006000,
	grass_09006800,
	grass_09007000,
	grass_09007800,
	grass_09008000,
	grass_09008800,
	grass_09009000,
	grass_09009800,
	grass_0900A000,
	grass_0900A800,
	grass_0900B000,
	grass_0900B800;
	
	grass_09000000 = sprite_add_from_rom("textures/grass/wf_textures.00000.rgba16.inc.c");
	grass_09000800 = sprite_add_from_rom("textures/grass/wf_textures.00800.rgba16.inc.c");
	grass_09001000 = sprite_add_from_rom("textures/grass/wf_textures.01000.rgba16.inc.c");
	grass_09001800 = sprite_add_from_rom("textures/grass/wf_textures.01800.rgba16.inc.c");
	grass_09002000 = sprite_add_from_rom("textures/grass/wf_textures.02000.rgba16.inc.c");
	grass_09002800 = sprite_add_from_rom("textures/grass/wf_textures.02800.rgba16.inc.c");
	grass_09003000 = sprite_add_from_rom("textures/grass/wf_textures.03000.rgba16.inc.c");
	grass_09003800 = sprite_add_from_rom("textures/grass/wf_textures.03800.rgba16.inc.c");
	grass_09004000 = sprite_add_from_rom("textures/grass/wf_textures.04000.rgba16.inc.c");
	grass_09004800 = sprite_add_from_rom("textures/grass/wf_textures.04800.rgba16.inc.c");
	grass_09005000 = sprite_add_from_rom("textures/grass/wf_textures.05000.rgba16.inc.c");
	grass_09005800 = sprite_add_from_rom("textures/grass/wf_textures.05800.rgba16.inc.c");
	grass_09006000 = sprite_add_from_rom("textures/grass/wf_textures.06000.rgba16.inc.c");
	grass_09006800 = sprite_add_from_rom("textures/grass/wf_textures.06800.rgba16.inc.c");
	grass_09007000 = sprite_add_from_rom("textures/grass/wf_textures.07000.rgba16.inc.c");
	grass_09007800 = sprite_add_from_rom("textures/grass/wf_textures.07800.rgba16.inc.c");
	grass_09008000 = sprite_add_from_rom("textures/grass/wf_textures.08000.rgba16.inc.c");
	grass_09008800 = sprite_add_from_rom("textures/grass/wf_textures.08800.rgba16.inc.c");
	grass_09009000 = sprite_add_from_rom("textures/grass/wf_textures.09000.rgba16.inc.c");
	grass_09009800 = sprite_add_from_rom("textures/grass/wf_textures.09800.rgba16.inc.c");
	grass_0900A000 = sprite_add_from_rom("textures/grass/wf_textures.0A000.rgba16.inc.c");
	grass_0900A800 = sprite_add_from_rom("textures/grass/wf_textures.0A800.rgba16.inc.c");
	grass_0900B000 = sprite_add_from_rom("textures/grass/wf_textures.0B000.ia16.inc.c");
	grass_0900B800 = sprite_add_from_rom("textures/grass/wf_textures.0B800.ia16.inc.c");

	boot("texture_scripts_macros_init");

}
	
	
	
