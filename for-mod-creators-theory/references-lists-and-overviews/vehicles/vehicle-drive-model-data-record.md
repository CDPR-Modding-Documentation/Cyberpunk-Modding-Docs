---
description: All the properties that make your car go fast (or slow)
---

# Cheat Sheet: Vehicle Properties

## Summary

This page lists those properties that control how a vehicle behaves. By changing/tweaking them, you can modify a vehicle's behaviour.

Legend:
* An explanation that begins with (?) needs verifying.
* A value range that is filled with a dash '-' indicates either that:
** The value range is open for experimentation as there are no specific, known limitations, or
** That the value range is inferrable, e.g. a boolean or a TweakDBID.
** Unknown fields have a question mark, '?', as content.

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

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| anglePID | Vector3 | - | (1.0, 0.0, 0.0) | |
| flippedOverRecoveryPID | Vector3 | - | (-175.0, 0.0, 0.0) | |
| massReference | float | - | 1600.0 | |
| pitch | TweakDBID | - | ID |  |
| roll | TweakDBID | - | ID | |
| velocityPID | Vector3 | - | (1.0, 0.0, 0.0) | |
| yaw | TweakDBID | - | ID | |

#### gamedataVehicleAirControlAxis_Record

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| angleCorrectionFactorMax | float | - | 0.0 | |
| angleCorrectionFactorMin | float | - | 0.0 | |
| angleCorrectionThresholdMax | float | - | 60.0 | |
| angleCorrectionThresholdMin | float | - | 10.0 | |
| angleDampFactor | float | - | 0.5 | |
| brakeMultiplierWhenNoInput | float | - | 3.0 | |
| controlAxis | ? | - | LR | |
| inputDampFactor | float | - | 1.0 | |
| maxAngleCompensation | float | - | 100.0 | |
| maxAngleToCompensateThreshold | float | - | 100.0 | |
| maxVelocity | float | - | -30.0 | |
| maxVelocityCompensation | float | - | 100.0 | |
| stabilizeAxis | boolean | - | false | |
| velocityDampFactor | float | - | 0.05 | |
| velocityDampingFactorMax | float | - | 0.0 | |
| velocityDampingFactorMin | float | - | 0.0 | |
| velocityDampingThresholdMax | float | - | 6.0 | |
| velocityDampingThresholdMin | float | - | 0.5 | |
| zeroAngleThreshold | float | - | 15.0 | |

