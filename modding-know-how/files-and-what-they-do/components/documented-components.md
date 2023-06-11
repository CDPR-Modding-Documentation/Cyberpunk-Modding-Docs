# Documented Components

## Equipment/Hair

<details>

<summary>entGarmentSkinnedMeshComponent</summary>



Can be used interchangeably with `entSkinnedMeshComponent`.

* Loads a mesh from a [depotPath](documented-components.md#depotpath).&#x20;
* Supports [chunkMask](documented-components.md#chunkmask).
* meshAppearance will select an appearance by name from the mesh's defined [appearances](broken-reference).
* Lets you enable and disable **shadows** with the properties `castShadows` and `castLocalShadows`

This is the good kind of mesh component, the one that will work without trouble, as opposed to [entSkinnedClothComponent](documented-components.md#entskinnedclothcomponent).

</details>

<details>

<summary>entSkinnedMeshComponent</summary>

See below at [entGarmentSkinnedMeshComponent](./#entgarmentskinnedmeshcomponent)

</details>

<details>

<summary>entSkinnedClothComponent</summary>

Like [ent(Garment)SkinnedMeshComponent](documented-components.md#entskinnedmeshcomponent), but with a `physicalMesh` and physics. Usually comes together with an [entAnimatedComponent](documented-components.md#entanimatedcomponent) (they're usually named `collar` for clothes and `dangle` for hair and accessories).

</details>

<details>

<summary>entAnimatedComponent</summary>

Adds physics to garments and hair meshes.

</details>

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

