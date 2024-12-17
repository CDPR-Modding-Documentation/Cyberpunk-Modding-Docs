---
description: Cheat Sheets for poses and animations
---

# Cheat Sheet: Poses/Animations

## Summary

**Published**: Apr 27 2024 by [Grovac](https://app.gitbook.com/u/Ne54NDwXrgYY0CMvu8DUHptw0Ou2 "mention"), based on research by [Apart](https://app.gitbook.com/u/M4VsHKJyn3PakV5tOmAF87H61wh2 "mention")\
**Last documented update**: Dec 17 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

## AcceptedWeaponConfig

You can use this to spawn [poses with props](../../../modding-guides/animations/animations/archivexl-adding-photo-mode-poses.md#spawning-props-with-the-pose).

```
POSE_WEAPON_ASSAULTRIFLE
POSE_WEAPON_HANDGUN
POSE_WEAPON_LMG
POSE_WEAPON_PRECISIONRIFLE
POSE_WEAPON_REVOLVER
POSE_WEAPON_SHOTGUN
POSE_WEAPON_SHOTGUNDUAL
POSE_WEAPON_SMG
POSE_WEAPON_SNIPERRIFLE
POSE_WEAPON_HAMMER
POSE_WEAPON_HMG
POSE_WEAPON_KATANA
POSE_WEAPON_KNIFE
POSE_WEAPON_ONEHANDED
POSE_WEAPON_TWOHANDED
POSE_PHONE
POSE_CIGARETTE
POSE_POPCORN
POSE_GUITAR
POSE_MICROPHONE_RIGHT
POSE_MICROPHONE_LEFT
POSE_WEAPON_FISTS
```

## poseStateConfig

You can use this to [limit pose availability](../../../modding-guides/animations/animations/archivexl-adding-photo-mode-poses.md#pose-conditions-optional).

{% hint style="warning" %}
Adding a `poseStateConfig` will cause your pose to be **hidden** in other circumstances. This might confuse users and lead to bug reports, so use it sparingly.
{% endhint %}

Unless indicated otherwise, none of the pose states below are available when swimming.

|                                     |                                                                        |
| ----------------------------------- | ---------------------------------------------------------------------- |
| POSE\_STATE\_GROUND                 | Can only be used while standing on a surface.                          |
| POSE\_STATE\_GROUND\_CROUCH         | Can only be used while crouching on a surface.                         |
| POSE\_STATE\_AIR                    | Can only be used while in mid-air.                                     |
| POSE\_STATE\_GROUND\_AIR            | Can only be used while on a surface or while in mid-air.               |
| POSE\_STATE\_GROUND\_WALK           | Can only be used while walking on a surface.                           |
| POSE\_STATE\_GROUND\_SPRINT         | Can only be used while sprinting on a surface.                         |
| POSE\_STATE\_GROUND\_ACTION         | Can only be used while in combat on a surface.                         |
| POSE\_STATE\_SWIMMING               | Can only be used while swimming.                                       |
| POSE\_STATE\_SWIMMING\_MOVING       | Can only be used while swimming and moving.                            |
| POSE\_STATE\_CAR                    | Can only be used while driving a car.                                  |
| POSE\_STATE\_BIKE                   | Can only be used while riding a motorcycle.                            |
| POSE\_STATE\_LADDER                 | Unused / no effect                                                     |
| POSE\_STATE\_GROUND\_FLAT           | Can only be used while standing on a flat surface.                     |
| POSE\_STATE\_GROUND\_FLAT\_AND\_AIR | Can only be used while standing on a flat surface or while mid-air.    |
| POSE\_STATE\_GROUND\_FLAT\_ACTION   | Can only be used while standing on a flat surface and while in combat. |
