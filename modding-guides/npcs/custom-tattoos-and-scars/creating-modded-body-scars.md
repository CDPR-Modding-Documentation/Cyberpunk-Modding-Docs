---
description: This guide will teach you how to create scars on modded body KS_UV and VTK
---

# How to create modded body scars

## **Summary**

**Published**: Feb 29 2024 by Yggnire, initial guide by Yggnire\
**Last documented edit**: June 15 2024 by LadyLea

### Level of difficulty

**The ability to read**: mandatory, because I'm not gonna lie — this is gonna be difficult otherwise.\
**Knowing how to use a drawing software** : recommended, because this guide will not cover it.

#### Expected time to complete

<5 minutes to set up everything\
5 minutes - s long as it takes you to create a scar that you like\
<5 minutes for the import/install

_<mark style="color:red;">**If you want to know how to make scars, I advise you to take a look at the tutorial**</mark>_ ["How to make a scar (tips for drawing)](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators/modding-guides/npcs/custom-tattoos-and-scars/how-to-make-a-scar-tips-for-drawing)

## Prerequisites

* [ ] You have [Wolvenkit installed](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/getting-started/download)
* [ ] A drawing software like Clip Paint Studio, Photoshop or [photopea.com](https://www.photopea.com/)
* [ ] Some time and patience to create scars

## Step 1 : Settings up

### 1.1 Create a [Wolvenkit project](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects) and give it a name&#x20;

KS\_UV project name should be `005_modname`

VTK project name should be `000_modname`

### 1.2 Add the correct files

1. Head to the [overlay-list.md](converting-between-tattoo-frameworks/overlay-list.md "mention") page and find the correct files for your framework (VTK or KSUV).&#x20;

{% hint style="info" %}
For a scar, you need a **diffuse, normal,** and **roughness map.**
{% endhint %}

2. Find them by navigating the [Wolvenkit Asset Browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser) to the path, or by using the [search](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files)
3. Add them to your project by double-clicking on the entries in the Asset Browser
4. Use the [Export Tool](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/tools/tools-import-export#export-tool) to export them
5. In your Project Explorer's [Raw view](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#raw), find the png files and click on the folder icon next to one to show them in Windows Explorer.&#x20;
6. Save the files in a new folder.
7. Open all of them on a drawing software like  photoshop, clip studio paint or [photopea.com](https://www.photopea.com/)

## Step 2 : Scar creation

This part is explained in this tuto :  [How to make a scar (tips for drawing)](how-to-make-a-scar-tips-for-drawing.md)



## Step 3 : Replacing and Importing

Check the corresponding step-by-step instructions here:\
&#x20;[how-to-create-an-overlay-tattoo.md](how-to-create-an-overlay-tattoo.md "mention") -> [#id-5-reimporting-the-texture](how-to-create-an-overlay-tattoo.md#id-5-reimporting-the-texture "mention")&#x20;

Do this for all of the files. If you install the mod, you should now be able to see your new scar!
