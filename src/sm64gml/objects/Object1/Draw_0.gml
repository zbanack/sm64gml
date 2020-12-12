if (!INITIALIZED) exit;
	
gpu_set_texfilter(true);
draw_clear_alpha(gDrawClearColor, 1);

gpu_set_cullmode(cull_noculling);
gpu_set_zfunc(cmpfunc_less);
gpu_set_tex_repeat(true);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(128);
gpu_set_zwriteenable(true);

gpu_set_ztestenable(false);

// camera ortho background
matrix_set(matrix_view, matrix_build_identity());
camera_set_view_mat(view_camera[0], matrix_build_identity());
matrix_set(matrix_view, matrix_build(0, 0, 0, 0, 0, 0, SCREEN_WIDTH*0.75, SCREEN_HEIGHT, -SCREEN_WIDTH));

while(!ds_stack_empty(global.__triangles_to_render_ortho_background)) {
	var dt = ds_stack_pop(global.__triangles_to_render_ortho_background);
	var model = dt[0]; 
	vertex_submit(model, pr_trianglelist, dt[1]);
	vertex_delete_buffer(model);
}

gpu_set_ztestenable(true);

// camera normal
matrix_set(matrix_view, matrix_build_identity());
camera_set_view_mat(view_camera[0], matrix_build_identity());
camera_set_proj_mat(view_camera[0], matrix_build_projection_perspective_fov(90, 1, global.__znear, global.__zfar*100));	
		
while(!ds_stack_empty(global.__triangles_to_render)) {
	var dt = ds_stack_pop(global.__triangles_to_render);
	var model = dt[0];
	var texture = dt[1];
	//if (dt[1] != -1 &&   != -1 && previous_frame_can_render) {
	//	texture = previous_frame_texel;	
	//}
	vertex_submit(model, pr_trianglelist, texture);
	vertex_delete_buffer(model);
}

if (SCREEN_SHADED) {
	//matrix_set(matrix_view, matrix_build_identity());
	//camera_set_view_mat(view_camera[0], matrix_build_identity());
	//matrix_set(matrix_view, matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1);
	//
	//gpu_set_ztestenable(false);
}

// camera ortho
matrix_set(matrix_view, matrix_build_identity());
camera_set_view_mat(view_camera[0], matrix_build_identity());
matrix_set(matrix_view, matrix_build(0, 0, 0, 0, 0, 0, SCREEN_WIDTH*0.75, SCREEN_HEIGHT, -SCREEN_WIDTH*0.75));

gpu_set_ztestenable(false);

while(!ds_stack_empty(global.__triangles_to_render_ortho)) {
	var dt = ds_stack_pop(global.__triangles_to_render_ortho);
	var model = dt[0];
	vertex_submit(model, pr_trianglelist, dt[1]);
	vertex_delete_buffer(model);
}

// camera ortho 1:1
matrix_set(matrix_view, matrix_build_identity());
camera_set_view_mat(view_camera[0], matrix_build_identity());
matrix_set(matrix_view, matrix_build(0, 0, 0, 0, 0, 0, SCREEN_WIDTH*0.75, SCREEN_HEIGHT, -SCREEN_WIDTH*0.75));

gpu_set_ztestenable(false);

while(!ds_stack_empty(global.__triangles_to_render_ortho_1_1)) {
	var dt = ds_stack_pop(global.__triangles_to_render_ortho_1_1);
	var model = dt[0];
	vertex_submit(model, pr_trianglelist, dt[1]);
	vertex_delete_buffer(model);
}

gpu_set_texfilter(false);