---
description: How to add new items to the character creator
---

# ArchiveXL: Character Creator additions

## Summary

Published: Jan 19 2025 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention") and [island\_dancer](https://app.gitbook.com/u/s8gktWvqEZWGRxQIsePwOnEI2Mo2 "mention")\
Last documented edit: September 3rd 2025 by [icxrus](https://app.gitbook.com/u/R7jBoGTs0NQ60YSE39s5jrdLiei2 "mention")

This page groups the individual CCXL addition guides and gives you an overview of the [#switcher-names](./#switcher-names "mention").&#x20;

* For a full explanation of the structure, see [ccxl-hairs.md](ccxl-hairs.md "mention")
* For a guide on starting from zero, see [ccxl-body-tattoos.md](ccxl-body-tattoos.md "mention")
* For switcher theory, see [ccxl-theory-switchers.md](ccxl-theory-switchers.md "mention")

### Wait, this is not what I want!

To learn more about the character creator, check [files-and-what-they-do](../../../files-and-what-they-do/ "mention") -> [character-creator](../../../files-and-what-they-do/file-formats/character-creator/ "mention")

## Switcher names

### Base game switchers

<table><thead><tr><th width="228.70001220703125">Slot in character creator</th><th>Switcher uiSlot for .inkcc file</th><th>Switcher type</th></tr></thead><tbody><tr><td>Hair</td><td>hairs</td><td>gameuiSwitcherInfo</td></tr><tr><td>Hair Color</td><td>hair_color, hair_color_fpp</td><td>gameuiAppearanceInfo</td></tr><tr><td>Beard</td><td>beard</td><td>gameuiSwitcherInfo</td></tr><tr><td>Beard Color</td><td>beard_color</td><td>gameuiAppearanceInfo</td></tr><tr><td>Body Tattoo</td><td>body_tattoo</td><td>gameuiSwitcherInfo</td></tr><tr><td>Face Tattoo</td><td>facial_tattoo</td><td>gameuiSwitcherInfo</td></tr><tr><td>Eyes</td><td>eyes</td><td>gameuiMorphInfo</td></tr><tr><td>Eye Color</td><td>eyes_color</td><td>gameuiAppearanceInfo</td></tr><tr><td>Eyebrows</td><td>eyebrows</td><td>gameuiSwitcherInfo</td></tr><tr><td>Eyebrows Color</td><td>eyebrows_color</td><td>gameuiAppearanceInfo</td></tr><tr><td>Eye Makeup</td><td>makeupEyes</td><td>gameuiSwitcherInfo</td></tr><tr><td>Eye Makeup Color</td><td>makeupEyes_color</td><td>gameuiAppearanceInfo</td></tr><tr><td>Lip Makeup</td><td>makeupLips</td><td>gameuiSwitcherInfo</td></tr><tr><td>Lip Makeup Color</td><td>makeupLips_color</td><td>gameuiAppearanceInfo</td></tr><tr><td>Cheek Makeup</td><td>makeupCheeks</td><td>gameuiSwitcherInfo</td></tr><tr><td>Cheek Makeup Color</td><td>makeupCheeks_color</td><td>gameuiAppearanceInfo</td></tr><tr><td>Skin Color</td><td>skin_color</td><td>gameuiAppearanceInfo</td></tr><tr><td>Skin Type</td><td>skin_type</td><td>gameuiAppearanceInfo</td></tr><tr><td>Nose</td><td>nose</td><td>gameuiMorphInfo</td></tr><tr><td>Mouth</td><td>mouth</td><td>gameuiMorphInfo</td></tr><tr><td>Jaw</td><td>jaw</td><td>gameuiMorphInfo</td></tr><tr><td>Ear</td><td>ear</td><td>gameuiMorphInfo</td></tr><tr><td>Cyberware</td><td>cyberware</td><td>gameuiAppearanceInfo</td></tr><tr><td>Scars</td><td>scars</td><td>gameuiAppearanceInfo</td></tr><tr><td>Piercings</td><td>piercings</td><td>gameuiSwitcherInfo</td></tr><tr><td>Piercing Color</td><td>piercings_color</td><td>gameuiAppearanceInfo</td></tr><tr><td>Teeth</td><td>teeth</td><td>gameuiAppearanceInfo</td></tr><tr><td>Blemishes</td><td>makeupPimples</td><td>gameuiSwitcherInfo</td></tr><tr><td>Blemish Color</td><td>makeupPimples_color</td><td>gameuiAppearanceInfo</td></tr><tr><td>Breasts</td><td>breast</td><td>gameuiMorphInfo</td></tr><tr><td>Nipples</td><td>nipples, fpp_nipples</td><td>gameuiAppearanceInfo</td></tr><tr><td>Body Scars</td><td>body_scars</td><td>gameuiAppearanceInfo</td></tr><tr><td>Genitals</td><td>genitals</td><td>gameuiAppearanceInfo</td></tr><tr><td>Penis</td><td>genitals_size</td><td>gameuiMorphInfo</td></tr><tr><td>Pubic Hair</td><td>pubic_hair</td><td>gameuiSwitcherInfo</td></tr><tr><td>Pubic Hair Color</td><td>pubic_hair_color</td><td>gameuiAppearanceInfo</td></tr><tr><td>Nails</td><td>nails_l, nails_r</td><td>gameuiMorphInfo</td></tr><tr><td>Nails Color</td><td>nails_color</td><td>gameuiAppearanceInfo</td></tr></tbody></table>

### Modded switchers

To prevent the character creator from becoming a cluttered unusable mess, we **strongly encourage** sticking to already-established switcher groups.

{% include "../../../../.gitbook/includes/if-you-can-contribute-please-sign-up.md" %}

{% hint style="warning" %}
Do **not** change the index! If two switchers have the same index, then only the first one will be used.
{% endhint %}

#### Tattoo switchers

<table><thead><tr><th>Switcher name for .inkcc file</th><th width="92.6500244140625">Index</th><th>Comment</th></tr></thead><tbody><tr><td>neck_tattoo</td><td>3300</td><td></td></tr><tr><td>left_arm_tattoo</td><td>3301</td><td></td></tr><tr><td>right_arm_tattoo</td><td>3302</td><td></td></tr><tr><td>left_shoulder_tattoo</td><td>3303</td><td></td></tr><tr><td>right_shoulder_tattoo</td><td>3304</td><td></td></tr><tr><td>chest_tattoo</td><td>3305</td><td></td></tr><tr><td>stomach_tattoo</td><td>3306</td><td></td></tr><tr><td>back_tattoo</td><td>3307</td><td></td></tr><tr><td>left_leg_tattoo</td><td>3308</td><td></td></tr><tr><td>right_leg_tattoo</td><td>3309</td><td></td></tr></tbody></table>

