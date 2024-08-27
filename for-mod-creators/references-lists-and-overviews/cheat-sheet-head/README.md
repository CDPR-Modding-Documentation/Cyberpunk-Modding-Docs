# Cheat Sheet: Head

## Summary

This page lists various properties of the player head. Use the Table of Contents or your browser's search (Hotkey: `Ctrl+F`) to quickly find what you're looking for.&#x20;

{% hint style="info" %}
You can find much additional information about the player head under [npv-preparing-the-head-in-blender.md](../../../modding-guides/npcs/npv-v-as-custom-npc/npv-preparing-the-head-in-blender.md "mention")&#x20;
{% endhint %}

### Wait, this isn't what I'm looking for!

* If you want to [edit the player's head](../../../modding-guides/npcs/a-new-head-for-v.md), you need [meshes](../../../for-mod-creators-theory/files-and-what-they-do/3d-objects-.mesh-files/) and [morphtargets](../../../for-mod-creators-theory/3d-modelling/morphtargets.md).&#x20;
* If you want to make a custom NPC, check [npv-v-as-custom-npc](../../../modding-guides/npcs/npv-v-as-custom-npc/ "mention")

***

## Head file paths

<table data-header-hidden><thead><tr><th width="166.33333333333331">Body gender</th><th width="166">file extension</th><th>file path</th></tr></thead><tbody><tr><td>female</td><td><code>.mesh</code></td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\</code></td></tr><tr><td>female</td><td><code>.morphtarget</code></td><td><code>base\characters\head\player_base_heads\player_female_average</code></td></tr><tr><td>male</td><td><code>.mesh</code></td><td><code>base\characters\head\player_base_heads\player_man_average\h0_000_pwa_c__basehead\</code></td></tr><tr><td>male</td><td><code>.morphtarget</code></td><td><code>base\characters\head\player_base_heads\player_man_average</code></td></tr></tbody></table>

{% hint style="info" %}
The folders contain the entire player head. The minimum amount of meshes rendered is 3 (head, teeth, eyes), and can go up to 13 (fem V)/14 (masc V).&#x20;
{% endhint %}

### Head file prefixes

|       |                                                                                                                                         |
| ----- | --------------------------------------------------------------------------------------------------------------------------------------- |
| h0\_  | head (with ears)                                                                                                                        |
| hb\_  | male V only: beard                                                                                                                      |
| heb\_ | eyebrows                                                                                                                                |
| he\_  | eyes                                                                                                                                    |
| ht\_  | teeth                                                                                                                                   |
| hx\_  | <p>applied on top of h0: </p><ul><li>cyberware</li><li>makeup</li><li>freckles</li><li>pimples</li><li>tattoos</li><li>scars </li></ul> |
| l1\_  | ear ring (01-04)                                                                                                                        |

## Skin tones by index

<table><thead><tr><th width="85"></th><th></th></tr></thead><tbody><tr><td>1</td><td>01_ca_pale</td></tr><tr><td>2</td><td>01_ca_pale_00_warm_ivory</td></tr><tr><td>3</td><td>02_ca_limestone</td></tr><tr><td>4</td><td>02_ca_limestone_00_beige</td></tr><tr><td>5</td><td>03_ca_senna</td></tr><tr><td>6</td><td>03_ca_senna_00_amber</td></tr><tr><td>7</td><td>03_ca_senna_01_honey</td></tr><tr><td>8</td><td>03_ca_senna_02_band</td></tr><tr><td>9</td><td>04_ca_almond</td></tr><tr><td>10</td><td>04_ca_almond_00_umber</td></tr><tr><td>11</td><td>05_bl_espresso</td></tr><tr><td>12</td><td>06_bl_dark</td></tr></tbody></table>

List compiled by **wolv**

## Complexions

Every complexion has its own associated texture file. These are sorted by body gender under

```
base\characters\head\wa\h0_001_wa_c__basehead\textures\h0_000_wa_c__basehead_d0X.xbm
base\characters\head\ma\h0_001_ma_c__basehead\textures\h0_000_ma_c__basehead_d0X.xbm
```

The files are ending in `01..05`. Each complexion has its own appearance in the head mesh, e.g.:&#x20;

```
03_ca_senna
03_ca_senna_d02
03_ca_senna_d03
03_ca_senna_d04
03_ca_senna_d05
```

## Skin definitions

Skin materials are defined in the base head file:&#x20;

<table><thead><tr><th width="251"></th><th></th></tr></thead><tbody><tr><td>female body gender</td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\h0_000_pwa_c__basehead.mesh</code></td></tr><tr><td>male body gender</td><td><code>base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\h0_000_pma_c__basehead.mesh</code></td></tr></tbody></table>

You can find the [definitions](../../../for-mod-creators-theory/files-and-what-they-do/3d-objects-.mesh-files/#step-3-material-definition) in the localMaterialBuffer. Each material overrides the following [properties](../../../for-mod-creators-theory/materials/configuring-materials/#checking-material-properties) locally:

* Normal (bump/height map)
* Albedo (diffuse/complexion)

All other properties are pulled from a [.mi file](../../../for-mod-creators-theory/files-and-what-they-do/materials/re-using-materials-.mi.md) in the following folder:

<table><thead><tr><th width="212"></th><th></th></tr></thead><tbody><tr><td>female body gender</td><td><code>base\characters\common\skin\character_mat_instance\female\head\</code></td></tr><tr><td>male body gender</td><td><code>base\characters\common\skin\character_mat_instance\male\head\</code></td></tr></tbody></table>

### Head: material instances

This section only lists [.mi files](../../../for-mod-creators-theory/files-and-what-they-do/materials/re-using-materials-.mi.md) used by the player head.&#x20;

{% hint style="warning" %}
About half of these files are shared by NPCs. Editing or replacing these will affect all of Night City!
{% endhint %}

<table><thead><tr><th width="550">File name (use male_head for masc)</th><th>Shared with NPCs</th></tr></thead><tbody><tr><td><code>female_head_01_ca_pale_00_warm_ivory.mi</code></td><td>❌</td></tr><tr><td><code>female_head_01_ca_pale.mi</code></td><td>✔</td></tr><tr><td><code>female_head_02_ca_limestone_00_beige.mi</code></td><td>❌</td></tr><tr><td><code>female_head_02_ca_limestone.mi</code></td><td>✔</td></tr><tr><td><code>female_head_03_ca_senna_00_amber.mi</code></td><td>❌</td></tr><tr><td><code>female_head_03_ca_senna_01_honey.mi</code></td><td>❌</td></tr><tr><td><code>female_head_03_ca_senna_02_band.mi</code></td><td>❌</td></tr><tr><td><code>female_head_03_ca_senna.mi</code></td><td>✔</td></tr><tr><td><code>female_head_04_ca_almond_00_umber.mi</code></td><td>❌</td></tr><tr><td><code>female_head_04_ca_almond.mi</code></td><td>✔</td></tr><tr><td><code>female_head_05_bl_espresso.mi</code></td><td>✔</td></tr><tr><td><code>female_head_06_bl_dark.mi</code></td><td>✔</td></tr></tbody></table>

## **Freckles / cheek make-up**

For a list of freckles and make-up sorted by colour and skin type, see NoraLee's [NPV guide](https://docs.google.com/document/d/1clFJhpi7H5jk73vUQPnjIwjkuQV6VnYkKMoXt1eYMb0/edit#bookmark=id.lau0nfbbx4id).

## Lipstick

{% hint style="info" %}
For a mod fixing various mix-ups in the character creator, see [here](https://www.nexusmods.com/cyberpunk2077/mods/6788).
{% endhint %}

Lipstick colours and styles are sorted in (more or less) ascending order in the appearance list in the mesh.&#x20;

Style order is Default - Glossy - Matte (no suffix, \_02_, \__03)

Link: [Reference images on imgur](https://imgur.com/a/NlbCHYK)

<figure><img src="https://i.imgur.com/P5NMggv.png" alt=""><figcaption></figcaption></figure>

## Eyebrows

Every eyebrow option has an associated texture file, normal map, and alpha map.

These files can be found in the following folder:&#x20;

```
base/characters/common/character_customisation_items/eyebrows/textures/
```

Provided below is a table with the eyebrows and their associated texture files.

| Eyebrow | Diffuse Texture      |
| ------- | -------------------- |
| 01      | heb\_\_base\_d01.xbm |
| 02      | heb\_\_base\_d02.xbm |
| 03      | heb\_\_base\_d03.xbm |
| 04      | heb\_\_base\_d04.xbm |
| 05      | heb\_\_base\_d05.xbm |
| 06      | heb\_\_base\_d06.xbm |
| 07      | heb\_\_base\_d07.xbm |
| 08      | heb\_\_base\_d08.xbm |

| Eyebrow | Alpha mask                |
| ------- | ------------------------- |
| 01      | heb\_wa\_\_base\_ds01.xbm |
| 02      | heb\_wa\_\_base\_ds02.xbm |
| 03      | heb\_wa\_\_base\_ds03.xbm |
| 04      | heb\_wa\_\_base\_ds04.xbm |
| 05      | heb\_wa\_\_base\_ds05.xbm |
| 06      | heb\_wa\_\_base\_ds06.xbm |
| 07      | heb\_wa\_\_base\_ds07.xbm |
| 08      | heb\_wa\_\_base\_ds08.xbm |

## Eyeliner and kohl

<figure><img src="../../../.gitbook/assets/done.png" alt=""><figcaption></figcaption></figure>

## E3/Marketing Assets

Assets made for the purposes of E3 demonstrations/trailers and other gameplay demos remain in the game, including player heads. These heads will not work with the character creator system as they are, but they'll be listed here for the curious.

Please note that while there are texture folders, though their folders will be noted, the textures themselves will not be listed here. They are relatively self-explanatory with one thing to note regarding male V, which is mentioned at the bottom.

### Female V

#### E3 2018 Head

```
base\characters\main_npc\demo_vicky\h0_001_wa_c__demo_vicky\
```

```
base\characters\main_npc\demo_vicky\h0_001_wa_c__demo_vicky\textures
```

In these folders, you will find the assets used for V as seen in the 43-minute 2018 gameplay demo.

| File                                                     | Description                                                                                                                                            |
| -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| h0\_001\_wa\_c\_\_demo\_vicky.mesh                       | Head                                                                                                                                                   |
| hb\_001\_wa\_c\_\_demo\_vicky.mesh                       | <p>Eyebrow/eyelash</p><p> (Note: this is different than the traditional eyebrow mesh the game actually uses, these are fully modelled 3D meshes.) </p> |
| he\_001\_wa\_c\_\_demo\_vicky.mesh                       | Eyes                                                                                                                                                   |
| heb\_001\_wa\_c\_\_demo\_vicky.mesh                      | Eyebrows (Note: same format as the final game eyebrows.)                                                                                               |
| ht\_001\_wa\_c\_\_demo\_vicky.mesh                       | Teeth                                                                                                                                                  |
| hx\_001\_wa\_c\_\_demo\_vicky\_makeup\_eyes\_01.mesh     | Eye makeup                                                                                                                                             |
| hx\_001\_wa\_c\_\_demo\_vicky\_makeup\_freckles\_01.mesh | Freckles                                                                                                                                               |
| hx\_001\_wa\_c\_\_demo\_vicky\_makeup\_lips\_01.mesh     | Lip makeup                                                                                                                                             |
| hx\_001\_wa\_c\_\_demo\_vicky\_pimples\_01.mesh          | Pimples                                                                                                                                                |

2020 Marketing Head

```
base\characters\head\pwa\h0_000_pwa_c__basehead\
```

```
base\characters\head\pwa\h0_000_pwa_c__basehead\textures
```

These folders contain the V used in the early 2020 marketing materials and "The World of Cyberpunk 2077", the assets here more closely resemble the final game.

| File                                            | Description |
| ----------------------------------------------- | ----------- |
| h0\_000\_pwa\_c\_\_basehead.mesh                | Head        |
| he\_000\_pwa\_c\_\_basehead.mesh                | Eyes        |
| heb\_000\_pwa\_c\_\_basehead.mesh               | Eyebrows    |
| ht\_000\_pwa\_c\_\_basehead.mesh                | Teeth       |
| hx\_000\_pwa\_c\_\_basehead\_cyberware\_01.mesh | Cyberware   |
| hx\_000\_pwa\_c\_\_basehead\_cyberware\_02.mesh | Cybeware    |
| hx\_000\_pwa\_c\_\_basehead\_cyberware\_03.mesh | Cyberware   |
| hx\_000\_pwa\_c\_\_basehead\_cyberware\_04.mesh | Cyberware   |
| hx\_000\_pwa\_c\_\_basehead\_cyberware\_05.mesh | Cyberware   |
| hx\_000\_pwa\_c\_\_basehead\_makeup\_01.mesh    | Lip makeup  |
| hx\_000\_pwa\_c\_\_basehead\_makeup\_02.mesh    | Eye makeup  |
| i1\_000\_pwa\_c\_earring\_\_basehead.mesh       | Earing      |

### Male V

When compared to female V, male V has fewer remaining assets left over from development (mostly 2018 is missing). However, what we saw of male V in the 2019 Deep Dive demo, early 2020 trailers, and "The World of Cyberpunk 2077" remain behind.

#### 2019 Deep Dive/2020 Marketing

```
base\characters\head\pma\h0_000_pma_c__basehead\
```

```
base\characters\head\pma\h0_000_pma_c__basehead\textures
```

```
base\characters\head\pma\h0_001_ma_c__player\textures
```

Note that not everything in the foremost folder will be listed, only what's important. There are simply too many assets to list here, most of which are identical to the final game if not straight duplicates.

|                                                       |                                                                     |
| ----------------------------------------------------- | ------------------------------------------------------------------- |
| h0\_000\_pma\_c\_\_basehead\_scar\_01.mesh            | Head scar (Note: potentially what we see in the 2018 trailer)       |
| h0\_000\_pma\_c\_\_basehead.mesh                      | Head                                                                |
| h0\_000\_pma\_c\_\_short\_spiked\_cyberware\_01.mesh  | Hair with cyberware cutout(?)                                       |
| h0\_000\_pma\_c\_\_short\_spiked.mesh                 | Hair                                                                |
| hb\_000\_pma\_c\_\_basehead\_\_e3\_demo\_reduced.mesh | Beard                                                               |
| he\_000\_pma\_c\_\_basehead\_cyberware.mesh           | Eyes with cyberware cutout(?)                                       |
| he\_000\_pma\_c\_\_basehead.mesh                      | Eyes                                                                |
| heb\_000\_pma\_c\_\_basehead\_01.mesh                 | Eyebrows (Note: Like 2018 Female V, these are 3D modeled eyebrows!) |
| hh\_000\_pma\_c\_\_basehead\_haircap\_01.mesh         | Hair cap                                                            |
| hx\_000\_pma\_c\_\_basehead\_cyberware\_01.mesh       | Cyberware (Note: Same as used in the trailer/gameplay videos.)      |
| i1\_000\_pma\_earring\_\_basehead\_01.mesh            | Earing                                                              |

{% hint style="warning" %}
Important exception; outside of the above folder, somewhere else in a different folder is a beard mesh that is combined with 3D eyebrows and eyelashes.

`base\characters\head\pma\h0_001_ma_c__player\hb_001_ma_c__player.mesh`
{% endhint %}

#### Textures

Textures for male V here are scattered across two different folders, `h0_000_pma_c__basehead` and `h0_001_ma_c__player` respectively.



