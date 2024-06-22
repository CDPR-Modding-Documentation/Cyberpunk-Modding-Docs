# Creating Cyberware using TweakXL

There are a few ways in which the functionality of Cyberware is impacted by game mechanics.  In order for newly-created Cyberware to react to these situations appropriately, some considerations needs to be be made in your design.

_Note: this list is not exhaustive and should be expanded as needed._

## <mark style="color:orange;">Tech Perk: All Things Cyber</mark>

Level 2 of this perk reduces the Cyberware Capacity cost for cyberware in the Integumentary System and Skeleton slots by 20%.  In the variant attribute, cyberware inteded for these slots should use:

```yaml
Variants.Humanity[num]CostTinkererVariant # where [num] is the numeric cost
```

If you choose to create your own Tinkerer variant, remember that the 20% discount is not a calculated value; you are free to set whatever Cyberware Capacity cost you choose for players who buy this perk.

## <mark style="color:orange;">Tech Perk: License To Chrome</mark>

Level 3 of this perk increases the stats of all Skeleton cyberware.  This is achieved by creating a duplicate of your cyberware item that will be swapped into the player's Cyberware slot seamlessly if they've purchased this perk.

In your base Cyberware records, include:

```yaml
sideUpgradeItem: [The name of your license to chrome record]
```

_Note: in vanilla items, these copies are identifiable by the 2 in their names, i.e. Items.AdvancedBionicJointsCommon2_

In your license to chrome record, include:

```yaml
tags:
  - SkipActivityLog
```

## <mark style="color:orange;">Arms Cyberware</mark>

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
