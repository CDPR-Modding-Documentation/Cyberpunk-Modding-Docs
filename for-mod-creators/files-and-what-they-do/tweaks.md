# TweakDB: Game database

This page contains information about the game's TweakDB. Here, you can learn what it is, how you can navigate it, and how you can edit it.

## What is the Tweak DB?

Cyberpunk 2077 uses a single static database file, which registers and defines gameplay elements.&#x20;

You can find it under [`Cyberpunk 2077`](#user-content-fn-1)[^1]`\r6\cache\tweakdb.bin`

{% hint style="info" %}
This file is not meant to be human-readable.&#x20;
{% endhint %}

To create a new gameplay item, mod developers must [add](../modding-guides/items-equipment/adding-new-items/) to the Tweak DB.

## Browsing the TweakDB

To inspect the TweakDB, you have three options:

* reading the .tweaks files under [`Cyberpunk 2077`](#user-content-fn-2)[^2]`\tools\redmod\tweaks` with a text editor
* using the [Wolvenkit Tweak Browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser)
* using the [CET TweakDB Editor](https://wiki.redmodding.org/cyber-engine-tweaks/console/usage-1) in the game.

## TweakDB entries

TweakDB is only a huge list of [records](tweaks.md#data-type-record) - entries defining everything that you can interact with in the game, from NPCs over weapons to (perhaps most familiar to most) [clothing items](../modding-guides/items-equipment/adding-new-items/).

You can see existing entries by browsing the .tweak under `Cyberpunk 2077tools\redmod\tweaks` (use a text editor such as [Notepad++](https://notepad-plus-plus.org/downloads/)).

### Data type: Record

A record is a **collection** of key-value pairs. Its nature is defined by the property **$type**. You can browse existing records in Wolvenkit's [Tweak Browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser), or use CET's Tweak Editor to look at the values in-game.

<details>

<summary>Example: Jackie Welles</summary>

```yaml
Character.Jackie:
  $type: gamedataCharacter_Record
  actionMap: Gang.Map
  affiliation: Factions.Valentinos
  archetypeData: Character.valentinos_grunt1_ranged1_nue_ma_inline0
  archetypeName: humanoid
  audioMeleeMaterial: Flesh
  baseAttitudeGroup: jackie
  bountyDrawTable: Character.Jackie_inline7
  canHaveGenericTalk: True
  characterType: NPCType.Human
  communitySquad: Squad_Basic
  contentAssignment: DeviceContentAssignment.Autoscaling
  cpoCharacterBuild: ''
  crowdMemberSettings: Crowds.DefaultCrowdPackage
  defaultCrosshair: Crosshairs.NoWeapon
  despawnChildCommunityWhenPlayerInVehicle: True
  devNotes: Puppet Base! All other character records should inherit in a way form this record!
  disableDefeatedState: False
  dropsAmmoOnDeathChance: 1
  dropsControlledLoot: True
  dropsMoneyOnDeath: False
  dropsWeaponOnDeath: False
  enableSensesOnStart: True
  forceCanHaveGenericTalk: False
  forcedTBHZOffset: 0
  hasDirectionalStarts: True
  hideUIDetection: False
  hideUIElements: False
  holocallInitializerPath: ''
  ignoreDetectionForAudioCue: False
  isBumpable: False
  isChild: False
  isCrowd: False
  isLightCrowd: False
  lootBagEntity: valentinosDropBag
  lootDrop: LootTables.Empty
  lootInjectionParams: LootInjection.DefaultLootInjectionSettings
  minigameInstance: minigame_v2.DefaultMinigame
  primaryEquipment: Character.Jackie_inline2
  rarity: NPCRarity.Elite
  reactionPreset: ReactionPresets.NoReaction
  scannerModulePreset: ScanningNPCPresets.ScannerPreset_QuestNPCNoLevel
  secondaryEquipment: Character.Jackie_inline5
  sensePreset: Senses.Relaxed
  skipDisplayArchetype: True
  squadParamsID: FactionSquads.ValentinosSquad
  staticCommunityAppearancesDistributionEnabled: False
  threatTrackingPreset: TargetTracking.DefaultPreset
  uiNameplate: UINameplate.CombatSettings
  useForcedTBHZOffset: True
  voiceTag: jackie
  entityTemplatePath: base\quest\secondary_characters\jackie.ent
  priority: SpawnableObjectPriority.Quest
  savable: True
  abilities:
    - Ability.CanCrouch
    - Ability.CanSprint
    - Ability.CanSwitchWeapon
    - Ability.CanShootWhileMoving
    - Ability.CanPreciseShoot
    - Ability.CanChargedShoot
    - Ability.CanSmartShoot
    - Ability.CanUseLeftHand
    - Ability.CanUseRightHand
    - Ability.CanUseLegs
    - Ability.CanTaunt
    - Ability.CanCloseCombat
    - Ability.CanUseIncendiaryGrenades
    - Ability.IsBalanced
    - Ability.DealsThermalDamage
    - Ability.HasChargeJump
  attachmentSlots:
    - AttachmentSlots.WeaponRight
    - AttachmentSlots.WeaponLeft
    - AttachmentSlots.GrenadeRight
    - AttachmentSlots.GrenadeLeft
    - AttachmentSlots.Head
    - AttachmentSlots.Eyes
    - AttachmentSlots.Chest
    - AttachmentSlots.RightArm
    - AttachmentSlots.LeftArm
    - AttachmentSlots.RightHand
    - AttachmentSlots.LeftHand
    - AttachmentSlots.Legs
    - AttachmentSlots.PersonalLink
    - AttachmentSlots.Consumable
    - AttachmentSlots.Feet
    - AttachmentSlots.TppHead
    - AttachmentSlots.Torso
    - AttachmentSlots.Outfit
    - AttachmentSlots.UnderwearTop
    - AttachmentSlots.UnderwearBottom
    - AttachmentSlots.ItemSlotSniperRifle
    - AttachmentSlots.ItemSlotSMG
    - AttachmentSlots.ItemSlotTechRifle
    - AttachmentSlots.ItemSlotHandgunLeftJackie
    - AttachmentSlots.ItemSlotHandgunRightJackie
    - AttachmentSlots.ItemSlotKatana
    - AttachmentSlots.ItemSlotGenericMelee
    - AttachmentSlots.ItemSlotHammer
    - AttachmentSlots.ItemSlotKnifeRight
    - AttachmentSlots.ItemSlotKnifeLeft
    - AttachmentSlots.ItemSlotGenericRanged
    - AttachmentSlots.ItemSlotHandgunRight
    - AttachmentSlots.ItemSlotHandgunLeft
  bossHealthBarThresholds: []
  crowdAppearanceNames: []
  displayName: LocKey#34477
  EquipmentAreas: []
  fullDisplayName: LocKey#34478
  genders: []
  itemGroups:
    - Character.Enemy_Items_Base
  items: []
  onSpawnGLPs: []
  multiplayerTemplatePaths: []
  tags:
    - Immortal
  visualTags:
    - Valentinos
    - Grunt
    - Lvl1
  effectors:
    - Effectors.HitReactionTBHIncrease
  objectActions:
    - GenericInteraction.PickUpBody
    - GenericInteraction.Talk
    - GenericInteraction.ReturnTalk
    - Takedown.Grapple
    - Takedown.LethalTakedown
    - Takedown.NonLethalTakedown
    - Takedown.AerialTakedown
    - Takedown.BlackwallTakedown
    - Takedown.NewPerkFinisher
    - Takedown.NewPerkFinisherBlunt
    - Takedown.NewPerkFinisherBluntHold
    - QuickHack.RemoteBreach
    - QuickHack.SuicideHackBase
    - QuickHack.GrenadeHackBase
    - QuickHack.SystemCollapseHackBase
    - QuickHack.MadnessHackBase
    - QuickHack.BaseBlackWallHack
    - QuickHack.BaseOverheatHack
    - QuickHack.BaseContagionHack
    - QuickHack.OverloadBaseHack
    - QuickHack.BrainMeltBaseHack
    - QuickHack.BaseBlindHack
    - QuickHack.BaseWeaponMalfunctionHack
    - QuickHack.BaseLocomotionMalfunctionHack
    - QuickHack.BaseCyberwareMalfunctionHack
    - QuickHack.BaseCommsCallInHack
    - QuickHack.BaseCommsNoiseHack
    - QuickHack.BasePingHack
    - QuickHack.BaseMemoryWipeHack
    - QuickHack.BaseWhistleHack
    - MinigameAction.NetworkSuicideHack
    - MinigameAction.NetworkJamWeaponHack
    - MinigameAction.NetworkPingHack
    - MinigameAction.NetworkAutoJamHack
    - MinigameAction.NetworkAutoBlindHack
    - MinigameAction.NetworkAutoLocomotionHack
    - MinigameAction.NetworkWeakNPCs
    - MinigameAction.NetworkVulnerableNPCs
    - MinigameAction.NetworkMadnessHack
    - MinigameAction.NetworkWeaponMalfunctionHack
    - MinigameAction.NetworkCyberwareMalfunctionHack
    - MinigameAction.NetworkLowerICEMinorFirst
    - MinigameAction.NetworkLowerICEMinorSecond
    - MinigameAction.NetworkLowerICEMinorThird
    - MinigameAction.NetworkLowerICEMedium
    - MinigameAction.NetworkLowerICETutorial
    - MinigameAction.NetworkLowerICEMajor
  statModifierGroups:
    - Character.NPC_Base_Primary_Stat_ModGroup
  statModifiers:
    - QuickHack.TargetResistance_DifficultyMult
    - QuickHack.TargetResistanceUltimate_DifficultyMult
    - Character.valentinos_base_inline0
    - Character.Jackie_inline0
    - Character.Jackie_inline1
  statPools:
    - BaseStatPools.Puppet_Health_Base
    - BaseStatPools.Puppet_Stamina_Base
    - BaseStatPools.Fear
    - BaseStatPools.Poise
    - BaseStatPools.CPO_NPC_Importance
  weakspots: []
  alertedSensesPreset: Alerted
  combatSensesPreset: Combat
  relaxedSensesPreset: Relaxed
  weaponSlot: AttachmentSlots.WeaponRight

```



</details>

### Data type: Flat

A flat is a key-value pair used by [records](tweaks.md#data-type-record).

```yaml
characterType: NPCType.Human
```

`characterType` is the **name** of the property, wheras `NPCType.Human` is the assigned **value**. \
In this case, the syntax indicates an enum.

## Modifying the Tweak DB

You can change in-game items by **modifying their properties** in the TweakDB. You have the following tools to do this:

* Via tweak file: [tweakxl.md](../core-mods-explained/tweakxl.md "mention")
* Via script: [Cyber Engine Tweaks](https://wiki.redmodding.org/cyber-engine-tweaks/) / redscript / Cyberpunk's official REDmod

## Player Garments/Equipment Graph

The following is a diagram which maps the relationship between game files for use with TweakXL and Archive XL:

![](<../../.gitbook/assets/Cyberpunk 2077 TweakXL+ArchiveXL Pipeline.drawio.svg>)

[^1]: Your game directory, where you installed Cyberpunk 2077. Steam/GOG/Epic will take you here if you browse the local files.

[^2]: The directory where you installed the game
