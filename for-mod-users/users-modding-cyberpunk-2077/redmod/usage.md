# REDMod: Usage

REDmod is a command line tool developed by CDPR and Yigsoft which can be used to stage installed mods to work with a modded game.

{% hint style="info" %}
This section is for managing mods with Redmod. For creating mods, see [modding-guides](../../../for-mod-creators/modding-guides/ "mention")
{% endhint %}

## Why would I want this?

REDmod **preloads** any mods on its list, loading them as if they were a part of the game's regular structure. Preloading requires the game to be started via launcher (or Vortex) and will add a short delay, but the loading times during gameplay will be much faster.

#### Why is that not the default?

* Compatibility: Not all mods can be easily converted. Some outright break in the process.
* Especially modders don't like the extra delay during startup
* While the mods are precompiled, a console window will be visible. This scares many users.

## Using Mods

The game loads redmods from this path: `<Cyberpunk 2077>/mods/<name>`.

> EXAMPLE:\
> REDMod: `C:\GoG\Cyberpunk 2077\mods\<name>\archives\<name>.archive`\
> `Legacy: C:\GoG\Cyberpunk 2077\archive\PC\mod\<name>.archive`

{% hint style="info" %}
Legacy archive mods in `<Cyberpunk 2077>/archive/pc/mod` are still supported, but their load order cannot be managed with REDmod.

Legacy mods will load **before** any redmods.
{% endhint %}

{% hint style="success" %}
Before being able to play a modded game, you need to [**deploy**](usage.md#how-do-i-deploy) your installed mods.

Then, you need to [activate mods](usage.md#activating-mods) before starting the game.
{% endhint %}

#### How do I deploy?

You can handle deployment and load order with

* the **REDlauncher** that comes with the game
* **Vortex** Mod Manager from NexusMods
* REDmod WolvenKit integration and manage your mods easily from within the **WolvenKit Mod Manager**
* starting Cyberpunk with the parameter `-modded`

#### What is deployed?

|                                        |                                      |
| -------------------------------------- | ------------------------------------ |
| Scripts: Compiled into a script blob   | \<Cyberpunk 2077>/mods//scripts      |
| Tweaks: Compiled into a modded tweakDB | \<Cyberpunk 2077>/mods//tweaks       |
| Sound files                            | \<Cyberpunk 2077>/mods//customSounds |

## Activating mods

### **GOG Galaxy**

* Open GOG - _Cyberpunk 2077_
* Click **Manage Installation** -> **Configure ...**
* Open the **Features** Tab
* Select **Enable mods**
* Click **OK**
* Play the game
* A window will open showing progress on mod deployment.

<figure><img src="../../../.gitbook/assets/redmod_gog.png" alt=""><figcaption></figcaption></figure>

### **Steam** and **Epic**

* Navigate to _Cyberpunk 2077_
* Click **Play**
* Click the **Settings** button and **Enable mods**
* Click **Play** (Do not skip this)
* A window will open showing progress on mod deployment.

<figure><img src="../../../.gitbook/assets/gog_prelauncher.png" alt=""><figcaption></figcaption></figure>

## Conflicts and Load Order

Conflicts are handled on a per-file basis, but can be handled by specifying a specific _load order_. The rules here are the opposite of e.g. Skyrim: **the first mod** to change a file wins.

**Example:**&#x20;

**modA** contains a script file \
`Cyberpunk 2077\mods\modA\scripts\cyberpunk\player\player.script`.\
**modB** contains a script file with the same name:\
`Cyberpunk 2077\mods\modB\scripts\cyberpunk\player\player.script`

This will discard all changes **modB** made, since by default, REDmod and the game loads mods alphabetically (modA overrides changes in modB).

However, you can specify a load order with REDmod, which the game will respect.

## Troubleshooting

If a REDmod is giving you trouble, you can force a redeploy by either of the following means:

1. Either of
   1. Delete the content of `r6/cache/modded` in your Cyberpunk directory\
      or
   2. Uninstall the mod
   3. Start the game
   4. As soon as it launches, close the game again
   5. Reinstall the mod
2. Now, restart the game. REDMod will rebuild the cache and hopefully fix your problem.&#x20;

If that doesn't do it, you can consult the [troubleshooting guide](usage.md#troubleshooting) for advice.

## Advanced Topics

### Deploying Mods - Automatically

REDMod's redeploy is triggered on either of these changes:

* **mods change**: You added or removed a mod
* A mod's **version** changes: The version number in the `info.json` was changed.
* A mod's **files** change: You added or removed archives

### Deploying Mods - Manually

The REDmod `deploy` command stages installed mods to work when the game starts with the `modded` flag.

### Deploying Mods - WolvenKit Integration

* Open the WolvenKit Mod Manager.
* Click the _Deploy Mods_ button in the toolbar.

You will see all installed mods in your game. Enable the mods you would like to play with.

### Handling Conflicts - Manually

You can specify a specific load order with the **-mod** parameter:

```
redmod deploy -root="C:\Gog\Cyberpunk 2077" -mod=modB,modA,modC
```

This will override changes to `\cyberpunk\player\player.script` that **modA** makes in favor of **modB**. It will also tell the game to load **modB** before **modA** and **modC**.

### Handling Conflicts - WolvenKit integration

* Open the WolvenKit Mod Manager.
* Adjust the load order by dragging and dropping rows.
* Click the _Deploy Mods_ button.

You can adjust the load order by dragging and dropping the installed mods inside the mod manager.

When you click the _Deploy Mods_ button, the current load order will be forwarded to redmod.exe and mods will be deployed and loaded in this order.

### Starting a Modded Game - Manually

To start a modded game that loads mods deployed by REDmod use the `-modded` flag on **Cyberpunk2077.exe**

**Example:**

```
Cyberpunk2077.exe -modded
```

This however will skip the initialization process that should be done after any new REDmod mod install.

> INFO The executable is located at `<Cyberpunk 2077>\bin\x64\Cyberpunk2077.exe`
