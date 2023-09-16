# Cheat sheet: Rigs and animations

## .anims

There is nothing here yet. For general documentation on how animations work, see [animations.md](../animations.md "mention")

## .rigs

### First person

First person animations are used solely on the player character (V). There's one rig per body gender:

<table><thead><tr><th width="226">name of rig</th><th>Path in game files</th></tr></thead><tbody><tr><td>player_male</td><td></td></tr><tr><td>player_female</td><td></td></tr></tbody></table>

### Third person

{% hint style="info" %}
While most rigs are called `man_xxx`, they're also used by NPCs of the female body gender.
{% endhint %}

<table><thead><tr><th width="230.33333333333331">Name of rig</th><th>Used by</th><th>Path in game files</th></tr></thead><tbody><tr><td>woman_base</td><td>female body gender, default body shape</td><td>base\characters\base_entities\woman_base\woman_base.rig</td></tr><tr><td>man_base</td><td>male body gender, default body shape</td><td>base\characters\base_entities\man_base\man_base.rig</td></tr><tr><td>man_child</td><td>children of any body gender </td><td>base\characters\base_entities\man_child\man_child.rig</td></tr><tr><td><em>woman_child</em></td><td><em>-</em></td><td><em>base\characters\base_entities\woman_child\woman_child.rig</em></td></tr><tr><td>man_big</td><td>any body gender: big folks, e.g. Jackie, River, Rhino…</td><td>base\characters\base_entities\man_big\man_big.rig</td></tr><tr><td><em>woman_big</em></td><td><em>-</em></td><td><em>base\characters\base_entities\woman_big\woman_big.rig</em></td></tr><tr><td>man_fat</td><td>any body gender: fat folks, e.g. Dexter</td><td>base\characters\base_entities\man_fat\man_fat.rig</td></tr><tr><td><em>woman_fat</em></td><td><em>-</em></td><td><em>base\characters\base_entities\woman_fat\woman_fat.rig</em></td></tr><tr><td>man_massive</td><td>Smasher</td><td>base\characters\base_entities\man_massive\man_massive.rig</td></tr></tbody></table>

### Face

The facial animations are linked in the .ent files under `base\characters\base_entities\xxx\xxx.ent`. They are otherwise referenced from an entAnimationSetupExtensionComponent inside the .app file.

## Deforms

Deforms can be found under `base\characters\base_entities\*\deformations_rigs`.
