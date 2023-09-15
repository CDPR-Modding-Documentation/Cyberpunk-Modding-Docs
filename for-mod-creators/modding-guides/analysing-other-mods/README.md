# 🔍 Analysing other mods

**Created by @manavortex**&#x20;

**Published December 11 2022**

This guide will walk you through **extracting archive files** from other modders.

#### Required: [WolvenKit](https://github.com/WolvenKit/WolvenKit/releases) <a href="#required-wolvenkit" id="required-wolvenkit"></a>

{% hint style="warning" %}
Please keep in mind that you are looking at somebody else's work. **Always credit** if you use anything from other peoples' mods!
{% endhint %}

{% hint style="danger" %}
Some modders don't want their mods to be unbundled. Most people don't mind if you do it for your own personal use, but you should seek permission and respect their decision.
{% endhint %}

For a documentation on how to use Wolvenkit CLI, see [here](broken-reference). Unless you have a very good reason to use the console, you probably don't want to.

### Step 1: Switch to mod browser

<figure><img src="../../../.gitbook/assets/view_mods_with_wkit.png" alt=""><figcaption><p>Switch to "Mod browser"</p></figcaption></figure>

You can now add the content to your project just like you do it with game files:

### Step 2: Find the correct files

The folders in the mod browser correspond to the names of the .archive files you have installed.&#x20;

E.g., To find all mesh files inside the [Netrunning Suits mod](broken-reference), search for:

```
archive:ArchiveXL_Netrunner > .mesh
```

If you want to know more, you can read up on [Wolvenkit's search](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files).

### Step 3: Add the files to your project

<figure><img src="../../../.gitbook/assets/browsing_mods_add_to_project.png" alt=""><figcaption><p>Add items to project</p></figcaption></figure>



That's it!
