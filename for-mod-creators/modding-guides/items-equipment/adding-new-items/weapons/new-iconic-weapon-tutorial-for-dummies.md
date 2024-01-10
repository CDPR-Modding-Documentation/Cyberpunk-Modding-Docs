---
description: >-
  We're creating a fully-featured new Iconic weapon, 'Hand of Midas', complete
  with two distinctive Iconic attachments, each boasting a unique special
  ability and custom skin.
cover: ../../../../../.gitbook/assets/merchants_of_death_ultrawide.png
coverY: 46
layout:
  cover:
    visible: true
    size: full
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: true
---

# ☠ New Iconic Weapon : Tutorial for Dummies

{% hint style="danger" %}
This article is a stub and is not done yet! It's still missing the following sections:&#x20;

* Creating a unique weapon skin
* Adding iconic mods
* Creating custom attachments
{% endhint %}

## Prerequisites

Before beginning, ensure you have the following software installed and properly set up:

1. **WolvenKit (8.12+)** - [Installed & Setup](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/getting-started/download)
2. **MLSB (MultiLayerSetupBuilder 1.6.7+)** - [Installed & Setup](../../../../modding-tools/mlsetup-builder/#installation)
3. **A text editor:** [Notepad++](https://notepad-plus-plus.org/downloads/) or, if you want to get fancy, [Visual Studio Code](https://app.gitbook.com/s/-McniwB8YOK2HnJ7SYg\_/getting-started)
4. **Cyberpunk 2077** - 😑
5. Core mods: [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198), [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197), [Red4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380)
6. Optional: [RedHotTools](https://github.com/psiberx/cp2077-red-hot-tools/releases/)

## Step 1: Create a New Project in WolvenKit

Start by opening WolvenKit and create a new project. This will be the base for your new iconic weapon mod.

<figure><img src="../../../../../.gitbook/assets/image (179).png" alt=""><figcaption><p>Create a new WolvenKit project as shown here</p></figcaption></figure>

<figure><img src="../../../../../.gitbook/assets/image (180).png" alt=""><figcaption><p>A clean project should look like this (as of Wolvenkit 8.12, your interface may look different)</p></figcaption></figure>

## Step 2: Choose the weapon and create an override

Decide on the weapon you want to modify to make a new new iconic.&#x20;

{% hint style="info" %}
For this tutorial, we will use the gun 'Unity' as our base (`Items.Preset_Unity_Default).` If you want to use a different weapon, you can refer to [spawn-codes-baseids-hashes.md](../../../../references-lists-and-overviews/equipment/spawn-codes-baseids-hashes.md "mention") or find a list of all in-game items [here](https://onedrive.live.com/view.aspx?resid=EF6891140DE637B3%21221903\&authkey=!AE\_n4RTzwmVHwy8).
{% endhint %}

To understand how the base gun works, open the [Tweak Browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser "mention") in WolvenKit and search for `Items.Preset_Unity_Default`.

<figure><img src="../../../../../.gitbook/assets/image (182).png" alt=""><figcaption><p>Open the <a data-mention href="https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser">Tweak Browser</a> &#x26; search "Items.Preset_Unity_Default"</p></figcaption></figure>

After locating the Unity gun in the tweak browser, right-click on the item and select "Add TweakXL Override". This allows you to modify and customize the weapon’s attributes to create your new iconic weapon.

<figure><img src="../../../../../.gitbook/assets/image (185).png" alt=""><figcaption><p>Red arrow = Tweak Name, where you can override it. Blue Box= Details about selected tweak. White arrow = Overridden (New) Tweak </p></figcaption></figure>

{% hint style="info" %}
To read more about Tweak modding, check [tweaks.md](../../../../files-and-what-they-do/tweaks.md "mention"). This isn't necessary for understanding this guide!
{% endhint %}

## Step 3: Editing and understanding your new tweak

Open the overridden tweak file in a code editor of your choice (such as [Notepad++](https://notepad-plus-plus.org/downloads/) or VS Code). You will be presented with a `.yaml` file containing roughly a million fields.

<figure><img src="../../../../../.gitbook/assets/image (186).png" alt=""><figcaption><p>"Items.Preset_Unity_Default" tweak opened in VS Code</p></figcaption></figure>

### How does it work?

{% hint style="info" %}
For first time modders, understanding all this in one go will be difficult. You can just keep these explanations handy and revisit them when required.
{% endhint %}

The .yaml file may seem complex at first glance, but the actual structure is extremely simple. Your weapon has properties – those stand on the left side of the `:`, such as `ammo`. The properties have different values, and those stand on the right side of the `:`, such as `Ammo.RifleAmmo`.

#### An annotated example

Here's a breakdown of key fields in a different weapon (`Items.Preset_Sidewinder_Default`) : (Thanks to BuffMcMuff)

<pre class="language-yaml"><code class="lang-yaml"><strong>Items.Preset_Sidewinder_Default: # item "code" for your weapon. use this when giving item.
</strong>  $type: gamedataWeaponItem_Record # the type of record. (records need to be defined with either a $type or a $base)
  ammo: Ammo.RifleAmmo # ammo type used (Fun Fact: Dex's Gun has ammo type - Items.Money)
  baseEmptyReloadTime: 1.54999995 # base reload time when mag empty NOTE: DO NOT EDIT RELOAD SPEED HERE see statModifierGroups: Items.Base_Sidewinder_Handling_Stats
  baseReloadTime: 1.54999995 # base reload time when mag is not empty NOTE: DO NOT EDIT RELOAD SPEED HERE see statModifierGroups: Items.Base_Sidewinder_Handling_Stats
  damageType: DamageTypes.Physical # damage type
  effectiveRangeFalloffCurve: StandardFalloff # damage fall of curve
  evolution: WeaponEvolution.Smart # what type of weapon none, power, tech and smart for ranged weps
  forcedMinHitReaction: -1 # TODO
  fxPackage: WeaponFxPackage.SmartRifle # visual effects used for bullets. trail, bullet hole, impact, etc
  fxPackageQuickMelee: WeaponFxPackage.QuickMeleeFxPackage # TODO
  hudIcon: HUDWeaponIcons.Sidewinder # hud icon used
  IsIKEnabled: False # are inverse kinematics enabled.
  manufacturer: WeaponManufacturer.Corporation # weapon manufacturer type. not sure if used ingame.
  primaryTriggerMode: TriggerMode.FullAuto # trigger mode when hip firing and aiming if secondaryTriggerMode is not set.
  projectileEaseOutCurveName: ProjectileEaseOut # TODO
  rangedAttacks: Attacks.SmartBulletLowPackage # what type of bullet to fire. explosive, smart, projectile, standard hitscan, etc
  triggerEffectName: te_wea_aim_mid # TODO
  uninterruptibleEmptyReloadStart: 0.5 # point after which reload cannot be cancelled by other animations such as running. with empty mag
  uninterruptibleReloadStart: 0.5 # point after which reload cannot be cancelled by other animations such as running. with non empty mag
  useForcedTBHZOffset: False # Time before hit offset? used by npc
  UseShootVFXOnlyOnFirstShot: False # if bullet vfx is used again when firing in non semi-auto
  animFeatureName: WeaponData # TODO
  animName: ui_garment_pose # TODO
  animSetResource: '' # TODO
  appearanceResourceName: Preset_Sidewinder_Default # used to set .app file used by weapon
  audioName: wea_set_sidewinder # used to set weapon sounds not related to reloading and and first equip anim.
  blueprint: Items.Base_Smart_AR_SMG_LMG_NoAttachments_Blueprint # "blueprint" used to create the gun. different versions for guns with no barrel or scope attachments. also generic ones for iconics
  crosshair: Crosshairs.SmartGun # what crosshairs to use
  deprecated: False # TODO. used with items from before v2.0?
  dropObject: defaultItemDrop # TODO
  enableNpcRPGData: True # if npc should use npcRPGData found below
  entityName: weapon_root # TODO
  equipArea: EquipmentArea.Weapon # equip area. see equipment.EX
  friendlyName: w_rifle_assault_nokota_sidewinder # used to set player arm animations in first person see player_ma_fpp.ent and player_wa_fpp.ent. reload and first equip sounds are set in .anims files also. see weapon anim files beginning with pwa_ and pma_
  garmentOffset: 0 # TODO
  icon: UIIcon.ItemIcon # Used when setting inventory icon
  iconPath: '' # Used when setting inventory icon
  isCached: False # TODO
  isCoreCW: False # TODO
  isCustomizable: False # TODO
  isGarment: False # TODO
  isPart: False # this is set to true in weapon parts such as scopes
  isSingleInstance: False # TODO
  itemCategory: ItemCategory.Weapon # item category used for inventory
  itemSecondaryAction: ItemAction.Equip # second action shown when looking at weapon on the ground for example.
  itemType: ItemType.Wea_Rifle # what type of item. used in inventory and perks i think? maybe affects animations?
  localizedName: '' # TODO
  mass: 20 # weight of weapon.
  minigameInstance: minigame_v2.DefaultItemMinigame # TODO
  npcRPGData: Items.Base_Sidewinder_inline1 # stats used when the weapon is equipped by an NPC
  parentAttachmentType: ParentAttachmentType.Slot # used for weapon attachments such as scopes and muzzles
  powerLevelDeterminedByParent: False # TODO. not used since 2.0?
  quality: Quality.Random # default quality for weapon. CET ignores Quality.Random and always gives normal. Other quality settings work fine in CET and random works normally when found normally ingame.
  qualityRestrictedByParent: False # TODO
  replicateWhenNotActive: False # TODO
  stateMachineName: Weapon # used by game logic.
  upgradeCostMult: 1 # TODO
  useHeadgearGarmentAggregator: False # TODO. probably not used by weapons?
  useNewSpawnMethod: False # TODO
  usesVariants: False # TODO
  savable: False # TODO
  attacks: # used to set different types of projectiles that can be shot by the gun. not used in 2.0?
    - Attacks.Bullet_GameEffect
       ...
    - Attacks.ChimeraPowerMod_ExplosiveBulletEffect
  gameplayDescription: LocKey#92674 # used to set the description when inspecting weapon.
  ikOffset: {x: 0, y: 0, z: 0}
  shootingPatternPackages: [] # used by npc
  triggerModes: # trigger modes available to weapon. should have primary and secondary trigger modes here also
    - TriggerMode.FullAuto
  animationParameters: [] # TODO
  appearanceSuffixes: [] # TODO
  appearanceSuffixesOwnerOverride: [] # TODO
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
  cameraForward: {x: 0, y: 0, z: 0} # TODO
  cameraUp: {x: 0, y: 0, z: 0} # TODO
  connections: [] # TODO
  displayName: LocKey#3599 # name of weapon
  equipAreas: [] # TODO
  equipPrereqs: [] # TODO. used by game logic packages(GLP)?
  gameplayRestrictions: # restrict weapon usage in certain situations.
    - GameplayRestriction.VehicleCombatNoInterruptions
  hairSkinnedMeshComponents: []
  localizedDescription: LocKey#3600 # white text description when hovering over an item.
  OnAttach: # used to apply effects to player and weapon whean equipping weapon. stamina regen speed, stagger when shooting, etc
    - Items.Base_Assault_Rifle_inline0
    - EquipmentGLP.MediumStaminaRegen
    - EquipmentGLP.LightStaminaDelay
    - Items.SmartWeaponTargetsPriorityQueues
  OnEquip: [] # TODO
  OnLooted: [] # TODO
  parts: [] # TODO
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
  weakspots: [] # TODO
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

## Step 4: Making a new weapon

### 4.1: New weapon, same as the old weapon

Making a new weapon is fairly simple. In your tweak file, change the Item ID in the very first line to "Items.Hand\_Of\_Midas" and save (Hotkey: `Ctrl+S`).

{% code lineNumbers="true" %}
```yaml
Items.Preset_Unity_Default: -> Remove this
Items.Hand_Of_Midas: -> Add this
```
{% endcode %}

That's it, you've created a new weapon now. This weapon will look & behave exactly like the Unity handgun, but trust me, it's new.&#x20;

To test it out, boot up your game and load any save.

Now open up the CET [Console](https://app.gitbook.com/s/-MP5jWcLZLbbbzO-\_ua1-887967055/console/console "mention"):

<figure><img src="../../../../../.gitbook/assets/image (1) (1) (1) (1).png" alt=""><figcaption><p>Red arrow = Open CET Console. Green arrow = Command to spawn in the newly created gun</p></figcaption></figure>

Type in the command below and hit Enter.

```
 Game.AddToInventory("Items.Hand_Of_Midas",1)
```

<figure><img src="../../../../../.gitbook/assets/image (3) (1) (1) (1).png" alt=""><figcaption><p>Your newly created weapon is now in game.</p></figcaption></figure>

You can now see your newly created weapon in your inventory.&#x20;

Unfortunately, there is no way to tell it apart from the Unity handgun.&#x20;

We'll get to fixing that, but first, a little cleanup: open up your WolvenKit & rename your overridden tweak file to "hand\_of\_midas.yaml". We will store all the edits that need to be done to our new weapon in this file.

### 4.2: Changing the carbon copy

Let's change something that will differentiate our weapon from the default Unity.&#x20;

To do this, open your renamed tweak file & find the `crosshair` tag (hotkey: `Ctrl+F`). Replace it as shown below, and save your file.

```yaml
  crosshair: Crosshairs.Simple -> remove this
  crosshair: Crosshairs.Tech_Round -> add this
```

Now hot reload your game (Insert how to link here) or close it, reinstall your mod in WolvenKit & relaunch your game (From here on, this will be referred to as hot reload).&#x20;

Spawn in both the Unity & Hand of Midas using the CET console:

```
Game.AddToInventory("Items.Hand_Of_Midas",1)
Game.AddToInventory("Items.Preset_Unity_Default",1)
```

<figure><img src="../../../../../.gitbook/assets/image (4) (1) (1).png" alt=""><figcaption><p>Default Unity crosshair</p></figcaption></figure>

<figure><img src="../../../../../.gitbook/assets/image (5) (1).png" alt=""><figcaption><p>Hand of Midas crosshair</p></figcaption></figure>

You should now be able to see that both the Unity & Hand Of Midas, although otherwise identical, now have different crosshairs.&#x20;

### How did we figure out the crosshair ID?&#x20;

How do we know that it's called "Crosshairs.Tech\_Round" ?&#x20;

#### Method 1: The REDmod DLC

If you have the REDmod DLC installed, you can use a text editor like Notepad++ to do a full-text search under `Cyberpunk 2077/tools/REDmod`. By searching for `crosshair:`, you can find all value assignments in the game files.

#### Method 2: The [Wolvenkit Tweak Browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser)

By searching for "Crosshairs." in the Tweak Browser. Most things we find inside the weapon tweak will be searchabled within the Tweak Browser, and some within the Asset Browser.

<figure><img src="../../../../../.gitbook/assets/image (5).png" alt=""><figcaption><p>List of crosshairs obtained with a Tweak Browser search</p></figcaption></figure>

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
  Just the properties we want to edit ...

OR

Items.Hand_Of_Midas:
  $type: gamedataWeaponItem_Record
  All the other properties ...
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

<figure><img src="../../../../../.gitbook/assets/image (4).png" alt=""><figcaption><p>mod name folder &#x26; localization folder</p></figcaption></figure>

### How does the game assign display names?&#x20;

In your full tweak file, search for the field called `displayName`. You'll likely encounter something like `displayName: LocKey#49794`.&#x20;

This connects the displayName property of your item with a **locaization key**, which is the mechanism that the game uses to support multiple languages. Think of the `LocKey` of a list entry, with different lists being used for different languages.

{% hint style="info" %}
If you want to take a look at these lists, use WolvenKit's [LocKey browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/lockey-browser) or [search](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) for `onscreens.json`.
{% endhint %}

<figure><img src="../../../../../.gitbook/assets/image (1) (1) (1).png" alt=""><figcaption><p>LocKey Browser search for <code>LocKey#49794</code></p></figcaption></figure>

### So we edit onscreens.json?

Good thinking, but no. In Cyberpunk, only **one** mod can edit any given file. That is why [archivexl](../../../../core-mods-explained/archivexl/ "mention") exists, and we'll use it to create a new translation entry for us.

Place a dedicated [`en-us.json`](https://mega.nz/file/3uB2CL5L#Y18wD4pGo1L7Y699GNvy6UaKVb8BqkjDP-FeYi9VcQM) file in your `midas_collection`\\`localization` folder.  This is where we'll add our own translation entries – after that, we only need to tell ArchiveXL about the file and lean back.

<figure><img src="../../../../../.gitbook/assets/image (3) (1) (1).png" alt=""><figcaption><p>Red arrow = localization json added correctly. Green arrow = add new element in the json. Yellow arrow = key fields in new entry</p></figcaption></figure>

### Setting up a localizationKey

Open the file in Wolvenkit and create a new entry in `localizationPersistenceOnScreenEntry`. It has the following properties:

<table><thead><tr><th width="207">Property name</th><th width="173">your value</th><th>explanation</th></tr></thead><tbody><tr><td><code>femaleVariant</code></td><td>Hand Of Midas</td><td>the default translationse</td></tr><tr><td><code>maleVariant</code></td><td></td><td>only set this if you want to show a different translation when your item is equipped by a person of the male body gender</td></tr><tr><td><code>primaryKey</code></td><td>0</td><td>The <em>actual</em> entry in the translation list, make sure to set this to 0 so that it's autogenerated</td></tr><tr><td><code>secondaryKey</code></td><td><code>MC_gun_name</code></td><td>The key used in tweak files to identify this translation string</td></tr></tbody></table>

{% hint style="warning" %}
`secondaryKey`s must be **globally unique**, or they will overwrite each other.&#x20;
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

Rename this file to `midas_collection.archive.xl`.&#x20;

{% hint style="info" %}
Wolvenkit will move the .xl file to the same directory as your mod's .archive file, where ArchiveXL will see and process it.
{% endhint %}

Next, revisit your "hand\_of\_midas" tweak file to establish the weapon's name and description in the game.&#x20;

Add the following lines under the existing properties:

```yaml
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default
  crosshair: Crosshairs.Tech_Round
  displayName: MC_gun_name
  localizedDescription: MC_gun_description
```

{% hint style="info" %}
Instead of `displayName: MC_gun_name`, you can also write `displayName: LocKey#MC_gun_name`. However, TweakXL will do this for you!
{% endhint %}

These lines set the display name and the description of your weapon using the keys defined in your localization file. The **values** on the right side of the `:` must match the `secondaryKey` values from your `en-us.json` file and be **globally unique**.

After completing these steps, install your mod and launch the game. Your new weapon, "Hand Of Midas", should now appear with its unique name and description, fully integrated into Cyberpunk 2077's multi-language environment.

<figure><img src="../../../../../.gitbook/assets/image (4) (1).png" alt=""><figcaption><p>Name &#x26; Description of the gun are now taken from "en-us.json" that we've created</p></figcaption></figure>

## Step 7: Make it Iconic

Now we'll make this fancy iron of ours Iconic. We'll start with a small change to our tweak.

```yaml
# Hand of Midas weapon tweak
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default # $base makes it so all the properties are taken from the specified tweak (in this case, "Items.Preset_Unity_Default") and the properties specified in this tweak overwrite the parent.
  crosshair: Crosshairs.Tech_Round # other crosshairs can be found by looking for "Crosshairs." in Tweak Browser
  displayName: LocKey#MC_gun_name # name of the gun (will be fetched from "LocKey#HOM_gun_name" secondary key in "en-us.json")
  localizedDescription: LocKey#MC_gun_description # description of the gun (can be seen when previewing the gun from inventory with "V" key)
  statModifiers: -> add this
  - !append-once Quality.IconicItem -> add this
```

For the first time we're dealing with an array inside a tweak. An array can hold multiple items, and in this case, `statModifiers` will hold all the stats for your gun from recoil to damage. Thing is, `statModifiers` is already defined by our `$base: Items.Preset_Unity_Default` and we don't want to override it, we only want to add another entry to it whilst keeping the rest intact. So we use `!append-once` followed by the entry we want to add, which is `Quality.IconicItem`. Read more about how array operations work in [TweakXL](https://github.com/psiberx/cp2077-tweak-xl/wiki/YAML-Tweaks#array-operations).\
\
The actual entry value `Quality.IconicItem` makes the weapon Iconic. It'll give it the fancy Iconic background in inventory, give a special dialogue box when disassembling it & make it have all the implied functions of an Iconic weapon. Install your mod and test this out.

<figure><img src="../../../../../.gitbook/assets/image (3).png" alt=""><figcaption><p>Setting "Quality.IconicItem" will give it a special background in the inventory &#x26; also specify that the item is Iconic.</p></figcaption></figure>

Technically, you've already made a new Iconic weapon & I should call quits on this tutorial, but it's never as easy as that, is it? Give yourself a pat on the back & onto the next step.

## Step 8: Audio - Gun Go Boom

Let's talk theme, the gun is called Hand Of Midas, and it would be fitting to have the gun sounds be more metallic, gold-ish. How do we achieve this? We could add custom sounds using RedMod, but that can lead to unwanted conflicts due to how RedMod works. So let's look for guns that already have a sound like that.\
\
Dex's gun `Items.Preset_Liberty_Dex` already has a nice metallic sound to it, so let's use the sound files from this gun. To do this, find the gun in Tweak Browser and look for the property `audioName`.&#x20;

<figure><img src="../../../../../.gitbook/assets/image (1) (1).png" alt=""><figcaption><p><code>audioName</code> for <code>Items.Preset_Liberty_Dex</code></p></figcaption></figure>

Now add this value to your weapon tweak as shown below.

```yaml
# Hand of Midas weapon tweak
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default # $base makes it so all the properties are taken from the specified tweak (in this case, "Items.Preset_Unity_Default") and the properties specified in this tweak overwrite the parent.
  crosshair: Crosshairs.Tech_Round # other crosshairs can be found by looking for "Crosshairs." in Tweak Browser
  displayName: LocKey#HOM_gun_name # name of the gun (will be fetched from "LocKey#HOM_gun_name" secondary key in "en-us.json")
  localizedDescription: LocKey#HOM_gun_description # description of the gun (can be seen when previewing the gun from inventory with "V" key)
  statModifiers: # stats for a weapon - reload time/aim speed/magazine size/recoil kick/damage per second/etc.
  - !append-once Quality.IconicItem # makes the weapon iconic
  audioName: wea_set_liberty_dex # sets the sounds of Dex's gun - Plan B
```

Install your mod and test it out, Hand Of Midas now sounds metallic like we intended it to.

<figure><img src="../../../../../.gitbook/assets/image (3) (1).png" alt=""><figcaption><p>An explanation for how audio works internally, should you decide to go the RedMod route.</p></figcaption></figure>

## Step 9: **Weapon Design 101 - Conceptualization of your Iconic (Optional)**

When conceptualizing the 'Hand of Midas', the focus isn't solely on creating a weapon with high damage output. It's essential to consider the overall feel and identity of the weapon. Avoiding the trap of an overpowered but uninteresting gun, the 'Hand of Midas' is envisioned to be a unique piece with its own character - ideal for players who relish precision and skill.

**Designing the Weapon's Characteristics**

The design approach for 'Hand of Midas' revolves around balancing strengths with intentional limitations. Here's how we achieve this:

1. **Increased Recoil**: This adds a layer of complexity and skill. High recoil means each shot requires careful consideration, appealing to players who enjoy a challenge and the satisfaction of mastering a weapon.
2. **Smaller Magazine Size & Increased Reload Time**: These features ensure that every bullet counts. A smaller magazine encourages accuracy over spray-and-pray tactics, and a longer reload time not only adds a strategic layer to combat but also allows players to appreciate the weapon's aesthetics and animations longer.

In summary, these design choices don't just balance the weapon; they enhance its identity. The increased recoil and reload times are not mere hindrances; they contribute to making the 'Hand of Midas' feel powerful and rewarding for those who can wield it effectively.&#x20;

TODO - to be continued by destinybu

## Step 10: Be a stat wizard

To change the stats discussed in the step above, we again need to tinker with the `statModifiers` & `statModifierGroups` in your weapon tweak. Open up the tweak for `Items.Preset_Unity_Default` and navigate till you find the two arrays.

```yaml
statModifiers:
    - Items.Base_Weapon_inline0
    - Items.Base_Weapon_inline1
    - Items.Base_Weapon_inline2
    - Items.Base_Weapon_inline3
    ...
statModifierGroups:
    - Items.Base_Weapon_Damage_Type_Min_Max
    - Items.Base_Weapon_Damage_Type_Physical
    - Items.QualityRandomization
    - Items.ItemPlusRandomizer_MaxQuality
    ...
```

These arrays don't directly contain the stats, but have inline objects, which in turn will contain the actual stats. I recommend browsing to each of these stats in the Tweak Browser to find out what each one does.

Refer discovered stats here - TODO - add stats wiki page once approved.

To change the gun's recoil, we'll add a new `statModifierGroup` tweak as shown below (to the weapon's tweak file or a new tweak file) -

```yaml
# Recoil related stats for Hand of Midas
StatGroups.Hand_Of_Midas_Recoil_Stats:
  $type: gamedataStatModifierGroup_Record
  statModifiers:
  - $type: gamedataConstantStatModifier_Record
    value: 2
    modifierType: Multiplier
    statType: BaseStats.RecoilTime # time taken by gun to reach the recoil distance
  - $type: gamedataConstantStatModifier_Record
    value: 1.5
    modifierType: Multiplier
    statType: BaseStats.RecoilKickMin # minimum sway on camera/gun on shooting
  - $type: gamedataConstantStatModifier_Record
    value: 1.5
    modifierType: Multiplier
    statType: BaseStats.RecoilKickMax # maximum sway on camera/gun on shooting
  - $type: gamedataConstantStatModifier_Record
    value: 1.5
    modifierType: Multiplier
    statType: BaseStats.RecoilRecoveryTime # time taken to return to normal position after recoil
```

Now add this stat group to your weapon's tweak.

```yaml
# Hand of Midas weapon tweak
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default # $base makes it so all the properties are taken from the specified tweak (in this case, "Items.Preset_Unity_Default") and the properties specified in this tweak overwrite the parent.
  crosshair: Crosshairs.Tech_Round # other crosshairs can be found by looking for "Crosshairs." in Tweak Browser
  displayName: LocKey#MC_gun_name # name of the gun (will be fetched from "LocKey#MC_gun_name" secondary key in "en-us.json")
  localizedDescription: LocKey#MC_gun_description # description of the gun (can be seen when previewing the gun from inventory with "V" key)
  statModifiers: # stats for a weapon - reload time/aim speed/magazine size/recoil kick/damage per second/etc.
    - !append-once Quality.IconicItem # makes the weapon iconic
  audioName: wea_set_liberty_dex # sets the sounds of Dex's gun - Plan B
  statModifierGroups: # stats for a weapon also, but grouped (generally by category)
    - !append-once StatGroups.Hand_Of_Midas_Recoil_Stats -> add this
```

Install your mod, launch the game and test your changes. You should see that the gun's recoil is increased, but doesn't feel overwhelming.

<figure><img src="../../../../../.gitbook/assets/image (2).png" alt=""><figcaption><p>Yellow box = Unity recoil pattern. Red box = Hand of Midas recoil pattern</p></figcaption></figure>

You now know how to change your weapon's behavior. Play around & discover other stats and modify your gun to make it feel unique. Note that stats can be added individually to `statModifiers` or in groups to `statModifierGroups` .

After a bit of tinkering, this is what my weapon tweak now looks like -

```yaml
# Hand of Midas weapon tweak
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default # $base makes it so all the properties are taken from the specified tweak (in this case, "Items.Preset_Unity_Default") and the properties specified in this tweak overwrite the parent.
  crosshair: Crosshairs.Tech_Round # other crosshairs can be found by looking for "Crosshairs." in Tweak Browser
  displayName: LocKey#MC_gun_name # name of the gun (will be fetched from "LocKey#MC_gun_name" secondary key in "en-us.json")
  localizedDescription: LocKey#MC_gun_description # description of the gun (can be seen when previewing the gun from inventory with "V" key)
  statModifiers: # stats for a weapon - reload time/aim speed/magazine size/recoil kick/damage per second/etc.
    - !append-once Quality.IconicItem # makes the weapon iconic
  audioName: wea_set_liberty_dex # sets the sounds of Dex's gun - Plan B
  statModifierGroups: # stats for a weapon also, but grouped (generally by category)
    - !append-once StatGroups.Hand_Of_Midas_Recoil_Stats
    - !append-once StatGroups.Hand_Of_Midas_Technical_Stats
    - !append-once StatGroups.Hand_Of_Midas_Handling_Stats
    - !remove Items.Base_Unity_Technical_Stats

# Magazine capacity for Hand of Midas
StatGroups.Hand_Of_Midas_Technical_Stats:
  $base: Items.Base_Unity_Technical_Stats
  statModifiers:
  - !append-once 
    $type: gamedataConstantStatModifier_Record
    value: 5
    modifierType: Additive
    statType: BaseStats.MagazineCapacityBase # sets the magazine capacity
  - !remove Items.Base_Unity_Technical_Stats_inline2 # remove stat setting the magazine capacity

# Reload/Zoom related stats for Hand of Midas
StatGroups.Hand_Of_Midas_Handling_Stats:
  $type: gamedataStatModifierGroup_Record
  statModifiers:
  - $type: gamedataConstantStatModifier_Record
    value: 0.25
    modifierType: Additive
    statType: BaseStats.ReloadTimeBase # reload time when magazine is not empty
  - $type: gamedataConstantStatModifier_Record
    value: 0.25
    modifierType: Additive
    statType: BaseStats.EmptyReloadTime # reload time when magazine is empty
  - $type: gamedataConstantStatModifier_Record
    value: 1.5
    modifierType: Multiplier
    statType: BaseStats.ZoomLevel # zoom level of a weapon


# Recoil related stats for Hand of Midas
StatGroups.Hand_Of_Midas_Recoil_Stats:
  $type: gamedataStatModifierGroup_Record
  statModifiers:
  - $type: gamedataConstantStatModifier_Record
    value: 2
    modifierType: Multiplier
    statType: BaseStats.RecoilTime # time taken by gun to reach the recoil distance
  - $type: gamedataConstantStatModifier_Record
    value: 1.5
    modifierType: Multiplier
    statType: BaseStats.RecoilKickMin # minimum sway on camera/gun on shooting
  - $type: gamedataConstantStatModifier_Record
    value: 1.5
    modifierType: Multiplier
    statType: BaseStats.RecoilKickMax # maximum sway on camera/gun on shooting
  - $type: gamedataConstantStatModifier_Record
    value: 1.5
    modifierType: Multiplier
    statType: BaseStats.RecoilRecoveryTime # time taken to return to normal position after recoil
```

TODO - update above tweak once all stats are changed - destinybu
