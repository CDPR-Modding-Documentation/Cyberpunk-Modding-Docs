---
description: The tool of your choice for editing multilayered materials
---

# MLSETUP Builder

### Summary

**Published:** ??? by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Dec 20 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will teach you how to download and configure **MLSetupBuilder**, the tool of choice to edit multilayered materials in Cyberpunk.&#x20;

At the bottom of the page, you will find [#video-guides](./#video-guides "mention"). Keep in mind that they are outdated.

{% hint style="info" %}
MLSB <= 1.6.8 <mark style="color:red;">does</mark> <mark style="color:red;"></mark><mark style="color:red;">**not**</mark> <mark style="color:red;"></mark><mark style="color:red;">include a full material preview</mark>. The 3d view will only show you which parts of a mesh are affected by your material. If you want to preview a material in colour, you'll have to do this in Blender — use the [wolvenkit-blender-io-suite](../wolvenkit-blender-io-suite/ "mention")'s [mesh import](../wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#meshes).
{% endhint %}

### Wait, that's not what I want!

* To learn more about [multilayered](../../materials/multilayered/ "mention"), check the link
* To create your own mlmask, check [custom-multilayermasks.md](../../../modding-guides/textures-and-luts/custom-multilayermasks.md "mention")
* To create your own normal map, check [self-made-normal-maps](../../../modding-guides/textures-and-luts/self-made-normal-maps/ "mention")

## Introduction: What is MLSB?

**MLSetupBuilder** (commonly referred to as "MLSB") is a Cyberpunk 2077 modding tool to comfortably edit MLSetup files, developed and maintained by Neurolinked.

{% embed url="https://github.com/Neurolinked/MlsetupBuilder/releases/" %}

There is a dedicated channel on the [Redmodding Discord](https://discord.com/channels/717692382849663036/1082772930892664943) and a thread on the [Cyberpunk 2077 Modding Discord Server](https://discord.com/channels/705931815109656596/939510887188947014), where you can find a chat history full of (yet) undocumented features, along with previews and videos of the most recent development versions.

## Installation

For integration with Wolvenkit, install MLSB as a plugin:&#x20;

<figure><img src="../../../.gitbook/assets/installing_MLSB.png" alt=""><figcaption></figcaption></figure>

1. Click on "Home" in Wolvenkit's title bar
2. Select "Plugins" in the left sidebar
3. If MLSB is installed, you'll see an "Update" button, otherwise, it will say "Install". \
   Do that.

<details>

<summary>Manual install</summary>

If the above doesn't work for you, you can install MLSB by hand:

1. download the latest release from [Neurolinked's github ](https://github.com/Neurolinked/MlsetupBuilder/releases)
2. extract the downloaded zip to the following subfolder in your [Cyberpunk game directory](../../../for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/) (create it if it doesn't exist):  \
   `Cyberpunk 2077\tools\neurolinked\mlsetupbuilder`
3. The directory should now have a folder called `MLsetupBuilder-VERSION` that contains (among other things) the file `MLSetupBuilder.exe`
4. The total path should look like this:\
   `Cyberpunk 2077\tools\neurolinked\mlsetupbuilder\MLSetupBuilder-1.2.3\MLSetupBuilder.exe`

</details>



We will now launch MLSB and do the initial setup.

1. In Wolvenkit's Plugin view, click "Open", this will open a Windows Explorer with the install folder (`Cyberpunk 2077\tools\neurolinked\mlsetupbuilder`)
2. Navigate to the folder with the higest version (at the time of this guide, that is `MlsetupBuilder-1.6.8-Beta6`)
3. Start `MlsetupBuilder.exe`
4. **Optional:** You can pin that file to your start menu or create a shortcut if you want to launch MLSB directly.
5. Now, complete the[#configuration](./#configuration "mention") section. Don't worry, it's not hard!

## Usage

{% hint style="info" %}
To make the most of MLSB's features, you will want to [configure](./#configuration) it first. However, you can start using the tool right away.&#x20;
{% endhint %}

Here's how (or scroll down for the screenshot):

1. In the project explorer under Wolvenkit's `archive` folder, right-click on am `mlsetup` file\
   &#xNAN;_&#x54;his folder will only be visible in the "source" or "archive" tab of your_ [_project explorer_](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer)
2. Select  "[Convert to JSON](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export/import-export-as-json#export-as-json)"
3. This will generate an `mlsetup.json` file in your project's [`raw` folder](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer).\
   &#xNAN;_&#x54;his folder will only be visible in the "source" or "raw" tab of your project explorer_
4. Right-click on the newly created `mlsetup.json` file&#x20;
5. Select "Open in MLSetupBuilder"

<figure><img src="../../../.gitbook/assets/mlsb_exporting_file.png" alt=""><figcaption></figcaption></figure>

### Using MLSB

As of Version 1.6.7, this is what you will see now:

<figure><img src="../../../.gitbook/assets/MLSB_ui.png" alt=""><figcaption></figcaption></figure>

Start by importing the file from the preview. That will populate the Layer Config box with the MLSetup that you just loaded.

The preview was hiding an empty 3d viewport. To [use that](./#about-that-3d-viewport), you will need to [configure](./#configuration) MLSB first, but you can already click through the individual layers and assign [material properties](broken-reference) (such as roughness, normal strength, base material and colour) from the "Material Properties" panel.&#x20;

{% hint style="info" %}
Don't forget to hit "Apply" after you have changed a material.
{% endhint %}

Once you're done:

* select File -> Export&#x20;
* overwrite the original `mlsetup.json`
* switch back to Wolvenkit
* in the "`raw`" folder, right-click on your file
* select "Import/Convert from JSON"

Congratulations — you now have an `.mlsetup`! If you pack your mod and launch the game, you should now see your changes.

### Functions

There are 3 important functions to note:

1. Materials: this manages the tiles, opacity, offset, and roughness of the texture.&#x20;

<figure><img src="../../../.gitbook/assets/Screenshot 2024-03-12 180851.png" alt=""><figcaption></figcaption></figure>

2. Color: this manages color and luminosity of the texture.

<figure><img src="../../../.gitbook/assets/Screenshot 2024-03-12 180915.png" alt=""><figcaption></figcaption></figure>

2. µblend: this manages the pattern and acts as a secondary, tiled normal map. Additionally, the `contrast` value can be used to block out parts of the layer to create patterns.

{% hint style="danger" %}
You can only use microblends if this layer's mask is not fully white.
{% endhint %}

<figure><img src="../../../.gitbook/assets/Screenshot 2024-03-12 180957.png" alt=""><figcaption></figcaption></figure>

**Note**

{% hint style="info" %}
After any edits, make sure to **Apply** edits to save progress and complete changes to any/all functions (Hotkey: `Ctrl+Shift+A`)
{% endhint %}

<figure><img src="../../../.gitbook/assets/image_2024-03-12_182402209.png" alt=""><figcaption><p>WARNING symbol tells you that any have not been applied</p></figcaption></figure>

### Layers

Each and every layer is attached to its own Multilayer layer when converted from .json to .mlsetup. When adding new layers, ensure designating intended functions for each layer as part of the larger Multilayer inside WolvenKit.

<figure><img src="../../../.gitbook/assets/image_2024-03-12_183823291.png" alt=""><figcaption><p>Viewing example of the .mlsetup inside of WKit</p></figcaption></figure>

### About That 3d Viewport

This is where you can load models from the game for a direct preview which layer will affect which parts: simply click on the "Library" button.

#### MLSB Library

<figure><img src="../../../.gitbook/assets/mlsb_library_tab.png" alt=""><figcaption></figcaption></figure>

Here, you can either browse to your model directly, or use text search:

<figure><img src="../../../.gitbook/assets/mlsb_library.png" alt=""><figcaption></figcaption></figure>

After selecting a model, you can close the library browser again. Now selecting a layer will show you directly which parts of the mesh it corresponds to.

<figure><img src="../../../.gitbook/assets/mlsb_ui.png" alt=""><figcaption></figcaption></figure>

That's it! Happy recoloring!

### Other Tools inside MLSB

<figure><img src="../../../.gitbook/assets/additionalTool (1).png" alt=""><figcaption><p>List of tools inside MLSB</p></figcaption></figure>

Inside MLSB there are some other tools, the most important one is the Material Composer.

<figure><img src="../../../.gitbook/assets/materialComposer.png" alt=""><figcaption><p>Material Composer window</p></figcaption></figure>

From this window you can import and export <mark style="color:yellow;">.Material.json</mark> files ( these files are exported by <mark style="color:red;">Wolvenkit</mark> with the <mark style="color:red;">WithMaterial</mark> option). You can edit the materials parameters, adding material or removing them from the material file.\
Material templates found in the .Material.json file can be put in the Library and then used later for another edit of materials of a completely different mesh.\
You can duplicate entries just changing the name of the material and putting them in the buffer again (that's what i did to have 10 different material colors that comes for the glass material of the <mark style="color:yellow;">Kendachi Monokatana</mark> mod).\
Material Composer will also display all the material parameters that comes with the material template (materials baked by the CDPR system have their parameters hidden if they were left as default before the baking of the release).

## Configuration

When you start MLSB the first time, it will yell at you that it is not configured correctly.&#x20;

1. Click No (You'll regret it), because we need to download the CLI first.

### Downloading the right CLI

As of 1.6.8, MLSB needs to use a certain version of the Wolvenkit Command Line Interface. Fortunately, it can download it for you:

1. Click on `Help`
2. Click on `Download Wolvenkit.CLI`
3. Save the file in your download folder
4. Extract the files to a folder of your choice (for example `C:\Cyberpunk2077Mod\MLSB_WolvenKit.CLI)`

**Now** we can configure it.

### MLSB: Settings

1. Click `File`
2. Click `Preferences`
3. You will now see the settings dialogue:

<figure><img src="../../../.gitbook/assets/image (548).png" alt=""><figcaption></figcaption></figure>

* Game folder is [the-cyberpunk-2077-game-directory](../../../for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/ "mention")
* Uncook folder / Depot is the folder you have configured in [Wolvenkit's Settings](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/settings#depot-path)
* `Wolvenkit-CLI.exe` is the one you just downloaded

### Building the depot

{% hint style="success" %}
With version 1.68, this is completely optional an you can just [use MLSB](./#using-mlsb). Every time you click on a mesh, MLSB will ask you to uncook it. The step below will do everything at once, but can take some time.

Consider [#building-the-microblend-depot](./#building-the-microblend-depot "mention")for better material previews, though!
{% endhint %}

1. Open the menu "Build" and select "Repository" to uncook the archives:

<figure><img src="../../../.gitbook/assets/image (113).png" alt=""><figcaption></figcaption></figure>

2. Pick what you want to uncook. Especially the environments can take over an hour, so we're only doing the essentials here:&#x20;

<figure><img src="../../../.gitbook/assets/mlsb_uncook.png" alt=""><figcaption></figcaption></figure>

3. Click "**Uncook**".&#x20;
4. **Wait**. Do not interact with the program in any way until the process has finished - especially interacting with the console might just freeze up the entire windows cmd process. This is not MLSB's fault, but due to a Windows standard implementation. There can be a bunch of errors, ignore them.

{% hint style="danger" %}
This process can take some time — if you have selected everything, it can be several hours on slow machines. (You should've listened during step 1, choomba ;))
{% endhint %}

5. When the process is complete, close the Depot Generator window.&#x20;
6. Optional: if you can't see any changes, press `Ctrl+R` to relaod MLSB.

### Building the Microblend Depot

1. Repeat Step 1 from [#building-the-depot](./#building-the-depot "mention"), but select **Microblends** this time
2. In the bottom left corner, hit "Start"
3. Wait.
4. When the process is complete, close the Depot Generator window.&#x20;
5. Optional: if you can't see any changes, press `Ctrl+R` to relaod MLSB.

That's it, you're done now and can use the [3d viewport](./#about-that-3d-viewport)!

## Troubleshooting

### Generic troubleshooting

Close MLSB, then open `%APPDATA%\Mlsetupbuilder\config.json` in a text editor and decrement the version by one (e.g. `1.6.8` => `1.6.7`). This will force MLSB to re-check its settings.

Alternatively, you can also delete the file and reconfigure.

### Generating microblends: \[ 0: Error ] - Please fill in an output path

For MLSB <= 1.6.7, you have to use the exact CLI version you find under `Help` -> `Download Wolvenkit.CLI`

### There's an exception when generating my depot!&#x20;

Does the progress bar still move? If yes, then you're good - ignore this.

If not, you haven't left your fingers off MLSB and need to start over. Click "Uncook", then go afk until it's done.

If that doesn't help either, it's worth trying Wolvenkit Console's latest [Nightly](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases).&#x20;

## Video Guides

{% hint style="danger" %}
Please keep in mind that these guides are seriously outdated. If things don't look as expected, check this guide, which is much more up-to-date, or find help on Discord (link in [#introduction-what-is-mlsb](./#introduction-what-is-mlsb "mention"))
{% endhint %}

{% embed url="https://www.youtube.com/watch?v=uCOHjMPvpgc" %}
Credits to EzioMavericks for the video
{% endembed %}

{% embed url="https://www.youtube.com/watch?list=PLViyQUe4oow0l-amhDzneys9nzJxyH64n&v=vpT_crK5K1M" %}
[A playlist by the original author](https://www.youtube.com/playlist?list=PLViyQUe4oow0l-amhDzneys9nzJxyH64n)
{% endembed %}
