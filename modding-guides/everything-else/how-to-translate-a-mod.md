---
description: >-
  This is a basic step by step guide (with images) aimed to help you to start
  and upload a Translation Mod.
cover: ../../.gitbook/assets/translation.png
coverY: 0
layout:
  cover:
    visible: true
    size: full
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: true
---

# How to Translate a Mod

## Summary

Published: 19 Mar 2024 by [iwasniko](https://app.gitbook.com/u/2YqtOa5pIqh3hmxj7vpeWFgLCmr1 "mention")\
Last documented edit: 25 May 2024 by Vanaukas

This guide will teach you how to add translation files for existing mods.&#x20;

***

{% hint style="info" %}
The following section will focus on Text Translation. This section was created by Vanaukas.
{% endhint %}

## Requirements

For this guide, you need to install the following requirements:

* [Wolvenkit](https://github.com/WolvenKit/WolvenKit/releases/)
* Any text editor ([Visual Studio Code](https://code.visualstudio.com/download) or [Notepad++](https://notepad-plus-plus.org/downloads/) are recommended)
* [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl/releases)
* [RED4ext](https://github.com/WopsS/RED4ext/releases)
* The mod you want to translate
* A [Wolvenkit Project](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#create-a-new-wolvenkit-mod-project)

***

There is no one way to do translations to existing Mods, but I am going to show two ways to do it in this guide:

* [If the author provided a `.json.json` resource](how-to-translate-a-mod.md#if-the-author-provided-a-.json.json-resource)
* [Extracting the Localization File from a `.archive` mod](how-to-translate-a-mod.md#extracting-the-localization-file-from-a-.archive-mod)

For the purposes of this guide, I will use my mod as example. The file names and file structure used aren't mandatory, but as general rule avoid using symbols in your file/folder names besides `-` and `_`.&#x20;

***

## Useful Tips for this guide

### Internal naming convention for supported languages

Internally, supported languages are stored into folders with acronyms related to each supported language. It should like this:

<figure><img src="https://i.imgur.com/MGqTLAO.png" alt=""><figcaption><p>You can see this folder tree inside Assets Browser.</p></figcaption></figure>

Each acronym corresponds to the following languages:

* `ar-ar`: Arabic (العربية)
* `cz-cz`: Czech (čeština)
* `de-de`: German (Deutsch)
* `en-us`: English (English)
* `es-es`: Spanish (Español)
* `es-mx`: Latin American Spanish (Español latinoamericano)
* `fr-fr`: French (Français)
* `hu-hu`: Hungarian (Magyar)
* `it-it`: Italian (Italiano)
* `jp-jp`: Japanese (日本語)
* `kr-kr`: Korean (한국어)
* `pl-pl`: Polish (Polski)
* `pt-br`: Brazilian Portuguese (Português do Brasil)
* `ru-ru`: Russian (Русский)
* `th-th`: Thai (ไทย)
* `tr-tr`: Turkish (Türkçe)
* `ua-ua`: Ukrainian (Українська)
* `zh-cn`: Simplified Chinese (简体中文)
* `zh-tw`: Traditional Chinese (繁體中文)

This list will be helpful later to setup the **ArchiveXL** files to properly add your translation (don't worry, is properly explained too).

### Code nomenclature for text formatting

Cyberpunk uses some kind of `XML` + `json` text formatting. The following are just a few of the most commonly used codes for text formatting:

* `\n`

This is used for line breaks. You can't use `Enter` to do line breaks, or your whole text won't be recognized. You can use several `\n` for bigger line breaks if you need it. This rule is the same for `.json.json` files and `.json` files (don't worry, both file extensions are explained later).

* `<Rich color="TooltipText.cyberwareDescriptionHighlightColor" style="Semi-Bold">YOUR WORD</>`

This is used to mark in Orange some words, as it can be seen on the following example:

<figure><img src="https://i.imgur.com/Qp4Htm5.png" alt=""><figcaption></figcaption></figure>

It's important that you respect the format of the text of the Mod that you are translating, so as not to deviate from the author's original **intention of emphasis**.

***

## Starting the Translation

## If the author provided a `.json.json` resource

Install all the previously mentioned requirements and download the `.json.json` file from the mod page. Create a **Wolvenkit** project.

### Step One: Importing `.json.json` to your project&#x20;

Open the project, hover over `raw` folder in `Project Explorer` and click on the yellow icon to open the `raw` folder on `Windows Explorer:`

<figure><img src="https://i.imgur.com/vKJ4VO9.png" alt=""><figcaption></figcaption></figure>

On `Windows Explorer`, move the already downloaded `.json.json` file over `raw` and make some folder to hold it. For this example I'll call that folder `localization` and inside this folder, I'm going to create another folder related to the language I want to use.&#x20;

For this example, I'll make two folders: `es-es` and `es-mx`, because they are fairly similar and also my main language and then I'll copy and paste the same `.json.json` in both folders. This is how it'll look inside **Wolvenkit**:

<figure><img src="https://i.imgur.com/UBsTDe6.png" alt=""><figcaption><p>Remember that the names are an example.</p></figcaption></figure>

#### I**mport the `.json.json` file to your project**

Do a `Right Click` on the `.json.json` file and select `Convert from JSON`:

<figure><img src="https://i.imgur.com/ljtzY3F.png" alt=""><figcaption></figcaption></figure>

Do the same for all files you need to import. After importing, Project Explorer should look like this:

<figure><img src="https://i.imgur.com/5mEHj5b.png" alt=""><figcaption><p>Remember that the names are an example.</p></figcaption></figure>

### Step Two: Translating the mod

You can choose two ways of translating that `.json.json` file:

#### 1) T**ranslating the `.json.json` file on a text editor before importing**

You can do this when the `.json.json` file is already decompiled (this is why it has two `.json` extensions, because it was exported from a Wolvenkit compiled `.json`). It should look like this:

<figure><img src="https://i.imgur.com/r1FnTi6.png" alt=""><figcaption><p>DON'T CHANGE THE INDENTATION OR THE FILE WILL BE BROKEN.</p></figcaption></figure>

This method is a little harder to read and prone to errors, but some people may find it comfortable. You need to import the `.json.json` file **AFTER doing the translation** on this case, that way you'll be importing your already translated file.

Is important to remember that you can't use `Enter` to do line breaks or your file will break. Use `\n` instead.

#### 2) T**ranslating the `.json` file in Wolvenkit after importing**

A file with `.json` extension (only one extension) is already compiled and not able to be opened on a text editor, but it can be opened in Wolvenkit. This method is somewhat easier to read because the `XML` text formatting won't be decompiled, allowing for better readability.&#x20;

Let's see how a `.json` file looks inside **Wolvenkit**:

<figure><img src="https://i.imgur.com/jJRewQB.png" alt=""><figcaption><p>Don't worry, onscreens.json in the base game files is way more  bigger than this</p></figcaption></figure>

Each numbered entry is one specific `LocKey` (_**Loc**alization **Key**_) and they can hold item names, item descriptions, ability descriptions and anything that can be read on items.

Inside each entry, you'll find the following parameters:

* `femaleVariant`: This is the default field for any text, for some reason. You can write here names, descriptions, etc.
* `maleVariant`: Used for some specific cases if a gender based variant exist (clothing, for example).
* `primaryKey`: This is how the entry is called inside the game. Uses numbers. Is recommended to keep on `0` to avoid unintended collisions with in-game texts or other mods.
* `secondaryKey`: This is also how an entry can be named internally and is recommended to use this field instead `primaryKey`, because it can hold characters and some symbols. Try to use descriptive names related to your mod and where are you going to use the entry inside your mod.

This is how a single entry will look inside **Wolvenkit**:

<figure><img src="https://i.imgur.com/PM941gj.png" alt=""><figcaption><p>Always try to use descriptive <code>secondaryKey</code> names to avoid PEBCAK errors</p></figcaption></figure>

Please, keep in mind that you can't use `Enter` to do line breaks or your text will break. Use `\n` instead.

This is how a heavy text entry looks like:

<figure><img src="https://i.imgur.com/I8BrY8z.png" alt=""><figcaption><p>Yeah...</p></figcaption></figure>

All that text is one single big line. **Always** keep in mind this.

### Step Three: Final touches and Packing your Translation mod

After doing the translation with either method, you need to create an ArchiveXL file to merge your `.json` files with the rest of the game translations. This process is really quick and easy, thanks to psiberx tools.

#### 1) Generate a new ArchiveXL file

Click on New File in **Wolvenkit:**

<figure><img src="https://i.imgur.com/vIM2jhm.png" alt=""><figcaption></figcaption></figure>

Select `ArchiveXL` and then `ArchiveXL file`. Change the generated name to the same as your mod (not mandatory, just to have both files together after installation), but preserve the extensions `.archive.xl`. Following this example, the resulting name will be `RaitoLabs-ES.archive.xl`. Click on `Create`.

<figure><img src="https://i.imgur.com/ijLEBhJ.png" alt=""><figcaption></figcaption></figure>

#### 2) Fill your ArchiveXL file

After clicking `Create`, your file should open automatically in your main text editor (in my case, **VSCode**).&#x20;

The following code structure should be used to fill your ArchiveXL file:

```
localization:
  extend: THE_ARCHIVEXL_MOD_YOU_WANT_TO_TRANSLATE
  onscreens:
    Language_Acronym: File_Path_To_Your_JSON
```

* `localization` tells the system that you are adding text.
* `extend` needs to be pointing to the `.archive.xl` of the mod you want to translate. **ArchiveXL** will take the contents and automatically merge them seamlessly, this way you _**don't have to overwrite any file from the mod you are translating**_, providing flexibility and maximum compatibility.
* `onscreens` tells the system the type of text you are adding.
* `Language_Acronym` is related to how supported languages are called internally. [I've provided a list earlier with all the supported languages](how-to-translate-a-mod.md#internal-naming-convention-for-supported-languages). On this example, will be `es-es` and `es-mx`.
* `File_Path_To_Your_JSON`, as the name implies, should be the file path to your translated `.json` file. The easiest way to not make a mistake is using **Wolvenkit** to get that file path:\
  \
  Do a `Right Click` on your `.json` file and select `Copy relative path to game file`. Then paste the contents in your **ArchiveXL** file.

<figure><img src="https://i.imgur.com/MmjaUAE.png" alt=""><figcaption></figcaption></figure>

This is how the code should look on this example:

```
localization:
  extend: RaitoLabs.archive.xl
  onscreens:
    es-es: localization\es-es\RaitoLoc.json
    es-mx: localization\es-mx\RaitoLoc.json
```

Is important that you keep the indentation as shown in the code examples. It's also extremely important that you use `backslash` (`\`) instead regular `slash` (`/`) for the file path if you do it manually.

#### Packing your mod

**Wolvenkit** will pack your mod with a one click press. You can also install your files for yourself to test them and see if your changes are properly working.&#x20;

Click on `Pack mod` to create a ready to upload zip file and `Install mod` to install it in your game files.

<figure><img src="https://i.imgur.com/femLPY6.png" alt=""><figcaption></figcaption></figure>

And, finally, your translation file is ready to be tested or distributed. This is how the files should look once installed:

<figure><img src="https://i.imgur.com/Fih9eo4.png" alt=""><figcaption><p>Using a similar mod name to the one you are translating will keep them near and look nice.</p></figcaption></figure>

Your packed file will have the proper file path ready to be extracted directly on the main game folder (and also compatible with Mod Managers). This packed file will be located in your Project main folder:

<figure><img src="https://i.imgur.com/8rB49gb.png" alt=""><figcaption><p>It's over... Or isn't?</p></figcaption></figure>

***

## Extracting the Localization File from a `.archive` mod

Install all the previously mentioned requirements and download the mod you want to translate (if you haven't already). Create a **Wolvenkit** project.

Open your project, once loaded open the `Assets Browser`. Once open, click on `Mod Browser`:

<figure><img src="https://i.imgur.com/yBwnJU8.png" alt=""><figcaption></figcaption></figure>

When you click on `Mod Browser`, your system may get frozen for a few seconds, depending on how many `.archive` mods you have in your system. Once loaded, look up for the mod you want to translate:

<figure><img src="https://i.imgur.com/y3Sz2tp.png" alt=""><figcaption></figcaption></figure>

Open the internal folders until you find the Localization File you want to extract:

<figure><img src="https://i.imgur.com/LFJu41p.png" alt=""><figcaption></figcaption></figure>

Once found, do a `Right Click` and select `Add selected items to project`:

<figure><img src="https://i.imgur.com/maWThif.png" alt=""><figcaption></figcaption></figure>

As the name implies, you now have the `.json` Localization file in your project:

<figure><img src="https://i.imgur.com/52ySICq.png" alt=""><figcaption></figcaption></figure>

To avoid conflicts with the Mod you are translating, let's change the file path to a new one.

Hover over `archive` folder and click on the yellow icon to open it on `Windows Explorer`:

<figure><img src="https://i.imgur.com/NH28r3P.png" alt=""><figcaption></figcaption></figure>

Inside `Windows Explorer`, create some new folder. For this example, I'm going to make one called `localization`, and inside that folder I'll create two folders called `es-es` and `es-mx`, to follow the [internal naming convention for supported languages](how-to-translate-a-mod.md#internal-naming-convention-for-supported-languages).

Once the folders are created, on `Windows Explorer`, I'll copy and paste the `.json` file into the `es-es` and `es-mx` folder. This is how it'll look on **Wolvenkit** once it's done:

<figure><img src="https://i.imgur.com/mu5VkGL.png" alt=""><figcaption></figcaption></figure>

Now you can remove the original extracted folders and extracted `.json` file to avoid the conflicts with the Mod you are translating. Hover over `base` (on this example), and click on the red icon with the trashcan to `Delete this file/folder`:

<figure><img src="https://i.imgur.com/C1iTjbH.png" alt=""><figcaption></figcaption></figure>

After deleting the folders, this is how your project will look, ready to be translated:

<figure><img src="https://i.imgur.com/jCNkdTX.png" alt=""><figcaption></figcaption></figure>

You can read [this part of the tutorial to get more insights on translating a .json file on Wolvenkit](how-to-translate-a-mod.md#id-2-translating-the-.json-file-in-wolvenkit-after-importing).

After finishing your translation, you are ready to do the [mandatory final steps to pack it or/and install it in your system](how-to-translate-a-mod.md#step-three-final-touches-and-packing-your-translation-mod). Be sure to include the [ArchiveXL file](how-to-translate-a-mod.md#id-1-generate-a-new-archivexl-file) or your translation won't work.

I hope that this guide was helpful. Good luck in your text translations!

{% hint style="info" %}
Soon I'll include the steps on how to upload it correctly to Nexus, so the Mod you are translating gets a beautiful flag and your mod automatically listed under the Translation segment.
{% endhint %}

***

***

{% hint style="info" %}
The following section needs to be updated with more info. This section was created by [iwasniko](https://app.gitbook.com/u/2YqtOa5pIqh3hmxj7vpeWFgLCmr1 "mention")
{% endhint %}

## Translating audio files

Most mods will be using in-game files for this. You'll run into one of two cases:

### Prerequisites

You need a Wolvenkit Project with the relevant files from the original mod:&#x20;

* `.wem` for audio translations

For how to get there, see [analysing-other-mods](../analysing-other-mods/ "mention")

#### The files are linked

The mod is only "pointing" at the original game files, and they're loaded from the player's local copy and will be in whatever language they're running.&#x20;

{% hint style="warning" %}
TODO: Which file(s) defines those? If there is no original mod author and the mod links to in-game files, how can we [custompath](../items-equipment/custompathing-assets.md) them?
{% endhint %}

If you want to translate them anyway, you need to **add the audio files** from your translated version to your Wolvenkit project and send them to the original mod's author.

#### The files are included

{% hint style="info" %}
You can listen to audio files by simply selecting them in the Wolvenkit Project Browser and using the built-in audio player. See [Audio files](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-cli/usage/video-and-audio-files-cli#audio-files "mention") on the Wolvenkit wiki for a screenshot.
{% endhint %}

Assuming that the original mod author did not rename the files, this makes it easier for you.

1. [search Wolvenkit](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) with each file name
2. Add the file to your Wolvenkit project
3. Overwrite the original file

When you pack your mod now, it will use the translated files. If it doesn't, make sure to check your load order.

<details>

<summary>The files were all re-named, how do I find them?</summary>

You'l have no choice but to find the right file from hand in the sources, which means you have to [search Wolvenkit](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) for the extension `.wem`.

To filter the files by quest, use [reference-quest-ids.md](../../for-mod-creators-theory/references-lists-and-overviews/reference-quest-ids.md "mention") and filter the folder names by quest ID. If you don't know which quest a line belongs to, you might be lucky and find it per search (Hotkey: `Ctrl+F`) on the [Cyberpunk Transcript](https://arasakas-ronin.netlify.app/).

</details>
