---
description: >-
  We'll be looking at making a feature complete new Iconic weapon called the
  'hand of midas' along with two unique iconic attachments for it. Each will
  have a unique special ability & custom skin
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

* Tweak changes for a weapon
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

## Step 2: Choose the Base Weapon

Decide on the weapon you want to modify to make a new new iconic. For this tutorial, we will use the gun 'Unity' as our base. The item ID for Unity is `Items.Preset_Unity_Default`.

{% hint style="info" %}
For a list of all weapon entities, check [weapons.md](../../../../references-lists-and-overviews/equipment/weapons.md "mention")&#x20;

You can find a list of all in-game items [here](https://onedrive.live.com/view.aspx?resid=EF6891140DE637B3%21221903\&authkey=!AE\_n4RTzwmVHwy8).
{% endhint %}

<figure><img src="../../../../../.gitbook/assets/image (182).png" alt=""><figcaption><p>Open Tweak Browser &#x26; search "Items.Preset_Unity_Default"</p></figcaption></figure>

## Step 3: Create a TweakXL Override

{% hint style="info" %}
To read more about Tweak modding, check [tweaks.md](../../../../files-and-what-they-do/tweaks.md "mention"). This isn't necessary for understanding this guide!
{% endhint %}

To understand how the base gun works, open the tweak browser in WolvenKit and search for `Items.Preset_Unity_Default`.

After locating the Unity gun in the tweak browser, right-click on the item and select "Add TweakXL Override". This allows you to modify and customize the weapon’s attributes to create your new iconic weapon.

<figure><img src="../../../../../.gitbook/assets/image (185).png" alt=""><figcaption><p>Red arrow = Tweak Name, where you can override it. Blue Box= Details about selected tweak. White arrow = Overridden (New) Tweak </p></figcaption></figure>

## Step 4: Open the Overridden Tweak in a Code Editor

Open the overridden tweak file in a code editor of your choice (such as Notepad++ or VS Code). You will be presented with a `.yaml` file containing numerous fields.

<figure><img src="../../../../../.gitbook/assets/image (186).png" alt=""><figcaption><p>"Items.Preset_Unity_Default" tweak opened in VS Code</p></figcaption></figure>

## Step 5: Understand the Fields in the .yaml File

{% hint style="info" %}
For first time modders, understanding all this in one go will be difficult, so keep these explanations handy and revisit them as and when required
{% endhint %}

The .yaml file may seem complex at first glance, but here's a breakdown of key fields in another weapon tweak (`Items.Preset_Sidewinder_Default`) : (Thanks to BuffMcMuff)

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

## Step 6: Making a New Weapon

Making a new weapon is fairly simple. Change the Item ID a the very first line to "Items.Hand\_Of\_Midas" and save your file.

{% code lineNumbers="true" %}
```yaml
Items.Preset_Unity_Default: -> Remove this
Items.Hand_Of_Midas: -> Add this
```
{% endcode %}

That's it, you've created a new weapon now. This weapon will look & behave exactly like the Unity handgun, but trust me, it's new.&#x20;

To test it out, boot up your game and load any save.

Now open up the CET [Console](https://app.gitbook.com/s/-MP5jWcLZLbbbzO-\_ua1-887967055/console/console "mention"):

<figure><img src="../../../../../.gitbook/assets/image (1) (1).png" alt=""><figcaption><p>Red arrow = Open CET Console. Green arrow = Command to spawn in the newly created gun</p></figcaption></figure>

Type in the command below and hit Enter.

```
 Game.AddToInventory("Items.Hand_Of_Midas",1)
```

<figure><img src="../../../../../.gitbook/assets/image (3) (1).png" alt=""><figcaption><p>Your newly created weapon is now in game.</p></figcaption></figure>

You can now see your newly created weapon in your inventory. But, there is no way to tell it apart from the Unity handgun. We'll get to fixing that, but first some clean up. Open up your WolvenKit & rename your overriden tweak file to "hand\_of\_midas.yaml". We will store all the edits that need to be done to our new weapon in this file.

## Step 7: Making a New Weapon feel New

Let's change something that will differentiate our weapon from the default Unity.&#x20;

To do this, open your renamed tweak file & find the "crosshair" tag. Then replace it as shown below, and save your file.

```yaml
  crosshair: Crosshairs.Simple -> remove this
  crosshair: Crosshairs.Tech_Round -> add this
```

Now hot reload your game (Insert how to link here) or close it, then click install in WolvenKit & relaunch your game (From here on, this will be referred to as hot reload). Spawn in both the Unity & Hand of Midas using the CET console.

```
Game.AddToInventory("Items.Hand_Of_Midas",1)
Game.AddToInventory("Items.Preset_Unity_Default",1)
```

<figure><img src="../../../../../.gitbook/assets/image (4) (1).png" alt=""><figcaption><p>Default Unity crosshair</p></figcaption></figure>

<figure><img src="../../../../../.gitbook/assets/image (5) (1).png" alt=""><figcaption><p>Hand of Midas crosshair</p></figcaption></figure>

You should now be able to see that both the Unity & Hand Of Midas, although otherwise identical, now have different crosshairs. But how did we figure out the crosshair ID "Crosshairs.Tech\_Round" ? By searching for "Crosshairs." in the Tweak Browser. Most things we find inside the weapon tweak will be searchabled within the Tweak Browser, and some within the Asset Browser.

<figure><img src="../../../../../.gitbook/assets/image (5).png" alt=""><figcaption><p>List of crosshairs obtained with a Tweak Browser search</p></figcaption></figure>

Editing the Tweak will allow us to modify all of our gun's behaviors, and I encourage you to play around with these.

## Step 8: Using $base instead of $type

We now have a big tweak file for Hand of Midas with only 1 field that we are truly changing, which is the crosshair. There is no need to write so much redundant code for small changes, in fact, it's best practice not to.

```yaml
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default
  Just the properties we want to edit ...

OR

Items.Hand_Of_Midas:
  $type: gamedataWeaponItem_Record
  All the other properties ...
```

As shown above, when using $type to define a tweak, we need to add all the required properties for the type, but when using $base to define one, we only need to add the properties we are changing, the rest are taken from the parent.

Now go ahead and change it so we use a base & only define the crosshair, your tweak should now look like this -

```yaml
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default
  crosshair: Crosshairs.Tech_Round
```

## Step 9: Names & Descriptions

What good is a new gun without a new name? To start customizing your gun's name and description, open your WolvenKit project and navigate to the archive folder. Here, create a new folder named after your mod, for instance, "midas\_collection". Within this folder, make another named "localization".&#x20;

<figure><img src="../../../../../.gitbook/assets/image.png" alt=""><figcaption><p>mod name folder &#x26; localization folder</p></figcaption></figure>

Next, focus on understanding how the game assigns names to items. Take the Unity gun as an example. In its tweak file, search for the "displayName" field. You'll likely encounter something like `displayName: LocKey#49794`, which implies the name is tied to a localization key. This approach is used to facilitate the translation of names and descriptions across different languages.&#x20;

<figure><img src="../../../../../.gitbook/assets/image (1).png" alt=""><figcaption><p>LocKey Browser search for <code>LocKey#49794</code></p></figcaption></figure>

Such localization keys correspond to entries in "onscreens.json" files, which can be viewed in the asset browser - one for each language.

Editing the main "onscreens.json" file directly for your mod can cause conflicts, especially when multiple modders are working on separate items. To avoid these issues, create a dedicated "en-us.json" file in your "midas\_collection - localization" folder to add your mod-specific entries there. This method helps to maintain separation between your mod and others, preventing any overwrite issues.

{% file src="../../../../../.gitbook/assets/en-us.json" %}
Copy this file and place it in archive -> mod name -> localization
{% endfile %}

<figure><img src="../../../../../.gitbook/assets/image (3).png" alt=""><figcaption><p>Red arrow = localization json added correctly. Green arrow = add new element in the json. Yellow arrow = key fields in new entry</p></figcaption></figure>

After setting up your localization file, it's crucial to properly link it to your weapon in the game. This involves defining specific properties in the file. Assign the `femaleVariant` property to your gun's name, in this case, "Hand Of Midas". Next, create a unique identifier called `secondaryKey`, such as "MC\_gun\_name", which will serve as a unique reference within the localization system. These properties help ensure that your weapon's name and description are correctly recognized in different languages. For more detailed guidance on these properties, check out the [ArchiveXL Wiki](https://github.com/psiberx/cp2077-archive-xl/wiki#localization).

To make the game recognize your new localization file, you need to include it via ArchiveXL. In your WolvenKit project, go to the resources folder and create a plain text file with the following contents:

```yaml
localization:
  onscreens:
    en-us: midas_collection\localization\en-us.json
```

Rename this file to `midas_collection.archive.xl`. This step is crucial as it tells the game where to find the localization information for your mod.

Next, revisit your "hand\_of\_midas" tweak file to establish the weapon's name and description in the game. Add the following lines under the existing properties:

```yaml
Items.Hand_Of_Midas:
  $base: Items.Preset_Unity_Default
  crosshair: Crosshairs.Tech_Round
  displayName: LocKey#MC_gun_name
  localizedDescription: LocKey#MC_gun_description
```

These lines set the display name and the description of your weapon using the keys defined in your localization file. `LocKey#MC_gun_name` and `LocKey#MC_gun_description` refer to the entries you've created in "en-us.json", which provide the actual name and description text for your weapon.

After completing these steps, install your mod and launch the game. Your new weapon, "Hand Of Midas", should now appear with its unique name and description, fully integrated into Cyberpunk 2077's multi-language environment.

<figure><img src="../../../../../.gitbook/assets/image (4).png" alt=""><figcaption><p>Name &#x26; Description of the gun are now taken from "en-us.json" that we've created</p></figcaption></figure>
