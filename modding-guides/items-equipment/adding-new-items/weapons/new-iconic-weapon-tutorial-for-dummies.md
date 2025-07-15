---
description: Tutorial for gonks
cover: ../../../../.gitbook/assets/merchants_of_death_ultrawide.png
coverY: 46
---

# New Iconic Weapon: Step by Step

## Summary

Published: December 2023 by destinybu\
Last documented edit: Feb 07 2024 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

We'll be making a fully featured new Iconic weapon in this guide, which is designed for first-timers and goes into details into every aspect about weapon modding. (not appearances)

#### Wait, this is not what I want!

* You can find other guides about this topic under [.](./ "mention") and [standalone-weapon-appearance.md](standalone-weapon-appearance.md "mention")
* For an overview of weapon properties, check [cheat-sheet-weapon-basestats.md](../../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-tweak-ids/weapons/cheat-sheet-weapon-basestats.md "mention")
* For an overview of weapon audio profiles, check [cheat-sheet-weapon-audio.md](../../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-tweak-ids/weapons/cheat-sheet-weapon-audio.md "mention")

## Prerequisites

Before beginning, ensure you have the following software installed and properly set up:

1. **WolvenKit (8.12+)** - [Installed & Setup](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/getting-started/download)
2. **MLSB (MultiLayerSetupBuilder 1.6.7+)** - [Installed & Setup](../../../../for-mod-creators-theory/modding-tools/mlsetup-builder/#installation)
3. **A text editor:** [Notepad++](https://notepad-plus-plus.org/downloads/) or, if you want to get fancy, [Visual Studio Code](https://app.gitbook.com/s/-McniwB8YOK2HnJ7SYg_/getting-started)
4. **Cyberpunk 2077** - 😑
5. Core mods: [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198), [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197), [Red4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380)
6. Optional: [RedHotTools](https://github.com/psiberx/cp2077-red-hot-tools/releases/), [RedMod](../../../../for-mod-users/users-modding-cyberpunk-2077/redmod/)

If you are stuck, refer to the [#troubleshooting-check-this-when-youre-stuck](new-iconic-weapon-tutorial-for-dummies.md#troubleshooting-check-this-when-youre-stuck "mention") at the end of the page.

## Iconic Weapons in a nutshell

Each Iconic weapon is a variant of a base weapon, with an hidden (from the player) mod. \
This "hidden" mod contains a statModifiers array (to list all the stat changes this Iconic will have from the base weapon) and an OnAttach array. \
The OnAttach array is where you'll want a GameplayLogicPackage to go. You may or may not need to define conditional effectors in there, but if you want your weapon to have the customary Iconic yellow description then be aware that there is where it's written (in the UIData of the GameplayLogicPackage).

<figure><img src="../../../../.gitbook/assets/Screenshot 2025-01-28 182507 - Copia.png" alt=""><figcaption><p>$base: Items.IconicWeaponModAbilityBase == $type: GameplayLogicPackage</p></figcaption></figure>

## Step 0: Understanding the structure

The rest of this guide will hold your hand through a deep dive, step-by-step, of your first custom Iconic made from zero. If you get lost through it, or if you'd rather find your own flow, you'll be well served by returning to check the code of an Iconic weapon already in the game (as you'll be building up from a base weapon in the same way, and it's solid footing).

**RedMod tweak files are much more legible than a "TweakXL override" from WolvenKit for this**, as each step there inherits redundant stuff passively and won't clutter your screen. Plus you'll see inlines content directly without having to track down flats.\
Just use something to search the insides of the files for the definitions (VS can, or some free tools like [Agent Ransack](https://www.mythicsoft.com/agentransack/))

## Step 1: Create a New Project in WolvenKit

Start by opening WolvenKit and create a new project. This will be the base for your new iconic weapon mod.

<figure><img src="../../../../.gitbook/assets/image (292).png" alt=""><figcaption><p>Create a new WolvenKit project as shown here</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/image (293).png" alt=""><figcaption><p>A clean project should look like this (as of Wolvenkit 8.12, your interface may look different)</p></figcaption></figure>

## Step 2: Choose the weapon and create an override

Decide on the weapon you want to modify to make a new new iconic.

{% hint style="info" %}
For this tutorial, we will use the gun 'Unity' as our base (`Items.Preset_Unity_Default).` If you want to use a different weapon, you can refer to [spawn-codes-baseids-hashes.md](../../../../for-mod-creators-theory/references-lists-and-overviews/equipment/spawn-codes-baseids-hashes.md "mention") or find a list of all in-game items [here](https://onedrive.live.com/view.aspx?resid=EF6891140DE637B3%21221903\&authkey=!AE_n4RTzwmVHwy8).
{% endhint %}

To understand how the base gun works, open the [Tweak Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser "mention") in WolvenKit and search for `Items.Preset_Unity_Default`.

<figure><img src="../../../../.gitbook/assets/image (295).png" alt=""><figcaption><p>Open the <a data-mention href="https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser">Tweak Browser</a> &#x26; search "Items.Preset_Unity_Default"</p></figcaption></figure>

After locating the Unity gun in the tweak browser, right-click on the item and select "Add TweakXL Override". This allows you to modify and customize the weapon’s attributes to create your new iconic weapon.

<figure><img src="../../../../.gitbook/assets/image (381).png" alt=""><figcaption><p>Red arrow = Tweak Name, where you can override it. Blue Box= Details about selected tweak. White arrow = Overridden (New) Tweak</p></figcaption></figure>

{% hint style="info" %}
To read more about Tweak modding, check [tweaks](../../../../for-mod-creators-theory/tweaks/tweaks/ "mention"). This isn't necessary for understanding this guide!
{% endhint %}

## Step 3: Editing and understanding your new tweak

{% hint style="warning" %}
Before you start with this section, make sure to read the block below!
{% endhint %}

{% include "../../../../.gitbook/includes/yaml-editing-warning.md" %}

***

Open the overridden tweak file in a code editor of your choice (such as [Notepad++](https://notepad-plus-plus.org/downloads/) or VS Code). You will be presented with a `.yaml` file containing roughly a million fields.

<figure><img src="../../../../.gitbook/assets/image (382).png" alt=""><figcaption><p>"Items.Preset_Unity_Default" tweak opened in VS Code</p></figcaption></figure>

### How does it work?

{% hint style="info" %}
For first time modders, understanding all this in one go will be difficult. You can just keep these explanations handy and revisit them when required.
{% endhint %}

The .yaml file may seem complex at first glance, but the actual structure is extremely simple. Your weapon has properties – those stand on the left side of the `:`, such as `ammo`. The properties have different values, and those stand on the right side of the `:`, such as `Ammo.RifleAmmo`.

<details>

<summary>An annotated example</summary>

Here's a breakdown of key fields in a different weapon (`Items.Preset_Sidewinder_Default`) : (Thanks to BuffMcMuff)

<pre class="language-yaml"><code class="lang-yaml"><strong>Items.Preset_Sidewinder_Default: # item "code" for your weapon. use this when giving item.
</strong>  $type: gamedataWeaponItem_Record # the type of record. (records need to be defined with either a $type or a $base)
  ammo: Ammo.RifleAmmo # ammo type used (Fun Fact: Dex's Gun has ammo type - Items.Money)
  baseEmptyReloadTime: 1.54999995 # base reload time when mag empty NOTE: DO NOT EDIT RELOAD SPEED HERE see statModifierGroups: Items.Base_Sidewinder_Handling_Stats
  baseReloadTime: 1.54999995 # base reload time when mag is not empty NOTE: DO NOT EDIT RELOAD SPEED HERE see statModifierGroups: Items.Base_Sidewinder_Handling_Stats
  damageType: DamageTypes.Physical # damage type
  effectiveRangeFalloffCurve: StandardFalloff # damage fall of curve
  evolution: WeaponEvolution.Smart # what type of weapon none, power, tech and smart for ranged weps
  forcedMinHitReaction: -1
  fxPackage: WeaponFxPackage.SmartRifle # visual effects used for bullets. trail, bullet hole, impact, etc
  fxPackageQuickMelee: WeaponFxPackage.QuickMeleeFxPackage
  hudIcon: HUDWeaponIcons.Sidewinder # hud icon used
  IsIKEnabled: False # are inverse kinematics enabled.
  manufacturer: WeaponManufacturer.Corporation # weapon manufacturer type. not sure if used ingame.
  primaryTriggerMode: TriggerMode.FullAuto # trigger mode when hip firing and aiming if secondaryTriggerMode is not set.
  projectileEaseOutCurveName: ProjectileEaseOut
  rangedAttacks: Attacks.SmartBulletLowPackage # what type of bullet to fire. explosive, smart, projectile, standard hitscan, etc
  triggerEffectName: te_wea_aim_mid
  uninterruptibleEmptyReloadStart: 0.5 # point after which reload cannot be cancelled by other animations such as running. with empty mag
  uninterruptibleReloadStart: 0.5 # point after which reload cannot be cancelled by other animations such as running. with non empty mag
  useForcedTBHZOffset: False # Time before hit offset? used by npc
  UseShootVFXOnlyOnFirstShot: False # if bullet vfx is used again when firing in non semi-auto
  animFeatureName: WeaponData
  animName: ui_garment_pose
  animSetResource: ''
  appearanceResourceName: Preset_Sidewinder_Default # used to set .app file used by weapon
  audioName: wea_set_sidewinder # used to set weapon sounds not related to reloading and and first equip anim.
  blueprint: Items.Base_Smart_AR_SMG_LMG_NoAttachments_Blueprint # "blueprint" used to create the gun. different versions for guns with no barrel or scope attachments. also generic ones for iconics
  crosshair: Crosshairs.SmartGun # what crosshairs to use
  deprecated: False # TODO. used with items from before v2.0?
  dropObject: defaultItemDrop
  enableNpcRPGData: True # if npc should use npcRPGData found below
  entityName: weapon_root
  equipArea: EquipmentArea.Weapon # equip area. see equipment.EX
  friendlyName: w_rifle_assault_nokota_sidewinder # used to set player arm animations in first person see player_ma_fpp.ent and player_wa_fpp.ent. reload and first equip sounds are set in .anims files also. see weapon anim files beginning with pwa_ and pma_
  garmentOffset: 0
  icon: UIIcon.ItemIcon # Used when setting inventory icon
  iconPath: '' # Used when setting inventory icon
  isCached: False
  isCoreCW: False
  isCustomizable: False
  isGarment: False
  isPart: False # this is set to true in weapon parts such as scopes
  isSingleInstance: False
  itemCategory: ItemCategory.Weapon # item category used for inventory
  itemSecondaryAction: ItemAction.Equip # second action shown when looking at weapon on the ground for example.
  itemType: ItemType.Wea_Rifle # what type of item. used in inventory and perks i think? maybe affects animations?
  localizedName: '' 
  mass: 20 # weight of weapon.
  minigameInstance: minigame_v2.DefaultItemMinigame
  npcRPGData: Items.Base_Sidewinder_inline1 # stats used when the weapon is equipped by an NPC
  parentAttachmentType: ParentAttachmentType.Slot # used for weapon attachments such as scopes and muzzles
  powerLevelDeterminedByParent: False # TODO. not used since 2.0?
  quality: Quality.Random # default quality for weapon. CET ignores Quality.Random and always gives normal. Other quality settings work fine in CET and random works normally when found normally ingame.
  qualityRestrictedByParent: False
  replicateWhenNotActive: False
  stateMachineName: Weapon # used by game logic.
  upgradeCostMult: 1
  useHeadgearGarmentAggregator: False # TODO. probably not used by weapons?
  useNewSpawnMethod: False
  usesVariants: False
  savable: False
  attacks: # used to set different types of projectiles that can be shot by the gun. not used in 2.0?
    - Attacks.Bullet_GameEffect
       ...
    - Attacks.ChimeraPowerMod_ExplosiveBulletEffect
  gameplayDescription: LocKey(92674) # used to set the description when inspecting weapon.
  ikOffset: {x: 0, y: 0, z: 0}
  shootingPatternPackages: [] # used by npc
  triggerModes: # trigger modes available to weapon. should have primary and secondary trigger modes here also
    - TriggerMode.FullAuto
  animationParameters: []
  appearanceSuffixes: [] 
  appearanceSuffixesOwnerOverride: []
  attachmentSlots: [] # TODO. used by attachments such as scopes and muzzles
  buyPrice: # price multipliers used when buying weapon.
    - Price.BaseWeaponPrice
    - Price.ItemQualityMultiplier
    - Price.PlusTierMultiplier
    - Price.BrokenItemPriceMult
    - Price.IconicMultiplier
    - Price.BuyPrice_StreetCred_Discount
    - Price.AssaultRifleMultiplier
    - Price.SmartWeapon
  cameraForward: {x: 0, y: 0, z: 0}
  cameraUp: {x: 0, y: 0, z: 0}
  connections: []
  displayName: LocKey(3599) # name of weapon
  equipAreas: []
  equipPrereqs: [] # TODO. used by game logic packages(GLP)?
  gameplayRestrictions: # restrict weapon usage in certain situations.
    - GameplayRestriction.VehicleCombatNoInterruptions
  hairSkinnedMeshComponents: []
  localizedDescription: LocKey(3600) # white text description when hovering over an item.
  OnAttach: # used to apply effects to player and weapon whean equipping weapon. stamina regen speed, stagger when shooting, etc
    - Items.Base_Assault_Rifle_inline0
    - EquipmentGLP.MediumStaminaRegen
    - EquipmentGLP.LightStaminaDelay
    - Items.SmartWeaponTargetsPriorityQueues
  OnEquip: [] 
  OnLooted: [] 
  parts: []
  placementSlots: # slots in Which this item can be placed in. see equipmentEX?
    - AttachmentSlots.WeaponRight
    - AttachmentSlots.WeaponLeft
    - AttachmentSlots.ItemSlotSniperRifle
    - AttachmentSlots.ItemSlotSMG
    - AttachmentSlots.ItemSlotTechRifle
    - AttachmentSlots.ItemSlotHandgunLeftJackie
    - AttachmentSlots.ItemSlotHandgunRightJackie
    - AttachmentSlots.ItemSlotGenericMelee
    - AttachmentSlots.ItemSlotHammer
    - AttachmentSlots.ItemSlotKatana
    - AttachmentSlots.ItemSlotKnifeRight
    - AttachmentSlots.ItemSlotKnifeLeft
    - AttachmentSlots.ItemSlotGenericRanged
    - AttachmentSlots.ItemSlotHandgunRight
    - AttachmentSlots.ItemSlotHandgunLeft
    - AttachmentSlots.ItemSlotTechRifle
    - AttachmentSlots.ItemSlotSMG
  previewBBoxOverride: []
  requiredSlots: []
  sellPrice:
    - Price.BaseWeaponPrice
    - Price.ItemQualityMultiplier
    - Price.PlusTierMultiplier
    - Price.WeaponSellMultiplier
    - Price.BrokenItemPriceMult
    - Price.IconicMultiplier
    - Price.AssaultRifleMultiplier
    - Price.SmartWeapon
  slotPartList: # what models to load when weapon has attachments and when it has mag inserted(or not)
    - Items.Base_Sidewinder_inline2
    - Items.Base_Sidewinder_inline4
    - Items.Base_Sidewinder_inline6
    - Items.Base_Sidewinder_inline8
  slotPartListPreset: # same as above but specific to the preset of the weapon, also used to set attachment and mod slots
    - Items.Preset_Sidewinder_Default_inline0
      …
    - Items.Preset_Sidewinder_Default_inline5
  tags: # tags signalling the game about weapon being smart, melee, ranged, etc....
    - Weapon
    - RangedWeapon
    - inventoryDoubleSlot
    - Preload
    - Weapon
    - Rifle Assault
    - Smart
    - SmartWeapon
    - Preload
    - Weapon
    - Rifle Assault
  variants: []
  visualTags: # visual tags used to set what look to use from the app file set in appearanceResoureName
    - Default
  effectors: []
  objectActions:
    - ItemAction.Drop
    - ItemAction.Disassemble
    - ItemAction.WeaponDisassemble
  statModifierGroups: # this section is for actually modifying weapon stats
    - Items.Base_Smart_Stats
    - Items.Base_Smart_Assault_Rifle_No_Sway_Stats
    - Items.Base_Assault_Rifle_RPG_Stats
    - Items.Base_Assault_Rifle_Misc_Stats
    - Items.Base_PlayerState_Spread_Stats
    - Items.Base_Weapon_Damage_Type_Min_Max
    - Items.Base_Weapon_Damage_Type_Physical
    - Items.QualityRandomization
    - Items.ItemPlusRandomizer_MaxQuality
    - Items.ItemPlusRandomizer_Below_MaxQuality
    - Items.WeaponModsWeights_On_Tier2Plus
    - Items.WeaponModsWeights_On_Tier3Plus
    - Items.WeaponModsWeights_On_Tier4Plus
    - Items.WeaponModsWeights_On_Tier5Plus
    - Items.WeaponModsWeights_On_Tier5PlusPlus
    - Items.Base_Smart_Assault_Rifle_Mult_Stats
    - Items.Base_Sidewinder_Technical_Stats # used to set: bullet amount fired, projectiles fired per bullet, smart weapon accuracy, fire 
rate(cycle time), mag size, smart range
    - Items.Base_Sidewinder_Handling_Stats # used to set: reload speed, weapon zoom, speed of first equip anim.
    - Items.Base_Sidewinder_Recoil_Stats # used to set: recoil stats
    - Items.Base_Sidewinder_SmartGun_Stats # used to set: smartgun accuracy, projectile stats(speed), lock on stats
    - Items.Base_Sidewinder_SmartGun_SmartLink_Stats # used to set: smartlink requirement and how stats in Base_Sidewinder_SmartGun_Stats are affected by link
    - Items.Base_Sidewinder_SmartGun_Projectile_Stats # used to set: projectile miss conditions and other stuff like spirals
    - Items.Base_Sidewinder_Spread_Stats
    - Items.Base_Sidewinder_Flags # unknown
    - Items.Base_Sidewinder_Aim_Stats
    - Items.Base_Sidewinder_Constant_Stats # more spread stats, firepower, effective range
    - Items.Base_Sidewinder_Damage_Stats # used to set: DPS
  statModifiers: # this section is primarily used to set stuff intrinsic to all weapons
    - Items.Base_Weapon_inline0
<strong>      …
</strong>    - Items.Base_Weapon_inline149
  statPools: [] # used to set stat pools like tech weapon charge and overheating
  weakspots: []
  position: {x: '0,000500000024', y: 0, z: '0,0900000036'}
  price: Items.Base_Sidewinder_inline0
  weaponVignetteRadius: 0.648199975
  weaponEdgesSharpness: 0.495799989
  weaponFarPlane_aim: 23.7000008
  weaponFarPlane: 29.5
  weaponEdgesSharpness_aim: 0.495799989
  weaponVignetteCircular_aim: 0.174500003
  offset: -0.100000001
  safeActionDuration: 2
  weaponVignetteIntensity_aim: 0.135700002
  weaponNearPlane_aim: 12.4700003
  weaponVignetteRadius_aim: 0.681400001
  weaponNearPlane: 8.31000042
  weaponVignetteIntensity: 0.135700002
  weaponBlurIntensity_aim: 1
  weaponVignetteCircular: 0
  weaponBlurIntensity: 1
  hide_nametag: True
</code></pre>

</details>

## Step 4: Making a new weapon

### 4.1: New weapon, same as the old weapon

Making a new weapon is fairly simple. In your tweak file, change the Item ID in the very first line to "Items.Hand\_Of\_Midas" and save (Hotkey: `Ctrl+S`).

{% code lineNumbers="true" %}
```yaml
Items.Preset_Unity_Default: -> Remove this
Items.Hand_Of_Midas: -> Add this
```
{% endcode %}

That's it, you've created a new weapon now. This weapon will look & behave exactly like the Unity handgun, but trust me, it's new.

To test it out, boot up your game and load any save.

Now open up the CET [Console](https://app.gitbook.com/s/-MP5jWcLZLbbbzO-_ua1-887967055/console/console "mention"):

<figure><img src="../../../../.gitbook/assets/image (221).png" alt=""><figcaption><p>Red arrow = Open CET Console. Green arrow = Command to spawn in the newly created gun</p></figcaption></figure>

Type in the command below and hit Enter.

```
 Game.AddToInventory("Items.Hand_Of_Midas",1)
```

<figure><img src="../../../../.gitbook/assets/image (223).png" alt=""><figcaption><p>Your newly created weapon is now in game.</p></figcaption></figure>

You can now see your newly created weapon in your inventory.

Unfortunately, there is no way to tell it apart from the Unity handgun.

We'll get to fixing that, but first, a little cleanup: open up your WolvenKit & rename your overridden tweak file to "hand\_of\_midas.yaml". We will store all the edits that need to be done to our new weapon in this file.

### 4.2: Changing the carbon copy

Let's change something that will differentiate our weapon from the default Unity.

To do this, open your renamed tweak file & find the `crosshair` tag (hotkey: `Ctrl+F`). Replace it as shown below, and save your file.

```yaml
  crosshair: Crosshairs.Simple # -> remove this
  crosshair: Crosshairs.Tech_Round # <- add this
```

Now hot reload your game (Insert how to link here) or close it, reinstall your mod in WolvenKit & relaunch your game (From here on, this will be referred to as hot reload).

Spawn in both the Unity & Hand of Midas using the CET console:

```
Game.AddToInventory("Items.Hand_Of_Midas",1)
Game.AddToInventory("Items.Preset_Unity_Default",1)
```

<figure><img src="../../../../.gitbook/assets/image (224).png" alt=""><figcaption><p>Default Unity crosshair</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/image (225).png" alt=""><figcaption><p>Hand of Midas crosshair</p></figcaption></figure>

You should now be able to see that both the Unity & Hand Of Midas, although otherwise identical, now have different crosshairs.

### How did we figure out the crosshair ID?

How do we know that it's called "Crosshairs.Tech\_Round" ?

#### Method 1: The REDmod DLC

If you have the REDmod DLC installed, you can use a text editor like Notepad++ to do a full-text search under `Cyberpunk 2077/tools/REDmod`. By searching for `crosshair:`, you can find all value assignments in the game files.

#### Method 2: The [Wolvenkit Tweak Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser)

By searching for "Crosshairs." in the Tweak Browser. Most things we find inside the weapon tweak will be searchable within the Tweak Browser, and some within the Asset Browser.

<figure><img src="../../../../.gitbook/assets/image (220).png" alt=""><figcaption><p>List of crosshairs obtained with a Tweak Browser search</p></figcaption></figure>

Editing the Tweak will allow us to modify all of our gun's behaviors, and I encourage you to play around with these.

## Step 5: Removing redundant code

We're only changing a single property in the Hand of Midas. For that, we have a tweak file with more than 200 lines of code. Can't we do this in a better way?

We can, and we should!

{% hint style="warning" %}
In later steps of this guide, you'll need to look up properties. Either keep a copy of your full tweak file (e.g. on your desktop), or refer to [#an-annotated-example](new-iconic-weapon-tutorial-for-dummies.md#an-annotated-example "mention") above.
{% endhint %}

### Using $base instead of $type

```yaml
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default
  # Just the properties we want to edit...

# OR

Items.Hand_Of_Midas:
  $type: WeaponItem
  # Every single property of the weapon...
```

As shown above, when using `$type` to define a tweak, we need to add all the required properties for the type, but when using $base to define one, we only need to add the properties we are changing, the rest are taken from the parent.

Now go ahead and change it so we use a `$base` & only define the crosshair. Your entire tweak should now look like this:

```yaml
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default
  crosshair: Crosshairs.Tech_Round
```

## Step 6: The personal touch

What good is a new gun without a new name? We need to tell our game about these.

1. Open your WolvenKit project and navigate to the archive folder
2. Create a new folder named after your mod, for example `midas_collection`
3. Within this folder, make a subfolder named `localization`

<figure><img src="../../../../.gitbook/assets/image (215).png" alt=""><figcaption><p>mod name folder &#x26; localization folder</p></figcaption></figure>

### How does the game assign display names?

In your full tweak file, search for the field called `displayName`. You'll likely encounter something like `displayName: LocKey#49794`.

This connects the displayName property of your item with a **locaization key**, which is the mechanism that the game uses to support multiple languages. Think of the `LocKey` of a list entry, with different lists being used for different languages.

{% hint style="info" %}
If you want to take a look at these lists, use WolvenKit's [LocKey browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/lockey-browser) or [search](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) for `onscreens.json`.
{% endhint %}

<figure><img src="../../../../.gitbook/assets/image (216).png" alt=""><figcaption><p>LocKey Browser search for <code>LocKey#49794</code></p></figcaption></figure>

### So we edit onscreens.json?

Good thinking, but no. In Cyberpunk, only **one** mod can edit any given file. That is why [archivexl](../../../../for-mod-creators-theory/core-mods-explained/archivexl/ "mention") exists, and we'll use it to create a new translation entry for us.

Place a dedicated [`en-us.json`](https://mega.nz/file/3uB2CL5L#Y18wD4pGo1L7Y699GNvy6UaKVb8BqkjDP-FeYi9VcQM) file in your `midas_collection`\\`localization` folder. This is where we'll add our own translation entries – after that, we only need to tell ArchiveXL about the file and lean back.

<figure><img src="../../../../.gitbook/assets/image (218).png" alt=""><figcaption><p>Red arrow = localization json added correctly. Green arrow = add new element in the json. Yellow arrow = key fields in new entry</p></figcaption></figure>

### Setting up a localizationKey

Open the file in Wolvenkit and create a new entry in `localizationPersistenceOnScreenEntry`. It has the following properties:

<table><thead><tr><th width="207">Property name</th><th width="173">your value</th><th>explanation</th></tr></thead><tbody><tr><td><code>femaleVariant</code></td><td>Hand Of Midas</td><td>the default translationse</td></tr><tr><td><code>maleVariant</code></td><td></td><td>only set this if you want to show a different translation when your item is equipped by a person of the male body gender</td></tr><tr><td><code>primaryKey</code></td><td>0</td><td>The <em>actual</em> entry in the translation list, make sure to set this to 0 so that it's autogenerated</td></tr><tr><td><code>secondaryKey</code></td><td><code>MC_gun_name</code></td><td>The key used in tweak files to identify this translation string</td></tr></tbody></table>

{% hint style="warning" %}
`secondaryKey`s must be **globally unique**, or they will overwrite each other.
{% endhint %}

Create another entry with the secondaryKey of `MC_gun_description` and write a little fluff text for the description.

{% hint style="info" %}
For more detailed guidance on these properties, check out the [ArchiveXL Wiki](https://github.com/psiberx/cp2077-archive-xl/wiki#localization).
{% endhint %}

### Tell ArchiveXL about our new translation file.

In your WolvenKit project, go to the resources folder and create a plain text file with the following contents:

```yaml
localization:
  onscreens:
    en-us: midas_collection\localization\en-us.json
```

Rename this file to `midas_collection.archive.xl`.

{% hint style="info" %}
Wolvenkit will move the .xl file to the same directory as your mod's .archive file, where ArchiveXL will see and process it.
{% endhint %}

Next, revisit your "hand\_of\_midas" tweak file to establish the weapon's name and description in the game.

Add the following lines under the existing properties:

```yaml
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default
  crosshair: Crosshairs.Tech_Round
  displayName: LocKey("MC_gun_name")
  localizedDescription: LocKey("MC_gun_description")
```

{% hint style="warning" %}
This `localizedDescription:` is **not** the yellow text you see on the weapon, but the red-colored description that is shown in the Inspect screen. \
The text that is shown (as yellow-colored) on the weapon is instead defined in the `UIData` of the Iconic Mod (at Step 12)
{% endhint %}



These lines set the display name and the description of your weapon using the keys defined in your localization file. The **values** on the right side of the `:` must match the `secondaryKey` values from your `en-us.json` file and be **globally unique**.

After completing these steps, install your mod and launch the game. Your new weapon, "Hand Of Midas", should now appear with its unique name and description, fully integrated into Cyberpunk 2077's multi-language environment.

<figure><img src="../../../../.gitbook/assets/image (219).png" alt=""><figcaption><p>Name &#x26; Description of the gun are now taken from "en-us.json" that we've created</p></figcaption></figure>

## Step 7: Make it Iconic

To elevate the 'Hand of Midas' to its iconic status, we need to modify the `.yaml` again, where we set all of the gun's unique features:

```yaml
# Hand of Midas weapon tweak
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default # $base makes it so all the properties are taken from the specified tweak (in this case, "Items.Preset_Unity_Default") and the properties specified in this tweak overwrite the parent.
  crosshair: Crosshairs.Tech_Round # other crosshairs can be found by looking for "Crosshairs." in Tweak Browser
  displayName: LocKey("MC_gun_name") # name of the gun (will be fetched from "LocKey#MC_gun_name" secondary key in "en-us.json")
  localizedDescription: LocKey("MC_gun_description") # description of the gun (can be seen when previewing the gun from inventory with "V" key)
  tags:
    - !append IconicWeapon # prevent the gun from being dissassembled
  statModifiers:
    - !append Quality.IconicItem # makes the weapon iconic
  statModifierGroups:
    - !append Items.IconicQualityRandomization # necessary for ingame upgrade
    - !remove Items.QualityRandomization # to prevent stacking with the previous
```

The new things you're seeing are `arrays`, which is a technical term — you can think of them as lists, since they can hold multiple items.

{% hint style="info" %}
You can read more about how array operations work in [TweakXL](https://github.com/psiberx/cp2077-tweak-xl/wiki/YAML-Tweaks#array-operations).
{% endhint %}

`statModifiers` will hold all the stats for your gun. from recoil to damage. Since the `$base: Items.Preset_Unity_Default` already defines `statModifiers`, and we'd like to keep those.\
So we're adding an entry to the list, using`!append-once` followed by the new entry `Quality.IconicItem`.

This makes the weapon iconic, which means:

* it has a fancy golden background
* there's a dialogue box when you disassemble it

To prevent it from being disassembled, we also add `IconicWeapon` to its `tags` array.

#### Go test

Once these modifications are in place, install your mod and enjoy the newfound Iconic status of the 'Hand of Midas' in the game.

<figure><img src="../../../../.gitbook/assets/image (211).png" alt=""><figcaption><p>Setting "Quality.IconicItem" will give it a special background in the inventory &#x26; also specify that the item is Iconic.</p></figcaption></figure>

Technically, you've already made a new Iconic weapon & I should call quits on this tutorial, but it's never as easy as that, is it? Give yourself a pat on the back & onto the next step.

## Step 8: Finishing up the Tweak

There are a lot of values to play around with in a tweak file. You are often better off leaving most of them alone. These are some properties you probably should look at when designing a gun.

1.  Blueprint (mandatory change for iconic weapons)

    ```yaml
    Items.Hand_Of_Midas:
      #...
      blueprint: Items.Iconic_Ranged_Weapon_Blueprint # blueprint decides what kind of attachments/mods are allowed on a weapon
    ```
2.  Item Quality (optional)

    ```yaml
    Items.Hand_Of_Midas:
      #...  
      quality: Quality.Rare # minimum item quality
    ```
3.  Buy & Sell Price (optional) (fixed value example)

    <pre class="language-yaml"><code class="lang-yaml"><strong>Items.Hand_Of_Midas:
    </strong>  #...
      buyPrice:
        - Price.Hand_Of_Midas
        - Price.BuyPrice_StreetCred_Discount
      sellPrice:
        - Price.Hand_Of_Midas
        - Price.WeaponSellMultiplier

    # Static price for Hand of Midas
    Price.Hand_Of_Midas:
      $type: ConstantStatModifier
      value: 100000
      modifierType: Additive
      statType: BaseStats.Price
    </code></pre>

## Step 9: Making an Iconic Mod (Special Ability & Stats)

The main thing that makes an iconic weapon so special is its iconic mod. These are like any other weapon mod, but hidden from the UI. \
They carry the Stat changes from the base model of the weapon, the golden text description on the UI Tooltip and any dedicated Effectors.

Before you start hacking up your own, it is very important you have a look at the existing Iconic Mods in game.

For now, let's look at `Items.Preset_Lexington_Wilson` (also known as "Dying Night").

{% hint style="info" %}
A big part of tweak modding is exploration — poking through tweaks until you find just the right thing to copy or change, or looking for something specific in hundreds of files.
{% endhint %}

### Wilson's iconic iron

{% hint style="info" %}
The example (together with instructions on finding your way around the TweakDB) has moved to [browsing-the-tweak-database.md](../../../../for-mod-creators-theory/tweaks/tweaks/browsing-the-tweak-database.md "mention") -> [#example-browsing-.tweak-files](../../../../for-mod-creators-theory/tweaks/tweaks/browsing-the-tweak-database.md#example-browsing-.tweak-files "mention")
{% endhint %}

We'll end up with `WilsonWeaponMod` (slotted on the weapon) and `WilsonWeaponModAbility` (`GameplayLogicPackage` of the previous)

<details>

<summary><code>iconic_mods.tweak</code></summary>

```
WilsonWeaponMod : IconicWeaponModBase
{
    OnAttach = 
    [
       "Items.WilsonWeaponModAbility"
    ];
    statModifiers += 
    [
       {
          statType = "BaseStats.ReloadTimeBonus";
          modifierType = "Additive";
          value = -0.1f;
       } : ConstantStatModifier 
    ];
}
```

</details>

<details>

<summary><code>mods_abilities.tweak</code></summary>

```
WilsonWeaponModAbility : IconicWeaponModAbilityBase
{
    UIData = 
    {
       iconPath = "ability_offensive";
       localizedDescription = "LocKey#50743";
    };
    effectors = 
    [
       {
          prereqRecord = "Prereqs.ProcessHitTriggered";
          percentMult = 0.25f;
          unitThreshold = 10f;
       } : MultiplyDamageWithVelocity, 
       {
          prereqRecord = "Perks.IsHitQuickMelee";
          value = 1.5f;
       } : MultiplyDamage
    ];
}
```

</details>

For an explanation of what these do, please see [types-of-tweak-records.md](../../../../for-mod-creators-theory/tweaks/tweaks/types-of-tweak-records.md "mention") -> [#effector](../../../../for-mod-creators-theory/tweaks/tweaks/types-of-tweak-records.md#effector "mention")

### Adding an iconic mod

We have found the iconic mod of Wilson's gun, so now let's see that we apply the same structure to the Hand of Midas.

Since our weapon demands perfection, we'll punish the player for not hitting headshots & reward them for hitting headshots. And because we want to make it hurt, we'll use HP reduction & Healing rewards.

{% hint style="info" %}
You can add the tweaks below to your weapon's yaml file or create a new one.
{% endhint %}

```yaml
# Hand of Midas weapon tweak
Items.Hand_Of_Midas:
  # your other properties - cut out for readability
  slotPartListPreset: # attachments & mods 
    - !append
      $type: SlotItemPartPreset
      itemPartPreset: Items.Cranial_Cashback_Mod # iconic mod
      slot: AttachmentSlots.IconicWeaponModLegendary 
```

Will make it so the weapon has this iconic mod slotted in the appropriate modslot, on weapon acquisition.

#### Defining the mod

This is the stage where we define how the stats of this weapon will differ from its base variant, plus add a reference to the "mod ability" record that holds the gold description and any desired Effectors

```yaml
# Hand of Midas Iconic mod
Items.Cranial_Cashback_Mod:
  $base: Items.IconicWeaponModBase
  OnAttach: 
    - Items.Cranial_Cashback
  statModifiers:
    - !append
      $type: ConstantStatModifier
      statType: BaseStats.ReloadTimeBonus # modifies reload time (without influence to DamagePerHit)
      modifierType: Additive
      value: -0.20
    - !append
      $type: ConstantStatModifier
      statType: BaseStats.MagazineCapacityBonus # multiplier on total mag size (without influence to DamagePerHit)
      modifierType: Additive
      value: 0.34
    - !append
      $type: ConstantStatModifier
      statType: BaseStats.DamagePerHit # Direct change to damage per hit
      modifierType: Multiplier
      value: 1.1
```

{% hint style="success" %}
You can find an overview of existing weapon stats under [cheat-sheet-weapon-basestats.md](../../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-tweak-ids/weapons/cheat-sheet-weapon-basestats.md "mention")
{% endhint %}

{% hint style="info" %}
StatModifiers will stack with all other StatModifiers present on the weapon
{% endhint %}

#### Defining the ability

In this section, we first define our special ability `Items.Cranial_Cashback`:

```yaml
# Hand of Midas Iconic mod ability
Items.Cranial_Cashback:
  $base: Items.IconicWeaponModAbilityBase
  # effectors:
  #   - Effectors.Punish_Miss
  #   - Effectors.Heal_On_Headshot
  UIData:
    $type: GameplayLogicPackageUIData
    localizedDescription: LocKey("MC_gun_iconic_description") # iconic description shown in yellow text when hovering over a weapon
```

The ability contains

* two [effectors](../../../../for-mod-creators-theory/tweaks/tweaks/types-of-tweak-records.md#effector), which we are yet to implement
* the description for our iconic ability as a `localizedDescription`

Let's start by registering the description.

1. Open the `.json` file that you've created when [#setting-up-a-localizationkey](new-iconic-weapon-tutorial-for-dummies.md#setting-up-a-localizationkey "mention")
2. Add another entry (you can duplicate an existing entry)
3. Set the `secondaryKey` to the value in your tweak file, `MC_gun_iconic_description`
4. Set `femaleVariant` to your text — this will be showin on the tooltip in yellow.
5. . Make sure that it has the correct secondary key , and enter your fluff text as `femaleVariant`.

Now that we have an ability, we need to register it as a mod:

Everything hangs together now, let's see if it works.

<details>

<summary>Full mod adding</summary>

```yaml
# Hand of Midas weapon tweak
Items.Hand_Of_Midas:
  #...
  slotPartListPreset: # attachments & mods 
    - !append-once
      $type: SlotItemPartPreset
      itemPartPreset: Items.Cranial_Cashback_Mod # iconic mod
      slot: AttachmentSlots.IconicWeaponModLegendary 

# Hand of Midas Iconic mod
Items.Cranial_Cashback_Mod:
  $base: Items.IconicWeaponModBase
  OnAttach: 
    - Items.Cranial_Cashback
  statModifiers:
    - $type: ConstantStatModifier
      statType: BaseStats.ReloadTimeBonus # modifies reload time (without influence to DamagePerHit)
      modifierType: Additive
      value: -0.20
    - $type: ConstantStatModifier
      statType: BaseStats.MagazineCapacityBonus # multiplier on mag size (without influence to DamagePerHit)
      modifierType: Additive
      value: 0.34
    - $type: ConstantStatModifier
      statType: BaseStats.DamagePerHit # Direct change to damage per hit
      modifierType: Multiplier
      value: 1.1

# Hand of Midas Iconic mod ability
Items.Cranial_Cashback:
  $base: Items.IconicWeaponModAbilityBase
  # effectors:
  #   - Effectors.Punish_Miss
  #   - Effectors.Heal_On_Headshot
  UIData:
    $type: GameplayLogicPackageUIData
    localizedDescription: LocKey("MC_gun_iconic_description") # iconic description shown in yellow text when hovering over a weapon
```

</details>

#### Go test

Install your mod — if your gun shows the yellow iconic description on hover, you're good to go.\
If not, you may have to respawn it via CET.

<figure><img src="../../../../.gitbook/assets/image (278).png" alt=""><figcaption><p>Iconic description is visible when hovering over gun</p></figcaption></figure>

### Designing effectors

Now that we have [#the-full-tweak](new-iconic-weapon-tutorial-for-dummies.md#the-full-tweak "mention"), we'll fill in the two [effectors](../../../../for-mod-creators-theory/tweaks/tweaks/types-of-tweak-records.md#effector), one to punish the player for missing, and the other to reward them for headshots.

#### Heal on headshot

We'll heal for 80 HP every time the player pops somebody else's skull with the Hand of Midas. How do we do that?

Let's do what Edison did — we find something to be inspired by. A search for `effector` in the [Tweak Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser "mention") finds an awful lot of entries, so I've picked an example for us — a Netrunner item that restores memory:

```yaml
Items.MemoryReplenishmentEffector:
  $type: ModifyStatPoolValueEffector
  setValue: False
  usePercent: True
  effectorClassName: ModifyStatPoolValueEffector
  prereqRecord: Items.MemoryReplenishmentEffector_inline0
  removeAfterActionCall: False
  removeAfterPrereqCheck: False
  statPoolUpdates:
    - Items.MemoryReplenishmentEffector_inline4
  statModifierGroups: []
```

The player's health is also a statPool item, it's called `BaseStatPools.Health`. We can copy this example and change it to meet our needs (for the final result, see [#the-final-effector](new-iconic-weapon-tutorial-for-dummies.md#the-final-effector "mention")):

```yaml
Effectors.Heal_On_Headshot:
  $type: ModifyStatPoolValueEffector
  setValue: False
  usePercent: True
  effectorClassName: ModifyStatPoolValueEffector
  prereqRecord: Items.MemoryReplenishmentEffector_inline0
  removeAfterActionCall: False
  removeAfterPrereqCheck: False
  statPoolUpdates: 
    - $type: StatPoolUpdate
      statPoolType: BaseStatPools.Health
      statPoolValue: 80
  statModifierGroups: []
```

However, the prerequisite for this effector is `Items.MemoryReplenishmentEffector_inline0`, which doesn't sound helpful.

We could now try to find an existing preReq that checks for headshots, but we can also write our own.

#### Creating a custom prereq

<pre class="language-yaml"><code class="lang-yaml"><strong># Prereq to check if headshot &#x26; target is alive and hit with a ranged weapon
</strong>Prereqs.Is_Target_Alive_And_Headshot:
  $type: HitPrereq
  callbackType: HitTriggered
  ignoreSelfInflictedPressureWave: True
  isSynchronous: True
  pipelineStage: Process
  pipelineType: Damage
  prereqClassName: HitTriggeredPrereq # how to refer to it later - Prereqs.HitTriggeredPrereq
  conditions:
    - Perks.IsHitTargetAlive_inline2 # hit target is alive (health != 0)
    - Perks.HitIsBodyPartHead_inline0 # headshot condition
    - Prereqs.Is_Attack_Ranged # condition to check if it's the bullet hitting the target and not a quick melee
    - Prereqs.Is_Weapon_Ranged # condition to check that the gun is source of damage and not a grenade
  processMiss: False # process shots that hit npcs only
</code></pre>

Now we have a custom preqrequisite, but we still have to **fine-tune** and **link it**:

#### Creating a custom condition

{% hint style="info" %}
For more information on this, check [types-of-tweak-records.md](../../../../for-mod-creators-theory/tweaks/tweaks/types-of-tweak-records.md "mention") ->[#condition](../../../../for-mod-creators-theory/tweaks/tweaks/types-of-tweak-records.md#condition "mention")
{% endhint %}

```yaml
# Condition to check if attack type is ranged
Prereqs.Is_Attack_Ranged:
  $type: HitPrereqCondition
  invert: False
  onlyOncePerShot: True
  type: Prereqs.AttackType
  attackType: Ranged

# Condition to check if weapon type is ranged
Prereqs.Is_Weapon_Ranged:
  $type: HitPrereqCondition
  invert: False
  onlyOncePerShot: True
  type: Prereqs.WeaponType
  weaponType: Ranged
```

Conditions are at the heart of a prerequisite, and here we have four.

1. `Perks.IsHitTargetAlive_inline2` -> We don't want headshots on deadbodies to heal the player
2. `Perks.HitIsBodyPartHead_inline0` -> Actual condition to check for headshots
3. `Prereqs.Is_Attack_Ranged` -> (Custom) We don't want quick melee attacks to heal
4. `Prereqs.Is_Weapon_Ranged` -> (Custom) We don't want grenades to be counted for this check.

#### The final effector

Now let's change our effector to use this prerequisite.

```yaml
# Effector to heal player if they hit a headshot
Effectors.Heal_On_Headshot:
  $type: ModifyStatPoolValueEffector
  prereqRecord: Prereqs.Is_Target_Alive_And_Headshot
  usePercent: False
  statPoolUpdates: 
    - $type: StatPoolUpdate
      statPoolType: BaseStatPools.Health
      statPoolValue: 80
```

Instead of punishing the player for just missing headshots, we can make our job easier by removing the HP every time they shoot, and compensating for the reduction in HP when hitting headshots by increasing our heal. Here's how we can do that:

```yaml
# Effector to inflict damage on player when they shoot
Effectors.Punish_Miss:
  $type: ModifyStatPoolValueEffector
  prereqRecord: Prereqs.Has_Player_Shot
  usePercent: False
  statPoolUpdates: 
    - $type: StatPoolUpdate
      statPoolType: BaseStatPools.Health
      statPoolValue: -20

# Prereq to check if the player has shot (bug - currently detects if a player has hit anything, not if shot)
Prereqs.Has_Player_Shot:
  $type: HitPrereq
  callbackType: HitTriggered
  ignoreSelfInflictedPressureWave: True
  isSynchronous: True
  pipelineStage: PreProcess
  pipelineType: All
  prereqClassName: HitOrMissTriggeredPrereq
  processMiss: True # process shots that miss npcs
  conditions:
    - Prereqs.Is_Attack_Ranged # condition to check if it's the bullet hitting the target and not a quick melee
    - Prereqs.Is_Weapon_Ranged # condition to check that the gun is source of damage and not a grenade
```

#### Test it!

Uncomment the effector in your weapon tweak and test your mod. You should now be healing every time you hit headshots.

<details>

<summary>The full tweak file</summary>

```yaml
# Hand of Midas weapon tweak
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default # $base makes it so all the properties are taken from the specified tweak (in this case, "Items.Preset_Unity_Default") and the properties specified in this tweak overwrite the parent.
  blueprint: Items.Iconic_Ranged_Weapon_Blueprint # blueprint decides what kind of attachments/mods are allowed on a weapon
  crosshair: Crosshairs.Tech_Round # other crosshairs can be found by looking for "Crosshairs." in Tweak Browser
  displayName: LocKey("MC_gun_name") # name of the gun (will be fetched from "LocKey#MC_gun_name" secondary key in "en-us.json")
  localizedDescription: LocKey("MC_gun_description") # description of the gun (can be seen when previewing the gun from inventory with "V" key)
  quality: Quality.Rare # minimum item quality
  tags:
    - !append IconicWeapon # prevent the gun from being dissassembled
  statModifiers: # stats for a weapon - reload time/aim speed/magazine size/recoil kick/damage per second/etc.
    - !append Quality.IconicItem # makes the weapon iconic
  statModifierGroups: # stats for a weapon also, but grouped (generally by category)
    - !append Items.IconicQualityRandomization # necessary for ingame upgrade
    - !remove Items.QualityRandomization # to prevent stacking with the previous
  slotPartListPreset: # attachments & mods 
    - !append
      $type: SlotItemPartPreset
      itemPartPreset: Items.Cranial_Cashback_Mod # iconic mod
      slot: AttachmentSlots.IconicWeaponModLegendary
  buyPrice:
    - Price.Hand_Of_Midas
    - Price.BuyPrice_StreetCred_Discount
  sellPrice:
    - Price.Hand_Of_Midas
    - Price.WeaponSellMultiplier
    
Price.Hand_Of_Midas:
  $type: ConstantStatModifier
  value: 100000
  modifierType: Additive
  statType: BaseStats.Price

Items.Cranial_Cashback_Mod:
  $base: Items.IconicWeaponModBase
  OnAttach: 
    - Items.Cranial_Cashback
  statModifiers:
    - !append
      $type: ConstantStatModifier
      statType: BaseStats.ReloadTimeBonus # modifies reload time (without influence to DamagePerHit)
      modifierType: Additive
      value: -0.20
    - !append
      $type: ConstantStatModifier
      statType: BaseStats.MagazineCapacityBonus # multiplier on mag size (without influence to DamagePerHit)
      modifierType: Additive
      value: 0.34
    - !append
      $type: ConstantStatModifier
      statType: BaseStats.DamagePerHit # Direct change to damage per hit
      modifierType: Multiplier
      value: 1.1

Items.Cranial_Cashback:
  $base: Items.IconicWeaponModAbilityBase
  effectors:
    - Effectors.Punish_Miss
    - Effectors.Heal_On_Headshot
  UIData:
    $type: GameplayLogicPackageUIData
    localizedDescription: LocKey("MC_gun_iconic_description") # iconic description shown in yellow text when hovering over a weapon

# -------------------------------------------------------------------------------------------------------------------------

# Effector to inflict damage on player when they shoot
Effectors.Punish_Miss:
  $type: ModifyStatPoolValueEffector
  prereqRecord: Prereqs.Has_Player_Shot
  usePercent: False
  statPoolUpdates: 
    - $type: StatPoolUpdate
      statPoolType: BaseStatPools.Health
      statPoolValue: -20

# Effector to heal player if they hit a headshot
Effectors.Heal_On_Headshot:
  $type: ModifyStatPoolValueEffector
  prereqRecord: Prereqs.Is_Target_Alive_And_Headshot
  usePercent: False
  statPoolUpdates: 
    - $type: StatPoolUpdate
      statPoolType: BaseStatPools.Health
      statPoolValue: 80

# -------------------------------------------------------------------------------------------------------------------------

# Prereq to check if the player has shot (bug - currently detects if a player has hit anything, not if shot)
Prereqs.Has_Player_Shot:
  $type: HitPrereq
  callbackType: HitTriggered
  ignoreSelfInflictedPressureWave: True
  isSynchronous: True
  pipelineStage: PreProcess
  pipelineType: All
  prereqClassName: HitOrMissTriggeredPrereq
  processMiss: True # process shots that miss npcs
  conditions:
    - Prereqs.Is_Attack_Ranged # condition to check if it's the bullet hitting the target and not a quick melee
    - Prereqs.Is_Weapon_Ranged # condition to check that the gun is source of damage and not a grenade

# Prereq to check if headshot & target is alive and hit with a ranged weapon
Prereqs.Is_Target_Alive_And_Headshot:
  $type: HitPrereq
  callbackType: HitTriggered
  ignoreSelfInflictedPressureWave: True
  isSynchronous: True
  pipelineStage: Process
  pipelineType: Damage
  prereqClassName: HitTriggeredPrereq
  conditions:
    - Perks.IsHitTargetAlive_inline2 # hit target is alive (health != 0)
    - Perks.HitIsBodyPartHead_inline0 # headshot condition
    - Prereqs.Is_Attack_Ranged # condition to check if it's the bullet hitting the target and not a quick melee
    - Prereqs.Is_Weapon_Ranged # condition to check that the gun is source of damage and not a grenade
  processMiss: False # process shots that hit npcs only

# -------------------------------------------------------------------------------------------------------------------------

# Condition to check if attack type is ranged
Prereqs.Is_Attack_Ranged:
  $type: HitPrereqCondition
  invert: False
  onlyOncePerShot: True
  type: Prereqs.AttackType
  attackType: Ranged

# Condition to check if weapon type is ranged
Prereqs.Is_Weapon_Ranged:
  $type: HitPrereqCondition
  invert: False
  onlyOncePerShot: True
  type: Prereqs.WeaponType
  weaponType: Ranged
```

</details>

## Bonus: Audio - Gun Go Boom

Firing sounds of guns are dictated by the value of their `audioName` flat.\
Swapping them to those of another gun is as easy as changing that value.&#x20;

```yaml
# Hand of Midas weapon tweak
Items.Hand_Of_Midas:
  # ...
  audioName: wea_set_liberty_dex
  # ...
```

{% hint style="success" %}
For a list of soundsets already in the game, refer to [cheat-sheet-weapon-audio.md](../../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-tweak-ids/weapons/cheat-sheet-weapon-audio.md "mention")
{% endhint %}

{% hint style="danger" %}
Beware that firing sounds are, natively, separately set for each firing mode.

Meaning, for example, giving the `audioName` of a weapon that usually fires as Burst to a weapon that doesn't could result in missing sounds (or the other way around).&#x20;

Having [Trigger Mode Control](https://www.nexusmods.com/cyberpunk2077/mods/13077) installed passively fixes this problem in the background, allowing for correct sounds on all firemode combinations.\
(refer to its own [documentation](https://github.com/Seijaxx/TriggerModeControl/wiki/rangedAttacks-and-triggerModes) if interested about how to customize firemodes and attack types)
{% endhint %}

#### Adding custom sounds

We can add custom sounds using RedMod but, due to how that works (as a replacer), we could end up influencing other guns and/or generating conflicts.

<figure><img src="../../../../.gitbook/assets/image (214).png" alt=""><figcaption><p>An explanation for how audio works internally, should you decide to go the RedMod route.</p></figcaption></figure>

## Summary: The iconic weapon in action

Here's a demo for how iconic weapon should behave.

<figure><img src="../../../../.gitbook/assets/Untitled video - Made with Clipchamp.gif" alt=""><figcaption><p>Heal on headshot demo</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/Untitled video - Made with Clipchamp (1).gif" alt=""><figcaption><p>Damage player on miss demo</p></figcaption></figure>

You are now a certified weapon modder. Pat your self on the back twice, you've done it.\
\
A special request from me (@DestinyBu). If you found this guide helpful, go ahead and document your own findings on the Wiki and maybe ping me if you ever get around to finishing your Mod. A big thanks to [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")for (inspiring) forcing me to do this.

## Troubleshooting (Check this when you're stuck)

You've created/modified a tweak but it doesn't show effect in game, what next?

* Open the CET Console in game search for your Tweak in the [Tweak Browser](https://app.gitbook.com/s/-MP5jWcLZLbbbzO-_ua1-887967055/console/usage-1). If your tweak doesn't show, there's a validation error in the tweak.
* Validate your .yaml tweaks [here ](https://www.yamllint.com/)to check for errors.
* **Open** `Cyberpunk 2077\red4ext\plugins\TweakXL\TweakXL.log` **and look for any error messages** towards the end, this can help when TweakXL has issues loading a tweak.
*   Check for other mods with same Tweak/Archive names.

    Tweak Folder - `Cyberpunk 2077\r6\tweaks`

    Archive Folder - `Cyberpunk 2077\archive\pc\mod`
* Look at WolvenKit logs located towards the bottom. Yellow or Red text means there's warnings/errors in your file that need addressing.
