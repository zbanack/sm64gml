function paintings_scripts_init_macros() {
	/// Use to properly set a GraphNodeGenerated's parameter to point to the right painting
	function PAINTING_ID(id, grp) {
		return id | (grp << 8);	
	}

	/// The default painting side length
	#macro PAINTING_SIZE 614.0

	#macro PAINTING_ID_DDD 7

	#macro BOARD_BOWSERS_SUB 1

	#macro BOWSERS_SUB_BEATEN 0x2
	#macro DDD_BACK 0x1

	#macro PAINTING_IDLE 0
	#macro PAINTING_RIPPLE 1
	#macro PAINTING_ENTERED 2

	#macro RIPPLE_TRIGGER_PROXIMITY 10
	#macro RIPPLE_TRIGGER_CONTINUOUS 20

	/// Painting that uses 1 or more images as a texture
	#macro PAINTING_IMAGE 0
	/// Painting that has one texture used for an environment map effect
	#macro PAINTING_ENV_MAP 1	

	#macro RIPPLE_LEFT 0x20

	#macro RIPPLE_MIDDLE 0x10
	#macro RIPPLE_RIGHT 0x8
	#macro ENTER_LEFT 0x4
	#macro ENTER_MIDDLE 0x2
	#macro ENTER_RIGHT 0x1
	#macro NEAREST_4TH 30
	#macro MARIO_X 40
	#macro MIDDLE_X 50
	#macro MARIO_Y 60
	#macro MARIO_Z 70
	#macro MIDDLE_Y 80
	#macro DONT_RESET -56
	
	globalvar gPaintingMarioFloorType,
	gPaintingMarioXPos,
	gPaintingMarioYPos,
	gPaintingMarioZPos,
	gPaintingMesh,
	gPaintingTriNorms,
	gRipplingPainting,
	gDddPaintingStatus;

	gPaintingMarioFloorType	= 0;
	gPaintingMarioXPos		= 0;
	gPaintingMarioYPos		= 0;
	gPaintingMarioZPos		= 0;
	gPaintingMesh			= null;
	gPaintingTriNorms		= Vec3f;
	gRipplingPainting		= null;
	gDddPaintingStatus		= 0;

	globalvar sHmcPaintings;
	sHmcPaintings = [
	    null,//cotmc_painting, // @z
	    null,
	];

	globalvar sInsideCastlePaintings;
	sInsideCastlePaintings = [
	    bob_painting, ccm_painting, wf_painting,  jrb_painting,      lll_painting,
	    ssl_painting, hmc_painting, ddd_painting, wdw_painting,      thi_tiny_painting,
	    ttm_painting, ttc_painting, sl_painting,  thi_huge_painting, null,
	];

	globalvar sTtmPaintings;
	sTtmPaintings = [
	    null,//ttm_slide_painting, // @z
	    null,
	];

	globalvar sPaintingGroups;
	sPaintingGroups = [
	    sHmcPaintings,
	    sInsideCastlePaintings,
	    sTtmPaintings,
	];
	
	globalvar gPaintingUpdateCounter, gLastPaintingUpdateCounter;
	gPaintingUpdateCounter		= 1;
	gLastPaintingUpdateCounter	= 0;
}

function PaintingMeshVertex(_pos, _norm) constructor{
	pos = Vec3;
	norm = Vec3;
}

function Painting(args) constructor {
	var n = 0;
    _id                        = args[n++];
    imageCount                 = args[n++];
    textureType                = args[n++];
    lastFloor                  = args[n++];
    currFloor                  = args[n++];
    floorEntered               = args[n++];
    state                      = args[n++];
    pitch                      = args[n++];
    yaw                        = args[n++];
    posX                       = args[n++];
    posY                       = args[n++];
    posZ                       = args[n++];
    currRippleMag              = args[n++];
    passiveRippleMag           = args[n++];
    entryRippleMag             = args[n++];
    rippleDecay                = args[n++];
    passiveRippleDecay         = args[n++];
    entryRippleDecay           = args[n++];
    currRippleRate             = args[n++];
    passiveRippleRate          = args[n++];
    entryRippleRate            = args[n++];
    dispersionFactor           = args[n++];
    passiveDispersionFactor    = args[n++];
    entryDispersionFactor      = args[n++];
    rippleTimer                = args[n++];
    rippleX                    = args[n++];
    rippleY                    = args[n++];
    normalDisplayList          = args[n++];
    textureMaps                = args[n++];
    textureArray               = args[n++];
    textureWidth               = args[n++];
    textureHeight              = args[n++];
    rippleDisplayList          = args[n++];
    rippleTrigger              = args[n++];
    alpha                      = args[n++];
    marioWasUnder              = args[n++];
    marioIsUnder               = args[n++];
    marioWentUnder             = args[n++];
    size                       = args[n++];
}

function PaintingData() {
	var array = array_create(argument_count);
	
	for(var i = 0; i < argument_count; i++) {
		array[i] = argument[i];	
	}
	
	return array;
}