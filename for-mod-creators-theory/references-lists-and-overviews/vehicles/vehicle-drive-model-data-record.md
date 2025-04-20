---
description: All the properties that make your car go fast (or slow)
---

# Cheat Sheet: Vehicle Properties

## Summary

This page lists those properties that control how a vehicle behaves. By changing/tweaking them, you can modify a vehicle's behaviour.

Legend:
* An explanation that begins with (?) needs verifying.
* A value range that is filled with a dash '-' indicates that the value either is a ref or boolean, or that the value range is open for experimentation as there are no specific, known limitations.

N.B. Descriptions of the properties are conclusions of multiple contributors' trial and error process. While the best effort was done to identify and describe completely and accurately what those properties mean and how to work with them, there is no guarantee of it being so.

### Wait, this is not what I want!

* For a guide on **adding** vehicles, see [boe6s-guide-new-car-from-a-to-z](../../../modding-guides/vehicles/boe6s-guide-new-car-from-a-to-z/ "mention")
* For a guide on how to visually change base game vehicles, see [altering-appearances-within-wolvenkit-full-workflow.md](../../../modding-guides/npcs/appearances-change-the-looks/altering-appearances-within-wolvenkit-full-workflow.md "mention") (the process is the same for cars)
* If you want to know how to change an existing car, check [tweak-modding-guides.md](../../tweaks/tweak-modding-guides.md "mention"), for example [adding-stats-and-modifiers.md](../../../modding-guides/items-equipment/editing-existing-items/adding-stats-and-modifiers.md "mention")

## Vehicle Records: Performance

The root of vehicle data and information is under the gamedataVehicle_Record, and those entries generally follow the name pattern `Vehicle.{vehicle_name}`. Below is a high-level sketch of the tree of this structure, insofar relevant for the vehicle performance. Here is [the full overview](../../../for-mod-creators-theory/references-lists-and-overviews/vehicles/vehicle-record.md).

<!-- TODO: Revisit, this is not a correct formatting -->
```yaml
groups:
  Vehicle.{name}
    type: gamedataVehicle_Record
    members:
      vehAirControl:
        type: gamedataVehicleAirControl_Record
        members:
          pitch:
            type: TweakDBID
            value: gamedataVehicleAirControlAxis_Record
          roll:
            type: TweakDBID
            value: gamedataVehicleAirControlAxis_Record
          yaw:
            type: TweakDBID
            value: gamedataVehicleAirControlAxis_Record
      vehDriveModelData:
        type: gamedataVehicleDriveModelData_Record
        members:
          burnOut:
            type: gamedataVehicleBurnOut_Record
          driveHelpers:
            type: array:TweakDBID
            value: [ "gamedataDriveWheelsAccelerateNoise_Record", "gamedataDynamicDownforceHelper_Record", "gamedataHandbrakeFrictionModifier_Record", "gamedataInAirGravityModifier_Record", "gamedataRearWheelsFrictionModifier_Record", "gamedataRotationLimiter_Record", "gamedataUphillDriveHelper_Record" ]
          wheelSetup:
            type: TweakDBID
            value: gamedataVehicleWheelDrivingSetup_4_Record
            members:
              backPreset:
                type: TweakDBID
                value: gamedataVehicleWheelDrivingPreset_Record
              frontPreset:
                type: TweakDBID
                value: gamedataVehicleWheelDrivingPreset_Record
              LB:
                type: TweakDBID
                value: gamedataVehicleWheelRole_Record
              LF:
                type: TweakDBID
                value: gamedataVehicleWheelRole_Record
              RB:
                type: TweakDBID
                value: gamedataVehicleWheelRole_Record
              RF:
                type: TweakDBID
                value: gamedataVehicleWheelRole_Record
          wheelsFrictionMap:
            type: type: TweakDBID
            value: gamedataVehicleWheelsFrictionMap_Record
      vehEngineData:
        type: TweakDBID
        value: gamedataVehicleEngineData_Record
     gearCurvesPath:
        type: TweakDBID
        value: TODO
     gears:
        type: array:TweakDBID
        value: ["gamedataVehicleGearRecord"]
```

### gamedataVehicleAirControl_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| anglePID | Vector3 | | |
| flippedOverRecoveryPID | Vector3 | | |
| massReference | float | | |
| pitch | ref | - | |
| roll | ref | - | |
| velocityPID | Vector3 | | |
| yaw | ref | - | |

