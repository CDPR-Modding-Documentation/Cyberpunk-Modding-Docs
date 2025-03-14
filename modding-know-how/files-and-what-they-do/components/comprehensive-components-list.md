---
description: Hierarchy of WolvenKit.RED4.Types.entIComponent
---

# Comprehensive Component Hierarchy List

{% hint style="info" %}
Full list of components, organized by hierarchy, useful for researching and documenting new components. For a json dump of all existing components and their properties, check [DrPresto's github repository.](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/lists/entComponent\_types.json)

For a hands-on guide on how to safely change components in .app files, look [here](../../../for-mod-creators/modding-guides/npcs/appearances-change-the-looks.md#safely-adding-components).
{% endhint %}

{% hint style="info" %}
If you decide to document a component, make a new expandable entry on on the [Documented Components](../../../for-mod-creators/files-and-what-they-do/components/documented-components.md) page, followed by the discovered behavior and usage and link back to that in this list.
{% endhint %}

* AIObjectSelectionComponent
* AIOffMeshConnectionComponent
* AISignalHandlerComponent
* entAnimationControllerComponent
* entAnimationSetupExtensionComponent
* entAnimGraphResourceContainer
* entEffectAttachmentComponent
* entExternalComponent
  * entMorphTargetManagerComponent
* entFacialCustomizationComponent
* entIMoverComponent
  * gameRootTransformAnimatorComponent
  * moveComponent
* entIPlacedComponent
  * entAmbientSoundEmitterComponent
  * entBaseCameraComponent
    * entRenderToTextureCameraComponent
      * gameuiHolocallCameraComponent
    * entVirtualCameraComponent
    * gameCameraComponent
      * gameFPPCameraComponent
      * gameFreeCameraComponent
      * gameScreenshot360CameraComponent
      * gameTPPCameraComponent
      * vehicleTPPCameraComponent
      * vehicleVehicleProxyBlendCamera
    * gamePhotoModeBackgroundCameraComponent
    * gameWorldSpaceBlendCamera
  * [entColliderComponent](../../../for-mod-creators/files-and-what-they-do/components/documented-components.md#entcollidercomponent)
  * entDynamicActorRepellingComponent
  * entISkinableComponent
    * [entAnimatedComponent](../../../for-mod-creators/files-and-what-they-do/components/documented-components.md#entanimatedcomponent)
    * entCorpseComponent
    * entInstancedAnimationComponent
  * entIVisualComponent
    * cpConveyorComponent
    * entClothComponent
    * entDebug\_ShapeComponent
    * entDecalComponent
    * entEffectSpawnerComponent
    * entEnvProbeComponent
    * entFogVolumeComponent
    * entISkinTargetComponent
      * entMorphTargetSkinnedMeshComponent
      * [entSkinnedClothComponent](../../../for-mod-creators/files-and-what-they-do/components/documented-components.md#entskinnedclothcomponent)
      * [entSkinnedMeshComponent](../../../for-mod-creators/files-and-what-they-do/components/documented-components.md#entskinnedmeshcomponent)
        * entCharacterCustomizationSkinnedMeshComponent
        * [entGarmentSkinnedMeshComponent](../../../for-mod-creators/files-and-what-they-do/components/documented-components.md#entgarmentskinnedmeshcomponent)
        * entPhysicalSkinnedMeshComponent
    * entLightBlockingComponent
    * entLightChannelComponent
    * entLightComponent
      * cpGameplayLightComponent
      * gameLightComponent
        * vehicleLightComponent
    * entMeshComponent
      * entDebug\_MeshComponent
      * entEditorMeshComponent
      * entPhysicalMeshComponent
        * entAppearanceProxyMeshComponent
        * entBakedDestructionComponent
      * HudMeshComponent
    * entParticlesComponent
    * entPhysicalDestructionComponent
    * entVectorFieldComponent
    * entVirtualCameraViewComponent
      * ScriptableVirtualCameraViewComponent
    * gameBinkComponent
  * entMarketingAnimationComponent
  * entPhysicalTriggerComponent
    * entPhysicalImpulseAreaComponent
    * entTriggerComponent
  * entPlaceholderComponent
  * entSimpleColliderComponent
  * entSlotComponent
    * gameHitRepresentationComponent
    * gameOccupantSlotComponent
  * entSoundListenerComponent
  * entStaticOccluderMeshComponent
  * entTargetPointComponent
  * entTransformComponent
    * entVisualOffsetTransformComponent
  * entTriggerActivatorComponent
  * gameaudioAcousticPortalComponent
  * gameAudioEmitterComponent
  * gameaudioSoundComponentBase
    * gameaudioSoundComponent
    * gameaudioVehicleAudioComponent
    * gameWeaponAudioComponent
  * gameEntityStubComponentPlacedProxy
  * gameEnvironmentDamageReceiverComponent
  * gameinfluenceBumpComponent
  * gameinfluenceComponent
  * gameinfluenceHeatAgentComponent
  * gameinfluenceObstacleComponent
  * [gameinteractionsComponent](../../../for-mod-creators/files-and-what-they-do/components/documented-components.md#gameinteractionscomponent)
  * gamemappinsMappinComponent
  * gameMovingPlatform
  * gameNavmeshDetector
  * gamePingComponent
  * gameprojectileComponent
  * gameprojectileSpawnComponent
  * gameStaticAreaShapeComponent
    * gameStaticTriggerAreaComponent
  * [gameTargetingComponent](../../../for-mod-creators/files-and-what-they-do/components/documented-components.md#gametargetingcomponent)
  * gameTransformAnimatorComponent
  * mpInteractionActivatorComponent
  * senseComponent
  * senseSensorObjectComponent
  * senseVisibleObjectComponent
  * vehicleChassisComponent
  * WidgetBaseComponent
    * IWorldWidgetComponent
      * AdvertisementWidgetComponent
      * StreetSignWidgetComponent
      * WorldWidgetComponent
    * WidgetHudComponentInterface
      * WidgetHudComponent
    * WidgetMenuComponentInterface
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
* gameComponent
  * AICAgent
    * AIHumanComponent
    * AIVehicleAgent
  * AITargetTrackerComponent
    * TargetTrackingExtension
  * cpTestComponent
  * ElevatorController
  * EntityStubComponent
  * gameAttitudeAgent
  * gameDeviceCameraControlComponent
  * gameDeviceComponent
    * PSD\_Detector
    * PSD\_Master
    * ScriptableDeviceComponent
      * ActionsSequencerController
      * ActivatedDeviceController
        * BarbedWireController
      * ActivatedDeviceNPCController
      * AlarmLightController
      * AOEEffectorController
      * ArcadeMachineController
        * PachinkoMachineController
      * BaseAnimatedDeviceController
        * MainframeController
        * RetractableAdController
        * SlidingLadderController
      * BaseDestructibleController
      * BasicDistractionDeviceController
        * BlindingLightController
          * ReflectorController
        * CleaningMachineController
        * ConfessionBoothController
        * ExplosiveDeviceController
          * C4Controller
          * ExplosiveTriggerDeviceController
          * SensorDeviceController
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
      * DoorController
        * MovableWallScreenController
        * WindowController
      * DoorProximityDetectorController
      * DropPointController
      * ElectricLightController
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
      * LcdScreenController
        * ApartmentScreenController
      * MasterController
        * AccessPointController
        * ActivatorController
        * AOEAreaController
        * BaseNetworkSystemController
          * DoorSystemController
        * DestructibleMasterDeviceController
          * DestructibleMasterLightController
        * DeviceSystemBaseController
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
        * TerminalController
          * ComputerController
            * SmartWindowController
          * ElevatorFloorTerminalController
        * TrafficIntersectionManagerController
        * VentilationAreaController
      * MediaDeviceController
        * HoloTableController
        * RadioController
        * TVController
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
      * TrafficLightController
        * CrossingLightController
        * TrafficZebraController
      * VehicleComponent
        * AVComponent
        * CarComponent
        * MotorcycleComponent
      * VendingMachineController
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
  * [gameScanningComponent](../../../for-mod-creators/files-and-what-they-do/components/documented-components.md#gamescanningcomponent)
  * gameScriptableComponent
    * AdamSmasherComponent
    * AIRelatedComponents
      * AICustomComponents
        * CentaurShieldController
      * AIMandatoryComponents
        * HitReactionComponent
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
    * gameAINetStateComponent
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
  * gameSquadMemberComponent
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
* gameCrowdMemberComponent
  * CrowdMemberBaseComponent
* [gameDismembermentComponent](../../../for-mod-creators/files-and-what-they-do/components/documented-components.md#gamedismembermentcomponent)
* gameDoorComponent
* gameEthnicityComponent
* gameFootstepComponent
* gameHumanoidBody
* gameImpostorComponent
* gameinteractionsReactionComponent
* gameITriggerDestructionComponent
  * gameBodyTriggerDestructionComponent
  * gamePuppetTriggerDestructionComponent
* gameLadderComponent
* gamemountingMountableComponent
  * gameMovingPlatformMountableComponent
  * gameObjectMountableComponent
  * gamePuppetMountableComponent
  * vehicleVehicleMountableComponent
* gameMultiEcsManagerComponent
* gameMuppetComponent
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
* gamePlayerControlledComponent
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
* gameuiICharacterCustomizationComponent
  * gameuiCharacterCustomizationBrokenNoseController
  * gameuiCharacterCustomizationPersonalLinkController
  * gameuiICharacterCustomizationBodyController
    * gameuiCharacterCustomizationBodyController
  * gameuiICharacterCustomizationBodyPartsController
    * gameuiCharacterCustomizationBodyPartsController
      * gameuiCharacterCustomizationFeetController
      * gameuiCharacterCustomizationGenitalsController
      * gameuiCharacterCustomizationHairstyleController
* gameVisionActivatorComponent
* gameWeakspotComponent
* moveIMotionPlannerComponent
  * moveMotionPlannerComponent
    * moveDroneMotionPlannerComponent
* movePoliciesComponent
* worldTrafficLightListenerComponent
