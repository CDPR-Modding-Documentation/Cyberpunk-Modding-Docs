---
description: All the dirty detes on appearance files
---

# Appearance: .app files

{% hint style="success" %}
If you want to modify an .app file to change an NPC's appearance, check [here](../../../modding-guides/npcs/appearances-change-the-looks.md#the-.app-file)!

To learn how to influence items inside appearances, check [#partsoverrides-changing-other-meshes](../../../modding-guides/items-equipment/influencing-other-items.md#partsoverrides-changing-other-meshes "mention")
{% endhint %}

## Appearances

The real meat of the file: a list of appearance definitions, loaded via [root entity](../entity-.ent-files/#root-entity).&#x20;

### appearanceResource

* `baseEntityType`: name that exists in the base type map and mapped to the correct .ent file
* `commonCookData`: the .cookedapp file that stores a copy of the data for faster loading

### appearanceDefinition

A list of appearance definitions to be called from a [`root entity`](../entity-.ent-files/#root-entity)  file. The definitions are independent from each other (unless parentAppearance is used? Confirmation needed) and load meshes and effects via components.

* `name`: the appearance's name that is listed in [its .ent file](../entity-.ent-files/#root-entity)
* `parentAppearance`: the appearance this one inherits information from
* `proxyMesh`: the .mesh file loaded for rendering the vehicle at a distance (confirmation needed)
* `resolvedDependencies`: pre-loaded resources. You will usually want to delete these if you're adding items from scratch.
* `looseDependencies`: lazy-loaded resources (confirmation needed)

#### Components

A list of components that are part of your current appearance. There are various types of components,  which are documented [here](../components/).\


{% hint style="info" %}
Components that you add in the [`root entity`](../entity-.ent-files/#root-entity) will be shared among all appearances in the .app.&#x20;
{% endhint %}

#### partsValues

{% hint style="info" %}
This only works for player equipment and weapons (April 2023)
{% endhint %}

Allows you to add one or more [component entities](../entity-.ent-files/#mesh-component-entity-simple-entity) into your appearance. They will be treated as if the components were part of the appearance's `components` array.

<figure><img src="../../../.gitbook/assets/partsvalues.png" alt=""><figcaption></figcaption></figure>

#### partsOverrides

Overrides component definitions via name. They can be defined in the appearance's own components array or loaded via [component entity](../entity-.ent-files/#mesh-component-entity-simple-entity).&#x20;

You can use them to change the appearance or visibility of components outside of the current .app file (for usage instructions, see [#partsoverrides-changing-other-meshes](../../../modding-guides/items-equipment/influencing-other-items.md#partsoverrides-changing-other-meshes "mention")).&#x20;

{% hint style="warning" %}
You can't un-hide something via partsOverrides — you'll have to use [custom tags](../../core-mods-explained/archivexl/archivexl-tags.md#adding-custom-tags) for this.
{% endhint %}

{% hint style="info" %}
If you leave the `depotPath` empty, then the component override will be handled by ArchiveXL. You should probably do this, which is why [file validation](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/file-validation) will tell you about it.

For example, the base game isn't smart enough to omit an empty or unchanged mesh appearance name, overwriting your dynamic variants.
{% endhint %}

## commonCookData

{% hint style="info" %}
This has been removed with 2.1 — the information below is preserved for historical reasons.
{% endhint %}

To save a few processing cycles, CDPR doesn't evaluate .apps on load, but instead keeps a pre-cooked cache under `base\cookedappearances`. CommonCookData is the lookup path for such a file. As long as the file in question exists and isn't empty, your changes might not register, or components that you removed will still be displayed.

Once you start modding, you'll want to install the [cookedapps nulled](https://www.nexusmods.com/cyberpunk2077/mods/3051) mod to prevent such issues.&#x20;

