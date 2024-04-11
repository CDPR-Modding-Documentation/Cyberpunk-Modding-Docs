# Documented Components

{% hint style="info" %}
See the [Comprehensive Component Hierarchy List](../comprehensive-components-list.md) for all possible components used in the game, organized by hierachy. Use for researching and documenting components.

For a json dump of all existing components and their properties, check [DrPresto's github repository.](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/lists/entComponent\_types.json)

For a hands-on guide on how to safely change components in .app files, look [here](../../../modding-guides/npcs/appearances-change-the-looks.md#safely-adding-components).
{% endhint %}

## Mesh components: Equipment/Hair

{% hint style="warning" %}
Your favourite kind of mesh component is the [#entgarmentskinnedmeshcomponent](./#entgarmentskinnedmeshcomponent "mention"), as it does not have any physics properties that can crash the game.&#x20;

The [#entskinnedclothcomponent](./#entskinnedclothcomponent "mention")'s physics properties can be responsible for crashes if you edit the linked mesh.
{% endhint %}

### Shared properties of mesh components



| [depotPath](./#depotpath)              | Loads a [.mesh](../../3d-objects-.mesh-files/)                                                                                                |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| [chunkMask](./#chunkmask)              | Defines visibility of individual submeshes                                                                                                    |
| meshAppearance                         | Selects an entry from the mesh's [appearances](../../3d-objects-.mesh-files/#step-1-appearances) array                                        |
| <p>castShadows<br>castLocalShadows</p> | Enables/disables [real-time shadows](../../3d-objects-.mesh-files/meshes-shadows-and-shadow-meshes.md#generated-shadows-component-properties) |
| forceLODLevel                          | Force [level-of-detail-lod.md](../../level-of-detail-lod.md "mention")                                                                        |

### Documented mesh component types

<details>

<summary>entGarmentSkinnedMeshComponent</summary>

Can be used interchangeably with `entSkinnedMeshComponent`.

This is the good kind of mesh component, the one that will work without trouble, as opposed to [entSkinnedClothComponent](./#entskinnedclothcomponent).

</details>

<details>

<summary>entSkinnedMeshComponent</summary>

See [entGarmentSkinnedMeshComponent](../#entgarmentskinnedmeshcomponent)

</details>

<details>

<summary>entSkinnedClothComponent</summary>

Like [ent(Garment)SkinnedMeshComponent](./#entskinnedmeshcomponent), but with a `physicalMesh` and physics.&#x20;

Usually comes together with an [entAnimatedComponent](./#entanimatedcomponent) (they're usually named `collar` for clothes and `dangle` for hair and accessories).

The physics will cause crashes if you alter the mesh file (yes, even if it's just a refit). As an alternative, you can use a regular mesh component together with [#entanimatedcomponent](./#entanimatedcomponent "mention").

</details>

<details>

<summary>entAnimatedComponent</summary>

Adds physics to garments and hair meshes. This is the "safe" way of doing it, opposed to [#entskinnedclothcomponent](./#entskinnedclothcomponent "mention"), which can cause crashes.

</details>

<details>

<summary>entMeshComponent</summary>

Used for components on low levels of details such as [proxies](../../level-of-detail-lod.md#proxy-meshes) and [shadow meshes](../../3d-objects-.mesh-files/meshes-shadows-and-shadow-meshes.md).

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

