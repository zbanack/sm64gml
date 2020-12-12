function mario_geo_define(){
	 mario_geo_face_and_wings = [
	    [GCMD_ROT,  0x00, 0, 0, 0],
	    [GCMD_SWITCH, 0, geo_switch_mario_eyes],
	    [GCMD_OPEN],
	        [GCMD_DLIST,  LAYER_OPAQUE, mario_cap_on_eyes_front ],
	        [GCMD_DLIST,  LAYER_OPAQUE, mario_cap_on_eyes_half_closed ],
	        [GCMD_DLIST,  LAYER_OPAQUE, mario_cap_on_eyes_closed ],
	    [GCMD_CLOSE],
	    [GCMD_RETURN ],
	]

	 mario_geo_medium_poly_body = [
	    [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, null],
	    [GCMD_OPEN],
	        [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_butt],
	        [GCMD_OPEN],
	            //[GCMD_GENERATED,  0, geo_move_mario_part_from_parent ],
	            [GCMD_GENERATED,  0, geo_mario_tilt_torso ],
	            [GCMD_ROT,  0x00, 0, 0, 0 ],
	            [GCMD_OPEN],
	                [GCMD_ANIM, LAYER_OPAQUE, 68, 0, 0, mario_medium_poly_torso],
	                [GCMD_OPEN],
	                    [GCMD_ANIM, LAYER_OPAQUE, 87, 0, 0, null],
	                    [GCMD_OPEN],
	                        [GCMD_BRANCH,  1, mario_geo_face_and_wings ],
	                    [GCMD_CLOSE],
	                    [GCMD_ANIM, LAYER_OPAQUE, 67, -10, 79, null],  /// open mario left arm
	                    [GCMD_OPEN],
	                        [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_left_arm],
	                        [GCMD_OPEN],
	                            [GCMD_ANIM, LAYER_OPAQUE, 65, 0, 0, mario_medium_poly_left_forearm_shared_dl],
	                            [GCMD_OPEN],
	                                [GCMD_ANIM, LAYER_OPAQUE, 60, 0, 0, mario_medium_poly_left_hand_closed],
	                            [GCMD_CLOSE],
	                        [GCMD_CLOSE],
	                    [GCMD_CLOSE],    /// close mario left arm
	                    [GCMD_ANIM, LAYER_OPAQUE, 68, -10, -79, null],  /// open mario left arm
	                    [GCMD_OPEN],
	                        [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_right_arm],
	                        [GCMD_OPEN],
	                            [GCMD_ANIM, LAYER_OPAQUE, 65, 0, 0, mario_medium_poly_right_forearm_shared_dl],
	                            [GCMD_OPEN],
	                                [GCMD_ANIM, LAYER_OPAQUE, 60, 0, 0, mario_medium_poly_right_hand_closed],
	                            [GCMD_CLOSE],
	                        [GCMD_CLOSE],
	                    [GCMD_CLOSE],    /// close mario left arm
	                [GCMD_CLOSE],
	            [GCMD_CLOSE],
	            [GCMD_ANIM, LAYER_OPAQUE, 13, -8, 42, null],  /// open left leg stuff
	            [GCMD_OPEN], 
	                [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_left_thigh], 
	                [GCMD_OPEN],
	                    [GCMD_ANIM, LAYER_OPAQUE, 89, 0, 0, mario_medium_poly_left_leg_shared_dl], 
	                    [GCMD_OPEN],
	                        [GCMD_ANIM, LAYER_OPAQUE, 67, 0, 0, mario_medium_poly_left_foot], 
	                    [GCMD_CLOSE],
	                [GCMD_CLOSE],
	            [GCMD_CLOSE],  /// end left leg stuff
	            [GCMD_ANIM, LAYER_OPAQUE, 13, -8, -42, null],  /// open right leg stuff
	            [GCMD_OPEN], 
	                [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mario_medium_poly_right_thigh], 
	                [GCMD_OPEN],
	                    [GCMD_ANIM, LAYER_OPAQUE, 89, 0, 0, mario_medium_poly_right_leg_shared_dl], 
	                    [GCMD_OPEN],
	                        [GCMD_ANIM, LAYER_OPAQUE, 67, 0, 0, mario_medium_poly_right_foot], 
	                    [GCMD_CLOSE],
	                [GCMD_CLOSE],
	            [GCMD_CLOSE],  /// end right leg stuff
	        [GCMD_CLOSE],
	    [GCMD_CLOSE],
	]

	 mario_geo_body = [
	    [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, null],
	    [GCMD_OPEN],
	        [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mario_butt],
	        [GCMD_OPEN],
	            // [GCMD_GENERATED,  0, geo_move_mario_part_from_parent ],
	            [GCMD_GENERATED,  0, geo_mario_tilt_torso ],
	            [GCMD_ROT, 0x00, 0, 0, 0 ],
	            [GCMD_OPEN],
	                [GCMD_ANIM, LAYER_OPAQUE, 68, 0, 0, mario_torso],
	                [GCMD_OPEN],
	                    [GCMD_ANIM, LAYER_OPAQUE, 87, 0, 0, null],
	                    [GCMD_OPEN],
	                        [GCMD_BRANCH, 1, mario_geo_face_and_wings ],
	                    [GCMD_CLOSE],
	                    [GCMD_ANIM, LAYER_OPAQUE, 67, -10, 79, null],  /// open mario left arm
	                    [GCMD_OPEN],
	                        [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mario_left_arm],
	                        [GCMD_OPEN],
	                            [GCMD_ANIM, LAYER_OPAQUE, 65, 0, 0, mario_left_forearm_shared_dl],
	                            [GCMD_OPEN],
	                                [GCMD_ANIM, LAYER_OPAQUE, 60, 0, 0, mario_left_hand_closed],
	                            [GCMD_CLOSE],
	                        [GCMD_CLOSE],
	                    [GCMD_CLOSE],    /// close mario left arm
	                    [GCMD_ANIM, LAYER_OPAQUE, 68, -10, -79, null],  /// open mario left arm
	                    [GCMD_OPEN],
	                        [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mario_right_arm],
	                        [GCMD_OPEN],
	                            [GCMD_ANIM, LAYER_OPAQUE, 65, 0, 0, mario_right_forearm_shared_dl],
	                            [GCMD_OPEN],
	                                [GCMD_ANIM, LAYER_OPAQUE, 60, 0, 0, mario_right_hand_closed],
	                            [GCMD_CLOSE],
	                        [GCMD_CLOSE],
	                    [GCMD_CLOSE],    /// close mario left arm
	                [GCMD_CLOSE],
	            [GCMD_CLOSE],
	            [GCMD_ANIM, LAYER_OPAQUE, 13, -8, 42, null],  /// open left leg stuff
	            [GCMD_OPEN], 
	                [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mario_left_thigh], 
	                [GCMD_OPEN],
	                    [GCMD_ANIM, LAYER_OPAQUE, 89, 0, 0, mario_left_leg_shared_dl], 
	                    [GCMD_OPEN],
	                        [GCMD_ANIM, LAYER_OPAQUE, 67, 0, 0, mario_left_foot], 
	                    [GCMD_CLOSE],
	                [GCMD_CLOSE],
	            [GCMD_CLOSE],  /// end left leg stuff
	            [GCMD_ANIM, LAYER_OPAQUE, 13, -8, -42, null],  /// open right leg stuff
	            [GCMD_OPEN], 
	                [GCMD_ANIM, LAYER_OPAQUE, 0, 0, 0, mario_right_thigh], 
	                [GCMD_OPEN],
	                    [GCMD_ANIM, LAYER_OPAQUE, 89, 0, 0, mario_right_leg_shared_dl], 
	                    [GCMD_OPEN],
	                        [GCMD_ANIM, LAYER_OPAQUE, 67, 0, 0, mario_right_foot], 
	                    [GCMD_CLOSE],
	                [GCMD_CLOSE],
	            [GCMD_CLOSE],  /// end right leg stuff
	        [GCMD_CLOSE],
	    [GCMD_CLOSE],
	    [GCMD_RETURN],
	]

	  mario_geo = [
	    [GCMD_SHADOW, SHADOW_CIRCLE_PLAYER, 0xB4, 100],
	    [GCMD_OPEN],
	        [GCMD_SCALE, 0x00, 16384],
	        [GCMD_OPEN],
	            [GCMD_BRANCH,  1, mario_geo_body ],
	        [GCMD_CLOSE],
	    [GCMD_CLOSE],
	    [GCMD_END],
	]
}