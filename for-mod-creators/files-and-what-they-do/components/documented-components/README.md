# Documented Components

{% hint style="info" %}
See the [Comprehensive Component Hierarchy List](../comprehensive-components-list.md) for all possible components used in the game, organized by hierachy. Use for researching and documenting components.

For a json dump of all existing components and their properties, check [DrPresto's github repository.](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/lists/entComponent\_types.json)

For a hands-on guide on how to safely change components in .app files, look [here](../../../modding-guides/npcs/appearances-change-the-looks.md#safely-adding-components).
{% endhint %}

## Equipment/Hair

<details>

<summary>entGarmentSkinnedMeshComponent</summary>



Can be used interchangeably with `entSkinnedMeshComponent`.

* Loads a mesh from a [depotPath](./#depotpath).&#x20;
* Supports [chunkMask](./#chunkmask).
* meshAppearance will select an appearance by name from the mesh's defined [appearances](broken-reference).
* Lets you enable and disable **shadows** with the properties `castShadows` and `castLocalShadows`

This is the good kind of mesh component, the one that will work without trouble, as opposed to [entSkinnedClothComponent](./#entskinnedclothcomponent).

</details>

<details>

<summary>entSkinnedMeshComponent</summary>

See below at [entGarmentSkinnedMeshComponent](../#entgarmentskinnedmeshcomponent)

</details>

<details>

<summary>entSkinnedClothComponent</summary>

Like [ent(Garment)SkinnedMeshComponent](./#entskinnedmeshcomponent), but with a `physicalMesh` and physics. Usually comes together with an [entAnimatedComponent](./#entanimatedcomponent) (they're usually named `collar` for clothes and `dangle` for hair and accessories).

</details>

<details>

<summary>entAnimatedComponent</summary>

Adds physics to garments and hair meshes.

</details>

## Effects

Please see [effect-components.md](effect-components.md "mention") for details

#### entEffectSpawnerComponent

#### entSlotComponent

## NPCs

<details>

<summary>gameDismembermentComponent</summary>

Defines dismemberment rules for NPCs. (TBD: ???)

</details>

## Generic

<details>

<summary>gameinteractionsComponent</summary>

Adds interaction prompt to entity. (Shouldn't work without gameTargetingComponent, but this hasn't been double-checked.)

</details>

<details>

<summary>entColliderComponent</summary>

WIP

</details>

<details>

<summary>gameTargetingComponent</summary>

Allows targeting via CET.&#x20;

</details>

<details>

<summary>gameScanningComponent</summary>

WIP

</details>
