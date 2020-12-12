function gm_overhead_macros_init() {
	#macro null		undefined	
	boot("gm_overhead_macros_init");
}

function debug_timer_init() {
	global.__timer_1 = array_create(9, -1);
	global.__timer_2 = array_create(9, -1);
	
	boot("debug_timer_init");
}

function TIMER_START(slot) {
	global.__timer_1[slot] = get_timer();	
}
	
function TIMER_STOP(slot) {
		
	if (global.__timer_1[slot] < 0) return;
		
	global.__timer_2[slot] = get_timer();
		
	log("Timer #" + string(slot) + ": " + string_format((global.__timer_2[slot]-global.__timer_1[slot])/1000000, 5, 5), "secs");
		
	global.__timer_1[slot] = -1;
	global.__timer_2[slot] = -1;
}