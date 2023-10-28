---
description: How to remove items from the world with ArchiveXL
---

# World Editing: deleting objects

## Summary

**Created by @manavortex** \
**Published in October 2023**

This guide will show you how to remove items from the world via ArchiveXL.

Difficulty: You know how to read

#### Requirements

[wolvenkit-blender-io-suite](../../modding-tools/wolvenkit-blender-io-suite/ "mention") >= 1.5.0

[ArchiveXL ](https://www.nexusmods.com/cyberpunk2077/mods/4198)>= 1.8.0

## Prerequisites: Deleting the objects

1. Hit up [editing-locations-in-blender.md](editing-locations-in-blender.md "mention") and follow the instructions to import your sectors into Blender.
2. **Select** and **delete** the objects that you want to get rid of.&#x20;

Now it's time to get exporting.

## Adjust the sector collections' properties

{% hint style="info" %}
This step will be made obsolete in a future update of the [wolvenkit-blender-io-suite](../../modding-tools/wolvenkit-blender-io-suite/ "mention") (currently 1.5.0). The guide will tell you at which point you can skip ahead if that's the case.
{% endhint %}

<details>

<summary>Why do we need this?</summary>

ArchiveXL deletes nodes from the sector files **by numeric index** - it doesn't know if `node #123` is a rotten banana peel or Adam Smasher. Checking the number of nodes is a security feature; if your mod is trying to alter a sector with a different number of items than the one you are expecting, it will **break**.&#x20;

</details>

1. In the Scene Collection (usually at the top right of your Blender viewport), select a sector collection.

<figure><img src="../../../.gitbook/assets/editing_locations_selecting_sector.png" alt=""><figcaption></figcaption></figure>

2.  Below the viewport in the right side panel, switch to the `Collections` tab and expand the `Custom Properties` header. You need a property with the name of `expectedNodes` (green box). \
    If you have one, you can proceed to [#generating-an-.xl-file](world-editing-deleting-objects.md#generating-an-.xl-file "mention"). \
    If you don't have one, keep reading.

    <figure><img src="../../../.gitbook/assets/editing_locations_expected_nodes.png" alt=""><figcaption></figcaption></figure>

First, you need to find out the number of nodes in your sector. We will do that in Wolvenkit.

3. Find the correct sector file and open it in Wolvenkit. (You can copy the name from the `filepath` field in Custom Properties — the file should be in your project from your earlier export.)
4.  In the CR2W editor, find the `nodes` property and look at the count. That number needs to go into your new property in Blender.

    <figure><img src="../../../.gitbook/assets/streamingsector_numnodes.png" alt=""><figcaption></figcaption></figure>
5. Click `New` to add a new property. It will be called prop and have a value of `1.000`.
6. Click the gear and add the property's properties:\
   \
   `Type` should be `Integer`\
   `Property Name` shoudld be `expectedNodes`\
   `Default Value`, `Min`, and `Max` should be the number of nodes from your sector file.\
   \
   After you have made those changes, click **OK**.\


<figure><img src="../../../.gitbook/assets/editing_locations_edit_properties.png" alt=""><figcaption></figcaption></figure>

7. The value of your new property will probably still be 1 until you click in the field - then it will be updated with the only value possible.
8. Repeat this step for **every sector file**.

## Generating an .xl file

1. Switch to Blender's `Scripting` perspective and create a new file.&#x20;
2. Open [**this link**](https://raw.githubusercontent.com/manavortex/cyberpunk2077/master/python/export\_sector\_deletions\_to\_xl.py) (mana's github) and copy the contents into Blender's editor.
3. Edit the value of `output_filename` — it has to be a valid path (and can even be your Cyberpunk mod directory).

{% hint style="warning" %}
Running the script **will overwrite existing files**. That's not a problem, but you need to take care of backups yourself.
{% endhint %}

<figure><img src="../../../.gitbook/assets/editing_locations_blender_scripting.png" alt=""><figcaption></figcaption></figure>

5. When you're done, click the ▶ button in the toolbar to run the script.

You now have an .xl file. If you put it into `archive/pc/mod`, the game should load it. Otherwise, check the [#troubleshooting](world-editing-deleting-objects.md#troubleshooting "mention") section of this guide.

### Double-check the file!

This step is optional, but recommended, as the script might add nodes to the deletion list that you want to keep.&#x20;

{% hint style="success" %}
This is also how you can edit other people's sector presets. Want to keep your candles? Search for "candle" and remove them from the deletion list!
{% endhint %}

1. Open the generated .xl file in a text editor such as [**Notepad++**](https://notepad-plus-plus.org/downloads/).&#x20;
2. Search for `worldEntityNode` \
   _Keyboard shortcuts to find all in document in Notepad++: `Ctrl+F` - `Alt+D`_
3. Check the comment on top of a block to find out what it is.&#x20;
4. If you want to keep something, remove the entire block from the .xl file (see screenshot).

<figure><img src="../../../.gitbook/assets/editing_locations_deleting_nodes_xl_file.png" alt=""><figcaption></figcaption></figure>

5. Put the .xl file into `archive/pc/mod` and start the game. (Don't put your Wolvenkit project, you don't need all that sector garbage!)

That's it! You changed the world - literally! Happy modding, choomba!

## Packing a Wolvenkit project

{% hint style="danger" %}
Do not pack the Wolvenkit project you used for Blender import - you don't need an .archive file
{% endhint %}

To add the .xl file to a Wolvenkit project, simply put it into the `source/resources` folder and pack. Your mod will include only text files and be really tiny - ArchiveXL does all the heavy lifting.

If your zip for Nexus contains an .archive file, you've done something wrong here!

## Troubleshooting

### &#x20;My edits aren't showing up!

Check the ArchiveXL log (you can find it in `Cyberpunk 2077\red4ext\plugins\ArchiveXL\ArchiveXL.log`).  For every block in your .xl file, you should see an entry like this:

```
[info] |Streaming| Patching "base\worlds\03_night_city\_compiled\default\quest_2467054678ccf8f6.streamingsector"...
```

#### If you don't see those entries:

* Make sure that your file&#x20;
  * has the extension `.xl`
  * is located in `archive/pc/mod` or loaded as part of a REDmod (why are you doing this to yourself? You're testing. Put it in `archive/pc/mod`!)
* Check if the syntax is valid by running it through [**yamllint**](https://www.yamllint.com/)
* Make sure that ArchiveXL is up-to-date and working

#### If you see "failed to patch" entries instead:

Check the `expectedNodes` entry inside your `.xl` file against the sector files inside Wolvenkit as per [#adjust-the-sector-collections-properties](world-editing-deleting-objects.md#adjust-the-sector-collections-properties "mention").
