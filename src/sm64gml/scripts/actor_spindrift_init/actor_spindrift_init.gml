function actor_spindrift_init() {
	actor_spindrift_anims_define();
	actor_spindrift_textures_define();
	actor_spindrift_model_define();
	actor_spindrift_geo_define();
	actor_spindrift_bhv_define();
	
/// <pygml?v=1.0&h=f34b29004>
globalvar sSpindriftHitbox;
sSpindriftHitbox = new Hitbox(
    /* interactType: */ INTERACT_BOUNCE_TOP,
    /* downOffset: */ 0,
    /* damageOrCoinValue: */ 2,
    /* health: */ 1,
    /* numLootCoins: */ 3,
    /* radius: */ 90,
    /* height: */ 80,
    /* hurtboxRadius: */ 80,
    /* hurtboxHeight: */ 70,
);

}