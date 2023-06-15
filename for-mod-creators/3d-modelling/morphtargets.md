---
description: Overview of working with morphtargets
---

# Morphtargets

{% hint style="info" %}
**COMPATIBILITY WARNING**\
\
Full `.morphtarget` editing is enabled in Wolvenkit **8.9.1-nightly** development builds. This content uses these new capabilities, and does not apply to previous workarounds.
{% endhint %}

## Type Extension

`.morphtarget`

## Description

Morphtargets are a special kind of a mesh, or more accurately a `.mesh` is a more limited version of a mesh without the ability to define targets by itself (with a few exceptions.) A full model can consist of multiple `.mesh`es and `.morphtarget`s.

Morphtargets (or more generally just 'targets') are used for additional deformation beyond what rigging can do, as well as for creating alternative and/or additional shapes for a mesh. Blender calls targets _shapekeys_.

To be exact, cp2077 has _three_ kinds of targets:

1. `.morphtarget` is a separate type, and has an associated `.mesh` (`baseMesh`) because redengine splits the full data needed for the model into these two separate types.  **The `.morphtarget` always defines the shape, overriding the `.mesh`.** The `.mesh` stores the other information as usual. `.morphtarget`s are used for, for example, body and head customization.
2. GarmentSupport is a property of a `.mesh`. It is also a target and this is a more common way to define targets than the separate  type. GarmentSupports are used, for example, to slightly shrink a t-shirt so that it doesn't clip when you put a jacket over it.
3. Vehicle damage submeshes. This is a static end state of a target, inserted directly as an extra submesh rather than a target.

## How do Targets Work?

A simple and perhaps familiar`.morphtarget` example is chest size for FemV. There are three states: default, small, big. The default corresponds to the base mesh shape, and is the Basis shapekey in Blender.

The two other states are defined as targets. Each target defines a 'delta', a set of offsets for base mesh vertices from their positions in the default shape - including any other active deform, like a pose in photomode. If you fully enable one of these targets, you effectively have a mesh with the chest area reduced or enlarged.

Targets can be also enabled partially, with the states between off and fully on (the 'end state') interpolated by the engine or 3D software. This can be used for animations, but in the cp2077 context generally is not.

Targets can be blended together. If two targets are enabled fully or partially, their combined state is blended into one shape. In cp2077 some targets are mutually exclusive (like the chest size), and others are inclusive (your V's face is a combination of the selected eyes, nose, mouth, jaw, and ear target states all blended together.)

Exclusive/inclusive is not a limitation of the targets themselves, but of how cp2077 activates them..

### Target Activation

The game engine activates targets _by name_ (and region) in specific conditions.

Character customization targets are activated when the character is loaded (and dynamically in the CC view.)

GarmentSupports are activated when equipping a garment that goes "on top of" the garment with GarmentSupport.&#x20;

## Morphtargets, What Are They Even Good For?

So, some uses are probably already obvious. But targets enable quite a bit of exciting modding:

* Modding anything with a `.morphtarget` without breaking the targets like before
* You can for example mod the CC tattoos, or piercings...
* ...Or any aspect of character face customization. Vampire catboy Legolas here we come!
* TBA

{% hint style="info" %}
The main limitation currently is that we do not have a way to add activations, at least generally. You need to hook into a target name that the engine already uses.
{% endhint %}

## Working with Morphtargets

{% hint style="info" %}
_**`COMPATIBILITY WARNING`**_

\
`.morphtarget`s exported prior to the Wkit 8.9.1-nightly development versions contain incorrect data. It's possible that you'll encounter errors or strangeness with them on import or in-game.\
\
**For best results, you should start from a vanilla`.morphtarget` exported with Wkit 8.9.1-nightly or later.**
{% endhint %}

{% hint style="info" %}
**This Section is Incomplete**
{% endhint %}

One thing deserves highlighting right up front: whenever you are doing _3D work_ on a model that has a  `.morphtarget`, **you work with the `.morphtarget`, not the`.mesh`**. The `.mesh` is only used for things the target doesn't include, like appearance definitions.\
\
Fundamentally the 3D workflow goes like this in Blender (use the blender cp2077 plugin import/export):

1. WkitExport the `.morphtarget`
2. BlenderImport it
3. Make your edits to base shape and/or shapekeys (if you need to - the base shape edits are automatically propagated to shapekeys.) You can edit just like you would a `.mesh`, because it _is_ a mesh.
4. BlenderExport to a file named after the `.mesh`
5. BlenderExport to a file named after the  `.morphtarget`
6. WkitImport the `.mesh.gltf` first. Wkit will treat it just like it would a 'real' `.mesh`
7. WkitImport the `.morphtarget.gltf`
8. ...And that's it. You can pack the mod.

### Tips for Morphtargets

* Make sure to test your targets work blended with other targets, not just by themselves
* You can create targets from scratch, all that matters is that the name matches the original. This is handy for zeroing out targets you don't need or want, for example.
* _I prefer to use either of the `.gltf` formats over `.glb`. They're all GLTF but `.gltf` is slightly more widely supported, plus you can open it up in a json editor. -- Auska_&#x20;



## Working with GarmentSupports

See the [GarmentSupport](garment-support-how-does-it-work.md) section for more info.

## Working with Vehicle Damage Deforms

TBA
