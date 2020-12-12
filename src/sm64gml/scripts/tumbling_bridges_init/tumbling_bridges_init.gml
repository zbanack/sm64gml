function tumbling_bridges_init() {
	tumbling_bridges_model_define();
	tumbling_bridges_geo_define();
	tumbling_bridges_bhv_define();	
	
	tumbling_bridge_macros_init();
}