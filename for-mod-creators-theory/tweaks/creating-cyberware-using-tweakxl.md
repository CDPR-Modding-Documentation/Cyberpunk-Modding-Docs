# Creating Cyberware using TweakXL

* Created by: [saltypigloaf](mailto:saltypigloaf@gmail.com) (2024-06-22)
* Last updated by: [saltypigloaf](mailto:saltypigloaf@gmail.com) (2024-06-27)

_Note: this list is not exhaustive and should be expanded as needed.  Additional details about Arms implants Item Records, Sandevistan & Berserk OS Item Records, StatShards, and armor calculations are in-progress._



## <mark style="color:orange;">Item Record Attributes</mark>

***

There many attributes in the primary item record that are universal (or near universal) across multiple cyberware types.  With few exceptions, these entries can be drawn from a base record and reused across multiple items.

```yaml
$type: gamedataItem_Record
animFeatureName: ItemData
animName: ui_garment_pose
animSetResource: ''
blueprint: Items.GenericShardableCyberwareBlueprint
canDrop: True
crosshair: Crosshairs.None
deprecated: False
enableNpcRPGData: False
friendlyName: ''
garmentOffset: 0
icon: UIIcon.ItemIcon
isCached: False
isCoreCW: True
isCustomizable: False
isGarment: False
isPart: False
isSingleInstance: False
itemCategory: ItemCategory.Cyberware
itemType: ItemType.Cyberware
localizedName: ''
mass: 1 
minigameInstance: minigame_v2.DefaultItemMinigame
powerLevelDeterminedByParent: False
qualityRestrictedByParent: False
replicateWhenNotActive: False
useHeadgearGarmentAggregator: False
useNewSpawnMethod: False
usesVariants: True
savable: False
buyPrice:
  - Price.BaseCyberwarePrice
  - Price.ItemQualityMultiplier
  - Price.PlusTierMultiplier
  - Price.CyberwareMultiplier
  - Price.BuyPrice_StreetCred_Discount
cameraForward: {x: 0, y: 0, z: 0}
cameraUp: {x: 0, y: 0, z: 0}
gameplayRestrictions:
  - GameplayRestriction.VehicleCombatNoInterruptions
sellPrice:
  - Price.BaseCyberwarePrice
  - Price.ItemQualityMultiplier
  - Price.PlusTierMultiplier
  - Price.CyberwareMultiplier
  - Price.CyberwareSellMultiplier
slotPartListPreset:
  - Items.GenericItemRootPreset
statModifiers:
  - Items.ItemArmorToArmor
tags:
  - Cyberware
  - HideInBackpackUI
```

#### <mark style="color:green;">Notes:</mark>

* <mark style="color:green;">icon:</mark> The base value is sufficient if you want to use an existing UI element.  Otherwise, use an appropriate icon entry for your mod.

### <mark style="color:blue;">Item-Specific Entries</mark>

These attributes are the core elements of defining your cyberware item.  With the exception of the array entries above, these values will always change from item-to-item or slot-to-slot.

```yaml
buyPrice:
  - Items.YourCustomBuyRecord
cyberwareType: MemoryBoost
displayName: YourItemNameFromArchiveXL
equipArea: EquipmentArea.FrontalCortexCW
iconPath: cw_frontalcortex_memoryboost
localizedDescription: LocKey#YourItemDescFromArchiveXL
nextUpgradeItem: Items.YourCustomCuberwarePlus
OnEquip: []
quality: Quality.Uncommon
sellPrice:
  - !append Items.YourCustomSellRecord
slotPartListPreset:
  - !append Items.YourStatShardRecord
statModifiers:
  - !append Quality.IconicItem
upgradeCostMult: 2
variants: 
  - Variants.Humanity8Cost
```

#### <mark style="color:green;">Notes:</mark>

