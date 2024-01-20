---
description: If it's not working as expected
---

# WKit Blender Plugin: Troubleshooting

#### Summary

**Published:** Jan 20 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Jan 20 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page contains troubleshooting options for the [.](./ "mention"). If you can't solve your problem with these steps, feel free to reach out on [Discord](http://discord.gg/redmodding) in the `#blender-add-on` channelhi

{% hint style="info" %}
The first thing people on Discord will tell you is to read this page, so you might as well get it out of the way.
{% endhint %}

## General Troubleshooting

### 1. Make sure that you are on the correct Blender version

The plugin requires **at least** 3.6, if not 4.

You can see the exact Blender version in the lower right corner of the program:

<figure><img src="../../../.gitbook/assets/blender_version.png" alt=""><figcaption></figcaption></figure>

### 2. Make sure that you are on the latest plugin version

1. Open the preferences from the menu (Edit -> Preferences)
2. Switch to the `AddOns` tab in the bar on the left
3. In the filter field at the top right of the list, search for `cyberpunk`
4. Expand the entry and find the `Version` field

<figure><img src="../../../.gitbook/assets/blender_plugin_check_version.png" alt=""><figcaption></figcaption></figure>

5. Check on [**github**](https://github.com/WolvenKit/Cyberpunk-Blender-add-on/releases) that this is the last available version of the plugin.&#x20;
6. If it's not, you need to update. [Uninstall ](installing-the-wolvenkit-blender-plugin.md#step-0-uninstall-the-old-version)the old version, then [install](installing-the-wolvenkit-blender-plugin.md#step-1-install-the-plugin) the most recent plugin.

## Failed to import materials

{% hint style="info" %}
Please complete the steps in [#general-troubleshooting](wkit-blender-plugin-troubleshooting.md#general-troubleshooting "mention") first!
{% endhint %}

### Make sure that your Wolvenkit is up-to-date

You need the [latest stable release](https://github.com/WolvenKit/Wolvenkit/releases) ([install guide](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/getting-started/download#downloading-wolvenkit)).

{% hint style="success" %}
After updating Wolvenkit, make sure to re-export your .mesh with materials!
{% endhint %}

### Make sure that your Depot is not outdated

The plugin needs your Wolvenkit Depot to a) exist and b) be more or less recent.&#x20;

If you aren't sure how old your depot is or if you have one at all, it might be time to regenerate:

1. In the [Wolvenkit Settings](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/settings), find the [Depot Path](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/settings#depot-path)
   1. If it's not set, set it now
   2. If it's set: Open the folder in Windows Explorer and delete everything there.
2. Follow the instructions on the Wolvenkit wiki to [create a partial depot](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/create-depot#steps-partial-depot).

{% hint style="success" %}
After regenerating your depot, make sure to re-export your .mesh with materials!
{% endhint %}
