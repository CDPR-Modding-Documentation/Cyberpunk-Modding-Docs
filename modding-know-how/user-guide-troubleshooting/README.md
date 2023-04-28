---
description: If your mods are causing trouble, here's what you can do
---

# 🆘 Users: Troubleshooting

This page contains troubleshooting information for people who are **using** mods rather than making mods. You will find step-by-step guides, grouped by different problems.

{% hint style="info" %}
Did you know?  You can us your browser's search function (Ctrl+F) to quickly find your problem on the page – simply type a word from your error message.
{% endhint %}

## Navigation

{% hint style="danger" %}
Before you start debugging, make sure that&#x20;

* your graphics driver is up-to-date
* you have the most recent version of [.NET Desktop Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-7.0.3-windows-x64-installer) installed
* you have [Visual C++ Redistributable 2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) installed ([direct download](https://aka.ms/vs/17/release/vc\_redist.x64.exe), Microsoft)
* your **antivirus** is temporarily disabled (no, really)
*   **all mods and dependencies** have the latest version, in particular the [core mods](../core-mods-explained/) ([Redscript](https://github.com/jac3km4/redscript/releases/), [Red4ext](https://github.com/WopsS/RED4ext/releases), [cybercmd](https://www.nexusmods.com/cyberpunk2077/mods/5176), [Cyber Engine Tweaks](https://github.com/yamashi/CyberEngineTweaks/releases), [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl/releases/) and [TweakXL](https://github.com/psiberx/cp2077-tweak-xl/releases/tag/v1.0.8)).

    \
    Find a download-ready collection for Vortex [here](https://next.nexusmods.com/cyberpunk2077/collections/r1flnc?tab=Mods).
{% endhint %}

This section aims to give you a quick overview. If your exact problem isn't listed here, please **look through the different sections** below and try anything that looks promising.

* [I don't wanna debug, I just want mods!](./#i-really-just-want-to-get-this-working-what-do-i-do)
* [There was a game update and now your mods aren't working](./#troubleshooting-after-an-update)
* [Your game isn't starting](./#your-game-isnt-starting-crashes-to-desktop) / [crashing on startup](./#your-game-isnt-starting-crashes-to-desktop)
  * [It's pirated](./#you-pirated-the-game)
  * [Corrupt or missing script files](./#corrupt-or-missing-script-files)
  * [Corrupted archives](./#corrupted-archives)
* [You're having crashes to desktop](./#your-game-isnt-starting-crashes-to-desktop) (but the game starts)&#x20;
* [Redscript Compilation Failed (Popup message)](./#redscript-compilation-failed)
* [Photomode screenshots are borked](./#photomode-screenshots-are-blank)
* [Press \[none\] to continue](./#press-none-to-continue)
* [You have trouble with CET (Cyber Engine Tweaks)](./#cet)
  * [You forgot your CET keybind](./#you-forgot-your-cet-keybind)
* [XML Document parsed with errors](./#xml-document-parsed-with-errors)
* [You installed a mod, but it's not doing anything ](./#mod-s-arent-loading-triggering)
* A mod is causing problems, and you have no idea which:
  * &#x20;[Known problem children](./#finding-the-broken-mod-known-problem-children)
  * Searching: [Bisect](./#finding-the-broken-mod-bisecting)
  * Searching: [Log files](../../help/users-modding-cyberpunk-2077/finding-and-reading-log-files.md)
* [Something with files or ACCESS\_VIOLATION](./#something-something-files)
* [This is a waste of time, I'm reinstalling](./#the-nuclear-option-a-clean-install)
  * [Modding a clean install](./#starting-from-scratch)&#x20;

{% hint style="success" %}
To enable REDmods, check [here](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-know-how/frameworks/redmod/usage#deploying-mods-and-starting-the-game).
{% endhint %}

## Troubleshooting after an update

As long as you're living on earth, things fall down when you let go of them, and game updates break mods.&#x20;

Given that you're currently browsing a troubleshooting guide, [updating your core frameworks](../core-mods-explained/) didn't fix the problem. You can&#x20;

* check a [list of known problem children](./#finding-the-broken-mod-known-problem-children) and disable them for now
* [look around in this guide](./#navigation) or use your browser's search function (Ctrl+F and type)
* [further troubleshoot](./#i-updated-my-frameworks-but-the-game-is-still-crashing) your installation
* Reset your installation:
  * Fall back to a clean state ([precise](./#step-1-temporarily-disable-all-your-mods) | [fast](./#modular-minimal-download-download-less-than-1gb) | [very fast](./#quick-download-less-than-4gb))
  * Enable all [core mods](./#starting-from-scratch) and make sure that the game starts
  * Re-enable your other mods (check [bisect](./#finding-the-broken-mod-bisecting) for how to do it fastest)

{% hint style="warning" %}
You might want to **deactivate ReShade** before you start debugging. Especially after DLSS, it has been known to cause crashes.

Likewise, you'll want to **turn off your antivirus** to rule it out as a problem source.
{% endhint %}

### There are no framework updates!

That's because the people maintaining them have a thing called `life`, which annoyingly gets in the way of modding. You can either [remove all mods](./#i-have-another-problem-that-isnt-on-this-list) and play vanilla until the updates arrive, or [downgrade your game](../../help/users-modding-cyberpunk-2077/users-downgrading-preventing-auto-updates.md#downgrading).

### I updated my frameworks, but the game is still crashing!

You need to complete the following steps:&#x20;

* Temporarily disable any mod from the **script section** of [known problem children](./#finding-the-broken-mod-log-files)&#x20;
* Temporarily [remove all mods](./#i-have-another-problem-that-isnt-on-this-list)
* One by one, [install all of the frameworks you need](./#starting-from-scratch)

{% hint style="success" %}
Make sure to follow the instructions carefully – they will prevent you from running into a bunch of other issues.&#x20;
{% endhint %}

## Photomode screenshots are blank

With 1.62, screenshots are now saved to `Documents\CDPR\Cyberpunk\Screenshots` , and the previous location will receive an empty file.

## Press \[none] to continue

That is due to [Input Loader](https://www.nexusmods.com/cyberpunk2077/mods/4575) requiring an update.

## Your game isn't starting / Crashes to Desktop

{% hint style="warning" %}
You might want to **deactivate ReShade** before you start debugging. Especially after DLSS, it has been known to cause crashes.
{% endhint %}

### Corrupted archives

> Cyberpunk 2077 encountered an error caused by corrupted or missing archives and and will now be forced to close. Please verify...

One of the .archive files in your folder is broken. To find out which one, try the [bisect](./#finding-the-broken-mod-bisecting) approach.

### Corrupt or missing script files

> Cyberpunk 2077 encountered an error caused by a corrupt or missing script file and will now be forced to close. Please verify...

You have a problem with Red4ext. Try the following steps:

* if you don't have red4ext/logs/red4ext.log, then RED4ext doesn't work, you have to update / fix RED4ext&#x20;
* if you have red4ext/logs/red4ext.log, then look inside, it will tell you which mods aren't compatible with the current game patch and may be the cause of this issue&#x20;
* you removed a RED4ext mod, but your scripts aren't recompiled and still refer something from removed mod, you have to fix redscript&#x20;
* you're missing scripts cache file (only possible if you manually delete it) it can't be anything else

If that doesn't solve your problems or you run into an error with script files, check [Redscript Compilation Failed](./#redscript-compilation-failed).

### Failed to initialize script data

```
Message: Failed to initialize scripts data!
File: E:\R6.Release\dev\src\common\engine\src\baseEngineInit.cpp(1019)
```

Check your NVidia panel. If power saving options are enabled, turn them off.

### Steam: verify file integrity loop

Before trying to implement any of the other solutions, configure the `REDprelauncher.exe` in the Cyberpunk root directory to always run as administrator.&#x20;

* Right-click on the file and select `Properties`
* Switch to the `Compatibility` tab
* Check the box `Run this program as an administrator`

<figure><img src="../../.gitbook/assets/troubleshooting_redprelauncher_runas_admin.png" alt=""><figcaption></figcaption></figure>

## You pirated the game

<figure><img src="https://images.unsplash.com/photo-1627569015058-3f298889045f?ixlib=rb-4.0.3&#x26;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&#x26;auto=format&#x26;fit=crop&#x26;w=2670&#x26;q=80" alt=""><figcaption><p>Creative Commons, Credit: <a href="https://unsplash.com/photos/WV9yGVpEAz8">Tom Briskey</a></p></figcaption></figure>

There's a chance of >95% that we have already found the source of your problems — **pirated copies just don't mod well**. That's the first reason why we won't help you, it's a waste of everyone's time.

The second reason is that CDPR needs to earn money to pay people to make games for us. If you can at all afford it, **please buy the game**. It's a good deal: how much are you willing to spend for a movie ticket? How long does a movie keep you entertained?

You are, of course, welcome to peruse the troubleshooting guide. It might even help you. But know that you are judged.

## Finding the broken mod: known problem children

### Stuff that isn't mods

It doesn't **have** to be either of these. But if it is, you'll never find it with the rest of the list. Rule it out by deactivating them while you're debugging.

* **Antivir**
* **ReShade**

### Frameworks / Core Mods

These mods are not problem children – quite the opposite. But if they are outdated, either your game or your mods won't work. Make sure that you [have them all up-to-date](./#step-7-install-the-core-frameworks) with the most recent game version.

### Script mods

Some mods go far beyond the ordinary, adding whole new features to the game (why no flying cars, CDPR?). Unfortunately, that means they're more prone to breaking than others. Here's a non-comprehensive list.

{% hint style="warning" %}
Being on this list does not mean that a mod is "bad" or that you shouldn't use it – they break much for the same reason as the frameworks do, and are fixed in the same way (the modder has to update). Until that happens, you will have to **disable** them.
{% endhint %}

#### [Let There Be Flight](https://www.nexusmods.com/cyberpunk2077/mods/5208) &#x20;

Adds flying cars to Cyberpunk. While this is awesome, it will **absolutely** break whenever CDPR changes anything, and requires updating.

#### [In-World Navigation](https://www.nexusmods.com/cyberpunk2077/mods/4583)

Displays in-world holographic arrows that direct you towards your quest objectives. Is very likely to break upon patches.

#### [Vehicle Combat](https://www.nexusmods.com/cyberpunk2077/mods/3815)

Adds car chases and a bunch of related features. While CP2077 needs more car chases and explosions, this usually breaks and will require an update.

#### [Mod Settings](https://www.nexusmods.com/cyberpunk2077/mods/4885)&#x20;

Adds mod settings to the in-game menu – Redscript version. This needs to be updated after **every** game patch.

#### [Native Settings UI](https://www.nexusmods.com/cyberpunk2077/mods/3518)

Adds mod settings to the in-game menu – CET version. The mod itself will be fine, but it's dependent on [Cyber Engine Tweaks](https://www.nexusmods.com/cyberpunk2077/mods/107) being up-to-date.

### spawn0

Most famous for edits of the female body that defy gravity and wreak havoc on V's spinal disks, this modder has been around since the early days, and the same is true for their mods.&#x20;

However, modding has come a long way since then, and spawn0 never followed. For that reason, their mods are known to have compatibility issues with pretty much everything in the general vicinity.&#x20;

On the bright side, their mods won't crash your game and are downwards compatible until the dawn of time.

## Finding the broken mod (log files)

Step-by-step instructions on how to search, filter, and read log files are [here](../../help/users-modding-cyberpunk-2077/finding-and-reading-log-files.md):

{% content-ref url="../../help/users-modding-cyberpunk-2077/finding-and-reading-log-files.md" %}
[finding-and-reading-log-files.md](../../help/users-modding-cyberpunk-2077/finding-and-reading-log-files.md)
{% endcontent-ref %}

#### Summary / TL;DR:

* Search the Cyberpunk root folder for `*.log`
* Look through all these files for anything that says `error`
* **If you can't find anything: you can now either**
  * [Make sure that](./#step-1-temporarily-disable-all-your-mods) your game loads with only the core frameworks enabled (especially advised after **game updates/patches**)
  * Try the [bisect](./#finding-the-broken-mod-bisecting) method
* **If you have found something:** \
  [Here](./#dealing-with-a-broken-mod) are instructions for how to troubleshoot further – they also tell you when you should ask for help!

## Finding the broken mod (bisecting)

{% hint style="info" %}
There are two directories with mods: \
`Cyberpunk 2077\mods` holds REDMods\
`Cyberpunk 2077\archive\pc\mod`  holds mods that predate the REDMod format.

\
The procedure below applies to both directories, but you should start with \\`archive\pc\mod.` If your problem is caused by a script, do the same with the CET folder.
{% endhint %}

First, go to your mod directory under

```
Cyberpunk 2077\archive\pc\mod
```

and re-name the entire directory to mod\_. Then, create a new empty folder named `mod`.

{% hint style="success" %}
Start the game. If the problem isn't gone now, you have at least ruled out vanilla mods as a source of problems. Repeat the procedure with the RedMod directory `Cyberpunk 2077\mods`.

\
If you have renamed both directories and the problem isn't gone, you have a different problem. [Check your CET scripts](./#step-2-disable-cet) or follow [these steps](./#your-game-isnt-starting).
{% endhint %}

Now, we need to roughly narrow down which mod has the error.&#x20;

Move over half of the mods from your backup folder `mod_`, then start the game.

You will now run into one of two scenarios:

1. The error is gone: swap out the content of your mod folder with the last chunk you moved to the backup folder. Validate that the error persists, go to 2.
2. The error is still there: Move half of the files from your mod folder into your backup folder and start the game and check your problem.&#x20;

Repeat this process until you have identified the problem child!

## Mod(s) aren't loading/triggering

* If you have any folders inside of `/mods`, you need to install or update [cybercmd](https://www.nexusmods.com/cyberpunk2077/mods/5176). It is required to make Redmod play nice with Red4ext.
* If you already have cybercmd installed and your mod is still not working, [check the next section](./#only-parts-of-my-mods-are-working).
* If your NPC appearance change doesn't show or your item replacer is added on top of the original item, you will want to install either [material override](https://www.nexusmods.com/cyberpunk2077/mods/5266) or [cookedapps nulled](https://www.nexusmods.com/cyberpunk2077/mods/3051). For an explanation why, see [here](../files-and-what-they-do/appearance-.app-files.md#commoncookdata).

### That wasn't it: Getting the mod to work

If you know the **type** of mod that's not working, you can check the more specific instructions for that kind of type or follow the [general troubleshooting steps](./#mod-isnt-working-general-troubleshooting):&#x20;

* [A RedMod](./#mod-isnt-working-a-redmod)
* [Cyber Engine Tweaks (CET)](./#mod-isnt-working-cet)&#x20;
  * [a CET mod or script](./#mod-isnt-working-a-cet-script)
* [An ArchiveXL mod](./#an-archivexl-tweakxl-mod)

#### Mod isn't working: General troubleshooting

Here's what you can do:

1. Check the [requirements](../../help/users-modding-cyberpunk-2077/requirements-explained.md) on the mod's nexus page. Make sure that you have installed them all and that they are up-to-date.
2. Make sure that all of your [core frameworks](./#step-7-install-the-core-frameworks) are up-to-date and starting up correctly (here's how you can [checking their log files](../core-mods-explained/#log-files-for-the-frameworks))
3. Check the other log files in the game directory ([here's a guide how](../../help/users-modding-cyberpunk-2077/finding-and-reading-log-files.md))

Cyberpunk mods have different **dependency chains**. If a required mod isn't working, then your mod won't be working either!

{% hint style="info" %}
Find a brief explanation of mod requirements [here](../../help/users-modding-cyberpunk-2077/requirements-explained.md). Knowing this will let you avoid or solve problems when modding **any** game, so it's definitely worth understanding.

If you don't care and just want a solution, just keep reading.
{% endhint %}

#### Mod isn't working: a RedMod

Check that you've enabled the feature (see [Deploying Mods and Starting Game](../frameworks/redmod/#installation)).&#x20;

If that doesn't fix it, proceed to the section about [Log Files](./#finding-the-broken-mod-log-files) and try to find an error message here.

#### Mod isn't working: CET

You have installed Cyber Engine Tweaks, but it's not active / not letting you bind a key:&#x20;

* Is CET in the right place? It has to be installed under `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks`
* Check if you have a log file in `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\gamelog.log`. If you don't, that means CET isn't even loading. If you do, it will contain error messages that'll hopefully help you out.
* Check that mods are [enabled](../frameworks/redmod/#installation)
* Make sure that you have [Visual C Redistributable 2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) installed ([direct download](https://aka.ms/vs/17/release/vc\_redist.x64.exe) from Microsoft)

#### Mod isn't working: a CET script

Find the CET log at `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\cyber_engine_tweaks.log` and check if it contains any errors. \
If not, navigate to the CET folder and search for [log files](./#finding-the-broken-mod-log-files). (Do not change folders, and do not delete anything - just use the instructions below how to find the files.) &#x20;

#### An ArchiveXL/TweakXL mod

Go to `Cyberpunk 2077\red4ext` and check the log files.&#x20;

{% hint style="info" %}
Use [these instructions](./#check-the-log-files), but ignore the part where they tell you to change folders or delete files. Simply limit yourself to the red4ext subfolder while searching for `*.log`.
{% endhint %}



## The nuclear option: a clean install

You have decided to start over from scratch over the modular approach of [disabling your mods](./#step-1-temporarily-disable-all-your-mods). The instructions below will help you completing that in minimal time.

{% hint style="danger" %}
Unless you back them up, your mods will be **lost**. If you don't want that, make backups of the following folders:

* `/mods` (_manually installed redmods, unnecessary if you use Vortex_)
* `/archive/pc/mod` (_manually installed mods, unnecessary if you use Vortex_)
* `/bin/x64/plugins/cyber_engine_tweaks` (_CET settings and AMM_)
* `/r6/scripts`
* `/r6/tweaks`
{% endhint %}

### Quick (download <4GB)

{% hint style="danger" %}
Unless you [back up your mods and scripts](./#the-nuclear-option-a-clean-install), all your settings and manually installed mods will be lost.
{% endhint %}

{% hint style="warning" %}
The instructions below tell you which folders **not** to delete. Delete everything else.
{% endhint %}

1. Go to the Cyberpunk 2077 install directory
2. Delete everything **except for** the folder `archive`
3. Inside `archive`, delete everything but the folder `pc`
4. Inside `pc`, delete everything but the folder `content`
5. Verify your files

### Modular / minimal download (download <1GB

{% hint style="danger" %}
Unless you [back up your mods and scripts](./#the-nuclear-option-a-clean-install), all your settings and manually installed mods will be lost.
{% endhint %}

{% hint style="success" %}
Will download < 1GB.&#x20;
{% endhint %}

Rename or remove the following folders. If you do not have them, you don't need to do anything.

```
/mods
/plugins
/engine
/r6
/red4ext
/archive/pc/mod
```

Afterwards, verify your files.

## A fresh install: Starting from scratch

You have completed either of the previous steps. Your game should start now. **If it does not**, you have a problem that is not related to Cyberpunk. Make sure to follow the hints in the red box [at the very beginning of this guide](./#navigation).

Now it's time to **systematically** install mods. We'll start by installing the frameworks and making sure that the game starts up without any framework-dependent mods. Afterwards, you can add back all of your mods, and if the game stops working, find the offender via [bisect](./#finding-the-broken-mod-bisecting).&#x20;

{% hint style="success" %}
Don't worry about your savegames — those are fine, even if they won't load right now. We're just laying the foundation here that you can later build upon.
{% endhint %}

Let's go about it step-by-step.

### Installing the frameworks

Check the [framework page](../core-mods-explained/). For each of the frameworks, complete the following steps:

* If you didn't have it in your previous install, skip it.
* Install it (manually or via Vortex, your choice)
* Install **all of its dependencies**
* Start the game and load a savegame (you can also do this after installing all of them, but if you run into issues, that will make isolating the point of failure more difficult).
* Optional (for CET): Start the game and make sure that it asks you to bind a key. If not, check the [corresponding section of this guide.](./#cet)

{% hint style="info" %}
If you have any folders inside of `/mods`, you need to install or update [cybercmd](https://www.nexusmods.com/cyberpunk2077/mods/5176).
{% endhint %}

Once you are done, start up your game and load a savegame. If you don't have one or aren't sure, start a new game.

**This should now work**. If it doesn't, please see the next section ([troubleshooting the frameworks](./#troubleshooting-the-frameworks)).

{% hint style="warning" %}
You **need** to complete this step before proceeding: if the core frameworks aren't working without mods, they won't work with mods – adding anything now will just make debugging more difficult.

Fortunately, this is not rocket science. Be methodical,&#x20;
{% endhint %}

### Adding (back) your mods

{% hint style="success" %}
If you don't (yet) have any mods, you can head over to Nexus and start installing. Make sure that you include all necessary [dependencies](../../help/users-modding-cyberpunk-2077/requirements-explained.md)!
{% endhint %}

{% hint style="warning" %}
This section assumes that you have all required [core mods](./#frameworks-core-mods), your game is starting, and you can either load a savegame or start a new game without crashing.&#x20;

If you didn't make it that far, the steps below won't help you and will only obscure your problem. Please head [here](./#step-1-temporarily-disable-all-your-mods) first and complete the process. \
If you can't do it, find us on [Discord](https://discord.gg/redmodding) in `#mod-troubleshooting!`&#x20;
{% endhint %}

#### If you're using Vortex

Head directly to the [bisecting](./#finding-the-broken-mod-bisecting) section and pretend you have just removed all your mods.

#### If you made a manual backup:

For each folder that you have backed up, repeat the following steps (you can find a list [at the start of this section](./#the-nuclear-option-a-clean-install)):

1. Put it back into its original place in your new/fresh install
2. Start up the game
3. Load a non-modded savegame **or** start a new game

If your crash(es) are back, you can now go to the [bisect](./#finding-the-broken-mod-bisecting) section and do it with your folder.&#x20;

## Troubleshooting the frameworks

You have updated everything and your install should be clean, but the game still crashes? Here's what you can do.

* If the game crashes on startup although you have updated everything, that means you have leftover files from outdated frameworks. Make sure to scrub your install clean (you [don't need to reinstall](./#i-really-just-want-to-get-this-working-what-do-i-do), although [you can](./#the-nuclear-option-a-clean-install)).
* If your game crashes when loading a save, try an older, un-modded save. If you do not have one, start a new game, save as soon as you can, and load that one instead. (Don't panic, your savegame is most likely fine)
* If you add a framework and your game starts crashing **before** loading a save (or even on start-up), you need to debug this framework. You can [check the log files](./#check-the-log-files) or search for the exact error in this guide.

## Something something files

Your error goes something like this:&#x20;

* This is caused by an I/O error: Access is denied
* could not move file from '_Path\to\blabla.tmp_' to '_Path\to\Cyberpunk 2077\subdir\some.file_'
* Expression: EXCEPTION\_ACCESS\_VIOLATION
* The thread attempted to read inaccessible data at 0x_something_
* Cyberpunk is trying to write to a file that doesn't exist
* Can't access file '_some/file_'

These are most likely caused by **permission errors** – Cyberpunk is trying to access a file, and for some reason, it can't. Do the following things:

### Make sure that no previous game instance is running

Sometimes, the game instance doesn't shut down properly and is still running in the background, althoguh you can't see a window. This problem goes away after rebooting.

* Open your task manager (Ctrl+Shift+Esc)
* Switch to the **Details** tab
* Sort by Name and scroll to C
* Check if you can see anything **Cyberpunk** in the list.
* If yes, right-click on it and select **End Task**

### Reboot your PC

Always a good idea to do that from time to time – in this case, it could make the error go away.&#x20;

If it doesn't, check the next steps on the list.

### Make sure that all files in the game directory are writable

Sometimes, files in your Cyberpunk game directory are set to read-only.&#x20;

#### **What kind of monster would do something like that???**

We've had confirmed reports of the following culprits:&#x20;

* Steam
* mo2 mod manager
* various flavours of antivirus

{% hint style="info" %}
You can fix this either via [Windows Explorer](./#via-windows-explorer) or via [system console](./#via-system-console), the results will be the same.
{% endhint %}

#### Via system console:

* Press Windows+R
* type `cmd` and press Return to open the command line
*   run the following command (replace the path with your actual game dir):

    ```
    attrib -r "C:\Path\To\Cyberpunk\*.*" /s
    ```

#### Via Windows Explorer:&#x20;

* Navigate to the Cyberpunk game directory and right-click on it
* Select **Properties** (the last entry in the drop-down menu)
* Uncheck the "Read-only" box:

<figure><img src="https://i.stack.imgur.com/ZR59I.jpg" alt=""><figcaption></figcaption></figure>

### File Ownership

Sometimes, file ownership got messed up, and not all files in the folder are accessible by your current Windows account. It is a mystery how this comes to be.

You can fix it via [system console](./#via-commandline) or via [Windows Explorer](./#via-windows-explorer-1); either of those will do. If in doubt, the commandline one is more thorough.

#### Via commandline

{% hint style="warning" %}
In any of the commands below, you need to substitute `C:/Path/to/Cyberpunk2077` with the path to your game directory.
{% endhint %}

* Press Windows+R
* Type cmd and press return
* Run the following command (make sure to insert your real Cyberpunk path):&#x20;
* ```
  takeown /R /A /F "C:/Path/to/Cyberpunk2077" /D N
  ```
* If that didn't help, run the command `whoami` to see your current user name. You will need it for the next step.\
  _It should be identical to your Windows username, but if you have spaces or special characters, Windows might get funny about the spelling._
* Run the following command (putting your actual game dir and the username from `whoami`):\

* ```
  icacls "C:/Path/to/Cyberpunk2077" /grant YourUserName:F /T /C
  ```

#### Via Windows Explorer

We haven't included the full instructions here, but you can check [this guide](../../help/users-modding-cyberpunk-2077/users-downgrading-preventing-auto-updates.md).

### Reboot your PC again

If none of these things has helped, reboot your computer.&#x20;

#### The error should be gone now.

Not to say that your game will work now – but if you still have an error, it's hopefully a different one. Go back to the start of the guide and let's fix that one too!

## XML Document parsed with errors

`XML document parsed with errors: C:\Path\toCyberpunk 2077\r6/config/inputUserMappings.xml`\
`Error description: Error parsing element attribute`

According to InputLoader's [documentation](https://www.nexusmods.com/cyberpunk2077/mods/4575), you can ignore this. Keep searching!\
(You can also try reinstalling InputLoader and hope that the error goes away)

## You forgot your CET keybind&#x20;

Delete the file `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\bindings.json.` The game should let you bind a new key at the next startup.

## RED4ext: An exception occurred… permission denied

```
An exception occured while creating the logger: 
rotating_file_sink: failed renaming C:\Path\to\Cyberpunk 2077\red4ext\logs\red4ext.log to C:\Path\to\Cyberpunk 2077\red4ext\logs\red4ext.1.log: permission denied

D:\a\Red4ext\Red4ext\src\dll\Utils.cpp:75
```

An instance of Cyberpunk is already running. Close it.

## Redscript Compilation Failed

```log
REDScript compilation failed. The game will start, but none of 
the scripts will take effect. This is caused by errors in:
```

<figure><img src="../../.gitbook/assets/troubleshooting_redscript_compilation_failed.png" alt=""><figcaption><p>Your error message</p></figcaption></figure>

{% hint style="info" %}
This workflow is geared at the exact error above. If you have a different one, you might want to [remove RedScript completely](./#step-4-remove-redscript) and reinstall it afterwards.
{% endhint %}

### 1. Make sure that you have the latest versions

{% hint style="danger" %}
Actually check this. Do not rely on memory or common sense – if in doubt, re-download.&#x20;
{% endhint %}

1. Check [Redscript](https://github.com/jac3km4/redscript/releases/)
2. Check [Cybercmd](https://github.com/jac3km4/cybercmd/releases)

{% hint style="info" %}
These links go to github. This site is legit, it's where they are before being uploaded to Nexus.
{% endhint %}

Optional, but recommended: Check that you have the latest versions of all troublesome Redmods.

### 2. Check redscript.log

It is in `r6/log/redscript.log`. See if you can find any errors – warnings may or may not be a problem, see [here](../../help/users-modding-cyberpunk-2077/finding-and-reading-log-files.md#warning) for context.

### 3. Reset Redscript

{% hint style="warning" %}
If you rename or delete any directories, make sure to create a new, empty directory.
{% endhint %}

#### Redscript: Disable dependent mods

Vortex: Disable them

Manual: Remove the contents of `r6/scripts/`.&#x20;

{% hint style="info" %}
You can zip the directory from the windows context menu, then delete its contents.
{% endhint %}

#### Revert changes in r6/cache

{% hint style="info" %}
This is the script dir for non-REDmods
{% endhint %}

Delete _everything_ inside `r6/cache/modded/,` leave the empty dir.

If the file `r6/cache/final.redscripts.bk` exists, delete `final.redscripts` and remove the .bk extension.

{% hint style="success" %}
Check if your game starts.
{% endhint %}

**If that did not work:**

It's possible that `final.redscripts.bk` was corrupted as well. Delete the entire `cache` folder and verify your game files.

{% hint style="success" %}
Make sure your game starts up without error.
{% endhint %}

**If that did not work:**

* delete r6/cache
* Make sure that both `r6/scripts` and `red4ext/plugins` are empty.&#x20;
* verify game files

{% hint style="success" %}
Make sure your game starts up without error.
{% endhint %}

{% hint style="info" %}
If this doesn't work:&#x20;
{% endhint %}

### 4. Reinstall your mods

**Hopefully, your problem should be gone now.**&#x20;

It's time to put your mods back and see if you can start the game - see [Starting from Scratch](./#starting-from-scratch).

## I have another problem that isn't on this list

Here's the catch-all solution. After this, your game _will_ work (or the problem you have is not Cyberpunk related).

1. (optional, as this might solve it): [Reset the Redscript cache](./#3.-reset-redscript).
2. If your problem doesn't go away, follow the instructions [in the next section](./#i-really-just-want-to-get-this-working-what-do-i-do).

## I really just want to get this working, what do I do?

{% hint style="warning" %}
You might want to **deactivate ReShade** before you start debugging. Especially after DLSS, it has been known to cause crashes.
{% endhint %}

{% hint style="info" %}
Before following these steps, you might want to take a look at your [log files](../../help/users-modding-cyberpunk-2077/finding-and-reading-log-files.md) — check the instructions for how to do that.
{% endhint %}

{% hint style="success" %}
Instead of following these instructions, you can also [reinstall the game](./#the-nuclear-option-a-clean-install). Do yourself a favour and check the instructions, as you might be left with residual files otherwise.
{% endhint %}

### Step 1: Temporarily disable all your mods

#### Vortex

Press the **purge** button — this will remove any and all installed mods.

{% hint style="danger" %}
Do **not** press deploy.&#x20;
{% endhint %}

#### If all your mods were managed via Vortex:

Start Cyberpunk however you want, as long as it's not via Vortex. If it starts now, you're done here and can proceed with [bisecting](./#finding-the-broken-mod-bisecting) – otherwise, go to [Remove RedScript](./#step-4-remove-redscript).

#### If you had a mixed install:&#x20;

Complete the instructions in the section [manual](./#manual) now.

#### Manual

Find the following folders:

```
Cyberpunk 2077\archive\pc\mod
Cyberpunk 2077\mods
```

and rename them to&#x20;

```
Cyberpunk 2077\archive\pc\mod_
Cyberpunk 2077\mods_
```

{% hint style="info" %}
The purpose of renaming them is that the game won't find them anymore, but you still have a back-up of the files inside. Feel free to achieve this goal however.
{% endhint %}

You can optionally create a new, empty folder with the same name.

{% hint style="success" %}
Check if the problem is gone.&#x20;

If it is, put the folders back one after the other and apply the [bisection method](./#finding-the-broken-mod-bisecting).
{% endhint %}

### Step 2: disable CET

Find the folder

```
Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks
```

and rename it to `cyber_engine_tweaks_`.&#x20;

{% hint style="danger" %}
If you'd rather delete it, make sure that you retain a copy of your `mods` and `plugins` directories, as they contain your mod settings (AMM decorations etc.)
{% endhint %}

{% hint style="success" %}
Check if the problem is gone.&#x20;

If it is, put the folder back and apply the [bisection method](./#finding-the-broken-mod-bisecting) to `cyber_engine_tweaks\mods` and `cyber_engine_tweaks\scripts` until you have found the culprit.
{% endhint %}

### Step 3: Remove scripts and tweaks

First, remove (or rename) the cache:&#x20;

```
 r6/cache/modded
```

{% hint style="success" %}
Check if the problem is gone
{% endhint %}

If that didn't do the trick, find the following folders:

```
Cyberpunk 2077\red4ext
Cyberpunk 2077\r6\scripts
Cyberpunk 2077\r6\tweaks
Cyberpunk 2077\engine\tools
```

and rename them, you know the drill.

{% hint style="success" %}
Check if the problem is gone.

If it is, put them back one by one until you find the one that breaks it. If that is one of `r6\scripts` or `r6\tweaks`, apply the [bisection method](./#finding-the-broken-mod-bisecting).
{% endhint %}

### Step 4: Remove RedScript

{% hint style="info" %}
You can try [resetting RedScript](./#3.-reset-redscript) first, but at this point, you'll going to have to verify your files anyway.
{% endhint %}

**Delete** the following files and folders. You don't need a backup, as you can reinstall RedScript from [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/1511). If any of them don't exist, that's okay — just means you don't have to delete them.

```
Cyberpunk 2077\bin\x64\d3d11.dll
Cyberpunk 2077\bin\x64\global.ini
Cyberpunk 2077\bin\x64\powrprof.dll
Cyberpunk 2077\bin\x64\winmm.dll
Cyberpunk 2077\bin\x64\version.dll
Cyberpunk 2077\engine\config
Cyberpunk 2077\engine\tools
Cyberpunk 2077\r6\cache
Cyberpunk 2077\r6\config
Cyberpunk 2077\r6\inputs
Cyberpunk 2077\V2077
```

{% hint style="info" %}
@Auska has compiled a handy script for unix people:
{% endhint %}

```
rm ./bin/x64/d3d11.dll
rm ./bin/x64/global.ini
rm ./bin/x64/powrprof.dll
rm ./bin/x64/winmm.dll
rm ./bin/x64/version.dll
rm ./engine/config
rm ./engine/tools/*
rm ./red4ext
rm ./r6/cache
rm ./r6/config
rm ./r6/inputs
rm ./V2077

mv ./r6/cache/final.redscripts.bk ./r6/cache/final.redscripts
```

### Step 5: Repair game files

_Exact procedure as documented by @ArsenicTouch_

#### GOG

Go to Games -> Installed, right-click on your game and select the following menu entry:

![](<../../.gitbook/assets/image (2) (2).png>)

#### Steam

1. Open your library
2. Right-click on "Cyberpunk 2077" and select "Properties"
3. Select "Local Files"
4. Click "Verify integrity of game files…"

#### Epic

1. Open your "Library"
2. On the "Cyberpunk 2077" tile, find the "…"
3. Select "Manage"
4. Click "Verify"

### Step 6: Launch the game

All files you deleted have been re-acquired. **If there are no left-over files from earlier modding attempts,** your game should work now.

{% hint style="warning" %}
If it does not and you have exhausted the reset options as specified in this guide ([troubleshooting](./#i-really-just-want-to-get-this-working-what-do-i-do) and [nuclear](./#the-nuclear-option-a-clean-install) both) and your game **still** does not start, then your problem exists outside of Cyberpunk.  In this case, you can&#x20;

* check your [file permissions](./#something-something-files) (separately for [REDprelauncher.exe](./#steam-verify-file-integrity-loop))
* [update the Windows stuff](./#navigation)
* google your error message and try solutions at random
{% endhint %}

### Step 7: Install the core frameworks

Now that your un-modded game is starting, it's time to [install the core frameworks](./#starting-from-scratch). Do this **before** you enable your other mods, as they won't work without their dependencies and can only add problems at this stage.

{% hint style="info" %}
You can now re-enable your mods. Do it in chunks and check that the game keeps working so that you can narrow down where the problem is, in case it isn't gone for good.
{% endhint %}

## Dealing with a broken mod

You have followed all the steps and your game is launching, but you now have a mod on your hands that just doesn't work, and you want it to. What do you do now?

{% hint style="info" %}
If you join a [modding discord](https://discord.gg/redmodding) to ask for help, people will walk you through this list, so you might as well do it first. **Nobody will unbundle someone else's mod and just fix it for free unless they want to use it themselves.**
{% endhint %}

### 1. Make sure you have the correct dependencies

Many mods require frameworks or other mods to work. Check the mod's page and description for those, and install them.&#x20;

Repeat the process by installing the dependencies' dependencies, until you have everything necessary.

### 2. Check the mod's description

Often, the description contains detailed installation instructions, known incompatibilities and/or workarounds. Sometimes, mods worked on past versions of Cyberpunk, but the author stopped updating. In that case, proceed to [point 5](./#5.-hands-on-troubleshooting) of this list.

{% hint style="danger" %}
Before you get upset, please keep in mind that modders don't do this for a living (these are called "game developers" and they get paid for it). Somebody made this **in their spare time, for their own use,** and then decided to **share it with you for free**. Do you know the easiest way to avoid toxic users? It's **not publishing your mods**. No reward system, credit points or reputation will ever make up for online abuse.

As a mod author, I can tell you that I will ignore assholes, but gladly spend an extra hour after work to help out someone who politely asks me for help.
{% endhint %}

### 3. Check the mod's comment section

You're unlikely to be the first person to run into this problem. There is a good chance that the comment section on the download page has helpful information. Look for either a pinned post by the mod's author or a user discussion about your problem — these often contain a solution.

### 4. If you are using a mod manager: Try installing it manually

While mod managers are very reliable and get better with every new release, you should rule out that they are the cause of the problem by installing the mod from hand.

If everything else works and installing the mod by hand still breaks compilation, then it is broken. See "[Dealing with a broken mod](./#dealing-with-a-broken-mod)" below. start your game client's file verification.&#x20;

### 5. Contact the mod's author

Describe your problem as clearly as you can, and add all useful data.&#x20;

**Bad bug report:** "Your mod doesn't work lol pls help"

**Good bug report (example)**: "Hi, installing your mod (manually and Vortex) causes a Redscript compilation error on startup (possible screenshot of error popup). xxx.log says \<citation of error message>. All my dependencies are up-to-date, and I've ruled out that it's any other mod. Can you help me out?"

**Good bug report (example 2)**: "Hi, when I try to equip Item \<item name and colour>, it doesn't show up and I only get glitches. I'm using Hyst's boob mod and \<specific version and variant> of your mod. I hope you can help me? Thank you for making this."

{% hint style="danger" %}
As per the last red box, do keep in mind that you're asking a **favour**. The modder doesn't have your problem, and if they do, they know **exactly** how to fix it. The most time-efficient response for them is to ghost you, so any kind of response is either them being nice or them losing their temper about yet another entitled idiot who can't read. Don't be the entitled asshole who can't read.
{% endhint %}

### 5. Hands-on troubleshooting

At this point, you have exhausted all easily accessible solutions. If you still want the mod to work, you will have to get involved yourself. A commendable attitude! (Not sarcasm, it really is.)

{% hint style="info" %}
This is the point where you might want to join a [modding discord](https://discord.gg/redmodding), because now you're entering the territory where other modders can actually help you.
{% endhint %}

#### [Check the log files](./#finding-the-broken-mod-log-files)

Usually, there will be a [log file](./#finding-the-broken-mod-log-files) that will point you towards the source of your problem. If there isn't (the game loads and the mod just fails silently), that means that the error is inside the archive and you have to become a modder.

#### Fixing scripts

But sometimes, you're lucky. Sometimes, the error is in a script file. You can tell this by a log entry pointing towards a file in your Cyberpunk folder (e.g. `r6\scripts\my_broken_script.reds`).

Open up that file in a text editor like [Notepad++](https://notepad-plus-plus.org/downloads/) and try to find and fix the problem. Sometimes, the log file has more information. Sometimes, an online syntax check can help you — there isn't one for redscript, but it's fairly close to lua.&#x20;

Sometimes, such mistakes are trivial — a forgotten **,** or incorrect file encoding. Often, they are not.

{% hint style="info" %}
A tip for [nil access error in lua](../../modding-guides/everything-else/scripting-best-practices-pitfalls.md#fixing-preventing-nil-access)
{% endhint %}

#### Ascending from user to modder

If the error isn't in any script files, you will have to **unbundle the .archive**, load it in [WolvenKit](https://github.com/WolvenKit/Wolvenkit/releases), and get your hands dirty. We'll be seeing each other, choomba!



##
