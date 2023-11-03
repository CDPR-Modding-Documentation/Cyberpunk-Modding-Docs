# 🔍 Analysing other mods

This guide will walk you through **analysing or extracting archive files** from tutorial resources or other mods.

### Required: [WolvenKit](https://github.com/WolvenKit/WolvenKit/releases)

{% hint style="warning" %}
Please keep in mind that you are looking at somebody else's work. **Always credit** if you use anything from other peoples' mods, unless it's explicitly stated that you don't have to!
{% endhint %}

{% hint style="danger" %}
Some modders don't want their mods to be unbundled. Most people don't mind if you do it for your own personal use, but you should seek permission and respect their decision.
{% endhint %}

For a documentation on how to use Wolvenkit CLI, see [here](../modding-guides/analysing-other-mods/legacy-analysing-other-mods-with-wolvenkit-console.md). Unless you have a very good reason to use the console, you probably don't want to.

{% hint style="success" %}
If you want to **edit** files, you need a [Wolvenkit Project](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects). If you don't know how to make one, you can check [r-and-r-your-own-wolvenkit-project.md](../modding-guides/items-equipment/recolours-and-refits/r-and-r-your-own-wolvenkit-project.md "mention")
{% endhint %}

### Step 1: Switch to mod browser

<figure><img src="../../.gitbook/assets/view_mods_with_wkit.png" alt=""><figcaption><p>Switch to "Mod browser"</p></figcaption></figure>

You can now add the content to your project just like you do it with game files:

### Step 2: Find the correct files

{% hint style="info" %}
You can check [Wolvenkit Search: Finding files](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files "mention") for how to find and filter everything.
{% endhint %}

The folders in the mod browser correspond to the names of the .archive files you have installed.&#x20;

E.g., To find all `.mlsetup` (colour definition) files inside the [Netrunning Suits mod](../modding-guides/items-equipment/recolours-and-refits/), search for:

```
archive:ArchiveXL_Netrunner > .mlsetup
```

If you want all mesh files from the [Custom T-Shirt Mod](../modding-guides/items-equipment/adding-new-items/), search for

```
archive:my_tshirt > .mesh
```

f you want to know more, you can read up on [Wolvenkit's search](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files).

### Step 3: Add the files to your project

Select the file that you want to add by checking the box. Then right-click on it, and click on the `Add selected items to project` option.

<figure><img src="../../.gitbook/assets/browsing_mods_add_to_project.png" alt=""><figcaption><p>Add items to project</p></figcaption></figure>



That's it! You now have the file in your mod project and can start editing.
