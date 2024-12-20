---
description: If it's not working as expected
---

# WKit Blender Plugin: Troubleshooting

#### Summary

**Published:** Jan 20 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Apr 19 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page contains troubleshooting options for the [.](./ "mention").&#x20;

If the plugin gives you error messages on export, please check [wkit-blender-plugin-error-messages.md](wkit-blender-plugin-error-messages.md "mention") instead.

If you can't solve your problem with these steps, feel free to reach out on [Discord](http://discord.gg/redmodding) in the `#blender-add-on` channel.

{% hint style="warning" %}
The first thing people on Discord will tell you is to read this page, so you might as well get it out of the way.
{% endhint %}

{% hint style="info" %}
Blender errors will show up in the system console window (View -> Toggle System Console).
{% endhint %}

## Version compatibility

{% include "../../../.gitbook/includes/wkit-blender-plugin-current-version.md" %}

### Seeing the Blender version

You can see the exact Blender version in the lower right corner of the program:

<figure><img src="../../../.gitbook/assets/blender_version.png" alt=""><figcaption></figcaption></figure>

## Seeing the plugin version

You can find the current supported version in the table above (under [#version-compatibility](wkit-blender-plugin-troubleshooting.md#version-compatibility "mention")), or check the [**github page's release section**](https://github.com/WolvenKit/Cyberpunk-Blender-add-on/releases) **.**

1. Open the preferences from the menu (Edit -> Preferences)
2. Switch to the `AddOns` tab in the bar on the left
3. In the filter field at the top right of the list, search for `cyberpunk`
4. Expand the entry and find the `Version` field

<figure><img src="../../../.gitbook/assets/blender_plugin_check_version.png" alt=""><figcaption></figcaption></figure>

## General Troubleshooting

### &#x20;Steam

If you installed Blender via Steam, stay on the **stable stream** and make sure to keep Blender up-to-date.

### Check the console output

See if Blender encountered any errors by checking the **console output**. From the menu, select `View` -> `Toggle System Console`.

{% hint style="success" %}
Our technical experts will want to see this. If you can't make sense of it via Google or ChatGPT, hit up the `#blender-add-on` channel on [Discord](http://discord.gg/redmodding).
{% endhint %}

## Failed to import materials

{% hint style="info" %}
Please complete the steps in [#general-troubleshooting](wkit-blender-plugin-troubleshooting.md#general-troubleshooting "mention") first!
{% endhint %}

### Make sure that your Wolvenkit is up-to-date

{% include "../../../.gitbook/includes/wkit-blender-plugin-current-version.md" %}

{% hint style="success" %}
After updating Wolvenkit, make sure to re-export your .mesh with materials!
{% endhint %}

### Make sure that your Depot is not outdated

The plugin needs your Wolvenkit Depot to a) exist and b) be more or less recent.

If you don't know what that is, or aren't sure how old your depot even is, it might be time to regenerate:

1. From the `Tools` menu, select the `Depot generator`
2. Click the **`Migrate Files`** button at the bottom and wait until WKit is done
3. Re-export your .mesh with materials and check if your problem goes away

If it does not, you can simply nuke the entire depot, as it will be re-generated whenever necessary:

1. From the `Tools` menu, select the `Depot generator`
2. Click the first button (`Open Depot Folder`) to open the folder in Windows Explorer
3. Delete everything there
4. Re-export your .mesh with materials
5. Your problem should be gone now
