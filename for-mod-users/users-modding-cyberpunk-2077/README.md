---
description: Modding your game, for users
---

# ❔ Using Mods

{% content-ref url="../user-guide-troubleshooting/" %}
[user-guide-troubleshooting](../user-guide-troubleshooting/)
{% endcontent-ref %}

## Summary

**Published:** Jun 15, 2023 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** May 29 2024, by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will teach you how to **install mods manually.**&#x20;

* If you want to create mods instead, check the [Broken link](broken-reference "mention") section
* If you need help installing Cyberpunk, check [getting-started](getting-started/ "mention")
* If your modded install is acting up, please check [user-guide-troubleshooting](../user-guide-troubleshooting/ "mention")

{% hint style="danger" %}
We strongly recommend using a mod manager. You have the following options (the links go to wiki pages with more information):

[vortex-mod-manager.md](getting-started/vortex-mod-manager.md "mention") (Nexus Mod Manager)

[mo2-mod-organizer-2.md](getting-started/mo2-mod-organizer-2.md "mention") (known from e.g. Skyrim and Fallout)

It is possible to mod your game fully manually (and in fact, many modders do exactly that), but you have to understand the stuff on this page.&#x20;

Mod managers will save you from that effort.
{% endhint %}

## How to install mods

{% hint style="warning" %}
**TL;DR:** Your mods will not work unless you

