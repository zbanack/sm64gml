function mario_actions_object_macros_init() {
globalvar sPunchingForwardVelocities;
sPunchingForwardVelocities = [0, 1, 1, 2, 3, 5, 7, 10];

boot("mario_actions_object_macros_init");
}
function mario_update_punch_sequence(m) {
	var endAction, crouchEndAction;

	if (m.action & ACT_FLAG_MOVING) {
	    endAction = ACT_WALKING;
	    crouchEndAction = ACT_CROUCH_SLIDE;
	} else {
	    endAction = ACT_IDLE;
	    crouchEndAction = ACT_CROUCHING;
	}

	var animFrame;

	switch (m.actionArg) {
	    case 0: /// play sound - no break
	    case 1:
	        set_mario_animation(m, MARIO_ANIM_FIRST_PUNCH);
	        if (is_anim_past_end(m)) {
	            m.actionArg = 2;
	        } else {
	            m.actionArg = 1;
	        }

	        if (m.marioObj.header.gfx.unk38.animFrame >= 2) {
	            if (mario_check_object_grab(m)) {
	                return 1
	            }

	            m.flags |= MARIO_PUNCHING;
	        }

	        if (m.actionArg == 2) {
	            m.marioBodyState.punchState = (0 << 6) | 4;
	        }
	        break
	    case 2:
	        set_mario_animation(m, MARIO_ANIM_FIRST_PUNCH_FAST);

	        if (m.marioObj.header.gfx.unk38.animFrame <= 0) {
	            m.flags |= MARIO_PUNCHING;
	        }

	        if (m.input & INPUT_B_PRESSED) {
	            m.actionArg = 3;
	        }

	        if (is_anim_at_end(m)) {
	            set_mario_action(m, endAction, 0);
	        }
	        break

	    case 3: ///play sound - no break
	    case 4:
	        set_mario_animation(m, MARIO_ANIM_SECOND_PUNCH)
	        if (is_anim_past_end(m)) {
	            m.actionArg = 5;
	        } else { m.actionArg = 4; }

	        if (m.marioObj.header.gfx.unk38.animFrame > 0) {
	            m.flags |= MARIO_PUNCHING;
	        }

	        if (m.actionArg == 5) {
	            m.marioBodyState.punchState = (1 << 6) | 4;
	        }
	        break

	    case 5:
	        set_mario_animation(m, MARIO_ANIM_SECOND_PUNCH_FAST)
	        if (m.marioObj.header.gfx.unk38.animFrame <= 0) {
	            m.flags |= MARIO_PUNCHING;
	        }

	        if (m.input & INPUT_B_PRESSED) {
	            m.actionArg = 6;
	        }

	        if (is_anim_at_end(m)) {
	            set_mario_action(m, endAction, 0);
	        }
	        break

	    case 6:
	        play_mario_action_sound(m, SOUND_MARIO_PUNCH_HOO, 1)
	        animFrame = set_mario_animation(m, MARIO_ANIM_GROUND_KICK);
	        if (animFrame == 0) {
	            m.marioBodyState.punchState = (2 << 6) | 6;
	        }

	        if (animFrame >= 0 && animFrame < 8) {
	            m.flags |= MARIO_KICKING;
	        }

	        if (is_anim_at_end(m)) {
	            set_mario_action(m, endAction, 0);
	        }
	        break

	    case 9:
	        set_mario_animation(m, MARIO_ANIM_BREAKDANCE);
	        animFrame = m.marioObj.header.gfx.unk38.animFrame;

	        if (animFrame >= 2 && animFrame < 8) {
	            m.flags |= MARIO_TRIPPING;
	        }

	        if (is_anim_at_end(m)) {
	            set_mario_action(m, crouchEndAction, 0);
	        }
	        break

	    default: throw("\nunknown mario punch, @TODO");
	}

	return 0;
}

function act_punching(m) {

	if (m.input & (INPUT_NONZERO_ANALOG | INPUT_A_PRESSED | INPUT_OFF_FLOOR | INPUT_ABOVE_SLIDE)) {
	    return check_common_action_exits(m);
	}

	if (m.actionState == 0 && (m.input & INPUT_A_DOWN)) {
	    return set_mario_action(m, ACT_JUMP_KICK, 0);
	}

	m.actionState = 1;
	if (m.actionArg == 0) { m.actionTimer = 7; }

	set_forward_vel(m, sPunchingForwardVelocities[m.actionTimer]);
	if (m.actionTimer > 0) { m.actionTimer--; }

	mario_update_punch_sequence(m);
	perform_ground_step(m);
	return 0

}

function animated_stationary_ground_step(m, animation, endAction) {
	stationary_ground_step(m);
	set_mario_animation(m, animation);
	if (is_anim_at_end(m)) {
	    set_mario_action(m, endAction, 0);
	}
}
	
function act_stomach_slide_stop(m) {
	if (m.input & INPUT_OFF_FLOOR) {
	    return set_mario_action(m, ACT_FREEFALL, 0);
	}

	if (m.input & INPUT_ABOVE_SLIDE) {
	    return set_mario_action(m, ACT_BEGIN_SLIDING, 0);
	}

	animated_stationary_ground_step(m, MARIO_ANIM_SLOW_LAND_FROM_DIVE, ACT_IDLE);
	return 0;
}

function mario_execute_object_action(m) {

	switch (m.action) {
	    case ACT_PUNCHING: return act_punching(m);
	    case ACT_STOMACH_SLIDE_STOP: return act_stomach_slide_stop(m);
	    default: throw("\nunknown object action, @TODO");
	}
}