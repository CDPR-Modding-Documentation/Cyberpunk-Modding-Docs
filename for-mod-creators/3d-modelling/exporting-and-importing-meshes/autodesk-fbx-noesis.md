---
description: How to import/export meshes with Noesis
---

# Autodesk/FBX (Noesis)

{% hint style="info" %}
Noesis is an **alternative** to exporting with WolvenKit. There are legitimate use cases for why you would want this. If you don't know them, **you probably don't.**
{% endhint %}

### TL;DR:&#x20;

Noesis is outdated. Go import/export [with Wolvenkit](./).

### Explanation

5000 years ago on the slopes of Mount Doom, mods were created with nothing but pickaxes, home-spun hemp, and hex editing. Older guides will refer to Noesis as **the way to go** — but Wolvenkit has come a long way since then. The import/export is reliable and works, and unless you [run into issues](../troubleshooting-your-mesh-edits.md), you will probably want to [stick to it](./).

Given that you're still reading this, you probably have a reason to use Noesis, so here we go.

{% hint style="warning" %}
To use Noesis, you need the [Noesis Import/Export Plugin](https://github.com/alphazolam/fmt\_CP77mesh?msclkid=384152bfaa5611ecbad0234dbe6a5c45).
{% endhint %}

<table><thead><tr><th width="293">Tool</th><th>Tool version</th></tr></thead><tbody><tr><td><a href="https://www.blender.org/download/">Blender</a></td><td>>= 3.1 stable</td></tr><tr><td><a href="https://richwhitehouse.com/index.php?content=inc_projects.php">Noesis</a><br><a href="https://github.com/alphazolam/fmt_CP77mesh?msclkid=384152bfaa5611ecbad0234dbe6a5c45">Noesis Import/Export Plugin</a></td><td>>= 4.459<br>>= Sep 28, 2021</td></tr></tbody></table>

## Exporting from the Wolvenkit project

1. Navigate the Noesis browser to your file on the disk (you can right-click on the mesh in Wolvenkit and select "`Open in File Explorer`")
2. Right-click it in the Noesis Browser and select "Export"
3. Export with default settings:

<figure><img src="../../../.gitbook/assets/noesis_mesh_export.png" alt=""><figcaption></figcaption></figure>

Done. You can now import the fbx to Blender.

### Blender: Saving for import

Simply export as fbx, Blender's standard settings are fine for Noesis.

## Importing

Noesis is an **alternative** to importing with WolvenKit.

* Find your fbx in the Noesis browser
* Right-click it and select "Export"
* Set the `Main output type` to `.mesh - CyberPunk 2077 mesh [PC]`
* A dialogue asks you for a file to overwrite. Make sure that it has your mesh!

<figure><img src="../../../.gitbook/assets/noesis_mesh_import.png" alt=""><figcaption></figcaption></figure>

## Troubleshooting

### Noesis Split Meshes

<figure><img src="https://media.discordapp.net/attachments/1132368057742934159/1147979214096707664/image.png?width=508&#x26;height=389" alt=""><figcaption></figcaption></figure>

Noesis-split meshes are essentially how Noesis copes with higher vertex counts. It will automatically divide up your submeshes into smaller parts, which is why Noesis will often display there being more meshes than intended.&#x20;



<figure><img src="https://cdn.discordapp.com/attachments/1132368057742934159/1147978089553461320/image.png" alt=""><figcaption></figcaption></figure>

This is caused by the vertex count being too high, and will often result in the applicable submeshes not converting with the rest of the mesh, resulting in those submeshes being non-existent in the .mesh file. The solution is to simply reduce the number of vertices in the given submesh with the goal being to get the count lower than 65,000 vertices on the given submesh.

The best way to tell how many vertices a given mesh has is to open the "Viewport Overlays" drop-down menu and select "Statistics". This will allow for data on the meshes within the .blend. To narrow this down to a specific submesh, open edit mode with that submesh as active and "select all" (CTRL + A) and you will see the vertex count for that submesh.

<figure><img src="https://cdn.discordapp.com/attachments/1132368057742934159/1147982161371217930/image.png" alt=""><figcaption></figcaption></figure>

Once you know how many vertices you have, use either "Decimate Geometry" or "Merge By Distance" to simplify the topography of the mesh, or to merge two or more vertices that are a given distance apart from one another into one.

Once this has been done, export from blender and try the conversion again.&#x20;

If this doesn't quite do the trick, convert the fbx to fbx (just leave the output type set to fbx) and enter "-fbxmeshmerge" in the advanced options text box before clicking export. (It is recommended that you set an output location when doing this so as to avoid accidentally overwriting the original mesh)



### Duplicate meshes detected



<figure><img src="https://cdn.discordapp.com/attachments/1132368057742934159/1147985780564836502/image.png" alt=""><figcaption></figcaption></figure>

This often accompanies the "Noesis-split meshes" warning. A common cause for this is the use of Blender's "duplication" feature. To solve it, follow the steps above for "Noesis-split meshes" then import the resulting mesh back in to blender, and you should see that you have several blank "Objects" that came in along with your mesh. Delete those, export back out of blender, convert the fbx to fbx, then import the result into blender and repeat if needed.&#x20;

Following the deletion of these Objects, you may notice deformations in the submesh/submeshes, if this is the case, replace the armature (and update the armature modifier) with a new one and export again.



<figure><img src="https://cdn.discordapp.com/attachments/1132368057742934159/1147987527563739186/image.png" alt=""><figcaption></figcaption></figure>



## Differences between fbx and glb

There are a few differences between Noesis and WolvenKit when it comes to exporting your meshes:

<figure><img src="../../../.gitbook/assets/import_noesis_glb_armature_differences.png" alt=""><figcaption><p>Note the differently named submeshes</p></figcaption></figure>

|               | Autodesk (fbx) | glTF Binary (glb)   |
| ------------- | -------------- | ------------------- |
| Armature      | Rotation W: 0  | Rotation W: 1       |
|               | Rotation Z: -1 | Rotation Z: 0       |
| Submesh names | submesh0       | submesh\_00\_LOD\_1 |

You can easily convert between the two formats by hand — or use [this script](https://github.com/manavortex/code\_snippets/blob/master/py/blender/convert\_gltf\_fbx.py): Switch to Blender's Scripting perspective, create a new file, paste the contents in, and run it.
