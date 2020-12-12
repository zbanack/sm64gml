function types_h_macros_init() {
	#macro ANIM_FLAG_NOLOOP						(1 << 0)									
	#macro ANIM_FLAG_FORWARD					(1 << 1)									
	#macro ANIM_FLAG_2							(1 << 2)											
	#macro ANIM_FLAG_HOR_TRANS					(1 << 3)									
	#macro ANIM_FLAG_VERT_TRANS					(1 << 4)								
	#macro ANIM_FLAG_5							(1 << 5)											
	#macro ANIM_FLAG_6							(1 << 6)											
	#macro ANIM_FLAG_7							(1 << 7)	
	
	boot("types_h_macros_init");
}

function Surface() constructor {
    type = 0;
    force = 0;
    flags = 0;
    _room = 0;
    lowerY = 0;
    upperY = 0;
    vertex1 = Vec3s;
    vertex2 = Vec3s;
    vertex3 = Vec3s;
    normal = null;
    originOffset	= 0;
    object			= null;
}