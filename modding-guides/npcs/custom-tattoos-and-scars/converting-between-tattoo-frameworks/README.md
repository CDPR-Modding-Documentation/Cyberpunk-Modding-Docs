---
description: >-
  This page will explain in detail what the current texture frameworks are, what
  are the difference between them and which body mods utilizes them.
---

# Texture Frameworks for Player V

## Summary

**Published**: Feb 03 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

**Overhaul of information & addition of reference pictures**: June 16 2024 by LadyLea\
**Last documented edit**: January 27 2025 by AllKnowingLion

{% hint style="warning" %}
It is highly recommended to fully read the official description pages of the following Texture Frameworks and the respective Body Mods on Nexus Mods - as further information can be found and also to keep track of any updates.
{% endhint %}

## **Why is there a need for Texture Frameworks?**

Since CDPR utilizes the same texture paths and texture files for V and NPCs, Texture Frameworks are used to give V separate texture files from NPCs, allowing you to edit V’s skin or tattoos without your edit affecting for example, Judy, River, or crowd NPCs.

### The Original Texture Layouts and Paths for V&#x20;

For clarity's sake, below is also documented V's original/vanilla texture layouts and paths, that are shared with NPCs. In addition to what was stated earlier, the options to create desired looks is very limited using this vanilla way.

#### Texture Layouts

The original texture UV Layouts CDPR utilizes for Player V:

<figure><img src="../../../../.gitbook/assets/ORIGINAL - UV LAYOUT - ALL IN ONE PLACE - LEFT&#x26;RIGHT ARMS.png" alt=""><figcaption><p>Left &#x26; Right Arms UV Layouts shared on one texture file with same texture paths - Femme V and Male V</p></figcaption></figure>

<div><figure><img src="../../../../.gitbook/assets/ORIGINAL - UV LAYOUT - FEMALE - BY LL.png" alt=""><figcaption><p>Body - Femme V</p></figcaption></figure> <figure><img src="../../../../.gitbook/assets/ORIGINAL - UV LAYOUT - MALE - BY LL.png" alt=""><figcaption><p>Body - Male V</p></figcaption></figure></div>

#### Texture Paths

<table><thead><tr><th width="202">Gender &#x26; Body part</th><th>Relative file path</th></tr></thead><tbody><tr><td>Femme body</td><td><p><strong>Body Skin Textures</strong> <code>base\characters\common\base_bodies\woman_average\textures\t0_000_wa__c_base_d02_naked.xbm base\characters\common\base_bodies\woman_average\textures\t0_000_wa__c_base_n02_naked.xbm</code></p><p><code>base\characters\common\base_bodies\woman_average\textures\t0_000_wa__c_base_rm02.xbm</code></p><p><code>base\characters\common\skin\torso\t0_000_base_c__tintcolormask.xbm</code></p></td></tr><tr><td>Femme arms</td><td><strong>Left Arm/Cyberarms &#x26; Right Arm/Cyberarms Skin Textures</strong> <code>base\characters\common\base_bodies\woman_average\textures\arms_hq\a0_000_wa__c_base_hq_d01.xbm base\characters\common\skin\torso\normal_details\a0_000_wa_base__hq_nd01.xbm base\characters\common\base_bodies\woman_average\textures\arms_hq\a0_000_wa__base_hq_rm01.xbmbase\characters\common\skin\torso\normal_details\a0_000_base__normaldetail_01.xbm base\characters\common\skin\torso\arms_hq\a0_000_base_c__tintcolormask_hq.xbm</code></td></tr><tr><td></td><td></td></tr><tr><td>Masc body</td><td><p><strong>Body Skin Textures</strong> <code>base\characters\common\base_bodies\man_average\textures\t0_000_ma__c_base_d03_naked.xbm base\characters\common\base_bodies\man_average\textures\t0_000_ma__c_base_n03_naked.xbm</code> </p><p><code>base\characters\common\base_bodies\man_average\textures\t0_000_ma__c_base_rm03.xbm</code></p></td></tr><tr><td>Masc arms</td><td><p><strong>Left Arm/Cyberarms &#x26; Right Arm/Cyberarms Skin Textures</strong></p><p><code>base\characters\common\base_bodies\man_average\textures\arms_hq\a0_000_ma__c_base_hq_d01.xbm base\characters\common\base_bodies\man_average\textures\arms_hq\a0_000_ma__base_hq_rm01.xbm base\characters\common\skin\torso\normal_details\a0_000_ma_base__hq_nd01.xbm</code></p><p><code>base\characters\common\skin\torso\normal_details\a0_000_base__normaldetail_01.xbm</code></p><p><code>base\characters\common\skin\torso\arms_hq\a0_000_base_c__tintcolormask_hq.xbm</code></p></td></tr></tbody></table>

