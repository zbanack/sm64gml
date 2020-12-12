function bhv_pole_base_loop() {
	
	var o = gCurrentObject;
	if (o.rawData[oPosY] - 10.0 < gMarioObject[0].rawData[oPosY] &&
	    gMarioObject[0].rawData[oPosY] < o.rawData[oPosY] + o.hitboxHeight + 30.0) {
	    if (o.rawData[oTimer] > 10) {
	        if (!(gMarioState.action & MARIO_PUNCHING)) {
	            cur_obj_push_mario_away(70.0);
	        }
	    }
	}
	
}		