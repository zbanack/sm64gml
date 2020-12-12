function n64_controller_init() {
enum N64Button {
	_n64_A,
	_n64_B,
	_n64_CDOWN,
	_n64_CLEFT,
	_n64_CRIGHT,
	_n64_CUP,
	_n64_LTRIGGER,
	_n64_RTRIGGER,
	_n64_START,
	_n64_Z,
	_n64_KNOB,
	_n64_PLAIN,
	_n64_UP,
	_n64_RIGHT,
	_n64_DOWN,
	_n64_LEFT,
	_n64_count
}


start_x = display_get_gui_width() - 180;
start_y = display_get_gui_height() - 80;

blend = c_red;

scale = 0.15;

// a button
a_ang = 0;
a_dist = 400;
a_x = start_x + lengthdir_x(scale * a_dist, a_ang);
a_y = start_y + lengthdir_y(scale * a_dist, a_ang);

// b button
b_ang = -45;
b_dist = 250;
b_x = a_x + lengthdir_x(scale * b_dist, b_ang);
b_y = a_y + lengthdir_y(scale * b_dist, b_ang);

// c center
c_ang = 10;
c_dist = 750;
c_x = start_x + lengthdir_x(scale * c_dist, c_ang);
c_y = start_y + lengthdir_y(scale * c_dist, c_ang);

// c right
c_right_ang = 0;
c_right_dist = 128;
c_right_x = c_x + lengthdir_x(scale * c_right_dist, c_right_ang);
c_right_y = c_y + lengthdir_y(scale * c_right_dist, c_right_ang);

// c up
c_up_ang = 90;
c_up_dist = 128;
c_up_x = c_x + lengthdir_x(scale * c_up_dist, c_up_ang);
c_up_y = c_y + lengthdir_y(scale * c_up_dist, c_up_ang);

// c left
c_left_ang = 180;
c_left_dist = 128;
c_left_x = c_x + lengthdir_x(scale * c_left_dist, c_left_ang);
c_left_y = c_y + lengthdir_y(scale * c_left_dist, c_left_ang);

// c down
c_down_ang = 270;
c_down_dist = 128;
c_down_x = c_x + lengthdir_x(scale * c_down_dist, c_down_ang);
c_down_y = c_y + lengthdir_y(scale * c_down_dist, c_down_ang);

///////////

// dpad center
scale_dpad = scale * 1.5;
dpad_ang = 30;
dpad_dist = 280;
dpad_x = start_x - (scale * 40) + lengthdir_x(scale * dpad_dist, dpad_ang);
dpad_y = start_y - (scale * 60) + lengthdir_y(scale * dpad_dist, dpad_ang);

// dpad right
dpad_right_ang = 0;
dpad_right_dist = 0;
dpad_right_x = dpad_x + lengthdir_x(scale * dpad_right_dist, dpad_right_ang);
dpad_right_y = dpad_y + lengthdir_y(scale * dpad_right_dist, dpad_right_ang);

// dpad up
dpad_up_ang = 90;
dpad_up_dist = 0;
dpad_up_x = dpad_x + lengthdir_x(scale * dpad_up_dist, dpad_up_ang);
dpad_up_y = dpad_y + lengthdir_y(scale * dpad_up_dist, dpad_up_ang);

// dpad left
dpad_left_ang = 180;
dpad_left_dist = 0;
dpad_left_x = dpad_x + lengthdir_x(scale * dpad_left_dist, dpad_left_ang);
dpad_left_y = dpad_y + lengthdir_y(scale * dpad_left_dist, dpad_left_ang);

// dpad down
dpad_down_ang = 270;
dpad_down_dist = 0;
dpad_down_x = dpad_x + lengthdir_x(scale * dpad_down_dist, dpad_down_ang);
dpad_down_y = dpad_y + lengthdir_y(scale * dpad_down_dist, dpad_down_ang);

// right trigger
r_trigger_ang = 90;
r_trigger_dist = 300;
r_trigger_x = c_x + lengthdir_x(scale * r_trigger_dist, r_trigger_ang);
r_trigger_y = c_y + lengthdir_y(scale * r_trigger_dist, r_trigger_ang);

// left trigger
l_trigger_ang = 90;
l_trigger_dist = 300;
l_trigger_x = dpad_x + lengthdir_x(scale * l_trigger_dist, l_trigger_ang);
l_trigger_y = dpad_y  + lengthdir_y(scale * l_trigger_dist, l_trigger_ang);

// z trigger
z_trigger_ang = -35;
z_trigger_dist = 350;
z_trigger_x = start_x + lengthdir_x(scale * z_trigger_dist, z_trigger_ang);
z_trigger_y = start_y + (90*scale) + lengthdir_y(scale * z_trigger_dist, z_trigger_ang);

// joy
joy_ang = 270;
joy_dist = 250;
joy_x = start_x + lengthdir_x(scale * joy_dist, joy_ang);
joy_y = start_y + lengthdir_y(scale * joy_dist, joy_ang);	
}


