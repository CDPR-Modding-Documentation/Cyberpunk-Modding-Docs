---
description: Where rigs and animations are stored
---

# Cheat sheet: Rigs and animations

## Summary

**Last documented update**: January 6 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page lists file paths and properties for various rigs and animations. Use the Table of Contents or your browser's search (Hotkey: `Ctrl+F`) to quickly find what you're looking for.&#x20;

Any links will lead you to additional context.

### Wait, this isn't what I'm looking for!

If you want to make animations, check [animations](../../modding-guides/animations/animations/ "mention") and the guides under the page.

***

## .anims

For general documentation on how animations work, see [animations](../../modding-guides/animations/ "mention")

| Anims description                 | Path in game files                         |
| --------------------------------- | ------------------------------------------ |
| Player female inventory animation | base\animations\ui\female\ui\_female.anims |
| Player male inventory animation   | base\animations\ui\male\ui\_male.anims     |

## .rigs

### First person

First person animations are used solely on the player character (V). There's one rig per body gender:

<table><thead><tr><th width="226">name of rig</th><th>Path in game files</th></tr></thead><tbody><tr><td>player_male</td><td>base\characters\entities\player\deformations_rigs_ma\player_man_fpp_deformations.rig<br>(pulled from player_ma_fpp.ent)</td></tr><tr><td>player_female</td><td>base\characters\entities\player\deformations_rigs_wa\player_woman_base_deformations.rig<br>(pulled from player_wa_fpp.ent)</td></tr></tbody></table>

### Third person

{% hint style="info" %}
While most rigs are called `man_xxx`, they're also used by NPCs of the female body gender.
{% endhint %}

<table><thead><tr><th width="230.33333333333331">Name of rig</th><th>Used by</th><th>Path in game files</th></tr></thead><tbody><tr><td>woman_base</td><td>female body gender, default body shape</td><td>base\characters\base_entities\woman_base\woman_base.rig</td></tr><tr><td>man_base</td><td>male body gender, default body shape</td><td>base\characters\base_entities\man_base\man_base.rig</td></tr><tr><td>man_child</td><td>children of any body gender </td><td>base\characters\base_entities\man_child\man_child.rig</td></tr><tr><td><em>woman_child</em></td><td><em>-</em></td><td><em>base\characters\base_entities\woman_child\woman_child.rig</em></td></tr><tr><td>man_big</td><td>any body gender: big folks, e.g. Jackie, River, Rhino…</td><td>base\characters\base_entities\man_big\man_big.rig</td></tr><tr><td><em>woman_big</em></td><td><em>-</em></td><td><em>base\characters\base_entities\woman_big\woman_big.rig</em></td></tr><tr><td>man_fat</td><td>any body gender: fat folks, e.g. Dexter</td><td>base\characters\base_entities\man_fat\man_fat.rig</td></tr><tr><td><em>woman_fat</em></td><td><em>-</em></td><td><em>base\characters\base_entities\woman_fat\woman_fat.rig</em></td></tr><tr><td>man_massive</td><td>Smasher</td><td>base\characters\base_entities\man_massive\man_massive.rig</td></tr></tbody></table>

### Face

The facial animations are linked in the .ent files under `base\characters\base_entities\xxx\xxx.ent`. They are otherwise referenced from an entAnimationSetupExtensionComponent inside the .app file.

## Deforms

Deforms can be found under `base\characters\base_entities\*\deformations_rigs`.
