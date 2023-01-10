---
description: Add your own spawnable gear (TweakXL and ArchiveXL)
---

# Adding new items

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published November 04 2022**

This guide will walk you through **adding your own items** to Cyberpunk 2077, which can then be spawned via console.&#x20;

**It uses the following versions:**

* Cyberpunk 2077 game version 1.6
* [WolvenKit](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases) >= 8.7.1-nightly.2022-11-04
* [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197) 1.0.7
* [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198) 1.1.6
* [Red4ext](https://www.nexusmods.com/cyberpunk2077/mods/2380) 1.8.0

**Assumed skill level:** \
You should be able to find your way around WolvenKit, but I aim to keep this as noob-friendly as possible.

_The guide was created after reading_ [_this one_](https://drive.google.com/file/d/1aQjb8MpimB9LDNl7y1iTXH13MUvMrKsH/view) _and being left with a bunch of question marks. To get a deeper understanding, refer to the initial guide and follow the linked resources or consult ArchiveXL's_ [_documentation_](https://github.com/psiberx/cp2077-archive-xl)_._

{% hint style="info" %}
You can find a tool to troubleshoot your ArchiveXL mod [here](https://github.com/solaarTW/DeepAssetDiscovery/releases).
{% endhint %}

## Get the files, create the structure

{% hint style="info" %}
**TL;DR**: If you can't be arsed doing this by yourself, find a template project with one working item (female rigged) [here](https://www.mediafire.com/file/ef5xcacwomldizg/my\_shirt.7z/file).
{% endhint %}

This part of the guide deals with setting up the files and putting them in the right place. After that, there'll be an explanation of what they do, and finally, a step-by-step guide of filling them with content.

We'll assume that your mod is named `my_shirt` and will live in the folder `archive\tutorial`:

`tutorial\my_shirt`

Create a subfolder with the name of `ops` (for 'operations'). Here we'll put those files that organize how the items correspond to the appearances.

{% hint style="danger" %}
⚠⚠ Currently (November 2022), capital letters in path or file names are **not** supported! If somebody tells you otherwise, try it at own risk! ⚠⚠⚠
{% endhint %}

You should end up with the following file structure:

```
archive  
  - base  
  - tutorial  
        - myshirt  
        - ops  
```

{% hint style="info" %}
It is good practice to have a folder for your modded stuff directly under `archive`. That way, `base` is reserved for the non-modded **base** game items.
{% endhint %}

As for an explanation which file does what, see the [next section](adding-new-items.md#explanation-what-do-these-files-do).

#### Grab entity and app files

Now, add the following files to your project and move them to `tutorial\my_shirt`:

1. `base\gameplay\items\equipment\underwear\player_underwear_item.ent`
2. `base\gameplay\items\equipment\underwear\appearances\player_underwear_item_appearances.app`
3. `base\characters\garment\player_equipment\torso\t1_080_pwa_tank__judy.ent`\
   _(any file from this folder will do)_
4. your mesh (I'll use `base\characters\garment\gang_monk\torso\t2_135_jacket__monk_shirt\t2_135_wa_jacket__monk_shirt.mesh`)

{% hint style="warning" %}
For 3., get an entity file from the folder corresponding to the type of item that you want to edit. The files are sorted by equipment slot and you can find them under \
`base\characters\garment\player_equipment\<yourbodypart>`
{% endhint %}

and the **operative** files (these go into the subfolder `tutorial\ops`):

1. `base\gameplay\factories\items\clothing.csv`
2. `base\localization\en-us\onscreens\onscreens.json`

Rename them as follows:

| file name                               | new file name              |
| --------------------------------------- | -------------------------- |
| `player_underwear_item.ent`             | `rootentity.ent`           |
| `player_underwear_item_appearances.app` | `appearance.app`           |
| `t1_080_pwa_tank__judy.ent`             | `mesh_entity.ent`          |
| `t2_135_wa_jacket__monk_shirt.mesh`     | `my_mesh.mesh`             |
|                                         |                            |
| `clothing.csv`                          | `my_cool_new_items.csv`    |
| `onscreens.json`                        | `translation_strings.json` |

{% hint style="warning" %}
⚠ Do not edit those files outside of WolvenKit!\
If you want to do that, you need to **export them to json first** (yes, even the json).
{% endhint %}

{% hint style="danger" %}
Whatever you do, do not let Microsoft Excel touch the clothing.csv.
{% endhint %}

{% hint style="success" %}
It is good practice to keep local copies of everything that you change (=> `custompathing`) instead of overwriting files under `base`. This makes sure that no other mods will overwrite your changes.

\
ℹ Only keep files under `base` if you are okay with them being overwritten!
{% endhint %}

#### Add the .archive.xl and tweaks.yml files

Create a new file by using WolvenKit's toolbar button.

[![](https://camo.githubusercontent.com/eb69e5ca399c74c91378ea8ab01cf1c75aa27bc9f582b090bd6ec0d21fa39920/68747470733a2f2f692e696d6775722e636f6d2f33766e6f3979452e706e67)](https://camo.githubusercontent.com/eb69e5ca399c74c91378ea8ab01cf1c75aa27bc9f582b090bd6ec0d21fa39920/68747470733a2f2f692e696d6775722e636f6d2f33766e6f3979452e706e67)

1. Select "ArchiveXL" on the left. This file will later go into `gamedir\archive\mods`.\
   Call it `yourModName.archive.xl`, so that it'll be directly below `yourmodname.archive`.
2. Select "TweakXL" on the left. This file will later go into `r6\tweaks`.\
   Call it `yourModName.yaml`.

{% hint style="warning" %}
WolvenKit versions older than November 2022 can't edit the `archive.xl` file. You'll have to use a text editor such as Notepad++.
{% endhint %}

#### You should now have the following file structure:

```
tutorial  
    myshirt  
      - appearance.app  
      - mesh_entity.ent  
      - my_mesh.mesh  
      - rootentity.ent  
 ops  
   - my_cool_new_items.csv  
   - translation_strings.json  
resources                    << from WolvenKit-8.7.1-nightly.2022-11-01  
  - yourModName.archive.xl  
  - yourModName.yaml         
```

{% hint style="warning" %}
Before WolvenKit Nightly 2022-11-01, `yourModName.yaml` will be located in the folder `ArchiveXL`. I recommend updating.
{% endhint %}

{% hint style="info" %}
&#x20;If you plan on adding more than one clothing item, I recommend keeping the `translation_strings.json` in the clothing item's subfolder — that way, you can have multiple files for multiple items, rather than have everything in one.
{% endhint %}

### Optional, but **very** recommended: Clean out obsolete entries

1. Open the file `translation_strings.json` in WolvenKit.\
   Expand the array `root` and then the array `entries`. Delete all entries but one.
2. Open the file `my_cool_new_items.csv` in WolvenKit.\
   In `compiledData`, delete all entries but one. In `data`, delete everything - these will get autogenerated.
3.  Open the file `rootentity.ent`.

    Expand the list `appearances`. Delete all entries but the first (most likely `default`).
4. Open the file `appearance.app`.\
   Expand the list `appearances`. Delete all entries but `default`.
5. Open the file `mesh_entity.ent`\
   Select `resolvedDependencies` and delete all the entries. (We don't need Judy's top anymore.)
6. Make a back-up copy of your mesh, then open it.
   1. Expand the list `materials`. Open the appearance `default` and check which material is linked in the `chunkMaterials` array.
   2. Expand `localMaterialBuffer.materials` . Delete all entries that aren't used in `default`.\
      ℹ Some meshes don't have `localMaterialBuffer` — look for `preloadLocalMaterialInstances instead`
   3. Expand `materialEntries`. Delete all entries that you also removed from `localMaterialBuffer`.\
      👉 You should be left with 1-3 materials.
   4.  Now we need to adjust the indices.\
       ⚠**If you make any mistakes here, the wrong material will be loaded**.

       Select the first `CMeshMaterialEntry` in `materialEntries` and check the property `index` — it needs to be `0`.
   5. Browse through each entry that is still in the list and make sure that the index is sequential.\
      ℹ You can see in the list which index each item needs to have:\
      [![index explanation](https://camo.githubusercontent.com/e2fe94f8476a25c99de04e5da5dec3f8db8156833a9f4c120b5b1c1b46be2bc5/68747470733a2f2f692e696d6775722e636f6d2f413764446477472e706e67)](https://camo.githubusercontent.com/e2fe94f8476a25c99de04e5da5dec3f8db8156833a9f4c120b5b1c1b46be2bc5/68747470733a2f2f692e696d6775722e636f6d2f413764446477472e706e67)

{% hint style="success" %}
**Now is a good time for a backup.**
{% endhint %}

### Explanation: What do these files do?



<figure><img src="https://camo.githubusercontent.com/9b08162e4ed8a2c0738b1a028884a789d83e8518c18b0297c98a612aee6d9d14/68747470733a2f2f692e696d6775722e636f6d2f6936396b4453302e706e67" alt=""><figcaption><p>How the files connect to each other</p></figcaption></figure>

{% hint style="info" %}
If you are renaming or moving files, you might want to refer to this diagram. It's what I do.
{% endhint %}

* As you can see, there are two entry points, the **yaml** and the **archive.xl**.
* The **yaml** and the **csv** together load the **rootentity**, which is responsible for displaying the correct mesh.

#### my\_cool\_new\_items.csv: the '**factory**'.

{% hint style="info" %}
You need to touch it only once, unless you want to add new files.
{% endhint %}

The factory connects `yourModName.yml` via `entityName` to the corresponding `rootEntity.ent`.

When reading `yourModName.yml` ([next section](adding-new-items.md#yourmodname.yaml)), the game will find entries like this:

```
Items.my_shirt:  
  $base: Items.GenericFootClothing  
  entityName: my_shirt                       << you set this field  
  appearanceName: my_shirt_  
  displayName: my_shirt_name  
```

When adding the new items, the entries in the factory will be filtered by `entityName` for a match in the first field:

```
{  
	0: my_shirt                              << as corresponding to entityName in appearance.app  
	1: tutorial\myshirt\rootentity.ent        << this file will be used to resolve the appearances  
},   
{  
	0: my_boots                               << this does not match  
	1: tutorial\myshirt\rootentity.ent        << so this file won't matter here  
}  
```

… and use `rootentity.ent` to look up an appearance by the name of `my_shirt_`.

#### yourModName.yaml

This file controls the adding of items to the game.&#x20;

{% hint style="info" %}
You need to touch this file every time you add a color variant or a new item.
{% endhint %}

An entry looks like this:

```
Items.my_shirt:                          << name of the item in game (for spawn code)  
  $base: Items.GenericInnerChestClothing  << select the type of clothing you want  
  entityName: my_shirt                   << maps to my_cool_new_items.csv by entityName => data[x][0]  
  appearanceName: my_shirt_              << points to rootentity.ent. The trailing _ is on purpose!  
  displayName: my_shirt_name             << points to translation_strings.json  
  localizedDescription: my_shirt_desc    << points to translation_strings.json  
  quality: Quality.Legendary              << we don't want the cheap garbage, do we now  
  appearanceSuffixes: []                  << See the section "suffixes" below for an explanation  
```

This will let you add the item via `Game.AddToInventory('Items.my_shirt')`.

Three **mappings** take place here:

1. `entityName`: Basically, the game will look through the [factory](adding-new-items.md#my\_cool\_new\_items.csv-the-factory.) (`my_cool_new_items.csv)` until it finds an array where the value for \[0] (the first entry) is identical to this key. It will then use the file specified in \[1] (the second entry) to look up the `appearanceName`.
2. `appearanceName`: In the [entity](adding-new-items.md#rootentity.ent) specified via csv, it will look for an appearance by this name.\
   \
   The name will only be considered up to the first [suffix](adding-new-items.md#suffixes-and-whether-you-need-them) - that is, **everything before the & will be ignored**.
3. `displayName`/`localizedDescription` : In the `translation_strings.json`, find an array where the value for \[3] (the last entry) is identical to this key. Then, check which gender V has, and display either `femaleVariant` or `maleVariant`.

`$base` defines which type of clothing to use. All those types have different properties (e.g. on which slot they are), and they **inherit properties** from their parent template, which can cause problems (see "[**Suffixes, and whether you need them**](adding-new-items.md#suffixes-and-whether-you-need-them)" below for more detail).

The following types of clothing exist:

* Items.GenericHeadClothing
* Items.GenericFaceClothing
* Items.GenericOuterChestClothing
* Items.GenericInnerChestClothing
* Items.GenericLegClothing
* Items.GenericFootClothing

{% hint style="warning" %}
When editing this file, please keep in mind that **indent is important**!&#x20;

The first line of each block must not have spaces, the following lines must have the same amount of spaces.
{% endhint %}

#### yourModName.archive.xl

This file tells the game to load the [factory](adding-new-items.md#my\_cool\_new\_items.csv-the-factory.) (`my_cool_new_items.csv`) and the localization file (`translation_strings.json`).

{% hint style="info" %}
You need to touch it only once, unless you want to add new files.
{% endhint %}

As for the content, see the section "Setting up the files" below.

#### translation\_strings.json

This is the **localization** file which tells the game which texts to display.

{% hint style="info" %}
You need to touch this file every time you add a new text string.
{% endhint %}

An entry will look like this:

```
femaleVariant: My shirt - Babydoll  
maleVariant: My shirt - Sleeveless  
primaryKey: 0  
secondaryKey: my_shirt_name  
```

The value under `secondaryKey` must match the entry in `yourModName.yml`, or you'll just see an empty string.

{% hint style="info" %}
If you don't need a male-specific translation, you can leave it blank — by default, `femaleVariant` will be used.
{% endhint %}

#### rootentity.ent

This file defines which components should be loaded - that's why you should copy one instead of creating from scratch.

{% hint style="info" %}
You need to touch this file every time you add a colour variant.
{% endhint %}

For our purposes, this is a glorified lookup map, translating between the key `appearanceName` in `yourModName.yaml`, a specified app file, and an appearance as specified in that file:

yourModName.yaml

```
   $base: Items.GenericInnerChestClothing  
   entityName: my_shirt  
   appearanceName: my_shirt_  
```

knows to look in `my_cool_new_items.csv` for an entry matching the entity name, then open the corresponding app file specified there, and find the appearance by the name of `appearanceName`.

An entry will look like this:

```
appearanceName:        my_shirt  
appearanceResource:    DepotPath: tutorial\my_shirt\appearance.app  
                       Flags:     Default  
name:                  my_shirt_&Suffixes  
```

For an explanation of the **'\&suffixes'** part, see the [section below](adding-new-items.md#suffixes-and-whether-you-need-them).

{% hint style="info" %}
If you do not need Suffixes (which includes not knowing what you would want them for), you should leave them out.

\
In that case, make very sure that each entry in your .yaml contains the following line:\
&#x20; `appearanceSuffixes: []`&#x20;
{% endhint %}

#### mesh\_entity.ent

For our purposes, this is just a collection of components.

{% hint style="info" %}
This file is on a once-per-mesh basis, and you have to touch it only once.sis.
{% endhint %}

An entry looks like this:

```
components: [  
	0: Component {…}                                      << ignore this  
	1: entGarmentSkinnedMeshComponent {                   << the component loading our custom mesh  
		  mesh:  
		    DepotPath: tutorial\my_shirt\my_mesh.mesh    << path to your mesh  
		    Flags:     Default                            << leave this alone  
		  name: my_shirt                                 << see below  
	}  
]  
```

The name will be used in `appearance.app`'s materialOverride array (see below)

{% hint style="info" %}
❓ **Why this file**

You don't strictly need it, as you could define the components array in the individual appearances in the `appearance.app` \
**However**, in the interest of not repeating ourselves, we bundle everything here. For example, if you re-name or move your mesh file, you'll have to touch one file, rather than 25 different appearances in an array!
{% endhint %}

#### appearance.app

Contains a list of appearances as mapped by [`rootentity.ent`](adding-new-items.md#rootentity.ent). It will indicate which mesh to display by loading `mesh_entity.ent` , and overriding appearances.

{% hint style="info" %}
You will touch this file every time you add a colour variant.
{% endhint %}

An entry will look as follows:

```
appearances:  
  handle:appearanceAppearanceDefinition: [  
    {  
        components:	    []                   << replaced by mesh_entity.ent  
        name:  			my_shirt           << this maps to the field 'appearanceName' in rootentity.ent  
        partsOverrides: appearanceAppearancePartOverrides[]: [{  
          partResource: tutorial\my_shirt\mesh_entity.ent  
          componentOverrides: [{  
          	componentName: my_shirt        << corresponds to the component's name in mesh_entity.ent, see above  
          	mesh_appearance: colourset_01   << corresponds to the component's appearance in my_mesh.mesh  
          }]  
        }]  
        partsValues: appearanceAppearancePart[] = [{	  
          resource: tutorial\my_shirt\mesh_entity.ent  << which entity file to load?  
        }]  
    }  
  ]  
```

`partsValues` will define what entity files to load (as a list of components), while `partsOverrides` tells the mesh which appearance to use.

#### Mesh

_You probably know this, but since I'm already writing a guide, I figured I might as well be thorough._

The **mesh** file is the actual game object, which is made out of vertices, edges and faces.

It also holds the information on how the mesh **deforms** with the rig - without this, V's **rig** would move and the mesh would stay in place. This information is in the weights — different vertices are assigned to vertex groups which correspond to the name of the rig's bone (such as `RightUpLeg` or `LeftLegUp`) , and will then move when the bone does.

{% hint style="info" %}
How _much_ a vertex moves will be determined via **vertex weights**, which you can change in Blender's **weight paint mode**. _Everyone I've ever talked to hates these things, so if you happen to be good at them and enjoy the process, please get in touch, senpai. \~manavortex_
{% endhint %}



### Suffixes, and whether you need them

Suffixes tell the game which appearance to load under certain circumstances. Which ones will be considered depends on `appearanceSuffixes: [ … ]` in the .yaml file.

{% hint style="info" %}
⚠Your item might inherit the suffix setup from the component you specify it as. In the example of `Items.GenericHeadClothing`, that will be

```
appearanceSuffixes: [ itemsFactoryAppearanceSuffix.Gender, itemsFactoryAppearanceSuffix.Camera ]  
```
{% endhint %}

A mesh will first look for an appearance without any suffixes at all, and then always try to load the most specific appearance. In the example above, if you give the name of `my_shirt_`, it will append the suffixes and (for a female V in third person camera mode) try to find `my_shirt_&Female&TPP`.\
`my_shirt_`, will be loaded.\
`my_shirt_&Female` will be ignored.

ℹ**This can be the reason why your item is invisible!**! You can and should disable the suffixes if you don't need them.\
To do so, add an empty array to the yaml entry:

```
appearanceSuffixes: []
```

For clothing items, the following suffixes are relevant:

| Suffix                                  | Explanation                                                                                                                                                                                                                                                                                                                                                 |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `itemsFactoryAppearanceSuffix.Gender`   | <p>This item is gendered<br>When resolving the appearance name via <code>rootentity.ent</code>, the game will look for <code>appearanceName&#x26;Female</code> and <code>appearanceName&#x26;Male</code>.</p>                                                                                                                                               |
| `itemsFactoryAppearanceSuffix.Camera`   | <p>This item has special rules for first and third person camera<br>When resolving the appearance name via <code>rootentity.ent</code>, the game will look for <code>appearanceName&#x26;FPP</code> and <code>appearanceName&#x26;TPP</code>.</p>                                                                                                           |
| `itemsFactoryAppearanceSuffix.Partial`  | If the current item has `hide_T1part` part and slot `OuterChest` is not hidden, will search `rootentity.ent` for`&Full` or `&Part`                                                                                                                                                                                                                          |
| `itemsFactoryAppearanceSuffix.HairType` | <p>Defines how your item will look if a certain hair type is loaded (e.g., hide the back half of a bandana for long hair).<br>When resolving the appearance name via <code>rootentity.ent</code>, the game will look for <code>&#x26;Short</code>, <code>&#x26;Long</code>, <code>&#x26;Dreads</code>, <code>&#x26;Buzz</code>, <code>&#x26;Bald</code></p> |

For a more in-depth list, see [here](https://drive.google.com/file/d/1aQjb8MpimB9LDNl7y1iTXH13MUvMrKsH/view).

## Setting up the files

{% hint style="success" %}
&#x20;Unless otherwise specified, it'll be assumed that you edit these files in WolvenKit.
{% endhint %}

### Edit the .xl file (text editor)

Put the following content:

```
factories:  
  - tutorial\ops\my_cool_new_items.csv  
localization:  
  onscreens:  
    en-us: tutorial\ops\translation_strings.json  
```

Save and close the file. You do not need to touch this again unless you want to add more files or change paths.

### Edit translation\_strings.json (text editor)

Find the array `root`, then find the array `entries`. (After the optional step in the setup, it should contain only one entry.)\
Change it as follows:

```
localizationPersistenceOnScreenEntry - []   
	femaleVariant: My shirt (unisex)  
	maleVariant:  
	secondaryKey:  my_shirt_name  
```

Duplicate the item by right-clicking on it. Change the new item as follows:

```
localizationPersistenceOnScreenEntry - []   
	femaleVariant: A generic T-shirt. Can be worn by pretty much everyone.  
	maleVariant:  
	secondaryKey:  my_shirt_desc  
```

{% hint style="info" %}
The second part is what you do every time you want to add a new text, such as names for colour variants or different descriptions.
{% endhint %}

### Edit the factory (my\_cool\_new\_items.csv)

1. Find the list `compiledData`. It should have only one entry after you cleaned up the files.
2. Select the item and duplicate it, then select your new entry. (`arrayString`)
3.  It should have three (3) items. Set the values as follows:

    ```
    0: my_shirt  
    1: tutorial\myshirt\rootentity.ent  
    2: true  
    ```

ℹ The list `data` will get overwritten with the values from `compiledData`.

### Edit the mesh\_entity.ent

Find the first component of the type `entGarmentSkinnedMeshComponent`. Set the following values:

```
mesh:   DepotPath:   tutorial\my_shirt\my_mesh.mesh      << path to your mesh  
        Flags:       Default                              << leave this alone  
name:   my_shirt    << this corresponds to the appearanceOverride in appearance.app  
```

Remember the value for `name`, as you'll use it in your `rootentity.ent` a lot.

### Add an item to yourModName.yaml

{% hint style="warning" %}
Since November 1st, 2022, WolvenKit can edit yaml files. With older versions, please use a text editor.
{% endhint %}

Create the first entry in `yourModName.yaml`, so that you can spawn it via `Game.AddToInventory('Items.my_shirt', 1)`. You can copy and paste the part below.

The total file content should be:

```
Items.my_shirt:  
  $base: Items.GenericInnerChestClothing  
  entityName: my_shirt					  
  appearanceName: my_shirt_		  
  displayName: my_shirt_name			  
  localizedDescription: my_shirt_desc  
  appearanceSuffixes: []  
```

In wKit:

[![](https://camo.githubusercontent.com/44632206678c999644b87c80303294dcbce92cd94e01649d5c129a8f6d6d840d/68747470733a2f2f692e696d6775722e636f6d2f6f68496b41544b2e706e67)](https://camo.githubusercontent.com/44632206678c999644b87c80303294dcbce92cd94e01649d5c129a8f6d6d840d/68747470733a2f2f692e696d6775722e636f6d2f6f68496b41544b2e706e67)

### Edit the rootentity.ent

This is a lookup table between the key `appearanceName` in the yaml. It specifies which appearance (`appearanceName`) to look up in which file (`appearanceResource/DepotPath`).

1. Find the array "appearances" - nothing else here interests us at all. There should be only one entry left.
2.  Select it and put the following details:

    ```
    appearanceName:        my_shirt         << as corresponding to the appearance in the mesh itself  
    appearanceResource:    DepotPath: tutorial\my_shirt\appearance.app  << path to your app file  
                           Flags:     Default  
    name:                  my_shirt_        << as corresponding to appearanceName in the *.yaml  
    ```

This connects your entry `Items.my_shirt` from `yourModName.yaml` via `name` with the file specified in `appearanceResource`, where it will then load the appearance entry corresponding to `appearanceName`. (Which we are about to create.)

### Edit the appearance.app

1. Find the array `appearances` - nothing else here interests us at all.
2. Delete all entries but `default`
3. Expand the entry `default`
4. Find the array `partsValues`.
   1. Delete all entries.
   2.  Create a new entry. Set the following value:\
       `resource`: `tutorial\my_shirt\mesh_entity.ent`

       ℹ This file specifies which **components** to load.
5. Find the array `partsOverrides`.
   1. Delete all entries.
   2. Create a new entry. Set the following value:\
      `DepotPath`: `tutorial\my_shirt\mesh_entity.ent`
   3.  Select the array `componentsOverride` and create a new item. Set the following values:

       `componentName`: `my_shirt` (as specified in the `mesh_entity.ent`)

       `meshAppearance`: `default`

       ℹ This will make sure that the component `my_shirt` will be displayed with its appearance `default`, as specified in the mesh.

{% hint style="success" %}
Regardless of whether or not this actually works, this is a great moment for a back-up!
{% endhint %}

## First start: Testing

### Make sure all files are present

In WolvenKit, click the "Install" button. There will now be a folder "packed" in your mod directory, right next to the folder "source".

Check if it includes the following file: `<yourModDir>\packed\r6\tweaks\yourModName.yaml`. If it is missing, you need to copy the `<yourModDir>\source\tweaks` directory over.

### Start the game

Press "Install and Launch" in WolvenKit. This will do the following things:

1. Copy all supported file entries from `source` to their destination under `packed`, overwriting older files
2. Pack an archive in `packed\mod\archive`, overwriting the last version
3. Copy all files under `packed` into your game directory, again overwriting older files
4. Launch the game.

You can now spawn and equip your item by running the following command (as specified in your yaml):

```
Game.AddToInventory("Items.my_shirt")  
```

You should now see your item. If not, consult the section [**Troubleshooting**](adding-new-items.md#troubleshooting) below, or retrace your steps and make sure that everything works before proceeding to the step below.

## Adding an appearance (example: blackred)

{% hint style="warning" %}
Before you add an appearance, make sure that your item is loading up correctly. If you have to debug, you will have to look through every appearance you made!
{% endhint %}

To add an appearance, you will have to touch the following files:

1. \***.yaml**: Adding an entry
2. **appearance.app**: Adding a mapping between rootentity and mesh's appearance
3. **rootentity.ent**: Adding a mapping between yaml's appearance and app's appearance
4. \*_.mesh_:
   1. Adding a MeshMaterialEntry
   2. Adding a MaterialInstance
   3. Adding a material
   4. Connecting those things

### Step 1: Register it in your \*.yaml

1. Duplicate the entire appearance block for an already working item.\
   ⚠Mind the indent!
2. Change the first line to a unique name like `Items.my_shirt_blackred`
3. Set the new appearance name for the `rootentity.ent`\
   `appearanceName: my_shirt_blackred_`
4.  For lookups in your translation file (`translation_strings.json`): Change the values of `displayName` and `localizedDescription` to the corresponding **secondary keys** in the json file.\
    This is optional.

    ```
      displayName: my_shirt_blackred_name			  
      localizedDescription: my_shirt_blackred_description  
    ```

    ℹIf you make any mistakes here, the worst that happens is an empty string.

    **Example:**\
    yaml: `displayName: my_shirt_nameblackred_name`\
    json:

    ```
    localizationPersistenceOnScreenEntry - []   
    	femaleVariant: my item - now in black and red  
    	maleVariant:  
    	secondaryKey:  my_shirt_name_blackred_name  
    ```

The total entry should look like this:

```
Items.my_shirt_blackred:  
  $base: Items.GenericInnerChestClothing  
  entityName: my_shirt					  
  appearanceName: my_shirt_blackred_		  
  displayName: my_shirt_blackred_name			  
  localizedDescription: my_shirt_blackred_description  
  appearanceSuffixes: []  
```

### Step 2: Add it to the rootentity.ent

Expand the list `appearances` and **duplicate** your already working entry.

Change the following fields:\
`appearanceName` => everything before the & must match `appearanceName` in your \*.yaml\
`name` => must match the name you're going to put in your `app.app`

**Example**:

old (copy):

```
	appearanceName: my_shirt  
	name: my_shirt_&TPP  
```

new:

```
	appearanceName: my_shirt_blackred  
	name: my_shirt_blackred_&TPP  
```

{% hint style="info" %}
You do not need to change the `appearanceResource`.
{% endhint %}

### Step 3: Add it to appearance.app

Duplicate your already working entry and name it the way you've just defined as `appearanceName` in the `rootentity.ent`.

{% hint style="info" %}
If you're missing any of the items below, go back to "Edit the appearance.app" above. If everything is beyond broken, restore the file from one of your backups.
{% endhint %}

1. Open the .app file and expand the list `appearances`.
2. Duplicate an item and select the new one.
3. In the new appearance, find the array `partsOverrides` and expand it.
4. Select the item inside.
5. Find and expand the Array `appearanceAppearancePartOverrides` and expand it.
6. Select the first item.
7. Open the array `componentsOverride` and select the first item.
8. Change the value of `meshAppearance` to the name of your new appearance in the mesh:

```
componentName: my_shirt             << no need to change this  
mesh_appearance: black_red           << corresponds to meshMeshAppearance.name in my_mesh.mesh  
```

{% hint style="info" %}
You can leave `partsValues` alone - this just points at the file that loads the mesh, and you've already set it up above when setting up the file.
{% endhint %}

### Step 4: Add it to the .mesh

This tutorial assumes you already know how to [recolour an item](editing-existing-items/changing-materials-colors-and-textures.md). Quick reminder about the mlsetup:

1. Export it to json
2. edit the `mlsetup.json` with the [MLSetupBuilder](https://github.com/Neurolinked/MlsetupBuilder)
3. Import it back

Now we're adding the new appearances:

1. Find the array `materials` and open it.
   1. Duplicate the last entry. (Yes, use the last one, please, it's important for step 3).
   2. Select the new last entry
   3.  Set the following values:

       ```
       name:  mat_black_red             <<< will be used by meshMeshAppearance in appearances[]  
       index: <index of item in array>  
       ```

       If you duplicated the last material, you can just increase it by one.
2. Find the array `localMaterialBuffer` and open it
   1. Duplicate any entry with an mlsetup (You will see an entry `MultilayerSetup` under `values`)
   2. Drag it to the last position of the array (that's important, because the materials entries match by numeric index)
   3. Select the new item, open `values`, and select `MultilayerSetup`.
   4. Set `baseMaterial/DepotPath` to the `.mlsetup` file that you want.,
3. Find the array `appearances` and open it.
   1. Duplicate any material.
   2. Change the name to the one you've defined in the `appearance.app` above (in this case: `black_red`):
   3. Select the array `chunkMaterials` and change the entries in the right-hand panel to use the material you defined in step 1.

### Test it

Now, log into the game and spawn the item variant. The name is in the yaml file, in this case

```
Game.AddToInventory('Items.my_shirt_blackred')  
```

## Preview images

Okay, now you've added something! But it doesn't have a preview icon yet - you'll have to add this manually. For this purpose, you'll have to edit an image.

{% hint style="danger" %}
You can not use Photoshop for the final step. Or rather, you can, but the transparency will be botched. I recommend [paint.net](https://www.getpaint.net/download.html), it's free.
{% endhint %}

Cyberpunk uses xbm as format for its textures. These textures are then **mapped** (divided into slices) by inkatlas files. The individual slots can then be used by the game for pretty much everything from UI elements to phone call icons — and image previews.

{% hint style="info" %}
If you want to use the in-game previews, you can find them under `base\gameplay\gui\common\icons\items`
{% endhint %}

### Setting up the files

First of all, [download](https://www.mediafire.com/file/3slvnkhjbz0jt65/inkatlas\_templates\_apart\_v1.zip/file) the template archive (kindly provided by Apart). This includes the following files:

| Template                      | Size of slot image |
| ----------------------------- | ------------------ |
| 5\_outfits                    | 160x320 (x5)       |
| 5\_weapons                    | 360x120 (x5)       |
| 40\_items\_inkatlas\_template | 160x160 (x40)      |

As for how to take image previews, refer to [this guide](https://drive.google.com/file/d/1aQjb8MpimB9LDNl7y1iTXH13MUvMrKsH/view), section "Making the icon". This guide assumes that you have a bunch of ready-made icons lying around.

Select 40\_items\_inkatlas\_template and copy the **.inkatlas** and the **.xbm** `tutorial\ops`. I'll rename them to `preview_icons` , future me will be grateful:

```
tutorial  
	ops		   
      	- my_cool_new_items.csv  
      	- translation_strings.json  
      	- preview_icons.inkatlas       <<<  
      	- preview_icons.xbm            <<<  
```

### Getting the preview in place

Open `40_item_template.pdn` in [**paint.net**](https://www.getpaint.net/download.html) and put all your icons in. Hide the background layer once you're done, and save it as png under

```
<yourModDirectory>\raw\tutorial\ops\preview_icons.xbm  
```

{% hint style="info" %}
You can also export `preview_icons.xbm` via WolvenKit, and the resulting `preview_icons.png` in paint.net!
{% endhint %}

Once you're done, import it back. Use the following settings:

[![](https://camo.githubusercontent.com/6191ea85dce6cbf272694a464a89a9c8fdd1333fd9bce8436aec97684e729355/68747470733a2f2f692e696d6775722e636f6d2f486370743652332e706e67)](https://camo.githubusercontent.com/6191ea85dce6cbf272694a464a89a9c8fdd1333fd9bce8436aec97684e729355/68747470733a2f2f692e696d6775722e636f6d2f486370743652332e706e67)

You can now open `preview_images.xbm` in WKit, it should have your items.

### Hooking up the inkatlas

1. Open the file in WolvenKit.
2. Open the list `slots`.
3. For the first two `inkTextureSlot` items, set the value for `DepotPath` to the relative path of your xbm (`tutorial\ops\preview_icons.xbm`):\
   [![](https://camo.githubusercontent.com/de75d2fe693670acc81643404a2692f00e035694a7ea9f5a5a01949c87162c0e/68747470733a2f2f692e696d6775722e636f6d2f655953666c46472e706e67)](https://camo.githubusercontent.com/de75d2fe693670acc81643404a2692f00e035694a7ea9f5a5a01949c87162c0e/68747470733a2f2f692e696d6775722e636f6d2f655953666c46472e706e67)
4. Save the file. Currently (October 20022), WKit doesn't yet auto-update, so you need to close and re-open your inkatlas.
5. You now have a tab "PartMapping". You can now see which texture corresponds to which slot:\
   [![](https://camo.githubusercontent.com/ebb4bfd08e046d42e7af459b4037371907951856ccbe8eafaabd7610955bd46b/68747470733a2f2f692e696d6775722e636f6d2f5370494d4f306c2e706e67)](https://camo.githubusercontent.com/ebb4bfd08e046d42e7af459b4037371907951856ccbe8eafaabd7610955bd46b/68747470733a2f2f692e696d6775722e636f6d2f5370494d4f306c2e706e67)

### Adding it to the yaml

We add three more lines to the item:

```
Items.my_shirt_blackred:  
  $base: Items.GenericInnerChestClothing  
  entityName: my_shirt					  
  appearanceName: my_shirt_blackred_		  
  displayName: my_shirt_blackred_name			  
  localizedDescription: my_shirt_blackred_description  
  appearanceSuffixes: []  
  icon:  
    atlasResourcePath: tutorial\ops\preview_icons.inkatlas  
    atlasPartName: slot_16  
```

{% hint style="warning" %}
Again, please note that indent is **crucial** here, as it determines the node structure. The first line needs to have an indent of 0, the lines from `$base` to `icon` need to have two spaces, and the lines `atlasResourcePath` and `atlasPartName` need to have four.
{% endhint %}

That's it! Time to test!



## Atelier integration

This section will detail how to add an Atelier store with your items.

{% hint style="warning" %}
You need to install the [VirtualAtelier](https://www.nexusmods.com/cyberpunk2077/mods/2987) mod for this.
{% endhint %}

### Generating an icon

First of all, [download](https://www.mediafire.com/file/3slvnkhjbz0jt65/inkatlas\_templates\_apart\_v1.zip/file) the template archive (kindly provided by Apart) and find the folder virtual\_atelier\_inkatlas\_icon\_template.

```
atelier_icon_template.inkatlas                        << map for the game  
atelier_icon_template.png                             << 200x200px image for a final slot  
atelier_icon_template.xbm                             << game texture  
virtual_atelier_png_to_xbm_import_settings.png        << image, also embedded here  
```

Put the .inkatlas and .xbm into your ops folder under `tutorial\ops` and rename them to `atelier_icon`:

```
tutorial  
	ops		   
      	- my_cool_new_items.csv  
      	- translation_strings.json  
      	- preview_icons.inkatlas       
      	- preview_icons.xbm            
      	- atelier_icon.inkatlas        <<<  
      	- atelier_icon.xbm             <<<  
```

Now, create your icon. The process is the same as in the section "Preview images". The resulting slot will be named `slot_01`.

### Creating the atelier file

1. Visit [this](https://jovial-shockley-612ec8.netlify.app/) website and fill out the information:

| Field                                                      | Content                                                                                                                         |
| ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| Store ID (characters only, w/o spaces, '-', '\_' and etc.) | `MyTutorialAtelierStore`                                                                                                        |
| Store Name                                                 | `My Tutorial Atelier Store`                                                                                                     |
| Atlas Resource                                             | <p><code>tutorial/ops/atelier_icon.inkatlas</code><br>⚠Make sure to replace all backward slashes with forward slashes here!</p> |
| Texture Part                                               | `slot_01`                                                                                                                       |

1. Now, add your item.

| Field     | Content                                          |
| --------- | ------------------------------------------------ |
| TweakDBID | `Items.my_shirt`                                 |
| Price     | Whatever price you want, 0 means that it's free  |
| Quality   | Are we settling for anything but legendary here? |

​ Ignore "Icon path" and "description", we have these in the item itself.

1. Click "Add Item". Repeat the process with as many items as you want.
2. Click "Generate".

### Placing the atelier file

Move the atelier file from your download folder to WolvenKit's `resources` folder:

```
resources
  - MyTutorialAtelierStore-atelier-store.reds         << new file
  - yourModName.archive.xl  
  - yourModName.yaml         
```

Now, it's time to test! Install the mod, then start Cyberpunk via start menu shortcut.

⚠As of today (3rd of November 2022), starting Cyberpunk via WolvenKit will **not generate your atelier store**. You need to first install the mod, then start the game via start menu or GOG launcher.

## Troubleshooting

{% hint style="info" %}
There is a tool designed to help you with this process. You can find it [here](https://github.com/solaarTW/DeepAssetDiscovery/releases).
{% endhint %}

First of all, check the logs:&#x20;

* `red4ext/plugins/ArchiveXL/ArchiveXL.log`&#x20;
* `red4ext/plugins/TweakXL/TweakXL.log`

Second of all, make sure that you do not have capital letters in any of your path or file names - as of 1-1-6, they are not currently supported.

### My item shows empty text instead of name/description!

Something went wrong with your json file:

<figure><img src="https://camo.githubusercontent.com/6aebdc1d9a291c0bc2fbfc0b56006f87c3db452343ef4e938cfe33ca3bfa3768/68747470733a2f2f692e696d6775722e636f6d2f583562703644372e706e67" alt=""><figcaption></figcaption></figure>

If there are no errors in any of the log files, check the following places:

* `yourmodname.archive.xl`:
  * Does the key `localization - onscreens - en-us` exist?
  * Is the indentation correct, as shown in the picture?
  * Does it point at the correct file (`tutorial\ops\translation_strings.json`), or did you rename or move it?
  * Did you make any typos?
* `yourModName.yaml:`
  * Is the spelling for the key you defined after `displayName` and `localizedDescription` identical to the one in the json file?
* `translation_strings.json`:
  * Is the spelling of the key defined in yaml's `displayName` and `localizedDescription` identical?
  * Did you set the femaleVariant (default)?
  * Are you using quotation marks? If so, switch to singlequotes!

### I spawn my item, but nothing happens!

That's relatively easy to fix — the error is somewhere in the first part of the chain:

<figure><img src="https://camo.githubusercontent.com/f8ee9b6e640405d93e9d543b4ac488e7644a5976c74552a54d288ac9b81f182a/68747470733a2f2f692e696d6775722e636f6d2f517a4d6e7645762e706e67" alt=""><figcaption></figcaption></figure>

Check the following places:

* `yourmodname.archive.xl`:
  * Is the indentation correct, as shown in the picture?
  * Does the value for `entityName` have a corresponding entry in the factory (`my_cool_new_items.csv`)?
  * Does it point at the correct rootentity(`tutorial\myshirt\rootentity.ent`), or did you rename or move it?
  * Did you make any typos?
* `rootentity.ent:`
  * Is the spelling for the key you defined after `displayName` and `localizedDescription` identical to the one in the json file?
  * Are you using any **suffixes**? Are you using the correct ones? Try creating a fall-back entry without any suffixes.

### The item spawns, but…

Congratulations, you've made it into the right half of the diagram! The error will be somewhere here:

<figure><img src="https://camo.githubusercontent.com/621b7d370bdaaec42cf16a5a321512eaf0eaeb0decbe6ccc23865023802f98e7/68747470733a2f2f692e696d6775722e636f6d2f666c34306f465a2e706e67" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If you set your `mesh_entity.ent` to point at a vanilla mesh, you can rule out your custom mesh and .mlsetup as a source of errors. Original game meshes will always have a working default appearance and will thus always be displayed!
{% endhint %}

### The game crashes!

That means the chain is working, but something isn't loaded correctly. That's good! Check the following files:

* `appearance.app`: Check the `partsValues` and `partsOverrides` entries. They need to point at the `mesh_entity.ent`, **not** at the mesh.
* `mesh_entity.ent`: Does the `component` entry point to a valid mesh? Try it with a default mesh as detailed above.

If that works, then the problem is your mesh.

### Troubleshooting a mesh

For more detailed error handling, check the sections below.

ℹ In the "Mesh Preview" tab of your mesh, you can "Generate Materials for Appearance". If the correct colours show up, you can at least rule out that the error is in the .\*mesh or the \*.mlsetup!

* Make sure that you have the same number of entries in `materialEntries` and `localMaterialBuffer.materials` .
* Go through the `CMaterialInstance`s in `localMaterialBuffer.materials`.
  * Make sure that the files you're loading exist.
  * Make sure that you don't load a mlmask under a key for an mlsetup or vice versa.

If none of that helps, I suggest

* doing a gdb export
* throwing away your mesh (don't close the WKit tab yet), falling back to the original one
* doing a gdb import
* replacing the arrays `appearances`, `localMaterialBuffer.materials` and `materialEntries` with those from your previous mesh.

### My mesh is black and shiny!

Congratulations, this is about the easiest-to-resolve error that you could've had. Your mesh is loaded correctly, there is only a problem with the rendered **material**.

Check your mesh file:

* Check the connection between `appearance`, `materialEntry` and `localMaterial.CMaterialInstance`. Are the names correct?
* Go through the `CMaterialInstance`s in `localMaterialBuffer.materials`.
  * Make sure that the files you're loading exist.
  * Make sure that you don't load a mlmask under a key for an mlsetup or vice versa.

### My mesh has the wrong appearance!

Either an appearance is incorrectly selected, or it is incorrectly resolved. Check the following places for copy-paste/duplication mistakes:

**yourModName.yaml** - is the `appearanceName` correct, or did you forget to change it?\
**rootentity.ent** - does the `name` corresponding to the field above point to the `appearanceName` with the right name?\
**appearance.app** - does the appearance's `partOverride` set the correct appearance in the `componentsOverride`?

Now, check the mesh file (close and re-open it to make everything refresh):

**appearance** - does it use the correctly named material?\
**materialEntries** - is the index correct, or is it pointing at the index of the actually displayed material?\
**localMaterialBuffer** - does the CMaterialInstance use the correct .mlsetup file?

Finally, check the .mlsetup: does it actually use different colours, or is it just a duplicate?

### My mesh is invisible!

Here we go. This is the big one, and it's Not Fun. The error can be anywhere between the yaml and the mesh. You can rule out one of the files with the following question:

**Does the glitching stop after <10 seconds?**\
If not: the appearance can't be resolved - ignore the mesh\
If yes: the appearance is resolved, but can't be displayed - ignore the yaml

ℹIf the appearance is resolved, but not displayed (short glitch), the first thing you should do is to change the path in the `mesh_entity.ent` to one of the game's default meshes. This will rule out errors on your part. (_Yes, even if your mesh worked in another mod. No, I'm not speaking from experience, why do you ask?_)

If the hint above doesn't solve it, proceed to troubleshoot in the same way as "My mesh has the wrong appearance!" above.

### I can't find anything, kill me now

Time to restore your files one by one to the last working backup and restart from there.\
Don't delete them, keep them in a different folder - you will be able to copy a lot of stuff over.

{% hint style="info" %}
By right-clicking on a tab title, you can move it to a new document group for easier copying.
{% endhint %}

\
Good luck, soldier.
