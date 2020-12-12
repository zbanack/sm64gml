function object_constants_macros_init() {
	// This file contains macros that provide descriptive names for
	// field-specific and object-specific constants, e.g. actions.

	/* activeFlags */
	#macro ACTIVE_FLAG_DEACTIVATED            0         // 0x0000
	#macro ACTIVE_FLAG_ACTIVE                 (1 <<  0) // 0x0001
	#macro ACTIVE_FLAG_FAR_AWAY               (1 <<  1) // 0x0002
	#macro ACTIVE_FLAG_UNK2                   (1 <<  2) // 0x0004
	#macro ACTIVE_FLAG_IN_DIFFERENT_ROOM      (1 <<  3) // 0x0008
	#macro ACTIVE_FLAG_UNIMPORTANT            (1 <<  4) // 0x0010
	#macro ACTIVE_FLAG_INITIATED_TIME_STOP    (1 <<  5) // 0x0020
	#macro ACTIVE_FLAG_MOVE_THROUGH_GRATE     (1 <<  6) // 0x0040
	#macro ACTIVE_FLAG_DITHERED_ALPHA         (1 <<  7) // 0x0080
	#macro ACTIVE_FLAG_UNK8                   (1 <<  8) // 0x0100
	#macro ACTIVE_FLAG_UNK9                   (1 <<  9) // 0x0200
	#macro ACTIVE_FLAG_UNK10                  (1 << 10) // 0x0400


	/* respawnInfoType */
	#macro RESPAWN_INFO_TYPE_NULL 0
	#macro RESPAWN_INFO_TYPE_32   1
	#macro RESPAWN_INFO_TYPE_16   2

	/* respawnInfo */
	#macro RESPAWN_INFO_DONT_RESPAWN 0xFF

	/* oFlags */
	#macro OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE         (1 <<  0) // 0x00000001
	#macro OBJ_FLAG_MOVE_XZ_USING_FVEL               (1 <<  1) // 0x00000002
	#macro OBJ_FLAG_MOVE_Y_WITH_TERMINAL_VEL         (1 <<  2) // 0x00000004
	#macro OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW         (1 <<  3) // 0x00000008
	#macro OBJ_FLAG_SET_FACE_ANGLE_TO_MOVE_ANGLE     (1 <<  4) // 0x00000010
	#macro OBJ_FLAG_0020                             (1 <<  5) // 0x00000020
	#macro OBJ_FLAG_COMPUTE_DIST_TO_MARIO            (1 <<  6) // 0x00000040
	#macro OBJ_FLAG_ACTIVE_FROM_AFAR                 (1 <<  7) // 0x00000080
	#macro OBJ_FLAG_0100                             (1 <<  8) // 0x00000100
	#macro OBJ_FLAG_TRANSFORM_RELATIVE_TO_PARENT     (1 <<  9) // 0x00000200
	#macro OBJ_FLAG_HOLDABLE                         (1 << 10) // 0x00000400
	#macro OBJ_FLAG_SET_THROW_MATRIX_FROM_TRANSFORM  (1 << 11) // 0x00000800
	#macro OBJ_FLAG_1000                             (1 << 12) // 0x00001000
	#macro OBJ_FLAG_COMPUTE_ANGLE_TO_MARIO           (1 << 13) // 0x00002000
	#macro OBJ_FLAG_PERSISTENT_RESPAWN               (1 << 14) // 0x00004000
	#macro OBJ_FLAG_8000                             (1 << 15) // 0x00008000
	#macro OBJ_FLAG_30                               (1 << 30) // 0x40000000

	/* oHeldState */
	#macro HELD_FREE 0
	#macro HELD_HELD 1
	#macro HELD_THROWN 2
	#macro HELD_DROPPED 3

	/* oDialogState */
	#macro DIALOG_UNK1_ENABLE_TIME_STOP 0
	#macro DIALOG_UNK1_INTERRUPT_MARIO_ACTION 1
	#macro DIALOG_UNK1_BEGIN_DIALOG 2
	#macro DIALOG_UNK1_AWAIT_DIALOG 3
	#macro DIALOG_UNK1_DISABLE_TIME_STOP 4

	#macro DIALOG_UNK1_FLAG_DEFAULT (1 << 1) // 0x02
	#macro DIALOG_UNK1_FLAG_RESPONSE (1 << 2) // 0x04
	#macro DIALOG_UNK1_FLAG_4 (1 << 4) // 0x10

	#macro DIALOG_UNK2_ENABLE_TIME_STOP 0
	#macro DIALOG_UNK2_TURN_AND_INTERRUPT_MARIO_ACTION 1
	#macro DIALOG_UNK2_AWAIT_DIALOG 2
	#macro DIALOG_UNK2_END_DIALOG 3

	#macro DIALOG_UNK2_FLAG_0 (1 << 0) // 0x01
	#macro DIALOG_UNK2_LEAVE_TIME_STOP_ENABLED (1 << 4) // 0x10

	/* oMoveFlags */
	#macro OBJ_MOVE_LANDED                (1 <<  0) // 0x0001
	#macro OBJ_MOVE_ON_GROUND             (1 <<  1) // 0x0002  // mutually exclusive to OBJ_MOVE_LANDED
	#macro OBJ_MOVE_LEFT_GROUND           (1 <<  2) // 0x0004
	#macro OBJ_MOVE_ENTERED_WATER         (1 <<  3) // 0x0008
	#macro OBJ_MOVE_AT_WATER_SURFACE      (1 <<  4) // 0x0010
	#macro OBJ_MOVE_UNDERWATER_OFF_GROUND (1 <<  5) // 0x0020
	#macro OBJ_MOVE_UNDERWATER_ON_GROUND  (1 <<  6) // 0x0040
	#macro OBJ_MOVE_IN_AIR                (1 <<  7) // 0x0080
	#macro OBJ_MOVE_OUT_SCOPE             (1 <<  8) // 0x0100
	#macro OBJ_MOVE_HIT_WALL              (1 <<  9) // 0x0200
	#macro OBJ_MOVE_HIT_EDGE              (1 << 10) // 0x0400
	#macro OBJ_MOVE_ABOVE_LAVA            (1 << 11) // 0x0800
	#macro OBJ_MOVE_LEAVING_WATER         (1 << 12) // 0x1000
	#macro OBJ_MOVE_BOUNCE                (1 << 13) // 0x2000
	#macro OBJ_MOVE_ABOVE_DEATH_BARRIER   (1 << 14) // 0x4000

	#macro OBJ_MOVE_MASK_ON_GROUND (OBJ_MOVE_LANDED | OBJ_MOVE_ON_GROUND)
	#macro OBJ_MOVE_MASK_IN_WATER (\
	OBJ_MOVE_ENTERED_WATER |\
	OBJ_MOVE_AT_WATER_SURFACE |\
	OBJ_MOVE_UNDERWATER_OFF_GROUND |\
	OBJ_MOVE_UNDERWATER_ON_GROUND)

	/* oActiveParticleFlags */
	#macro ACTIVE_PARTICLE_DUST                 (1 <<  0) // 0x00000001
	#macro ACTIVE_PARTICLE_UNUSED_1             (1 <<  1) // 0x00000002
	#macro ACTIVE_PARTICLE_UNUSED_2             (1 <<  2) // 0x00000004
	#macro ACTIVE_PARTICLE_SPARKLES             (1 <<  3) // 0x00000008
	#macro ACTIVE_PARTICLE_H_STAR               (1 <<  4) // 0x00000010
	#macro ACTIVE_PARTICLE_BUBBLE               (1 <<  5) // 0x00000020
	#macro ACTIVE_PARTICLE_WATER_SPLASH         (1 <<  6) // 0x00000040
	#macro ACTIVE_PARTICLE_IDLE_WATER_WAVE      (1 <<  7) // 0x00000080
	#macro ACTIVE_PARTICLE_SHALLOW_WATER_WAVE   (1 <<  8) // 0x00000100
	#macro ACTIVE_PARTICLE_PLUNGE_BUBBLE        (1 <<  9) // 0x00000200
	#macro ACTIVE_PARTICLE_WAVE_TRAIL           (1 << 10) // 0x00000400
	#macro ACTIVE_PARTICLE_FIRE                 (1 << 11) // 0x00000800
	#macro ACTIVE_PARTICLE_SHALLOW_WATER_SPLASH (1 << 12) // 0x00001000
	#macro ACTIVE_PARTICLE_LEAF                 (1 << 13) // 0x00002000
	#macro ACTIVE_PARTICLE_DIRT                 (1 << 14) // 0x00004000
	#macro ACTIVE_PARTICLE_MIST_CIRCLE          (1 << 15) // 0x00008000
	#macro ACTIVE_PARTICLE_SNOW                 (1 << 16) // 0x00010000
	#macro ACTIVE_PARTICLE_BREATH               (1 << 17) // 0x00020000
	#macro ACTIVE_PARTICLE_V_STAR               (1 << 18) // 0x00040000
	#macro ACTIVE_PARTICLE_TRIANGLE             (1 << 19) // 0x00080000

	/* oAction */
	#macro OBJ_ACT_LAVA_DEATH 100
	#macro OBJ_ACT_DEATH_PLANE_DEATH 101

	#macro OBJ_ACT_HORIZONTAL_KNOCKBACK 100
	#macro OBJ_ACT_VERTICAL_KNOCKBACK 101
	#macro OBJ_ACT_SQUISHED 102

	/* gTTCSpeedSetting */
	#macro TTC_SPEED_SLOW    0
	#macro TTC_SPEED_FAST    1
	#macro TTC_SPEED_RANDOM  2
	#macro TTC_SPEED_STOPPED 3

	/* Bob-omb */
	/* oBehParams2ndByte */
	#macro BOBOMB_BP_STYPE_GENERIC 0
	#macro BOBOMB_BP_STYPE_STATIONARY 1
	/* oAction */
	#macro BOBOMB_ACT_PATROL 0
	#macro BOBOMB_ACT_LAUNCHED 1
	#macro BOBOMB_ACT_CHASE_MARIO 2
	#macro BOBOMB_ACT_EXPLODE 3
	#macro BOBOMB_ACT_LAVA_DEATH 100
	#macro BOBOMB_ACT_DEATH_PLANE_DEATH 101

	/* Hidden Blue Coin */
	/* oAction */
	#macro HIDDEN_BLUE_COIN_ACT_INACTIVE 0
	#macro HIDDEN_BLUE_COIN_ACT_WAITING 1
	#macro HIDDEN_BLUE_COIN_ACT_ACTIVE 2

	/* Blue Coin Switch */
	/* oAction */
	#macro BLUE_COIN_SWITCH_ACT_IDLE 0
	#macro BLUE_COIN_SWITCH_ACT_RECEDING 1
	#macro BLUE_COIN_SWITCH_ACT_TICKING 2

	/* Moving Blue Coin */
	/* oAction */
	#macro MOV_BCOIN_ACT_STILL 0
	#macro MOV_BCOIN_ACT_MOVING 1

	/* Moving Yellow Coin */
	/* oAction */
	#macro MOV_YCOIN_ACT_IDLE 0
	#macro MOV_YCOIN_ACT_BLINKING 1
	#macro MOV_YCOIN_ACT_LAVA_DEATH 100
	#macro MOV_YCOIN_ACT_DEATH_PLANE_DEATH 101

	/* Bob-omb Buddy */
	/* oBehParams2ndByte */
	#macro BOBOMB_BUDDY_BP_STYPE_GENERIC 0
	#macro BOBOMB_BUDDY_BP_STYPE_BOB_GRASS_KBB 1
	#macro BOBOMB_BUDDY_BP_STYPE_BOB_CANNON_KBB 2
	#macro BOBOMB_BUDDY_BP_STYPE_BOB_GRASS 3
	/* oAction */
	#macro BOBOMB_BUDDY_ACT_IDLE 0
	#macro BOBOMB_BUDDY_ACT_TURN_TO_TALK 2
	#macro BOBOMB_BUDDY_ACT_TALK 3
	/* oBobombBuddyRole */
	#macro BOBOMB_BUDDY_ROLE_ADVICE 0
	#macro BOBOMB_BUDDY_ROLE_CANNON 1
	/* oBobombBuddyCannonStatus */
	#macro BOBOMB_BUDDY_CANNON_UNOPENED 0
	#macro BOBOMB_BUDDY_CANNON_OPENING 1
	#macro BOBOMB_BUDDY_CANNON_OPENED 2
	#macro BOBOMB_BUDDY_CANNON_STOP_TALKING 3
	/* oBobombBuddyHasTalkedToMario */
	#macro BOBOMB_BUDDY_HAS_NOT_TALKED 0
	#macro BOBOMB_BUDDY_HAS_TALKED 2

	/* Fish */
	/* oAction */
	#macro FISH_ACT_INIT 0
	#macro FISH_ACT_ACTIVE 1
	#macro FISH_ACT_RESPAWN 2

	/* Blue_Fish */
	/* oAction */
	#macro BLUE_FISH_ACT_DIVE 0
	#macro BLUE_FISH_ACT_TURN 1
	#macro BLUE_FISH_ACT_ASCEND 2
	#macro BLUE_FISH_ACT_TURN_BACK 3

	/* oAction: bhv_blue_fish_spawn_loop */
	#macro BLUE_FISH_ACT_SPAWN 0
	#macro BLUE_FISH_ACT_ROOM 1
	#macro BLUE_FISH_ACT_DUPLICATE 2

	/* Cannon Trap Door */
	/* oAction */
	#macro CANNON_TRAP_DOOR_ACT_CLOSED 0
	#macro CANNON_TRAP_DOOR_ACT_CAM_ZOOM 1
	#macro CANNON_TRAP_DOOR_ACT_OPENING 2
	#macro CANNON_TRAP_DOOR_ACT_OPEN 3

	/* Homing Amp */
	/* oAction */
	#macro HOMING_AMP_ACT_INACTIVE 0
	#macro HOMING_AMP_ACT_APPEAR 1
	#macro HOMING_AMP_ACT_CHASE 2
	#macro HOMING_AMP_ACT_GIVE_UP 3
	#macro HOMING_AMP_ACT_ATTACK_COOLDOWN 4

	/* Amp */
	/* oBehParams2ndByte */
	#macro AMP_BP_ROT_RADIUS_200 0
	#macro AMP_BP_ROT_RADIUS_300 1
	#macro AMP_BP_ROT_RADIUS_400 2
	#macro AMP_BP_ROT_RADIUS_0 3

	/* oAction */
	#macro AMP_ACT_IDLE 2
	#macro AMP_ACT_ATTACK_COOLDOWN 4

	/* Butterfly */
	/* oAction */
	#macro BUTTERFLY_ACT_RESTING 0
	#macro BUTTERFLY_ACT_FOLLOW_MARIO 1
	#macro BUTTERFLY_ACT_RETURN_HOME 2

	/* Hoot */
	/* oHootAvailability */
	#macro HOOT_AVAIL_ASLEEP_IN_TREE 0
	#macro HOOT_AVAIL_WANTS_TO_TALK 1
	#macro HOOT_AVAIL_READY_TO_FLY 2
	/* oAction */
	#macro HOOT_ACT_ASCENT 0
	#macro HOOT_ACT_CARRY 1
	#macro HOOT_ACT_TIRED 2

	/* Bully (all variants) */
	/* oBehParams2ndByte */
	#macro BULLY_BP_SIZE_SMALL 0
	#macro BULLY_BP_SIZE_BIG 1
	/* oAction */
	#macro BULLY_ACT_PATROL 0
	#macro BULLY_ACT_CHASE_MARIO 1
	#macro BULLY_ACT_KNOCKBACK 2
	#macro BULLY_ACT_BACK_UP 3
	#macro BULLY_ACT_INACTIVE 4
	#macro BULLY_ACT_ACTIVATE_AND_FALL 5
	#macro BULLY_ACT_LAVA_DEATH 100
	#macro BULLY_ACT_DEATH_PLANE_DEATH 101
	/* oBullySubtype */
	#macro BULLY_STYPE_GENERIC 0
	#macro BULLY_STYPE_MINION 1
	#macro BULLY_STYPE_CHILL 16

	/* Water Ring (all variants) */
	/* oAction */
	#macro WATER_RING_ACT_NOT_COLLECTED 0
	#macro WATER_RING_ACT_COLLECTED 1

	/* Jet Stream Water Ring Spawner */
	/* oAction */
	#macro JS_RING_SPAWNER_ACT_ACTIVE 0
	#macro JS_RING_SPAWNER_ACT_INACTIVE 1

	/* Celebration Star */
	/* oAction */
	#macro CELEB_STAR_ACT_SPIN_AROUND_MARIO 0
	#macro CELEB_STAR_ACT_FACE_CAMERA 1

	/* LLL Drawbridge */
	/* oAction */
	#macro LLL_DRAWBRIDGE_ACT_LOWER 0
	#macro LLL_DRAWBRIDGE_ACT_RAISE 1

	/* Bomp (both variants) */
	/* oAction */
	#macro BOMP_ACT_WAIT 0
	#macro BOMP_ACT_POKE_OUT 1
	#macro BOMP_ACT_EXTEND 2
	#macro BOMP_ACT_RETRACT 3

	/* WF Sliding Brick Platform */
	/* oBehParams2ndByte */
	#macro WF_SLID_BRICK_PTFM_BP_MOV_VEL_10 1
	#macro WF_SLID_BRICK_PTFM_BP_MOV_VEL_15 2
	#macro WF_SLID_BRICK_PTFM_BP_MOV_VEL_20 3
	/* oAction */
	#macro WF_SLID_BRICK_PTFM_ACT_WAIT 0
	#macro WF_SLID_BRICK_PTFM_ACT_EXTEND 1
	#macro WF_SLID_BRICK_PTFM_ACT_RETRACT 2

	/* Fake Moneybag Coin */
	/* oAction */
	#macro FAKE_MONEYBAG_COIN_ACT_IDLE 0
	#macro FAKE_MONEYBAG_COIN_ACT_TRANSFORM 1

	/* Moneybag */
	/* oAction */
	#macro MONEYBAG_ACT_APPEAR 0
	#macro MONEYBAG_ACT_UNUSED_APPEAR 1
	#macro MONEYBAG_ACT_MOVE_AROUND 2
	#macro MONEYBAG_ACT_RETURN_HOME 3
	#macro MONEYBAG_ACT_DISAPPEAR 4
	#macro MONEYBAG_ACT_DEATH 5
	/* oMoneybagJumpState */
	#macro MONEYBAG_JUMP_LANDING 0
	#macro MONEYBAG_JUMP_PREPARE 1
	#macro MONEYBAG_JUMP_JUMP 2
	#macro MONEYBAG_JUMP_JUMP_AND_BOUNCE 3
	#macro MONEYBAG_JUMP_WALK_AROUND 4
	#macro MONEYBAG_JUMP_WALK_HOME 5

	/* Bowling Ball */
	/* oAction */
	#macro BBALL_ACT_INITIALIZE 0
	#macro BBALL_ACT_ROLL 1

	/* Bowling Ball + Bowling Ball Spawner (all variants) */
	/* oBehParams2ndByte */
	#macro BBALL_BP_STYPE_BOB_UPPER 0
	#macro BBALL_BP_STYPE_TTM 1
	#macro BBALL_BP_STYPE_BOB_LOWER 2
	#macro BBALL_BP_STYPE_THI_LARGE 3
	#macro BBALL_BP_STYPE_THI_SMALL 4

	/* Bowling Ball (Free) */
	/* oAction */
	#macro FREE_BBALL_ACT_IDLE 0
	#macro FREE_BBALL_ACT_ROLL 1
	#macro FREE_BBALL_ACT_RESET 2

	/* Beta Chest Lid */
	/* oAction */
	#macro BETA_CHEST_ACT_IDLE_CLOSED 0
	#macro BETA_CHEST_ACT_OPENING 1
	#macro BETA_CHEST_ACT_IDLE_OPEN 2

	/* BBH Tilting Trap Platform */
	/* oAction */
	// Unused in original Japanese version
	#macro BBH_TILTING_TRAP_PLATFORM_ACT_MARIO_ON 0
	#macro BBH_TILTING_TRAP_PLATFORM_ACT_MARIO_OFF 1

	/* Boo */
	/* oBooDeathStatus */
	#macro BOO_DEATH_STATUS_ALIVE 0
	#macro BOO_DEATH_STATUS_DYING 1
	#macro BOO_DEATH_STATUS_DEAD 2

	/* attackStatus */
	#macro BOO_NOT_ATTACKED 0
	#macro BOO_ATTACKED 1
	#macro BOO_BOUNCED_ON -1

	/* Beta Boo Key */
	/* oAction */
	#macro BETA_BOO_KEY_ACT_IN_BOO 0
	#macro BETA_BOO_KEY_ACT_DROPPING 1
	#macro BETA_BOO_KEY_ACT_DROPPED 2

	/* Boo Cage */
	/* oAction */
	#macro BOO_CAGE_ACT_IN_BOO 0
	#macro BOO_CAGE_ACT_FALLING 1
	#macro BOO_CAGE_ACT_ON_GROUND 2
	#macro BOO_CAGE_ACT_MARIO_JUMPING_IN 3
	#macro BOO_CAGE_ACT_USELESS 4

	/* BBH Haunted Bookshelf */
	/* oAction */
	#macro HAUNTED_BOOKSHELF_ACT_IDLE 0
	#macro HAUNTED_BOOKSHELF_ACT_RECEDE 1

	/* BBH Merry-Go-Round */
	/* gMarioCurrentRoom */
	#macro BBH_NEAR_MERRY_GO_ROUND_ROOM 10
	#macro BBH_DYNAMIC_SURFACE_ROOM 0
	#macro BBH_OUTSIDE_ROOM 13

	/* Coffin Spawner */
	/* oAction */
	#macro COFFIN_SPAWNER_ACT_COFFINS_UNLOADED 0

	/* Coffin */
	/* oAction */
	#macro COFFIN_ACT_IDLE     0
	#macro COFFIN_ACT_STAND_UP 1

	/* oBehParams2ndByte */
	#macro COFFIN_BP_STATIC 0

	/* WDW Arrow Lift */
	/* oAction */
	#macro ARROW_LIFT_ACT_IDLE 0
	#macro ARROW_LIFT_ACT_MOVING_AWAY 1
	#macro ARROW_LIFT_ACT_MOVING_BACK 2

	/* status */
	#macro ARROW_LIFT_NOT_DONE_MOVING 0
	#macro ARROW_LIFT_DONE_MOVING 1

	/* Yoshi */
	/* oAction */
	#macro YOSHI_ACT_IDLE 0
	#macro YOSHI_ACT_WALK 1
	#macro YOSHI_ACT_TALK 2
	#macro YOSHI_ACT_WALK_JUMP_OFF_ROOF 3
	#macro YOSHI_ACT_FINISH_JUMPING_AND_DESPAWN 4
	#macro YOSHI_ACT_GIVE_PRESENT 5
	#macro YOSHI_ACT_CREDITS 10

	/* Koopa */
	/* oAction */
	#macro KOOPA_UNSHELLED_ACT_RUN 0
	#macro KOOPA_UNSHELLED_ACT_DIVE 1
	#macro KOOPA_UNSHELLED_ACT_LYING 2
	#macro KOOPA_UNSHELLED_ACT_UNUSED3 3

	#macro KOOPA_SHELLED_ACT_STOPPED 0
	#macro KOOPA_SHELLED_ACT_WALK 1
	#macro KOOPA_SHELLED_ACT_RUN_FROM_MARIO 2
	#macro KOOPA_SHELLED_ACT_LYING 3
	#macro KOOPA_SHELLED_ACT_DIE 4

	#macro KOOPA_THE_QUICK_ACT_WAIT_BEFORE_RACE 0
	#macro KOOPA_THE_QUICK_ACT_UNUSED1 1
	#macro KOOPA_THE_QUICK_ACT_SHOW_INIT_TEXT 2
	#macro KOOPA_THE_QUICK_ACT_RACE 3
	#macro KOOPA_THE_QUICK_ACT_DECELERATE 4
	#macro KOOPA_THE_QUICK_ACT_STOP 5
	#macro KOOPA_THE_QUICK_ACT_AFTER_RACE 6

	/* oSubAction */
	#macro KOOPA_SHELLED_SUB_ACT_START_WALK 0
	#macro KOOPA_SHELLED_SUB_ACT_WALK 1
	#macro KOOPA_SHELLED_SUB_ACT_STOP_WALK 2

	#macro KOOPA_THE_QUICK_SUB_ACT_START_RUN 0
	#macro KOOPA_THE_QUICK_SUB_ACT_RUN 1
	#macro KOOPA_THE_QUICK_SUB_ACT_JUMP 2

	/* oKoopaTheQuickRaceIndex */
	#macro KOOPA_THE_QUICK_BOB_INDEX 0
	#macro KOOPA_THE_QUICK_THI_INDEX 1

	/* oBehParams2ndByte */
	#macro KOOPA_BP_UNSHELLED 0
	#macro KOOPA_BP_NORMAL 1
	#macro KOOPA_BP_KOOPA_THE_QUICK_BASE 2
	#macro KOOPA_BP_KOOPA_THE_QUICK_BOB (KOOPA_BP_KOOPA_THE_QUICK_BASE + KOOPA_THE_QUICK_BOB_INDEX)
	#macro KOOPA_BP_KOOPA_THE_QUICK_THI (KOOPA_BP_KOOPA_THE_QUICK_BASE + KOOPA_THE_QUICK_THI_INDEX)
	#macro KOOPA_BP_TINY 4

	/* Pokey */
	/* oAction */
	#macro POKEY_ACT_UNINITIALIZED 0
	#macro POKEY_ACT_WANDER 1
	#macro POKEY_ACT_UNLOAD_PARTS 2

	/* Swoop */
	/* oAction */
	#macro SWOOP_ACT_IDLE 0
	#macro SWOOP_ACT_MOVE 1

	/* Fly guy */
	/* oAction */
	#macro FLY_GUY_ACT_IDLE 0
	#macro FLY_GUY_ACT_APPROACH_MARIO 1
	#macro FLY_GUY_ACT_LUNGE 2
	#macro FLY_GUY_ACT_SHOOT_FIRE 3

	/* Goomba triplet spawner */
	/* oBehParams2ndByte */
	#macro GOOMBA_TRIPLET_SPAWNER_BP_SIZE_MASK 0x00000003
	#macro GOOMBA_TRIPLET_SPAWNER_BP_EXTRA_GOOMBAS_MASK 0x000000FC
	/* oAction */
	#macro GOOMBA_TRIPLET_SPAWNER_ACT_UNLOADED 0
	#macro GOOMBA_TRIPLET_SPAWNER_ACT_LOADED 1

	/* Goomba */
	/* oBehParams2ndByte */
	#macro GOOMBA_BP_SIZE_MASK 0x00000003
	#macro GOOMBA_SIZE_REGULAR 0
	#macro GOOMBA_SIZE_HUGE 1
	#macro GOOMBA_SIZE_TINY 2
	#macro GOOMBA_BP_TRIPLET_FLAG_MASK 0x000000FC
	/* oAction */
	#macro GOOMBA_ACT_WALK 0
	#macro GOOMBA_ACT_ATTACKED_MARIO 1
	#macro GOOMBA_ACT_JUMP 2

	/* Chain chomp */
	/* oAction */
	#macro CHAIN_CHOMP_ACT_UNINITIALIZED 0
	#macro CHAIN_CHOMP_ACT_MOVE 1
	#macro CHAIN_CHOMP_ACT_UNLOAD_CHAIN 2

	/* oSubAction */
	#macro CHAIN_CHOMP_SUB_ACT_TURN 0
	#macro CHAIN_CHOMP_SUB_ACT_LUNGE 1

	/* oChainChompReleaseStatus */
	#macro CHAIN_CHOMP_NOT_RELEASED 0
	#macro CHAIN_CHOMP_RELEASED_TRIGGER_CUTSCENE 1
	#macro CHAIN_CHOMP_RELEASED_LUNGE_AROUND 2
	#macro CHAIN_CHOMP_RELEASED_BREAK_GATE 3
	#macro CHAIN_CHOMP_RELEASED_JUMP_AWAY 4
	#macro CHAIN_CHOMP_RELEASED_END_CUTSCENE 5

	/* Chain chomp chain part */
	/* oBehParams2ndByte */
	#macro CHAIN_CHOMP_CHAIN_PART_BP_PIVOT 0

	/* Wooden post */
	/* oBehParams */
	#macro WOODEN_POST_BP_NO_COINS_MASK 0x0000FF00

	/* Wiggler */
	/* oAction */
	#macro WIGGLER_ACT_UNINITIALIZED 0
	#macro WIGGLER_ACT_WALK 1
	#macro WIGGLER_ACT_KNOCKBACK 2
	#macro WIGGLER_ACT_JUMPED_ON 3
	#macro WIGGLER_ACT_SHRINK 4
	#macro WIGGLER_ACT_FALL_THROUGH_FLOOR 5

	/* oWigglerTextStatus */
	#macro WIGGLER_TEXT_STATUS_AWAIT_DIALOG 0
	#macro WIGGLER_TEXT_STATUS_SHOWING_DIALOG 1
	#macro WIGGLER_TEXT_STATUS_COMPLETED_DIALOG 2

	/* Spiny */
	/* oAction */
	#macro SPINY_ACT_WALK 0
	#macro SPINY_ACT_HELD_BY_LAKITU 1
	#macro SPINY_ACT_THROWN_BY_LAKITU 2
	#macro SPINY_ACT_ATTACKED_MARIO 3

	/* Evil lakitu */
	/* oAction */
	#macro ENEMY_LAKITU_ACT_UNINITIALIZED 0
	#macro ENEMY_LAKITU_ACT_MAIN 1

	/* oSubAction */
	#macro ENEMY_LAKITU_SUB_ACT_NO_SPINY 0
	#macro ENEMY_LAKITU_SUB_ACT_HOLD_SPINY 1
	#macro ENEMY_LAKITU_SUB_ACT_THROW_SPINY 2

	/* Cloud */
	/* oAction */
	#macro CLOUD_ACT_SPAWN_PARTS 0
	#macro CLOUD_ACT_MAIN 1
	#macro CLOUD_ACT_UNLOAD 2
	#macro CLOUD_ACT_FWOOSH_HIDDEN 3

	/* oBehParams2ndByte */
	#macro CLOUD_BP_FWOOSH 0
	#macro CLOUD_BP_LAKITU_CLOUD 1

	/* Camera lakitu */
	/* oAction */
	#macro CAMERA_LAKITU_INTRO_ACT_TRIGGER_CUTSCENE 0
	#macro CAMERA_LAKITU_INTRO_ACT_SPAWN_CLOUD 1
	#macro CAMERA_LAKITU_INTRO_ACT_UNK2 2

	/* oBehParams2ndByte */
	#macro CAMERA_LAKITU_BP_FOLLOW_CAMERA 0
	#macro CAMERA_LAKITU_BP_INTRO 1

	/* Monty mole */
	/* oAction */
	#macro MONTY_MOLE_ACT_SELECT_HOLE 0
	#macro MONTY_MOLE_ACT_RISE_FROM_HOLE 1
	#macro MONTY_MOLE_ACT_SPAWN_ROCK 2
	#macro MONTY_MOLE_ACT_BEGIN_JUMP_INTO_HOLE 3
	#macro MONTY_MOLE_ACT_THROW_ROCK 4
	#macro MONTY_MOLE_ACT_JUMP_INTO_HOLE 5
	#macro MONTY_MOLE_ACT_HIDE 6
	#macro MONTY_MOLE_ACT_JUMP_OUT_OF_HOLE 7

	/* oBehParams2ndByte */
	#macro MONTY_MOLE_BP_NO_ROCK 0

	/* Monty mole rock */
	/* oAction */
	#macro MONTY_MOLE_ROCK_ACT_HELD 0
	#macro MONTY_MOLE_ROCK_ACT_MOVE 1

	/* Ukiki */
	/* oAction */
	#macro UKIKI_ACT_IDLE            0
	#macro UKIKI_ACT_RUN             1
	#macro UKIKI_ACT_TURN_TO_MARIO   2
	#macro UKIKI_ACT_JUMP            3
	#macro UKIKI_ACT_GO_TO_CAGE      4
	#macro UKIKI_ACT_WAIT_TO_RESPAWN 5
	#macro UKIKI_ACT_UNUSED_TURN     6
	#macro UKIKI_ACT_RETURN_HOME     7

	/* oSubAction */
	#macro UKIKI_SUB_ACT_TAUNT_NONE       0
	#macro UKIKI_SUB_ACT_TAUNT_ITCH       1
	#macro UKIKI_SUB_ACT_TAUNT_SCREECH    2
	#macro UKIKI_SUB_ACT_TAUNT_JUMP_CLAP  3
	#macro UKIKI_SUB_ACT_TAUNT_HANDSTAND  4

	#macro UKIKI_SUB_ACT_CAGE_RUN_TO_CAGE    0
	#macro UKIKI_SUB_ACT_CAGE_WAIT_FOR_MARIO 1
	#macro UKIKI_SUB_ACT_CAGE_TALK_TO_MARIO  2
	#macro UKIKI_SUB_ACT_CAGE_TURN_TO_CAGE   3
	#macro UKIKI_SUB_ACT_CAGE_JUMP_TO_CAGE   4
	#macro UKIKI_SUB_ACT_CAGE_LAND_ON_CAGE   5
	#macro UKIKI_SUB_ACT_CAGE_SPIN_ON_CAGE   6
	#macro UKIKI_SUB_ACT_CAGE_DESPAWN        7

	/* oUkikiTextState */
	#macro UKIKI_TEXT_DEFAULT       0
	#macro UKIKI_TEXT_CAGE_TEXTBOX  1
	#macro UKIKI_TEXT_GO_TO_CAGE    2
	#macro UKIKI_TEXT_STOLE_HAT     3
	#macro UKIKI_TEXT_HAS_HAT       4
	#macro UKIKI_TEXT_GAVE_HAT_BACK 5
	#macro UKIKI_TEXT_DO_NOT_LET_GO 6
	#macro UKIKI_TEXT_STEAL_HAT     7

	/* oBehParams2ndByte */
	#macro UKIKI_CAGE 0
	#macro UKIKI_HAT  1

	/* Animations */
	#macro UKIKI_ANIM_RUN           0
	#macro UKIKI_ANIM_UNUSED_WALK   1
	#macro UKIKI_ANIM_UNUSED_APOSE  2
	#macro UKIKI_ANIM_UNUSED_DEATH  3
	#macro UKIKI_ANIM_SCREECH       4
	#macro UKIKI_ANIM_JUMP_CLAP     5
	#macro UKIKI_ANIM_UNUSED_HOP    6
	#macro UKIKI_ANIM_LAND          7
	#macro UKIKI_ANIM_JUMP          8
	#macro UKIKI_ANIM_ITCH          9
	#macro UKIKI_ANIM_HANDSTAND    10
	#macro UKIKI_ANIM_TURN         11
	#macro UKIKI_ANIM_HELD         12

	/* oAnimState */
	#macro UKIKI_ANIM_STATE_DEFAULT    0
	#macro UKIKI_ANIM_STATE_EYE_CLOSED 1
	#macro UKIKI_ANIM_STATE_HAT_ON     2

	/* oUkikiHasHat */
	#macro UKIKI_HAT_ON 1

	/* Ukiki Cage Star */
	/* oAction */
	#macro UKIKI_CAGE_STAR_ACT_IN_CAGE    0
	#macro UKIKI_CAGE_STAR_ACT_SPAWN_STAR 1

	/* Ukiki Cage */
	/* oAction */
	#macro UKIKI_CAGE_ACT_WAIT_FOR_UKIKI 0
	#macro UKIKI_CAGE_ACT_SPIN           1
	#macro UKIKI_CAGE_ACT_FALL           2
	#macro UKIKI_CAGE_ACT_HIDE           3

	/* Piranha Plant */
	/* oAction */
	#macro PIRANHA_PLANT_ACT_IDLE 0
	#macro PIRANHA_PLANT_ACT_SLEEPING 1
	#macro PIRANHA_PLANT_ACT_BITING 2
	#macro PIRANHA_PLANT_ACT_WOKEN_UP 3
	#macro PIRANHA_PLANT_ACT_STOPPED_BITING 4
	#macro PIRANHA_PLANT_ACT_ATTACKED 5
	#macro PIRANHA_PLANT_ACT_SHRINK_AND_DIE 6
	#macro PIRANHA_PLANT_ACT_WAIT_TO_RESPAWN 7
	#macro PIRANHA_PLANT_ACT_RESPAWN 8

	/* Piranha Plant bubble */
	#macro PIRANHA_PLANT_BUBBLE_ACT_IDLE 0
	#macro PIRANHA_PLANT_BUBBLE_ACT_GROW_SHRINK_LOOP 1
	#macro PIRANHA_PLANT_BUBBLE_ACT_BURST 2

	/* Platform on track */
	/* oAction */
	#macro PLATFORM_ON_TRACK_ACT_INIT 0
	#macro PLATFORM_ON_TRACK_ACT_WAIT_FOR_MARIO 1
	#macro PLATFORM_ON_TRACK_ACT_MOVE_ALONG_TRACK 2
	#macro PLATFORM_ON_TRACK_ACT_PAUSE_BRIEFLY 3
	#macro PLATFORM_ON_TRACK_ACT_FALL 4

	/* oBehParams >> 16 */
	#macro PLATFORM_ON_TRACK_BP_MASK_PATH 0xF
	#macro PLATFORM_ON_TRACK_BP_MASK_TYPE (0x7 << 4)
	#macro PLATFORM_ON_TRACK_BP_RETURN_TO_START (1 << 8)
	#macro PLATFORM_ON_TRACK_BP_DONT_DISAPPEAR (1 << 9)
	#macro PLATFORM_ON_TRACK_BP_DONT_TURN_YAW (1 << 10)
	#macro PLATFORM_ON_TRACK_BP_DONT_TURN_ROLL (1 << 11)

	#macro PLATFORM_ON_TRACK_TYPE_CARPET    0
	#macro PLATFORM_ON_TRACK_TYPE_SKI_LIFT  1
	#macro PLATFORM_ON_TRACK_TYPE_CHECKERED 2
	#macro PLATFORM_ON_TRACK_TYPE_GRATE     3

	/* Purple switch */
	#macro PURPLE_SWITCH_IDLE                      0
	#macro PURPLE_SWITCH_PRESSED                   1
	#macro PURPLE_SWITCH_TICKING                   2
	#macro PURPLE_SWITCH_UNPRESSED                 3
	#macro PURPLE_SWITCH_WAIT_FOR_MARIO_TO_GET_OFF 4

	/* Pyramid elevator */
	#macro PYRAMID_ELEVATOR_IDLE              0
	#macro PYRAMID_ELEVATOR_START_MOVING      1
	#macro PYRAMID_ELEVATOR_CONSTANT_VELOCITY 2
	#macro PYRAMID_ELEVATOR_AT_BOTTOM         3

	/* Pyramid top */
	#macro PYRAMID_TOP_ACT_CHECK_IF_SOLVED 0
	#macro PYRAMID_TOP_ACT_SPINNING 1
	#macro PYRAMID_TOP_ACT_EXPLODE 2

	/* Pyramid wall */
	/* oAction */
	#macro PYRAMID_WALL_ACT_MOVING_DOWN 0
	#macro PYRAMID_WALL_ACT_MOVING_UP 1

	/* oBehParams2ndByte */
	#macro PYRAMID_WALL_BP_POSITION_HIGH 0
	#macro PYRAMID_WALL_BP_POSITION_MIDDLE 1
	#macro PYRAMID_WALL_BP_POSITION_LOW 2

	/* Penguins (general) */
	/* Walking sounds */
	#macro PENGUIN_WALK_BABY 0
	#macro PENGUIN_WALK_BIG  1

	/* Animations */
	#macro PENGUIN_ANIM_WALK 0
	#macro PENGUIN_ANIM_IDLE 3

	/* Racing penguin */
	/* oAction */
	#macro RACING_PENGUIN_ACT_WAIT_FOR_MARIO 0
	#macro RACING_PENGUIN_ACT_SHOW_INIT_TEXT 1
	#macro RACING_PENGUIN_ACT_PREPARE_FOR_RACE 2
	#macro RACING_PENGUIN_ACT_RACE 3
	#macro RACING_PENGUIN_ACT_FINISH_RACE 4
	#macro RACING_PENGUIN_ACT_SHOW_FINAL_TEXT 5

	/* SL walking penguin */
	/* oAction */
	#macro SL_WALKING_PENGUIN_ACT_MOVING_FORWARDS 0
	#macro SL_WALKING_PENGUIN_ACT_TURNING_BACK 1
	#macro SL_WALKING_PENGUIN_ACT_RETURNING 2
	#macro SL_WALKING_PENGUIN_ACT_TURNING_FORWARDS 3

	/* Snowman wind */
	/* oSubAction */
	#macro SL_SNOWMAN_WIND_ACT_IDLE 0
	#macro SL_SNOWMAN_WIND_ACT_TALKING 1
	#macro SL_SNOWMAN_WIND_ACT_BLOWING 2


	/* Water bomb */
	/* oAction */
	#macro WATER_BOMB_ACT_SHOT_FROM_CANNON 0
	#macro WATER_BOMB_ACT_INIT 1
	#macro WATER_BOMB_ACT_DROP 2
	#macro WATER_BOMB_ACT_EXPLODE 3

	/* TTC rotating solid */
	/* oBehParams2ndByte */
	#macro TTC_ROTATING_SOLID_BP_CUBE 0
	#macro TTC_ROTATING_SOLID_BP_TRIANGULAR_PRISM 1

	/* TTC moving bar */
	/* oAction */
	#macro TTC_MOVING_BAR_ACT_WAIT 0
	#macro TTC_MOVING_BAR_ACT_PULL_BACK 1
	#macro TTC_MOVING_BAR_ACT_EXTEND 2
	#macro TTC_MOVING_BAR_ACT_RETRACT 3

	/* TTC cog */
	/* oBehParams2ndByte */
	#macro TTC_COG_BP_SHAPE_MASK 0x00000002
	#macro TTC_COG_BP_SHAPE_HEXAGON (0 << 1)
	#macro TTC_COG_BP_SHAPE_TRIANGLE (1 << 1)
	#macro TTC_COG_BP_DIR_MASK 0x00000001
	#macro TTC_COG_BP_DIR_CCW (0 << 0) // TODO: Check these
	#macro TTC_COG_BP_DIR_CW (1 << 0)

	/* TTC 2D Rotator */
	/* oBehParams2ndByte */
	#macro TTC_2D_ROTATOR_BP_HAND 0
	#macro TTC_2D_ROTATOR_BP_2D_COG 1

	/* Activated Back-and-Forth Platform */
	/* ((u16)(o->oBehParams >> 16) & 0x0300) >> 8 aka platform type */
	#macro ACTIVATED_BF_PLAT_TYPE_BITS_ARROW_PLAT 0
	#macro ACTIVATED_BF_PLAT_TYPE_BITFS_MESH_PLAT 1
	#macro ACTIVATED_BF_PLAT_TYPE_BITFS_ELEVATOR  2

	/* Dorrie */
	/* oAction */
	#macro DORRIE_ACT_MOVE 0
	#macro DORRIE_ACT_LOWER_HEAD 1
	#macro DORRIE_ACT_RAISE_HEAD 2

	/* Mad piano */
	/* oAction */
	#macro MAD_PIANO_ACT_WAIT 0
	#macro MAD_PIANO_ACT_ATTACK 1

	/* Fire piranha plant */
	/* oAction */
	#macro FIRE_PIRANHA_PLANT_ACT_HIDE 0
	#macro FIRE_PIRANHA_PLANT_ACT_GROW 1

	/* Fire spitter */
	/* oAction */
	#macro FIRE_SPITTER_ACT_IDLE 0
	#macro FIRE_SPITTER_ACT_SPIT_FIRE 1

	/* Eyerok boss */
	/* oAction */
	#macro EYEROK_BOSS_ACT_SLEEP 0
	#macro EYEROK_BOSS_ACT_WAKE_UP 1
	#macro EYEROK_BOSS_ACT_SHOW_INTRO_TEXT 2
	#macro EYEROK_BOSS_ACT_FIGHT 3
	#macro EYEROK_BOSS_ACT_DIE 4

	/* Eyerok hand */
	/* oAction */
	#macro EYEROK_HAND_ACT_SLEEP 0
	#macro EYEROK_HAND_ACT_IDLE 1
	#macro EYEROK_HAND_ACT_OPEN 2
	#macro EYEROK_HAND_ACT_SHOW_EYE 3
	#macro EYEROK_HAND_ACT_CLOSE 4
	#macro EYEROK_HAND_ACT_RETREAT 5
	#macro EYEROK_HAND_ACT_TARGET_MARIO 6
	#macro EYEROK_HAND_ACT_SMASH 7
	#macro EYEROK_HAND_ACT_FIST_PUSH 8
	#macro EYEROK_HAND_ACT_FIST_SWEEP 9
	#macro EYEROK_HAND_ACT_BEGIN_DOUBLE_POUND 10 // raising for double smash
	#macro EYEROK_HAND_ACT_DOUBLE_POUND 11 // double smashing
	#macro EYEROK_HAND_ACT_ATTACKED 12
	#macro EYEROK_HAND_ACT_RECOVER 13
	#macro EYEROK_HAND_ACT_BECOME_ACTIVE 14
	#macro EYEROK_HAND_ACT_DIE 15

	/* Klepto */
	/* oAction */
	#macro KLEPTO_ACT_CIRCLE_TARGET_HOLDING 0
	#macro KLEPTO_ACT_APPROACH_TARGET_HOLDING 1
	#macro KLEPTO_ACT_WAIT_FOR_MARIO 2
	#macro KLEPTO_ACT_TURN_TOWARD_MARIO 3
	#macro KLEPTO_ACT_DIVE_AT_MARIO 4
	#macro KLEPTO_ACT_RESET_POSITION 5
	#macro KLEPTO_ACT_STRUCK_BY_MARIO 6
	#macro KLEPTO_ACT_RETREAT 7

	/* oAnimState */
	#macro KLEPTO_ANIM_STATE_HOLDING_NOTHING 0
	#macro KLEPTO_ANIM_STATE_HOLDING_CAP 1
	#macro KLEPTO_ANIM_STATE_HOLDING_STAR 2

	/* Bird */
	/* oAction */
	#macro BIRD_ACT_INACTIVE 0
	#macro BIRD_ACT_FLY 1

	/* oBehParams2ndByte */
	#macro BIRD_BP_SPAWNED 0
	#macro BIRD_BP_SPAWNER 1

	/* Skeeter */
	/* oAction */
	#macro SKEETER_ACT_IDLE 0
	#macro SKEETER_ACT_LUNGE 1
	#macro SKEETER_ACT_WALK 2

	/* Snufit */
	/* oAction */
	#macro SNUFIT_ACT_IDLE  0
	#macro SNUFIT_ACT_SHOOT 1

	/* Tweester */
	/* oAction */
	#macro TWEESTER_ACT_IDLE  0
	#macro TWEESTER_ACT_CHASE 1
	#macro TWEESTER_ACT_HIDE  2

	/* oSubAction */
	#macro TWEESTER_SUB_ACT_WAIT  0

	#macro TWEESTER_SUB_ACT_CHASE 0

	/* Triplet butterfly */
	/* oAction */
	#macro TRIPLET_BUTTERFLY_ACT_INIT 0
	#macro TRIPLET_BUTTERFLY_ACT_WANDER 1
	#macro TRIPLET_BUTTERFLY_ACT_ACTIVATE 2
	#macro TRIPLET_BUTTERFLY_ACT_EXPLODE 3

	/* oBehParams2ndByte */
	#macro TRIPLET_BUTTERFLY_BP_BUTTERFLY_NUM 0x00000003
	#macro TRIPLET_BUTTERFLY_BP_NO_BOMBS 0x00000004

	/* oTripletButterflyType */
	#macro TRIPLET_BUTTERFLY_TYPE_NORMAL -1
	#macro TRIPLET_BUTTERFLY_TYPE_EXPLODES 0
	#macro TRIPLET_BUTTERFLY_TYPE_SPAWN_1UP 1

	/* Water level diamond */
	/* oAction */
	// Loading
	#macro WATER_LEVEL_DIAMOND_ACT_INIT 0
	// Idling when Mario isn't inside its hitbox
	#macro WATER_LEVEL_DIAMOND_ACT_IDLE 1
	// While the water level is changing
	#macro WATER_LEVEL_DIAMOND_ACT_CHANGE_WATER_LEVEL 2
	// After the water level has changed but Mario hasn't left its hitbox yet
	#macro WATER_LEVEL_DIAMOND_ACT_IDLE_SPINNING 3

	/* Mips */
	/* oAction */
	#macro MIPS_ACT_WAIT_FOR_NEARBY_MARIO 0
	#macro MIPS_ACT_FOLLOW_PATH 1
	#macro MIPS_ACT_WAIT_FOR_ANIMATION_DONE 2
	#macro MIPS_ACT_FALL_DOWN 3
	#macro MIPS_ACT_IDLE 4

	/* oMipsStarStatus */
	#macro MIPS_STAR_STATUS_HAVENT_SPAWNED_STAR 0
	#macro MIPS_STAR_STATUS_SHOULD_SPAWN_STAR 1
	#macro MIPS_STAR_STATUS_ALREADY_SPAWNED_STAR 2

	/* Falling Pillar */
	/* oAction */
	#macro FALLING_PILLAR_ACT_IDLE 0
	#macro FALLING_PILLAR_ACT_TURNING 1
	#macro FALLING_PILLAR_ACT_FALLING 2

	/* Bowser Puzzle */
	/* oAction */
	#macro BOWSER_PUZZLE_ACT_SPAWN_PIECES 0
	#macro BOWSER_PUZZLE_ACT_WAIT_FOR_COMPLETE 1
	#macro BOWSER_PUZZLE_ACT_DONE 2

	/* Mr Blizzard */
	/* oAction */
	#macro MR_BLIZZARD_ACT_SPAWN_SNOWBALL 0
	#macro MR_BLIZZARD_ACT_HIDE_UNHIDE 1
	#macro MR_BLIZZARD_ACT_RISE_FROM_GROUND 2
	#macro MR_BLIZZARD_ACT_ROTATE 3
	#macro MR_BLIZZARD_ACT_THROW_SNOWBALL 4
	#macro MR_BLIZZARD_ACT_BURROW 5
	#macro MR_BLIZZARD_ACT_DEATH 6
	#macro MR_BLIZZARD_ACT_JUMP 7
	/* oBehParams2ndByte */
	#macro MR_BLIZZARD_STYPE_NO_CAP 0
	#macro MR_BLIZZARD_STYPE_JUMPING 1	
	
	boot("object_constants_macros_init");
}