# Vehicle Record

This is the main vehicle record in TweakDB, referenced from `VehicleObject` in the game, that references all the other vehicle-related records. Below is the .tweak vehicle template (that's also in the TweakDB) that you can customize for creating your own vehicle. The name `Vehicle.vehicle_template` near the top will need to be customized to your vehicle name.

[`entityTemplatePath`](../archive/.ent-file-ententitytemplate.md) is an important field here, because this is the file that ties our record to the resource files needed for rendering.

{% code title="Vehicle.vehicle_template.tweak" %}
```yaml
groups:
  Vehicle.vehicle_template:
    type: Vehicle
    members:
      affiliation:
          type: TweakDBID
          value: "Factions.Unaffiliated" 
      appearanceName:
          type: CName
          value: "None" 
      archetypeName:
          type: CName
          value: "vehicle" 
      attachmentSlots:
          type: array:TweakDBID
          value: [ "AttachmentSlots.Engine1", "AttachmentSlots.Engine2", "AttachmentSlots.Engine3", "AttachmentSlots.Engine4" ]
      audioResourceName:
          type: CName
          value: "None" 
      brakelightColor:
          type: array:Int32
          value: [ ]
      cameraManagerParams:
          type: TweakDBID
          value: "Camera.VehicleCameraManager_Default" 
      crackLockDifficulty:
          type: String
          value: "HARD" 
      crowdMemberSettings:
          type: TweakDBID
          value: "Crowds.DefaultCarPackage" 
      curvesPath:
          type: raRef:CResource
          value: "base\\gameplay\\curves\\vehicle\\vehicle_ui.curveset"
      destroyedAppearance:
          type: CName
          value: "None" 
      destruction:
          type: TweakDBID
          value: "Vehicle.VehicleDestructionParamsDefault_4w" 
      displayName:
          type: gamedataLocKeyWrapper
          value: 0 
      driving:
          type: TweakDBID
          value: "Driving.Default_4w" 
      effectors:
          type: array:TweakDBID
          value: [ ]
      enableDestruction:
          type: Bool
          value: false 
      entityTemplatePath:
          type: raRef:CResource
          value: "base\\vehicles\\common\\gameplay\\vehicle_template.ent" 
      fxCollision:
          type: TweakDBID
          value: "Vehicle.FxCollision_Default" 
      fxWheelsDecals:
          type: TweakDBID
          value: "Vehicle.FxWheelsDecals_Default" 
      fxWheelsParticles:
          type: TweakDBID
          value: "Vehicle.FxWheelsParticles_Default" 
      headlightColor:
          type: array:Int32
          value: [ ]
      hijackDifficulty:
          type: String
          value: "HARD" 
      icon:
          type: TweakDBID
          value: "UIIcon.ItemIcon" 
      interiorColor:
          type: array:Int32
          value: [ ]
      interiorDamageColor:
          type: array:Int32
          value: [ ]
      leftBackCamber:
          type: Float
          value: 0 
      leftBackCamberOffset:
          type: Vector3
          value:
            x: 0
            y: 0
            z: 0 
      leftBlinkerlightColor:
          type: array:Int32
          value: [ ]
      leftFrontCamber:
          type: Float
          value: 0 
      leftFrontCamberOffset:
          type: Vector3
          value: 
            x: 0
            y: 0
            z: 0 
      manufacturer:
          type: TweakDBID
          value: "" 
      model:
          type: TweakDBID
          value: "Vehicle.Turbo" 
      multiplayerTemplatePaths:
          type: array:raRef:CResource
          value: [ ]
      objectActions:
          type: array:TweakDBID
          value: [ "VehicleActions.VehicleHijackFrontLeft", "VehicleActions.VehicleHijackFrontRight", "VehicleActions.VehicleMountFrontLeft", "VehicleActions.VehicleMountFrontRight", "VehicleActions.VehicleMountBackLeft", "VehicleActions.VehicleMountBackRight", "VehicleActions.VehicleCrackLockFrontLeft", "VehicleActions.VehicleCrackLockFrontRight" ]
      persistentName:
          type: CName
          value: "None" 
      player_audio_resource:
          type: String
          value: "" 
      priority:
          type: TweakDBID
          value: "SpawnableObjectPriority.Regular" 
      queryOnlyExceptions:
          type: array:CName
          value: [ "trunk_a", "trunk_b", "hood_a", "door_fl_a", "door_fr_a", "door_bl_a", "door_br_a", "door_a_hidable", "door_b_hidable", "door_a", "door_b", "door_c", "door_front_right", "door_back_right", "door_front_left", "door_back_left", "av_zetatech_valgus__ext01_door_fl_01", "av_zetatech_valgus__ext01_door_fr_01", "av_militech_basilisk__ext01_turret_b", "body_transport", "av_militech_basilisk__ext01_canopy_a", "av_militech_basilisk__ext01_canopy_b", "av_militech_basilisk__ext01_turret_a", "av_militech_basilisk__ext01_body_kit_nomad", "wing_right_nomad", "wing_left_nomad", "wing_left_nomad", "seat_a_01", "seat_a_02", "seat_b_01", "seat_b_02", "seat_c_01", "seat_c_02", "seat_d_01", "seat_d_02", "seat_e_01", "seat_e_02", "seat_a_03", "seat_a_04", "seat_b_03", "seat_b_04", "seat_c_03", "seat_c_014", "seat_d_03", "seat_d_04", "seat_e_03", "seat_e_04", "av_zetatech_surveyor__int01_jumpseat_02", "av_zetatech_surveyor__int01_jumpseat_5657", "av_zetatech_surveyor__int01_jumpseat_5537", "av_zetatech_surveyor__int01_jumpseat_8866", "av_zetatech_surveyor__int01_jumpseat_01", "av_zetatech_surveyor__int01_jumpseat_5331", "av_zetatech_surveyor__int01_jumpseat_7123", "av_zetatech_surveyor__int01_jumpseat_1477", "deathrace_spoiler_01", "av_zetatech_valgus__ext01_landinggear_back_01", "av_zetatech_valgus__ext01_propeller_01", "av_zetatech_valgus__ext01_propeller_02", "v_common_suitcase_01", "jammer_antenna_01", "v_standard25_villefort_columbus__ext01_jammer_top_gear_01", "av_zetatech_surveyor__ext01_missilelauncher_l_01", "av_zetatech_surveyor__ext01_missilelauncher_r_01" ]
      randomPassengers:
          type: array:TweakDBID
          value: [ "Passengers.GenericDriverEntry", "Passengers.GenericPassengerEntry" ]
      reverselightColor:
          type: array:Int32
          value: [ ]
      rightBLinkerlightColor:
          type: array:Int32
          value: [ ]
      rightBackCamber:
          type: Float
          value: 0 
      rightBackCamberOffset:
          type: Vector3
          value: 
            x: 0
            y: 0
            z: 0 
      rightFrontCamber:
          type: Float
          value: 0 
      rightFrontCamberOffset:
          type: Vector3
          value: 
            x: 0
            y: 0
            z: 0 
      savable:
          type: Bool
          value: false 
      statModifierGroups:
          type: array:TweakDBID
          value: [ "VehicleStatPreset.BaseCar" ]
      statModifiers:
          type: array:TweakDBID
          value: [ ]
      statPools:
          type: array:TweakDBID
          value: [ "BaseStatPools.VehicleHealth" ]
      tags:
          type: array:CName
          value: [ "InteractiveTrunk" ]
      tppCameraParams:
          type: TweakDBID
          value: "Camera.VehicleTPP_DefaultParams" 
      tppCameraPresets:
          type: array:TweakDBID
          value: [ "Camera.VehicleTPP_4w_Preset_Low_Close", "Camera.VehicleTPP_4w_Preset_High_Close", "Camera.VehicleTPP_4w_Preset_Low_Far", "Camera.VehicleTPP_4w_Preset_High_Far" ]
      traffic_audio_resource:
          type: String
          value: "" 
      type:
          type: TweakDBID
          value: "Vehicle.Car" 
      unmountOffsetPosition:
          type: Vector3
          value: 
              x: 1.64999998
              y: 5
              z: 2.5 
      vehAirControl:
          type: TweakDBID
          value: "Vehicle.VehicleAirControlCar" 
      vehAirControlAI:
          type: TweakDBID
          value: "Vehicle.VehicleAirControlCarAI" 
      vehBehaviorData:
          type: TweakDBID
          value: "" 
      vehDataPackage:
          type: TweakDBID
          value: "Vehicle.VehicleDataPackageDefault" 
      vehDefaultState:
          type: TweakDBID
          value: "Vehicle.Veh4WDefaultState" 
      vehDriveModelData:
          type: TweakDBID
          value: "Vehicle.VehicleDriveModelDataDefault_4w" 
      vehDriveModelDataAI:
          type: TweakDBID
          value: "" 
      vehDriverCombat_FPPCameraParams:
          type: TweakDBID
          value: "Vehicle.VehicleDriverCombatFPPCameraParamsDefault" 
      vehDriverCombat_ProceduralFPPCameraParams:
          type: TweakDBID
          value: "Camera.VehicleProceduralFPPCamera_DefaultCombatParams" 
      vehDriver_FPPCameraParams:
          type: TweakDBID
          value: "Vehicle.VehicleDriverFPPCameraParamsDefault" 
      vehDriver_ProceduralFPPCameraParams:
          type: TweakDBID
          value: "Camera.VehicleProceduralFPPCamera_DefaultParams" 
      vehEngineData:
          type: TweakDBID
          value: "Vehicle.VehicleEngineData_4_Default" 
      vehImpactTraffic:
          type: TweakDBID
          value: "Driving.VehicleImpactTraffic_DefaultParams" 
      vehPassCombatL_FPPCameraParams:
          type: TweakDBID
          value: "Vehicle.VehiclePassengerLCombatFPPCameraParamsDefault" 
      vehPassCombatL_ProceduralFPPCameraParams:
          type: TweakDBID
          value: "Camera.VehicleProceduralFPPCamera_DefaultCombatParams" 
      vehPassCombatR_FPPCameraParams:
          type: TweakDBID
          value: "Vehicle.VehiclePassengerRCombatFPPCameraParamsDefault" 
      vehPassCombatR_ProceduralFPPCameraParams:
          type: TweakDBID
          value: "Camera.VehicleProceduralFPPCamera_DefaultCombatParams" 
      vehPassL_FPPCameraParams:
          type: TweakDBID
          value: "Vehicle.VehiclePassengerLFPPCameraParamsDefault" 
      vehPassL_ProceduralFPPCameraParams:
          type: TweakDBID
          value: "Camera.VehicleProceduralFPPCamera_DefaultParams" 
      vehPassR_FPPCameraParams:
          type: TweakDBID
          value: "Vehicle.VehiclePassengerRFPPCameraParamsDefault" 
      vehPassR_ProceduralFPPCameraParams:
          type: TweakDBID
          value: "Camera.VehicleProceduralFPPCamera_DefaultParams" 
      vehWheelDimensionsSetup:
          type: TweakDBID
          value: "Vehicle.VehicleWheelDimensionsSetup_Default" 
      vehicleUIData:
          type: TweakDBID
          value: "Vehicle.VehicleDefaultUIData" 
      visualDestruction:
          type: TweakDBID
          value: "Vehicle.VehicleVisualDestructionParamsDefault" 
      visualTags:
          type: array:CName
          value: [ ]
      weakspots:
          type: array:TweakDBID
          value: [ ]
      weapons:
          type: array:TweakDBID
          value: [ ]
      widgetStyleSheetPath:
          type: raRef:CResource
          value: 0
```
{% endcode %}
