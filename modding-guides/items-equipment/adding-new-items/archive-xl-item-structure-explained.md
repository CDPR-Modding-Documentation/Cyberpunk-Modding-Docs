---
description: More detailed explanations for the guide "Adding new items"
---

# Archive XL: Item structure explained

## Structural files: telling the game about your mod

We need **four** files to tell the game about our new items:&#x20;

1. the .xl file, which tells ArchiveXL which files to register
2. the .json file with the translations
3. the factory.csv, telling the game about your custom files
4. the yaml, which tells TweakXL about your item's properties

<figure><img src="../../../.gitbook/assets/archivexl_files_01.png" alt=""><figcaption><p>The file structure as used in the <a href="./">Adding New Items</a> guide. Some information has been omitted for brevity.</p></figcaption></figure>

### The .xl file

This file will be in the same directory as your mod's .archive file. It lets ArchiveXL register the [factory](archive-xl-item-structure-explained.md#the-.csv-file-the-factory) (`my_shirt_factory.csv`) and the [localization file](archive-xl-item-structure-explained.md#the-.json-file) (`translation_strings.json`).

You usually touch this only once, unless you want to add more factories or translation files.

<figure><img src="../../../.gitbook/assets/archive_xl_the_xl_file.png" alt=""><figcaption><p>Example .xl file. Note that anything with a - at the beginning of the line indicates a <strong>list;</strong> you can add more entries!</p></figcaption></figure>

### The .json file (custom texts, i18n)

