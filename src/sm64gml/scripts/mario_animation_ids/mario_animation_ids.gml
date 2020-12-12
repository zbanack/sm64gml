function mario_animation_macros_init() {
#macro MARIO_ANIM_SLOW_LEDGE_GRAB							(0x00)
#macro MARIO_ANIM_FALL_OVER_BACKWARDS						(0x01)
#macro MARIO_ANIM_BACKWARD_AIR_KB							(0x02)
#macro MARIO_ANIM_DYING_ON_BACK							(0x03)
#macro MARIO_ANIM_BACKFLIP									(0x04)
#macro MARIO_ANIM_CLIMB_UP_POLE							(0x05)
#macro MARIO_ANIM_GRAB_POLE_SHORT							(0x06)
#macro MARIO_ANIM_GRAB_POLE_SWING_PART1					(0x07)
#macro MARIO_ANIM_GRAB_POLE_SWING_PART2					(0x08)
#macro MARIO_ANIM_HANDSTAND_IDLE							(0x09)
#macro MARIO_ANIM_HANDSTAND_JUMP							(0x0A)
#macro MARIO_ANIM_START_HANDSTAND							(0x0B)
#macro MARIO_ANIM_RETURN_FROM_HANDSTAND					(0x0C)
#macro MARIO_ANIM_IDLE_ON_POLE								(0x0D)
#macro MARIO_ANIM_A_POSE									(0x0E)
#macro MARIO_ANIM_SKID_ON_GROUND							(0x0F)
#macro MARIO_ANIM_STOP_SKID								(0x10)
#macro MARIO_ANIM_CROUCH_FROM_FAST_LONGJUMP				(0x11)
#macro MARIO_ANIM_CROUCH_FROM_SLOW_LONGJUMP				(0x12)
#macro MARIO_ANIM_FAST_LONGJUMP							(0x13)
#macro MARIO_ANIM_SLOW_LONGJUMP							(0x14)
#macro MARIO_ANIM_AIRBORNE_ON_STOMACH						(0x15)
#macro MARIO_ANIM_WALK_WITH_LIGHT_OBJ						(0x16)
#macro MARIO_ANIM_RUN_WITH_LIGHT_OBJ						(0x17)
#macro MARIO_ANIM_SLOW_WALK_WITH_LIGHT_OBJ					(0x18)
#macro MARIO_ANIM_SHIVERING_WARMING_HAND					(0x19)
#macro MARIO_ANIM_SHIVERING_RETURN_TO_IDLE					(0x1A)
#macro MARIO_ANIM_SHIVERING								(0x1B)
#macro MARIO_ANIM_CLIMB_DOWN_LEDGE							(0x1C)
#macro MARIO_ANIM_CREDITS_WAVING							(0x1D)
#macro MARIO_ANIM_CREDITS_LOOK_UP							(0x1E)
#macro MARIO_ANIM_CREDITS_RETURN_FROM_LOOK_UP				(0x1F)
#macro MARIO_ANIM_CREDITS_RAISE_HAND						(0x20)
#macro MARIO_ANIM_CREDITS_LOWER_HAND						(0x21)
#macro MARIO_ANIM_CREDITS_TAKE_OFF_CAP						(0x22)
#macro MARIO_ANIM_CREDITS_START_WALK_LOOK_UP				(0x23)
#macro MARIO_ANIM_CREDITS_LOOK_BACK_THEN_RUN				(0x24)
#macro MARIO_ANIM_FINAL_BOWSER_RAISE_HAND_SPIN				(0x25)
#macro MARIO_ANIM_FINAL_BOWSER_WING_CAP_TAKE_OFF			(0x26)
#macro MARIO_ANIM_CREDITS_PEACE_SIGN						(0x27)
#macro MARIO_ANIM_STAND_UP_FROM_LAVA_BOOST					(0x28)
#macro MARIO_ANIM_FIRE_LAVA_BURN							(0x29)
#macro MARIO_ANIM_WING_CAP_FLY								(0x2A)
#macro MARIO_ANIM_HANG_ON_OWL								(0x2B)
#macro MARIO_ANIM_LAND_ON_STOMACH							(0x2C)
#macro MARIO_ANIM_AIR_FORWARD_KB							(0x2D)
#macro MARIO_ANIM_DYING_ON_STOMACH							(0x2E)
#macro MARIO_ANIM_SUFFOCATING								(0x2F)
#macro MARIO_ANIM_COUGHING									(0x30)
#macro MARIO_ANIM_THROW_CATCH_KEY							(0x31)
#macro MARIO_ANIM_DYING_FALL_OVER							(0x32)
#macro MARIO_ANIM_IDLE_ON_LEDGE							(0x33)
#macro MARIO_ANIM_FAST_LEDGE_GRAB							(0x34)
#macro MARIO_ANIM_HANG_ON_CEILING							(0x35)
#macro MARIO_ANIM_PUT_CAP_ON								(0x36)
#macro MARIO_ANIM_TAKE_CAP_OFF_THEN_ON						(0x37)
#macro MARIO_ANIM_QUICKLY_PUT_CAP_ON		(0x38)
#macro MARIO_ANIM_HEAD_STUCK_IN_GROUND						(0x39)
#macro MARIO_ANIM_GROUND_POUND_LANDING						(0x3A)
#macro MARIO_ANIM_TRIPLE_JUMP_GROUND_POUND					(0x3B)
#macro MARIO_ANIM_START_GROUND_POUND						(0x3C)
#macro MARIO_ANIM_GROUND_POUND								(0x3D)
#macro MARIO_ANIM_BOTTOM_STUCK_IN_GROUND					(0x3E)
#macro MARIO_ANIM_IDLE_WITH_LIGHT_OBJ						(0x3F)
#macro MARIO_ANIM_JUMP_LAND_WITH_LIGHT_OBJ					(0x40)
#macro MARIO_ANIM_JUMP_WITH_LIGHT_OBJ						(0x41)
#macro MARIO_ANIM_FALL_LAND_WITH_LIGHT_OBJ					(0x42)
#macro MARIO_ANIM_FALL_WITH_LIGHT_OBJ						(0x43)
#macro MARIO_ANIM_FALL_FROM_SLIDING_WITH_LIGHT_OBJ			(0x44)
#macro MARIO_ANIM_SLIDING_ON_BOTTOM_WITH_LIGHT_OBJ			(0x45)
#macro MARIO_ANIM_STAND_UP_FROM_SLIDING_WITH_LIGHT_OBJ		(0x46)
#macro MARIO_ANIM_RIDING_SHELL								(0x47)
#macro MARIO_ANIM_WALKING									(0x48)
#macro MARIO_ANIM_FORWARD_FLIP 				(0x49)
#macro MARIO_ANIM_JUMP_RIDING_SHELL						(0x4A)
#macro MARIO_ANIM_LAND_FROM_DOUBLE_JUMP					(0x4B)
#macro MARIO_ANIM_DOUBLE_JUMP_FALL							(0x4C)
#macro MARIO_ANIM_SINGLE_JUMP								(0x4D)
#macro MARIO_ANIM_LAND_FROM_SINGLE_JUMP					(0x4E)
#macro MARIO_ANIM_AIR_KICK									(0x4F)
#macro MARIO_ANIM_DOUBLE_JUMP_RISE							(0x50)
#macro MARIO_ANIM_START_FORWARD_SPINNING 		(0x51)
#macro MARIO_ANIM_THROW_LIGHT_OBJECT			(0x52)
#macro MARIO_ANIM_FALL_FROM_SLIDE_KICK			(0x53)
#macro MARIO_ANIM_BEND_KNESS_RIDING_SHELL		(0x54)
#macro MARIO_ANIM_LEGS_STUCK_IN_GROUND			(0x55)
#macro MARIO_ANIM_GENERAL_FALL								(0x56)
#macro MARIO_ANIM_GENERAL_LAND								(0x57)
#macro MARIO_ANIM_BEING_GRABBED							(0x58)
#macro MARIO_ANIM_GRAB_HEAVY_OBJECT						(0x59)
#macro MARIO_ANIM_SLOW_LAND_FROM_DIVE						(0x5A)
#macro MARIO_ANIM_FLY_FROM_CANNON							(0x5B)
#macro MARIO_ANIM_MOVE_ON_WIRE_NET_RIGHT					(0x5C)
#macro MARIO_ANIM_MOVE_ON_WIRE_NET_LEFT					(0x5D)
#macro MARIO_ANIM_MISSING_CAP								(0x5E)
#macro MARIO_ANIM_PULL_DOOR_WALK_IN						(0x5F)
#macro MARIO_ANIM_PUSH_DOOR_WALK_IN						(0x60)
#macro MARIO_ANIM_UNLOCK_DOOR								(0x61)
#macro MARIO_ANIM_START_REACH_POCKET (0x62)
#macro MARIO_ANIM_REACH_POCKET 			(0x63)
#macro MARIO_ANIM_STOP_REACH_POCKET (0x64)
#macro MARIO_ANIM_GROUND_THROW								(0x65)
#macro MARIO_ANIM_GROUND_KICK								(0x66)
#macro MARIO_ANIM_FIRST_PUNCH								(0x67)
#macro MARIO_ANIM_SECOND_PUNCH								(0x68)
#macro MARIO_ANIM_FIRST_PUNCH_FAST							(0x69)
#macro MARIO_ANIM_SECOND_PUNCH_FAST						(0x6A)
#macro MARIO_ANIM_PICK_UP_LIGHT_OBJ						(0x6B)
#macro MARIO_ANIM_PUSHING									(0x6C)
#macro MARIO_ANIM_START_RIDING_SHELL						(0x6D)
#macro MARIO_ANIM_PLACE_LIGHT_OBJ							(0x6E)
#macro MARIO_ANIM_FORWARD_SPINNING							(0x6F)
#macro MARIO_ANIM_BACKWARD_SPINNING						(0x70)
#macro MARIO_ANIM_BREAKDANCE								(0x71)
#macro MARIO_ANIM_RUNNING									(0x72)
#macro MARIO_ANIM_RUNNING_UNUSED(0x73)
#macro MARIO_ANIM_SOFT_BACK_KB								(0x74)
#macro MARIO_ANIM_SOFT_FRONT_KB							(0x75)
#macro MARIO_ANIM_DYING_IN_QUICKSAND						(0x76)
#macro MARIO_ANIM_IDLE_IN_QUICKSAND						(0x77)
#macro MARIO_ANIM_MOVE_IN_QUICKSAND						(0x78)
#macro MARIO_ANIM_ELECTROCUTION							(0x79)
#macro MARIO_ANIM_SHOCKED									(0x7A)
#macro MARIO_ANIM_BACKWARD_KB								(0x7B)
#macro MARIO_ANIM_FORWARD_KB								(0x7C)
#macro MARIO_ANIM_IDLE_HEAVY_OBJ							(0x7D)
#macro MARIO_ANIM_STAND_AGAINST_WALL						(0x7E)
#macro MARIO_ANIM_SIDESTEP_LEFT							(0x7F)
#macro MARIO_ANIM_SIDESTEP_RIGHT							(0x80)
#macro MARIO_ANIM_START_SLEEP_IDLE							(0x81)
#macro MARIO_ANIM_START_SLEEP_SCRATCH						(0x82)
#macro MARIO_ANIM_START_SLEEP_YAWN							(0x83)
#macro MARIO_ANIM_START_SLEEP_SITTING						(0x84)
#macro MARIO_ANIM_SLEEP_IDLE								(0x85)
#macro MARIO_ANIM_SLEEP_START_LYING						(0x86)
#macro MARIO_ANIM_SLEEP_LYING								(0x87)
#macro MARIO_ANIM_DIVE										(0x88)
#macro MARIO_ANIM_SLIDE_DIVE								(0x89)
#macro MARIO_ANIM_GROUND_BONK								(0x8A)
#macro MARIO_ANIM_STOP_SLIDE_LIGHT_OBJ						(0x8B)
#macro MARIO_ANIM_SLIDE_KICK								(0x8C)
#macro MARIO_ANIM_CROUCH_FROM_SLIDE_KICK					(0x8D)
#macro MARIO_ANIM_SLIDE_MOTIONLESS 		(0x8E)
#macro MARIO_ANIM_STOP_SLIDE								(0x8F)
#macro MARIO_ANIM_FALL_FROM_SLIDE							(0x90)
#macro MARIO_ANIM_SLIDE									(0x91)
#macro MARIO_ANIM_TIPTOE									(0x92)
#macro MARIO_ANIM_TWIRL_LAND								(0x93)
#macro MARIO_ANIM_TWIRL									(0x94)
#macro MARIO_ANIM_START_TWIRL								(0x95)
#macro MARIO_ANIM_STOP_CROUCHING							(0x96)
#macro MARIO_ANIM_START_CROUCHING							(0x97)
#macro MARIO_ANIM_CROUCHING								(0x98)
#macro MARIO_ANIM_CRAWLING									(0x99)
#macro MARIO_ANIM_STOP_CRAWLING							(0x9A)
#macro MARIO_ANIM_START_CRAWLING							(0x9B)
#macro MARIO_ANIM_SUMMON_STAR								(0x9C)
#macro MARIO_ANIM_RETURN_STAR_APPROACH_DOOR				(0x9D)
#macro MARIO_ANIM_BACKWARDS_WATER_KB						(0x9E)
#macro MARIO_ANIM_SWIM_WITH_OBJ_PART1						(0x9F)
#macro MARIO_ANIM_SWIM_WITH_OBJ_PART2						(0xA0)
#macro MARIO_ANIM_FLUTTERKICK_WITH_OBJ						(0xA1)
#macro MARIO_ANIM_WATER_ACTION_END_WITH_OBJ (0xA2)
#macro MARIO_ANIM_STOP_GRAB_OBJ_WATER						(0xA3)
#macro MARIO_ANIM_WATER_IDLE_WITH_OBJ						(0xA4)
#macro MARIO_ANIM_DROWNING_PART1							(0xA5)
#macro MARIO_ANIM_DROWNING_PART2							(0xA6)
#macro MARIO_ANIM_WATER_DYING								(0xA7)
#macro MARIO_ANIM_WATER_FORWARD_KB							(0xA8)
#macro MARIO_ANIM_FALL_FROM_WATER							(0xA9)
#macro MARIO_ANIM_SWIM_PART1								(0xAA)
#macro MARIO_ANIM_SWIM_PART2								(0xAB)
#macro MARIO_ANIM_FLUTTERKICK								(0xAC)
#macro MARIO_ANIM_WATER_ACTION_END (0xAD)
#macro MARIO_ANIM_WATER_PICK_UP_OBJ						(0xAE)
#macro MARIO_ANIM_WATER_GRAB_OBJ_PART2						(0xAF)
#macro MARIO_ANIM_WATER_GRAB_OBJ_PART1						(0xB0)
#macro MARIO_ANIM_WATER_THROW_OBJ							(0xB1)
#macro MARIO_ANIM_WATER_IDLE								(0xB2)
#macro MARIO_ANIM_WATER_STAR_DANCE							(0xB3)
#macro MARIO_ANIM_RETURN_FROM_WATER_STAR_DANCE				(0xB4)
#macro MARIO_ANIM_GRAB_BOWSER								(0xB5)
#macro MARIO_ANIM_SWINGING_BOWSER							(0xB6)
#macro MARIO_ANIM_RELEASE_BOWSER							(0xB7)
#macro MARIO_ANIM_HOLDING_BOWSER							(0xB8)
#macro MARIO_ANIM_HEAVY_THROW								(0xB9)
#macro MARIO_ANIM_WALK_PANTING								(0xBA)
#macro MARIO_ANIM_WALK_WITH_HEAVY_OBJ						(0xBB)
#macro MARIO_ANIM_TURNING_PART1							(0xBC)
#macro MARIO_ANIM_TURNING_PART2							(0xBD)
#macro MARIO_ANIM_SLIDEFLIP_LAND							(0xBE)
#macro MARIO_ANIM_SLIDEFLIP								(0xBF)
#macro MARIO_ANIM_TRIPLE_JUMP_LAND							(0xC0)
#macro MARIO_ANIM_TRIPLE_JUMP								(0xC1)
#macro MARIO_ANIM_FIRST_PERSON								(0xC2)
#macro MARIO_ANIM_IDLE_HEAD_LEFT							(0xC3)
#macro MARIO_ANIM_IDLE_HEAD_RIGHT							(0xC4)
#macro MARIO_ANIM_IDLE_HEAD_CENTER							(0xC5)
#macro MARIO_ANIM_HANDSTAND_LEFT							(0xC6)
#macro MARIO_ANIM_HANDSTAND_RIGHT							(0xC7)
#macro MARIO_ANIM_WAKE_FROM_SLEEP							(0xC8)
#macro MARIO_ANIM_WAKE_FROM_LYING							(0xC9)
#macro MARIO_ANIM_START_TIPTOE								(0xCA)
#macro MARIO_ANIM_SLIDEJUMP								(0xCB)
#macro MARIO_ANIM_START_WALLKICK							(0xCC)
#macro MARIO_ANIM_STAR_DANCE								(0xCD)
#macro MARIO_ANIM_RETURN_FROM_STAR_DANCE					(0xCE)
#macro MARIO_ANIM_FORWARD_SPINNING_FLIP					(0xCF)
#macro MARIO_ANIM_TRIPLE_JUMP_FLY							(0xD0)	
#macro MARIO_ANIM_SLOW_LEDGE_GRAB							(0x00)
#macro MARIO_ANIM_FALL_OVER_BACKWARDS						(0x01)
#macro MARIO_ANIM_BACKWARD_AIR_KB							(0x02)
#macro MARIO_ANIM_DYING_ON_BACK							(0x03)
#macro MARIO_ANIM_BACKFLIP									(0x04)
#macro MARIO_ANIM_CLIMB_UP_POLE							(0x05)
#macro MARIO_ANIM_GRAB_POLE_SHORT							(0x06)
#macro MARIO_ANIM_GRAB_POLE_SWING_PART1					(0x07)
#macro MARIO_ANIM_GRAB_POLE_SWING_PART2					(0x08)
#macro MARIO_ANIM_HANDSTAND_IDLE							(0x09)
#macro MARIO_ANIM_HANDSTAND_JUMP							(0x0A)
#macro MARIO_ANIM_START_HANDSTAND							(0x0B)
#macro MARIO_ANIM_RETURN_FROM_HANDSTAND					(0x0C)
#macro MARIO_ANIM_IDLE_ON_POLE								(0x0D)
#macro MARIO_ANIM_A_POSE									(0x0E)
#macro MARIO_ANIM_SKID_ON_GROUND							(0x0F)
#macro MARIO_ANIM_STOP_SKID								(0x10)
#macro MARIO_ANIM_CROUCH_FROM_FAST_LONGJUMP				(0x11)
#macro MARIO_ANIM_CROUCH_FROM_SLOW_LONGJUMP				(0x12)
#macro MARIO_ANIM_FAST_LONGJUMP							(0x13)
#macro MARIO_ANIM_SLOW_LONGJUMP							(0x14)
#macro MARIO_ANIM_AIRBORNE_ON_STOMACH						(0x15)
#macro MARIO_ANIM_WALK_WITH_LIGHT_OBJ						(0x16)
#macro MARIO_ANIM_RUN_WITH_LIGHT_OBJ						(0x17)
#macro MARIO_ANIM_SLOW_WALK_WITH_LIGHT_OBJ					(0x18)
#macro MARIO_ANIM_SHIVERING_WARMING_HAND					(0x19)
#macro MARIO_ANIM_SHIVERING_RETURN_TO_IDLE					(0x1A)
#macro MARIO_ANIM_SHIVERING								(0x1B)
#macro MARIO_ANIM_CLIMB_DOWN_LEDGE							(0x1C)
#macro MARIO_ANIM_CREDITS_WAVING							(0x1D)
#macro MARIO_ANIM_CREDITS_LOOK_UP							(0x1E)
#macro MARIO_ANIM_CREDITS_RETURN_FROM_LOOK_UP				(0x1F)
#macro MARIO_ANIM_CREDITS_RAISE_HAND						(0x20)
#macro MARIO_ANIM_CREDITS_LOWER_HAND						(0x21)
#macro MARIO_ANIM_CREDITS_TAKE_OFF_CAP						(0x22)
#macro MARIO_ANIM_CREDITS_START_WALK_LOOK_UP				(0x23)
#macro MARIO_ANIM_CREDITS_LOOK_BACK_THEN_RUN				(0x24)
#macro MARIO_ANIM_FINAL_BOWSER_RAISE_HAND_SPIN				(0x25)
#macro MARIO_ANIM_FINAL_BOWSER_WING_CAP_TAKE_OFF			(0x26)
#macro MARIO_ANIM_CREDITS_PEACE_SIGN						(0x27)
#macro MARIO_ANIM_STAND_UP_FROM_LAVA_BOOST					(0x28)
#macro MARIO_ANIM_FIRE_LAVA_BURN							(0x29)
#macro MARIO_ANIM_WING_CAP_FLY								(0x2A)
#macro MARIO_ANIM_HANG_ON_OWL								(0x2B)
#macro MARIO_ANIM_LAND_ON_STOMACH							(0x2C)
#macro MARIO_ANIM_AIR_FORWARD_KB							(0x2D)
#macro MARIO_ANIM_DYING_ON_STOMACH							(0x2E)
#macro MARIO_ANIM_SUFFOCATING								(0x2F)
#macro MARIO_ANIM_COUGHING									(0x30)
#macro MARIO_ANIM_THROW_CATCH_KEY							(0x31)
#macro MARIO_ANIM_DYING_FALL_OVER							(0x32)
#macro MARIO_ANIM_IDLE_ON_LEDGE							(0x33)
#macro MARIO_ANIM_FAST_LEDGE_GRAB							(0x34)
#macro MARIO_ANIM_HANG_ON_CEILING							(0x35)
#macro MARIO_ANIM_PUT_CAP_ON								(0x36)
#macro MARIO_ANIM_TAKE_CAP_OFF_THEN_ON						(0x37)
#macro MARIO_ANIM_QUICKLY_PUT_CAP_ON		(0x38)
#macro MARIO_ANIM_HEAD_STUCK_IN_GROUND						(0x39)
#macro MARIO_ANIM_GROUND_POUND_LANDING						(0x3A)
#macro MARIO_ANIM_TRIPLE_JUMP_GROUND_POUND					(0x3B)
#macro MARIO_ANIM_START_GROUND_POUND						(0x3C)
#macro MARIO_ANIM_GROUND_POUND								(0x3D)
#macro MARIO_ANIM_BOTTOM_STUCK_IN_GROUND					(0x3E)
#macro MARIO_ANIM_IDLE_WITH_LIGHT_OBJ						(0x3F)
#macro MARIO_ANIM_JUMP_LAND_WITH_LIGHT_OBJ					(0x40)
#macro MARIO_ANIM_JUMP_WITH_LIGHT_OBJ						(0x41)
#macro MARIO_ANIM_FALL_LAND_WITH_LIGHT_OBJ					(0x42)
#macro MARIO_ANIM_FALL_WITH_LIGHT_OBJ						(0x43)
#macro MARIO_ANIM_FALL_FROM_SLIDING_WITH_LIGHT_OBJ			(0x44)
#macro MARIO_ANIM_SLIDING_ON_BOTTOM_WITH_LIGHT_OBJ			(0x45)
#macro MARIO_ANIM_STAND_UP_FROM_SLIDING_WITH_LIGHT_OBJ		(0x46)
#macro MARIO_ANIM_RIDING_SHELL								(0x47)
#macro MARIO_ANIM_WALKING									(0x48)
#macro MARIO_ANIM_FORWARD_FLIP 				(0x49)
#macro MARIO_ANIM_JUMP_RIDING_SHELL						(0x4A)
#macro MARIO_ANIM_LAND_FROM_DOUBLE_JUMP					(0x4B)
#macro MARIO_ANIM_DOUBLE_JUMP_FALL							(0x4C)
#macro MARIO_ANIM_SINGLE_JUMP								(0x4D)
#macro MARIO_ANIM_LAND_FROM_SINGLE_JUMP					(0x4E)
#macro MARIO_ANIM_AIR_KICK									(0x4F)
#macro MARIO_ANIM_DOUBLE_JUMP_RISE							(0x50)
#macro MARIO_ANIM_START_FORWARD_SPINNING 		(0x51)
#macro MARIO_ANIM_THROW_LIGHT_OBJECT			(0x52)
#macro MARIO_ANIM_FALL_FROM_SLIDE_KICK			(0x53)
#macro MARIO_ANIM_BEND_KNESS_RIDING_SHELL		(0x54)
#macro MARIO_ANIM_LEGS_STUCK_IN_GROUND			(0x55)
#macro MARIO_ANIM_GENERAL_FALL								(0x56)
#macro MARIO_ANIM_GENERAL_LAND								(0x57)
#macro MARIO_ANIM_BEING_GRABBED							(0x58)
#macro MARIO_ANIM_GRAB_HEAVY_OBJECT						(0x59)
#macro MARIO_ANIM_SLOW_LAND_FROM_DIVE						(0x5A)
#macro MARIO_ANIM_FLY_FROM_CANNON							(0x5B)
#macro MARIO_ANIM_MOVE_ON_WIRE_NET_RIGHT					(0x5C)
#macro MARIO_ANIM_MOVE_ON_WIRE_NET_LEFT					(0x5D)
#macro MARIO_ANIM_MISSING_CAP								(0x5E)
#macro MARIO_ANIM_PULL_DOOR_WALK_IN						(0x5F)
#macro MARIO_ANIM_PUSH_DOOR_WALK_IN						(0x60)
#macro MARIO_ANIM_UNLOCK_DOOR								(0x61)
#macro MARIO_ANIM_START_REACH_POCKET (0x62)
#macro MARIO_ANIM_REACH_POCKET 			(0x63)
#macro MARIO_ANIM_STOP_REACH_POCKET (0x64)
#macro MARIO_ANIM_GROUND_THROW								(0x65)
#macro MARIO_ANIM_GROUND_KICK								(0x66)
#macro MARIO_ANIM_FIRST_PUNCH								(0x67)
#macro MARIO_ANIM_SECOND_PUNCH								(0x68)
#macro MARIO_ANIM_FIRST_PUNCH_FAST							(0x69)
#macro MARIO_ANIM_SECOND_PUNCH_FAST						(0x6A)
#macro MARIO_ANIM_PICK_UP_LIGHT_OBJ						(0x6B)
#macro MARIO_ANIM_PUSHING									(0x6C)
#macro MARIO_ANIM_START_RIDING_SHELL						(0x6D)
#macro MARIO_ANIM_PLACE_LIGHT_OBJ							(0x6E)
#macro MARIO_ANIM_FORWARD_SPINNING							(0x6F)
#macro MARIO_ANIM_BACKWARD_SPINNING						(0x70)
#macro MARIO_ANIM_BREAKDANCE								(0x71)
#macro MARIO_ANIM_RUNNING									(0x72)
#macro MARIO_ANIM_RUNNING_UNUSED(0x73)
#macro MARIO_ANIM_SOFT_BACK_KB								(0x74)
#macro MARIO_ANIM_SOFT_FRONT_KB							(0x75)
#macro MARIO_ANIM_DYING_IN_QUICKSAND						(0x76)
#macro MARIO_ANIM_IDLE_IN_QUICKSAND						(0x77)
#macro MARIO_ANIM_MOVE_IN_QUICKSAND						(0x78)
#macro MARIO_ANIM_ELECTROCUTION							(0x79)
#macro MARIO_ANIM_SHOCKED									(0x7A)
#macro MARIO_ANIM_BACKWARD_KB								(0x7B)
#macro MARIO_ANIM_FORWARD_KB								(0x7C)
#macro MARIO_ANIM_IDLE_HEAVY_OBJ							(0x7D)
#macro MARIO_ANIM_STAND_AGAINST_WALL						(0x7E)
#macro MARIO_ANIM_SIDESTEP_LEFT							(0x7F)
#macro MARIO_ANIM_SIDESTEP_RIGHT							(0x80)
#macro MARIO_ANIM_START_SLEEP_IDLE							(0x81)
#macro MARIO_ANIM_START_SLEEP_SCRATCH						(0x82)
#macro MARIO_ANIM_START_SLEEP_YAWN							(0x83)
#macro MARIO_ANIM_START_SLEEP_SITTING						(0x84)
#macro MARIO_ANIM_SLEEP_IDLE								(0x85)
#macro MARIO_ANIM_SLEEP_START_LYING						(0x86)
#macro MARIO_ANIM_SLEEP_LYING								(0x87)
#macro MARIO_ANIM_DIVE										(0x88)
#macro MARIO_ANIM_SLIDE_DIVE								(0x89)
#macro MARIO_ANIM_GROUND_BONK								(0x8A)
#macro MARIO_ANIM_STOP_SLIDE_LIGHT_OBJ						(0x8B)
#macro MARIO_ANIM_SLIDE_KICK								(0x8C)
#macro MARIO_ANIM_CROUCH_FROM_SLIDE_KICK					(0x8D)
#macro MARIO_ANIM_SLIDE_MOTIONLESS 		(0x8E)
#macro MARIO_ANIM_STOP_SLIDE								(0x8F)
#macro MARIO_ANIM_FALL_FROM_SLIDE							(0x90)
#macro MARIO_ANIM_SLIDE									(0x91)
#macro MARIO_ANIM_TIPTOE									(0x92)
#macro MARIO_ANIM_TWIRL_LAND								(0x93)
#macro MARIO_ANIM_TWIRL									(0x94)
#macro MARIO_ANIM_START_TWIRL								(0x95)
#macro MARIO_ANIM_STOP_CROUCHING							(0x96)
#macro MARIO_ANIM_START_CROUCHING							(0x97)
#macro MARIO_ANIM_CROUCHING								(0x98)
#macro MARIO_ANIM_CRAWLING									(0x99)
#macro MARIO_ANIM_STOP_CRAWLING							(0x9A)
#macro MARIO_ANIM_START_CRAWLING							(0x9B)
#macro MARIO_ANIM_SUMMON_STAR								(0x9C)
#macro MARIO_ANIM_RETURN_STAR_APPROACH_DOOR				(0x9D)
#macro MARIO_ANIM_BACKWARDS_WATER_KB						(0x9E)
#macro MARIO_ANIM_SWIM_WITH_OBJ_PART1						(0x9F)
#macro MARIO_ANIM_SWIM_WITH_OBJ_PART2						(0xA0)
#macro MARIO_ANIM_FLUTTERKICK_WITH_OBJ						(0xA1)
#macro MARIO_ANIM_WATER_ACTION_END_WITH_OBJ (0xA2)
#macro MARIO_ANIM_STOP_GRAB_OBJ_WATER						(0xA3)
#macro MARIO_ANIM_WATER_IDLE_WITH_OBJ						(0xA4)
#macro MARIO_ANIM_DROWNING_PART1							(0xA5)
#macro MARIO_ANIM_DROWNING_PART2							(0xA6)
#macro MARIO_ANIM_WATER_DYING								(0xA7)
#macro MARIO_ANIM_WATER_FORWARD_KB							(0xA8)
#macro MARIO_ANIM_FALL_FROM_WATER							(0xA9)
#macro MARIO_ANIM_SWIM_PART1								(0xAA)
#macro MARIO_ANIM_SWIM_PART2								(0xAB)
#macro MARIO_ANIM_FLUTTERKICK								(0xAC)
#macro MARIO_ANIM_WATER_ACTION_END (0xAD)
#macro MARIO_ANIM_WATER_PICK_UP_OBJ						(0xAE)
#macro MARIO_ANIM_WATER_GRAB_OBJ_PART2						(0xAF)
#macro MARIO_ANIM_WATER_GRAB_OBJ_PART1						(0xB0)
#macro MARIO_ANIM_WATER_THROW_OBJ							(0xB1)
#macro MARIO_ANIM_WATER_IDLE								(0xB2)
#macro MARIO_ANIM_WATER_STAR_DANCE							(0xB3)
#macro MARIO_ANIM_RETURN_FROM_WATER_STAR_DANCE				(0xB4)
#macro MARIO_ANIM_GRAB_BOWSER								(0xB5)
#macro MARIO_ANIM_SWINGING_BOWSER							(0xB6)
#macro MARIO_ANIM_RELEASE_BOWSER							(0xB7)
#macro MARIO_ANIM_HOLDING_BOWSER							(0xB8)
#macro MARIO_ANIM_HEAVY_THROW								(0xB9)
#macro MARIO_ANIM_WALK_PANTING								(0xBA)
#macro MARIO_ANIM_WALK_WITH_HEAVY_OBJ						(0xBB)
#macro MARIO_ANIM_TURNING_PART1							(0xBC)
#macro MARIO_ANIM_TURNING_PART2							(0xBD)
#macro MARIO_ANIM_SLIDEFLIP_LAND							(0xBE)
#macro MARIO_ANIM_SLIDEFLIP								(0xBF)
#macro MARIO_ANIM_TRIPLE_JUMP_LAND							(0xC0)
#macro MARIO_ANIM_TRIPLE_JUMP								(0xC1)
#macro MARIO_ANIM_FIRST_PERSON								(0xC2)
#macro MARIO_ANIM_IDLE_HEAD_LEFT							(0xC3)
#macro MARIO_ANIM_IDLE_HEAD_RIGHT							(0xC4)
#macro MARIO_ANIM_IDLE_HEAD_CENTER							(0xC5)
#macro MARIO_ANIM_HANDSTAND_LEFT							(0xC6)
#macro MARIO_ANIM_HANDSTAND_RIGHT							(0xC7)
#macro MARIO_ANIM_WAKE_FROM_SLEEP							(0xC8)
#macro MARIO_ANIM_WAKE_FROM_LYING							(0xC9)
#macro MARIO_ANIM_START_TIPTOE								(0xCA)
#macro MARIO_ANIM_SLIDEJUMP								(0xCB)
#macro MARIO_ANIM_START_WALLKICK							(0xCC)
#macro MARIO_ANIM_STAR_DANCE								(0xCD)
#macro MARIO_ANIM_RETURN_FROM_STAR_DANCE					(0xCE)
#macro MARIO_ANIM_FORWARD_SPINNING_FLIP					(0xCF)
#macro MARIO_ANIM_TRIPLE_JUMP_FLY							(0xD0)		

boot("mario_animation_macros_init");
}