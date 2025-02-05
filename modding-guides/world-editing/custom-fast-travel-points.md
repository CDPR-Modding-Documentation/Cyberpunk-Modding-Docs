---
description: >-
  This guide will describe the steps necessary to add new native fast travel
  points, using Object Spawner
---

# Custom fast travel points

## Requirements

### Tools

* [Object Spawner](https://github.com/justarandomguyintheinternet/CP77_entSpawner/releases) (v.0.8. or newer)
* [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl)
* [Codeware ](https://github.com/psiberx/cp2077-codeware/releases)(1.14.1 or newer)
* [TweakXL](https://github.com/psiberx/cp2077-tweak-xl)
* [WolvenKit](https://github.com/WolvenKit/WolvenKit) (With latest version of Object Spawner import script)

### Knowledge

* You need to have a basic understanding of:
  * Working with WolvenKit
  * Creating tweaks using TweakXL (`.yaml`files)
  * Using Object Spawner (Spawning things and [importing](exporting-from-object-spawner.md) into WolvenKit)

{% hint style="warning" %}
Any NodeRef names, and custom TweakDB record names in this guide are _examples_, do not use the same ones as in the guide.
{% endhint %}

## TweakXL Setup

* In order to define the **name** and the **district** of your fast travel point, it needs to point to a `FastTravelPoints` [record](https://nativedb.red4ext.com/c/2391411111493531)
* This means you will need to create a custom record using TweakXL
* The below snippet contains the definition for a new one:

```yaml
FastTravelPoints.customPoint:
  $base: FastTravelPoints.bls_nth_dataterm_01
  displayName: "LocKey#123" # Here goes the name of the FT Point, is a LocKey
  district: Districts.Watson # Can be any District record
```

* Place it in a new `.yaml`file inside `Cyberpunk 2077\r6\tweaks`
* Modify the snippet for your custom FT point (Especially change the name of the record to something unique, e.g. `FastTravelPoints.NAMEOFTHELOCATION`)

## Spawning Nodes

* In order to have a working FT point you need two nodes:
  * `worldEntityNode`, the terminal itself
  * `worldStaticMarkerNode`, location where the player gets teleported to (Any other type of node technically works too)

### FT Point

* We will use `base\gameplay\devices\fast_travel\data_term_1.ent`, you can find it under `Entity -> Entity Template`in Object Spawner
* Optionally choose a appearance

### Static Marker

* Spawn a static marker, you can find it under `Meta -> Static Marker`in Object Spawner
* Place it in a fitting spot in front of the terminal
*   Assign a custom NodeRef to the static marker:

    * In the properties section, inside the `World Node`header
    * Make sure the NodeRef is unique
    * E.g. `$/ft/custom/marker`

    <figure><img src="../../.gitbook/assets/image (553).png" alt="" width="354"><figcaption><p>Example of how to assign NodeRef</p></figcaption></figure>

## Setting up instance data

* In order to tell the FT Point what marker to use, and what record to use, we will use entity instance data
* Open the `Entity Instance Data`header of the FT Terminal
*   Expand the entry `DataTerm | Entity`

    * Locate and expand the `linkedFastTravelPoint`header
    * Set `markerRef`to the NodeRef of the marker (`$/ft/custom/marker`)
    * Set `pointRecord`to the custom `FastTravelPoints`record (`FastTravelPoints.customPoint`)

    <figure><img src="../../.gitbook/assets/image (554).png" alt="" width="471"><figcaption><p>Example of instance data setup (NodeRef will turn into hash)</p></figcaption></figure>

## Finishing up

* You should now have the following:
  * A `.yaml`tweak file containing the custom `FastTravelPoints`record
* An Object Spawner group containing:
  * The fast travel terminal entity node, with entity instance data linking it to the marker and the custom record
  * The marker node, with a custom NodeRef assigned

{% hint style="warning" %}
Make sure that the category of the sector containing the marker and terminal is set to `AlwaysLoaded` during export from Object Spawner
{% endhint %}

* Now simply export your group from Object Spawner, and import into WKit using the Object Spawner import `.wscript`

{% hint style="warning" %}
If you make any changes to the FT point, after having already loaded the game with your custom point installed, make sure to use a fresh save (A save without the custom point saved)
{% endhint %}
