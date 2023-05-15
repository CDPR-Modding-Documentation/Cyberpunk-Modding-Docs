---
description: All the dirty detes on components as we discover them. WIP.
---

# Components

{% hint style="info" %}
In general, your components should have a **globally unique name** so you can target them via [partsOverrides](../../modding-guides/items-equipment/influencing-other-items.md#partsoverrides). Feel free to ignore this, almost everyone else does as well, but it is the reason behind the convoluted names of CDPR's components.
{% endhint %}

## Equipment/Hair

### entGarmentSkinnedMeshComponent

Can be used interchangeably with `entSkinnedMeshComponent`.

* Loads a mesh from a [depotPath](components.md#depotpath).&#x20;
* Supports [chunkMask](components.md#chunkmask).
* meshAppearance will select an appearance by name from the mesh's defined [appearances](../3d-modelling/models-and-meshes.md#chunkmaterials).

{% hint style="info" %}
This is the good kind of mesh component, the one that will work without trouble, as opposed to [entSkinnedClothComponent](components.md#entskinnedclothcomponent).
{% endhint %}

### entSkinnedMeshComponent

\=> [entGarmentSkinnedMeshComponent](components.md#entgarmentskinnedmeshcomponent)

### entSkinnedClothComponent

Like [ent(Garment)SkinnedMeshComponent](components.md#entskinnedmeshcomponent), but with a `physicalMesh` and physics. Usually comes together with an [entAnimatedComponent](components.md#entanimatedcomponent) (they're usually named `collar` for clothes and `dangle` for hair and accessories).

### entAnimatedComponent

Adds physics to garments and hair meshes.

## NPCs

### gameDismembermentComponent

Defines dismemberment rules for NPCs. (TBD: ???)

## Generic

### gameInteractionComponent

Adds interaction prompt to entity. (Shouldn't work without gameTargetingComponent, but this hasn't been double-checked.)

### entColliderComponent

### gameTargetingComponent

Allows targeting via CET.&#x20;

### gameScanningComponent

## Properties

A list of component properties with explanations.

#### chunkMask

Only used for [meshes](../3d-modelling/models-and-meshes.md): Determines which parts of a mesh will be displayed or hidden. Numeric indices correspond with the submeshes by index.

<figure><img src="../../.gitbook/assets/chunkmask.png" alt=""><figcaption></figcaption></figure>

#### depotPath

Relative path to a resource within the game files. Used to load dependencies — meshes, rigs, animations, effects.

