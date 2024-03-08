---
description: How to run scripts in Blender
---

# Blender: Running Python Scripts

## Summary

**Published**: Feb 08 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented edit**: Feb 08 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will show you how to run Python scripts in Blender. It's not strictly speaking part of the Blender plugin, but I had to put this somewhere, and it's least out of place here.&#x20;

## The Scripting perspective

To run scripts, you need to switch to the scripting perspective. Click the corresponding entry on the perspective toolbar at the very top:&#x20;

<figure><img src="../../../../.gitbook/assets/blender_scripting_perspective (1).png" alt=""><figcaption></figcaption></figure>

The script panel looks like this:

<figure><img src="../../../../.gitbook/assets/blender_script_panel_overview.png" alt=""><figcaption></figcaption></figure>

## Running a script

1. Click on the "New Text" button to create a new document: ![](../../../../.gitbook/assets/blender\_new\_button)
2. Click into the `Text Editor` panel directly below it
3. **Paste** the contents of whatever script you want to run (Hotkey: `Ctrl+V`)
4. Hit the Play button above the editor panel to run the script (Hotkey: `Alt+P`)
5. **Optional:** Look at the Python Console below the 3d viewport to see feedback

## Troubleshooting

If your script doesn't work, Blender will have generated an [**exception**](#user-content-fn-1)[^1]. To look at it, toggle Blender's System Console:

<figure><img src="../../../../.gitbook/assets/blender_show_system_console.png" alt=""><figcaption></figcaption></figure>

Copy the contents of the console window, or pull it as big as your screen allows and take a screenshot. Give this information to the Netrunner who told you to run the script and watch as they fix it.

If you don't have a Netrunner (or if you _are_ that person), this is where you hit up Google or [ChatGPT](https://rollbar.com/blog/how-to-debug-code-using-chatgpt/) (you can skip the steps 1-5 in the linked guide).&#x20;

{% hint style="danger" %}
While you have text selected in the Blender System console, your Blender will be completely unresponsive.
{% endhint %}

[^1]: The technical term for "thing go brr". Give it to a Netrunner and he can use it to fix things.