This is the **localization** file for language-specific entries (green boxes on [the xl file](archive-xl-item-structure-explained.md#the-.xl-file)'s screenshot). \
If no entry for a language is defined, then the English one will be used.&#x20;

An entry will look like this:

```
femaleVariant: Tutorial shirt (unisex), white/red
maleVariant: They say it is unisex, but it's really not
primaryKey: 0  
secondaryKey: my_shirt_localization_name_white_red
```

The value under `secondaryKey` **must** match the entry in your .yml file, or you will just see an empty string.

{% hint style="info" %}
If you don't need a male-specific translation, you can leave it blank — by default, `femaleVariant` will be used.
{% endhint %}

### The .csv file (the factory)

The factory connects your `.yaml` to the corresponding `rootEntity.ent` via `entity_name`.&#x20;

When reading your .yaml file (e.g.`tutorial_my_custom_tshirt.yaml`, [next section](archive-xl-item-structure-explained.md#the-control-file-yourmodname.yaml)), the game will find entries like this:

```
Items.my_custom_shirt_redwhite:
  entityName: my_custom_shirt_factory_name             << this is for the factory.csv
  appearanceName: appearance_root_entity_white_red     << this is for the root_entity.ent
```

When spawning an item, TweakXL knows which entity file to use by filtering `entityName` for a match in the first field:

```
{  
	0: my_custom_shirt_factory_name                      << as corresponding to entityName in appearance.app  
	1: tutorial\torso\my_custom_shirt\root_entity.ent    << this file will be used to resolve the appearances  
},   
{  
	0: my_custom_boots_factory_name                      << this does not match  
	1: tutorial\feet\my_custom_boots\root_entity.ent     << so this file won't matter here  
}  
```

… and use `root_entity.ent` to look up an appearance by the name of `appearance_root_entity_white_red`.

### The control file: yourModName.yaml

This file controls the adding of items to the game. An entry looks like this:

<figure><img src="../../../.gitbook/assets/archive_xl_the_yaml_file.png" alt=""><figcaption></figcaption></figure>

<pre><code><strong>Items.my_custom_shirt_redwhite:                      &#x3C;&#x3C; name of your item (the spawn code)
</strong>  $base: Items.GenericInnerChestClothing             &#x3C;&#x3C; Type of item - see “the $base parameter” for detes
  entityName: mymy_custom_shirt_factory_name_shirt   &#x3C;&#x3C; lookup key for factory.csv: which root_entity file should be used?
  appearanceName: appearance_root_entity_white_red   &#x3C;&#x3C; appearance name as in root_entity.ent
  displayName: my_shirt_localization_name_white_red  &#x3C;&#x3C; item name: “secondary key” in localization.json
  localizedDescription: my_shirt_localization_desc   &#x3C;&#x3C; item description: “secondary key” in localization.json
  quality: Quality.Legendary                         &#x3C;&#x3C; item quality - we don’t want garbage, do we?
  appearanceSuffixes: []                             &#x3C;&#x3C; Put an empty array until you know what suffixes are (link on the page)
  icon:                                              &#x3C;&#x3C; Defines your preview item - see “preview” for detes
    atlasResourcePath: path_to\your.inkatlas         &#x3C;&#x3C; relative path to your .inkatlas file for your preview
    atlasPartName: slot_01                           &#x3C;&#x3C; slot name in .inkatlas file
</code></pre>

{% hint style="info" %}
The entry above will let you add the item via `Game.AddToInventory('Items.my_custom_shirt_redwhite')`
{% endhint %}

Four **mappings** take place here:

1. `entityName`: Points to the [factory.csv](archive-xl-item-structure-explained.md#the-.csv-file-the-factory) (see documentation there as for what it works)
2. `appearanceName`: In the [root entity](archive-xl-item-structure-explained.md#rootentity.ent) specified in the factory, it will look for an appearance by this name.

{% hint style="info" %}
The appearance name will only be considered up to the first [suffix](archive-xl-item-structure-explained.md#suffixes-and-whether-you-need-them). If you want to know what those pesky & things are doing in the file path,&#x20;
{% endhint %}

3. `displayName`/`localizedDescription` : In the `translation_strings.json`, find an array where the value for \[3] (the last entry) is identical to this key. Then, check which gender V has, and display either `femaleVariant` or `maleVariant`.
4. `icon:` This hooks up your custom preview.&#x20;

#### What is it, precious? The $base parameter

`$base` defines which type we have here. All those types have different properties (e.g. on which slot they are), and they **inherit properties** from their parent template.&#x20;

The following types of clothing exist:

* Items.GenericHeadClothing
* Items.GenericFaceClothing
* Items.GenericOuterChestClothing
* Items.GenericInnerChestClothing
* Items.GenericLegClothing
* Items.GenericFootClothing

{% hint style="info" %}
The inherited properties can cause problems (see "[**Suffixes, and whether you need them**](archive-xl-item-structure-explained.md#suffixes-and-whether-you-need-them)" below for more detail). We're getting around these by manually overwriting them with `appearanceSuffixes: []`.
{% endhint %}

You can absolutely set up a shirt and then put `$base: Items.GenericHeadClothing` - V is the only person I know of who can wear their undies on their head without impairing their functionality.\
However, before you start abusing the system that way, you might want to look into [EquipmentEx](https://github.com/psiberx/cp2077-equipment-ex) instead.

{% hint style="warning" %}
When editing this file, please keep in mind that **indent is important**!&#x20;

The first line of each block **must not** have spaces, the blocks below must have the same amount of spaces. More spaces means more child, this can break your entire structure.
{% endhint %}

## The game files

Now that we're done with the base structure, we can take a look at the game files. Like for any of the vanilla game items, we have four of them. This guide will only hold information that's directly relevant to adding item, but in the individual sections below, you will find links to more documentation about the files.

* [root\_entity.ent](archive-xl-item-structure-explained.md#root\_entity.ent)
* appearance.app
* mesh\_entity.ent
* the mesh file

### Overview

This is how the files connect to each other. If your head explodes now, don't worry: it's not as complicated as it looks, and the item addition guide will walk you through step by step.

<figure><img src="https://i.imgur.com/evVMjhn.png" alt=""><figcaption><p>File structure explained</p></figcaption></figure>

### root\_entity.ent

{% hint style="info" %}
[Would you like to know more?](../../../modding-know-how/files-and-what-they-do/entity-.ent-files/#root-entity) Full documentation of the root\_entity is on its own page.
{% endhint %}

The entry point from your yaml, this file is a glorified lookup dictionary: for any `appearanceName`, it will specify an `.app` file and the name of an appearance in the `.app` file.

An entry looks like this:

```
appearanceName:        white_red_appearance_name
appearanceResource:    DepotPath: tutorial\torso\my_custom_shirt\my_custom_shirt.app
                       Flags:     Default  
name:                  appearance_root_entity_white_red

or
name:                  appearance_root_entity_black_red&Suffixes
```

{% hint style="danger" %}
If you [don't know what suffixes are](../../../modding-know-how/files-and-what-they-do/entity-.ent-files/.ent-files-suffixes.md), **you should not use them** because they can prevent your item from spawning.&#x20;

To make sure of that, each entry in your [.yaml](archive-xl-item-structure-explained.md#the-control-file-yourmodname.yaml) should contain the following line:\
&#x20; `appearanceSuffixes: []`&#x20;
{% endhint %}

### mesh\_entity.ent

{% hint style="info" %}
[Would you like to know more?](../../../modding-know-how/files-and-what-they-do/entity-.ent-files/#mesh-component-entity-simple-entity) Full documentation of the mesh\_entity is on its own page.
{% endhint %}

For our purposes, this is a collection of components that we're pulling in from the .app file rather than re-defining it once per appearance.

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

### appearance.app

Contains a list of appearances as mapped by [`rootentity.ent`](archive-xl-item-structure-explained.md#rootentity.ent). Each of the appearances will load `mesh_entity.ent` via partsValues and specify&#x20;

{% hint style="danger" %}
**For experienced modders**

The .app file's component array should be **empty:** this is not an NPC appearance! :)
{% endhint %}

An entry will look as follows:

<figure><img src="../../../.gitbook/assets/archive_xl_app_file.png" alt=""><figcaption><p>Appearance.app (annotated)</p></figcaption></figure>

`partsValues` will define what [mesh\_entity](archive-xl-item-structure-explained.md#mesh\_entity.ent) file(s) to load (as a list of components), while `partsOverrides` tells the [mesh](archive-xl-item-structure-explained.md#mesh) which appearance to use.

For ArchivXL >= [1.4.0](https://github.com/psiberx/cp2077-archive-xl/releases/tag/v1.4.0-rc2), appearance overrides can understand the following variables for `meshAppearance`:

|                |                                                                                                                                       |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `{gender}`     | m or w depending on V's body gender                                                                                                   |
| `{skin_color}` | [skin color appearance name](../../../modding-know-how/references-lists-and-overviews/cheat-sheet-face-and-skin/#skin-tones-by-index) |
| `{hair_color}` | [hair color appearance name](../../../modding-know-how/references-lists-and-overviews/hair.md#name-in-files-by-index)                 |

### Mesh

{% hint style="info" %}
[Would you like to know more?](../../../modding-know-how/3d-modelling/meshes.md) The documentation for .mesh files lives on their own page!
{% endhint %}

The mesh file maps **materials** to appearances. To find out how exactly it does that, find the [material section](../../../modding-know-how/3d-modelling/meshes.md#materials) on the mesh wiki page.&#x20;

For our purposes it's enough to say that you can **define** your individual appearances here. For a guide on how to do that, check [here](../editing-existing-items/changing-materials-colors-and-textures.md#step-2-finding-the-correct-appearance) or the [mesh knowledge page](../../../modding-know-how/3d-modelling/meshes.md).

<figure><img src="../../../.gitbook/assets/archive_xl_mesh_file.png" alt=""><figcaption></figcaption></figure>

## The final result

This is how everything plays together:

<figure><img src="https://i.imgur.com/i1QzZMP.png" alt=""><figcaption><p>Not so bad, is it?</p></figcaption></figure>

