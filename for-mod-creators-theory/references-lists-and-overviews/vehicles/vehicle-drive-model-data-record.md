---
description: All the properties that make your car go fast (or slow)
---

# Cheat Sheet: Vehicle Properties

## Summary

**Created:** Jul 9, 2022 by jato\
**Last documented edit:** March 29 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page lists those properties that control how a vehicle behaves. By changing/tweaking them, you can modify a vehicle's behaviour.

N.B. Descriptions of the properties are conclusions of multiple contributors' trial and error process. While the best effort was done to identify and describe completely and accurately what those properties mean and how to work with them, there is no guarantee of it being so.

### Wait, this is not what I want!

* For a guide on **adding** vehicles, see [boe6s-guide-new-car-from-a-to-z](../../../modding-guides/vehicles/boe6s-guide-new-car-from-a-to-z/ "mention")
* For a guide on how to visually change base game vehicles, see [altering-appearances-within-wolvenkit-full-workflow.md](../../../modding-guides/npcs/appearances-change-the-looks/altering-appearances-within-wolvenkit-full-workflow.md "mention") (the process is the same for cars)
* If you want to know how to change an existing car, check [tweak-modding-guides.md](../../tweaks/tweak-modding-guides.md "mention"), for example [adding-stats-and-modifiers.md](../../../modding-guides/items-equipment/editing-existing-items/adding-stats-and-modifiers.md "mention")

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

