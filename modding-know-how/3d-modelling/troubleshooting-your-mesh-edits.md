# Troubleshooting your mesh edits

## Importing

### Bone: neutral\_bone not present in export Rig(s)/Import Mesh

The neutral bone is created by the glb export plugin when there are vertex groups without a parent bone. WolvenKit will not let you import if there is a mismatch.

{% hint style="info" %}
Your armature in Blender needs to have a bone for every vertex group in the submesh. You then need to import over a .mesh file which also has all these bones.
{% endhint %}

#### Option 1: Fuck those bones

You can [import the mesh with Noesis](exporting-and-importing-meshes.md#noesis-.fbx-2), which will not do any of these checks. For that, you need to import/export via .fbx.

{% hint style="warning" %}
Since noesis expects differently-named submeshes under the root armature, you'll want to export the mesh via noesis, join your changed meshes on those under Noesis\_Root, and import it again.\
**Caution:** You'll have to rotate your armature in this case.
{% endhint %}

{% hint style="danger" %}
While this will get your mesh into the game, the missing bones mean that parts of it won't move the way you expect it!
{% endhint %}

#### Option 2: The Netrunner suit

The armature from the following mesh has a lot of bones and will often resolve most of your issues:

```
t0_005_pwa_body__t_bug.mesh
t0_005_pma_body__t_bug.mesh
```

Try using the Netrunner body as a base for import. To have more than one submesh, you can simply duplicate the existing one and adjust the naming, e.g. `submesh_01_LOD_1`, `submesh_02_LOD_1`

#### Option 3: Transferring bones

It's time to play 3d puzzle and assemble bones from multiple sources. Unfortunately, there is no simple solution for this yet. You need to&#x20;

* find the bones that your armature is missing in other meshes
* [transfer them ](https://xbaebsae.jimdofree.com/tutorials/cp2077-transferring-and-expanding-skeletons-in-meshes/)into your import target mesh
* export all the extra meshes into Blender&#x20;
* [merge their rigs](https://github.com/Simarilius-uk/CP2077\_BlenderScripts/blob/main/Merge\_rigs.py), which you should do with the linked Python script
* and finally reimport everything back into Cyberpunk.

### Everything else

WolvenKit will not import a mesh that has any kind of issues. Those include, but are not limited to:&#x20;

* non-flat faces
* zero faces/edges
* loose vertices/edges

**There is no guarantee that any of the steps below will actually solve your problem.**&#x20;

#### **Edit Mode**

In Edit Mode, you can find a few commands in the Mesh -> Clean Up menu:

* Delete Loose
* Split Non-Planar Faces
* Split Concave Faces
* Merge By Distance\


{% hint style="warning" %}
&#x20;If you select your whole mesh, **Merge By Distance** will merge the individual parts, obliterating the seams. To avoid that, make sure to do them one after another:\
\- Select a vertex/edge/face in Edit Mode\
\- hold down Ctrl Num+ to select everything connected\
\- use Merge By Distance before proceeding to the next part of your mesh
{% endhint %}

#### It's still broken

Your last option is the [3d print tool](https://docs.blender.org/manual/en/latest/addons/mesh/3d\_print\_toolbox.html) to (hopefully) find out what is wrong with your mesh.&#x20;

Fortunately, the tool is free, easy-to-use and already included in your Blender.

{% hint style="info" %}
If you don't have a 3d print entry in the tools of your 3d viewport, you might need to enable the plugin in Blender's settings first.
{% endhint %}

<figure><img src="../../.gitbook/assets/blender 3d print tool.png" alt=""><figcaption><p>Use the 3d print tool in edit mode to directly fix your issues</p></figcaption></figure>

* Zero Edges: Those are bad, fix them (click on them, then press X and just delete them)
* Non-Flat Faces: Those are even worse, as they can make the game crash. You need to split them up until they are flat, or investigate the surrounding edges/vertices to see what's going wrong here.
* Zero Faces: Only fix if you have <100 of them — the tool doesn't always identify them correctly (the mesh analyzed above was `h0_000_pwa_c__basehead`, which is absolutely fine).&#x20;



## In-Game

### My mesh is completely warped

If you have [added the item](../../modding-guides/items/adding-new-items.md) via [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl) or [swapped out an in-game item](../../modding-guides/items/editing-existing-items/replace-a-player-item-with-an-npc-item.md) with something that belongs in a different slot (e.g. a jacket on the head slot), you might have to fix the corresponding entity file.

### My mesh is string cheese/exploding vertices

#### GarmentSupports

{% hint style="info" %}
To check if it's this, equip **only** the edited item. If it breaks as soon as you put on another clothing item with [garment supports](garment-support-how-does-it-work.md#the-algorithm), then the solution below applies.
{% endhint %}

Delete GarmentSupport from the mesh:

<figure><img src="../../.gitbook/assets/mesh_editing_parameters.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/garment_support_broken.png" alt=""><figcaption></figcaption></figure>

