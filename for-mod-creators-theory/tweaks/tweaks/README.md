# TweakDB: Game database

## Summary

Last documented update: Mar 26 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will tell you what the game's weak database is, and how you can use it to change or create game items.&#x20;

### Wait, that's not what I want!

* For the beginners' guide, check [how-to-yaml-tweak-modding-basics.md](../../core-mods-explained/tweakxl/tweakxl-changing-game-records/how-to-yaml-tweak-modding-basics.md "mention")
* For another example, see How to change an NPC's record with Redscript: [tweakxl-changing-game-records](../../core-mods-explained/tweakxl/tweakxl-changing-game-records/ "mention")
* Or check the second half of [new-iconic-weapon-step-by-step.md](../../../modding-guides/items-equipment/adding-new-items/weapons/new-iconic-weapon-step-by-step.md "mention") for explanations of weapon properties

## What is the Tweak DB?

Cyberpunk 2077 uses a single static database file, which registers and defines gameplay elements.&#x20;

You can find it under [`Cyberpunk 2077`](#user-content-fn-1)[^1]`\r6\cache\tweakdb.bin`

{% hint style="info" %}
This file is not meant to be human-readable.&#x20;
{% endhint %}

To create a new gameplay item, mod developers must [add](../../../modding-guides/items-equipment/adding-new-items/) to the Tweak DB.

## Browsing the TweakDB

See the child page [browsing-the-tweak-database.md](browsing-the-tweak-database.md "mention")

## TweakDB entries

TweakDB is only a huge list of [records](./#data-type-record) - entries defining everything that you can interact with in the game, from NPCs over weapons to (perhaps most familiar to most) [clothing items](../../../modding-guides/items-equipment/adding-new-items/).

You can see existing entries by browsing the .tweak under `Cyberpunk 2077tools\redmod\tweaks` (use a text editor such as [Notepad++](https://notepad-plus-plus.org/downloads/)).

### Data type: Record

A record is a **collection** of key-value pairs. Its nature is defined by the property **$type**. You can browse existing records in Wolvenkit's [Tweak Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser), or use CET's Tweak Editor to look at the values in-game.

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

A flat is a key-value pair used by [records](./#data-type-record).

```yaml
characterType: NPCType.Human
```

`characterType` is the **name** of the property, wheras `NPCType.Human` is the assigned **value**. \
In this case, the syntax indicates an enum.

The Tweak DB can be interacted with using Cyberpunk's official **REDmod**, or numerous community solutions such as **TweakXL**, **CET**, and **redscript**.

* Via tweak file: [tweakxl](../../core-mods-explained/tweakxl/ "mention")
* Via script: [Cyber Engine Tweaks](https://wiki.redmodding.org/cyber-engine-tweaks/) / redscript / Cyberpunk's official REDmod



{% hint style="info" %}
For an explanation of the TweakDB, browse this section, or check [TweakXL's github documentation](https://github.com/psiberx/cp2077-tweak-xl/wiki/TweakDB).
{% endhint %}

## Player Garments/Equipment Graph

The following is a diagram which maps the relationship between game files for use with TweakXL and Archive XL:

![](<../../../.gitbook/assets/Cyberpunk 2077 TweakXL+ArchiveXL Pipeline.drawio.svg>)

## Enough theory, how do I modify the Tweak DB?

Check the tutorials linked under [#wait-thats-not-what-i-want](./#wait-thats-not-what-i-want "mention")

[^1]: Your game directory, where you installed Cyberpunk 2077. Steam/GOG/Epic will take you here if you browse the local files.
