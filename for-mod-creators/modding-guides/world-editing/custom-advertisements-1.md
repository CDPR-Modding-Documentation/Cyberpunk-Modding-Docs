---
description: How to make your own custom ads
---

# Custom advertisements

#### Summary

**Published:** February 04 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented edit:** February 04 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

{% hint style="danger" %}
This page is a **stub** for now while I set up the file structure and upload the [WKit project](../../../\_example\_mods\_and\_templates/world/advertising/ad\_replacers\_full\_\_wolvenkit\_source.zip).
{% endhint %}

{% hint style="info" %}
If you need to do this right now, check [xlipstream's guide on Nexus](https://www.nexusmods.com/cyberpunk2077/mods/6756).
{% endhint %}

## Step 0: Create a Wolvenkit project

1. Create a [Wolvenkit project](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#create-a-new-wolvenkit-mod-project) for your mod.&#x20;
2. Download the Wolvenkit template project from [github](../../../\_example\_mods\_and\_templates/world/advertising/ad\_replacers\_full\_\_wolvenkit\_source.zip). Download the zip file to your computer:

<figure><img src="../../../.gitbook/assets/download_from_github.png" alt=""><figcaption></figcaption></figure>

3. The  zip file you downloaded contains a folder named `source`. Extract it into the root directopry of your Wolvenkit project from step 1 so that it merges with the existing folder.

## Step 1: Edit the `.png` files

In your project's [raw folder](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#raw), you will find 200+ `.png` files — pretty much every ad in the game.&#x20;

{% hint style="info" %}
That's probably a lot more files than you wanted, but the first version of this guide only has the all-in-one package. Maybe we'll split off additional templates later. For now, leave everything as it is because we'll delete the non-modified files in step 2.
{% endhint %}

Use your image editor of choice (or [photopea](https://www.photopea.com/)) to edit the files that you want to see in the game.

{% hint style="warning" %}
When editing textures, please keep in mind that you need to export transparency as an alpha mask. See [images-importing-editing-exporting.md](../textures-and-luts/images-importing-editing-exporting.md "mention") for details.
{% endhint %}

After you are done editing, use the [Import Tool](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/tools/tools-import-export#import-tool) to import all the files.&#x20;

## Step 2: Delete those files you don't want

In your Wolvenkit project's [archive tab](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#archive), delete those files that you don't want to include in your mod. This step is important, because files can only changed by one mod at a time, and you don't want to piss in the public water supply by simply leaving them in.

When you have done the clean-up, you can now [install your mod](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/menu/toolbar#install-and-launch) and start the game to see your new ads in-game.

## Step 3: Publishing

If you want to post your mod on Nexus, you might want to do two things:

* link back to this guide
* Add [this mod](https://www.nexusmods.com/cyberpunk2077/mods/12790) as a requirement

Happy modding, choom!