function n64_controller_render() {
	var controller = gControllers[0];
	var btn = controller.buttonDown;
	var alp = 0.75;
	draw_sprite_ext(sN64Buttons, N64Button._n64_START,	start_x, start_y, scale, scale, 0, (btn & START_BUTTON) ? blend : c_white, alp);

	draw_sprite_ext(sN64Buttons, N64Button._n64_A,		a_x, a_y, scale, scale, 0, (btn & A_BUTTON) ? blend : c_white, alp);
	draw_sprite_ext(sN64Buttons, N64Button._n64_B,		b_x, b_y, scale, scale, 0, (btn & B_BUTTON) ? blend : c_white, alp);

	draw_sprite_ext(sN64Buttons, N64Button._n64_CRIGHT,		c_right_x,	c_right_y,	scale, scale, 0,    (btn & R_CBUTTONS) ? blend : c_white, alp);
	draw_sprite_ext(sN64Buttons, N64Button._n64_CUP,		c_up_x,		c_up_y,		scale, scale, 0,	(btn & U_CBUTTONS) ? blend : c_white, alp);
	draw_sprite_ext(sN64Buttons, N64Button._n64_CDOWN,		c_down_x,	c_down_y,	scale, scale, 0,	(btn & D_CBUTTONS) ? blend : c_white, alp);
	draw_sprite_ext(sN64Buttons, N64Button._n64_CLEFT,		c_left_x,	c_left_y,	scale, scale, 0,	(btn & L_CBUTTONS) ? blend : c_white, alp);

	draw_sprite_ext(sN64Buttons, N64Button._n64_PLAIN,		dpad_x,	dpad_y,	scale_dpad, scale_dpad, 0, c_white, alp);

	draw_sprite_ext(sN64Buttons, N64Button._n64_RIGHT,		dpad_right_x,	dpad_right_y,	scale_dpad, scale_dpad, 0,	(false) ? blend : c_white, alp);
	draw_sprite_ext(sN64Buttons, N64Button._n64_UP,			dpad_up_x,		dpad_up_y,		scale_dpad, scale_dpad, 0,	(false) ? blend : c_white, alp);
	draw_sprite_ext(sN64Buttons, N64Button._n64_DOWN,		dpad_down_x,	dpad_down_y,	scale_dpad, scale_dpad, 0,	(false) ? blend : c_white, alp);
	draw_sprite_ext(sN64Buttons, N64Button._n64_LEFT,		dpad_left_x,	dpad_left_y,	scale_dpad, scale_dpad, 0,	(false) ? blend : c_white, alp);

	draw_sprite_ext(sN64Buttons, N64Button._n64_LTRIGGER,	l_trigger_x,	l_trigger_y,	scale, scale, 0,	(btn & L_TRIG) ? blend : c_white, alp);
	draw_sprite_ext(sN64Buttons, N64Button._n64_RTRIGGER,	r_trigger_x,	r_trigger_y,	scale, scale, 0,	(btn & R_TRIG) ? blend : c_white, alp);

	draw_sprite_ext(sN64Buttons, N64Button._n64_Z,			z_trigger_x,	z_trigger_y,	scale, scale, 0,	(btn & Z_TRIG) ? blend : c_white, alp);

				
	var nz = (controller.stickX !=0 || controller.stickY !=0);
	var lx, ly;
	lx = controller.stickX * scale;
	ly = -controller.stickY * scale;
	draw_sprite_ext(sN64Buttons, N64Button._n64_KNOB,		joy_x,		joy_y,		scale, scale, 0, c_black, alp * 0.4);
	draw_sprite_ext(sN64Buttons, N64Button._n64_KNOB,		joy_x + lx,	joy_y + ly,	scale, scale, 0, nz ? blend : c_white, alp);	
}