* put all files into the right folders
* make sure to install all [requirements](../user-guide-troubleshooting/requirements-explained.md) (and their requirements)
* [enable REDmod](./#installing-and-activating-redmod)

When you fuck things up, hit up [#troubleshooting](./#troubleshooting "mention") or run [mod remover](https://www.nexusmods.com/cyberpunk2077/mods/8597/) and start over.

To see an [#overview-of-mod-folders](./#overview-of-mod-folders "mention"), scroll down.
{% endhint %}

## How do I mod?

You mod **Cyberpunk 2077** by adding files to your [**game directory**](the-cyberpunk-2077-game-directory.md). The game natively supports modding, and the core mods will take care of everything else.

{% hint style="success" %}
The **game directory** is the toplevel folder of your game install.&#x20;

Unless you changed the default settings, it will be installed to:

**STEAM**\
`C:\Program Files (x86)\Steam\steamapps\common\Cyberpunk 2077\`

**GOG**\
`C:\Program Files (x86)\GOG Galaxy\Games\Cyberpunk 2077\`

**Epic**

`C:\Program Files\Epic Games\Cyberpunk 2077\`
{% endhint %}

You can install mods by using [Vortex](https://www.nexusmods.com/about/vortex/)/[Mod Organizer 2](getting-started/mo2-mod-organizer-2.md), or by hand[.](https://github.com/JustThatKing/MO2077/blob/main/readme.md)

{% hint style="info" %}
Regardless of your past experiences, the Nexus Mod Manager [Vortex](https://www.nexusmods.com/about/vortex/) works reliably and well for modding Cyberpunk.
{% endhint %}

### What are dependencies / requirements?

For more detailed information, see [requirements-explained.md](../user-guide-troubleshooting/requirements-explained.md "mention").

{% hint style="danger" %}
TL;DR:&#x20;

Unless a requirement is marked as optional, **your mod will not work** until you install all of them.&#x20;

Some requirements have requirements of their own. Make sure to check.
{% endhint %}

<figure><img src="../../.gitbook/assets/mod-requirements.png" alt=""><figcaption></figcaption></figure>

Although Cyberpunk natively supports modding, this out-of-the-box support is limited. To allow greater freedom, a number of **core mods** have been created to allow e.g. adding items, influencing the weather, or add flying cars.

{% hint style="warning" %}
Since this kind of mod interacts with the game's executable (`.exe`), they will break every time CDPR updates. This is the reason why game updates break mods — we recommend to [**turn off auto-update**](users-downgrading-preventing-auto-updates.md) and manually upgrading once the frameworks you need have been brought up-to-date. To learn more about this, check [core-mods-explained](../../for-mod-creators-theory/core-mods-explained/ "mention").
{% endhint %}

### Overview of mod folders

{% hint style="info" %}
TL;DR: you can ignore this unless you want to understand how things work, or want to install mods manually.
{% endhint %}

This list is supposed to give you an overview of which files go where. It is **not** a bucket list of things you have to install.

To learn more about the individual frameworks, check [core-mods-explained](../../for-mod-creators-theory/core-mods-explained/ "mention")

<table><thead><tr><th width="256">Directory</th><th>explanation</th></tr></thead><tbody><tr><td>\<code>mods</code></td><td><a data-mention href="redmod/">redmod</a> directory: contains .archive mods (in subfolders). <br>Contains only a .stub file if empty.</td></tr><tr><td>\<code>archive\pc\mod</code></td><td>Default mod directory: contains .archive mods and .xl files in <code>legacy</code> (non-REDmod) format. Most of your mods should be here.</td></tr><tr><td>\<code>bin\x64\plugins</code></td><td>Plugins like <a href="https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-MP5jWcLZLbbbzO-_ua1-887967055/"><strong>Cyber Engine Tweaks</strong></a> and RadioExt</td></tr><tr><td><code>\r6\scripts</code></td><td>Redscript mods (<strong>not</strong> the same as REDmod)</td></tr><tr><td><code>\r6\tweaks</code></td><td>red4ext tweaks</td></tr><tr><td>\<code>archive\pc\patch</code></td><td>Mod directory from before 1.3. Use <code>\archive\pc\mod</code> instead.</td></tr></tbody></table>

```markup
- archive
  - pc
    - mod          << .archive files from non-REDmods go here
- bin
  - x64
    - plugins      << Cyber Engine Tweaks goes here
- mods             << REDmods go here
- r6               << redscript folder
  - scripts        << redscript mods (not the same as REDmod)
  - tweaks         << RED4ext tweaks (TweakXL / ArchiveXL)
- tools            << REDmod DLC lives here — only needed for making mods.
```

## Installing and activating REDmod

If REDmod is not installed and activated, your mods in `/mods` will not load.&#x20;

{% hint style="info" %}
REDmod never took off and most people stick to the legacy format. If your `/mods` folder is empty, you don't need this. For more information, see [#whats-the-difference](./#whats-the-difference "mention") below.
{% endhint %}

Loading a mod as REDmod means that Cyberpunk will precompile it to optimize load times — integrating it into the game's other files by adding it to the files under `r6/cache`.&#x20;

By contrast, vanilla mods (from `/archive/pc/mod`) will be loaded individually and might add to your load times.

* For instructions on how to install, see [here](getting-started/).
* For documentation on the Vortex installation toggle, see [here](getting-started/vortex-mod-manager.md#v2077-settings).
* For instructions on how to activate it, see [here for GOG](getting-started/) and here for [Steam and Epic](redmod/usage.md#steam-and-epic).

REDmods are installed in `Cyberpunk 2077\mods`, where every mod has a subfolder with an `info.json`.

{% hint style="warning" %}
If the mod contains only files inside the folder `archives`, you can un-REDmod-ify it by moving all of those files to `archive/pc/mod`.
{% endhint %}

## Installing Mods

You can install mods via [Vortex](getting-started/vortex-mod-manager.md) or [manually](./#manual-install). There are upsides and downsides to each — however, **for beginners,** [**we recommend using Vortex**](getting-started/vortex-mod-manager.md).

{% hint style="success" %}
If you had terrible experiences with Vortex for other games, be assured: Cyberpunk integration is working extremely well. Maybe give it another chance?
{% endhint %}

### Manual install

"Manual install" is a rather glorified term for "extracting the downloaded archive into your game directory". **However**, you have to make sure that the right files end up in the right folders.&#x20;

You can inspect the file structure by simply opening the downloaded file, or by using this feature on Nexus (unless a mod author has disabled it):

<figure><img src="../../.gitbook/assets/installing-nexus-preview-file-structure (1).png" alt=""><figcaption></figcaption></figure>

The file structure is different for REDmods and non-REDmods. Mod authors usually tell you which file is which, though. To find out what that means, read on.&#x20;

### Mod format: REDmod or vanilla?

{% hint style="danger" %}
If in doubt, install the non-REDmod (`"legacy"`) format. To learn why, check [#whats-the-difference](./#whats-the-difference "mention") below the table.
{% endhint %}

&#x20;Here is how you can tell the two apart:

| REDmod                                                                                                                    | Vanilla mod (packed correctly)                                                                                                                                                                                                                                                                                               |
| ------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <p></p><p><img src="../../.gitbook/assets/installing-redmod-preview.png" alt="" data-size="original"></p>                 | <p></p><p><img src="../../.gitbook/assets/installing-gift-wrapping.png" alt="" data-size="original"></p>                                                                                                                                                                                                                     |
| is in a folder named after the mod                                                                                        | might be inside an extra folder                                                                                                                                                                                                                                                                                              |
| has an `info.json`                                                                                                        | does **not** have an `info.json`                                                                                                                                                                                                                                                                                             |
| has a subfolder `archives` or `tweaks` at the top level                                                                   | <p>contains any of the folders<br>- <code>archive</code><br>- <code>bin</code><br>- <code>r6</code><br>with files nested under them</p>                                                                                                                                                                                      |
| Is packed with one level of nesting (`info.json` is in top level folder)                                                  | Has multiple levels of nesting                                                                                                                                                                                                                                                                                               |
| <p><strong>Manual install instructions:</strong> <br>Extract the folder ModName into <code>Cyberpunk 2077/mods</code></p> | <p><strong>Manual install instructions:</strong> <br><strong>T</strong>he folders <code>archive</code>, <code>bin</code>, <code>r6</code> from the download must merge with the same folders in your <a href="the-cyberpunk-2077-game-directory.md">game directory</a> (do <strong>not</strong> put the bin in the bin).</p> |

#### What's the difference?

All REDmods mods will be **preloaded** by `redMod.exe` before the game starts up. After a short delay, the mods will then be loaded as if they were part of the game itself — you're saving the startup delay on every savegame load.

On top of this, Vortex will let you define load order for REDmods. To support compatibility, it offers you automatic conversion.

<details>

<summary>That sounds awesome, why isn't it everywhere?!</summary>

**Compatibility issues**

REDmod was CDPR's attempt to standardize mod loading, but there were various compatibility issues with it, and it never quite took off. As of today (April 2024), the project is pretty much dead in the water.

**Load order**

REDmods are loaded after everything else, so that format is simply not an option for e.g. body mods.&#x20;

**Vortex autoconvert**

In theory, Vortex can automatically convert legacy mods to REDmod. In practice, that didn't help with any of the compatibility issues mentioned before, and caused some of them.

</details>

### Mod format: a collection of loose files

Some mods (especially older ones) are just a loose collection of files without any folder structure:

<figure><img src="../../.gitbook/assets/installing-other.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
To find out how to install, you have to read the **mod's install instructions**.&#x20;
{% endhint %}

#### Mod folders by file extension

As a rule of thumb, here's which files go where (unless the mod's instructions tell you otherwise):

<table><thead><tr><th width="200"></th><th></th></tr></thead><tbody><tr><td>.<code>archive</code> </td><td><code>/archive/pc/mod/</code></td></tr><tr><td><code>.xl</code><br><code>.archive.xl</code></td><td><code>/archive/pc/mod/</code></td></tr><tr><td><code>.reds</code></td><td><code>/r6/scripts/</code></td></tr><tr><td><code>.tweak</code><br><code>.yaml</code></td><td><code>/r6/tweaks/</code></td></tr><tr><td><code>.lua</code></td><td>a subfolder of <code>/bin/x64/plugins/cyber_engine_tweaks/</code></td></tr><tr><td><code>.ini</code></td><td><code>engine/config/platform/pc</code></td></tr></tbody></table>

## Troubleshooting

If you have problems with Vortex, check the [corresponding section](getting-started/vortex-mod-manager.md) of the guide.&#x20;

For everything else, this wiki has a dedicated [troubleshooting page](../user-guide-troubleshooting/) with step-by-step instructions for pretty much every common problem. If that doesn't cut it, you're welcome to find us on [Discord](https://discord.gg/redmodding) in the **#mod-troubleshooting** channel (but your first answer will be a link to that guide).
