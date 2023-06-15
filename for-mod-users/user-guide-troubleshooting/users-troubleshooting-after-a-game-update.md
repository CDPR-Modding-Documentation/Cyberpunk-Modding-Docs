---
description: The game just updated, and you're crashing. Now what?
---

# Users: Troubleshooting after a game update

## Overview

Who doesn't know it? Your modded game is working, then there's an update, and from one moment to the next everything is a smoking crater. Unfortunately, that's normal: as long as you're living on earth, things fall down when you let go of them, and game updates break mods.&#x20;

This page will give you a brief overview on what you can do in the situation described above by linking to the corresponding sections of the [troubleshooting guide](./).

## What can I do?

The first step is to update your core frameworks. Check every mod on [this page](../../for-mod-creators/core-mods-explained/) — make sure that you have a version from **after the update**.

### There are no framework updates!

You're too fast, choomba: modders haven't gotten around to updating the frameworks yet. That leaves you with two options:

* [remove all mods](users-troubleshooting-after-a-game-update.md#i-have-another-problem-that-isnt-on-this-list) and play vanilla until the updates arrive
* [downgrade your game](../users-modding-cyberpunk-2077/users-downgrading-preventing-auto-updates.md#downgrading)

### I updated my frameworks, but the game is still crashing!

{% hint style="info" %}
You can try to temporarily disable any mod from the **script section** of[ known problem children](./#finding-the-broken-mod-known-problem-children). Sometimes, that fixes your issues.
{% endhint %}

Your game and the core frameworks need to be **version-compatible**. You can make sure of that by

1. [resetting your install](./#is-there-a-shortcut)
2. One by one, [installing all of the frameworks you need](./#a-fresh-install-starting-from-scratch)
3. [Restoring your mods from the backup](./#adding-back-your-mods)

{% hint style="success" %}
Make sure to follow the instructions carefully – they will prevent you from running into a bunch of other issues.&#x20;
{% endhint %}

## What other options do I have?

If these instructions didn't help you, there probably are no updates yet and you'll just have to wait. You can find warnings about version mismatches in [these log files](finding-and-reading-log-files.md#a-list-of-framework-logfiles).

Of course, you can always

* Find help on [Discord ](https://discord.gg/redmodding)in #mod-troubleshooting
* look around in the [troubleshooting guide](./) or use your browser's search function there (Ctrl+F and type)
* check a [list of known problem children](./#finding-the-broken-mod-known-problem-children) and disable them for now
* [further troubleshoot](./#game-doesnt-start-there-is-an-error-arbout-scripts) your installation
* Reset your installation:
  * Fall back to a clean state ([precise](./#is-there-a-shortcut) | [nuclear: fast](./#the-nuclear-option-a-clean-install) | [nuclear: very fast](./#modular-minimal-download-download-less-than-1gb))
  * Enable all [core mods](users-troubleshooting-after-a-game-update.md#starting-from-scratch) and make sure that the game starts
  * Re-enable your other mods (check [bisect](users-troubleshooting-after-a-game-update.md#finding-the-broken-mod-bisecting) for how to do it fastest)

{% hint style="warning" %}
You might want to **deactivate ReShade** before you start debugging. Especially after DLSS, it has been known to cause crashes.

Likewise, you'll want to **turn off your antivirus** to rule it out as a problem source.
{% endhint %}
