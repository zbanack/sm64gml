// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function power_meter_init(){
	power_meter_texture_define();
	power_meter_health_segments_lut = [
	    texture_power_meter_one_segments,
	    texture_power_meter_two_segments,
	    texture_power_meter_three_segments,
	    texture_power_meter_four_segments,
	    texture_power_meter_five_segments,
	    texture_power_meter_six_segments,
	    texture_power_meter_seven_segments,
	    texture_power_meter_full,
	];	
	power_meter_model_define();
}
