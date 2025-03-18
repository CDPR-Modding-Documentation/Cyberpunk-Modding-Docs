---
description: >-
  Page that explains how to use 3-D Editor mode, and all its controls and
  features
---

# 3-D Editor Mode

## What is the 3-D Editor mode

* It gives viewport style editing, similar to e.g. blender or other 3-D Editors
* While the mode is active:
  * Snaps main window to the right, width is changeable by dragging the left edge
  * Click objects to select them, and other selection methods
  * You can rotate, move and zoom the camera
  * Move objects by dragging their arrows
  * Multitude of hotkeys (Once again inspired by blender)

{% hint style="success" %}
A list of all controls can also be found by hovering the information icon "ℹ" which can be found to the far right of the editor mode toggle
{% endhint %}

{% hint style="info" %}
All the hotkeys from the main tree view are still available, such as right click to open context menu, copy, paste, hide, drop to floor, delete, undo / redo, etc...
{% endhint %}

## Activating Editor Mode

* To activate the editor mode, click the "3-D" button which is part of the toolbar of the "Spawned" tab

## Camera Controls

* The camera position of editor mode is independent of the player's position
* The basic camera controls are as follows:
  * **Rotate camera**: Drag mouse while holding middle mouse button (`MMB`)
  * **Move camera**: Hold shift, then drag the mouse while holding `MMB`
  * **Zoom**: Hold `CTRL`, then drag mouse up/down while holding `MMB`
  * **Center camera on selection**: Press `Tab`

<figure><img src="../../../.gitbook/assets/OSEditModeCameraControls" alt="" width="563"><figcaption></figcaption></figure>

## Selection Controls

* There are multiple ways of selecting things:
  * Select hovered: Press left mouse button (`LMB`)
  * Box select: Hold `CTRL`, then drag a box using `LMB`

<figure><img src="../../../.gitbook/assets/OSSelectMenu" alt="" width="375"><figcaption><p>Click to select, and box select</p></figcaption></figure>

### `Shift-D` Menu

* In cases where the selected object is wrong, you can use the **Depth Select** menu instead
  * Hover over the object you wish to select
  * Hit `Shift + D`
  * This brings up a list of all objects underneath your cursor, sorted by distance

<figure><img src="../../../.gitbook/assets/OSDepthMenu" alt="" width="375"><figcaption><p>Depth select menu, for edge-cases</p></figcaption></figure>

## Changing object transforms

* Objects can be moved by dragging the axis arrows
* Additionally, hotkeys are available (Basically the same as in blender):
  * `G/R/S + X/Y/Z`: Enables movement/rotation/scaling along the specified axis (For scaling you can also leave out the axis, to scale uniformly)
  * `LMB / RMB`: Confirm / cancel edit
* Holding `Shift` while pressing the axis key will lock the editing on the specified axis. E.g. `G,  Shift + Z` will enable movement, locked to the horizontal plane
* Numeric input: After enabling editing (Rotate / Scale), input numeric values (Supports decimal and negative) to rotate / scale by that amount (Scale is applied as multiplier, rotation is relative)
  * E.g. `R + Z + 90 + LMB / Enter` will rotate the object by 90 on the `Z` axis and confirm the edit

<figure><img src="../../../.gitbook/assets/OSMoveControls" alt="" width="375"><figcaption><p>Example of the basic transforms</p></figcaption></figure>

## Spawning things

* While in edit mode, you can press `CTRL-R` to repeat the last spawn under your cursor
  * This is very useful for e.g. quickly building an area using outline markers

### `Shift-A` Menu

* Besides the regular "Spawn New" tab methods such as dragging an item into the scene, you can also use the `Shift-A` menu
* This menu is mostly useful to quickly spawn something where you only have a few options, e.g. colliders, light or markers
  * That way, you don't have to first select the category / variant in the "Spawn New" tab
