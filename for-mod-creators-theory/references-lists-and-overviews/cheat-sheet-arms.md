---
description: Arms are why we can't have nice things.
---

# Cheat Sheet: Arms

## Summary

This page lists the different player arms, their component names, and the paths to their files.

### Wait, this is not what I want!

To make your clothes react to different arms, check [archivexl-suffixes-and-substitutions.md](../../for-mod-creators/core-mods-explained/archivexl/archivexl-suffixes-and-substitutions.md "mention") -> [#arm-states](../../for-mod-creators/core-mods-explained/archivexl/archivexl-suffixes-and-substitutions.md#arm-states "mention")



The player base body does not come with arms attached — this made it easier for the developers to switch out the different kinds of cyber arms. It makes everything harder for you.

## Default Arms

You can look up the component names and their properties in the .ent files per body gender in these folders (the file names will start with `a0_`).

### Female

{% hint style="info" %}
Female arms are using different meshes for the first person perspective. You will find this is a common theme.
{% endhint %}

| Type         | Folder or .ent files                                                                                                                                         | Component names                                                                   |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------- |
| First Person | `base\characters\common\player_base_bodies\player_female_average\fpp`                                                                                        | <pre><code>left_arm    
right_arm  
</code></pre>                                 |
| Third Person | <p><code>base\characters\common\player_base_bodies\player_female_average\arms_hq</code><br><br><code>arms_full</code> is only used by character creator!</p> | <pre><code>a0_001_pwa_base_hq__full  
a0_001_pwa_base_hq__full8640 
</code></pre> |

{% hint style="info" %}
An in app example how to include Component Names and hiding them via chunkmask (untick the submesh numbers to hide the mesh).
{% endhint %}

<figure><img src="../../.gitbook/assets/Example of an app - arm component - chunkmasking.png" alt=""><figcaption></figcaption></figure>

### Male

| Folder or .ent files                                                                                                                                         | Component names                                                                        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------- |
| <p><code>base\characters\common\player_base_bodies\player_man_average\arms_hq</code></p><p><br><code>arms_full</code> is only used by character creator!</p> | <pre><code>a0_000_ma_base__full_ag_hq1491
a0_000_ma_base__full_ag_hq6168
</code></pre> |

## Cyber Arms

{% hint style="info" %}
Cyber arms are complex, with active and inactive states, and in the case of the female body, separate entities and meshes for the inactive state in First and Third Person Perspectives.&#x20;

They also have separate Rigs and Animations, which are not included here to avoid complete information overload.

To add insult to injury, if you dig into the actual meshes in use, you will find some cases of `wa` meshes being used by `ma` components and vice versa. But there's a [mod](https://www.nexusmods.com/cyberpunk2077/mods/4393) for that.
{% endhint %}

## Monowire Arms

### Female

Note that the same component name is used for all arm states, even when declared in different .ent files.

<table><thead><tr><th width="155.33333333333331">Type</th><th>Folder or .ent files</th><th>Component names</th></tr></thead><tbody><tr><td>Active</td><td><code>base\characters\cyberware\player\a0_002__monowire_whip\entities\a0_002_wa__monowire_whip.ent</code></td><td><pre><code><strong>a0_002_wa__monowire_whip_l_cableless
</strong>a0_002_wa__monowire_whip_r_cableless
</code></pre></td></tr><tr><td>Inactive FPP</td><td><code>base\characters\cyberware\player\a0_002_wa__monowire_whip_holstered.ent</code></td><td><pre><code><strong>a0_002_wa__monowire_whip_l_cableless
</strong>a0_002_wa__monowire_whip_r_cableless
</code></pre></td></tr><tr><td>Inactive TPP</td><td><code>base\characters\cyberware\player\a0_002_wa__monowire_whip_tpp.ent</code></td><td><pre><code><strong>a0_002_wa__monowire_whip_l_cableless
</strong>a0_002_wa__monowire_whip_r_cableless
</code></pre></td></tr></tbody></table>

### Male

Note that it is _not_ a typo on this page that the inactive component names use `wa` instead of `ma`. That's just how it is.

<table><thead><tr><th width="155.33333333333331">Type</th><th>Folder or .ent files</th><th>Component names</th></tr></thead><tbody><tr><td>Active</td><td><code>base\characters\cyberware\player\a0_002__monowire_whip\entities\a0_002_ma__monowire_whip.ent</code></td><td><pre><code>a0_002_ma__monowire_whip_l_cableless
a0_002_ma__monowire_whip_r_cableless
</code></pre></td></tr><tr><td>Inactive</td><td><code>base\characters\cyberware\player\a0_002_ma__monowire_whip_holstered.ent</code></td><td><pre><code><strong>a0_002_wa__monowire_whip_l_cableless
</strong>a0_002_wa__monowire_whip_r_cableless
</code></pre></td></tr></tbody></table>

## Mantis Blade Arms

This is the first cyberarm type where we see the arm split across multiple .ent files.

### Female

<table><thead><tr><th width="155.33333333333331">Type</th><th>Folder or .ent files</th><th>Component names</th></tr></thead><tbody><tr><td>Active</td><td><pre><code>base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_wa__mantisblades_cyber.ent
base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_wa__mantisblades.ent
base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_wa__mantisblades_edge.ent
base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_wa__mantisblades_nails.ent
</code></pre></td><td><pre><code>a0_003_wa__mantisblade_left
a0_003_wa__mantisblade_upperarm_left
a0_003_wa__mantisblade_left_blade
a0_003_wa__mantisblade_left_mechanisms
a0_003_wa__mantisblade_left_mechanisms6263
a0_003_wa__mantisblade_nails_l
a0_003_wa__mantisblade_right
a0_003_wa__mantisblade_upperarm_right
a0_003_wa__mantisblade_right_mechanisms
a0_003_wa__mantisblade_right_mechanisms2035
a0_003_wa__mantisblade_right_blade
a0_003_wa__mantisblade_nails_r
</code></pre></td></tr><tr><td>Inactive FPP</td><td><code>base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_wa__mantisblade_holstered.ent</code></td><td><pre><code>a0_003_wa__mantisblade_holstered_left
a0_003_wa__mantisblade_holstered_upperarm_left
a0_003_wa__mantisblade_holstered_right
a0_003_wa__mantisblade_holstered_upperarm_right
</code></pre></td></tr><tr><td>Inactive TPP</td><td><code>base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_wa__mantisblade_photomode.ent</code></td><td><pre><code>a0_003_wa__mantisblade_photomode_left2804
a0_003_wa__mantisblade_photomode_upperarm_left
a0_003_wa__mantisblade_photomode_right
a0_003_wa__mantisblade_photomode_upperarm_right
</code></pre></td></tr></tbody></table>

### Male

<table><thead><tr><th width="155.33333333333331">Type</th><th>Folder or .ent files</th><th>Component names</th></tr></thead><tbody><tr><td>Active</td><td><pre><code>base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_ma__mantisblades_cyber.ent
base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_ma__mantisblades.ent
base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_ma__mantisblades_edge.ent
base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_ma__mantisblades_nails.ent
</code></pre></td><td><pre><code>a0_003_ma__mantisblade_left
a0_003_ma__mantisblade_upperarm_left
a0_003_ma__mantisblade_left_blade
a0_003_ma__mantisblade_left_mechanisms
a0_003_ma__mantisblade_nails_l
a0_003_ma__mantisblade_right
a0_003_ma__mantisblade_upperarm_right
a0_003_ma__mantisblade_right_blade
a0_003_ma__mantisblade_right_mechanisms
a0_003_ma__mantisblade_nails_r
</code></pre></td></tr><tr><td>Inactive <br>FPP and TPP</td><td><code>base\characters\cyberware\player\a0_003__mantisblade\entities\a0_003_ma__mantisblade_holstered.ent</code></td><td><pre><code>a0_003_ma__mantisblade_holstered_left6562
a0_003_ma__mantisblade_holstered_upperarm_left
a0_003_ma__mantisblade_holstered_right
a0_003_ma__mantisblade_holstered_upperarm_right
</code></pre></td></tr></tbody></table>

## Gorilla Arms

### Female

<table><thead><tr><th width="155.33333333333331">Type</th><th>Folder or .ent files</th><th>Component names</th></tr></thead><tbody><tr><td>Active</td><td><pre><code>base\characters\cyberware\player\a0_005__strongarms\a0_005_wa__strongarms.ent
base\characters\cyberware\player\a0_005__strongarms\entities\a0_005_ma__strongarms_knuckles.ent
base\characters\cyberware\player\a0_005__strongarms\a0_005_wa__strongarms_cyber.ent
</code></pre></td><td><pre><code>a0_005_wa__strongarms_l
a0_005_wa__strongarms_int_l
a0_005_wa__strongarms_cyberware_l
a0_005_wa__strongarms_r
a0_005_wa__strongarms_int_r
a0_005_wa__strongarms_cyberware_r
</code></pre></td></tr><tr><td>Inactive FPP</td><td><code>base\characters\cyberware\player\a0_005_wa__strongarms_holstered.ent</code></td><td><pre><code>a0_005_wa__strongarms_holstered_l
a0_005_wa__strongarms_holstered_cyberware_l
a0_005_wa__strongarms_holstered_r
a0_005_wa__strongarms_holstered_cyberware_r
</code></pre></td></tr><tr><td>Inactive TPP</td><td><code>base\characters\cyberware\player\a0_005_wa__strongarms_photo_mode.ent</code></td><td><pre><code>a0_005_wa__strongarms_photo_mode_l
a0_005_wa__strongarms_photo_mode_cyberware_l
a0_005_wa__strongarms_photo_mode_r
a0_005_wa__strongarms_photo_mode_cyberware_r
</code></pre></td></tr></tbody></table>

### Male

<table><thead><tr><th width="155.33333333333331">Type</th><th>Folder or .ent files</th><th>Component names</th></tr></thead><tbody><tr><td>Active</td><td><pre><code>base\characters\cyberware\player\a0_005__strongarms\a0_005_ma__strongarms.ent
base\characters\cyberware\player\a0_005__strongarms\entities\a0_005_ma__strongarms_knuckles.ent
base\characters\cyberware\player\a0_005__strongarms\a0_005_ma__strongarms_cyber.ent
</code></pre></td><td><pre><code>a0_005_ma__strongarms_l
a0_005_ma__strongarms_int_l
a0_005_ma__strongarms_cyberware_l
a0_005_ma__strongarms_r
a0_005_ma__strongarms_int_r
a0_005_ma__strongarms_cyberware_r
</code></pre></td></tr><tr><td>Inactive</td><td><code>base\characters\cyberware\player\a0_005_ma__strongarms_holstered.ent</code></td><td><pre><code>a0_005_ma__strongarms_holstered_l
a0_005_ma__strongarms_holstered_cyberware_l
a0_005_ma__strongarms_holstered_r
a0_005_ma__strongarms_holstered_cyberware_r
</code></pre></td></tr></tbody></table>

## Launcher Arms

The Launcher is asymmetric and only present in the left arm. The right arm component just re-uses the default mesh.

### Female

<table><thead><tr><th width="155.33333333333331">Type</th><th>Folder or .ent files</th><th>Component names</th></tr></thead><tbody><tr><td>Active</td><td><pre><code>base\characters\cyberware\player\a0_006__launcher\entities\a0_006_wa__launcher.ent
base\characters\cyberware\player\a0_006__launcher\entities\a0_006_wa__launcher_nails.ent
base\characters\cyberware\player\a0_006__launcher\entities\a0_006_wa__launcher_mechanisms.ent
base\characters\cyberware\player\a0_006__launcher\entities\a0_006_wa__launcher_cyber.ent
base\characters\cyberware\player\a0_006__launcher\entities\a0_006_wa__launcher_ammo_fire.ent
base\characters\cyberware\player\a0_006__launcher\entities\a0_006_wa__launcher_fragment_fire.ent
</code></pre></td><td><pre><code>a0_006_wa__launcher_upperarm
a0_006_wa__launcher_shells8722
a0_006_wa__launcher_mechanisms
a0_006_wa__launcher_muscles
a0_006_wa__launcher_nails_l
a0_006_wa__launcher_fragment_fire6227
a0_006_wa__launcher_ammo_fire2326
a0_006_wa__launcher_holstered_right
a0_006_wa__launcher_nails_r
</code></pre></td></tr><tr><td>Inactive FPP</td><td><code>base\characters\cyberware\player\a0_006__launcher\entities\a0_006_wa__launcher_holstered.ent</code></td><td><pre><code>a0_006_wa__launcher_holstered4156
a0_006_wa__launcher_holstered_upperarm
a0_006_wa__launcher_holstered_right
</code></pre></td></tr><tr><td>Inactive TPP</td><td><code>base\characters\cyberware\player\a0_006__launcher\entities\a0_006_wa__launcher_holstered_photo_mode.ent</code></td><td><pre><code>a0_006_wa__launcher_holstered_photo_mode8630
a0_006_wa__launcher_upperarm_photo_mode
a0_006_wa__launcher_holstered_photo_mode_right
</code></pre></td></tr></tbody></table>

### Male

<table><thead><tr><th width="155.33333333333331">Type</th><th>Folder or .ent files</th><th>Component names</th></tr></thead><tbody><tr><td>Active</td><td><pre><code>base\characters\cyberware\player\a0_006__launcher\entities\a0_006_ma__launcher.ent
base\characters\cyberware\player\a0_006__launcher\entities\a0_006_ma__launcher_nails.ent
base\characters\cyberware\player\a0_006__launcher\entities\a0_006_ma__launcher_mechanisms.ent
base\characters\cyberware\player\a0_006__launcher\entities\a0_006_ma__launcher_cyber.ent
base\characters\cyberware\player\a0_006__launcher\entities\a0_006_ma__launcher_ammo.ent
base\characters\cyberware\player\a0_006__launcher\entities\a0_006_ma__launcher_fragment.ent
</code></pre></td><td><pre><code>a0_006_ma__launcher_upperarm
a0_006_ma__launcher_shells1525
a0_006_ma__launcher_mechanisms
a0_006_ma__launcher_muscles
a0_006_ma__launcher_nails_l
a0_006_ma__launcher_fragment_fire4806
a0_006_ma__launcher_ammo_fire2714
a0_006_ma__launcher_upperarm_right
a0_006_ma__launcher_nails_r
</code></pre></td></tr><tr><td>Inactive</td><td><code>base\characters\cyberware\player\a0_006__launcher\entities\a0_006_ma__launcher_holstered.ent</code></td><td><pre><code>a0_006_ma__launcher_holstered1283
a0_006_ma__launcher_holstered_upperarm
a0_005_ma__strongarms_holstered_r
</code></pre></td></tr></tbody></table>

## Ballistic Coprocessor and Smart Link

These two items are represented identically by a game item internally called the \`weapon\_grip\`. However, the Weapon Grip is not a normal component, added or removed from the body, in the way that the arms themselves are. Instead, it is placed into an attachment slot. This has big implications for anyone hoping to manipulate them. As it is not part of the player puppet, you cannot manipulate it using Part Overrides, or Hiding Tags. Additionally, the game itself has weird and inconsistent rules for when to show the grip, and when the actually put the item into the attachment slot.

As a result, most people give up and use a [mod](https://www.nexusmods.com/cyberpunk2077/mods/3897) that deletes the actual Weapon Grip meshes. It is possible to [manage](https://www.nexusmods.com/cyberpunk2077/mods/14948) the visibility via Codeware scripting, but even that isn't straight forward.

<table><thead><tr><th width="155.33333333333331">Type</th><th>Folder or .ent files</th><th>Component names</th></tr></thead><tbody><tr><td>All</td><td><pre><code>base\gameplay\cyberware\smartgun_link\player_smartgun_link.ent
base\gameplay\cyberware\subdermal_grip\player_subdermal_grip.ent
</code></pre></td><td><pre><code>a0_004__weapon_grip_device
a0_004__weapon_grip_decal_01
a0_004__weapon_grip_decal_02
</code></pre></td></tr></tbody></table>

## Hiding Arms

{% hint style="info" %}
There's no easy way to hide arms except by getting rid of everything -  The ArchiveXL `hide_Arms` tag actually hides everything with an `a0_` prefix. For more information, check [#archivexl-tags](../../for-mod-creators/core-mods-explained/archivexl/archivexl-tags.md#archivexl-tags "mention")

If you want to selectively hide arm meshes or sub-meshes you will need to become familiar with all the contents of this page, and the chances that you can do anything elegantly are slim.&#x20;

Remember: Arms are why we can't have nice things.
{% endhint %}

### Arm override list, courtesy of Kiasuburger

```yaml
overrides:
  tags:
    hide_arm_left:
      a0_001_pwa_base_hq__full: {hide: [0, 1, 2, 3]}
      a0_000_ma_base__full_ag_hq1491: {hide: [0, 1, 2, 3]}
      left_arm: {hide: [0, 1, 2, 3]}
      # Monowire
      ## wa _and_ ma
      a0_002_wa__monowire_whip_l_cableless: {hide: [0, 1, 2, 3]}
      ## ma
      a0_002_ma__monowire_whip_l: {hide: [0, 1, 2, 3]}
      # Mantis Blades
      ## wa
      a0_003_wa__mantisblade_left: {hide: [0, 1, 2, 3]}
      a0_003_wa__mantisblade_upperarm_left: {hide: [0]}
      a0_003_wa__mantisblade_nails_l: {hide: [0]}
      ### a0_003_wa__mantisblade_left_mechanisms
      ### a0_003_wa__mantisblade_left_mechanisms6263
      ### a0_003_wa__mantisblade_left_blade
      a0_003_wa__mantisblade_photomode_left2804: {hide: [0, 1, 2, 3]}
      a0_003_wa__mantisblade_photomode_upperarm_left: {hide: [0]}
      a0_003_wa__mantisblade_holstered_left: {hide: [0, 1, 2, 3]}
      a0_003_wa__mantisblade_holstered_upperarm_left: {hide: [0]}
      ## ma
      a0_003_ma__mantisblade_left: {hide: [0, 1, 2, 3]}
      a0_003_ma__mantisblade_upperarm_left: {hide: [0]}
      a0_003_ma__mantisblade_nails_l: {hide: [0]}
      ### a0_003_ma__mantisblade_left_mechanisms
      ### a0_003_ma__mantisblade_left_blade
      a0_003_ma__mantisblade_holstered_left6562: {hide: [0, 1, 2, 3]}
      a0_003_ma__mantisblade_holstered_upperarm_left: {hide: [0]}
      # Gorilla Arms
      ## wa
      a0_005_wa__strongarms_l: {hide: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]}
      a0_005_wa__strongarms_int_l: {hide: [0, 1]}
      a0_005_wa__strongarms_cyberware_l: {hide: [0, 1, 2]}
      a0_005_wa__strongarms_photo_mode_l: {hide: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]}
      a0_005_wa__strongarms_photo_mode_cyberware_l: {hide: [0]}
      a0_005_wa__strongarms_holstered_l: {hide: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]}
      a0_005_wa__strongarms_holstered_cyberware_l: {hide: [0]}
      ## ma
      a0_005_ma__strongarms_l: {hide: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]}
      a0_005_ma__strongarms_int_l: {hide: [0, 1]}
      a0_005_ma__strongarms_cyberware_l: {hide: [0, 1, 2]}
      a0_005_ma__strongarms_holstered_l: {hide: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]}
      a0_005_ma__strongarms_holstered_cyberware_l: {hide: [0]}
      # Launcher
      ## wa
      a0_006_wa__launcher_shells8722: {hide: [0, 2, 3, 4, 5, 6, 7, 8]}
      a0_006_wa__launcher_upperarm: {hide: [0, 1, 2]}
      a0_006_wa__launcher_nails_l: {hide: [0]}
      a0_006_wa__launcher_holstered_photo_mode8630: {hide: [0, 1, 2, 3, 4, 5, 6]}
      a0_006_wa__launcher_upperarm_photo_mode: {hide: [0, 1, 2]}
      ### a0_006_wa__launcher_muscles
      ### a0_006_wa__launcher_mechanisms
      a0_006_wa__launcher_holstered4156: {hide: [0, 1, 2, 3, 4, 5, 6]}
      a0_006_wa__launcher_holstered_upperarm: {hide: [0, 1, 2]}
      ## ma
      a0_006_ma__launcher_shells1525: {hide: [0, 2, 3, 4]}
      a0_006_ma__launcher_upperarm: {hide: [0, 1, 2, 3, 4, 5, 6]}
      a0_006_ma__launcher_nails_l: {hide: [0]}
      ### a0_006_ma__launcher_muscles
      ### a0_006_ma__launcher_mechanisms
      a0_006_ma__launcher_holstered1283: {hide: [0, 1, 2, 3, 4, 5, 6]}
      a0_006_ma__launcher_holstered_upperarm: {hide: [0, 1, 2, 3, 4, 5, 6]}
    hide_nails_left:
      a0_000_pwa_base_nails_l: {hide: [0, 1, 2, 3, 4, 5]}
      a0_000_pwa_base__nails_l: {hide: [0, 1, 2, 3, 4, 5]}
      a0_000_pwa_fpp__nails_l: {hide: [0, 1, 2, 3, 4, 5]}
      a0_000_pma_base__nails_l: {hide: [0]}
      # Monowire
      a0_002_ma__monowire_whip_l: {hide: [2]}
      a0_002_wa__monowire_whip_l_cableless: {hide: [2]}

    hide_arm_right:
      a0_001_pwa_base_hq__full8640: {hide: [0, 1, 2]}
      a0_000_ma_base__full_ag_hq6168: {hide: [0, 1, 2]}
      right_arm: {hide: [0, 1, 2]}
      # Monowire
      ## wa _and_ ma
      a0_002_wa__monowire_whip_r_cableless: {hide: [0, 1, 2, 3, 4]}
      ## ma
      a0_002_ma__monowire_whip_r: {hide: [0, 1, 2, 3, 4]}
      # Mantis Blades
      ## wa
      a0_003_wa__mantisblade_right: {hide: [0, 1, 2, 3]}
      a0_003_wa__mantisblade_upperarm_right: {hide: [0]}
      a0_003_wa__mantisblade_nails_r: {hide: [0]}
      ### a0_003_wa__mantisblade_right_mechanisms
      ### a0_003_wa__mantisblade_right_mechanisms2035
      ### a0_003_wa__mantisblade_right_blade
      a0_003_wa__mantisblade_photomode_right: {hide: [0, 1, 2]}
      a0_003_wa__mantisblade_photomode_upperarm_right: {hide: [0]}
      a0_003_wa__mantisblade_holstered_right: {hide: [0, 1, 2]}
      a0_003_wa__mantisblade_holstered_upperarm_right: {hide: [0]}
      ## ma
      a0_003_ma__mantisblade_right: {hide: [0, 1, 2, 3]}
      a0_003_ma__mantisblade_upperarm_right: {hide: [0]}
      a0_003_ma__mantisblade_nails_r: {hide: [0]}
      ### a0_003_ma__mantisblade_right_mechanisms
      ### a0_003_ma__mantisblade_right_blade
      a0_003_ma__mantisblade_holstered_right: {hide: [0, 1, 2]}
      a0_003_ma__mantisblade_holstered_upperarm_right: {hide: [0]}
      # Gorilla Arms
      ## wa
      a0_005_wa__strongarms_r: {hide: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]}
      a0_005_wa__strongarms_int_r: {hide: [0, 1]}
      a0_005_wa__strongarms_cyberware_r: {hide: [0, 1, 2]}
      a0_005_wa__strongarms_photo_mode_r: {hide: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]}
      a0_005_wa__strongarms_photo_mode_cyberware_r: {hide: [0]}
      a0_005_wa__strongarms_holstered_r: {hide: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]}
      a0_005_wa__strongarms_holstered_cyberware_r: {hide: [0]}
      ## ma
      a0_005_ma__strongarms_r: {hide: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]}
      a0_005_ma__strongarms_int_r: {hide: [0, 1]}
      a0_005_ma__strongarms_cyberware_r: {hide: [0, 1, 2]}
      a0_005_ma__strongarms_holstered_r: {hide: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]}
      a0_005_ma__strongarms_holstered_cyberware_r: {hide: [0]}
      # Launcher
      ## wa
      a0_006_wa__launcher_holstered_right: {hide: [0, 1, 2]}
      a0_006_wa__launcher_nails_r: {hide: [0]}
      a0_006_wa__launcher_holstered_photo_mode_right: {hide: [0, 1, 2]}
      ## ma
      a0_006_ma__launcher_upperarm_right: {hide: [0, 1, 2]}
      a0_006_ma__launcher_nails_r: {hide: [0]}
      a0_006_ma__launcher_holstered_upperarm_right: {hide: [0, 1, 2]}
    hide_nails_right:
      a0_000_pwa_base_nails_r: {hide: [0, 1, 2, 3, 4, 5]}
      a0_000_pwa_base__nails_r: {hide: [0, 1, 2, 3, 4, 5]}
      a0_000_pwa_fpp__nails_r: {hide: [0, 1, 2, 3, 4, 5]}
      a0_000_pma_base__nails_r: {hide: [0]}
      # Monowire
      a0_002_ma__monowire_whip_r: {hide: [2]}
      a0_002_wa__monowire_whip_r_cableless: {hide: [2]
```
