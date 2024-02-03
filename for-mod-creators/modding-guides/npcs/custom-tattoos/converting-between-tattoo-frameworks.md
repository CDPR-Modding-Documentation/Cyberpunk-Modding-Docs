---
description: >-
  Once, there was only one framework and everyone modded in harmony. But
  everything changed when the fire nation attacked.
---

# Converting between tattoo frameworks

#### Summary

**Published**: Feb 03 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented edit**: Feb 03 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

{% hint style="info" %}
This page is only a stub and needs expanding (someone should write the actual guide)
{% endhint %}

## Which tattoo frameworks exist?

As of February 2024, there are two tattoo frameworks (and if the heavens are kind, there won't be any more):

### [KS UV](https://www.nexusmods.com/cyberpunk2077/mods/3783)

The initial [body and tattoo framework](https://www.nexusmods.com/cyberpunk2077/mods/3783) from early 2022. Download [**UV Modders Resource**](https://www.nexusmods.com/cyberpunk2077/mods/3783?tab=files) under Miscellaneous files

#### Supported body mods

* (F) Lush/SoLush
* (F) Solo
* (F) Solo Small
* (F) Solo Ultimate
* (F) Project Valentine
* (F) Nanarc's Flat Chest Body
* (F) Vanilla Plus
* (F) Songbird Body
* (F) Songbird Body 2.0
* (F) Ultra High Poly Body (UHPB)
* (F) Vanilla High Feet (Alternate UV Framework base body file)
* (M) Adonis
* (M) Atlas
* (M) Pinkydude's "Better Feet" Body

#### Tattoo files

The tattoo files for KSUV are separated by body gender.

<table><thead><tr><th width="216">gender and body part</th><th>relative file path</th></tr></thead><tbody><tr><td>femme arms</td><td>None yet, but you can modify the base textures:<br><code>base\4k\common\arms_hq\wa_base_hq_d01.xbm</code> </td></tr><tr><td>femme body</td><td><code>base\4k\common\overlays\fullbody_overlay_d01.xbm</code><br><code>base\4k\common\overlays\glow_overlay_d01.xbm</code></td></tr><tr><td>femme head</td><td><code>base\4k\common\overlays\wa_head_overlay_d01.xbm</code><br><code>base\4k\common\overlays\wa_head_glow_d01.xbm</code></td></tr><tr><td>masc arms</td><td>None yet</td></tr><tr><td>masc body</td><td><code>base\4k\common\overlays\ma_fullbody_overlay_d01.xbm</code><br><code>base\4k\common\overlays\ma_glow_overlay_d01.xbm</code></td></tr><tr><td>masc head</td><td><code>base\4k\common\overlays\wa_head_overlay_d01.xbm</code><br><code>base\4k\common\overlays\wa_head_glow_d01.xbm</code></td></tr></tbody></table>

### [VTK](https://www.nexusmods.com/cyberpunk2077/mods/7054)

[From early 2023](https://www.nexusmods.com/cyberpunk2077/mods/7054), this framework has a different UV layout. Download [**Modding Resources**](https://www.nexusmods.com/cyberpunk2077/mods/7054?tab=files) under Miscellaneous files

#### Supported body mods

* (F) Hyst Enhanced Big Breasts (EBB)
* (F) Hyst Realistic Booty (RB)
* (F) Hyst Enhanced Big Breasts + Realistic Booty (EBBRB)
* (F) Hyst Enhanced Big Breasts: Push (EBBP)
* (F) Hyst Enhanced Big Breasts + Realistic Booty: Push (EBBRBP)
* (F) Hyst Enhanced Vanilla Body (EVB)
* (F) Vanilla HD (Big and Small Breasts)

#### Tattoo Files

<table><thead><tr><th width="216">body part</th><th>relative file path</th></tr></thead><tbody><tr><td>femme arms</td><td><code>base\characters\player\femme\body\arms\textures\femme_arm_left_01_overlay.xbm</code><br><code>base\characters\player\femme\body\arms\textures\femme_arm_right_01_overlay.xbm</code></td></tr><tr><td>femme head</td><td><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures\h0_001_pwa_c__basehead_overlay.xbm</code></td></tr><tr><td>body (both?)</td><td><code>base\v_textures\body\v_overlay.xbm</code><br><code>base\v_textures\body\v_glow.xbm</code></td></tr><tr><td>masc arms</td><td>??</td></tr><tr><td>masc head</td><td>??</td></tr></tbody></table>

### What's the difference?

The [UV layout](../../../materials/uv-mapping-texturing-a-3d-object.md) of the textures is different:&#x20;



| KS UV                                                    | VTK                                         |
| -------------------------------------------------------- | ------------------------------------------- |
| Arms on same texture as the rest for basic version       | Arms on different texture                   |
| Add-on version for further arm texture layout options    | Requires Unique arms by Halvkyrie           |
| Unique Normals map for base version                      | Same body overlays for each body gender (?) |
| Unique normals maps for arms with Add-on version         | Emissive (glow) overlay
| Separate body overlays for each body gender              | Alternate Texture for foot submeshes
| Emissive (glow) overlay                                  | 
| Unique Normals map for base version                      |
| Cyberarms built in to base version                       |
| Unique Skintone .mi (Material instance) files            |
| Unique Eyebrows                                          |

(TODO: post screenshots with outlines)





