function bitdw_init(){
	
	// init object collision/geo/models
	bitdw_collapsing_stairs_1();
	bitdw_collapsing_stairs_2();
	bitdw_collapsing_stairs_3();
	bitdw_collapsing_stairs_4();
	bitdw_collapsing_stairs_5();
	bitdw_ferris_platform();
	bitdw_ferris_wheel_axle();
	bitdw_seesaw_platform();
	bitdw_sliding_platform();
	bitdw_square_platform();
	
	// areas/1
	bitdw_large_platform();
	bitdw_narrow_path_platform();
	bitdw_octogonal_platform();
	bitdw_platform_with_hill();
	bitdw_platforms_and_tilting();
	bitdw_platforms_and_tilting_2();
	bitdw_quartz_crystal();
	bitdw_quartzy_path_1();
	bitdw_quartzy_path_2();
	bitdw_quartzy_path_fences();
	bitdw_staircase_slope_and_platform();
	bitdw_starting_platform();
	bitdw_track_for_pyramid_platforms();
	bitdw_wooden_bridge_and_fences();
	bitdw_wooden_platform();
	
	// areas/1 model/collision/geo
	bitdw_area_1_define();
	
	// areas/1 macro script
	bitdw_macro();
	
	
	boot("bitdw_init");
	
}