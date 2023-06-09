---
description: Hierarchy of WolvenKit.RED4.Types.entIComponent
---

# Comprehensive components list



{% hint style="info" %}
Full list of components, organized by hierarchy, useful for researching and documenting new components.
{% endhint %}

{% hint style="info" %}
If you decide to document a component, make a new entry on the main page, followed by the discovered behavior and usage and link back to that in this list.
{% endhint %}

* AIObjectSelectionComponent
* AIOffMeshConnectionComponent
* AISignalHandlerComponent
* entAnimationControllerComponent
* entAnimationSetupExtensionComponent
* entAnimGraphResourceContainer
* entEffectAttachmentComponent
* <details open><summary>entExternalComponent</summary>
  * entMorphTargetManagerComponent
* entFacialCustomizationComponent
* <details open><summary>entIMoverComponent</summary>
  * gameRootTransformAnimatorComponent
  * moveComponent
* <details open><summary>entIPlacedComponent</summary>
  * entAmbientSoundEmitterComponent
  * <details open><summary>entBaseCameraComponent</summary>
    * <details open><summary>entRenderToTextureCameraComponent</summary>
      * gameuiHolocallCameraComponent
    * entVirtualCameraComponent
    * <details open><summary>gameCameraComponent</summary>
      * gameFPPCameraComponent
      * gameFreeCameraComponent
      * gameScreenshot360CameraComponent
      * gameTPPCameraComponent
      * vehicleTPPCameraComponent
      * vehicleVehicleProxyBlendCamera
    * gamePhotoModeBackgroundCameraComponent
    * gameWorldSpaceBlendCamera
  * [entColliderComponent](./#entcollidercomponent)
  * entDynamicActorRepellingComponent
  * <details open><summary>entISkinableComponent</summary>
    * [entAnimatedComponent](./#entanimatedcomponent)
    * entCorpseComponent
    * entInstancedAnimationComponent
  * <details open><summary>entIVisualComponent</summary>
    * cpConveyorComponent
    * entClothComponent
    * entDebug\_ShapeComponent
    * entDecalComponent
    * entEffectSpawnerComponent
    * entEnvProbeComponent
    * entFogVolumeComponent
    * <details open><summary>entISkinTargetComponent</summary>
      * entMorphTargetSkinnedMeshComponent
      * [entSkinnedClothComponent](./#entskinnedclothcomponent)
      * <details open><summary>[entSkinnedMeshComponent](./#entskinnedmeshcomponent)</summary>
        * entCharacterCustomizationSkinnedMeshComponent
        * [entGarmentSkinnedMeshComponent](./#entgarmentskinnedmeshcomponent)
        * entPhysicalSkinnedMeshComponent
    * entLightBlockingComponent
    * entLightChannelComponent
    * <details open><summary>entLightComponent</summary>
      * cpGameplayLightComponent
      * <details open><summary>gameLightComponent</summary>
        * vehicleLightComponent
    * <details open><summary>entMeshComponent</summary>
      * entDebug\_MeshComponent
      * entEditorMeshComponent
      * <details open><summary>entPhysicalMeshComponent</summary>
        * entAppearanceProxyMeshComponent
        * entBakedDestructionComponent
      * HudMeshComponent
    * entParticlesComponent
    * entPhysicalDestructionComponent
    * entVectorFieldComponent
    * <details open><summary>entVirtualCameraViewComponent</summary>
      * ScriptableVirtualCameraViewComponent
    * gameBinkComponent
  * entMarketingAnimationComponent
  * <details open><summary>entPhysicalTriggerComponent</summary>
    * entPhysicalImpulseAreaComponent
    * entTriggerComponent
  * entPlaceholderComponent
  * entSimpleColliderComponent
  * <details open><summary>entSlotComponent</summary>
    * gameHitRepresentationComponent
    * gameOccupantSlotComponent
  * entSoundListenerComponent
  * entStaticOccluderMeshComponent
  * entTargetPointComponent
  * <details open><summary>entTransformComponent</summary>
    * entVisualOffsetTransformComponent
  * entTriggerActivatorComponent
  * gameaudioAcousticPortalComponent
  * gameAudioEmitterComponent
  * <details open><summary>gameaudioSoundComponentBase</summary>
    * gameaudioSoundComponent
    * gameaudioVehicleAudioComponent
    * gameWeaponAudioComponent
  * gameEntityStubComponentPlacedProxy
  * gameEnvironmentDamageReceiverComponent
  * gameinfluenceBumpComponent
  * gameinfluenceComponent
  * gameinfluenceHeatAgentComponent
  * gameinfluenceObstacleComponent
  * [gameinteractionsComponent](./#gameinteractioncomponent)
  * gamemappinsMappinComponent
  * gameMovingPlatform
  * gameNavmeshDetector
  * gamePingComponent
  * gameprojectileComponent
  * gameprojectileSpawnComponent
  * <details open><summary>gameStaticAreaShapeComponent</summary>
    * gameStaticTriggerAreaComponent
  * [gameTargetingComponent](./#gametargetingcomponent)
  * gameTransformAnimatorComponent
  * mpInteractionActivatorComponent
  * senseComponent
  * senseSensorObjectComponent
  * senseVisibleObjectComponent
  * vehicleChassisComponent
  * <details open><summary>WidgetBaseComponent</summary>
    * <details open><summary>IWorldWidgetComponent</summary>
      * AdvertisementWidgetComponent
      * StreetSignWidgetComponent
      * WorldWidgetComponent
    * <details open><summary>WidgetHudComponentInterface</summary>
      * WidgetHudComponent
    * <details open><summary>WidgetMenuComponentInterface</summary>
      * WidgetMenuComponent
  * workWorkspotResourceComponent
* entLocalizationStringComponent
* entRagdollComponent
* entTransformHistoryComponent
* entVertexAnimationComponent
* entVisualControllerComponent
* entWetnessComponent
* gameAIDirectorTensionAnalyzeComponent
* gameAttachmentSlots
* gameaudioMusicSyncComponent
* gameBraindanceDissolveComponent
* <details open><summary>gameComponent</summary>
  * <details open><summary>AICAgent</summary>
    * AIHumanComponent
    * AIVehicleAgent
  * <details open><summary>AITargetTrackerComponent</summary>
    * TargetTrackingExtension
  * cpTestComponent
  * ElevatorController
  * EntityStubComponent
  * gameAttitudeAgent
  * gameDeviceCameraControlComponent
  * <details open><summary>gameDeviceComponent</summary>
    * PSD\_Detector
    * PSD\_Master
    * <details open><summary>ScriptableDeviceComponent</summary>
      * ActionsSequencerController
      * <details open><summary>ActivatedDeviceController</summary>
        * BarbedWireController
      * ActivatedDeviceNPCController
      * AlarmLightController
      * AOEEffectorController
      * <details open><summary>ArcadeMachineController</summary>
        * PachinkoMachineController
      * <details open><summary>BaseAnimatedDeviceController</summary>
        * MainframeController
        * RetractableAdController
        * SlidingLadderController
      * BaseDestructibleController
      * <details open><summary>BasicDistractionDeviceController</summary>
        * <details open><summary>BlindingLightController</summary>
          * ReflectorController
        * CleaningMachineController
        * ConfessionBoothController
        * <details open><summary>ExplosiveDeviceController</summary>
          * C4Controller
          * ExplosiveTriggerDeviceController
          * <details open><summary>SensorDeviceController</summary>
            * SecurityTurretController
            * SurveillanceCameraController
        * FanController
        * NetrunnerControlPanelController
        * SmokeMachineController
      * BillboardDeviceController
      * CandleController
      * ChestPressController
      * CoderController
      * ConveyorController
      * DataTermController
      * DisplayGlassController
      * DisposalDeviceController
      * <details open><summary>DoorController</summary>
        * MovableWallScreenController
        * WindowController
      * DoorProximityDetectorController
      * DropPointController
      * <details open><summary>ElectricLightController</summary>
        * GameplayLightController
      * ExitLightController
      * ForkliftController
      * FridgeController
      * GenericDeviceController
      * GlitchedTurretController
      * HoloDeviceController
      * HoloFeederController
      * InteractiveAdController
      * InteractiveSignController
      * IntercomController
      * InvisibleSceneStashController
      * JukeboxController
      * LadderController
      * LaserDetectorController
      * <details open><summary>LcdScreenController</summary>
        * ApartmentScreenController
      * <details open><summary>MasterController</summary>
        * AccessPointController
        * ActivatorController
        * AOEAreaController
        * <details open><summary>BaseNetworkSystemController</summary>
          * DoorSystemController
        * <details open><summary>DestructibleMasterDeviceController</summary>
          * DestructibleMasterLightController
        * <details open><summary>DeviceSystemBaseController</summary>
          * PersonnelSystemController
          * SecuritySystemController
          * SurveillanceSystemController
        * DisassembleMasterController
        * ElectricBoxController
        * FuseBoxController
        * FuseController
        * LiftController
        * MaintenancePanelController
        * NetworkAreaController
        * RoadBlockTrapController
        * SecurityAlarmController
        * SecurityAreaController
        * SecurityGateController
        * SimpleSwitchController
        * SmartHouseController
        * SoundSystemController
        * <details open><summary>TerminalController</summary>
          * <details open><summary>ComputerController</summary>
            * SmartWindowController
          * ElevatorFloorTerminalController
        * TrafficIntersectionManagerController
        * VentilationAreaController
      * <details open><summary>MediaDeviceController</summary>
        * HoloTableController
        * RadioController
        * <details open><summary>TVController</summary>
          * WallScreenController
      * MovableDeviceController
      * NcartTimetableController
      * NetrunnerChairController
      * OdaCementBagController
      * PortalController
      * ProximityDetectorController
      * RoadBlockController
      * SecurityGateLockController
      * SecurityLockerController
      * SpeakerController
      * StashController
      * StillageController
      * ToiletController
      * <details open><summary>TrafficLightController</summary>
        * CrossingLightController
        * TrafficZebraController
      * <details open><summary>VehicleComponent</summary>
        * AVComponent
        * CarComponent
        * MotorcycleComponent
      * <details open><summary>VendingMachineController</summary>
        * IceMachineController
      * VendingTerminalController
      * VentilationEffectorController
      * WardrobeController
      * WeakFenceController
      * WeaponTrainingController
      * WeaponVendingMachineController
      * WindowBlindersController
  * gameEntitySpawnerComponent
  * gameEntityStubComponent
  * gameInventory
  * gameMasterDeviceComponent
  * [gameScanningComponent](./#gamescanningcomponent)
  * <details open><summary>gameScriptableComponent</summary>
    * AdamSmasherComponent
    * <details open><summary>AIRelatedComponents</summary>
      * <details open><summary>AICustomComponents</summary>
        * CentaurShieldController
      * <details open><summary>AIMandatoryComponents</summary>
        * <details open><summary>HitReactionComponent</summary>
          * HitReactionMechComponent
        * StatusEffectManagerComponent
      * AIPhaseStateEventHandlerComponent
    * AppearanceRandomizerComponent
    * AreaEffectVisualizationComponent
    * BossStealthComponent
    * CombatHUDManager
    * DEBUG\_VisualizerComponent
    * DetectorModuleComponent
    * DeviceConnectionHighlightComponent
    * DeviceDebuggerComponent
    * DeviceTimetable
    * DiodeControlComponent
    * DisarmComponent
    * DisassemblableComponent
    * DrillMachineScanManager
    * DroneComponent
    * DurabilityComponent
    * EntityAttachementComponent
    * Example\_FxSpawning
    * FastTravelComponent
    * FollowSlotsComponent
    * FxResourceMapperComponent
    * <details open><summary>gameAINetStateComponent</summary>
      * NPCStatesComponent
    * GameplayRoleComponent
    * InputDeviceController
    * InspectableObjectComponent
    * InspectionComponent
    * MinotaurMechComponent
    * ObjectMoverComponent
    * OdaComponent
    * PhotoModePlayerEntityComponent
    * PlayerPhone
    * QuickSlotsManager
    * ReactionManagerComponent
    * ResourceLibraryComponent
    * RewireComponent
    * RoyceComponent
    * SampleComponentWithCounter
    * SampleCounterDisplayComponent
    * SasquatchComponent
    * ScannerControlComponent
    * ScavengeComponent
    * SimpleTargetManager
    * StimBroadcasterComponent
    * TankTurretComponent
    * TestScriptableComponent
    * TrapComponent
    * UpdateComponent
    * VendorComponent
    * WeaponPositionComponent
    * WorkspotMapperComponent
  * <details open><summary>gameSquadMemberComponent</summary>
    * SquadMemberBaseComponent
  * gameStatsComponent
  * gameStatusEffectComponent
  * gameVisionModeComponent
  * scnVoicesetComponent
  * vehicleCameraManagerComponent
  * vehicleController
  * vehicleGarageComponent
  * vehiclePersistentData
* gameComponentsStateSaveComponent
* <details open><summary>gameCrowdMemberComponent</summary>
  * CrowdMemberBaseComponent
* [gameDismembermentComponent](./#gamedismembermentcomponent)
* gameDoorComponent
* gameEthnicityComponent
* gameFootstepComponent
* gameHumanoidBody
* gameImpostorComponent
* gameinteractionsReactionComponent
* <details open><summary>gameITriggerDestructionComponent</summary>
  * gameBodyTriggerDestructionComponent
  * gamePuppetTriggerDestructionComponent
* gameLadderComponent
* <details open><summary>gamemountingMountableComponent</summary>
  * gameMovingPlatformMountableComponent
  * gameObjectMountableComponent
  * gamePuppetMountableComponent
  * vehicleVehicleMountableComponent
* gameMultiEcsManagerComponent
* <details open><summary>gameMuppetComponent</summary>
  * gameMuppetBlackboardsComponent
  * gameMuppetInputStates
  * gameMuppetInventory
  * gameMuppetLocomotionComponent
  * gameMuppetPhysicsComponent
  * gameMuppetRawInput
  * gameMuppetStats
  * gameMuppetUpperBodyRequestsComponent
* gameMuppetInputHandlerComponent
* gameNarrationPlateComponent
* gameNetrunnerPrototypeComponent
* gameObjectCarrierComponent
* gamePhantomEntityComponent
* gamePhotoModeBackgroundViewComponent
* gamePhysicalDestructionListenerComponent
* gamePlayerCommandConsumerComponent
* <details open><summary>gamePlayerControlledComponent</summary>
  * gamestateMachineComponent
* gamePlayerMappinComponent
* gamePlayerTierComponent
* gameScanningActivatorComponent
* gameSimpleOccupantSlotSpawner
* gameSourceShootComponent
* gameTargetingActivatorComponent
* gameTargetingLocalizedEffectComponent
* gameTargetShootComponent
* gameTPPRepresentationComponent
* <details open><summary>gameuiICharacterCustomizationComponent</summary>
  * gameuiCharacterCustomizationBrokenNoseController
  * gameuiCharacterCustomizationPersonalLinkController
  * <details open><summary>gameuiICharacterCustomizationBodyController</summary>
    * gameuiCharacterCustomizationBodyController
  * <details open><summary>gameuiICharacterCustomizationBodyPartsController</summary>
    * <details open><summary>gameuiCharacterCustomizationBodyPartsController</summary>
      * gameuiCharacterCustomizationFeetController
      * gameuiCharacterCustomizationGenitalsController
      * gameuiCharacterCustomizationHairstyleController
* gameVisionActivatorComponent
* gameWeakspotComponent
* <details open><summary>moveIMotionPlannerComponent</summary>
  * <details open><summary>moveMotionPlannerComponent</summary>
    * moveDroneMotionPlannerComponent
* movePoliciesComponent
* worldTrafficLightListenerComponent
