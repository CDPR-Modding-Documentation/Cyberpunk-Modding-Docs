---
description: If your mods are causing trouble, here's what you can do
---

# User guide: Troubleshooting



{% hint style="info" %}
This page contains troubleshooting information for end users (people who are not modders). You will find step-by-step guides what to do if your game isn't starting or if your mods aren't working as you expect them to.
{% endhint %}

## Your game isn't starting

What to do?

### Step 1: Disable all your mods

If you're running a mod manager (such as Vortex), **disable** them.&#x20;

Otherwise, find the following folders:

```
Cyberpunk 2077\archive\pc\mod
Cyberpunk 2077\mods
```

and rename them to&#x20;

```
Cyberpunk 2077\archive\pc\mod_
Cyberpunk 2077\mods_
```

{% hint style="success" %}
`Check if your game starts`
{% endhint %}

### Step 2: disable CET

If your game still doesn't start, find the directory&#x20;

```
Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks
```

and rename it to `cyber_engine_tweaks_`.&#x20;

{% hint style="danger" %}
If you'd rather delete it, make sure that you retain a copy of your `plugins` directory, as it contains your mod settings (AMM decorations etc.)
{% endhint %}

{% hint style="success" %}
Check if your game starts
{% endhint %}

### Step 3: Remove scripts and tweaks

First, remove the cache:&#x20;

```
 r6/cache/modded
```

{% hint style="success" %}
Check if your game starts
{% endhint %}

If that didn't do the trick, find the following folders:

```
Cyberpunk 2077\red4ext
Cyberpunk 2077\r6\scripts
Cyberpunk 2077\r6\tweaks
Cyberpunk 2077\r6\tools
```

and rename them, you know the drill.

{% hint style="success" %}
Check if your game starts
{% endhint %}

### Step 4: Remove RedScript

Delete the following files and folders:

```
Cyberpunk 2077\bin\x64\d3d11.dll
Cyberpunk 2077\bin\x64\global.ini
Cyberpunk 2077\bin\x64\powrprof.dll
Cyberpunk 2077\bin\x64\winmm.dll
Cyberpunk 2077\bin\x64\version.dll
Cyberpunk 2077\engine\config
Cyberpunk 2077\engine\tools
Cyberpunk 2077\r6\cache\modded
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
rm ./r6/cache/modded
rm ./r6/config
rm ./r6/inputs
rm ./V2077

mv ./r6/cache/final.redscripts.bk ./r6/cache/final.redscripts
```

### Step 5: Repair game files

_Exact procedure as documented by @ArsenicTouch_

#### GOG

Go to Games -> Installed, right-click on your game and select the following menu entry:

![](<../.gitbook/assets/image (2).png>)

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

### Launch the game

The game should launch now — all files you deleted have been re-acquired.&#x20;

{% hint style="info" %}
You can now re-enable your mods. Do it in chunks and check that the game keeps working so that you can narrow down where the problem is, in case it isn't gone for good.
{% endhint %}

## Finding the broken mod (log files)

Open your Cyberpunk game folder and use the windows search to search for `.log`

{% hint style="info" %}
Make sure to include the dot: `.log`
{% endhint %}

<figure><img src="../.gitbook/assets/userguide_logs.png" alt=""><figcaption><p>You should see something like this</p></figcaption></figure>

Now, delete all those files. Don't worry, they will be re-created on next launch.

{% hint style="danger" %}
Don't delete anything that isn't a text document ending in .log, this might break your game.
{% endhint %}

Start your game again. Now do whatever causes your problem to occur.

Search the Cyberpunk directory for `.log` again.&#x20;

{% hint style="info" %}
Tip: Sort the files by size by clicking on the Windows Explorer column header.&#x20;
{% endhint %}

{% hint style="info" %}
You can ignore all files that have a size of 0, as they will be empty.&#x20;
{% endhint %}

One of these files should contain an error message. You can use it to try and isolate your problem.

## Finding the broken mod (bisecting)

First, go to your mod directory under

```
Cyberpunk 2077\archive\pc\mod
```

and re-name the entire directory to mod\_.&#x20;

