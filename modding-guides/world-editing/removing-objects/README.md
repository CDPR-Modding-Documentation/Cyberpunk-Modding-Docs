---
description: >-
  This page contains general information on what techniques and tools one can
  choose when wanting to remove nodes
icon: trash-can
---

# Removing Objects

{% hint style="success" %}
The terms `Object` and `Node` will be used interchangeably in most guides, Node is just the more general description of _something_ that is part of the game world
{% endhint %}

## Tool Assisted

{% hint style="warning" %}
It is extremely recommended to use Removal Editor or VS2077 (Depending on the job) to remove nodes from the world as it is easier to use, easier to update and maintain and faster than doing it manually.
{% endhint %}

* [Removal Editor](https://github.com/justarandomguyintheinternet/CP77_removalEditor) (Documentations can be found on the GitHub page)
  * Best if you want to manually choose what to remove, but don't want to worry about any further steps (Such as creating a .xl file yourself)
* [VS2077](https://github.com/notaspirit/VolumetricSelection2077)
  * Best if you want to delete everything (With filters) within a certain area / volume
* Generating the .xl file via Blender, see [#blender-and-archivexl](./#blender-and-archivexl "mention")

## Manually

* While it is not recommended anymore to use the manual method, it can be helpful to understand how the removing actually works, as no matter the tool and process, removing nodes uses the same [underlying technique](https://github.com/psiberx/cp2077-archive-xl)

