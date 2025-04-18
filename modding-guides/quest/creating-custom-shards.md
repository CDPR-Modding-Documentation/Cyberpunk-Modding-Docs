# Creating custom shards

## Summary

Created: Apr 17 2025 by Bill\
Last documented update: Apr 17 2025 by Bill

This page will teach you how to create custom shards for Cyberpunk 2077.

## Video tutorial:

{% embed url="https://youtu.be/81Sqo09-0gs?si=5XGRhRmpbkLIQXHk" %}

### new\_shards\_01\_shard.yaml TweakDB file contents:

```yaml
Items.new_shards_01_shard:
  $type: gamedataItem_Record
  animFeatureName: ItemData
  animName: ui_garment_pose
  animSetResource: ""
  canDrop: True
  crosshair: Crosshairs.None
  deprecated: False
  dropObject: defaultItemDrop
  enableNpcRPGData: False
  friendlyName: ""
  garmentOffset: 0
  icon: UIIcon.ItemIcon
  iconPath: ""
  isCached: False
  isCoreCW: False
  isCustomizable: False
  isGarment: False
  isPart: False
  isSingleInstance: True
  itemCategory: ItemCategory.General
  itemSecondaryAction: Items.new_shards_01_shard_inline0
  itemType: ItemType.Gen_Readable
  localizedName: ""
  mass: 1
  minigameInstance: minigame_v2.DefaultItemMinigame
  powerLevelDeterminedByParent: False
  quality: Quality.Common
  qualityRestrictedByParent: False
  replicateWhenNotActive: False
  upgradeCostMult: 1
  useHeadgearGarmentAggregator: False
  useNewSpawnMethod: False
  usesVariants: False
  savable: False
  animationParameters: []
  appearanceSuffixes: []
  appearanceSuffixesOwnerOverride: []
  attachmentSlots: []
  buyPrice:
    - Price.BasePrice
    - Price.BuyMultiplier
    - Price.ItemQualityMultiplier
    - Price.BuyPrice_StreetCred_Discount
    - Price.Junk
  cameraForward: { x: 0, y: 0, z: 0 }
  cameraUp: { x: 0, y: 0, z: 0 }
  connections: []
  equipAreas: []
  equipPrereqs: []
  gameplayRestrictions:
    - GameplayRestriction.VehicleCombatNoInterruptions
  hairSkinnedMeshComponents: []
  OnAttach: []
  OnEquip: []
  OnLooted: []
  parts: []
  placementSlots: []
  previewBBoxOverride: []
  requiredSlots: []
  sellPrice:
    - Price.BasePrice
    - Price.SellMultiplier
    - Price.ItemQualitySellMultiplier
    - Price.CraftingTraitMultiplier
    - Price.SellPriceIntrinsicModMult
    - Price.Junk
  slotPartList: []
  slotPartListPreset: []
  tags:
    - Readable
    - Shard
    - SkipActivityLog
    - HideInBackpackUI
    - HideAtVendor
  variants: []
  visualTags: []
  effectors: []
  objectActions:
    - ItemAction.Drop
    - ItemAction.Disassemble
  statModifierGroups: []
  statModifiers: []
  statPools: []
  weakspots: []
```

### new\_shards\_01\_shard\_inline0.yaml TweakDB file contents:

```yaml
Items.new_shards_01_shard_inline0:
  $type: gamedataItemAction_Record
  isDefaultLootChoice: False
  removeAfterUse: True
  actionName: Read
  hackCategory: HackCategory.NotAHack
  objectActionType: ObjectActionType.Item
  priority: 0
  activationTime: []
  completionEffects: []
  costs: []
  durationTime: []
  instigatorActivePrereqs: []
  instigatorPrereqs: []
  interruptionPrereqs: []
  rewards: []
  startEffects: []
  targetActivePrereqs: []
  targetPrereqs: []
  journalEntry: onscreens/emails/quests/minor_quest/new_shards/shards/01_shard

```