{% hint style="success" %}
Start the game. If the problem isn't gone now, it's something more major — in that case, follow the steps [above](user-guide-troubleshooting.md#how-to-debug-if-your-game-isnt-starting).
{% endhint %}

If the problem is gone, create a new, empty folder "mod". Now, we need to roughly narrow down which mod has the error.&#x20;

Move over half of the mods from your backup folder `mod_`, then start the game.

You will now run into one of two scenarios:

1. The error is gone: swap out the content of your mod folder with the last chunk you moved to the backup folder. Validate that the error persists, go to 2.
2. The error is still there: Move half of the files from your mod folder into your backup folder and start the game and check your problem.&#x20;

Repeat this process until you have identified the problem child!

## The nuclear option: a clean install

If none of the troubleshooting steps above helped and your game won't start, you'll want to reset it to a clean install. Fortunately, you don't have to redownload the entire game for that.&#x20;

Rename or remove the following folders:

```
/mod
/plugins
/engine
/r6
/red4ext
/archive/pc/mod
```

## Redscript Compilation Failed

![](../.gitbook/assets/troubleshooting\_redscript\_compilation\_failed.png)

If the error goes away at any point during this guide, abort.

### 1. Make sure that you have the latest versions

{% hint style="danger" %}
Actually check this. Do not rely on memory or common sense. If in doubt, re-download.
{% endhint %}

1. Check [Redscript](https://github.com/jac3km4/redscript/releases/)
2. Check [Cybercmd](https://github.com/jac3km4/cybercmd/releases)

{% hint style="info" %}
These links go to github. This site is legit, it's where they are before being uploaded to Nexus.
{% endhint %}

Check that you have the latest versions of all troublesome Redmods.

### 2. Check redscript.log

It is in `r6/log/redscript.log`. See if you have any ideas to resolve the error.

### 3. Reset Redscript

{% hint style="warning" %}
If you rename or delete any directories, make sure to create a new, empty directory.
{% endhint %}

#### Disable your mods

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
Make sure your game starts up without error.
{% endhint %}

### 4. Reinstall your mods

It's time to put your mods back and see if you can start the game. If you start with the most common ones (such as [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl/releases/)/[TweakXL](https://github.com/psiberx/cp2077-tweak-xl/releases/)), you can find further help if you run into issues.

{% hint style="danger" %}
Do **not** add all mods at once. Install them in chunks and verify that your game starts correctly. (see "[Finding the broken mod (bisecting)](user-guide-troubleshooting.md#finding-the-broken-mod-bisecting)" for further intel).
{% endhint %}

**Hopefully, your problem should be gone now.**&#x20;

If it isn't, see "[Finding the broken mod (bisecting)](user-guide-troubleshooting.md#finding-the-broken-mod-bisecting)" as for how to identify the broken mod.&#x20;

#### If you are using a mod manager: Try installing it manually

While mod managers are very reliable and get better with every new release, you should rule out that they are the cause of the problem by installing the mod from hand.

If everything else works and installing the mod by hand still breaks compilation, then it is broken. See "[Dealing with a broken mod](user-guide-troubleshooting.md#dealing-with-a-broken-mod)" below. start your game client's file verification.&#x20;

{% hint style="success" %}
After the missing files have been recovered, you will now have what amounts to a clean install!
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

Often, the description contains detailed installation instructions, known incompatibilities and/or workarounds. Sometimes, mods worked on past versions of Cyberpunk, but the author stopped updating. In that case, proceed to [point 5](user-guide-troubleshooting.md#5.-hands-on-troubleshooting) of this list.

{% hint style="danger" %}
Before you get upset, please keep in mind that modders don't do this for a living (these are called "game developers" and they get paid for it). Somebody made this **in their spare time, for their own use,** and then decided to **share it with you for free**. Do you know the easiest way to avoid toxic users? It's **not publishing your mods**. No reward system, credit points or reputation will ever make up for online abuse.

As a mod author, I can tell you that I will ignore assholes, but gladly spend an extra hour after work to help out someone who politely asks me for help.
{% endhint %}

### 3. Check the mod's comment section

You're unlikely to be the first person to run into this problem. There is a good chance that the comment section on the download page has helpful information. Look for either a pinned post by the mod's author or a user discussion about your problem — these often contain a solution.

### 4. Contact the mod's author

Describe your problem as clearly as you can, and add all useful data.&#x20;

**Bad bug report:** "Your mod doesn't work lol pls help"

**Good bug report (example)**: "Hi, installing your mod (manually and Vortex) causes a Redscript compilation error on startup (possible screenshot of error popup). xxx.log says \<citation of error message>. All my dependencies are up-to-date, and I've ruled out that it's any other mod. Can you help me out?"

**Good bug report (example 2)**: "Hi, when I try to equip Item \<item name and colour>, it doesn't show up and I only get glitches. I'm using Hyst's boob mod and \<specific version and variant> of your mod. I hope you can help me? Thank you for making this."

{% hint style="danger" %}
As per the last red box, do keep in mind that you're asking a **favour**. The modder doesn't have your problem, and if they do, they know exactly how to fix it.&#x20;
{% endhint %}

### 5. Hands-on troubleshooting

At this point, you have exhausted all easily accessible solutions. If you still want the mod to work, you will have to get involved yourself. A commendable attitude! (Not sarcasm, it really is.)

{% hint style="info" %}
This is the point where you might want to join a [modding discord](https://discord.gg/redmodding), because now you're entering the territory where other modders can actually help you.
{% endhint %}

#### [Check the log files](user-guide-troubleshooting.md#finding-the-broken-mod-log-files)

Usually, there will be a [log file](user-guide-troubleshooting.md#finding-the-broken-mod-log-files) that will point you towards the source of your problem. If there isn't (the game loads and the mod just fails silently), that means that the error is inside the archive and you have to become a modder.

#### Fixing scripts

But sometimes, you're lucky. Sometimes, the error is in a script file. You can tell this by a log entry pointing towards a file in your Cyberpunk folder (e.g. `r6\scripts\my_broken_script.reds`).

Open up that file in a text editor like [Notepad++](https://notepad-plus-plus.org/downloads/) and try to find and fix the problem. Sometimes, the log file has more information. Sometimes, an online syntax check can help you — there isn't one for redscript, but it's fairly close to lua.&#x20;

Sometimes, such mistakes are trivial — a forgotten **,** or incorrect file encoding. Often, they are not.

{% hint style="info" %}
A tip for [nil access error in lua](../modding-guides/everything-else/scripting-best-practices-pitfalls.md#fixing-preventing-nil-access)
{% endhint %}

#### Ascending from user to modder

If the error isn't in any script files, you will have to **unbundle the .archive**, load it in [WolvenKit](https://github.com/WolvenKit/Wolvenkit/releases), and get your hands dirty. We'll be seeing each other, choomba!

##

##
