---
description: All the dirty detes on entity files
---

# Entity: .ent files

## Definition

Serves as the top-level container for **entities** and their properties within the game. Most things that you can see, touch, or interact with have an .ent file somewhere in their hierarchy. Examples are player equipment, weapons, NPCs, interactables (doors, vending machines…)

For the purpose of modding, we distinguish between two different kinds of entity files.&#x20;

{% hint style="info" %}
To see a minimal example in action, see the guide for [creating custom props](../../modding-guides/everything-else/custom-props.md#entity-file).
{% endhint %}

## Mesh/Component entity (simple entity)

The minimal way of adding something (e.g. meshes) to the game. This entity can be directly spawned (e.g. [via AMM](../../modding-guides/everything-else/custom-props.md#without-variants)) or referenced from within[ ](../appearance-.app-files.md)[appearance-.app-files.md](../appearance-.app-files.md "mention").

<figure><img src="../../../.gitbook/assets/mesh_entity.png" alt=""><figcaption><p>This entity adds four physical mesh components, which will appear when it is spawned. It does not reference an .app file and does not have appearances.</p></figcaption></figure>

For **player equipment** (weapons and armour), you can use mesh entities to **encapsulate** parts of your item. You load such .ent files via `partsValues`, which will be added to the corresponding appearance as if the components had been in the .app file itself.&#x20;

{% hint style="danger" %}
As of April 2023, `partsValues` will be ignored for anything but player equipment.
{% endhint %}

This is good practice to avoid repetition, and also to make it easy on yourself if you want to change paths later in your project (imagine having defined 20 appearances with 5 components each, and then wanting to rename your mesh folder…)

## Root entity

The **entry point** for the game to display an [NPC](../../modding-guides/npcs/appearances-change-the-looks.md#the-.ent-file) or [prop](../../modding-guides/everything-else/custom-props.md). This kind of entity only defines those [components](../components/) that are shared among all appearances. Meshes are defined in the [app file](../appearance-.app-files.md), where they can be assigned different properties (e.g. materials) per appearance.&#x20;

{% hint style="warning" %}
This file is how the game handles **item uniqueness**. For that reason, you should have one root entity per item. If you put multiple entries into the same file, then you can't wear them simultaneously (for e.g. EquipmentEx).
{% endhint %}

From ArchiveXL item additions, this kind of file is usually called a **root entity**.

<figure><img src="../../../.gitbook/assets/root_entity.png" alt=""><figcaption></figcaption></figure>

* An entity file can define multiple appearances, which can point to different .app files.&#x20;
* For [creating props](../../modding-guides/everything-else/custom-props.md), **root entities** are used as the defining key (one entity => one item, which can have multiple appearances)
* Names support [suffixes](../../modding-guides/items-equipment/adding-new-items/#suffixes-and-whether-you-need-them), allowing you to load different appearances based on body gender or camera mode. These are only used for player equipment and look like `&FPP`
* How you split your .app files is largely a matter of taste. At CDPR, they usually shove everything into one file.

## What are suffixes?

{% hint style="info" %}
For more information on this (and for a better way of implementing this), check [archivexl-suffixes-and-substitutions.md](../../core-mods-explained/archivexl/archivexl-suffixes-and-substitutions.md "mention")
{% endhint %}

In a [root\_entity file](./#root-entity), you can give the game a list of appearances and have them mapped to an [.app file](broken-reference) by entry name. While that's pretty good already, have you ever wanted to be more specific — for example, "for a male character, use this appearance, but for a female use this other one?"

This is where suffixes come in. You append them to an appearance's name in the [root\_entity](./#root-entity), and the game will pick the correct appearance (and the correct[ app file](../appearance-.app-files.md), and the correct mesh!) based on the best match.

{% hint style="success" %}
Find  step-by-step walkthrough on using suffixes in the [ArchiveXL item addition guide](../../modding-guides/items-equipment/adding-new-items/#adding-a-male-instance).
{% endhint %}

If you are registering an item via ArchiveXL, you can define suffixes via  `appearanceSuffixes: [ … ]` in the .yaml file.

{% hint style="info" %}
Your item will inherit the suffix setup from the `$base` component. In the example of `Items.GenericHeadClothing`, that will be

```
appearanceSuffixes: [ 
  itemsFactoryAppearanceSuffix.Gender, 
  itemsFactoryAppearanceSuffix.Camera ]  
```
{% endhint %}

### What can possibly go wrong?

{% hint style="warning" %}
**These bad beans can be the reason why your item is invisible!**! You can and should disable the suffixes if you don't need them.

To do so, add an empty array to the yaml entry:

```
appearanceSuffixes: []
```
{% endhint %}

## Which suffixes exist?

{% hint style="info" %}
For a full list, check [#which-suffixes-exist](../../core-mods-explained/archivexl/archivexl-suffixes-and-substitutions.md#which-suffixes-exist "mention")
{% endhint %}
