function piano_init() {
	piano_anims_define();
	piano_texture_define();
	piano_model_define();
	piano_geo_define();
	piano_bhv_define();
	
globalvar sMadPianoHitbox;
sMadPianoHitbox = new Hitbox(
    /* interactType:      */ INTERACT_MR_BLIZZARD,
    /* downOffset:        */ 0,
    /* damageOrCoinValue: */ 3,
    /* health:            */ 99,
    /* numLootCoins:      */ 0,
    /* radius:            */ 200,
    /* height:            */ 150,
    /* hurtboxRadius:     */ 200,
    /* hurtboxHeight:     */ 150,
);

}