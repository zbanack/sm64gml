// BOOTING
if (!INITIALIZED) {
	draw_set_color(c_black);
	draw_rectangle(-1, -1, SCREEN_WIDTH+1, SCREEN_HEIGHT+1, false);
	draw_set_font(fntDebug);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_set_color(c_white);
	var _size = ds_list_size(boot_stack);
	var _stop = min(20, _size);
	
	draw_set_color(c_blue);
	draw_rectangle(0, SCREEN_HEIGHT-16, remap(_size, 0, Boot.count, 0, SCREEN_WIDTH), SCREEN_HEIGHT, false);
	
	draw_set_color(c_white);
	for(var i = 0; i < _stop; i++) {
		draw_text(16, SCREEN_HEIGHT-20 - (i * 12), boot_stack[| i]);
	}
	
	draw_text(16, SCREEN_HEIGHT, "SM64.GML");

	exit;
}

// flip view upsidedown :x
draw_surface_ext(application_surface, 0, SCREEN_HEIGHT, 1, -1, 0, c_white, 1);

frame_interpolation_render(false);
window_bars_render();