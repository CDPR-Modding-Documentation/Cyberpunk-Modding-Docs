---
description: Things I wish I had known before I jumped into the Blender
---

# Blender: Getting Started

## Interface

1. **Use keyboard shortcuts** - they will speed things up by at least 70%. Put a post-it on your monitor and only remove it when you know them by heart.
2. The main action happens in your `Viewport`.&#x20;
3. You only use `Object Mode` when you **select** what you're working on. Everything else happens in Edit or Pose Mode.
4. You can switch between Edit Mode and Object Mode with `Tab` (turquoise dropdown on screenshot 1)
5. You can use the Perspective Selector (pink) to swap around custom-defined workspaces.
6. Under `File -> Defaults -> Save Startup File`, you can save the current `.blend` file as your default layout.&#x20;
7. You can switch the current selection tool with a long click on the tool's surface (shortcut to cycle: `W`)

<figure><img src="../../.gitbook/assets/blender_UI_guide_1.png" alt=""><figcaption></figcaption></figure>

* You can (de)select multiple things by ctrl-clicking on them.&#x20;
* The most recently selected thing is called Active (this shows up in many context menus)
* The **Select Circle** does not set an active selection.
* You can toggle **X-Ray mode** (Shortcut: `Alt+Z`) by clicking the purple icon in the screenshot above

### Keyboard Shortcuts (global)

The shortcuts below are shared between Object and Edit mode:

<table><thead><tr><th width="192"></th><th></th></tr></thead><tbody><tr><td><code>H</code></td><td>Hide selected elements</td></tr><tr><td><code>Shift+H</code></td><td>Hide everything <strong>except for</strong> the selected elements</td></tr><tr><td><code>Alt+H</code></td><td>Un-hide everything</td></tr><tr><td><code>X</code></td><td>Delete selection</td></tr><tr><td><code>Ctrl+I</code></td><td>Invert selection</td></tr><tr><td><code>Shift+D</code>, <code>Click</code></td><td>Duplicate selection</td></tr></tbody></table>

## The Object Mode

Object mode is where you select stuff that you want to edit.

{% hint style="info" %}
If you move anything in Object Mode, you need to Apply Transforms (Object -> Apply -> All Transforms), or Cyberpunk will ignore your changes.
{% endhint %}

## The Edit Mode

Edit mode is where you actually **edit** the mesh.&#x20;

{% hint style="info" %}
You can only edit things that are selected in Object Mode.
{% endhint %}

<figure><img src="../../.gitbook/assets/blender_UI_guide_2.png" alt=""><figcaption></figcaption></figure>

### Seams and Sharps

In Edge Selection Mode (Hotkey: `2`), you can (un)mark **edges** as **seams** or **sharps** via context menu:

<figure><img src="../../.gitbook/assets/blender_ui_guide_3_seams_and_sharps.png" alt=""><figcaption><p>Seams are orange, Sharps are blue</p></figcaption></figure>

A **seam** (orange line in the viewport) is where the UV map will be split. A [full explanation on UV mapping](../materials/uv-mapping-texturing-a-3d-object.md) blows the scope of this guide, but you can read on if you're curious.\
**Unless you're UV unwrapping**, those won't do anything, and you can use them as selection delimiters to your heart's content!

A sharp (blue line in the viewport) **will cause a sharp crease/fold** in the material. This translates to Cyberpunk, so it's neat to highlight your edges!

### Selection tricks

* Select linked (`Ctrl+L`): Selects everything that is on the same piece of 3d geometry as your current selection. The selection will be expanded up to your chosen delimiter (for example, seam or sharp!)
* Select shortest path: When you're in Edge Selection Mode (Hotkey: `2`) and have at least one edge selected, you can `Ctrl+Click` on **any other edge** to select the shortest path between them. This makes it super easy to select edges — just make sure to double-check, because the shortest path is not necessarily the one you want.

### Proportional Editing

* You can see if PE is active by checking the pink button on the screenshot above. Toggle it on and off by clicking (Hotkey: `O`)
* When it's active, **moving**, **scaling** or **rotating** will have an effect on anything **close to your selection**. This makes refitting super easy! No more jagged edges!
* Change the size of the surrounding effect by scrolling your mouse wheel up or down

