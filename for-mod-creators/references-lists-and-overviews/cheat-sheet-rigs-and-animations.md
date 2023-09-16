# Cheat sheet: Rigs and animations

## .anims

### Photo Mode

You can find all photo mode animation sets in the following folder:

```
base\animations\ui\photomode\
```

You can find the following files there:



<table><thead><tr><th width="133">Entity</th><th>Action</th><th>Idle</th><th>Face</th></tr></thead><tbody><tr><td>f!V</td><td>photomode__female__action.anims</td><td>photomode__female__idle.anims</td><td>photomode_female_facial.anims</td></tr><tr><td>m!V</td><td>photomode__male__action.anims</td><td>photomode__male__idle.anims</td><td>photomode_male_facial.anims</td></tr><tr><td>Johnny</td><td>-</td><td>photomode__johnny__idle.anims</td><td>photomode_johnny_facial.anims</td></tr></tbody></table>



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
