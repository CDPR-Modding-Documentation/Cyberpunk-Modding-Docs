---
description: How to change item stats with TweakXL
---

# 🔧 TweakXL: Changing game records

Changing item stats happens by making changes via **TweakXL** or **REDmod** in the [tweaks.md](../../files-and-what-they-do/tweaks.md "mention").

{% hint style="info" %}
You can find more information about this on the [TweakXL github's wiki page](https://github.com/psiberx/cp2077-tweak-xl/wiki/YAML-Tweaks).
{% endhint %}

## Existing guides:&#x20;

## How to edit tweaks?

You can change tweaks with&#x20;

* REDMod (see [changing-npcs-tweak-edit-redmod.md](changing-npcs-tweak-edit-redmod.md "mention"))
* Cyber Engine Tweaks (see Scissor's tutorial ([Google Doc](https://docs.google.com/document/d/1pPN\_RiluE-4PwGWOxdEVOegfBEaEsd5APHndr82FdPo/edit)))
* &#x20;TweakXL (see [changing-vendor-inventory.md](changing-vendor-inventory.md "mention"))

<details>

<summary>OK, but what's the pros and cons for each?</summary>

[psiberx says](https://discord.com/channels/717692382849663036/953004282142163014/1177462646937763850):&#x20;

it's mostly preference but there are real advantages of TweakXL:

* proper record creation and cloning with all properties
* proper hot reload with rolling back to initial state, and not just reapplying your mod changes on top of previous run
* it's much faster when used for declarative tweaks and even for scripts (I did some optimizations for CET which reduced loading times 20x, but it needs more; for reference if we convert just the existing clothing mods to CET it'll increase game launch time in minutes)
* easier to work with arrays
* can create new stats

REDMod can do the same, but doesn't offer you hot reload features.

</details>

## Removing properties

If you want to **safely delete** a record property, set its value to **None**.&#x20;
