---
description: >-
  A tutorial on creating a custom blueprint to add additional attachmentSlots to
  an item
---

# Creating custom Blueprints

## Summary

**Created**: Aug 01 2024 by [Berdagon](https://app.gitbook.com/u/H2MkhXktQaM12OsjMzjcsLnrDT22 "mention")\
**Last documented edit**: Aug 01 2024 by [Berdagon](https://app.gitbook.com/u/H2MkhXktQaM12OsjMzjcsLnrDT22 "mention")

This guide will teach you how to **create your own blueprint** by extending a base game record. At the end, you will have an assault rifle with muzzle, scope, and four mod slots.

### **Requirements:**

**A text editor like** [**Notepad++**](https://notepad-plus-plus.org/downloads/)

## What is a Blueprint?

{% hint style="info" %}
To learn more about records and flats, check [how-to-yaml-tweak-modding-basics.md](how-to-yaml-tweak-modding-basics.md "mention") -> [#records](how-to-yaml-tweak-modding-basics.md#records "mention") and -> [#flats](how-to-yaml-tweak-modding-basics.md#flats "mention"). For the purpose of this guide, it's enough to say that **Records** can contain other records and flats, whereas flats can only contain values.
{% endhint %}

A Blueprint is a record of type **`gamedataItemBlueprint_Record`** with the following flat:

```yaml
Items.GenericShardableCyberwareBlueprint:
  $type: gamedataItemBlueprint_Record
  rootElement: Items.GenericShardableCyberwareBlueprint_inline0
```

**`rootElement`** is a record of type **`gamedataItemBlueprintElement_Record`.** \
It has the following flats (properties):

```yaml
Items.GenericShardableCyberwareBlueprint_inline0:
  $type: gamedataItemBlueprintElement_Record
  slot: AttachmentSlots.GenericItemRoot
  childElements:
    - Items.GenericShardableCyberwareBlueprint_inline1
```

**`slot`** is a record of type **`gamedataAttachmentSlot_Record.`**

They have the following properties:

**`childElements`** is an array of records of type **`gamedataItemBlueprintElement_Record`**

**`prereqID`** is a record of type **`gamedataStatPrereq_Record`**

A blueprint can have 1 **`rootElement`** and each of the **`gamedataItemBlueprintElement_Record`** can have multiple other **`gamedataItemBlueprintElement_Record`** as children

{% hint style="info" %}
In order for a slot to be usable in the game its parent slot has to already be filled.
{% endhint %}

## How to make a custom Blueprint?

We are going to make a custom blueprint that has 4 weapon mod slots for the Power Assault Rifles

At first make a new `.yaml` file and name it `Items.Base_Power_AR_SMG_LMG_4Mod_Blueprint` (the naming is not important and you can name it whatever you want).

Inside the yaml file, put the following content:

```yaml
Items.Base_Power_AR_SMG_LMG_4Mod_Blueprint:
  $type: gamedataItemBlueprint_Record
  rootElement: Items.Base_Power_AR_SMG_LMG_4Mod_Blueprint_rootElement
```

Now we need to define `Items.Base_Power_AR_SMG_LMG_4Mod_Blueprint_rootElement` we are going to use `Items.Base_Power_AR_SMG_LMG_Blueprint_inline0` as a base for our `rootElement` and append two records for our 2 new Mod slots

```yaml
Items.Base_Power_AR_SMG_LMG_4Mod_Blueprint_rootElement:
  $base: Items.Base_Power_AR_SMG_LMG_Blueprint_inline0
  childElements:
    - !append-once Items.Power_AR_SMG_LMG_WeaponMod3Element
    - !append-once Items.Power_AR_SMG_LMG_WeaponMod4Element
```

The 2 new Weapon Mod Element records should be of type `gamedataItemBlueprintElement_Record`

```yaml
Items.Power_AR_SMG_LMG_WeaponMod3Element:
  $type: gamedataItemBlueprintElement_Record
  prereqID: Items.EpicItemBlueprintElement_inline0
  slot: AttachmentSlots.Power_AR_SMG_LMG_WeaponMod3
  childElements: []

Items.Power_AR_SMG_LMG_WeaponMod4Element:
  $type: gamedataItemBlueprintElement_Record
  prereqID: Items.LegendaryItemBlueprintElement_inline0
  slot: AttachmentSlots.Power_AR_SMG_LMG_WeaponMod4
  childElements: []
```

Here we have to create 2 new prereqIDs&#x20;

```yaml
Items.EpicItemBlueprintElement_inline0:
  $base: Items.RareItemBlueprintElement_inline0
  valueToCheck: 3

Items.LegendaryItemBlueprintElement_inline0:
  $base: Items.RareItemBlueprintElement_inline0
  valueToCheck: 4
```

### Adding attachment slots

And we will need to create our custom `AttachmentSlots`

{% hint style="info" %}
You can check the [Cheat Sheet: Attachment Slots](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-tweak-ids/cheat-sheet-attachment-slots), or look up [creating-custom-attachmentslots.md](creating-custom-attachmentslots.md "mention") to make your own.
{% endhint %}

We are going to create 2 attachmentSlots named

* `AttachmentSlots.Power_AR_SMG_LMG_WeaponMod3`

```yaml
AttachmentSlots.Power_AR_SMG_LMG_WeaponMod3:
  $type: gamedataAttachmentSlot_Record
  entitySlotName: Power_AR_SMG_LMG_WeaponMod3
  localizedName: LocKey#43771
  customOffset: {x: 0, y: 0, z: 0}
  tagsForActiveItemCycling: []
  unlockedBy: Epic
```

* `AttachmentSlots.Power_AR_SMG_LMG_WeaponMod4`

```yaml
AttachmentSlots.Power_AR_SMG_LMG_WeaponMod4:
  $type: gamedataAttachmentSlot_Record
  entitySlotName: Power_AR_SMG_LMG_WeaponMod4
  localizedName: LocKey#43771
  customOffset: {x: 0, y: 0, z: 0}
  tagsForActiveItemCycling: []
  unlockedBy: Legendary
```

Now that all the necessary records are defined, we are going to add this Blueprint to the Weapon record

```yaml
Items.Base_Power_Assault_Rifle:
  blueprint: Items.Base_Power_AR_SMG_LMG_4Mod_Blueprint
```

`Items.Base_Power_Assault_Rifle` as its name suggest is the base for power assault rifles so by doing this all the power assault rifles should now have this blueprint

The tweak part of making the blueprint is now over and we can jump in the game and check the records

We are going to use `Preset_Ajax_Pimp` as you can see the modSlots are not being shown in the game&#x20;

<figure><img src="../../../../.gitbook/assets/image (495).png" alt=""><figcaption></figcaption></figure>

For this, we are going to need to do some scripting lets create a new `.reds` file in the script folder and name it `AR_SMG_LMG_4Slot.reds`&#x20;

We need to wrap multiple functions to make this work, so at first we are going to add a function that has our AttachmentSlots in it

```swift
@addMethod(InventoryDataManagerV2)
public static func GetExtraWeaponModSlots()-> array<TweakDBID>
{
  return [
    t"AttachmentSlots.Power_AR_SMG_LMG_WeaponMod3",
    t"AttachmentSlots.Power_AR_SMG_LMG_WeaponMod4"
  ];
}
```

And another function  that checks for these slots

```swift
@addMethod(UIItemsHelper)
public static func IsExtraWeaponModSlot(slotID: TweakDBID)->Bool
{
    let modSlots = InventoryDataManagerV2.GetExtraWeaponModSlots();
    
    if(ArrayContains(modSlots,slotID))
    {
        return true;
    }
    return false;
}
```

Now we wrap these 3 functions and add our slots to their return value

```swift
@wrapMethod(InventoryDataManagerV2)
public final static func GetAttachmentSlotsForInventory() -> array<TweakDBID> {
  let slots = wrappedMethod();
  let modSlots = InventoryDataManagerV2.GetExtraWeaponModSlots();
  for slot in modSlots{
    ArrayPush(slots,slot);
  }
  return slots;
}
```

```swift
@wrapMethod(UIInventoryItemModsStaticData)
public final static func GetAttachmentSlots(itemType: gamedataItemType) -> array<TweakDBID> {
  let slots = wrappedMethod(itemType);
  let modSlots = InventoryDataManagerV2.GetExtraWeaponModSlots();
  switch itemType {
    case gamedataItemType.Wea_AssaultRifle:
    case gamedataItemType.Wea_Handgun:
    case gamedataItemType.Wea_SubmachineGun:
    case gamedataItemType.Wea_SniperRifle:
    case gamedataItemType.Wea_ShotgunDual:
    case gamedataItemType.Wea_Shotgun:
    case gamedataItemType.Wea_Rifle:
    case gamedataItemType.Wea_Revolver:
    case gamedataItemType.Wea_PrecisionRifle:
    case gamedataItemType.Wea_LightMachineGun:
    case gamedataItemType.Wea_HeavyMachineGun:
      for slot in modSlots{
        ArrayPush(slots,slot);

      }
  }
  return slots;
}
```

```swift
@wrapMethod(RPGManager)
public final static func GetModsSlotIDs(type: gamedataItemType) -> array<TweakDBID> {
  let slots = wrappedMethod(type);
  let modSlots = InventoryDataManagerV2.GetExtraWeaponModSlots();
  switch type {
    case gamedataItemType.Wea_LightMachineGun:
    case gamedataItemType.Wea_SubmachineGun:
    case gamedataItemType.Wea_Rifle:
    case gamedataItemType.Wea_AssaultRifle:
    for slot in modSlots{
      ArrayPush(slots,slot);

    }
  }
  return slots;
}
```

If we check the game now we can see that our slots are added but they are not shown correctly

<figure><img src="../../../../.gitbook/assets/image (487).png" alt=""><figcaption></figcaption></figure>

We need to fix the slot Icons the tooltip names and the slot name

For the icons we wrap these 2 methods you can also use custom icon paths

```swift
@wrapMethod(UIItemsHelper)
public final static func GetSlotShadowIcon(slotID: TweakDBID, itemType: gamedataItemType, equipmentArea: gamedataEquipmentArea) -> CName {
  if(UIItemsHelper.IsExtraWeaponModSlot(slotID))
  {
    return n"UIIcon.ItemShadow_Mod";
  }
  return wrappedMethod(slotID, itemType, equipmentArea);
}

@wrapMethod(UIItemsHelper)
public final static func GetLootingShadowIcon(slotID: TweakDBID, itemType: gamedataItemType, equipmentArea: gamedataEquipmentArea) -> CName {
  if(UIItemsHelper.IsExtraWeaponModSlot(slotID))
  {
    return n"UIIcon.LootingShadow_Mod";
  }
  return wrappedMethod(slotID, itemType, equipmentArea);
}
```

For the  tooltip names we are going to wrap this method

```swift
@wrapMethod(UIItemsHelper)
public final static func GetEmptySlotName(slotId: TweakDBID) -> String {

    if(UIItemsHelper.IsExtraWeaponModSlot(slotId))
    {
        return "UI-Labels-EmptyModSlot";
    }
    
    return wrappedMethod(slotId);
}
```

And for slot name&#x20;

```swift
@wrapMethod(UIItemsHelper)
public final static func GetSlotName(slotID: TweakDBID, itemType: gamedataItemType, equipmentArea: gamedataEquipmentArea) -> String {
    if(UIItemsHelper.IsExtraWeaponModSlot(slotID))
    {
        return "Gameplay-Items-Item Type-Prt_Mod";
    }
    
    return wrappedMethod(slotID, itemType, equipmentArea);
}
```

Now the UI is almost complete now we have to register these 2 slots to all the mods that can be equipped on the other 2

```yaml
Items.AR_SMG_LMG_Mod:
  placementSlots:
    - !append-once AttachmentSlots.Power_AR_SMG_LMG_WeaponMod3
    - !append-once AttachmentSlots.Power_AR_SMG_LMG_WeaponMod4

Items.PowerWeaponMod:
  placementSlots:
    - !append-once AttachmentSlots.Power_AR_SMG_LMG_WeaponMod3
    - !append-once AttachmentSlots.Power_AR_SMG_LMG_WeaponMod4

Items.RangedWeaponMod:
  placementSlots:
    - !append-once AttachmentSlots.Power_AR_SMG_LMG_WeaponMod3
    - !append-once AttachmentSlots.Power_AR_SMG_LMG_WeaponMod4

Items.Mod:
  placementSlots:
    - !append-once AttachmentSlots.Power_AR_SMG_LMG_WeaponMod3
    - !append-once AttachmentSlots.Power_AR_SMG_LMG_WeaponMod4
```

And now its done all of our power assault rifles now have 4 mod slots

<figure><img src="../../../../.gitbook/assets/image (482).png" alt=""><figcaption></figcaption></figure>
