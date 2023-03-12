---
description: Only update once all frameworks are stable!
---

# Users: Preventing auto-updates

{% hint style="info" %}
Things fall down when you let go of them, and mods break whenever a game updates. That is due to [framework compatibility](../../modding-know-how/frameworks/).&#x20;

**Always make sure that your framework mods are up-to-date.**

You should generally wait with updating to the latest game version until all mods are up-to-date. If it's too late for that, you can try [downgrading](users-preventing-auto-updates.md#downgrading) Cyberpunk, or wait until the frameworks update.
{% endhint %}

## Preventing the game from auto-updating

### GOG

In GOG, this is a global setting — you can only disable auto-update for all of your games.

Open the settings and select the entry `Game features` in the sidebar, then uncheck the box for `Auto-update games`.

<figure><img src="../../.gitbook/assets/gog-auto-update.png" alt=""><figcaption></figcaption></figure>

### Epic

In the EPIC launcher, this is a global setting — you can only disable auto-update for all of your games.&#x20;

Open the settings menu and scroll down to `MANAGE GAMES`, then disable auto-updates.

<figure><img src="../../.gitbook/assets/epic-auto-update.png" alt=""><figcaption></figcaption></figure>

### Steam

Unlike the competition, Steam will not give you any control about auto-updating. For that reason, you need to forbid it from writing to a specific file on disk, without which it will be literally unable to update. Here's how:

1. Find the `steamapps` folder (:&#x20;
   1. Right-click on Cyberpunk 2077 in your Steam Library and select **`Properties`**
   2. On the side bar, click on **`Local Files`**
   3. Select **`Browse`**. This will take you to Cyberpunk's install directory, which is **inside** the folder we want (e.g. `C:\Steam\steamapps\common\Cyberpunk 2077`)
   4. Navigate two levels up
2. Find the file `appmanifest_1091500.acf`
3. Set the file to read-only:
   1. Right-click on the file and select Properties
   2. At the bottom of the dialogue, check the Read-only box

&#x20;![](<../../.gitbook/assets/image (2).png>)&#x20;

{% hint style="info" %}
As long as Steam can't write to this file, it can't update Cyberpunk. Once you are ready to update, simply uncheck the Read-only checkbox again.

Don't forget to deactivate it again later!
{% endhint %}

## Downgrading

### GOG

1. [Disable auto-updates](users-preventing-auto-updates.md#gog)
2. Head to the Cyberpunk game detail page
3. Find the settings button next to the Play button
4. Select `Manage Installation` -> `Configure…`
5. Select the game version

<figure><img src="../../.gitbook/assets/gog-select-game-version.png" alt=""><figcaption></figcaption></figure>

### Epic

Sorry, choomba, you're fucked. No downgrading possible.

### Steam

Steam also doesn't support downgrading, but you can try [this workaround](https://www.makeuseof.com/how-to-downgrade-steam-games/). If this doesn't work, see the downgrade instructions for [Epic](users-preventing-auto-updates.md#epic-1).
