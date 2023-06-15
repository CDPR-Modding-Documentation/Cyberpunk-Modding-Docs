---
description: If your mods are causing trouble, here's what you can do
---

# 🆘 Troubleshooting

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
{% endhint %}

{% hint style="warning" %}
Before you start debugging, **update your mods** and make sure that **all dependencies** have the latest version, in particular the [core mods](../../for-mod-creators/core-mods-explained/) ([Redscript](https://github.com/jac3km4/redscript/releases/), [Red4ext](https://github.com/WopsS/RED4ext/releases), [Cyber Engine Tweaks](https://github.com/yamashi/CyberEngineTweaks/releases), [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl/releases/) and [TweakXL](https://github.com/psiberx/cp2077-tweak-xl/releases/tag/v1.0.8)).

If you are on RED4Ext >= 1.13, make sure to **uninstall** cybercmd!

\
Find a download-ready collection for Vortex [here](https://next.nexusmods.com/cyberpunk2077/collections/r1flnc?tab=Mods).
{% endhint %}

This section aims to give you a quick overview. If your exact problem isn't listed here, please **look through the different sections** below and try anything that looks promising.

* [I don't wanna debug, I just want mods!](./#i-really-just-want-to-get-this-working-what-do-i-do)
* [There was a game update and now your mods aren't working](users-troubleshooting-after-a-game-update.md)
* [Your game is crashing](./#your-game-is-crashing)
  * [it's not even starting](./#crash-on-startup)
    * [Corrupt or missing script files](./#corrupt-or-missing-script-files)
    * [Corrupted archives](./#corrupted-archives)
  * [before the menu](./#crash-before-menu)
  * [when loading a save / starting a game](./#crash-on-loading-a-save)
  * [randomly during gameplay](./#crash-during-the-game)
* [You're on Linux](./#youre-on-linux-steam-deck)
* [You have trouble with your pirated game](./#you-pirated-the-game)
* [Redscript Compilation Failed (Popup message)](./#redscript-compilation-failed)
* [Photomode screenshots are borked](./#photomode-screenshots-are-blank)
* [Press \[none\] to continue](./#press-none-to-continue)
* You have audio issues
* [You have trouble with CET (Cyber Engine Tweaks)](./#cet)
  * [You forgot your CET keybind](./#you-forgot-your-cet-keybind)
* [XML Document parsed with errors](./#xml-document-parsed-with-errors)
* [You installed a mod, but it's not doing anything ](./#mod-s-arent-loading-triggering)
* A mod is causing problems, and you have no idea which:
  * &#x20;[Known problem children](./#finding-the-broken-mod-known-problem-children)
  * Searching: [Bisect](./#finding-the-broken-mod-bisecting)
  * Searching: [Log files](finding-and-reading-log-files.md)
* [Something with files or ACCESS\_VIOLATION](./#something-something-files)
* [This is a waste of time, I'm reinstalling](./#the-nuclear-option-a-clean-install)
  * [Modding a clean install](./#starting-from-scratch)&#x20;

{% hint style="success" %}
To enable REDmods, check [here](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-know-how/frameworks/redmod/usage#deploying-mods-and-starting-the-game).
{% endhint %}

## Your game is crashing

<figure><img src="../../.gitbook/assets/troubleshooting_headers_doesnt_even_start.png" alt=""><figcaption></figcaption></figure>

If you can't play because the game is crashing, this section will point you towards the right troubleshooting steps in the guide below.

* If you're done with this shit and would rather reinstall, see [here](./#the-nuclear-option-a-clean-install)

### Crash on startup

If you're trying to start your game, but it never even launches, this is the right section for you. Otherwise:

* If the game crashes before you make it to the menu, see [here](./#crash-before-menu).
* If the game crashes when you're trying to load a save, see [here](./#crash-on-loading-a-save).

#### Something about files or permissions

If you think that your error is file-related, you can check the section "[Something something files](./#something-something-files)" or use your browser's search function (`Ctrl+F`) to search this page for your error.

#### Some other error

Your problem lies with either red4ext or redscript. Find the section "[Your game isn't starting](./#your-game-isnt-starting)" below and follow the steps for your error message.

### Crash before menu

If you're starting the game, but never make it to the in-game menu, this is the right section for you. \
Otherwise:

* If the game never even starts, see [here](./#crash-on-startup)
* If the game crashes when you're trying to load a save, see [here](./#crash-on-loading-a-save).

Your problem most likely related to **Cyber Engine Tweaks**. To find out how to troubleshoot it, check the "[disable CET](./#step-2-disable-cet)" section.&#x20;

### Cyberpunk has flatlined

See "[Crash before menu](./#crash-before-menu)"

### Crash on loading a save

If you can make it to the menu but crash out when you're loading a save or starting a new game, this is the right section for you. \
Otherwise:

* If the game never even starts, see [here](./#crash-on-startup)
* If the game crashes before you make it to the menu, see [here](./#crash-before-menu).

Most likely, you have an issue with an .archive mod. Here's what you can do:

1. To rule out that it's a save game problem (those are extremely rare), start a new game.
2. Go to the [bisect](./#go-bisect) section and start with the first two entries on the list&#x20;

If that doesn't solve your problem, or if the issue is save-game related, feel free to browse around some more.

### Crash during the game

This section tells you how to deal with crashes during gameplay.

**If you can make it crash reliably**

You're lucky, because it means that you can systematically troubleshoot. Go to the [bisect](./#finding-the-broken-mod-bisecting) section; start with .archive mods, but if that doesn't fix it, do the other folders as well.

**If you can't**

… that puts you in the same boat as the rest of us: most veteran players live with occasional crashes, especially while tabbing out and back in under certain circumstances.

That being said, if the crashes exceed what you're willing to live with, you'll have to find out a way to improve it, but your options are thin on the ground. Depending on how long it takes for the crash to occur, you might try

* resetting your game [to a clean state](./#is-there-a-shortcut) (if the error persists, it's not mods)
* [temporarily disabling](./#step-1-temporarily-disable-all-your-mods) certain types of mod to home in on the cause (see the [bisect section](./#go-bisect) for an overviev)

Best of luck!

## redscript / RED4ext

<figure><img src="../../.gitbook/assets/troubleshooting_headers_redscript_red4ext.png" alt=""><figcaption></figcaption></figure>

When your game doesn't even start up, either of these frameworks isn't working properly. Below, you can find a list of the most common error messages with steps to resolve them.

### Corrupt or missing script files

> Cyberpunk 2077 encountered an error caused by a corrupt or missing script file and will now be forced to close. Please verify...

You have a problem with Red4ext.&#x20;

{% hint style="warning" %}
If you are using RED4ext >= 1.13, uninstall cybercmd if you have it — it's no longer necessary and can cause false positives.
{% endhint %}

{% hint style="info" %}
The first step whenever you run into this error is deleting the folder `r6/cache` and verifying your game files.
{% endhint %}

If that doesn't help, it's time for more detailed troubleshooting:

* if you don't have red4ext/logs/red4ext.log, then RED4ext doesn't work, you have to update / fix RED4ext&#x20;
* if you have red4ext/logs/red4ext.log, then look inside, it will tell you which mods aren't compatible with the current game patch and may be the cause of this issue&#x20;
* if that doesn't help, try [resetting redscript](./#3.-reset-redscript) (you will need to verify your game files).&#x20;

If that doesn't solve your problem, you can&#x20;

* [troubleshoot redscript directly](./#0.-make-sure-that-you-dont-have-multiple-versions-of-codeware-installed)
* [temporarily disable all mods](./#step-1-temporarily-disable-all-your-mods) and reinstall the core frameworks

### Corrupted archives

> Cyberpunk 2077 encountered an error caused by corrupted or missing archives and and will now be forced to close. Please verify...

One of the .archive files in your folder is broken. To find out which one, try the [bisect](./#finding-the-broken-mod-bisecting) approach, starting with the first two folders.

## The game isn't starting: other reasons

<figure><img src="../../.gitbook/assets/troubleshooting_headers_startup_cockblock.png" alt=""><figcaption></figcaption></figure>

There are various non-mod-related reasons why the game couldn't be starting. If you have followed these steps and they haven't gotten you anywhere, check the errors in this section:

* [Too many mods](./#too-many-mods)
* [Message: Failed to initialize scripts data!](./#failed-to-initialize-script-data)
* [Steam file verification loop](./#steam-verify-file-integrity-loop)

Other than that, there are general troubleshooting steps, because **missing Windows stuff can make Cyberpunk go brr**. Make sure that&#x20;

* your graphics driver is up-to-date
* you have the most recent version of [.NET Desktop Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-7.0.3-windows-x64-installer) installed
* you have [Visual C++ Redistributable 2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) installed ([direct download](https://aka.ms/vs/17/release/vc\_redist.x64.exe), Microsoft)

Also, try starting the game **without Reshade** to rule it out as a source of crashes (this happened after the DLSS patch) and **temporarily disable your antivirus**.

If none of that helps, find us on [Discord](https://discord.gg/redmodding) in #mod-troubleshooting.

### Too many mods

There is such a thing as too many mods which are making the game crash. This number seems pretty random, but generally doesn't start below \~460.&#x20;

To fix this, you need to disable analysis in the settings:&#x20;

<figure><img src="../../.gitbook/assets/image (44).png" alt=""><figcaption></figcaption></figure>

### Failed to initialize script data

This is not a Cyberpunk error!

```
Message: Failed to initialize scripts data!
File: E:\R6.Release\dev\src\common\engine\src\baseEngineInit.cpp(1019)
```

Check your NVidia Control Panel panel. If power saving options are enabled, turn them off:

<figure><img src="../../.gitbook/assets/nvidia_control_panel_power_saving.png" alt=""><figcaption></figcaption></figure>

If you don't, check for other power config options in your operating system.

### Steam: verify file integrity loop

Before trying to implement any of the other solutions, configure the `REDprelauncher.exe` in the [Cyberpunk root directory](#user-content-fn-1)[^1] to always run as administrator.&#x20;

* Right-click on the file and select `Properties`
* Switch to the `Compatibility` tab
* Check the box `Run this program as an administrator`

<figure><img src="../../.gitbook/assets/troubleshooting_redprelauncher_runas_admin.png" alt=""><figcaption></figcaption></figure>

## You pirated the game

<figure><img src="https://images.unsplash.com/photo-1627569015058-3f298889045f?ixlib=rb-4.0.3&#x26;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&#x26;auto=format&#x26;fit=crop&#x26;w=2670&#x26;q=80" alt=""><figcaption><p>Creative Commons, Credit: <a href="https://unsplash.com/photos/WV9yGVpEAz8">Tom Briskey</a></p></figcaption></figure>

There's a chance of >95% that we have already found the source of your problems — **pirated copies just don't mod well**. That's the first reason why things won't work.

The second reason is that CDPR needs to earn money to pay people to make games for us. If you can at all afford it, **please buy the game**. It's a good deal: how much are you willing to spend for a movie ticket? How long does a movie keep you entertained?

You are, of course, welcome to peruse the troubleshooting guide. It might even help you. But know that pirated copies will never be explicitly supported.

## Finding the broken mod: known problem children

<figure><img src="../../.gitbook/assets/troubleshooting_headers_problem_children.png" alt=""><figcaption></figcaption></figure>

### Stuff that isn't mods

It doesn't **have** to be either of these. But if it is, you'll never find it with the rest of the list. Rule it out by deactivating them while you're debugging.

* **Antivirus**
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

<figure><img src="../../.gitbook/assets/troubleshooting_headers_log_files.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Bad news: The game's logs are usually less helpful than the Swiss navy. \
Good news: Mods are doing a far better job. \
Bad news again: You have to find the right log file in the game directory.\
Good news again: There's intel how (see below)

jackhumbert's mod [ctdhelper](https://www.nexusmods.com/cyberpunk2077/mods/5205) will give you additional information. There is a chance that it shows you something helpful, most of the time it
{% endhint %}

If you don't want to download and run script files from the internet, you can go [here](./#alternatively-by-hand) and complete the steps by hand. Otherwise:

1. Download [this script](https://raw.githubusercontent.com/DoctorPresto/Cyberpunk-Helper-Scripts/main/FindAllErrors.bat) (**right-click -> save as**)\
   _Link goes to Presto's_ [_github repository_](https://github.com/DoctorPresto/Cyberpunk-Helper-Scripts/blob/main/FindAllErrors.bat)
2. Now, do either of the following things:&#x20;
   1. Move it to your Cyberpunk install folder and double-click it
   2. Drag-and drop your Cyberpunk folder on the file that you downloaded
3. After running, the script will have created a folder `_LOGS` in your Cyberpunk directory, which contains a file listing all the log files for you.

The list will give you useful information along with a list of files to check. Once you've found the broken mod, you can go [here](./#dealing-with-a-broken-mod) for instructions on how to troubleshoot further – they also tell you when you should ask for help!

## Finding the broken mod (bisecting)

<figure><img src="../../.gitbook/assets/troubleshooting_headers_bisect.png" alt=""><figcaption></figcaption></figure>

You have hundreds of mods, and one of them is broken. How do you find out which one it is without wasting the entire day?&#x20;

{% hint style="success" %}
Don't worry! As long as you have less than 2048 mods, bisection lets you find the problem child with only 10 rounds. (Otherwise, it's 11)
{% endhint %}

Some mods install themselves to multiple directories, but **that doesn't matter**. Due to the fact how mod loading works, you can find the error like this.

### Which kind of mod is it?

{% hint style="info" %}
If you already know which folder contains the broken mod, [skip to the next section](./#go-bisect).
{% endhint %}

To find out the **type** of broken mod, take each directory from the following list and complete the steps in the next paragraph after the table.

<table><thead><tr><th width="249">Kind of mod</th><th width="202">Directory</th><th>explanation</th></tr></thead><tbody><tr><td>.archive</td><td>\<code>mods</code></td><td>Redmod directory: contains .archive mods (in subfolders)</td></tr><tr><td>.archive</td><td>\<code>archive\pc\mod</code></td><td>Legacy directory: contains .archive mods</td></tr><tr><td>.lua (cyber engine tweaks)</td><td>\<code>bin\x64\plugins</code></td><td>Cyber Engine Tweaks</td></tr><tr><td>redscript</td><td><code>\r6\scripts</code></td><td>redscript mods</td></tr><tr><td>red4ext</td><td><code>\r6\tweaks</code></td><td>red4ext tweaks</td></tr></tbody></table>

1. Rename the **game folder** (e.g. `/mods`) to a **backup folder** by appending an underscore (e.g. /`mods_`)
2. To prevent errors, create a new empty game folder (e.g. `/mods`).
3. Start the game. You will now run into one of these two scenarios:
   * **Your problem is gone:** Jackpot. This is the correct folder for [the next section](./#go-bisect).
   * **Your problem is still there**: This folder is innocent. Proceed with the next entry.

{% hint style="info" %}
You can put the innocent folders back if you want: due to the way mods are loading, there won't be side-effects.
{% endhint %}

### Go bisect

Congratulations, you have found which folder causes the problem — you're more than halfway there. All that's left is to find the broken mod. Here's how:

1. From your renamed folder `directory_`, move **half** of the mods over to the empty game folder `directory` so that they'll become active.
2. Start the game. You will now run into one of two scenarios:
   * **The error is gone:** The problematic mod is in your **backup folder**, but you now know which mods are okay.&#x20;
     * If this is the first round: Go back to 1
     * Otherwise: The broken mod was in the bunch that you moved out in the last round. When repeating step 1, you can ignore everything but the last bunch you moved.
   * **The error is still there:** The problematic mod is your **game folder**.\
     Move half of the mods out of the folder again. If this is not the first round, only do the last subset that you moved.

Repeat this process until you've identified the mod that's crashing your game.

{% embed url="https://youtu.be/c1BkM6NFfkI" %}

## Audio problems

If your CPU is too busy, the game will try to save resources by dropping audio, starting with dialogue audio. Disabling spatial audio from the main menu might help:

<figure><img src="../../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

### It's not connected to CPU load

Missing footsteps had in the past been connected to a bug in Let [There Be Flight](./#let-there-be-flight), so it is worth debugging your script mods. However, if you're on the most recent version (check the github for previews), you might just have to [bisect](./#finding-the-broken-mod-bisecting) your mods at random.

## Mod(s) aren't loading/triggering

<figure><img src="../../.gitbook/assets/troubleshooting_headers_not_working.png" alt=""><figcaption></figcaption></figure>

Normally, a mod should **just work**, as long as all of their requirements are working. If you aren't certain what that means, you can check [here](../users-modding-cyberpunk-2077/requirements-explained.md) for an explanation or follow the checklist below.

* Make sure that you have [enabled mods](../../for-mod-creators/core-mods-explained/redmod/#installation) in your launcher.
* If items or hairs aren't changing, you need to install [cookedapps nulled](https://www.nexusmods.com/cyberpunk2077/mods/8127) (why?)[^2]
* If materials aren't updating, you need to install [material override](https://www.nexusmods.com/cyberpunk2077/mods/5266) (why?)[^3]
* If you already have all of that, [check the next section](./#only-parts-of-my-mods-are-working).

### That wasn't it: Getting the mod to work

If your mod is [cyber engine tweaks itself](./#mod-isnt-working-cet) or [a dependent mod](./#mod-isnt-working-a-cet-mod-or-script), you can check the sections below. Otherwise, follow the [general troubleshooting steps](./#mod-isnt-working-general-troubleshooting).

* [Cyber Engine Tweaks (CET)](./#mod-isnt-working-cet)&#x20;
  * [a CET mod or script](./#mod-isnt-working-a-cet-script)

#### Mod isn't working: General troubleshooting

Here's what you can do:

1. Check that you've enabled the feature (see [Deploying Mods and Starting Game](../../for-mod-creators/core-mods-explained/redmod/#installation)).&#x20;
2. Check the [requirements](../users-modding-cyberpunk-2077/requirements-explained.md) on the mod's nexus page. Make sure that you have installed them all and that they are up-to-date.
3. Make sure that all of your [core frameworks](./#step-7-install-the-core-frameworks) are up-to-date and starting up correctly (here's how you can [check their log files](finding-and-reading-log-files.md#a-list-of-framework-logfiles))
4. Check the other log files in the game directory ([here's a guide how](finding-and-reading-log-files.md))
5. **Optional**: reach out to us on [Discord](https://discord.gg/redmodding) in #mod-troubleshooting

#### Mod isn't working: CET[^4]

You have installed Cyber Engine Tweaks, but it's not active / not letting you bind a key:&#x20;

* [ ] Is CET in the right place? It has to be installed under&#x20;

```
Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks
```

* [ ] Is there a `gamelog.log` inside the directory? If not, move the folder out of `plugins` and reinstall from a fresh download.
* [ ] Do you have [Visual C Redistributable 2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) installed? ([direct download](https://aka.ms/vs/17/release/vc\_redist.x64.exe) from Microsoft)

#### Mod isn't working: a CET mod or script

{% hint style="info" %}
You will find all the files mentioned below under

```
Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks
```
{% endhint %}

1. Find the  `cyber_engine_tweaks.log`.&#x20;
2. Update everything that shows an error
3. If any file paths are listed: Make sure that the directories exist and aren't [read-only](./#make-sure-that-all-files-in-the-game-directory-are-writable)
4. Search the CET folder for log files [log files](finding-and-reading-log-files.md#alternatively-by-hand)
5. Try to resolve any errors or reach out to us on [Discord](https://discord.gg/redmodding) in #mod-troubleshooting



## The nuclear option: a clean install

<figure><img src="../../.gitbook/assets/troubleshooting_headers_nuclear.png" alt=""><figcaption></figcaption></figure>

{% hint style="success" %}
This is the last resort and you do **not** need to do this — run [this script](./#is-there-a-shortcut) for the same result in less time. However, if you're still set on reinstalling, the instructions below will help you completing that in minimal time.
{% endhint %}

### Back it up, baby!

{% hint style="danger" %}
Unless you back them up, your mods will be **lost**. If you don't want that, make backups of the following folders:

* [`/mods`](#user-content-fn-5)[^5]
* [`/archive/pc/mod`](#user-content-fn-6)[^6]
* [`/bin/x64/plugins/cyber_engine_tweaks`](#user-content-fn-7)[^7]
* [`/r6/scripts`](#user-content-fn-8)[^8]
* [`/r6/tweaks`](#user-content-fn-9)[^9]

The [script](./#is-there-a-shortcut) linked above will do that for you.
{% endhint %}

### Quick (download <4GB)

{% hint style="danger" %}
Unless you [back up your mods and scripts](./#back-it-up-baby), all your settings and manually installed mods will be lost.
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
Unless you [back up your mods and scripts](./#back-it-up-baby), all your settings and manually installed mods will be lost.
{% endhint %}

{% hint style="success" %}
Will download < 1GB.&#x20;
{% endhint %}

Rename or remove the following folders. If you do not have them, you don't need to do anything.

<pre><code>/<a data-footnote-ref href="#user-content-fn-10">mods</a>
/<a data-footnote-ref href="#user-content-fn-11">plugins</a>
<a data-footnote-ref href="#user-content-fn-12">/engine</a>
/r6
<a data-footnote-ref href="#user-content-fn-13">/red4ext</a>
<a data-footnote-ref href="#user-content-fn-14">/archive/pc/mod</a>
<a data-footnote-ref href="#user-content-fn-15">/bin/x64/plugins</a>
</code></pre>

Afterwards, verify your files.

## A fresh install: Starting from scratch

<figure><img src="../../.gitbook/assets/troubleshooting_headers_starting_clean.png" alt=""><figcaption></figcaption></figure>

You have completed either of the previous steps. Your game should start now. **If it does not**, you either have leftover files (check [here](./#the-nuclear-option-a-clean-install) for how to get rid of them), or you have a problem that is not related to Cyberpunk. Make sure to follow the hints in the red box [at the very beginning of this guide](./#navigation).

Now it's time to **systematically** install mods. We'll start by [installing the frameworks](./#installing-the-frameworks) and making sure that the game starts up without any framework-dependent mods. Afterwards, you can add back all of your mods, and if the game stops working, find the offender via [bisect](./#finding-the-broken-mod-bisecting).&#x20;

{% hint style="success" %}
Don't worry about your savegames — those are fine, even if they won't load right now. We're just laying the foundation here that you can later build upon.
{% endhint %}

Let's go about it step-by-step.

### Installing the frameworks

{% hint style="info" %}
This step will tell you how to set up your Cyberpunk install with the necessary dependencies so that you can start modding.
{% endhint %}

Check the [framework page](../../for-mod-creators/core-mods-explained/). For each of the frameworks, complete the following steps:

* If you didn't have it in your previous install, skip it.
* Install it (manually or via Vortex, your choice)
* Install **all of its** [**dependencies**](../users-modding-cyberpunk-2077/requirements-explained.md)
* Start the game and load a savegame (you can also do this after installing all of them, but if you run into issues, that will make isolating the point of failure more difficult).
* Optional (for CET): Start the game and make sure that it asks you to bind a key. If not, check the [corresponding section of this guide.](./#cet)

{% hint style="warning" %}
If you are using redmod (have any folders inside of `/mods`), you probably have  [cybercmd](https://www.nexusmods.com/cyberpunk2077/mods/5176) installed. That is no longer necessary with RED4ext >= 1.13 and can lead to false positives. Uninstall it!
{% endhint %}

Once you are done, start up your game and load a savegame. If you don't have one or the game still crashes, start a new game.

**This should now work**. If it doesn't, you need to check your [log files](./#check-the-log-files) to see which framework is causing trouble, or find us on [Discord](https://discord.gg/redmodding) in #mod-troubleshooting.

{% hint style="warning" %}
You **need** to complete this step before proceeding: if the core frameworks aren't working **without** mods, they won't work **with** mods – adding anything now will just make debugging more difficult.

Fortunately, this is not rocket science. Be methodical and install them one by one. If you need help, you can find us on [Discord](https://discord.gg/redmodding) (`#mod-troubleshooting`)
{% endhint %}

### Adding (back) your mods

{% hint style="success" %}
If you don't (yet) have any mods, you can head over to Nexus and start installing. Make sure that you include all necessary [dependencies](../users-modding-cyberpunk-2077/requirements-explained.md)!
{% endhint %}

{% hint style="warning" %}
This section assumes that&#x20;

* you installed all required [core mods](./#frameworks-core-mods)
* your game is starting
* &#x20;you can (without crashing) do either of these things:
  * load a savegame&#x20;
  * start a new game

If you didn't make it that far, the steps below won't help you and will only obscure your problem. Please head [here](./#step-1-temporarily-disable-all-your-mods) first and complete the process.&#x20;

\
If you need help, find us on [Discord](https://discord.gg/redmodding) in `#mod-troubleshooting!`&#x20;
{% endhint %}

#### If you're using Vortex

Head directly to the [bisecting](./#finding-the-broken-mod-bisecting) section and pretend you have just removed all your mods.

#### If you made a manual backup:

For each folder that you have [backed up](./#back-it-up-baby) (check link for a list), repeat the following steps:

1. Put it back into its original place in your new/fresh install
2. Start up the game
3. Load a non-modded savegame **or** start a new game

If your crash(es) are back, you can now go to the [bisect](./#go-bisect) section and follow the steps for your folder.&#x20;

## Something something files

<figure><img src="../../.gitbook/assets/troubleshooting_headers_something_files.png" alt=""><figcaption></figcaption></figure>

Your error goes something like this:&#x20;

* ```
  Access is denied
  ```
* ```
  Can't access file 'some/file'
  ```
* ```
  could not move file from 'Path\to\blabla.tmp' to 'Path\to\Cyberpunk 2077\subdir\some.file'
  ```
* ```
  Expression: EXCEPTION_ACCESS_VIOLATION
  ```
* ```
  The thread attempted to read inaccessible data at 0xsomething
  ```
* ```
  An exception occured while creating the logger
  ```
* Cyberpunk is trying to write to a file that doesn't exist

These are caused by **access errors** – Cyberpunk is trying to read or write a file, and for some reason, it can't.&#x20;

Follow the steps in this section one by one, or find us on [Discord ](https://discord.gg/redmodding)in #mod-troubleshooting.

### Make sure that the file path exists

{% hint style="info" %}
Ignore this if you can't spot any file paths in the error message
{% endhint %}

If Cyberpunk is trying to move files to a subdirectory that it can't access, make sure that the directory actually exists (if it doesn't, create it). The most frequent candidate for this is /`r6/cache/modded`.

### Make sure that no previous game instance is running

Sometimes, the game instance doesn't shut down properly and is still running in the background, althoguh you can't see a window. This problem goes away after rebooting.

* Open your task manager (Ctrl+Shift+Esc)
* Switch to the **Details** tab
* Sort by Name and scroll to C
* Check if you can see anything **Cyberpunk** in the list.
* If yes, right-click on it and select **End Task**

{% hint style="info" %}
It is possible that your antivirus is causing this problem. Before you lose your mind, try temporarily disabling it.
{% endhint %}

### Reboot your PC

Always a good idea to do that from time to time – in this case, it could make the error go away.&#x20;

If it doesn't, check the next steps on the list.

### Make sure that all files in the game directory are writable

Sometimes, files in your [Cyberpunk game directory](#user-content-fn-16)[^16] are set to read-only.&#x20;

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

    <pre><code>attrib -r "<a data-footnote-ref href="#user-content-fn-17">C:\Path\To\Cyberpunk</a>\*.*" /s
    </code></pre>

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
In any of the commands below, you need to substitute `C:/Path/to/Cyberpunk2077` with the path to your [game directory](#user-content-fn-18)[^18].
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

We haven't included the full instructions here, but you can check [this guide](../users-modding-cyberpunk-2077/users-downgrading-preventing-auto-updates.md).

### Reboot your PC again

If none of these things has helped, reboot your computer.&#x20;

#### The error should be gone now.

Not to say that your game will work now – but if you still have an error, it's hopefully a different one. Go back to the start of the guide and let's fix that one too!



## Redscript Compilation Failed

<figure><img src="../../.gitbook/assets/troubleshooting_headers_compilation_failed.png" alt=""><figcaption></figcaption></figure>

You're running into the following error:

```log
REDScript compilation failed. The game will start, but none of 
the scripts will take effect. This is caused by errors in:
```

<figure><img src="../../.gitbook/assets/troubleshooting_redscript_compilation_failed.png" alt=""><figcaption><p>Your error message</p></figcaption></figure>

{% hint style="info" %}
This workflow is geared at the exact error above. If you have a different one, it's still worth checking this, but you can also head back [to the start of the guide](./#navigation) and find the right section.
{% endhint %}

### 0. Make sure that you don't have multiple versions of [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780) installed

In the past, Codeware wasn't a standalone mod, but was instead [**bundled**](#user-content-fn-19)[^19] inside of other mods. Since that is different now, the leftover versions can cause errors.

1. Search your [Cyberpunk directory](#user-content-fn-20)[^20] for `Codeware`.&#x20;
2. If you have exactly one folder, this is not your problem — proceed to [the next step](./#1.-make-sure-that-you-have-the-latest-versions).
3. Delete everything you have found.
4. Reinstall the latest version of [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780) from Nexus.
5. Delete the folder `r6/cache`
6. Verify your game

### 1. Make sure that you have the latest versions

{% hint style="danger" %}
Actually check this. Do not rely on memory or common sense – if in doubt, re-download. ~~(This is totally not something that the guide's author learned the hard way)~~
{% endhint %}

1. Check Redscript ([github](https://github.com/jac3km4/redscript/releases/) | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/1511))
2.  If you are on RED4ext >= 1.13:&#x20;

    uninstall cybercmd
3.  Otherwise:&#x20;

    install cybercmd ([github ](https://github.com/jac3km4/cybercmd/releases)| [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/5176))

#### Optional, but recommended:&#x20;

Check that you have the latest versions of all troublesome Redmods.

### 2. Check redscript.log

It is in `r6/log/redscript.log`.&#x20;

See if you can find any errors – warnings may or may not be a problem, see [here](finding-and-reading-log-files.md#warning) for context.

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

#### Resetting the redscript cache

* delete [`r6/cache`](#user-content-fn-21)[^21]
* verify game files
* create a new directory `r6/cache/modded` (this will prevent errors)
* Make sure that `r6/scripts` [is empty](#user-content-fn-22)[^22]
* Make sure that `red4ext/plugins` [is empty](#user-content-fn-23)[^23] (that the red4ext core frameworks aren't getting loaded)

{% hint style="success" %}
Make sure your game starts up without error.
{% endhint %}

### 4. Reinstall your mods

**Hopefully, your problem should be gone now.**&#x20;

It's time to put your mods back and see if you can start the game - see [Starting from Scratch](./#starting-from-scratch).



## XML Document parsed with errors

`XML document parsed with errors: C:\Path\toCyberpunk 2077\r6/config/inputUserMappings.xml`\
`Error description: Error parsing element attribute`

According to InputLoader's [documentation](https://www.nexusmods.com/cyberpunk2077/mods/4575), you can ignore this. Keep searching!\
(You can also try reinstalling InputLoader and hope that the error goes away)

<figure><img src="../../.gitbook/assets/troubleshooting_headers_everything_else.png" alt=""><figcaption></figcaption></figure>

## You forgot your CET keybind&#x20;

Delete the file `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\bindings.json.` The game should let you bind a new key at the next startup.

## Photomode screenshots are blank

With 1.62, screenshots are now saved to `Documents\CDPR\Cyberpunk\Screenshots` , and the previous location will receive an empty file.

## Press \[none] to continue

That is due to [Input Loader](https://www.nexusmods.com/cyberpunk2077/mods/4575) requiring an update.

## You're on Linux/Steam Deck

Under Linux, you have to start the game with&#x20;

```
WINEDLLOVERRIDES="winmm,version=n,b" %command% -modded
```

Otherwise, search the #red4ext-support channel on the [modding discord](https://discord.gg/redmodding) for winmm for further pointers.

{% hint style="info" %}
We're looking for someone to document Linux-specific troubleshooting!
{% endhint %}

## I have another problem that isn't on this list

Here's the catch-all solution. After this, your game _will_ work (or the problem you have is not Cyberpunk related).

1. (optional, as this might solve it): [Reset the Redscript cache](./#3.-reset-redscript).
2. If your problem doesn't go away, follow the instructions [in the next section](./#i-really-just-want-to-get-this-working-what-do-i-do).

## I really just want to get this working, what do I do?

<figure><img src="../../.gitbook/assets/troubleshooting_headers_tldr.png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
You might want to **deactivate ReShade** before you start debugging. Especially after DLSS, it has been known to cause crashes.
{% endhint %}

**The bad news** is, at this point you have little choice but to reset your Cyberpunk install and re-mod it from scratch. **The good news** is that the process is really streamlined. If you don't run into any hitches, you're <30 minutes away from a working game.

Now, how do we go about this?

### Is there a shortcut?

**Yes!** There is a batch script that will automate steps 1-4 of the list below for you.

If you don't want to download and run script files from the internet, you can go [here](./#step-1-temporarily-disable-all-your-mods) and complete the steps by hand. Otherwise:

1. Download [this script](https://raw.githubusercontent.com/manavortex/cyberpunk2077/master/batch/cyberpunk2077\_disable\_all\_mods.bat) (**right-click -> save as**)\
   _Link goes to the_ [_github repository_](https://github.com/manavortex/cyberpunk2077/blob/master/batch/cyberpunk2077\_disable\_all\_mods.bat) _of the person who wrote most of this guide_.
2.  **Optional**: If you don't want the script to delete modded files for you (because you just want to disable mods), right-click on the file and select **Edit**, then find and delete line 6:

    ```
    set DELETE_FILES=1
    ```
3. Now, do either of the following things:&#x20;
   1. Move it to your Cyberpunk install folder and double-click it
   2. Drag-and drop your Cyberpunk folder on the file that you downloaded
4. Follow the instructions and prompts,
5. You can now proceed to [Step 5](./#step-5-repair-game-files) and verify your game files.

{% hint style="success" %}
Instead of following these instructions, you can also [reinstall the game](./#the-nuclear-option-a-clean-install). Do yourself a favour and check the instructions, as you might be left with residual files otherwise.
{% endhint %}

### Step 1: Temporarily disable all your mods

#### Vortex

* Follow the instructions and prompts

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

and move it out of `plugins` (e.g. put it on your desktop).

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

Now that your un-modded game is starting, it's time to [install the core frameworks](./#a-fresh-install-starting-from-scratch). Do this **before** you enable your other mods, as they won't work without their dependencies and can only add problems at this stage.

{% hint style="info" %}
You can now re-enable your mods. Do it in chunks and check that the game keeps working so that you can narrow down where the problem is, in case it isn't gone for good.
{% endhint %}

## Dealing with a broken mod

<figure><img src="../../.gitbook/assets/troubleshooting_headers_troubleshooting_mod.png" alt=""><figcaption></figcaption></figure>

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
As per the last red box, do keep in mind that you're asking a **favour**. The modder doesn't have your problem, and if they do, they know **exactly** how to fix it. The most time-efficient response for them is to ghost you, so any kind of response is either them being nice or getting mad when you or someone involved ignores visible information.
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
A tip for [nil access error in lua](../../for-mod-creators/references-lists-and-overviews/scripting/scripting-best-practices-pitfalls.md#fixing-preventing-nil-access)
{% endhint %}

#### Ascending from user to modder

If the error isn't in any script files, you will have to **unbundle the .archive**, load it in [WolvenKit](https://github.com/WolvenKit/Wolvenkit/releases), and get your hands dirty. We'll be seeing each other, choomba!



##

[^1]: The directory where your game is installed. It's most likely called Cyberpunk 2077. Contains the folders archive, bin, engine… and the REDprelauncher.exe

[^2]: A mod that forces Cyberpunk to actually load the modded items instead of using the cache they had to put in for last-gen console support. For a technical explanation, check the wiki page about commonCookData.

[^3]: A mod that forces Cyberpunk to actually load the modded items instead of using the cache they had to put in for last-gen console support. For a technical explanation, check the wiki page about commonCookData.

[^4]: It's installed to bin\x64\plugins\cyber\_engine\_tweaks

[^5]: .archive mods in the redmod format

[^6]: .archive mods in the legacy format

[^7]: CET settings, radioExt files, Appearance Menu Mod settings _and user presets_

[^8]: Redscript directory

[^9]: TweakXL directory

[^10]: .archive mods in the redmod format

[^11]: an ancient plugin directory that hasn't been used for several game updates, but that can still cause trouble

[^12]: config and shader caches

[^13]: red4ext frameworks and associated data

[^14]: .archive mods in the legacy format, not redmod

[^15]: LUA plugins such as cyber engine tweaks

[^16]: The directory where your game is installed. It's most likely called Cyberpunk 2077. Contains the folders archive, bin, engine… and the REDprelauncher.exe

[^17]: The directory where your game is installed. It's most likely called Cyberpunk 2077. Contains the folders archive, bin, engine… and the REDprelauncher.exe



[^18]: The directory where your game is installed. It's most likely called Cyberpunk 2077. Contains the folders archive, bin, engine… and the REDprelauncher.exe



[^19]: as in, "a subfolder in the folder of"

[^20]: The directory where your game is installed. It's most likely called Cyberpunk 2077. Contains the folders archive, bin, engine… and the REDprelauncher.exe

[^21]: The script directory for non-Redmods

[^22]: If it isn't, rename the entire directory to scripts\_ and create a new empty folder in its place

[^23]: If it isn't, rename the entire directory to plugins\_ and create a new empty folder in its place
