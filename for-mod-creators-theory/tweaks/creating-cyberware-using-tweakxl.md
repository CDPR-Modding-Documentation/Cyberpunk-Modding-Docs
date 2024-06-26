# Creating Cyberware using TweakXL

_Note: this list is not exhaustive and should be expanded as needed.  Additional details about Arms implants Item Records, Cyberdeck implants Item Records, Attunements, StatShards, and armor calculations are in-progress._

## <mark style="color:orange;">Item Record Attributes</mark>

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
nextUpgradeItem: Items.AdvancedMemoryBoostUncommonPlus
OnEquip: []
quality: Quality.Uncommon
sellPrice:
  - Items.YourCustomSellRecord
slotPartListPreset:
  - Items.YourStatShardRecord
statModifiers:
  - Quality.IconicItem
upgradeCostMult: 2
variants: []
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
* <mark style="color:green;">variants:</mark> A single array entry is used to determine the humanity cost, such as `Variants.Humanity8Cost`

## <mark style="color:orange;">Technology Perk Requirements</mark>

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
