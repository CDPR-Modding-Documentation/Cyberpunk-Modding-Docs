---
description: If your mods are causing trouble, here's what you can do
---

# User guide: Troubleshooting

## How to debug if your game isn't starting

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

If none of that helped, you'll want to reset your game to a clean install. Fortunately, you don't have to redownload the entire game for that.&#x20;

Rename or remove the following folders:

```
/mod
/plugins
/engine
/r6
/red4ext
/archive/pc/mod
```

and start your game client's file verification.&#x20;

{% hint style="success" %}
After the missing files have been recovered, you will now have what amounts to a clean install!
{% endhint %}

