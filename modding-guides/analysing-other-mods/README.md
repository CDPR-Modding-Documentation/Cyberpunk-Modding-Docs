---
description: How to open .archive files and take a look inside
---

# Analysing other mods

This guide will walk you through **analysing or extracting .archive files** from tutorial resources or other mods.

### Required: [WolvenKit](https://github.com/WolvenKit/WolvenKit/releases)

{% hint style="warning" %}
Please keep in mind that you are looking at somebody else's work. **Always credit** if you use anything from other peoples' mods, unless it's explicitly stated that you don't have to!
{% endhint %}

{% hint style="danger" %}
Some modders don't want their mods to be unbundled. Most people don't mind if you do it for your own personal use, but you should seek permission and respect their decision.
{% endhint %}

For a documentation on how to use Wolvenkit CLI, see [here](legacy-analysing-other-mods-with-wolvenkit-console.md). Unless you have a very good reason to use the console, you probably don't want to.

{% hint style="success" %}
If you want to **edit** files, you need a [Wolvenkit Project](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects). If you don't know how to make one, you can check [r-and-r-your-own-wolvenkit-project.md](../items-equipment/recolours-and-refits/r-and-r-your-own-wolvenkit-project.md "mention")
{% endhint %}

### Step 1: Switch to mod browser

Once you have [installed the mod](../../for-mod-users/users-modding-cyberpunk-2077/) or added it to your [extra mod directory](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/settings#additional-mod-directory), you can use Wolvenkit's [Mod Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser#mod-browser "mention")to browse it:

<figure><img src="../../.gitbook/assets/view_mods_with_wkit.png" alt=""><figcaption><p>Switch to "Mod browser"</p></figcaption></figure>

You can now add the content to your project like regular game files.&#x20;

If you can't (because everything is scrambled), check [#troubleshooting](./#troubleshooting "mention").

### Step 2: Find the correct files

{% hint style="info" %}
You can check [Wolvenkit Search: Finding files](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files "mention") for how to find and filter everything.
{% endhint %}

The folders in the mod browser correspond to the names of the .archive files you have installed.&#x20;

E.g., To find all `.mlsetup` (colour definition) files inside the [Netrunning Suits mod](../items-equipment/recolours-and-refits/), search for:

```
archive:ArchiveXL_Netrunner > .mlsetup
```

If you want all mesh files from the [Custom T-Shirt Mod](../items-equipment/adding-new-items/), search for

```
archive:my_tshirt > .mesh
```

f you want to know more, you can read up on [Wolvenkit's search](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files).

### Step 3: Add the files to your project

Select the file that you want to add by checking the box. Then right-click on it, and click on the `Add selected items to project` option.

<figure><img src="../../.gitbook/assets/browsing_mods_add_to_project.png" alt=""><figcaption><p>Add items to project</p></figcaption></figure>

That's it! You now have the file in your mod project and can start editing.

## Troubleshooting

### I can't add anything to my project!

Make sure that you actually have a Wolvenkit project opened (you will see the project name in the top-right corner next to the close button). Can't add files to a project if there's no project!

### Everything is scrambled / there are a bunch of .bin files

You have found a mod that is not compatible with the current hashing algorithm. Long (and sad) story short, from time to time that needs an update, and then anything packed with a different version of the algorithm won't resolve anymore.

You can try opening the `.archive` with Wolvenkit [8.9](https://github.com/WolvenKit/WolvenKit/releases/tag/8.9.0) or [8.7](https://github.com/WolvenKit/WolvenKit/releases/tag/8.7.0) - anything older will be incompatible with game versions >= 1.6.&#x20;

#### Didn't work

Some authors don't want other people to look at their files and deliberately corrupt their archives to prevent Wolvenkit from reading them. The game is a lot more robust than WKit, so these mods usually work, although side effects can't be ruled out. If none of this works, you can still look at the files and their properties in the [File Editor](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/file-editor "mention") and try to guess what's what. Other than that, you're out of luck, though.
