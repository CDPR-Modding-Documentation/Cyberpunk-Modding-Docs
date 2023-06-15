# Vehicle Drive Model Data Record

{% code title="Vehicle.VehicleDriveModelDataDefault_4w.tweak" %}
```yaml
groups:
  Vehicle.VehicleDriveModelDataDefault_4w:
    type: VehicleDriveModelData
    members:
      airResistanceFactor:
        type: Float
        value: 0.349999994 
      antiSwaybarDampingScalor:
        type: Float
        value: 1 
      bankBodyFBTanMultiplier:
        type: Float
        value: 0.119999997 
      bankBodyLRTanMultiplier:
        type: Float
        value: 0.119999997 
      bikeCurvesPath:
        type: raRef:CResource
        value: 0 
      bikeMaxTilt:
        type: Float
        value: 0 
      bikeTiltCustomSpeed:
        type: Float
        value: 0 
      bikeTiltPID:
        type: array:Float
        value: [ ]
      bikeTiltReturnSpeed:
        type: Float
        value: 0 
      bikeTiltSpeed:
        type: Float
        value: 0 
      bodyFriction:
        type: Float
        value: 0.600000024 
      brakingFrictionFactor:
        type: Float
        value: 1.39999998 
      burnOutRotationModifier:
        type: Float
        value: 0 
      center_of_mass_offset:
        type: Vector3
        value:
          x: 0
          y: 0
          z: -0.200000003
      chassis_mass:
        type: Float
        value: 1500 
      differentialOvershootFactor:
        type: Float
        value: 0 
      driveHelpers:
        type: array:TweakDBID
        value: [ "Vehicle.VehicleDriveModelDataDefault_4w_inline0", "Vehicle.VehicleDriveModelDataDefault_4w_inline1", "Vehicle.VehicleDriveModelDataDefault_4w_inline2", "Vehicle.VehicleDriveModelDataDefault_4w_inline3" ]
      forwardWeightTransferFactor:
        type: Float
        value: 0.800000012 
      handbrakeBrakingTorque:
        type: Float
        value: 2000 
      lowVelStoppingDeceleration:
        type: Float
        value: 3 
      maxWheelTurnDeg:
        type: Float
        value: 35 
      momentOfInertia:
        type: Vector3
        value:
          x: 0
          y: 0
          z: 0
      momentOfInertiaScale:
        type: Vector3
        value:
          x: 1
          y: 1
          z: 1
      perfectSteeringFactor:
        type: Float
        value: 1 
      rollingResistanceFactor:
        type: Float
        value: 0.00949999969 
      sideWeightTransferFactor:
        type: Float
        value: 0.5 
      slipAngleCurveScale:
        type: Float
        value: 1 
      slipAngleMinSpeedThreshold:
        type: Float
        value: -1 
      slipRatioCurveScale:
        type: Float
        value: 1 
      slipRatioMinSpeedThreshold:
        type: Float
        value: -1 
      slopeTractionReductionBegin:
        type: Float
        value: 12 
      slopeTractionReductionFactor:
        type: Float
        value: 1.5 
      slopeTractionReductionMax:
        type: Float
        value: 30 
      smoothWheelContactDecreaseTime:
        type: Float
        value: 0.0500000007 
      smoothWheelContactIncreseTime:
        type: Float
        value: 0.0500000007 
      tankAcceleration:
        type: Float
        value: 3 
      tankCTOD:
        type: Float
        value: 0 
      tankCTOI:
        type: Float
        value: 0 
      tankCTOP:
        type: Float
        value: 1 
      tankDeceleration:
        type: Float
        value: 1 
      tankGravityMul:
        type: Float
        value: 1 
      tankMaxSpeed:
        type: Float
        value: 20 
      tankSpringDamping:
        type: Float
        value: 5000 
      tankSpringDistance:
        type: Float
        value: 0.600000024 
      tankSpringRadius:
        type: Float
        value: 0.5 
      tankSpringStiffness:
        type: Float
        value: 50000 
      tankSpringVerticalOffset:
        type: Float
        value: 0.800000012 
      tankSpringsLocalPositions:
        type: array:Vector2
        value: [  ]
      tankTurningSpeed:
        type: Float
        value: 100 
      total_mass:
        type: Float
        value: 1300 
      turnUpdateBaseSpeedThreshold:
        type: Float
        value: 10 
      turnUpdateInputDiffForFastChange:
        type: Float
        value: 1 
      turnUpdateInputDiffForSlowChange:
        type: Float
        value: 0 
      turnUpdateInputDiffProgressionPow:
        type: Float
        value: 0.800000012 
      turnUpdateInputFastChangeSpeed:
        type: Float
        value: 1 
      turnUpdateInputSlowChangeSpeed:
        type: Float
        value: 0.100000001 
      turnUpdateMaxSpeedThreshold:
        type: Float
        value: 30 
      turnUpdateMaxSpeedTurnChangeMul:
        type: Float
        value: 1.5 
      turnUpdateMaxSpeedTurnMul:
        type: Float
        value: 0.230000004 
      turningRollFactor:
        type: Float
        value: 0.300000012 
      turningRollFactorWeakContactMul:
        type: Float
        value: 1 
      turningRollFactorWeakContactThresholdMax:
        type: Float
        value: 0.600000024 
      turningRollFactorWeakContactThresholdMin:
        type: Float
        value: 0.899999976 
      useAlternativeTurnUpdate:
        type: Bool
        value: false 
      waterParams:
        type: TweakDBID
        value: "Vehicle.VehicleWaterDefault" 
      wheelSetup:
        type: TweakDBID
        value: "Vehicle.VehicleWheelDrivingSetup_4_AWD" 
      wheelTurnMaxAddPerSecond:
        type: Float
        value: 65 
      wheelTurnMaxSubPerSecond:
        type: Float
        value: 100 
      wheelsFrictionMap:
        type: TweakDBID
        value: "CarDrivingFrictionMap.Default" 
```
{% endcode %}
