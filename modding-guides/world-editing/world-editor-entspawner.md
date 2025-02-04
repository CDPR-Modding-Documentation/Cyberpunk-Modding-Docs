---
description: Cyberpunk 2077's world editor
---

# World Editor: entSpawner

## Summary

Created: Feb 04 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
Last documented edit: Feb 04 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page tells you about Cyberpunk 2077 world editor mod.

{% hint style="danger" %}
As entSpawner is currently (Feb 2025) under active development, information on this page may be outdated. In this case, you're welcome to [become an editor](https://app.gitbook.com/invite/-MP5ijqI11FeeX7c8-N8/H70HZBOeUulIpkQnBLK7) and update it!
{% endhint %}

### Wait, that's not what I want!

For more information on [.](./ "mention"), check the wiki's page tree or use the "next" and "previous" buttons at the end of the page.

### Witcher3 has an official tool, why doesn't Cyberpunk?

Because the ways of the CDPR are inscrutable. Keep in mind that the modding tools dropped 10 years after the initial release of Witcher 3.&#x20;

Although we don't have access to privileged information, it is the general consensus in the modding community that we will see official modding tools for Cyberpunk2077 by 2030. It is a running joke that we will not need them by then.

## What is entSpawner?

EntSpawner (developed by [NexusGuy999 aka KeanuWheeze](https://next.nexusmods.com/profile/NexusGuy999/mods?gameId=3333)) is the continuation of the discontinued mod [ObjectSpawner](https://www.nexusmods.com/cyberpunk2077/mods/2833). &#x20;

### Where can I get it?

As of February 2025, it is still in open beta and thus not published on Nexus. You can download the latest release [on github](https://github.com/justarandomguyintheinternet/CP77_entSpawner/releases).

{% hint style="info" %}
For help or further information, please check the `#`[`world-editing` channel](https://discord.com/channels/717692382849663036/814064062815141909) on the REDmodding discord.
{% endhint %}

## Controls

### Editor mode:

* Can be activated using the "3-D" icon in the toolbar
  * Snaps the main window to the right, width is changeable by dragging the left edge
  * Enables multiple things:
* Viewport camera controls:
  * All the controls are available by hovering the `I`-Icon in the toolbar, here the most basic ones
    * `MMB (Mouse wheel button) + Drag`: Rotate camera around pivot
    * `MMB + Drag + Shift`: Move camera
    * `MMB + Ctrl`: Up / Down -> Zooms in / out
    * `Tab`: Center camera on selected
    * `LMB`: Selectes the item under the mouse cursor
    * `RMB`: Opens the context menu (Same as before, but now also avaiable while hovering the viewport)

### Viewport editing:

* Objects can be moved by dragging the axis arrows
* Additionally hotkeys are available:
  * `G/R/S + X/Y/Z`: Enables movement/rotation/scaling along the specified axis
  * `LMB / RMB`: Confirm / cancle edit
* Holding `Shift` while pressing the axis key will lock the editing on the specified axis. E.g. `G + Shift + Z` will enable movement locked to the horizontal plane
* Numeric input: After enabling editing (Rotate / Scale), input numeric values (Supports decimal and negative) to rotate / scale by that amount (Scale is applied as multiplier, rotation is relative)
  * E.g. `R + Z + 90 + LMB / Enter` will rotate the object by 90 on the `Z` axis and confirm the edit

### `Shift-A` spawn menu:

* Can be used while edit mode is active
  * Will spawn the selected object under the mouse cursor, unless specified otherwise
  * Additionally, it is possible to drag and drop an item from the regular "Spawn new" tab into the scene, to spawn them in a specific place

### `Shift-D` depth select popup:

* For the rare case that clicking on an object selects the wrong object, this popup can be used instead
  * Available while in edit mode and hovering the viewport
  * Gives a list of all the objects under the cursor, sorted by distance
