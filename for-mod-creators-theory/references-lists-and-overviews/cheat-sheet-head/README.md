# Cheat Sheet: Head

## Summary

This page lists various properties of the player head. Use the Table of Contents or your browser's search (Hotkey: `Ctrl+F`) to quickly find what you're looking for.

{% hint style="info" %}
Check [cheat-sheet-character-creator.md](../cheat-sheet-character-creator.md "mention") for color values and appearances
{% endhint %}

### Wait, this isn't what I'm looking for!

* If you want to [edit the player's head](../../../modding-guides/npcs/a-new-head-for-v.md), you need [meshes](../../files-and-what-they-do/3d-objects-.mesh-files) and [morphtargets](../../3d-modelling/morphtargets.md).
* If you want to make a custom NPC, check [npv-v-as-custom-npc](../../../modding-guides/npcs/npv-v-as-custom-npc/ "mention")
* You can find much additional information about the player head under [npv-preparing-the-head-in-blender.md](../../../modding-guides/npcs/npv-v-as-custom-npc/npv-preparing-the-head-in-blender.md "mention")

***

## Head file paths

<table data-header-hidden><thead><tr><th width="166.33333333333331">Body gender</th><th width="166">file extension</th><th>file path</th></tr></thead><tbody><tr><td>female</td><td><code>.mesh</code></td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\</code></td></tr><tr><td>female</td><td><code>.morphtarget</code></td><td><code>base\characters\head\player_base_heads\player_female_average</code></td></tr><tr><td>male</td><td><code>.mesh</code></td><td><code>base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead</code></td></tr><tr><td>male</td><td><code>.morphtarget</code></td><td><code>base\characters\head\player_base_heads\player_man_average</code></td></tr></tbody></table>

{% hint style="info" %}
The folders contain the entire player head. The minimum amount of meshes rendered is 3 (head, teeth, eyes), and can go up to 13 (fem V)/14 (masc V).
{% endhint %}

### Head file prefixes

|       |                                                                                                                                       |
| ----- | ------------------------------------------------------------------------------------------------------------------------------------- |
| h0\_  | head (with ears)                                                                                                                      |
| hb\_  | male V only: beard                                                                                                                    |
| heb\_ | eyebrows                                                                                                                              |
| he\_  | eyes                                                                                                                                  |
| ht\_  | teeth                                                                                                                                 |
| hx\_  | <p>applied on top of h0:</p><ul><li>cyberware</li><li>makeup</li><li>freckles</li><li>pimples</li><li>tattoos</li><li>scars</li></ul> |
| l1\_  | ear ring (01-04)                                                                                                                      |

## Complexions

Every complexion has its own associated texture file. These are sorted by body gender under

```
base\characters\head\wa\h0_001_wa_c__basehead\textures\h0_000_wa_c__basehead_d0X.xbm
base\characters\head\ma\h0_001_ma_c__basehead\textures\h0_000_ma_c__basehead_d0X.xbm
```

The files are ending in `01..05`. Each complexion has its own appearance in the head mesh, e.g.:

```
03_ca_senna
03_ca_senna_d02
03_ca_senna_d03
03_ca_senna_d04
03_ca_senna_d05
```

## Skin definitions

Skin materials are defined in the base head `.mesh` file (while the shape comes from the .morphtarget):

<table><thead><tr><th width="251"></th><th></th></tr></thead><tbody><tr><td>female body gender</td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\h0_000_pwa_c__basehead.mesh</code></td></tr><tr><td>male body gender</td><td><code>base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\h0_000_pma_c__basehead.mesh</code></td></tr></tbody></table>

You can find the [definitions](../../files-and-what-they-do/3d-objects-.mesh-files#step-3-material-definition) in the localMaterialBuffer. Each material overrides the following [properties](../../materials/configuring-materials/#checking-material-properties) locally:

* Normal (bump/height map)
* Albedo (diffuse/complexion)

All other properties are pulled from a [.mi file](../../files-and-what-they-do/file-formats/materials/re-using-materials-.mi.md) in the following folder:

<table><thead><tr><th width="212"></th><th></th></tr></thead><tbody><tr><td>female body gender</td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures</code></td></tr><tr><td>male body gender</td><td><code>base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\textures</code></td></tr></tbody></table>

### Head: material instances

This section only lists [.mi files](../../files-and-what-they-do/file-formats/materials/re-using-materials-.mi.md) used by the player head. To see which skin is which, check [cheat-sheet-character-creator.md](../cheat-sheet-character-creator.md "mention") -> [#skin-tones](../cheat-sheet-character-creator.md#skin-tones "mention")

{% hint style="warning" %}
About half of these files are shared by NPCs. Editing or replacing these will affect all of Night City!
{% endhint %}

<table><thead><tr><th width="550">File name (use male_head for masc)</th><th>Shared with NPCs</th></tr></thead><tbody><tr><td><code>female_head_01_ca_pale_00_warm_ivory.mi</code></td><td>❌</td></tr><tr><td><code>female_head_01_ca_pale.mi</code></td><td>✔</td></tr><tr><td><code>female_head_02_ca_limestone_00_beige.mi</code></td><td>❌</td></tr><tr><td><code>female_head_02_ca_limestone.mi</code></td><td>✔</td></tr><tr><td><code>female_head_03_ca_senna_00_amber.mi</code></td><td>❌</td></tr><tr><td><code>female_head_03_ca_senna_01_honey.mi</code></td><td>❌</td></tr><tr><td><code>female_head_03_ca_senna_02_band.mi</code></td><td>❌</td></tr><tr><td><code>female_head_03_ca_senna.mi</code></td><td>✔</td></tr><tr><td><code>female_head_04_ca_almond_00_umber.mi</code></td><td>❌</td></tr><tr><td><code>female_head_04_ca_almond.mi</code></td><td>✔</td></tr><tr><td><code>female_head_05_bl_espresso.mi</code></td><td>✔</td></tr><tr><td><code>female_head_06_bl_dark.mi</code></td><td>✔</td></tr></tbody></table>

## **Freckles / cheek make-up**

For a list of freckles and make-up sorted by colour and skin type, see [cheat-sheet-character-creator.md](../cheat-sheet-character-creator.md "mention") -> [#cheek-makeup-style](../cheat-sheet-character-creator.md#cheek-makeup-style "mention")

## Eyebrows

Ev~~e~~ry eyebrow option has an associated texture file, normal map, and alpha map.

These files can be found in the following folder:

```
base/characters/common/character_customisation_items/eyebrows/textures/
```

Provided below is a table with the eyebrows and their associated texture files.

<table><thead><tr><th width="157">Eyebrow</th><th>Diffuse Texture</th><th>Alpha Mask</th></tr></thead><tbody><tr><td>01</td><td>heb__base_d01.xbm</td><td>heb_wa__base_ds01.xbm</td></tr><tr><td>02</td><td>heb__base_d02.xbm</td><td>heb_wa__base_ds02.xbm</td></tr><tr><td>03</td><td>heb__base_d03.xbm</td><td>heb_wa__base_ds03.xbm</td></tr><tr><td>04</td><td>heb__base_d04.xbm</td><td>heb_wa__base_ds04.xbm</td></tr><tr><td>05</td><td>heb__base_d05.xbm</td><td>heb_wa__base_ds05.xbm</td></tr><tr><td>06</td><td>heb__base_d06.xbm</td><td>heb_wa__base_ds06.xbm</td></tr><tr><td>07</td><td>heb__base_d07.xbm</td><td>heb_wa__base_ds07.xbm</td></tr><tr><td>08</td><td>heb__base_d08.xbm</td><td>heb_wa__base_ds08.xbm</td></tr></tbody></table>
