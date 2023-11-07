---
description: Modding your game, for users
---

# ❔ Using Mods

{% content-ref url="../user-guide-troubleshooting/" %}
[user-guide-troubleshooting](../user-guide-troubleshooting/)
{% endcontent-ref %}

{% hint style="info" %}
This page contains instructions on **installing** mods. If you want to **create** mods instead, check [here](../../for-mod-creators/modding-guides/).
{% endhint %}

{% hint style="success" %}
If this doesn't cover your needs, maybe check out our more detailed guides:

* [Installing Cyberpunk](getting-started/)
* [Installing mods via Vortex](getting-started/vortex-mod-manager.md)

If you want to learn more about the frameworks, you can check the [core-mods-explained](../../for-mod-creators/core-mods-explained/ "mention") page.
{% endhint %}

## How to install mods

{% hint style="danger" %}
**TL;DR:** Your mods will not work unless you

* make sure all files end up in the right folders
* make sure to install all [requirements](../user-guide-troubleshooting/requirements-explained.md) (and their requirements)
* [enable REDmod](./#installing-and-activating-redmod)

When you fuck things up, hit up [#troubleshooting](./#troubleshooting "mention") or run [mod remover](https://www.nexusmods.com/cyberpunk2077/mods/8597/) and start over.

To see an [#overview-of-mod-folders](./#overview-of-mod-folders "mention"), scroll down.
{% endhint %}

## How do I mod?

You mod **Cyberpunk 2077** by adding files to your **game directory**. There is no need to overwrite base game files, since the game natively supports modding.&#x20;

{% hint style="success" %}
The **game directory** is the toplevel folder of your game install.&#x20;

Unless you changed the default settings, it will be installed to:

**STEAM**\
`C:\Program Files (x86)\Steam\steamapps\common\Cyberpunk 2077\`

**GOG**\
`C:\Program Files (x86)\GOG Galaxy\Games\Cyberpunk 2077\`
{% endhint %}

You can install mods by hand, by using [Vortex](https://www.nexusmods.com/about/vortex/), or by using Mod Organizer 2 with additional steps detailed [here.](https://github.com/JustThatKing/MO2077/blob/main/readme.md)

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

Although Cyberpunk natively supports modding, this out-of-the-box support is limited in what it lets modders do. To allow greater freedom, a number of **frameworks** have been created to allow e.g. adding items, influencing the weather, or add flying cars.

{% hint style="warning" %}
Since this kind of mod interacts with the game's executable (`.exe`), they will break every time CDPR updates. This is the reason why game updates break mods — we recommend to [**turn off auto-update**](users-downgrading-preventing-auto-updates.md) and manually upgrading once the frameworks you need have been brought up-to-date. To learn more about this, check [core-mods-explained](../../for-mod-creators/core-mods-explained/ "mention").
{% endhint %}

### Overview of mod folders

{% hint style="info" %}
TL;DR: you can ignore this unless you want to understand how things work.
{% endhint %}

This list is supposed to give you an overview of which files go where. It is **not** a bucket list of things you have to install.

To learn more about the individual frameworks, check [core-mods-explained](../../for-mod-creators/core-mods-explained/ "mention")

<table><thead><tr><th width="256">Directory</th><th>explanation</th></tr></thead><tbody><tr><td>\<code>mods</code></td><td><a data-mention href="../../for-mod-creators/core-mods-explained/redmod/">redmod</a> directory: contains .archive mods (in subfolders)</td></tr><tr><td>\<code>archive\pc\mod</code></td><td>Legacy directory: contains .archive mods and .xl files</td></tr><tr><td>\<code>bin\x64\plugins</code></td><td>Plugins like Cyber Engine Tweaks</td></tr><tr><td><code>\r6\scripts</code></td><td>Redscript mods (<strong>not</strong> the same as REDmod)</td></tr><tr><td><code>\r6\tweaks</code></td><td>red4ext tweaks</td></tr></tbody></table>

```markup
- archive
  - pc
    - mod          << .archive files from non-REDmods go here
- bin
  - x64
    - plugins      << Cyber Engine Tweaks goes here
- mods             << REDmods go here
- r6               << redscript folder
- tools            << Folder for modders. Also, REDmod DLC lives here.
```

## Installing and activating REDmod

If REDmod is not installed and activated, your mods in `/mods` will not load.&#x20;

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

As a rule of thumb, a REDmod is **a different way of packaging the files**, which will cause it to be loaded into the games by a different mechanism. Here is how you can tell the two apart:

| REDmod                                                                                                                    | Vanilla mod (packed correctly)                                                                                                                                                                                  |
| ------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <p></p><p><img src="../../.gitbook/assets/installing-redmod-preview.png" alt="" data-size="original"></p>                 | <p></p><p><img src="../../.gitbook/assets/installing-gift-wrapping.png" alt="" data-size="original"></p>                                                                                                        |
| is in a folder named after the mod                                                                                        | might be inside an extra folder                                                                                                                                                                                 |
| has an `info.json`                                                                                                        | —                                                                                                                                                                                                               |
| has a subfolder `archives` or `tweaks` at the top level                                                                   | <p>contains any of the folders<br>- <code>archive</code><br>- <code>bin</code><br>- <code>r6</code><br>with files nested under them</p>                                                                         |
| Is packed with one level of nesting (`info.json` is in top level folder)                                                  | Has multiple levels of nesting                                                                                                                                                                                  |
| <p><strong>Manual install instructions:</strong> <br>Extract the folder ModName into <code>Cyberpunk 2077/mods</code></p> | <p><strong>Manual install instructions:</strong> <br>Merge the folders <code>archive</code>, <code>bin</code>, <code>r6</code> into the folders with the same names directly in <code>Cyberpunk 2077</code></p> |

### Mod format: a collection of loose files

Some mods (especially older ones) are just a loose collection of files without any folder structure:

<figure><img src="../../.gitbook/assets/installing-other.png" alt=""><figcaption></figcaption></figure>

In this case, it's up to you and the **mod's install instructions** to put the files into the right game folders.&#x20;

As a rule of thumb: unless specified otherwise,&#x20;

* `archive` files go into `/archive/pc/mod/`
* `.xl` files go into `/archive/pc/mod/`
* `.reds` files go into `/r6/scripts/`
* `.tweak` or `.yaml` files go into `/r6/tweaks/`
* .`lua` files go into a subfolder of `/bin/x64/plugins/cyber_engine_tweaks/`

## Troubleshooting

If you have problems with Vortex, check the [corresponding section](getting-started/vortex-mod-manager.md) of the guide.&#x20;

For everything else, this wiki has a dedicated [troubleshooting page](../user-guide-troubleshooting/) with step-by-step instructions for pretty much every common problem. If that doesn't cut it, you're welcome to find us on [Discord](https://discord.gg/redmodding) in the #mod-troubleshooting channel (but your first answer will be a link to that guide).
