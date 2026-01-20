---
description: The game just updated, and you're crashing. Now what?
---

# Users: Troubleshooting after a game update

## Summary

**Last documented update:** January 20th, 2026 by [minnierylands](https://app.gitbook.com/u/VSIYzNHUyRPaBCk2ExHhQzpPfo82 "mention")

Who doesn't know it? Your modded game is working, then there's an update, and from one moment to the next everything is a smoking crater. Unfortunately, that's normal: as long as you're living on earth, things fall down when you let go of them, and game updates break mods.

This page will give you a brief overview on what you can do in the situation described above by linking to the corresponding sections of the [troubleshooting guide](./).

{% hint style="warning" %}
If you are on Linux and have exhausted these options, make sure to double-check the [launch options](../users-modding-cyberpunk-2077/modding-on-linux.md), as Steam sometimes resets these between updates.
{% endhint %}

***

## What can I do?

The first step is to update your core frameworks. Check every mod on [this page](../../for-mod-creators-theory/core-mods-explained/) — make sure that you have a version from **after the update**.

### There are no framework updates!

You're too fast, choomba: modders haven't gotten around to updating the frameworks yet. That leaves you with two options:

* [Remove all mods](./#removing-all-your-mods) and play vanilla until the updates arrive
* [Downgrade your game](../users-modding-cyberpunk-2077/users-downgrading-preventing-auto-updates.md#downgrading)

***

### I updated my frameworks, but the game is still crashing!

{% hint style="info" %}
You can try to temporarily disable any mod from the **script section** of[ known problem children](./#finding-the-broken-mod-known-problem-children). Sometimes, that fixes your issues.
{% endhint %}

Your game and the core frameworks need to be **version-compatible**. You can make sure of that by

1. [Resetting your install](./#removing-all-your-mods)
2. [One by one, installing all of the frameworks you need](../../for-mod-creators-theory/core-mods-explained/#tl-dr-what-do-i-download)
3. Restoring your mods from the backup. [You can check here to see where each type of mod lives.](../users-modding-cyberpunk-2077/#overview-of-mod-folders)

{% hint style="success" %}
Make sure to follow the instructions carefully – they will prevent you from running into a bunch of other issues.
{% endhint %}

***

## What other options do I have?

If these instructions didn't help you, there probably are no updates yet and you'll just have to wait. You can find warnings about version mismatches in [these log files](finding-and-reading-log-files.md#a-list-of-framework-logfiles).

Of course, you can always

* Look around in the [troubleshooting guide](./) or use your browser's search function there (Ctrl+F and type)
* Check a [list of known problem children](./#finding-the-broken-mod-known-problem-children) and disable them for now
* [Further troubleshoot](./#the-game-doesnt-launch) your installation
* Reset your installation:
  * [Fall back to a clean state](./#removing-all-your-mods)
  * Enable all [core mods](../../for-mod-creators-theory/core-mods-explained/#tl-dr-what-do-i-download) and make sure that the game starts
  * Re-enable your other mods ([check the bisect guide for how to do it fastest](./#bisecting))
* Find help on [Discord ](https://discord.gg/redmodding)in #mod-troubleshooting

{% hint style="warning" %}
You might want to **deactivate ReShade** before you start debugging. Especially after DLSS, it has been known to cause crashes.

Likewise, you'll want to **turn off your antivirus** to rule it out as a problem source.
{% endhint %}