### gamedataVehicleDriveModelData_Record

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| airResistanceFactor | float | - | 2.4 | The coefficient of air resistance against the vehicle when in motion. A higher value means more air resistance. It affects how quickly the car slows down after throttle lift-off. |
| antiSwaybarDampingScalor | float | - | 0.75 | A higher value counteres left-right swaying of the vehicle, resulting in greater stability. A negative number will make the car wobble a lot for the slightest reason! |
| bankBodyFBTanMultiplier | float | - | 0.12 | |
| bankBodyLRTanMultiplier | float | - | 0.12 | |
| bodyFriction | float | - | 0.6 | The level of friction between the car and objects it touches, such as walls and roads. A higher value means losing more speed on hitting walls but also better grip and car stability on uneven roads. It is one factor of many that affects grip and how the car sticks to the ground. |
| brakingEstimationMagicFactor | float | - | 0.5 | |
| brakingFrictionFactor | float | - | 1.4 | (?) How "hard" the vehicle brakes |
| burnOut | TweakDBID | - | ID | A compound object that describes specific behavior of tyre burnout, e.g. for a race launch. |
| center_of_mass_offset | Vector3 | - | (0, -0.13, 0.08) | (?) Where the center of mass is (relative to the vehicle's spawn point) |
| chassis_mass | float | - | 1750.0 | Presumably, the mass of the chassis, in LBS. This value is related with `total_mass`. It makes sense that this value is always &le; `total_maws`, but it is not clear exactly what role does the difference between the two play in the car movemnent. Nonetheless, experiments show a lower car stability at high speeds when these two values are not equal. |
| differentialOvershootFactor | float | - | 0.0 | |
| driveHelpers | array of TweakDBIDs | - | An array of vehicle physics modifiers. |
| flatTireSim | TweakDBID | - | ID | |
| forwardWeightTransferFactor | float | - | 0.3 | |
| handbrakeBrakingTorque | float | - | 1600.0 | |
| lowVelStoppingDeceleration | float | - | 0.8 | |
| maxWheelTurnDeg | float | - | 45.0 | Determines the maximum steering angle. |
| momentOfInertia | Vector3 | - | (3050.0, 900.0, 3530.0) | |
| momentOfInertiaScale | Vector3 | - | (1.0, 1.0, 1.0) | |
| perfectSteeringFactor | float | - | 1.0 | |
| sideWeightTransferFactor | float | - | 0.23 | |
| slipAngleCurveScale | float | - | 2.0 | |
| slipAngleMinSpeedThreshold | float | - | 3.0 | |
| slipRatioCurveScale | float | - | 2.0 | |
| slipRatioMinSpeedThreshold | float | - | 5.0 | |
| slopeTractionReductionBegin | float | - | 12.0 | |
| slopeTractionReductionFactor | float | - | 1.5 | |
| slopeTractionReductionMax | float | - | 30.0 | |
| smoothWheelContactDecreaseTime | float | &ge; 0 | 0.0 | |
| smoothWheelContactIncreseTime | float | &ge; 0 | 0.0 | |
| total_mass | float | - | 1750.0 | The total mass of the vehicle, in LBS. See `chassis_mass` for a longer explanation and a warning. |
| turnUpdateBaseSpeedThreshold | float | - | 5.0 | |
| turnUpdateInputDiffForFastChange | float | - | 1.0 | |
| turnUpdateInputDiffForSlowChange | float | - | 0.0 | |
| turnUpdateInputDiffProgressionPow | float | - | 0.7 | |
| turnUpdateInputFastChangeSpeed | float | - | 1.0 | |
| turnUpdateInputSlowChangeSpeed | float | - | 0.15 | |
| turnUpdateMaxSpeedThreshold | float | - | 45.0 | |
| turnUpdateMaxSpeedTurnChangeMul | float | - | 2.15 | |
| turnUpdateMaxSpeedTurnMul | float | - | 0.16 | |
| turnUpdateMidSpeedThreshold | float | - | 25.0 | |
| turnUpdateMidSpeedTurnChangeMul | float | - | 1.58 | |
| turnUpdateMidSpeedTurnMul | float | - | 0.41 | |
| turningRollFactor | float | - | 1.0 | |
| turningRollFactorWeakContactMul | float | - | 1.0 | |
| turningRollFactorWeakContactThresholdMax | float | - | 0.6 | |
| turningRollFactorWeakContactThresholdMin | float | - | 0.9 | |
| useAlternativeTurnUpdate | boolean | - | true | |
| waterParams | TweakDBID | - | ID | | 
| wheelSetup | TweakDBID | - | ID | A compound object that contains much of things related with the wheel behavior. |
| wheelTurnMaxAddPerSecond | float | - | 100.0 | The maximum speed of steering. |
| wheelTurnMaxSubPerSecond | float | - | 130.0 | The maximum speed of the steering wheel/handles returning to the neutral position. |
| wheelsFrictionMap | TweakDBID | - | ID | |

In addition to the above, motorcycles (gamedataBikeDriveModelData_Record) also have:

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| bikeCOMOffsetDampFactor | float | - | 0.25 | |
| bikeCurvesPath | TweakDBID | - | ID | |
| bikeMaxCOMLongOffset | float | - | 0.77 | |
| bikeMaxTilt | float | - | 38.0 | (?) How far it will tilt in a curve |
| bikeMinCOMLongOffset | float | - | 0.87 | |
| bikeTiltCustomSpeed | float | - | 150.0 | |
| bikeTiltPID | array:Float | - | [2.5, 0.2, 0] | |
| bikeTiltReturnSpeed | float | - | 103.0 | (?) How far it will un-tilt when you go straight again |
| bikeTiltSpeed | float | - | 103.0 | (?) How fast it will tilt in a curve |


#### gamedataVehicleBurnOut_Record

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| burnOutGripBonus | float | - | 6.8 | |
| gripBonusMaxLaunchSpeed | float | - | 11.0 | |
| gripBonusMaxSpeedMultiplier | float | - | 1.7 | |
| lateralAccelForwardSpeedMaxDecimation | float | - | 0.65 | |
| lateralForceMaxAcceleration | float | - | 0.4 | |
| lateralForceMaxSpeed | float | - | 6.8 | |
| lateralSlipRatioInfluence | float | - | 0.62 | |
| maxBrakeForceModifier | float | - | 0.8 | |
| maxDriveWheelSlipRatio | float | - | 25.0 | |
| maxLateralAccelSlipRatioMultipler | float | - | 0.64 | |
| maxLongFrictionSlipRatioMultipler | float | - | 0.7 | |
| maxSpeedToInitiateBurnOut | float | - | 27.0 | |
| minBrakeForceModifier | float | - | 0.01 | |
| minLongFrictionCoeff | float | - | 0.66 | |
| minLongFrictionSlipRatioScaled | float | - | 0.1 | |

#### gamedataDriveWheelsAccelerateNoise_Record

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| accelerationBoost | float | - | 0.3 | |
| accelerationBoostMaxSpeed | float | - | 10.0 | |
| accelerationBoostReverse | float | - | 2.0 | |
| accelerationNoiseMaxSpeed | float | - | 12.0 | |
| maxApplyTime | float | - | 1.6 | |
| maxForcesDifference | float | - | 1.0 | |
| minApplyTime | float | &ge; 0 | 0.8 | |
| minForcesDifference | float | - | 1.0 | |
| type | TweakDBID | - | ID | |

#### gamedataDynamicDownforceHelper_Record

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| maxSpeed | float | - | 40.0 | (?) The speed up to which the dynamic downforce graph stretches. Unit: engine's internal. |
| maxSpeedFactorAir | float | - | 0.0 | (?) Scales the effect that helps vehicle come back to the ground once it separates from it, like an aerodynamic downforce. |
| maxSpeedFactorGround | float | - | 0.4 | Scales the effect that enables the vehicle to corner better at high speed while on the ground, an effect similar to an aerodynamic downforce. It could have other effects. |
| minSpeed | float | - | 10.0 | (?) The speed from which the dynamic downforce graph stretches. Unit: engine's internal. |
| type | TweakDBID | - | ID | (?) Is the link to the dynamic force curve data. |

#### gamedataHandbrakeFrictionModifier_Record

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| additionalBrakeForLongUse | float | - | 0.7 | |
| blendOutTime | float | &ge; 0 | 0.6 | |
| postHandbrakeTractionBoost | float | - | 2.0 | |
| rearWheelsLatFrictionCoef | float | - | 0.9 | |
| rearWheelsLongFrictionCoef | float | - | 0.6 | |
| type | TweakDBID | - | ID | |

#### gamedataInAirGravityModifier_Record

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| baseAddedGravity | float | - | 0.4 | |
| driveSpeedAddedGravity | float | - | 0.2 | |
| maxDriveSpeed | float | - | 20.0 | |
| minDriveSpeed | float | - | 3.0 | |
| smoothingFactor | float | - | 0.2 | |
| type | TweakDBID | - | ID | |
| zVelReductionEnd | float | - | -10.0 | |
| zVelReductionStart | float | - | -4.0 | |

#### gamedataRearWheelsFrictionModifier_Record

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| maxHelperAcceleration | float | - | 10.0 | |
| maxLatSlipRatio | float | - | 5.0 | |
| maxLongSlipRatio | float | - | 1.5 | |
| maxSpeed | float | - | 18.0 | |
| minLatFrictionCoef | float | - | 0.62 | |
| minLatSlipRatio | float | - | 0.25 | |
| minLongFrictionCoef | float | - | 0.8 | |
| minLongSlipRatio | float | - | 0.3 | |
| type | TweakDBID | - | ID | |

#### gamedataRotationLimiter_Record

This structure seems aimed at drifting characteristics of the vehicle.

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| driftExceededAngle | float | - | 60.0 | |
| driftFullAngleBegin | float | - | 20.0 | |
| driftFullAngleEnd | float | - | 40.0 | |
| driftLimit | float | - | 2.3 | |
| driftLimitMaxVel | float | - | 18.0 | |
| driftLimitStartVel | float | - | 8.0 | |
| handbrakeLimit | float | - | 2.49 | |
| maxAngularSpeedRad | float | - | 2.6 | |
| smoothingTime | float | - | 0.2 | |
| type | TweakDBID | - | ID | |

#### gamedataUphillDriveHelper_Record

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| slopeCompensationFactor | float | - | 0.5 | |
| slopeCompensationMaxAngle | float | - | 20.0 | |
| type | TweakDBID | - | ID | |

#### The .wheelSetup property

This property maps the behavior of the wheels. It has four variables LF, RF, LB, RB that determine the roles of the four wheels, and it also had detailed setups for the wheels under its `.frontPreset` and `.backPreset`.

##### gamedataVehicleWheelDrivingPreset_Record

N.B. Vehicles generally have two instances of this entry, one for the front wheel(s) and one for the back wheel(s).

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| extremeCompressionEventScalor | float | - | 0.46 | |
| frictionMulLateral | float | - | 0.94 | The lateral (along the left-right axis) friction between the tyres and the road. You can experiment with different values for the front and the back set of tires, but beware that it can increase the vehicle's proneness to spins. |
| frictionMulLongitudinal | float | - | 0.94 | The longitudinal (along the front-back axis) friction between the tyres and the road. You can experiment with different values for the front and the back set of tires, but beware that it can increase the vehicle's proneness to spins. |
| logicalSuspensionCompressionLength | float | - | 0.56 | |
| mass | float | - | 23.0 | |
| maxBrakingTorque | float | - | 720.0 | Contributes to stronger braking. A higher value here means quicker braking. You will notice it on the braking distance growing shorter as this values gets higher. |
| springBoundDampingLowRate | float | - | 2200.0 | |
| springDamping | float | - | 4100.0 | |
| springDampingHighRateCompression | float | - | 0.3 | |
| springDampingLowRateCompression | float | - | 0.2 | |
| springReboundDamping | float | - | 3900.0 | |
| springReboundDampingLowRate | float | - | 2300.0 | |
| springStiffness | float | - | 21.0 | |
| swaybarDisplacementLimit | float | - | 0.14 | |
| swaybarLengthScalar | float | - | 2.3 | |
| swaybarStiffness | float | - | 29.0 | |
| tenderSpringLength | float | - | 0.0 | |
| tireFrictionCoef | float | - | 1.0 | |
| tireLateralSlipEffectsMul | float | - | 1.46 | |
| tireLongitudinalSlipEffectsMul | float | - | 1.3 | |
| tireRollingResistanceCoef | float | - | 0.002 | |
| visualSuspensionCompressionLength | float | - | 0.04 | |
| visualSuspensionDroop | float | - | 0.14 | |
| wheelsVerticalOffset | float | - | 0.02 | Repositions the vehicles's wheels vertically. A lesser number (including negative) means the vehicle's body is lower, and vice versa for a higher number. Too low a vehicle means collisions with bumps on the road that can disturb driving. A too-high vehicle may impact its ability to corner. You can try combining this with the downforce parameters for a higher vehicle that is more maneuverable than otherwise. |

##### gamedataVehicleWheelRole_Record

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| isDrive | boolean| - | true | (?) Does the wheel contribute to the car movemnent. |
| isHandBrake | boolean | - | false | (?) Will handbrake have an affect on this weel. |
| isMainBrake | boolean | - | true | (?) Will the main brake have an effect on this wheel. |

<!-- TODO:
#### The .wheelsFrictionMap property

-->

### gamedataVehicleEngineData_Record

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| engineMaxTorque | float | - | 700.0 | Maximum engine torque. A lower value will lead to an engine that has to work harder to move the vehicle, and might be the limiting factor for the vehicle's top speed. A higher value means more engine power, but might cause instability when on throttle. |
| fastR1GearChange | boolean | - | true | |
| finalGearTorqueDecimationScalor | float | - | 1.0 | |
| flyWheelMomentOfInertia | float | - | 0.3 | The coefficient of the flywheel interia. A lower value means more ease in gaining or losing speed. Vice versa vor a higher value and a slower gain or decrease of speed. |
| forceReverseRPMToMin | boolean | - | false | |
| gearChangeCooldown | float | &ge; 0 | 0.3 | The time (in seconds) before another gear change can take place after a gear change. |
| gearChangeTime | float | &ge; 0 | 0.22 | The time (in seconds) that it takes to change a gear. |
| gearCurvesPath | TweakDBID | - | ID | |
| gears | array | - | | The array with information on each of the vehicle's gears. |
| maxRPM | float | - | 7100.0 | Maximum engine RPM. |
| minRPM | float | &ge; 0 | 800.0 | Minimum engine RPM. Beware of this setting in relation with the gears information. If the gear information suggests that a lower RPM is needed to stop the car than minRPM, stopping the car might become a non-straightforward thing. |
| resistanceTorque | float | - | 100.0 | The decrease in torque with during throttle lift-off. A negative number will result in likely unwanted acceleration. Zero will render this effect neutral. |
| reverseDirDelay | float | &ge; 0 | 0.3 | The time (in seconds) it takes to switch from braking to car moving in reverse direction. A lesser value will allow the to start going in reverse sooner, a greater value will make it less likely to inadvertently start moving in reverse. |
| wheelsResistanceRatio | float | - | 15.0 | |

#### gamedataVehicleGearRecord

Each of items of this type represent **one** gear of a vehicle. A vehicle will typically have multiple hears. They are stored in its engine data as an array.

| Property | Data Type | Value Range | Sample Value  | Meaning |
| :--- | :--- | :--- | :--- | :--- |
| maxEngineRPM | float | > 0 | 5200.0 |  |
| maxSpeed | float | - | 10.0 |  |
| minEngineRPM | float | &ge; 0 | 800.0 |  |
| minSpeed | float | &ge; 0 | 0.0 |  |
| torqueMultiplier | float | - | 1.0 |  |

## Page History
**Created:** Jul 9, 2022 by jato\
**Intermediate edits:** March 29 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Rework:** in April 2025 by [martine-dee](https://github.com/martine-dee). While this encompasses so much more than the Drive Model, it gives a comprehensive overview in line with the original intent to show 'All the properties that make your car go fast (or slow)'. My strong suggestion is to DO keep this information in one page as a single-stop with all information.