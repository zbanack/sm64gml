function window_macros_init() {
	#macro BASE_WIDTH		320
	#macro BASE_HEIGHT		240
	#macro WINDOW_SCALE		2
	#macro SCREEN_WIDTH		BASE_WIDTH
	#macro SCREEN_HEIGHT	BASE_HEIGHT
	#macro ASPECT_RATIO		(SCREEN_WIDTH / SCREEN_HEIGHT)

	#macro ASPECT_4_3		(4.0 / 3.0)
	#macro ADJUST_ASPECT	(ASPECT_4_3 / ASPECT_RATIO)
	
	#macro BAR_HEIGHT 1
	
	application_surface_draw_enable(false);
	
	// camera init
	view_enabled		= true;
	view_visible[0]		= true;
	room_width			= BASE_WIDTH;
	room_height			= BASE_HEIGHT;
	view_camera[0]		= camera_create_view(0, 0, BASE_WIDTH, BASE_HEIGHT);
	window_set_size(BASE_WIDTH * WINDOW_SCALE, BASE_HEIGHT * WINDOW_SCALE);
	
	globalvar center_window;
	center_window		= 2;
	
	
	boot("window_macros_init");
}

function window_handle_centering() {
	if (center_window--) {
		window_center();	
	}	
}

function window_bars_render() {
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_rectangle(0, 0, SCREEN_WIDTH, BAR_HEIGHT, false);
	draw_rectangle(0, SCREEN_HEIGHT - BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT, false);	
}