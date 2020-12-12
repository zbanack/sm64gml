function mario_geo_switch_case_macros_init() {
#macro MARIO_EYES_BLINK					(0x00)
#macro MARIO_EYES_OPEN					(0x01)
#macro MARIO_EYES_HALF_CLOSED			(0x02)
#macro MARIO_EYES_CLOSED				(0x03)
#macro MARIO_EYES_LOOK_LEFT  			(0x04)
#macro MARIO_EYES_LOOK_RIGHT 			(0x05)
#macro MARIO_EYES_LOOK_UP    			(0x06)
#macro MARIO_EYES_LOOK_DOWN  			(0x07)
#macro MARIO_EYES_DEAD					(0x08)

#macro MARIO_HAND_FISTS				    (0x00)
#macro MARIO_HAND_OPEN				    (0x01)
#macro MARIO_HAND_PEACE_SIGN		    (0x02)
#macro MARIO_HAND_HOLDING_CAP		    (0x03)
#macro MARIO_HAND_HOLDING_WING_CAP	    (0x04)
#macro MARIO_HAND_RIGHT_OPEN		    (0x05)
										
#macro MARIO_HAS_DEFAULT_CAP_ON			(0x00)
#macro MARIO_HAS_DEFAULT_CAP_OFF		(0x01)
#macro MARIO_HAS_WING_CAP_ON			(0x02)
#macro MARIO_HAS_WING_CAP_OFF 			(0x03)
										
#macro GRAB_POS_NULL					(0x00)
#macro GRAB_POS_LIGHT_OBJ				(0x01)
#macro GRAB_POS_HEAVY_OBJ				(0x02)
#macro GRAB_POS_BOWSER					(0x03)	
boot("mario_geo_switch_case_macros_init");
}