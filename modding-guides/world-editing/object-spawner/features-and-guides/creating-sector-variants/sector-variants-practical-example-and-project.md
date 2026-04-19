---
description: Sector variant switching with Native Settings
---

# Sector Variants Practical Example & Project

## Summary

**Published:** 22 Mar 2026 by [Kaoziun](https://app.gitbook.com/u/Wpzp3wR5S0avUBlInNbf79Lp5vP2 "mention")\
**Last documented edit:** 22 Mar 2026 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This guide gives a practical example as to how variants work with the Native Settings integration and its project so you can visualize how everything links together.

Rather than boring you with theory, we're making a simple build with different kinds of variants, so that you can see how to structure, export, and script them.

### Wait, this is not what I want!

* Find basic information about [.](./ "mention") on the parent page.

### Why would I need this?

Please check [#why-do-i-need-sector-variants](./#why-do-i-need-sector-variants "mention") on the main page for this intel.

### What can I do with variants?

The example project shows you a bunch of options. You are not limited to these — use sector variants to do whatever you want.

{% hint style="info" %}
Sufficiently complex sector variants are known as [quest modding](../../../../quest/). You might want to stop before that happens.
{% endhint %}

## Prerequisites

* WorldBuilder ([github](https://github.com/justarandomguyintheinternet/CP77_entSpawner/releases) | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/20660))
* A texteditor such as[ Notepad++](https://notepad-plus-plus.org/downloads/)
* You have downloaded and installed the example project (the link is directly below this text)

{% file src="../../../../../.gitbook/assets/VariantExample.rar" %}

### Assumed skill level

* You have some basic experience with WorldBuilder (or a high frustration tolerance)
* You do **not** need to know scripting

You can change anything in the template mod. Be encouraged to FAFO[^1]!

## What's in the example?

{% hint style="info" %}
The fastest way to learn this is breaking something that works and then un-fucking it. Fortunately, the template above contains a working mod project that you can install and then mod it 'till it crashes.
{% endhint %}

When installing the example project, you will have a little pool with ladders to get in and out, and a bunch of toggle-able things:

* Water fill levels (by default, it will be empty)
* Three colours for the casing/trim (one of them will be always active)
* A flamingo (off by default, you can toggle it on)
* A white chicken
* A brown chicken

\
<img src="../../../../../.gitbook/assets/Capture d&#x27;écran 2026-03-16 070309.png" alt="" data-size="original">![](<../../../../../.gitbook/assets/Capture d'écran 2026-03-16 070334.png>)

## Step 0: Teleport to the pool

The pool is set up on top of Watson's hospital. To get there, run the following CET command:

```
Game.GetTeleportationFacility():Teleport(GetPlayer(), ToVector4{ x = -1350.1178, y = 1792.7722, z = 128.8609, w = 1 }, ToEulerAngles{roll=0, pitch=0, yaw=145})
```

## Step 1: Group structure

Each of the variants needs to go into its own group.

All of these groups can be toggled on and off according to your settings. We're setting `unvarianted_assets` as always loaded in [#step-2-export](sector-variants-practical-example-and-project.md#step-2-export "mention"), so there's no toggling that one.

<figure><img src="../../../../../.gitbook/assets/Capture d&#x27;écran 2026-03-16 125125.png" alt=""><figcaption></figcaption></figure>

## Step 2: Export

Head to the **Export** tab, but click on the **Variants** dropdown arrow under your parent group(s) name(s). Here's what you'll see:

<figure><img src="../../../../../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure>

What do these options mean?

### Variant Node Ref

This is your **unique identifier** across **all sectors**. Make sure that it's unique (e.g. prefix it with your name).

### Checkbox Default On

Any subgroup with its box checked is always loaded, and it will not be turned into a variant (our `unvarianted assets` subgroup)

### Save as Template

It's strongly encouraged to save your export as a template to keep all the variant settings - otherwise, you'll have to configure them per import. In the template project, the following things are preconfigured:

* WB object save path
* Export
* Export template

## Step 3: Wolvenkit

We will now head to WolvenKit.

{% hint style="info" %}
This section assumes that you'll create your own script for toggling already-existing variants with the names used in the template project. If you are using your own exports, you need to update the corresponding files and names accordingly.
{% endhint %}

1. Switch the Project Browser to the Source or Resources tab
2. Re-name the `VariantsExample` folder to something unique (e.g. yourname)
3. Optional: open `all.streamingblock` to see your node ref and all your variant names:

<figure><img src="../../../../../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

## Step 4: Customizing the menu

There are several .lua files in the project, but you only need to edit two (`variants.lua` and `variantSettings.lua`).\
Open them with a text editor.

### Variants.lua

Here, you can set the display name that your mod uses in ModSettings. You can ignore everything else.

<figure><img src="../../../../../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

### variantSettings.lua

This is the main file where you create all options for your variants. Check the screenshot below - the code should be pretty much self-explanatory (every block controls a variant).

{% hint style="info" %}
The code folding feature in Notepad++ lets you collapse sections (you can see the little - buttons on the screenshot below). That makes it easy to identify the bits that you duplicate/delete.
{% endhint %}

As long as you don't make typos in the VariantNodeRef of the variant names, everything should just work.

<figure><img src="../../../../../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>

<br>

[^1]: Fuck Around and Find Out
