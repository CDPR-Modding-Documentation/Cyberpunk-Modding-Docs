---
description: Switch off player's actions and interactions with the world
---

# Reference: GameplayRestriction

## Summary

Full list of extracted GameplayRestriction terms. To learn how to use them, please read [Apply GameplayRestriction](../../modding-guides/world-editing/miscellaneous/apply-gameplayrestriction.md)

## GameplayRestriction list

`_inline` sub-records are left out. They are internal parts of the record above them and there is nothing to apply.

### Vehicles

`NoDriving`, `VehicleNoSummoning`, `VehicleNoInteraction`, `VehicleSummoning`, `CustomVehicleSummon`, `VehicleBlockExit`, `VehicleCombatBlockExit`, `VehicleBlockRadioInput`, `VehicleCombat`, `VehicleCombatNoInterruptions`, `VehicleFPP`, `VehicleOnlyForward`, `VehicleScene`, `VehicleSceneFpp`, `VehicleSceneFppOnlyForward`, `DriverCombatFirearms`, `DriverCombatBikeWeapons`, `AllowFastForwardInVehicle`

### Phone

`NoPhone`, `PhoneCall`, `PhoneCallDeviceActionRestrictions`, `PhoneInterrupted`, `PhoneNoCalling`, `PhoneNoTexting`

### Movement and stance

`NoMovement`, `NoJump`, `NoSprint`, `ForceStand`, `ForceStandKeepState`, `ForceStandWithDodge`, `ForceCrouch`, `ForceCrouchNoMovementOnlyFirearms`, `Tier2Locomotion`, `Tier2LocomotionSlow`, `Tier2LocomotionFast`, `FocusModeLocomotion`, `SandstormLocomotion`

### Combat and weapons

`NoCombat`, `NoWeapons`, `Firearms`, `FirearmsNoUnequipNoSwitch`, `OneHandedFirearms`, `Melee`, `FistFight`, `NoQuickMelee`, `NoGrenadeOrGadget`, `ForceAim`, `InfiniteAmmo`, `BlockSmartWeapons`, `GrappleNoBreakFree`, `ShootingRangeCompetition`

### Cyberware, health and progression

`NoCyberware`, `NoDangerousCyberware`, `NoDangerousPerks`, `NoSecondHeart`, `CerberusNoSandevistan`, `NoHealing`, `PreventLowHealthOverlay`, `NoEncumbrance`, `NoCrafting`

### Menus, UI and scanning

`BlockAllMenu`, `BlockAllHubMenu`, `LockInHubMenu`, `NoRadialMenus`, `NoScanning`, `NoPhotoMode`, `NoTimeDisplay`, `NoTimeSkip`, `NoZooming`, `DeviceControlZoomLock`

### World interaction

`NoWorldInteractions`, `BlockDeviceInteractions`, `BlockTrafficInteractions`, `OnlyOpenDoor`, `SecurityLocker`

### Camera and view

`NoCameraControl`, `CinematicCamera`, `BinocularView`

### Fast travel

`BlockFastTravel`, `BlockFastTravelQuest`

### Carrying a body

`BodyCarryingGeneric`, `BodyCarryingFriendly`, `BodyCarryingNoDrop`, `BodyCarryingForceDrop`, `BodyCarryingCanSprint`, `BodyCarryingWoundedSoldier`, `BodyCarryingActionRestriction`, `BodyCarryingBodyMasterPerk5`

### Set pieces and modes

`Braindance`, `Cyberspace`, `MetroRide`, `InDaClub`, `SpaceShuttleInterior`, `FastForward`, `FastForwardCrouchLock`, `FastForwardHintActive`, `AllowTracingInTier2`, `AllowTracingInTier3`, `AllowTracingInTier4`, `AllowTracingInTier5`

## What has been confirmed with in-game tests

| Claim                                                                                      | Status                                                      |
| ------------------------------------------------------------------------------------------ | ----------------------------------------------------------- |
| The 100 record names below exist in game version 2.31                                      | Extracted from the game, reproducible, see the last section |
| The game checks the effect's label, not the record id, so a copy behaves like the original | Read in `prereqs.swift` and `quickSlotsManager.swift`       |
| `VehicleNoInteraction` stops V getting into a vehicle                                      | Confirmed in game                                           |
| `VehicleNoInteraction` stops V from using a veichle but can still enter                    | Confirmed in game                                           |
| `VehicleNoSummoning` stops V from summoning a veichle                                      | Confirmed in game                                           |
| `VehicleNoInteraction` is savable and has `duration` 0                                     | Confirmed across a save and reload                          |
| `BlockFastTravel` blocks fast travel through the lock list                                 | Confirmed in game                                           |
| Whether the other 99 are savable                                                           | **Not confirmed.** Assume they are                          |

## Reproducing this list

The `.tweak` source files that ship with REDmod, in `<game>\tools\redmod\tweaks`, hold these ids as plain text. Search them for `GameplayRestriction` with any editor. [Browsing the tweak database ](../tweaks/tweaks/browsing-the-tweak-database.md)covers this in full.
