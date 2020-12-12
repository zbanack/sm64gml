function object_fields_macros_init() {
/**
 * The array [0x88, 0x1C8) in struct Object consists of fields that can vary by
 * object type. These macros provide access to these fields.
 */

#macro oFlags                      (0x01)
#macro oDialogResponse             (0x02)/* z[0] */
#macro oDialogState                (0x02)/* z[1] */
#macro oUnk94                      (0x03)
#macro oIntangibleTimer            (0x05)
#macro O_POS_INDEX                 0x06
#macro oPosX                       (O_POS_INDEX + 0)
#macro oPosY                       (O_POS_INDEX + 1)
#macro oPosZ                       (O_POS_INDEX + 2)
#macro oVelX                       (0x09)
#macro oVelY                       (0x0A)
#macro oVelZ                       (0x0B)
#macro oForwardVel                 (0x0C)
#macro oForwardVelS32              (0x0C)
#macro oUnkBC                      (0x0D)
#macro oUnkC0                      (0x0E)
#macro O_MOVE_ANGLE_INDEX          0x0F
#macro O_MOVE_ANGLE_PITCH_INDEX    (O_MOVE_ANGLE_INDEX + 0)
#macro O_MOVE_ANGLE_YAW_INDEX      (O_MOVE_ANGLE_INDEX + 1)
#macro O_MOVE_ANGLE_ROLL_INDEX     (O_MOVE_ANGLE_INDEX + 2)
#macro oMoveAnglePitch             (O_MOVE_ANGLE_PITCH_INDEX)
#macro oMoveAngleYaw               (O_MOVE_ANGLE_YAW_INDEX)
#macro oMoveAngleRoll              (O_MOVE_ANGLE_ROLL_INDEX)
#macro O_FACE_ANGLE_INDEX          0x12
#macro O_FACE_ANGLE_PITCH_INDEX    (O_FACE_ANGLE_INDEX + 0)
#macro O_FACE_ANGLE_YAW_INDEX      (O_FACE_ANGLE_INDEX + 1)
#macro O_FACE_ANGLE_ROLL_INDEX     (O_FACE_ANGLE_INDEX + 2)
#macro oFaceAnglePitch             (O_FACE_ANGLE_PITCH_INDEX)
#macro oFaceAngleYaw               (O_FACE_ANGLE_YAW_INDEX)
#macro oFaceAngleRoll              (O_FACE_ANGLE_ROLL_INDEX)
#macro oGraphYOffset               (0x15)
#macro oActiveParticleFlags        (0x16)
#macro oGravity                    (0x17)
#macro oFloorHeight                (0x18)
#macro oMoveFlags                  (0x19)
#macro oAnimState                  (0x1A)
#macro oAngleVelPitch              (0x23)
#macro oAngleVelYaw                (0x24)
#macro oAngleVelRoll               (0x25)
#macro oAnimations                 (0x26)
#macro oHeldState                  (0x27)
#macro oWallHitboxRadius           (0x28)
#macro oDragStrength               (0x29)
#macro oInteractType               (0x2A)
#macro oInteractStatus             (0x2B)
#macro O_PARENT_RELATIVE_POS_INDEX 0x2C
#macro oParentRelativePosX         (O_PARENT_RELATIVE_POS_INDEX + 0)
#macro oParentRelativePosY         (O_PARENT_RELATIVE_POS_INDEX + 1)
#macro oParentRelativePosZ         (O_PARENT_RELATIVE_POS_INDEX + 2)
#macro oBehParams2ndByte           (0x2F)
#macro oAction                     (0x31)
#macro oSubAction                  (0x32)
#macro oTimer                      (0x33)
#macro oBounciness                 (0x34)
#macro oDistanceToMario            (0x35)
#macro oAngleToMario               (0x36)
#macro oHomeX                      (0x37)
#macro oHomeY                      (0x38)
#macro oHomeZ                      (0x39)
#macro oFriction                   (0x3A)
#macro oBuoyancy                   (0x3B)
#macro oSoundStateID               (0x3C)
#macro oOpacity                    (0x3D)
#macro oDamageOrCoinValue          (0x3E)
#macro oHealth                     (0x3F)
#macro oBehParams                  (0x40)
#macro oPrevAction                 (0x41)
#macro oInteractionSubtype         (0x42)
#macro oCollisionDistance          (0x43)
#macro oNumLootCoins               (0x44)
#macro oDrawingDistance            (0x45)
#macro oRoom                       (0x46)
#macro oUnk1A8                     (0x48)
#macro oWallAngle                  (0x4B)
#macro oFloorType                  (0x4C)/* z[0] */
#macro oFloorRoom                  (0x4C)/* z[1] */
#macro oAngleToHome                (0x4D)
#macro oFloor                      (0x4E)
#macro oDeathSound                 (0x4F)

#macro oPathedStartWaypoint     (0x1D)
#macro oPathedPrevWaypoint      (0x1E)
#macro oPathedPrevWaypointFlags (0x1F)
#macro oPathedTargetPitch       (0x20)
#macro oPathedTargetYaw         (0x21)

#macro oMacroUnk108 (0x20)
#macro oMacroUnk10C (0x21)
#macro oMacroUnk110 (0x22)

#macro oMarioParticleFlags    (0x1B)
#macro oMarioPoleUnk108       (0x20)
#macro oMarioReadingSignDYaw  (0x20)
#macro oMarioPoleYawVel       (0x21)
#macro oMarioCannonObjectYaw  (0x21)
#macro oMarioTornadoYawVel    (0x21)
#macro oMarioReadingSignDPosX (0x21)
#macro oMarioPolePos          (0x22)
#macro oMarioCannonInputYaw   (0x22)
#macro oMarioTornadoPosY      (0x22)
#macro oMarioReadingSignDPosZ (0x22)
#macro oMarioWhirlpoolPosY    (0x22)
#macro oMarioBurnTimer        (0x22)
#macro oMarioLongJumpIsSlow   (0x22)
#macro oMarioSteepJumpYaw     (0x22)
#macro oMarioWalkingPitch     (0x22)

#macro o1UpHiddenUnkF4 (0x1B)

#macro oActivatedBackAndForthPlatformMaxOffset    (0x1B)
#macro oActivatedBackAndForthPlatformOffset       (0x1C)
#macro oActivatedBackAndForthPlatformVel          (0x1D)
#macro oActivatedBackAndForthPlatformCountdown    (0x1E)
#macro oActivatedBackAndForthPlatformStartYaw     (0x1F)
#macro oActivatedBackAndForthPlatformVertical     (0x20)
#macro oActivatedBackAndForthPlatformFlipRotation (0x21)

#macro oAmpRadiusOfRotation (0x1B)
#macro oAmpYPhase           (0x1C)

#macro oHomingAmpLockedOn (0x1B)
#macro oHomingAmpAvgY     (0x1D)

#macro oArrowLiftDisplacement       (0x1B)
#macro oArrowLiftUnk100             (0x1E)

#macro oBackAndForthPlatformUnkF4  (0x1B)
#macro oBackAndForthPlatformUnkF8  (0x1C)
#macro oBackAndForthPlatformUnkFC  (0x1D)
#macro oBackAndForthPlatformUnk100 (0x1E)

#macro oBirdSpeed       (0x1B)
#macro oBirdTargetPitch (0x1C)
#macro oBirdTargetYaw   (0x1D)

#macro oBirdChirpChirpUnkF4 (0x1B)

#macro oEndBirdUnk104 (0x1F)

#macro oHiddenBlueCoinSwitch (0x1C)

#macro oBobombBlinkTimer (0x1B)
#macro oBobombFuseLit    (0x1C)
#macro oBobombFuseTimer  (0x1D)

#macro oBobombBuddyBlinkTimer       (0x1B)
#macro oBobombBuddyHasTalkedToMario (0x1C)
#macro oBobombBuddyRole             (0x1D)
#macro oBobombBuddyCannonStatus     (0x1E)
#macro oBobombBuddyPosXCopy         (0x20)
#macro oBobombBuddyPosYCopy         (0x21)
#macro oBobombBuddyPosZCopy         (0x22)

#macro oBobombExpBubGfxScaleFacX (0x1D)
#macro oBobombExpBubGfxScaleFacY (0x1E)
#macro oBobombExpBubGfxExpRateX  (0x1F)
#macro oBobombExpBubGfxExpRateY  (0x20)

#macro oSmallBompInitX (0x1E)

#macro oBooDeathStatus           (0x00)
#macro oBooTargetOpacity         (0x1B)
#macro oBooBaseScale             (0x1C)
#macro oBooOscillationTimer      (0x1D)
#macro oBooMoveYawDuringHit      (0x1E)
#macro oBooMoveYawBeforeHit      (0x1F)
#macro oBooParentBigBoo          (0x20)
#macro oBooNegatedAggressiveness (0x21)
#macro oBooInitialMoveYaw        (0x22)
#macro oBooTurningSpeed          (0x4A)/* z[0] */

#macro oBigBooNumMinionBoosKilled (0x49)

#macro oBookendUnkF4 (0x1B)
#macro oBookendUnkF8 (0x1C)

#macro oBookSwitchUnkF4 (0x1B)

#macro oBookSwitchManagerUnkF4 (0x1B)
#macro oBookSwitchManagerUnkF8 (0x1C)

#macro oHauntedBookshelfShouldOpen (0x00)

#macro oBouncingFireBallUnkF4 (0x1B)

#macro oBowlingBallTargetYaw (0x1B)

#macro oBBallSpawnerMaxSpawnDist (0x1B)
#macro oBBallSpawnerSpawnOdds    (0x1C)
#macro oBBallSpawnerPeriodMinus1 (0x1D)

#macro oBowserUnk88           (0x00)
#macro oBowserUnkF4           (0x1B)
#macro oBowserUnkF8           (0x1C)
#macro oBowserDistToCentre    (0x1D)
#macro oBowserUnk106          (0x1F)/* z[1] */
#macro oBowserUnk108          (0x20)/* z[0] */
#macro oBowserHeldAnglePitch  (0x20)/* z[1] */
#macro oBowserHeldAngleVelYaw (0x21)/* z[0] */
#macro oBowserUnk10E          (0x21)/* z[1] */
#macro oBowserUnk110          (0x22)/* z[0] */
#macro oBowserAngleToCentre   (0x22)/* z[1] */
#macro oBowserUnk1AC          (0x49)/* z[0] */
#macro oBowserUnk1AE          (0x49)/* z[1] */
#macro oBowserEyesShut        (0x4A)/* z[0] */
#macro oBowserUnk1B2          (0x4A)/* z[1] */

#macro oBowserShockWaveUnkF4 (0x1B)

#macro oBlackSmokeBowserUnkF4 (0x1B)

#macro oBowserKeyScale (0x1B)

#macro oBowserPuzzleCompletionFlags (0x1B)

#macro oBowserPuzzlePieceOffsetX                  (0x1D)
#macro oBowserPuzzlePieceOffsetY                  (0x1E)
#macro oBowserPuzzlePieceOffsetZ                  (0x1F)
#macro oBowserPuzzlePieceContinuePerformingAction (0x20)
#macro oBowserPuzzlePieceActionList               (0x21)
#macro oBowserPuzzlePieceNextAction               (0x22)

#macro oBubbaUnkF4  (0x1B)
#macro oBubbaUnkF8  (0x1C)
#macro oBubbaUnkFC  (0x1D)
#macro oBubbaUnk100 (0x1E)
#macro oBubbaUnk104 (0x1F)
#macro oBubbaUnk108 (0x20)
#macro oBubbaUnk10C (0x21)
#macro oBubbaUnk1AC (0x49)/* z[0] */
#macro oBubbaUnk1AE (0x49)/* z[1] */
#macro oBubbaUnk1B0 (0x4A)/* z[0] */
#macro oBubbaUnk1B2 (0x4A)/* z[1] */

#macro oBulletBillInitialMoveYaw (0x1C)

#macro oBullySubtype                   (0x1B)
#macro oBullyPrevX                     (0x1C)
#macro oBullyPrevY                     (0x1D)
#macro oBullyPrevZ                     (0x1E)
#macro oBullyKBTimerAndMinionKOCounter (0x1F)
#macro oBullyMarioCollisionAngle       (0x20)

#macro oButterflyYPhase (0x1B)

#macro oTripletButterflyScale             (0x1B)
#macro oTripletButterflySpeed             (0x1C)
#macro oTripletButterflyBaseYaw           (0x1D)
#macro oTripletButterflyTargetPitch       (0x1E)
#macro oTripletButterflyTargetYaw         (0x1F)
#macro oTripletButterflyType              (0x20)
#macro oTripletButterflyModel             (0x21)
#macro oTripletButterflySelectedButterfly (0x22)
#macro oTripletButterflyScalePhase        (0x49)

#macro oCannonUnkF4  (0x1B)
#macro oCannonUnkF8  (0x1C)
#macro oCannonUnk10C (0x21)

#macro oCapUnkF4 (0x1B)
#macro oCapUnkF8 (0x1C)

#macro oChainChompSegments                     (0x1B)
#macro oChainChompMaxDistFromPivotPerChainPart (0x1C)
#macro oChainChompMaxDistBetweenChainParts     (0x1D)
#macro oChainChompDistToPivot                  (0x1E)
#macro oChainChompUnk104                       (0x1F)
#macro oChainChompRestrictedByChain            (0x20)
#macro oChainChompTargetPitch                  (0x21)
#macro oChainChompNumLunges                    (0x22)
#macro oChainChompReleaseStatus                (0x49)
#macro oChainChompHitGate                      (0x4A)

#macro oCheckerBoardPlatformUnkF8  (0x1C) // oAction like
#macro oCheckerBoardPlatformUnkFC  (0x1D)
#macro oCheckerBoardPlatformUnk1AC (0x49)

#macro oCheepCheepUnkF4  (0x1B)
#macro oCheepCheepUnkF8  (0x1C)
#macro oCheepCheepUnkFC  (0x1D)
#macro oCheepCheepUnk104 (0x1F)
#macro oCheepCheepUnk108 (0x20)

#macro oChuckyaUnk88  (0x00)
#macro oChuckyaUnkF8  (0x1C)
#macro oChuckyaUnkFC  (0x1D)
#macro oChuckyaUnk100 (0x1E)

#macro oClamUnkF4 (0x1B)

#macro oCloudCenterX              (0x1B)
#macro oCloudCenterY              (0x1C)
#macro oCloudBlowing              (0x1D)
#macro oCloudGrowSpeed            (0x1E)
#macro oCloudFwooshMovementRadius (0x49)/* z[0] */

#macro oCoinUnkF4  (0x1B)
#macro oCoinUnkF8  (0x1C)
#macro oCoinUnk110 (0x22)
#macro oCoinUnk1B0 (0x4A)

#macro oCollisionParticleUnkF4  (0x1B)

#macro oControllablePlatformUnkF8  (0x1C)
#macro oControllablePlatformUnkFC  (0x1D)
#macro oControllablePlatformUnk100 (0x1E)

#macro oBreakableBoxSmallReleased            (0x1B)
#macro oBreakableBoxSmallFramesSinceReleased (0x1D)

#macro oJumpingBoxUnkF4 (0x1B)
#macro oJumpingBoxUnkF8 (0x1C)

#macro oRRCruiserWingUnkF4 (0x1B)
#macro oRRCruiserWingUnkF8 (0x1C)

#macro oDonutPlatformSpawnerSpawnedPlatforms (0x1B)

#macro oDoorUnk88  (0x00)
#macro oDoorUnkF8  (0x1C)
#macro oDoorUnkFC  (0x1D)
#macro oDoorUnk100 (0x1E)

#macro oDorrieDistToHome         (0x1B)
#macro oDorrieOffsetY            (0x1C)
#macro oDorrieVelY               (0x1D)
#macro oDorrieForwardDistToMario (0x1E)
#macro oDorrieYawVel             (0x1F)
#macro oDorrieLiftingMario       (0x21)
#macro oDorrieGroundPounded      (0x49)/* z[0] */
#macro oDorrieAngleToHome        (0x49)/* z[1] */
#macro oDorrieNeckAngle          (0x4A)/* z[0] */
#macro oDorrieHeadRaiseSpeed     (0x4A)/* z[1] */

#macro oElevatorUnkF4  (0x1B)
#macro oElevatorUnkF8  (0x1C)
#macro oElevatorUnkFC  (0x1D)
#macro oElevatorUnk100 (0x1E)

#macro oExclamationBoxUnkF4 (0x1B) // scale?
#macro oExclamationBoxUnkF8 (0x1C) // scale?
#macro oExclamationBoxUnkFC (0x1D) // angle?

#macro oEyerokBossNumHands   (0x1C)
#macro oEyerokBossUnkFC      (0x1D)
#macro oEyerokBossActiveHand (0x1E)
#macro oEyerokBossUnk104     (0x1F)
#macro oEyerokBossUnk108     (0x20)
#macro oEyerokBossUnk10C     (0x21)
#macro oEyerokBossUnk110     (0x22)
#macro oEyerokBossUnk1AC     (0x49)

#macro oEyerokHandWakeUpTimer (0x1B)
#macro oEyerokReceivedAttack  (0x1C)
#macro oEyerokHandUnkFC       (0x1D)
#macro oEyerokHandUnk100      (0x1E)

#macro oFallingPillarPitchAcceleration (0x1B)

#macro oFireSpitterScaleVel (0x1B)

#macro oBlueFishRandomVel   (0x1B)
#macro oBlueFishRandomTime  (0x1C)
#macro oBlueFishRandomAngle (0x1E)

#macro oFishWaterLevel      (0x1B)
#macro oFishPosY            (0x1C)
#macro oFishRandomOffset    (0x1D)
#macro oFishRandomSpeed     (0x1E)
#macro oFishRespawnDistance (0x1F)
#macro oFishRandomVel       (0x20)
#macro oFishDepthDistance   (0x21)
#macro oFishActiveDistance  (0x22)

#macro oFlameUnkF4  (0x1B)
#macro oFlameUnkF8  (0x1C)
#macro oFlameUnkFC  (0x1D)
#macro oFlameUnk100 (0x1E)

#macro oBlueFlameUnkF8 (0x1C)

#macro oSmallPiranhaFlameUnkF4  (0x1B)
#macro oSmallPiranhaFlameUnkF8  (0x1C)
#macro oSmallPiranhaFlameUnkFC  (0x1D)
#macro oSmallPiranhaFlameUnk100 (0x1E)
#macro oSmallPiranhaFlameUnk104 (0x1F)
#macro oMovingFlameTimer (0x1B)

#macro oFlameThowerFlameUnk110 (0x22)

#macro oFlameThowerUnk110 (0x22)

#macro oFloatingPlatformUnkF4  (0x1B)
#macro oFloatingPlatformUnkF8  (0x1C)
#macro oFloatingPlatformUnkFC  (0x1D)
#macro oFloatingPlatformUnk100  (0x1E)

#macro oFloorSwitchPressAnimationUnkF4  (0x1B)
#macro oFloorSwitchPressAnimationUnkF8  (0x1C)
#macro oFloorSwitchPressAnimationUnkFC  (0x1D)
#macro oFloorSwitchPressAnimationUnk100 (0x1E)

#macro oFlyGuyIdleTimer        (0x1B)
#macro oFlyGuyOscTimer         (0x1C)
#macro oFlyGuyUnusedJitter     (0x1D)
#macro oFlyGuyLungeYDecel      (0x1E)
#macro oFlyGuyLungeTargetPitch (0x1F)
#macro oFlyGuyTargetRoll       (0x20)
#macro oFlyGuyScaleVel         (0x21)

#macro oGrandStarUnk108 (0x20)

#macro oHorizontalGrindelTargetYaw  (0x1B)
#macro oHorizontalGrindelDistToHome (0x1C)
#macro oHorizontalGrindelOnGround   (0x1D)

#macro oGoombaSize                (0x1B)
#macro oGoombaScale               (0x1C)
#macro oGoombaWalkTimer           (0x1D)
#macro oGoombaTargetYaw           (0x1E)
#macro oGoombaBlinkTimer          (0x1F)
#macro oGoombaTurningAwayFromWall (0x20)
#macro oGoombaRelativeSpeed       (0x21)

#macro oHauntedChairUnkF4  (0x1B)
#macro oHauntedChairUnkF8  (0x1C)
#macro oHauntedChairUnkFC  (0x1D)
#macro oHauntedChairUnk100 (0x1E)
#macro oHauntedChairUnk104 (0x1F)

#macro oHeaveHoUnk88 (0x00)
#macro oHeaveHoUnkF4 (0x1B)

#macro oHiddenObjectUnkF4 (0x1B)

#macro oHootAvailability     (0x1B)
#macro oHootMarioReleaseTime (0x22)

#macro oHorizontalMovementUnkF4  (0x1B)
#macro oHorizontalMovementUnkF8  (0x1C)
#macro oHorizontalMovementUnk100 (0x1E)
#macro oHorizontalMovementUnk104 (0x1F)
#macro oHorizontalMovementUnk108 (0x20)

#macro oKickableBoardF4 (0x1B)
#macro oKickableBoardF8 (0x1C)

#macro oKingBobombUnk88  (0x00)
#macro oKingBobombUnkF8  (0x1C)
#macro oKingBobombUnkFC  (0x1D)
#macro oKingBobombUnk100 (0x1E)
#macro oKingBobombUnk104 (0x1F)
#macro oKingBobombUnk108 (0x20)

#macro oKleptoDistanceToTarget      (0x1B)
#macro oKleptoUnkF8                 (0x1C)
#macro oKleptoUnkFC                 (0x1D)
#macro oKleptoSpeed                 (0x1E)
#macro oKleptoStartPosX             (0x1F)
#macro oKleptoStartPosY             (0x20)
#macro oKleptoStartPosZ             (0x21)
#macro oKleptoTimeUntilTargetChange (0x22)
#macro oKleptoTargetNumber          (0x49)/* z[0] */
#macro oKleptoUnk1AE                (0x49) /* z[1] */
#macro oKleptoUnk1B0                (0x4A)/* z[0] */
#macro oKleptoYawToTarget           (0x4A) /* z[1] */

#macro oKoopaAgility                     (0x1B)
#macro oKoopaMovementType                (0x1C)
#macro oKoopaTargetYaw                   (0x1D)
#macro oKoopaUnshelledTimeUntilTurn      (0x1E)
#macro oKoopaTurningAwayFromWall         (0x1F)
#macro oKoopaDistanceToMario             (0x20)
#macro oKoopaAngleToMario                (0x21)
#macro oKoopaBlinkTimer                  (0x22)
#macro oKoopaCountdown                   (0x49)/* z[0] */
#macro oKoopaTheQuickRaceIndex           (0x49)/* z[1] */
#macro oKoopaTheQuickInitTextboxCooldown (0x4A)/* z[0] */

#macro oKoopaRaceEndpointRaceBegun     (0x1B)
#macro oKoopaRaceEndpointKoopaFinished (0x1C)
#macro oKoopaRaceEndpointRaceStatus    (0x1D)
#macro oKoopaRaceEndpointUnk100        (0x1E)
#macro oKoopaRaceEndpointRaceEnded     (0x1F)

#macro oKoopaShellFlameUnkF4 (0x1B)
#macro oKoopaShellFlameUnkF8 (0x1C)

#macro oCameraLakituBlinkTimer     (0x1B)
#macro oCameraLakituSpeed          (0x1C)
#macro oCameraLakituCircleRadius   (0x1D)
#macro oCameraLakituFinishedDialog (0x1E)
#macro oCameraLakituUnk104         (0x1F)
#macro oCameraLakituPitchVel       (0x49)/* z[0] */
#macro oCameraLakituYawVel         (0x49)/* z[1] */

#macro oEnemyLakituNumSpinies           (0x1B)
#macro oEnemyLakituBlinkTimer           (0x1C)
#macro oEnemyLakituSpinyCooldown        (0x1D)
#macro oEnemyLakituFaceForwardCountdown (0x1E)

#macro oIntroLakituSplineSegmentProgress  (0x1C)
#macro oIntroLakituSplineSegment          (0x1D)
#macro oIntroLakituUnk100                 (0x1E)
#macro oIntroLakituUnk104                 (0x1F)
#macro oIntroLakituUnk108                 (0x20)
#macro oIntroLakituUnk10C                 (0x21)
#macro oIntroLakituUnk110                 (0x22)
#macro oIntroLakituCloud                  (0x49)

#macro oMenuButtonState       (0x1B)
#macro oMenuButtonTimer       (0x1C)
#macro oMenuButtonOrigPosX    (0x1D)
#macro oMenuButtonOrigPosY    (0x1E)
#macro oMenuButtonOrigPosZ    (0x1F)
#macro oMenuButtonScale       (0x20)
#macro oMenuButtonActionPhase (0x21)

#macro oMantaUnkF4  (0x1B)
#macro oMantaUnkF8  (0x1C)
#macro oMantaUnk1AC (0x49)

#macro oMerryGoRoundStopped         (0x00)
#macro oMerryGoRoundMusicShouldPlay (0x1C)
#macro oMerryGoRoundMarioIsOutside  (0x1D)

#macro oMerryGoRoundBooManagerNumBoosKilled  (0x00)
#macro oMerryGoRoundBooManagerNumBoosSpawned (0x1D)

#macro oMipsStarStatus         (0x1B)
#macro oMipsStartWaypointIndex (0x1C)
#macro oMipsForwardVelocity    (0x49)

#macro oMoneybagJumpState (0x1B)

#macro oMontyMoleCurrentHole           (0x1B)
#macro oMontyMoleHeightRelativeToFloor (0x1C)

#macro oMontyMoleHoleCooldown (0x1B)

#macro oMrBlizzardScale             (0x1B)
#macro oMrBlizzardHeldObj           (0x1C)
#macro oMrBlizzardGraphYVel         (0x1D)
#macro oMrBlizzardTimer             (0x1E)
#macro oMrBlizzardDizziness         (0x1F)
#macro oMrBlizzardChangeInDizziness (0x20)
#macro oMrBlizzardGraphYOffset      (0x21)
#macro oMrBlizzardDistFromHome      (0x22)
#macro oMrBlizzardTargetMoveYaw     (0x49)

#macro oMrIUnkF4  (0x1B)
#macro oMrIUnkFC  (0x1D)
#macro oMrIUnk100 (0x1E)
#macro oMrIUnk104 (0x1F)
#macro oMrIUnk108 (0x20)
#macro oMrISize   (0x21)
#macro oMrIUnk110 (0x22)

#macro oRespawnerModelToRespawn    (0x1B)
#macro oRespawnerMinSpawnDist      (0x1C)
#macro oRespawnerBehaviorToRespawn OBJECT_FIELD_CVPTR(0x1D)

#macro oOpenableGrillUnk88 (0x00)
#macro oOpenableGrillUnkF4 (0x1B)

#macro oIntroPeachYawFromFocus (0x20)
#macro oIntroPeachPitchFromFocus (0x21)
#macro oIntroPeachDistToCamera (0x22)

#macro oRacingPenguinInitTextCooldown       (0x1B)
#macro oRacingPenguinWeightedNewTargetSpeed (0x22)
#macro oRacingPenguinFinalTextbox           (0x49)/* z[0] */
#macro oRacingPenguinMarioWon               (0x49)/* z[1] */
#macro oRacingPenguinReachedBottom          (0x4A)/* z[0] */
#macro oRacingPenguinMarioCheated           (0x4A)/* z[1] */

#macro oSmallPenguinUnk88  (0x00)
#macro oSmallPenguinUnk100 (0x1E) 
#macro oSmallPenguinUnk104 (0x1F)
#macro oSmallPenguinUnk108 (0x20)
#macro oSmallPenguinUnk110 (0x22)

#macro oSLWalkingPenguinWindCollisionXPos (0x1E)
#macro oSLWalkingPenguinWindCollisionZPos (0x1F)
#macro oSLWalkingPenguinCurStep           (0x21)
#macro oSLWalkingPenguinCurStepTimer      (0x22)

#macro oPiranhaPlantSleepMusicState (0x1B)
#macro oPiranhaPlantScale           (0x1C)

#macro oFirePiranhaPlantNeutralScale   (0x1B)
#macro oFirePiranhaPlantScale          (0x1C) //Shared with above obj? Coincidence?
#macro oFirePiranhaPlantActive         (0x1D)
#macro oFirePiranhaPlantDeathSpinTimer (0x1E)
#macro oFirePiranhaPlantDeathSpinVel   (0x1F)

#macro oPitouneUnkF4 (0x1B)
#macro oPitouneUnkF8 (0x1C)
#macro oPitouneUnkFC (0x1D)

#macro oPlatformTimer  (0x1B)
#macro oPlatformUnkF8  (0x1C)
#macro oPlatformUnkFC  (0x1D)
#macro oPlatformUnk10C (0x21)
#macro oPlatformUnk110 (0x22)

#macro oPlatformOnTrackBaseBallIndex          (0x00)
#macro oPlatformOnTrackDistMovedSinceLastBall (0x1B)
#macro oPlatformOnTrackSkiLiftRollVel         (0x1C)
#macro oPlatformOnTrackStartWaypoint          (0x1D)
#macro oPlatformOnTrackPrevWaypoint           (0x1E)
#macro oPlatformOnTrackPrevWaypointFlags      (0x1F)
#macro oPlatformOnTrackPitch                  (0x20)
#macro oPlatformOnTrackYaw                    (0x21)
#macro oPlatformOnTrackOffsetY                (0x22)
#macro oPlatformOnTrackIsNotSkiLift           (0x49)/* z[0] */
#macro oPlatformOnTrackIsNotHMC               (0x49)/* z[1] */
#macro oPlatformOnTrackType                   (0x4A)/* z[0] */
#macro oPlatformOnTrackWasStoodOn             (0x4A)/* z[1] */

#macro oPlatformSpawnerUnkF4  (0x1B)
#macro oPlatformSpawnerUnkF8  (0x1C)
#macro oPlatformSpawnerUnkFC  (0x1D)
#macro oPlatformSpawnerUnk100 (0x1E)
#macro oPlatformSpawnerUnk104 (0x1F)
#macro oPlatformSpawnerUnk108 (0x20)

#macro oPokeyAliveBodyPartFlags  (0x1B)
#macro oPokeyNumAliveBodyParts   (0x1C)
#macro oPokeyBottomBodyPartSize  (0x1D)
#macro oPokeyHeadWasKilled       (0x1E)
#macro oPokeyTargetYaw           (0x1F)
#macro oPokeyChangeTargetTimer   (0x20)
#macro oPokeyTurningAwayFromWall (0x21)

#macro oPokeyBodyPartDeathDelayAfterHeadKilled (0x1C)
#macro oPokeyBodyPartBlinkTimer                (0x22)

#macro oDDDPoleVel       (0x1B)
#macro oDDDPoleMaxOffset (0x1C)
#macro oDDDPoleOffset    (0x1D)

#macro oPyramidTopPillarsTouched (0x1B)

#macro oPyramidTopFragmentsScale (0x1B)

#macro oRollingLogUnkF4 (0x1B)

#macro oLllRotatingHexFlameUnkF4 (0x1B)
#macro oLllRotatingHexFlameUnkF8 (0x1C)
#macro oLllRotatingHexFlameUnkFC (0x1D)

#macro oScuttlebugUnkF4 (0x1B)
#macro oScuttlebugUnkF8 (0x1C)
#macro oScuttlebugUnkFC (0x1D)

#macro oScuttlebugSpawnerUnk88 (0x00)
#macro oScuttlebugSpawnerUnkF4 (0x1B)

#macro oSeesawPlatformPitchVel (0x1B)

#macro oShipPart3UnkF4 (0x1B) // angle?
#macro oShipPart3UnkF8 (0x1C) // angle?

#macro oSinkWhenSteppedOnUnk104 (0x1F)
#macro oSinkWhenSteppedOnUnk108 (0x20)

#macro oSkeeterTargetAngle (0x1B)
#macro oSkeeterUnkF8       (0x1C)
#macro oSkeeterUnkFC       (0x1D)
#macro oSkeeterWaitTime    (0x1E)
#macro oSkeeterUnk1AC      (0x49)/* z[0] */

#macro oJrbSlidingBoxUnkF4 (0x1B)
#macro oJrbSlidingBoxUnkF8 (0x1C)
#macro oJrbSlidingBoxUnkFC (0x1D)

#macro oWFSlidBrickPtfmMovVel (0x1B)

#macro oSmokeTimer (0x1B)

#macro oSnowmansBottomUnkF4  (0x1B)
#macro oSnowmansBottomUnkF8  (0x1C)
#macro oSnowmansBottomUnk1AC (0x49)

#macro oSnowmansHeadUnkF4 (0x1B)

#macro oSLSnowmanWindOriginalYaw (0x1B)

#macro oSnufitRecoil          (0x1B)
#macro oSnufitScale           (0x1C)
#macro oSnufitCircularPeriod  (0x1E)
#macro oSnufitBodyScalePeriod (0x1F)
#macro oSnufitBodyBaseScale   (0x20)
#macro oSnufitBullets         (0x21)
#macro oSnufitXOffset         (0x49)/* z[0] */
#macro oSnufitYOffset         (0x49)/* z[1] */
#macro oSnufitZOffset         (0x4A)/* z[0] */
#macro oSnufitBodyScale       (0x4A)/* z[1] */

#macro oSpindelUnkF4 (0x1B)
#macro oSpindelUnkF8 (0x1C)

#macro oSpinningHeartTotalSpin   (0x1B)
#macro oSpinningHeartPlayedSound (0x1C)

#macro oSpinyTimeUntilTurn       (0x1B)
#macro oSpinyTargetYaw           (0x1C)
#macro oSpinyTurningAwayFromWall (0x1E)

#macro oSoundEffectUnkF4 (0x1B)

#macro oStarSpawnDisFromHome (0x1B)
#macro oStarSpawnUnkFC       (0x1D)

#macro oHiddenStarTriggerCounter (0x1B)

#macro oSparkleSpawnUnk1B0 (0x4A)

#macro oUnlockDoorStarState  (0x20)
#macro oUnlockDoorStarTimer  (0x21)
#macro oUnlockDoorStarYawVel (0x22)

#macro oCelebStarUnkF4              (0x1B)
#macro oCelebStarDiameterOfRotation (0x20)

#macro oStarSelectorType  (0x1B)
#macro oStarSelectorTimer (0x1C)
#macro oStarSelectorSize  (0x20)

#macro oSushiSharkUnkF4 (0x1B) // angle?

#macro oSwingPlatformAngle (0x1B)
#macro oSwingPlatformSpeed (0x1C)

#macro oSwoopBonkCountdown (0x1B)
#macro oSwoopTargetPitch   (0x1C)
#macro oSwoopTargetYaw     (0x1D)

#macro oThwompRandomTimer (0x1B)

#macro oTiltingPyramidNormalX         (0x1B)
#macro oTiltingPyramidNormalY         (0x1C)
#macro oTiltingPyramidNormalZ         (0x1D)
#macro oTiltingPyramidMarioOnPlatform (0x21)

#macro oToadMessageDialogId      (0x20)
#macro oToadMessageRecentlyTalked (0x21)
#macro oToadMessageState          (0x22)

#macro oToxBoxMovementPattern (0x49)
#macro oToxBoxMovementStep    (0x4A)

#macro oTTCRotatingSolidNumTurns      (0x1B)
#macro oTTCRotatingSolidNumSides      (0x1C)
#macro oTTCRotatingSolidRotationDelay (0x1D)
#macro oTTCRotatingSolidVelY          (0x1E)
#macro oTTCRotatingSolidSoundTimer    (0x1F)

#macro oTTCPendulumAccelDir   (0x1B)
#macro oTTCPendulumAngle      (0x1C)
#macro oTTCPendulumAngleVel   (0x1D)
#macro oTTCPendulumAngleAccel (0x1E)
#macro oTTCPendulumDelay      (0x1F)
#macro oTTCPendulumSoundTimer (0x20)

#macro oTTCTreadmillBigSurface      (0x1B)
#macro oTTCTreadmillSmallSurface    (0x1C)
#macro oTTCTreadmillSpeed           (0x1D)
#macro oTTCTreadmillTargetSpeed     (0x1E)
#macro oTTCTreadmillTimeUntilSwitch (0x1F)

#macro oTTCMovingBarDelay        (0x1B)
#macro oTTCMovingBarStoppedTimer (0x1C)
#macro oTTCMovingBarOffset       (0x1D)
#macro oTTCMovingBarSpeed        (0x1E)
#macro oTTCMovingBarStartOffset  (0x1F)

#macro oTTCCogDir       (0x1B)
#macro oTTCCogSpeed     (0x1C)
#macro oTTCCogTargetVel (0x1D)

#macro oTTCPitBlockPeakY    (0x1B)
#macro oTTCPitBlockDir      (0x1C)
#macro oTTCPitBlockWaitTime (0x1D)

#macro oTTCElevatorDir      (0x1B)
#macro oTTCElevatorPeakY    (0x1C)
#macro oTTCElevatorMoveTime (0x1D)

#macro oTTC2DRotatorMinTimeUntilNextTurn (0x1B)
#macro oTTC2DRotatorTargetYaw            (0x1C)
#macro oTTC2DRotatorIncrement            (0x1D)
#macro oTTC2DRotatorRandomDirTimer       (0x1F)
#macro oTTC2DRotatorSpeed                (0x20)

#macro oTTCSpinnerDir     (0x1B)
#macro oTTCChangeDirTimer (0x1C)

#macro oBetaTrampolineMarioOnTrampoline (0x22)

#macro oTreasureChestUnkF4 (0x1B)
#macro oTreasureChestUnkF8 (0x1C)
#macro oTreasureChestUnkFC (0x1D)

#macro oTreeSnowOrLeafUnkF4 (0x1B)
#macro oTreeSnowOrLeafUnkF8 (0x1C)
#macro oTreeSnowOrLeafUnkFC (0x1D)

#macro oTumblingBridgeUnkF4 (0x1B)

#macro oTweesterScaleTimer (0x1B)
#macro oTweesterUnused     (0x1C)

#macro oUkikiTauntCounter   (0x1B)/* z[0] */
#macro oUkikiTauntsToBeDone (0x1B)/* z[1] */
#macro oUkikiChaseFleeRange (0x22)
#macro oUkikiTextState      (0x49)/* z[0] */
#macro oUkikiTextboxTimer   (0x49)/* z[1] */
#macro oUkikiCageSpinTimer  (0x4A)/* z[0] */
#macro oUkikiHasHat         (0x4A)/* z[1] */

#macro oUkikiCageNextAction (0x00)

#macro oUnagiUnkF4  (0x1B)
#macro oUnagiUnkF8  (0x1C)
#macro oUnagiUnk110 (0x22)
#macro oUnagiUnk1AC (0x49)
#macro oUnagiUnk1B0 (0x4A)/* z[0] */
#macro oUnagiUnk1B2 (0x4A)/* z[1] */

#macro oWaterBombVerticalStretch (0x1C)
#macro oWaterBombStretchSpeed    (0x1D)
#macro oWaterBombOnGround        (0x1E)
#macro oWaterBombNumBounces      (0x1F)

#macro oWaterBombSpawnerBombActive  (0x1B)
#macro oWaterBombSpawnerTimeToSpawn (0x1C)

#macro oWaterCannonUnkF4  (0x1B)
#macro oWaterCannonUnkF8  (0x1C)
#macro oWaterCannonUnkFC  (0x1D)
#macro oWaterCannonUnk100 (0x1E)

#macro oCannonBarrelBubblesUnkF4 (0x1B)

#macro oWaterLevelPillarUnkF8 (0x1C)

#macro oWaterLevelTriggerUnkF4            (0x1B)
#macro oWaterLevelTriggerTargetWaterLevel (0x1C)

#macro oWaterObjUnkF4  (0x1B)
#macro oWaterObjUnkF8  (0x1C)
#macro oWaterObjUnkFC  (0x1D)
#macro oWaterObjUnk100 (0x1E)

#macro oWaterRingScalePhaseX      (0x1B)
#macro oWaterRingScalePhaseY      (0x1C)
#macro oWaterRingScalePhaseZ      (0x1D)
#macro oWaterRingNormalX          (0x1E)
#macro oWaterRingNormalY          (0x1F)
#macro oWaterRingNormalZ          (0x20)
#macro oWaterRingMarioDistInFront (0x21)
#macro oWaterRingIndex            (0x22)
#macro oWaterRingAvgScale         (0x49)

#macro oWaterRingSpawnerRingsCollected (0x49)

#macro oWaterRingMgrNextRingIndex     (0x1B)
#macro oWaterRingMgrLastRingCollected (0x1C)

#macro oWaveTrailSize (0x1C)

#macro oWhirlpoolInitFacePitch (0x1B)
#macro oWhirlpoolInitFaceRoll  (0x1C)

#macro oWhitePuffUnkF4 (0x1B)
#macro oWhitePuffUnkF8 (0x1C)
#macro oWhitePuffUnkFC (0x1D)
#macro oStrongWindParticlePenguinObj (0x1B)

#macro oWhompShakeVal (0x1C)

#macro  oWigglerFallThroughFloorsHeight (0x1B)
#macro  oWigglerSegments                (0x1C)
#macro  oWigglerWalkAnimSpeed           (0x1D)
#macro  oWigglerSquishSpeed             (0x1F)
#macro  oWigglerTimeUntilRandomTurn     (0x20)
#macro  oWigglerTargetYaw               (0x21)
#macro  oWigglerWalkAwayFromWallTimer   (0x22)
#macro  oWigglerUnused                  (0x49)/* z[0] */
#macro  oWigglerTextStatus              (0x49)/* z[1] */

#macro oLllWoodPieceOscillationTimer (0x1B)

#macro  oWoodenPostTotalMarioAngle  (0x1B)
#macro  oWoodenPostPrevAngleToMario (0x1C)
#macro  oWoodenPostSpeedY           (0x1D)
#macro  oWoodenPostMarioPounding    (0x1E)
#macro  oWoodenPostOffsetY          (0x1F)

#macro oYoshiBlinkTimer (0x1B)
#macro oYoshiChosenHome (0x1D)
#macro oYoshiTargetYaw  (0x1E)
boot("object_fields_macros_init");
}