## Which Texture Frameworks exist?

### [**Unique Arms**](https://www.nexusmods.com/cyberpunk2077/mods/2644)

The earliest initial texture framework by [Halvkyrie](https://next.nexusmods.com/profile/Halvkyrie/about-me?gameId=3333) for Player Female V. This mod makes the player arms use separate textures, allowing for different custom tattoos on each arm without the former limitation of mirroring.

#### Texture Layouts

Unique Arms utilizes the following texture UV Layouts for Arms:

<div align="center"><figure><img src="../../../../.gitbook/assets/VTK-HALV - UV LAYOUT - LEFT ARM - BY LL.png" alt="" width="375"><figcaption><p>Left Arm - Femme V</p></figcaption></figure> <figure><img src="../../../../.gitbook/assets/VTK-HALV - UV LAYOUT - RIGHT ARM - BY LL.png" alt="" width="375"><figcaption><p>Right Arm - Femme V</p></figcaption></figure></div>

#### Texture Paths

<table><thead><tr><th width="197">Gender &#x26; Body part</th><th>Relative file path</th></tr></thead><tbody><tr><td>Femme arms</td><td><p><strong>Left Arm/Cyberarms Skin Textures</strong></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_left_01_diffuse.xbm</code></p><p></p><p><strong>Right Arm/Cyberarms Skin Textures</strong></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_right_01_diffuse.xbm</code></p></td></tr></tbody></table>

### [The Unique V Texture Framework](https://www.nexusmods.com/cyberpunk2077/mods/3783?tab=description)

Also known as "UV" or "KS-UV" was  created by [Zosoab70](https://next.nexusmods.com/profile/zosoab70/about-me) and [AllKnowingLion](https://next.nexusmods.com/profile/AllKnowingLion/about-me), and released by their team account, "[KnowSo](https://next.nexusmods.com/profile/KnowSo/about-me?gameId=3333)".\
\
The UV Framework was the first full body and arm texture framework. The base version is designed for players to be able to make their character as unique as they'd like while also allowing for modders to easily create their textures for the body and arms from a single file instead of having to use multiple. Following the 4.1 update, however, modders will have the option to utilize alternate layouts for the arms that are formatted more closely to the vanilla structuring.                     &#x20;

#### Supported body mods:

* (F) [Lush](https://www.nexusmods.com/cyberpunk2077/mods/4901)/[SoLush](https://www.nexusmods.com/cyberpunk2077/mods/8392)
* (F) [Solo Original](https://www.nexusmods.com/cyberpunk2077/mods/4813)
* (F) [Solo Small](https://www.nexusmods.com/cyberpunk2077/mods/6213)
* (F) [Solo Ultimate](https://www.nexusmods.com/cyberpunk2077/mods/6944)
* (F) [Solo Arms](https://www.nexusmods.com/cyberpunk2077/mods/7148?tab=files)
* (F) [Solo 2.0](https://www.nexusmods.com/cyberpunk2077/mods/15869)
* (F) [Project Valentine](https://www.nexusmods.com/cyberpunk2077/mods/4256)
* (F) [Paragon Body](https://discord.com/channels/939996226173173760/1241234635300798555) _(Discord Exclusive release on_ [_KS Discord server_](https://discord.gg/knowso)_)_
* (F) [Nanarc's Flat Chest Body](https://www.nexusmods.com/cyberpunk2077/mods/6883)
* (F) [Songbird Body](https://www.nexusmods.com/cyberpunk2077/mods/9575)
* (F) [Songbird Body 2.0](https://www.nexusmods.com/cyberpunk2077/mods/12898)
* (F) [Vanilla Plus](https://www.nexusmods.com/cyberpunk2077/mods/3710)
* (F) [Ultra High Poly Body (UHPB)](https://www.nexusmods.com/cyberpunk2077/mods/3784)
* (F) [Vanilla High Feet](https://www.nexusmods.com/cyberpunk2077/mods/3783?tab=files) _(Alternate UV Framework base body file)_
* (F) [Freyja](https://www.nexusmods.com/cyberpunk2077/mods/10783?tab=description)
* (M) [Adonis](https://www.nexusmods.com/cyberpunk2077/mods/4968)
* (M) [Atlas](https://www.nexusmods.com/cyberpunk2077/mods/8766)
* (M) Titan Body _(Unreleased)_
* (M) [Pinkydude's "Better Feet" Body](https://www.nexusmods.com/cyberpunk2077/mods/8754)

{% hint style="info" %}
**Following the 4.0 Update, the UV Framework is compatible with ALL body mods, regardless of framework.**
{% endhint %}

#### Texture Layouts

UV Texture Framework's **base** version utilizes the following Full-Body texture layouts:

<div><figure><img src="../../../../.gitbook/assets/KSUV - UV FULL BODY LAYOUT - FEM - BY LL.png" alt="" width="375"><figcaption><p>UV Framework Full-Body UV Layout - Femme V</p></figcaption></figure> <figure><img src="../../../../.gitbook/assets/KSUV - UV FULL BODY LAYOUT - MALE - BY LL.png" alt="" width="375"><figcaption><p>UV Framework Full-Body UV Layout - Male V</p></figcaption></figure></div>

#### Texture Paths

The texture files for UV are separated by body gender. UV Texture Framework resources can be found on nexus - [Miscellaneous files Section](https://www.nexusmods.com/cyberpunk2077/mods/3783?tab=files).

{% hint style="info" %}
A detailed "how to" guide can be found in the UV Texture Framework resources files, along with .PNG files for the uv layouts for the body and arms. For further questions, troubleshooting, and community-sourced resources go to the [KS Discord](https://discord.gg/knowso) server.
{% endhint %}



<table><thead><tr><th width="196.38461538461542">Gender &#x26; Body part</th><th>Relative file path</th></tr></thead><tbody><tr><td>Femme body</td><td><p><strong>Full Body and Arms Skin Textures</strong></p><p></p><p><code>base\4k\common\body\wa\textures\d02_naked.xbm</code></p><p><code>base\4k\common\body\wa\textures\n02_naked.xbm</code></p><p><code>base\4k\common\body\wa\textures\wa_base_rm02.xbm</code></p><p><code>base\4k\common\body\wa\wa_base_tintcolormask.xbm</code><br></p><p><strong>Full Body and Arms Tattoo Textures</strong></p><p><code>base\4k\common\overlays\fullbody_overlay_d01.xbm</code><br><code>base\4k\common\overlays\glow_overlay_d01.xbm</code></p><p><code>base\4k\common\overlays\normals\fullbody_overlay_n01.xbm</code></p></td></tr><tr><td><p>Femme Hq Arms</p><p>         Add on<br>      (UV - 4.1)</p></td><td>Hq Arm Skin Textures<br><code>base\4k\common\arms_hq\wa\wa_hq_l_arm_d01.xbm</code><br><code>base\4k\common\arms_hq\wa\wa_hq_l_arm_nd01.xbm</code><br><code>base\4k\common\arms_hq\wa\wa_hq_l_arm_rm01.xbm</code><br><code>base\4k\common\arms_hq\wa\wa_hq_r_arm_d01.xbm</code><br><code>base\4k\common\arms_hq\wa\wa_hq_r_arm_nd01.xbm</code><br><code>base\4k\common\arms_hq\wa\wa_hq_r_arm_rm01.xbm</code><br><code>base\4k\common\arms_hq\wa\wa_a0_a_tintcolormask_hq.xbm</code><br><code>base\4k\common\arms_hq\wa\wa_a0_b_tintcolormask_hq.xbm</code><br><br>Hq Arm Tattoo Textures<br><code>base\4k\common\overlays\arms_hq\wa\wa_l_arm_glow_overlay_d01.xbm</code><br><code>base\4k\common\overlays\arms_hq\wa\wa_l_arm_overlay_d01.xbm</code><br><code>base\4k\common\overlays\arms_hq\wa\wa_r_arm_glow_overlay_d01.xbm</code><br><code>base\4k\common\overlays\arms_hq\wa\wa_r_arm_overlay_d01.xbm</code></td></tr><tr><td>Femme head</td><td><p><strong>Head Skin Textures</strong></p><p><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures\h0_000_pwa_c__basehead_d01.xbm</code></p><p><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures\h0_001_pwa_c__basehead_n01.xbm</code></p><p><code>base\4k\common\head\h0_001_ma_c__basehead_rm01.xbm</code></p><p></p><p><strong>Head Tattoo Textures</strong></p><p><code>base\4k\common\overlays\wa_head_overlay_d01.xbm</code><br><code>base\4k\common\overlays\wa_head_glow_d01.xbm base\4k\common\overlays\normals\wa_head_overlay_n01.xbm</code></p></td></tr><tr><td>Femme genitals</td><td><strong>None Textures</strong><br><code>base\4k\common\genitals\wa\none\i0_000_pwa_base__genitals_none_d01.xbm</code><br><code>base\4k\common\genitals\wa\none\i0_000_pwa_base__genitals_none_n01.xbm</code><br><code>base\4k\common\genitals\wa\none\i0_000_pwa_base__genitals_none_rm01.xbm</code><br><br><strong>Penis Textures</strong><br><code>base\4k\common\genitals\wa\penis\i0_000_pwa_c__basepenis_circumcised_d01.xbm</code><br><code>base\4k\common\genitals\wa\penis\i0_000_pwa_c__basepenis_circumcised_n01.xbm</code><br><code>base\4k\common\genitals\wa\penis\i0_000_pwa_c__basepenis_d01.xbm</code><br><code>base\4k\common\genitals\wa\penis\i0_000_pwa_c__basepenis_n01.xbm</code><br><code>base\4k\common\genitals\wa\penis\i0_000_pwa_c__basepenis_rm01.xbm</code></td></tr><tr><td></td><td></td></tr><tr><td>Masc body</td><td><p><strong>Full Body and Arms Skin Textures</strong></p><p><code>base\4k\common\body\ma\textures\d03_naked.xbm</code><br><code>base\4k\common\body\ma\textures\n03_naked.xbm</code></p><p><code>base\4k\common\body\ma\textures\ma_base_rm03.xbm</code></p><p><code>base\4k\common\body\ma\ma_base_tintcolormask.xbm</code><br></p><p><strong>Full Body and Arms Tattoo Textures</strong></p><p><code>base\4k\common\overlays\ma_fullbody_overlay_d01.xbm</code><br><code>base\4k\common\overlays\ma_glow_overlay_d01.xbm        base\4k\common\overlays\normals\ma_fullbody_overlay_n01.xbm</code></p></td></tr><tr><td><p>Masc Hq Arms</p><p>        Addon<br>      (UV - 4.1)</p></td><td><p><strong>Hq Arm Skin Textures</strong><br><code>base\4k\common\arms_hq\ma\ma_hq_l_arm_d01.xbm base\4k\common\arms_hq\ma\ma_hq_l_arm_nd01.xbm base\4k\common\arms_hq\ma\ma_hq_l_arm_rm01.xbm base\4k\common\arms_hq\ma\ma_hq_r_arm_d01.xbm base\4k\common\arms_hq\ma\ma_hq_r_arm_nd01.xbm base\4k\common\arms_hq\ma\ma_hq_r_arm_rm01.xbm base\4k\common\arms_hq\ma\ma_a0_a_tintcolormask_hq.xbm base\4k\common\arms_hq\ma\ma_a0_b_tintcolormask_hq.xbm</code><br></p><p><strong>Hq Arm Tattoo Textures</strong> <code>base\4k\common\overlays\arms_hq\ma\ma_l_arm_glow_overlay_d01.xbm base\4k\common\overlays\arms_hq\ma\ma_l_arm_overlay_d01.xbm base\4k\common\overlays\arms_hq\ma\ma_r_arm_glow_overlay_d01.xbm base\4k\common\overlays\arms_hq\ma\ma_r_arm_overlay_d01.xbm</code></p></td></tr><tr><td>Masc head</td><td><p><strong>Head Skin Textures</strong></p><p><code>base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\textures\h0_000_pma_c__basehead_d01.xbm</code></p><p><code>base\characters\head\player_base_heads\player_man_average\h0_000_pma_c__basehead\textures\h0_000_pma_c__basehead_n01.xbm</code><br><code>base\4k\common\head\h0_001_ma_c__basehead_rm01.xbm</code></p><p></p><p><strong>Head Tattoo Textures</strong></p><p><code>base\4k\common\overlays\wa_head_overlay_d01.xbm</code><br><code>base\4k\common\overlays\wa_head_glow_d01.xbm base\4k\common\overlays\normals\ma_head_overlay_n01.xbm</code></p></td></tr><tr><td>Masc genitals</td><td><strong>Penis Textures</strong><br><code>base\4k\common\genitals\ma\penis\i0_000_pma_c__basepenis_circumcised_d01.xbm</code><br><code>base\4k\common\genitals\ma\penis\i0_000_pma_c__basepenis_circumcised_n01.xbm</code><br><code>base\4k\common\genitals\ma\penis\i0_000_pma_c__basepenis_d01.xbm</code><br><code>base\4k\common\genitals\ma\penis\i0_000_pma_c__basepenis_n01.xbm</code><br><code>base\4k\common\genitals\ma\penis\i0_000_pma_c__basepenis_rm01.xbm</code><br><br><strong>Vagina Textures</strong><br><code>base\4k\common\genitals\ma\vagina\i0_000_pma_c__vagina_d01.xbm</code><br><code>base\4k\common\genitals\ma\vagina\i0_000_pma_c__vagina_n01.xbm</code><br><code>base\4k\common\genitals\ma\vagina\i0_000_pma_c__vagina_rm01.xbm</code></td></tr><tr><td>Skintones/Material instances<br>(Masc &#x26; Femme)</td><td><p><strong>Skintone Instances Textures</strong></p><p><code>base\characters\common\skin\player_mat_instance</code><br></p></td></tr></tbody></table>

### [V Texture Kit](https://www.nexusmods.com/cyberpunk2077/mods/7054)

Also known as "VTK" created by [xBaebsae](https://next.nexusmods.com/profile/xBaebsae/about-me?gameId=3333), is a framework that focuses on giving HD Skin textures and Tattoo textures for the body, feet, arms and head for Player V.  It integrates Halvkyrie's Unique Arms paths, and its structure expands for more customizability.

#### Supported body mods

* (F) [Vanilla HD](https://www.nexusmods.com/cyberpunk2077/mods/7054?tab=description)
* (F) Vanilla HD - [VTK Big Breasts](https://www.nexusmods.com/cyberpunk2077/mods/7482)
* (F) Vanilla HD - [VTK Small Breasts](https://www.nexusmods.com/cyberpunk2077/mods/7482)
* (F) Hyst's [Realistic Butt](https://www.nexusmods.com/cyberpunk2077/mods/4420) (RB)
* (F) Hyst's [Enhanced Big Breasts](https://www.nexusmods.com/cyberpunk2077/mods/4654) (EBB)
* (F) Hyst's [Enhanced Big Breasts + Realistic Butt](https://www.nexusmods.com/cyberpunk2077/mods/4654) (EBBRB)
* (F) Hyst's[ Enhanced Big Breasts: Push Up](https://www.nexusmods.com/cyberpunk2077/mods/9083) (EBBP)
* (F) Hyst's [Enhanced Big Breasts: Push Up + Realistic Butt](https://www.nexusmods.com/cyberpunk2077/mods/9083) (EBBPRB)
* (F) Hyst's [Enhanced Vanilla Body](https://www.nexusmods.com/cyberpunk2077/mods/11489) (EVB)
* (F) Hyst's [Angel Body ](https://www.nexusmods.com/cyberpunk2077/mods/14896)
* (M) [Gymfiend](https://www.nexusmods.com/cyberpunk2077/mods/6423)

**Texture Layouts**

VTK FemV utilizes the following texture UV Layouts for Arms:

<div><figure><img src="../../../../.gitbook/assets/VTK-HALV - UV LAYOUT - LEFT ARM - BY LL.png" alt="" width="375"><figcaption><p>Left Arm - Femme V</p></figcaption></figure> <figure><img src="../../../../.gitbook/assets/VTK-HALV - UV LAYOUT - RIGHT ARM - BY LL.png" alt="" width="375"><figcaption><p>Right Arm - Femme V</p></figcaption></figure></div>

VTK FemV utilizes the following texture UV Layouts for the Body:

<figure><img src="../../../../.gitbook/assets/VTK - UV LAYOUT - BODY - BY LL.png" alt="" width="563"><figcaption><p>VTK - Body - Femme V</p></figcaption></figure>

**Texture Layouts**

VTK Gymfiend utilizes the following texture UV Layouts for Arms:

<div><figure><img src="../../../../.gitbook/assets/VTK - UV LAYOUT - GYMFIEND - LEFT ARM -  BY LL.png" alt=""><figcaption><p>Left Arm - Male V</p></figcaption></figure> <figure><img src="../../../../.gitbook/assets/VTK - UV LAYOUT - GYMFIEND - RIGHT ARM -  BY LL.png" alt=""><figcaption><p>Right Arm - Male V</p></figcaption></figure></div>

VTK Gymfiend utilizes the following texture UV Layouts for the Body:

<figure><img src="../../../../.gitbook/assets/VTK - UV LAYOUT - GYMFIEND BODY - BY LL.png" alt="" width="563"><figcaption><p>Body - Male V</p></figcaption></figure>

#### Texture Paths

The texture files for VTK are separated by body gender.                                                                                  VTK resources can be found on nexus - [Miscellaneous files Section](https://www.nexusmods.com/cyberpunk2077/mods/7054?tab=files).&#x20;

{% hint style="info" %}
* Further resources are available if one desires to convert textures for Female V in VTK format, a detailed guide can be found [here](https://xbaebsae.jimdofree.com/cyberpunk-2077-guides/cp2077-hd-feet-body-textures/).&#x20;
* Resources for texture conversion concerning Gymfiend - Male V, can be found at the [Miscellaneous files Section](https://www.nexusmods.com/cyberpunk2077/mods/6423?tab=files).
{% endhint %}

<table><thead><tr><th width="198.38461538461542">Gender &#x26; Body part</th><th>Relative file path</th></tr></thead><tbody><tr><td>Femme body</td><td><p><strong>Body Skin Textures</strong> </p><p><code>base\v_textures\body\v_body_d.xbm</code></p><p><code>base\v_textures\body\v_body_n.xbm</code></p><p><code>base\v_textures\body\v_body_n_detail.xbm</code></p><p><code>base\v_textures\body\v_body_rm.xbm</code></p><p><code>base\v_textures\body\v_body_tc.xbm</code></p><p></p><p><strong>Body Tattoo Textures</strong></p><p><code>base\v_textures\body\v_overlay.xbm</code><br><code>base\v_textures\body\v_glow.xbm</code></p></td></tr><tr><td>Femme arms</td><td><p><strong>Left Arm/Cyberarms Skin Textures</strong></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_left_01_diffuse.xbm</code></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_left_01_normal.xbm</code></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_left_01_normaldetail.xbm</code></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_left_01_roughnessmask.xbm</code></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_left_01_tintcolor.xbm</code></p><p></p><p><strong>Left Arm/Cyberarms Tattoo Textures</strong></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_left_01_overlay.xbm base\characters\player\femme\body\arms\textures\femme_arm_left_01_glow.xbm</code></p><p></p><p><strong>Right Arm/Cyberarms Skin Textures</strong></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_right_01_diffuse.xbm</code></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_right_01_normal.xbm</code></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_right_01_normaldetail.xbm</code></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_right_01_roughnessmask.xbm</code></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_right_01_tintcolor.xbm</code></p><p></p><p><strong>Right Arm/Cyberarms Tattoo Textures</strong></p><p><code>base\characters\player\femme\body\arms\textures\femme_arm_right_01_overlay.xbm base\characters\player\femme\body\arms\textures\femme_arm_right_01_glow.xbm</code><br></p></td></tr><tr><td>Femme head</td><td><p><strong>Head Skin Textures</strong></p><p><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures\h0_000_pwa_c__basehead_d01.xbm base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures\h0_001_pwa_c__basehead_n01.xbm base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures\h0_001_pwa_c__basehead_n_detail.xbm base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures\h0_001_pwa_c__basehead_rm.xbm base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures\h0_001_pwa_c__basehead_tc.xbm</code> </p><p></p><p><strong>Head Tattoo Textures</strong></p><p><code>base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures\h0_001_pwa_c__basehead_overlay.xbm base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\textures\h0_001_pwa_c__basehead_glow.xbm</code></p></td></tr><tr><td></td><td></td></tr><tr><td>Masc body</td><td><p><strong>Body Skin Textures</strong></p><p><code>base\v_textures\body\v_masc_body_d.xbm</code></p><p><code>base\v_textures\body\v_masc_body_n.xbm</code></p><p><code>base\v_textures\body\v_masc_body_n_detail.xbm</code></p><p><code>base\v_textures\body\v_masc_body_rm.xbm</code></p><p><code>base\v_textures\body\v_masc_body_tc.xbm</code></p><p><br><strong>Body Tattoo Textures</strong></p><p><code>base\v_textures\body\v_masc_overlay.xbm</code><br><code>base\v_textures\body\v_masc_glow.xbm</code></p></td></tr><tr><td>Masc arms</td><td><p><strong>Left Arm/Cyberarms Skin Textures</strong> <code>base\characters\player\masculine\body\arms\textures\masculine_arm_left_01_diffuse.xbm</code></p><p><code>base\characters\player\masculine\body\arms\textures\masculine_arm_left_01_normal.xbm</code></p><p><code>base\characters\player\masculine\body\arms\textures\masculine_arm_left_01_normaldetail.xbm</code></p><p><code>base\characters\player\masculine\body\arms\textures\masculine_arm_left_01_roughnessmask.xbm</code></p><p><code>base\characters\player\masculine\body\arms\textures\masculine_arm_left_01_tintcolor.xbm</code></p><p></p><p><strong>Left Arm/Cyberarms Tattoo Textures</strong></p><p><code>base\characters\player\masculine\body\arms\textures\masculine_arm_left_01_overlay.xbm base\characters\player\masculine\body\arms\textures\masculine_arm_left_01_glow.xbm</code> </p><p></p><p><strong>Right Arm/Cyberarms Skin Textures</strong></p><p><code>base\characters\player\masculine\body\arms\textures\masculine_arm_right_01_diffuse.xbm</code></p><p><code>base\characters\player\masculine\body\arms\textures\masculine_arm_right_01_normal.xbm</code></p><p><code>base\characters\player\masculine\body\arms\textures\masculine_arm_right_01_normaldetail.xbm</code></p><p><code>base\characters\player\masculine\body\arms\textures\masculine_arm_right_01_roughnessmask.xbm</code></p><p><code>base\characters\player\masculine\body\arms\textures\masculine_arm_right_01_tintcolor.xbm</code></p><p></p><p><strong>Right Arm/Cyberarms Tattoo Textures</strong><br><code>base\characters\player\masculine\body\arms\textures\masculine_arm_right_01_overlay.xbm base\characters\player\masculine\body\arms\textures\masculine_arm_right_01_glow.xbm</code></p></td></tr><tr><td>Masc head</td><td><em>currently not available</em></td></tr></tbody></table>

### What's the difference?

Primarily, the basic difference is the [UV layout](../../../../for-mod-creators-theory/materials/uv-mapping-texturing-a-3d-object.md) of the body/arm textures between the base version of the UV Framework, and VTK. Beyond that other features include:

<table><thead><tr><th width="383">UV Framework</th><th>VTK</th></tr></thead><tbody><tr><td><p> </p><p>Separate download for framework files / from body mods</p><p></p></td><td>Framework is open source and can be included with a body mod download</td></tr><tr><td><p>Arms and body share textures in base version</p><p></p></td><td>Arms on different texture same as original vanilla arms</td></tr><tr><td>Universal body mod support (4.0+)</td><td></td></tr><tr><td>Secondary file for split Hq arm textures, tattoo overlays, and normals maps (4.1+)</td><td><p>Supports mods made for<a href="https://www.nexusmods.com/cyberpunk2077/mods/2644"> Unique Arms</a> by <a href="https://next.nexusmods.com/profile/Halvkyrie/about-me?gameId=3333">Halvkyrie</a> </p><p><em>(Unique Arms is not required)</em></p></td></tr><tr><td><br>4k textures <em>(Cyberpink - Kwek x Fireapple)</em> built in to base framework for body and arms:<br>diffuse (d), normals (n), detail normals (nd), roughness (rm), tintcolormask</td><td>Full set of HD textures for body, arms, and head included: diffuse (d), normals (n), detail normals (nd), roughness (rm) and tintcolormask</td></tr><tr><td><br>Optional file for 8k body+arm texture <em>(Bedellia x Ava Skin)</em> <br></td><td></td></tr><tr><td>Separate body overlays for each body gender</td><td>Separate body overlays for each body gender</td></tr><tr><td>Unique Skintone .mi (Material instance) files</td><td></td></tr><tr><td>Emissive (glow) overlay</td><td>Emissive (glow) overlay</td></tr><tr><td>Upscaled micro-detailing for body, arms, and head</td><td></td></tr><tr><td>Cyberarms built in to base version</td><td><p>Cyberarms separate, can be included if modder chooses to </p><p><em>(Hyst's bodies have them included)</em></p></td></tr><tr><td></td><td>Alternate Texture layout for foot submeshes</td></tr><tr><td>Unique Eyebrows</td><td></td></tr></tbody></table>

_An example of the UV Layout differences in-game_:

<figure><img src="../../../../.gitbook/assets/VTK-GYMFIEND - KS-UV FULL BODY LAYOUT - DIFFERENCES - BY LL.jpeg" alt=""><figcaption><p>Arm-Body UV Layouts textures [VTK/Vanilla/UV-HQ] vs UV Framework's <strong>BASE</strong> version Full-Body UV Layouts textures</p></figcaption></figure>