#### gamedataVehicleAirControlAxis_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| angleCorrectionFactorMax | float | | |
| angleCorrectionFactorMin | float | | |
| angleCorrectionThresholdMax | float | | |
| angleCorrectionThresholdMin | float | | |
| angleDampFactor | float | | |
| brakeMultiplierWhenNoInput | float | | |
| controlAxis | ref | - | |
| inputDampFactor | float | | |
| maxAngleCompensation | float | | |
| maxAngleToCompensateThreshold | float | | |
| maxVelocity | float | | |
| maxVelocityCompensation | float | | |
| stabilizeAxis | boolean | - | |
| velocityDampFactor | float | | |
| velocityDampingFactorMax | float | | |
| velocityDampingFactorMin | float | | |
| velocityDampingThresholdMax | float | | |
| velocityDampingThresholdMin | float | | |
| zeroAngleThreshold | float | | | |

### gamedataVehicleDriveModelData_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| airResistanceFactor | float | -1 to 1 | The coefficient of air resistance against the vehicle when in motion. A higher value means more air resistance. It affects how quickly the car slows down after throttle lift-off. |
| antiSwaybarDampingScalor | float | -1 to 1 | A higher value counteres left-right swaying of the vehicle, resulting in greater stability. A negative number will make the car wobble a lot for the slightest reason! |
| bankBodyFBTanMultiplier | float | | |
| bankBodyLRTanMultiplier | float | | |
| bodyFriction | float |  | The level of friction between the car and objects it touches, such as walls and roads. A higher value means losing more speed on hitting walls but also better grip and car stability on uneven roads. It is one factor of many that affects grip and how the car sticks to the ground. |
| brakingEstimationMagicFactor | float | | |
| brakingFrictionFactor | float | | (?) How "hard" the vehicle brakes |
| burnOut | ref | - | A compound object that describes specific behavior of tyre burnout, e.g. for a race launch. |
| center_of_mass_offset | Vector3 | | (?) Where the center of mass is (relative to the vehicle's spawn point) |
| chassis_mass | float | - | Presumably, the mass of the chassis, in LBS. This value is related with `total_mass`. It makes sense that this value is always &le; `total_maws`, but it is not clear exactly what role does the difference between the two play in the car movemnent. Nonetheless, experiments show a lower car stability at high speeds when these two values are not equal. |
| differentialOvershootFactor | float | | |
| driveHelpers | array | - | An array of vehicle physics modifiers. |
| flatTireSim | ref | - | |
| forwardWeightTransferFactor | float | | |
| handbrakeBrakingTorque | float | | |
| lowVelStoppingDeceleration | float | | |
| maxWheelTurnDeg | float | | Determines the maximum steering angle. |
| momentOfInertia | Vector3 | - | |
| momentOfInertiaScale | Vector3 | - | |
| perfectSteeringFactor | float | | |
| sideWeightTransferFactor | float | | |
| slipAngleCurveScale | float | | |
| slipAngleMinSpeedThreshold | float | | |
| slipRatioCurveScale | float | | |
| slipRatioMinSpeedThreshold | float | | |
| slopeTractionReductionBegin | float | | |
| slopeTractionReductionFactor | float | | |
| slopeTractionReductionMax | float | | |
| smoothWheelContactDecreaseTime | float | | |
| smoothWheelContactIncreseTime | float | | |
| total_mass | float | - | The total mass of the vehicle, in LBS. See `chassis_mass` for a longer explanation and a warning. |
| turnUpdateBaseSpeedThreshold | float | | |
| turnUpdateInputDiffForFastChange | float | | |
| turnUpdateInputDiffForSlowChange | float | | |
| turnUpdateInputDiffProgressionPow | float | | |
| turnUpdateInputFastChangeSpeed | float | | |
| turnUpdateInputSlowChangeSpeed | float | | |
| turnUpdateMaxSpeedThreshold | float | | |
| turnUpdateMaxSpeedTurnChangeMul | float | | |
| turnUpdateMaxSpeedTurnMul | float | | |
| turnUpdateMidSpeedThreshold | float | | |
| turnUpdateMidSpeedTurnChangeMul | float | | |
| turnUpdateMidSpeedTurnMul | float | | |
| turningRollFactor | float | | |
| turningRollFactorWeakContactMul | float | | |
| turningRollFactorWeakContactThresholdMax | float | | |
| turningRollFactorWeakContactThresholdMin | float | | |
| useAlternativeTurnUpdate | boolean | - | |
| waterParams | ref | - | |
| wheelSetup | ref | - | A compound object that contains much of things related with the wheel behavior. |
| wheelTurnMaxAddPerSecond | float | | The maximum speed of steering. |
| wheelTurnMaxSubPerSecond | float | | The maximum speed of the steering wheel/handles returning to the neutral position. |
| wheelsFrictionMap | ref | - | |

In addition to the above, motorcycles (gamedataBikeDriveModelData_Record) also have:

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| bikeCOMOffsetDampFactor | float | | |
| bikeCurvesPath | ref | - | |
| bikeMaxCOMLongOffset | float | | |
| bikeMaxTilt | float | | (?) How far it will tilt in a curve |
| bikeMinCOMLongOffset | float | | |
| bikeTiltCustomSpeed | float | | |
| bikeTiltPID | array:Float | | |
| bikeTiltReturnSpeed | float | | (?) How far it will un-tilt when you go straight again |
| bikeTiltSpeed | float | | (?) How fast it will tilt in a curve |


#### gamedataVehicleBurnOut_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| burnOutGripBonus | float | | |
| gripBonusMaxLaunchSpeed | float | | |
| gripBonusMaxSpeedMultiplier | float | | |
| lateralAccelForwardSpeedMaxDecimation | float | | |
| lateralForceMaxAcceleration | float | | |
| lateralForceMaxSpeed | float | | |
| lateralSlipRatioInfluence | float | | |
| maxBrakeForceModifier | float | | |
| maxDriveWheelSlipRatio | float | | |
| maxLateralAccelSlipRatioMultipler | float | | |
| maxLongFrictionSlipRatioMultipler | float | | |
| maxSpeedToInitiateBurnOut | float | | |
| minBrakeForceModifier | float | | |
| minLongFrictionCoeff | float | | |
| minLongFrictionSlipRatioScaled | float | | |

#### gamedataDriveWheelsAccelerateNoise_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| accelerationBoost | float | | |
| accelerationBoostMaxSpeed | float | | |
| accelerationBoostReverse | float | | |
| accelerationNoiseMaxSpeed | float | | |
| maxApplyTime | float | | |
| maxForcesDifference | float | | |
| minApplyTime | float | &ge; 0 | |
| minForcesDifference | float | | |
| type | ref | - | |

#### gamedataDynamicDownforceHelper_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| maxSpeed | float | | |
| maxSpeedFactorAir | float | | (?) This appears to help car come back to the ground once it separates from it, like aerodynamic downforce. |
| maxSpeedFactorGround | float | | (?) This appears to help the car stick to the ground, like aerodynamic downforce. |
| minSpeed | float | | |
| type | ref | - | |

#### gamedataHandbrakeFrictionModifier_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| additionalBrakeForLongUse | float | | |
| blendOutTime | float | &ge; 0 | |
| postHandbrakeTractionBoost | float | | |
| rearWheelsLatFrictionCoef | float | | |
| rearWheelsLongFrictionCoef | float | | |
| type | ref | - | |

#### gamedataInAirGravityModifier_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| baseAddedGravity | float | | |
| driveSpeedAddedGravity | float | | |
| maxDriveSpeed | float | | |
| minDriveSpeed | float | | |
| smoothingFactor | float | | |
| type | ref | - | |
| zVelReductionEnd | float | | |
| zVelReductionStart | float | | |

#### gamedataRearWheelsFrictionModifier_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| maxHelperAcceleration | float | | |
| maxLatSlipRatio | float | | |
| maxLongSlipRatio | float | | |
| maxSpeed | float | | |
| minLatFrictionCoef | float | | |
| minLatSlipRatio | float | | |
| minLongFrictionCoef | float | | |
| minLongSlipRatio | float | | |
| type | ref | | |

#### gamedataRotationLimiter_Record

This structure seems aimed at drifting characteristics of the vehicle.

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| driftExceededAngle | float | | |
| driftFullAngleBegin | float | | |
| driftFullAngleEnd | float | | |
| driftLimit | float | | |
| driftLimitMaxVel | float | | |
| driftLimitStartVel | float | | |
| handbrakeLimit | float | | |
| maxAngularSpeedRad | float | | |
| smoothingTime | float | | |
| type | ref | | |

#### gamedataUphillDriveHelper_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| slopeCompensationFactor | float | | |
| slopeCompensationMaxAngle | float | | |
| type | ref | | |

#### The .wheelSetup property

This property maps the behavior of the wheels. It has four variables LF, RF, LB, RB that determine the roles of the four wheels, and it also had detailed setups for the wheels under its `.frontPreset` and `.backPreset`.

##### gamedataVehicleWheelDrivingPreset_Record

N.B. Vehicles generally have two instances of this entry, one for the front wheel(s) and one for the back wheel(s).

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| extremeCompressionEventScalor | float | | |
| frictionMulLateral | float | | |
| frictionMulLongitudinal | float | | |
| logicalSuspensionCompressionLength | float | | |
| mass | float | | |
| maxBrakingTorque | float | | |
| springBoundDampingLowRate | float | | |
| springDamping | float | | |
| springDampingHighRateCompression | float | | |
| springDampingLowRateCompression | float | | |
| springReboundDamping | float | | |
| springReboundDampingLowRate | float | | |
| springStiffness | float | | |
| swaybarDisplacementLimit | float | | |
| swaybarLengthScalar | float | | |
| swaybarStiffness | float | | |
| tenderSpringLength | float | | |
| tireFrictionCoef | float | | |
| tireLateralSlipEffectsMul | float | | |
| tireLongitudinalSlipEffectsMul | float | | |
| tireRollingResistanceCoef | float | | |
| visualSuspensionCompressionLength | float | | |
| visualSuspensionDroop | float | | |
| wheelsVerticalOffset | float | | Repositions the vehicles's wheels vertically. A lesser number (including negative) means car body being lower, and vice versa for a higher nimber. Too low vehicle means collisions with bumps on the road that can distrub driving. Too high vehicle may impact its ability to corner. |

##### gamedataVehicleWheelRole_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| isDrive | boolean| - | (?) Does the wheel contribute to the car movemnent. |
| isHandBrake | boolean | - | (?) Will handbrake have an affect on this weel. |
| isMainBrake | boolean | - | (?) Will the main brake have an effect on this wheel. |

<!-- TODO:
#### The .wheelsFrictionMap property

-->

### gamedataVehicleEngineData_Record

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| engineMaxTorque | float |  | Maximum engine torque. A lower value will lead to an engine that has to work harder to move the vehicle, and might be the limiting factor for the vehicle's top speed. A higher value means more engine power, but might cause instability when on throttle. |
| fastR1GearChange | boolean | - | |
| finalGearTorqueDecimationScalor | float | | |
| flyWheelMomentOfInertia | float | | The coefficient of the flywheel interia. A lower value means more ease in gaining or losing speed. Vice versa vor a higher value and a slower gain or decrease of speed. |
| forceReverseRPMToMin | boolean | - | |
| gearChangeCooldown | float | &ge; 0 | The time (in seconds) before another gear change can take place after a gear change. |
| gearChangeTime | float | &ge; 0 | The time (in seconds) that it takes to change a gear. |
| gearCurvesPath | ref | - | |
| gears | array | - | The array with information on each of the vehicle's gears. |
| maxRPM | float | - | Maximum engine RPM. |
| minRPM | float | &ge; 0 | Minimum engine RPM. Beware of this setting in relation with the gears information. If the gear information suggests that a lower RPM is needed to stop the car than minRPM, stopping the car might become a non-straightforward thing. |
| resistanceTorque | float | - | The decrease in torque with during throttle lift-off. A negative number will result in likely unwanted acceleration. Zero will render this effect neutral. |
| reverseDirDelay | float | &ge; 0 | The time (in seconds) it takes to switch from braking to car moving in reverse direction. A lesser value will allow the to start going in reverse sooner, a greater value will make it less likely to inadvertently start moving in reverse. |
| wheelsResistanceRatio | float | | |

#### gamedataVehicleGearRecord

Each of items of this type represent **one** gear of a vehicle. A vehicle will typically have multiple hears. They are stored in its engine data as an array.

| Property | Data Type | Value Range | Meaning |
| :--- | :--- | :--- | :--- |
| maxEngineRPM | float | > 0  |  |
| maxSpeed | float | - |  |
| minEngineRPM | float | &ge; 0 |  |
| minSpeed | float | &ge; 0 |  |
| torqueMultiplier | float | - |  |

## Vehicle.VehicleDriveModelDataDefault\_4w.tweak

<details>

<summary>The tweak file (Vehicle.VehicleDriveModelDataDefault_4w.tweak)</summary>

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



</details>

<!-- TODO: Integrate what can be intergrated from the table below into the table above -->

<table><thead><tr><th width="248.85186767578125">Name</th><th width="147.25927734375">Property type</th><th width="189.4814453125">Default value</th><th>Comment/Explanation</th></tr></thead><tbody><tr><td>airResistanceFactor</td><td>Float</td><td>0.349999994</td><td>The coefficient of air resistance against the vehicle when in motion. A higher value means more air resistance. It affects how quickly the car slows down after throttle lift-off.</td></tr><tr><td>antiSwaybarDampingScalor</td><td>Float</td><td>1</td><td></td></tr><tr><td>bankBodyFBTanMultiplier</td><td>Float</td><td>0.119999997</td><td></td></tr><tr><td>bankBodyLRTanMultiplier</td><td>Float</td><td>0.119999997</td><td></td></tr><tr><td>bikeCurvesPath</td><td>raRef:CResource</td><td>0</td><td>for bikes only</td></tr><tr><td>bikeMaxTilt</td><td>Float</td><td>0</td><td>for bikes only: How far it will tilt in a curve </td></tr><tr><td>bikeTiltCustomSpeed</td><td>Float</td><td>0</td><td>???</td></tr><tr><td>bikeTiltPID</td><td>array:Float</td><td>[ ]</td><td></td></tr><tr><td>bikeTiltReturnSpeed</td><td>Float</td><td>0</td><td>for bikes only: How far it will un-tilt when you go straight again</td></tr><tr><td>bikeTiltSpeed</td><td>Float</td><td>0</td><td>How fast it will tilt in a curve</td></tr><tr><td>bodyFriction</td><td>Float</td><td>0.600000024</td><td> (?) How much the vehicle slows down when you collide with something</td></tr><tr><td>brakingFrictionFactor</td><td>Float</td><td>1.399999</td><td>How "hard" the vehicle brakes</td></tr><tr><td>burnOutRotationModifier</td><td>Float</td><td>0</td><td></td></tr><tr><td>center_of_mass_offset</td><td>Vector3</td><td>x: 0<br>y: 0<br>z: -0.200000003</td><td>Where the center of mass is (relative to the vehicle's spawn point)</td></tr><tr><td>chassis_mass</td><td>Float</td><td>1500</td><td>The total mass of the chassis (see also <code>total_mass</code>)</td></tr><tr><td>differentialOvershootFactor</td><td>Float</td><td>0</td><td></td></tr><tr><td>driveHelpers</td><td>array:TweakDBID</td><td><pre><code>[ 
  "Vehicle.VehicleDriveModelDataDefault_4w_inline0", 
  "Vehicle.VehicleDriveModelDataDefault_4w_inline1", 
  "Vehicle.VehicleDriveModelDataDefault_4w_inline2", 
  "Vehicle.VehicleDriveModelDataDefault_4w_inline3" 
]
      
</code></pre></td><td></td></tr><tr><td>forwardWeightTransferFactor</td><td>Float</td><td>0.800000012</td><td></td></tr><tr><td>handbrakeBrakingTorque</td><td>Float</td><td>2000</td><td></td></tr><tr><td>lowVelStoppingDeceleration</td><td>Float</td><td>3</td><td></td></tr><tr><td>maxWheelTurnDeg</td><td>Float</td><td>35</td><td>How far the wheels can turn (optically)</td></tr><tr><td>momentOfInertia</td><td>Vector3</td><td>x: 0<br>y: 0<br>z: 0</td><td></td></tr><tr><td>momentOfInertiaScale</td><td>Vector3</td><td>x: 0<br>y: 0<br>z: 0</td><td></td></tr><tr><td>perfectSteeringFactor</td><td>Float</td><td>1</td><td></td></tr><tr><td>rollingResistanceFactor</td><td>Float</td><td>0.00949999969</td><td></td></tr><tr><td>sideWeightTransferFactor</td><td>Float</td><td>0.5</td><td></td></tr><tr><td>slipAngleCurveScale</td><td>Float</td><td>1</td><td></td></tr><tr><td>slipAngleMinSpeedThreshold</td><td>Float</td><td>-1</td><td></td></tr><tr><td>slipRatioCurveScale</td><td>Float</td><td>1</td><td></td></tr><tr><td>slipRatioMinSpeedThreshold</td><td>Float</td><td>-1</td><td></td></tr><tr><td>slopeTractionReductionBegin</td><td>Float</td><td>12</td><td></td></tr><tr><td>slopeTractionReductionFactor</td><td>Float</td><td>1.5</td><td></td></tr><tr><td>slopeTractionReductionMax</td><td>Float</td><td>30</td><td></td></tr><tr><td>smoothWheelContactDecreaseTime</td><td>Float</td><td>0.0500000007</td><td></td></tr><tr><td>smoothWheelContactIncreseTime</td><td>Float</td><td>0.0500000007</td><td></td></tr><tr><td>tankAcceleration</td><td>Float</td><td>3</td><td></td></tr><tr><td>tankCTOD</td><td>Float</td><td>0</td><td></td></tr><tr><td>tankCTOI</td><td>Float</td><td>0</td><td></td></tr><tr><td>tankCTOP</td><td>Float</td><td>1</td><td></td></tr><tr><td>tankDeceleration</td><td>Float</td><td>1</td><td></td></tr><tr><td>tankGravityMul</td><td>Float</td><td>1</td><td></td></tr><tr><td>tankMaxSpeed</td><td>Float</td><td>20</td><td></td></tr><tr><td>tankSpringDamping</td><td>Float</td><td>5000</td><td></td></tr><tr><td>tankSpringDistance</td><td>Float</td><td>0.600000024</td><td></td></tr><tr><td>tankSpringRadius</td><td>Float</td><td>0,5</td><td></td></tr><tr><td>tankSpringStiffness</td><td>Float</td><td>50000</td><td></td></tr><tr><td>tankSpringVerticalOffset</td><td>Float</td><td>0.800000012</td><td></td></tr><tr><td>tankSpringsLocalPositions</td><td>array:Vector2</td><td>[ ]</td><td></td></tr><tr><td>tankTurningSpeed</td><td>Float</td><td>100</td><td></td></tr><tr><td>total_mass</td><td>Float</td><td>1300</td><td>Total mass of the vehicle (all of its parts). See also <code>chassis_mass</code></td></tr><tr><td>turnUpdateBaseSpeedThreshold</td><td>Float</td><td>10</td><td></td></tr><tr><td>turnUpdateInputDiffForFastChange</td><td>Float</td><td>1</td><td></td></tr><tr><td>turnUpdateInputDiffForSlowChange</td><td>Float</td><td>0</td><td></td></tr><tr><td>turnUpdateInputDiffProgressionPow</td><td>Float</td><td>0.800000012</td><td></td></tr><tr><td>turnUpdateInputFastChangeSpeed</td><td>Float</td><td>1</td><td></td></tr><tr><td>turnUpdateInputSlowChangeSpeed</td><td>Float</td><td>0.100000001</td><td></td></tr><tr><td>turnUpdateMaxSpeedThreshold</td><td>Float</td><td>30</td><td></td></tr><tr><td>turnUpdateMaxSpeedTurnChangeMul</td><td>Float</td><td>1.5</td><td></td></tr><tr><td>turnUpdateMaxSpeedTurnMul</td><td>Float</td><td>0.230000004</td><td></td></tr><tr><td>turningRollFactor</td><td>Float</td><td>0.300000012</td><td></td></tr><tr><td>turningRollFactorWeakContactMul</td><td>Float</td><td>1</td><td></td></tr><tr><td>turningRollFactorWeakContactThresholdMax</td><td>Float</td><td>0.600000024</td><td></td></tr><tr><td>turningRollFactorWeakContactThresholdMin</td><td>Float</td><td>0.899999976</td><td></td></tr><tr><td>useAlternativeTurnUpdate</td><td>Bool</td><td>false</td><td></td></tr><tr><td>waterParams</td><td>TweakDBID</td><td><pre><code>"Vehicle.VehicleWaterDefault" 
</code></pre></td><td></td></tr><tr><td>wheelSetup</td><td>TweakDBID</td><td><pre><code>"Vehicle.VehicleWheelDrivingSetup_4_AWD" 
</code></pre></td><td></td></tr><tr><td>wheelTurnMaxAddPerSecond</td><td>Float</td><td>65</td><td></td></tr><tr><td>wheelTurnMaxSubPerSecond</td><td>Float</td><td>100</td><td></td></tr><tr><td>wheelsFrictionMap</td><td>TweakDBID</td><td><pre><code>"CarDrivingFrictionMap.Default" 
</code></pre></td><td></td></tr></tbody></table>

## Page History
**Created:** Jul 9, 2022 by jato\
**Intermediate edits:** March 29 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Rework:** in April 2025 by [martine-dee](https://github.com/martine-dee). While this encompasses so much more than the Drive Model, it gives a comprehensive overview in line with the original intent to show 'All the properties that make your car go fast (or slow)'. My strong suggestion is to DO keep this information in one page as a single-stop with all information.