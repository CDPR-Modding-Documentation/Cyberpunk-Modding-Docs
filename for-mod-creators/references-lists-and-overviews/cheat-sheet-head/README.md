# Cheat Sheet: Head

## Head file paths

If you want to [edit the player's head](../../modding-guides/npcs/a-new-head-for-v.md), you need [meshes](../../files-and-what-they-do/3d-objects-.mesh-files.md) and [morphtargets](../../3d-modelling/morphtargets.md).&#x20;

If you want to make a custom NPC, you can check [this guide](../../modding-guides/npcs/npv-v-as-custom-npc/).

<table data-header-hidden><thead><tr><th width="166.33333333333331">Body gender</th><th width="166">file extension</th><th>file path</th></tr></thead><tbody><tr><td>female</td><td><code>.mesh</code></td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\</code></td></tr><tr><td>female</td><td><code>.morphtarget</code></td><td><code>base\characters\head\player_base_heads\player_female_average</code></td></tr><tr><td>male</td><td><code>.mesh</code></td><td><code>base\characters\head\player_base_heads\player_man_average\h0_000_pwa_c__basehead\</code></td></tr><tr><td>male</td><td><code>.morphtarget</code></td><td><code>base\characters\head\player_base_heads\player_man_average</code></td></tr></tbody></table>

{% hint style="info" %}
The folders contain the entire player head. You will need between&#x20;
{% endhint %}

## Skin tones by index

<table><thead><tr><th width="85"></th><th></th></tr></thead><tbody><tr><td>1</td><td>01_ca_pale</td></tr><tr><td>2</td><td>01_ca_pale_00_warm_ivory</td></tr><tr><td>3</td><td>02_ca_limestone</td></tr><tr><td>4</td><td>02_ca_limestone_00_beige</td></tr><tr><td>5</td><td>03_ca_senna</td></tr><tr><td>6</td><td>03_ca_senna_00_amber</td></tr><tr><td>7</td><td>03_ca_senna_01_honey</td></tr><tr><td>8</td><td>03_ca_senna_02_band</td></tr><tr><td>9</td><td>04_ca_almond</td></tr><tr><td>10</td><td>04_ca_almond_00_umber</td></tr><tr><td>11</td><td>05_bl_espresso</td></tr><tr><td>12</td><td>06_bl_dark</td></tr></tbody></table>

List compiled by **wolv**

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

## Eyeliner and kohl

**to be done**

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

Eye make-up
