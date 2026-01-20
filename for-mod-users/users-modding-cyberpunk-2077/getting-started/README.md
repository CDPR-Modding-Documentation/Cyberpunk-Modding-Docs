---
description: >-
  Install the core requirements for Cyberpunk2077 modding, decide how to manage
  your mods, and set up a mod manager
---

# Getting Started: Installing Cyberpunk

## Summary

**Last documented update:** January 19th, 2026 by [minnierylands](https://app.gitbook.com/u/VSIYzNHUyRPaBCk2ExHhQzpPfo82 "mention")

{% hint style="danger" %}
While it is _possible_ to install mods by hand, we recommend using a mod manager.
{% endhint %}

This guide will walk you through installing and configuring your game. If you have already done that, you can configure the mod manager of your choice:

<table data-card-size="large" data-view="cards"><thead><tr><th align="center"></th><th data-hidden data-card-cover data-type="image">Cover image</th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td align="center"><h4>Vortex</h4></td><td data-object-fit="contain"><a href="../../../.gitbook/assets/vortex-logomark.png">vortex-logomark.png</a></td><td><a href="vortex-mod-manager.md">vortex-mod-manager.md</a></td></tr><tr><td align="center"><h4>Mod Organizer 2</h4></td><td><a href="../../../.gitbook/assets/37225415.png">37225415.png</a></td><td><a href="mo2-mod-organizer-2.md">mo2-mod-organizer-2.md</a></td></tr></tbody></table>

{% hint style="info" %}
To learn how to install mods, check [Using Mods](../)
{% endhint %}

***

## Prerequisites

* You have [**bought** Cyberpunk 2077](#user-content-fn-1)[^1] on the platform of your choice (Steam, GOG or EPIC)
* You have the following things:
  * [Visual C Redistributable 2022](https://aka.ms/vs/17/release/vc_redist.x64.exe)
  * [.NET 6.0+](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
* You have updated the following things:
  * [Your graphics card](https://www.wikihow.com/Update-Your-Graphics-Driver) driver
  * The latest [Windows Update](https://www.wikihow.com/Update-Windows) for your operating system (checkout [modding-on-linux.md](../modding-on-linux.md "mention") if that's what you're doing)

***

## Installing the Game

{% hint style="success" %}
If you already have the game installed, you can skip this section and proceed with [Configuring the Game](./#configuring-the-game)
{% endhint %}

In order to set up your game to be best suited for mods, you'll want to keep some things in mind:

* Installing Cyberpunk 2077 on an SSD can speed up load time
* Installing Cyberpunk 2077 outside of `Program Files` can stop Windows "protecting" your files

For the purpose of this guide, we will assume the following install paths:

<table data-header-hidden><thead><tr><th width="267"></th><th></th></tr></thead><tbody><tr><td>Game install</td><td><code>C:\Games\Cyberpunk 2077</code></td></tr><tr><td>Mod download and staging</td><td><code>C:\Games\Mods</code></td></tr></tbody></table>

***

#### Permissions

{% hint style="warning" %}
Folder permissions **can** cause problems down the line, especially for Windows users.&#x20;

Most users never run into these, but you can prevent them altogether by installing your game to a folder like `C:\Games` rather than `C:\Program Files.`
{% endhint %}

By default, all three platforms (GOG, Steam, and Epic) want to install the game to their own install location, which defaults to `C:\Program Files`. Unfortunately, Windows is fussy about what it will permit there, which is not much.

This **can** cause problems in two different spots by "protecting" the Cyberpunk install directory from:

* Modding tools such as mod managers (like our recommendation [Vortex](vortex-mod-manager.md))&#x20;
* CDPR's own REDmod launcher.&#x20;

But hey, at least things are very secure.

You likely won't run into any of these problems, but you can rule them out altogether by installing Cyberpunk to a directory other than `C:\Program Files` or `C:\Program Files(x86)`, like `C:\Games\Cyberpunk 2077`

***

### Installation Guide

Now we will go through the install options to use on each platform to accomplish this, and the recommended settings for modded Cyberpunk 2077.&#x20;

{% hint style="info" %}
Just choose the header below for which platform you're using!
{% endhint %}

{% tabs %}
{% tab title="Installing Through GOG" %}
### Installing Cyberpunk: GOG

{% hint style="success" %}
If you already have the game installed, you can skip this section and proceed with [Configuring Cyberpunk](./#configuring-cyberpunk-gog)
{% endhint %}

1. Open GOG Galaxy, click on "`Owned Games`" in the left sidebar.\
   Scroll until you find Cyberpunk.&#x20;

***

2. Single click on its picture to display the main Cyberpunk page.

***

3. Click the button at the top of the page labeled "`Install`".

***

4. In the pop-up window, choose your install location:

* Click the drop-down box
* Select "`browse`"
* Browse to the target folder (we're assuming `C:\Games`)

{% hint style="info" %}
You don't need to create a subfolder for Cyberpunk, as GOG will do that for you.
{% endhint %}

***

5. **Optional**: Select a game language other than English

***

6. **Optional**: Create a desktop shortcut by ticking the first box "`Create desktop shortcut`"

***

7. **Optional, but recommended**: Disable auto-updates by unchecking the second box "`Keep this game up to date automatically`"

<figure><img src="../../../.gitbook/assets/image (195).png" alt=""><figcaption><p>How the window should look for recommended install.</p></figcaption></figure>

***

8. Press "`Install`"

***

9. Wait until GOG has done it's thing, then proceed to the next section.
{% endtab %}

{% tab title="Installing Through Steam" %}
### Installing Cyberpunk: Steam

{% hint style="success" %}
If you already have the game installed, you can skip this section and proceed with [Configuring Cyberpunk](./#configuring-cyberpunk-steam)
{% endhint %}

To be done


{% endtab %}

{% tab title="Installing Through Epic" %}
### Installing Cyberpunk: Epic

{% hint style="success" %}
If you already have the game installed, you can skip this section and proceed with [Configuring Cyberpunk](./#configuring-cyberpunk-epic)
{% endhint %}

To be done


{% endtab %}
{% endtabs %}

***

## Configuring the Game

Great, now the game is installed!&#x20;

To get the recommended settings, and to start modding your game, follow one of the guides below.

### Configuration Guide

{% hint style="info" %}
Just choose the header below for which platform you're using!
{% endhint %}

{% tabs %}
{% tab title="Configuring Through GOG" %}
### Configuring Cyberpunk: GOG

Once the game has installed, we want to make it run with mods.&#x20;

1. Click the button to the right of the **`Play`** button (formerly the `install` button) pictured below.

<figure><img src="../../../.gitbook/assets/image (161).png" alt=""><figcaption><p>The Cyberpunk 2077 main page on GOG, with the sidebar open on the left</p></figcaption></figure>

***

2. From there, select "**`Manage Installation`**" and then "**`Configure`**". A window will pop up where you can change your desired settings:
   * Installation (first tab): Disable auto-updates
   * DLC (third tab): Select at least **`Cyberpunk 2077 REDMod`**

<figure><img src="../../../.gitbook/assets/CP2077 Modding Guide GOG Setup Merged Image.png" alt=""><figcaption><p>You may select any additional settings you like, but these are the minimum recommended options.</p></figcaption></figure>

***

3. Click the **`OK`** button to return to the game's page.

***

4. Click **`Play`** on the game's page

***

5. Click the **`Settings`** button and **Enable mods**
   * If you can't enable mods, it means REDmod is not installed. **Go back and repeat step 2**.

***

6. Click **`Play`** (Do not skip this)

{% hint style="success" %}
That's it, you are done with your install of the game! You can now move on to [#starting-to-mod](./#starting-to-mod "mention")!
{% endhint %}
{% endtab %}

{% tab title="Configuring Through Steam" %}
### Configuring Cyberpunk: Steam

1. Navigate to _Cyberpunk 2077_

***

2. Click **`Play`**

***

3. Click the **`Settings`** button and **Enable mods**
   * If you can't enable mods, that means **REDmod is not installed**. Check the game's DLCs and make sure to get it.

***

4. Click **`Play`** (Do not skip this)

{% hint style="success" %}
That's it, you are done with your install of the game! You can now move on to [#starting-to-mod](./#starting-to-mod "mention")!
{% endhint %}
{% endtab %}

{% tab title="Configuring Through Epic" %}
### Configuring Cyberpunk: Epic

1. Navigate to _Cyberpunk 2077_

***

2. Click **`Play`**

***

3. Click the **`Settings`** button and **Enable mods**
   * If you can't enable mods, that means **REDmod is not installed**. Check the game's DLCs and make sure to get it.

***

4. Click **`Play`** (Do not skip this)

{% hint style="success" %}
That's it, you are done with your install of the game! You can now move on to [#starting-to-mod](./#starting-to-mod "mention")!
{% endhint %}
{% endtab %}
{% endtabs %}

***

## Starting to mod

You now have the following options:

* If you're not confident in modding your game, follow the extremely detailed guide under [vortex-mod-manager.md](vortex-mod-manager.md "mention")
* Otherwise, you can head to [..](../ "mention") and start reading on how to do this

[^1]: .Pirated copies generally do not mod well.