* <mark style="color:green;">buyPrice:</mark> This array should include a record to determine the humanity-to-cost ratio when buying from a vendor&#x20;
* <mark style="color:green;">cyberwareType:</mark> Each cyberware type is given a unique value.  Two items with the same value cannot be equipped, meaning iconic variants of cyberware (such as Axolotl) cannot be equipped alongside their base variant (Newton Module).  All Kiroshi cyberware share the same value, which is accommodated in [Cyberware-EX](https://www.nexusmods.com/cyberpunk2077/mods/9429) by assigning new values to each vanilla implant.
* <mark style="color:green;">displayName:</mark> If you are providing a custom item name using ArchiveXL, only the secondaryKey is required.  Do not include the LocKey prefix.
* <mark style="color:green;">equipArea:</mark> denotes the slot that will accept your cyberware item.
* <mark style="color:green;">localizedDescription:</mark> No longer used by default, but the mod [Flavorful Descriptions](https://www.nexusmods.com/cyberpunk2077/mods/13575) will add this text to the bottom of all cyberware as it was before the 2.0 update.  This does require the LocKey prefix before the secondaryKey
* <mark style="color:green;">OnEquip:</mark> This array includes all the records that define your cyberware's functionality, including Attunement if any
* <mark style="color:green;">sellPrice:</mark> This array should include a record to determine the humanity-to-cost ratio when selling from a vendor (can use the same record as <mark style="color:green;">buyPrice</mark> if you wish)
* <mark style="color:green;">slotPartListPreset:</mark> This array should include your StatShard, which is used to determine bonus stats for cyberware.
* <mark style="color:green;">statModifiers:</mark> This array typically includes 3 items:
  1. A slot-specific record such as `Items.AdvancedCardiovascularSystemModule_inline0`
  2. A record to calculate the current Attunement level for the Attunement UI
  3. If the cyberware is iconic, `Quality.IconicItem`
* <mark style="color:green;">upgradeCostMult:</mark> A multiplier applied to the required crafting components when upgrading.
* <mark style="color:green;">variants:</mark> A single array entry is used to determine the humanity cost.

### <mark style="color:blue;">Addendum #1: Item-Specific Entries for Cyberdecks</mark>

```yaml
blueprint: Items.CyberdeckBlueprint8Slots
buyPrice:
  - !append Items.YourCustomCyberdeckBuyRecord
cyberwareType: Cyberdeck
displayName: YourItemNameFromArchiveXL
equipArea: EquipmentArea.SystemReplacementCW
iconPath: cw_system_ravencyberdeck 
localizedDescription:
nextUpgradeItem: Items.YourCustomCuberwarePlus
objectActions:
  - DeviceAction.DataExtractionClassHack
  - DeviceAction.MalfunctionClassHack
  - DeviceAction.ToggleStateClassHack
  - DeviceAction.TurretToggleStateClassHack
  - DeviceAction.TakeControlCameraClassHack
  - DeviceAction.VehicleForceBrakesClassHack
  - DeviceAction.OverloadClassHack
OnEquip:
  - Items.YourCyberdeckGameplayLogicRecords
quality: Quality.Common
sellPrice:
  - !append Items.YourCustomCyberdeckSellRecord
slotPartList:
  - Items.GenericRootSlotItem
slotPartListPreset: 
  - !remove Items.GenericItemRootPreset
statModifiers: 
  - !remove Items.ItemArmorToArmor
  - !append Quality.IconicItem
tags:
  - !append Cyberdeck
upgradeCostMult: 2.5
variants:
  - Variants.Humanity8Cost
```

#### <mark style="color:green;">Notes:</mark>

* <mark style="color:green;">blueprint:</mark> This determines the number of quickhack slots available in your deck (2 through 8)
* <mark style="color:green;">buyPrice:</mark> This record typically uses a higher ratio as operating systems tend to be more expensive.
* <mark style="color:green;">cyberwareType:</mark> All cyberdecks share the same cyberwareType.
* <mark style="color:green;">localizedDescription:</mark> Not currently used by [Flavorful Descriptions](https://www.nexusmods.com/cyberpunk2077/mods/13575) for cyberdecks.  If you want favor text in your cyberdeck UI, it will need to be a UI entry in the OnEquip array.
* <mark style="color:green;">objectActions:</mark> This array defines the device and vehicle hacks available at each tier ([_see below_](creating-cyberware-using-tweakxl.md#code-sample-adding-device-and-vehicle-hacks-to-your-cyberdeck-tiers)).
* <mark style="color:green;">sellPrice:</mark> This record typically uses a higher ratio as operating systems tend to be more expensive.
* <mark style="color:green;">slotPartListPreset:</mark> Not used in cyberdecks.
* <mark style="color:green;">statModifiers:</mark> This is not used for cyberdecks, apart from identifying if the deck is iconic.
* <mark style="color:green;">upgradeCostMult:</mark> A higher multiplier is usually applied to cyberdecks.

#### <mark style="color:green;">Code Sample: Adding Device & Vehicle hacks to your Cyberdeck tiers</mark>

```yaml
Items.YourCustomDeck$(quality):
  $instances:
    - { quality: Common }
    - { quality: CommonPlus }
    - { quality: Uncommon }
    - { quality: UncommonPlus }
    - { quality: Rare }
    - { quality: RarePlus }
    - { quality: Epic }
    - { quality: EpicPlus }
    - { quality: Legendary }
    - { quality: LegendaryPlus }
    - { quality: LegendaryPlusPlus }
  objectActions:
    - !append-once DeviceAction.DataExtractionClassHack
    - !append-once DeviceAction.MalfunctionClassHack
    - !append-once DeviceAction.ToggleStateClassHack
    - !append-once DeviceAction.TurretToggleStateClassHack
    - !append-once DeviceAction.TakeControlCameraClassHack
    - !append-once DeviceAction.VehicleForceBrakesClassHack
    - !append-once DeviceAction.OverloadClassHack

Items.YourCustomDeck$(quality):
  $instances:
    - { quality: Uncommon }
    - { quality: UncommonPlus }
    - { quality: Rare }
    - { quality: RarePlus }
    - { quality: Epic }
    - { quality: EpicPlus }
    - { quality: Legendary }
    - { quality: LegendaryPlus }
    - { quality: LegendaryPlusPlus }
  objectActions:
    - !append DeviceAction.TakeControlClassHack
    - !append DeviceAction.TurretOverloadClassHack
    - !append DeviceAction.OverrideAttitudeClassHack
    - !append DeviceAction.HighPitchNoiseQuickHack
    - !append DeviceAction.TurretToggleStateClassLvl2Hack
    - !append DeviceAction.VehicleAccelerateClassHack

Items.YourCustomDeck$(quality):
  $instances:
    - { quality: Rare }
    - { quality: RarePlus }
    - { quality: Epic }
    - { quality: EpicPlus }
    - { quality: Legendary }
    - { quality: LegendaryPlus }
    - { quality: LegendaryPlusPlus }
  objectActions:
    - !append DeviceAction.TakeControlVehicleClassHack
    - !append DeviceAction.SetDeviceTagKillMode
    - !append DeviceAction.OverrideAttitudeClassLvl3Hack
    - !append DeviceAction.TurretToggleStateClassLvl3Hack

Items.YourCustomDeck$(quality):
  $instances:
    - { quality: Epic }
    - { quality: EpicPlus }
    - { quality: Legendary }
    - { quality: LegendaryPlus }
    - { quality: LegendaryPlusPlus }
  objectActions:
    - !append DeviceAction.VehicleExplodeClassHack
    - !append DeviceAction.OverloadClassLvl4Hack
    - !append DeviceAction.TurretOverrideAttitudeClassHack
    - !append DeviceAction.OverrideAttitudeClassLvl4Hack
    - !append DeviceAction.TurretToggleStateClassLvl4Hack
    - !append DeviceAction.ServerOverloadClassHack
```



## <mark style="color:orange;">Attunements</mark>

***

Applying attunements to your non-OS cyberware requires 3 elements:

1. A record to provide a UI icon (not required for vanilla Attunements)
2. A record to provide a bonus to the player
3. A record to calculate the current value provided by the attunement for the UI

#### <mark style="color:green;">Code Sample: Adding Vanilla Attuments to your cyberware</mark>

```yaml
Items.YourCustomCyberware:
  OnEquip:
    - !append Attunements.IntelligenceAllDamage
  statModifiers:
    - !append
      $type: gamedataCombinedStatModifier_Record
      opSymbol: '*'
      refObject: Player
      refStat: BaseStats.Intelligence
      value: 0.0500000007 # used in the UI, not applied to any gamplay calc
      modifierType: Additive
      statType: BaseStats.AttunementHelper
```

#### <mark style="color:green;">Notes:</mark>

The value attribute in your statModifiers record is not used to apply a bonus to the player.  It is used to generate a value for the UI record within `Attunements.IntelligenceAllDamage` to display.

In this case, the bonus within `Attunements.IntelligenceAllDamage` is to multiply all damage by Intelligence\*0.0005 but the UI needs to display percentages, not decimal modifiers.  This value is referenced in the Attunement record's UI data as the <mark style="color:green;">AttunementHelper</mark>.

#### <mark style="color:green;">Code Sample: Adding Custom Attuments to your cyberware</mark>

Below is an example of using the player's Max RAM to generate a bonus to Armor taken from an existing mod. &#x20;

```yaml
UIIcon.SampleCyberware_RAMArmorIcon:
  $type: gamedataUIIcon_Record
  atlasPartName: perks_ram
  atlasResourcePath: base\gameplay\gui\widgets\healthbar\atlas_buffinfo.inkatlas

Attunements.SampleCyberware_RAMArmor:
  $type: gamedataGameplayLogicPackage_Record
  stackable: True
  UIData:
    iconPath: UIIcon.SampleCyberware_RAMArmorIcon
    localizedDescription: LocKey#YourAttunementDescFromArchiveXL
    localizedName: Cyberdeck RAM Attuned
    floatValues:
      - 5 # The static value for the UI
    stats:
      - BaseStats.AttunementHelper # References the calculated total for the UI
  stats:
    - $type: gamedataCombinedStatModifier_Record
      opSymbol: '*'
      refObject: Self
      refStat: BaseStats.Memory
      value: 5 # The value used to calculate the bonus to Armor from RAM
      modifierType: Additive
      statType: BaseStats.Armor
      
Items.SampleCyberwareCommon:
  OnEquip:
    - !append Attunements.SampleCyberware_RAMArmor
  statModifiers:
    - !append
      $type: gamedataCombinedStatModifier_Record
      opSymbol: '*'
      refObject: Player
      refStat: BaseStats.Memory
      value: 5 # This value is used to generate the calculated total for the UI
      modifierType: Additive
      statType: BaseStats.AttunementHelper 
```



## <mark style="color:orange;">Technology Perk Requirements</mark>

***

There are a few ways in which the functionality of Cyberware is impacted by Technology Perks.  In order for newly-created Cyberware to react to these situations appropriately, some considerations needs to be be made in your design.

### <mark style="color:blue;">All Things Cyber</mark>

Level 2 of this perk reduces the Cyberware Capacity cost for cyberware in the Integumentary System and Skeleton slots by 20%.  In the variant attribute, cyberware inteded for these slots should use:

```yaml
Variants.Humanity[num]CostTinkererVariant # where [num] is the numeric cost
```

If you choose to create your own Tinkerer variant, remember that the 20% discount is not a calculated value; you are free to set whatever Cyberware Capacity cost you choose for players who buy this perk.

### <mark style="color:blue;">License To Chrome</mark>

Level 3 of this perk increases the stats of all Skeleton cyberware.  This is achieved by creating a duplicate of your cyberware item that will be swapped into the player's cyberware slot seamlessly if they've purchased this perk.

In your base cyberware records, include:

```yaml
sideUpgradeItem: [The name of your license to chrome record]
```

_Note: in vanilla items, these copies are identifiable by the 2 in their names, i.e. Items.AdvancedBionicJointsCommon2_

In your license to chrome record, include:

```yaml
tags:
  - SkipActivityLog
```



## <mark style="color:orange;">Arms Cyberware Specifics</mark>

***

Cyberware for the Arms slot have their Cyberware Capacity cost calculated for the holstered and unholstered states in separate locations.  If you intend to use a cost other than the base 8, you will need to take them both into account.

The unholstered value, which is also used for the UI, is calculated here:

```yaml
variants:
  - Variants.Humanity8Cost # the default record for all Arms cyberware
```

If you only change this value, you'll find that the UI indicates a new Cyberware Capacity cost, but equipping the item will only reduce the user's Cyberware Capacity by 8.  If order to modify the cost when holstered, you'll need to make a change here:

```yaml
Items.NanoWireHolsteredFists
  statModifiers:
    - Items.NanoWireHolsteredFists_inline1 #this record holds the value
```

This record is referenced in your Arms cyberware here:

```yaml
holsteredItem: Items.NanoWireHolsteredFists
```
