---
description: You can find here a list of overlays names for the KS_UV and VTK frameworks.
---

# Overlay textures by framework

{% hint style="info" %}
Confused about the difference? Check [converting-between-tattoo-frameworks](../../../../for-mod-creators/modding-guides/npcs/custom-tattoos-and-scars/converting-between-tattoo-frameworks/ "mention")
{% endhint %}

{% hint style="success" %}
You already have the body mod installed, so you can simply get the files from your [Mod Browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser#mod-browser) by using the [Wolvenkit Search](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files).&#x20;
{% endhint %}

Depending on the supported framework, you need to name your WolvenKit project like this:

| Framework | Prefix | Example name    |
| --------- | ------ | --------------- |
| KS\_UV    | 004    | 004\_my\_tattoo |
| VTK       | 00     | 00\_my\_tattoo  |

## **Supported overlays**&#x20;

{% hint style="info" %}
The body file of KS\_UV contain the Torso, Back, Legs and Arms parts\
The body file of VTK contain Torso, Back and Legs parts
{% endhint %}

| Framework | Overlay name                         | gender/body part              |
| --------- | ------------------------------------ | ----------------------------- |
| KS\_UV    | fullbody\_overlay\_d01               | female  body (see note above) |
|           | ma\_fullbody\_overlay\_d01           | male  body (see note above)   |
|           | wa\_head\_overlay\_d01               | female head                   |
|           | ma\_head\_overlay\_d01               | male head                     |
|           |                                      |                               |
| VTK Femme | v\_overlay                           | female body (see note above)  |
|           | femme\_arm\_left\_01\_overlay        | female left arm               |
|           | femme\_arm\_right\_01\_overlay       | female right arm              |
|           | h0\_001\_pwa\_c\_\_basehead\_overlay | female head                   |
|           |                                      |                               |
| VTK Male  | v\_masc\_overlay                     | male body (see note above)    |
|           | masculine\_arm\_left\_01\_overlay    | male left arm                 |
|           | masculine\_arm\_right\_01\_overlay   | male right arm                |

### KS-UV  Femme path:&#x20;

Head : `base\4k\common\overlays\wa_head_overlay_d01.xbm`

Body : `base\4k\common\overlays\fullbody_overlay_d01.xbm`

### KS-UV  Male path:

Head: `base\4k\common\overlays\wa_head_overlay_d01.xbm`

Body: `base\4k\common\overlays\ma_fullbody_overlay_d01.xbm`

### VTK Femme path :&#x20;

Head:

`base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures\h0_001_pwa_c__basehead_overlay.xbm`&#x20;

Body : &#x20;

`base\v_textures\body\v_overlay.xbm`

Arms :&#x20;

`base\characters\player\femme\body\arms\textures\femme_arm_left_01_overlay.xbm base\characters\player\femme\body\arms\textures\femme_arm_right_01_overlay.xbm`

### VTK Male path:

Body: `base\v_textures\body\v_masc_overlay.xbm`

Arms:

`base\characters\player\masculine\body\arms\textures\masculine_arm_right_01_overlay.xbm base\characters\player\masculine\body\arms\textures\masculine_arm_left_01_overlay.xbm`
