---
description: >-
  How do I get my fucking mod working and what do dependencies have to do with
  it?
---

# Users: troubleshooting requirements

## Summary

This page will give you an explanation of requirements ([#theory-what-is-a-requirement](requirements-explained.md#theory-what-is-a-requirement "mention")). After that, you will find a guide on debugging a dependency chain to troubleshoot a mod.&#x20;

The example will use [VirtualAtelier](https://www.nexusmods.com/cyberpunk2077/mods/2987?tab=description), but the same principle applies to each and any mod.

{% hint style="success" %}
In the process of this guide, you will be told to check a certain mod's log file. If you don't know how to do that, check [finding-and-reading-log-files.md](finding-and-reading-log-files.md "mention").
{% endhint %}

## Theory: What is a requirement?

It is something that your mod needs to work; for that reason, requirements are also called **dependencies**. The game will load them **first**.

Most of them are other mods.

<figure><img src="https://i.imgur.com/pBMF2XN.jpg" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
[Do you want to know more (about the core mods and what they do)?](../../for-mod-creators-theory/core-mods-explained/)
{% endhint %}

### Can't I download a mod and be done with it?

Unfortunately, that is not how computers work.&#x20;

### More detail

Cyberpunk 2077 offers native modding support via [redmod](../users-modding-cyberpunk-2077/redmod/ "mention"), but it is limited — if we&#x20;

## Guide: Debugging a mod that's not working

Now that we've gotten the theory out of the way, let's get to the practical part. Below, you find an example of how the process will look – and after that, you find the steps to complete it yourself.

#### Example

You're trying to get **VirtualAtelier** to work. There is no log file and you want the full version, so you investigate **ArchiveXL**.&#x20;

When you re-do [Level 1](requirements-explained.md#level-1-the-mod-itself), you can't find a log file for ArchiveXL either, so you look at its dependencies and find that you need **Red4ext**.

When you re-do [Level 1](requirements-explained.md#level-1-the-mod-itself) with Red4ext, you find an error in its log file that complains about **version incompatibility**. You realize that you forgot to complete [Level 2 Step 3](requirements-explained.md#level-2-the-requirements), update Red4ext, and Virtual Atelier starts working.&#x20;

Rejoice!

## Level 1: The mod itself

### Situation

You're trying to install a mod — and it's not working. How do we fix this?

### Step 0: Open your Cyberpunk game directory

If you aren't there yet, open your Cyberpunk 2077 **game folder** ("Browse local files" in Epic/Steam/GOG). This is where you installed the game.

### Step 1: Try to find its log file

{% hint style="info" %}
* if you're debugging an Atelier Store, start with [VirtualAtelier ](https://www.nexusmods.com/cyberpunk2077/mods/2987)as a dependency.
{% endhint %}

1. Use the Windows Search to find a matching log file (e.g. search for the mod's name - [here](finding-and-reading-log-files.md) are more instructions if you need them).&#x20;
2. If you have found a log file, read on under [#a-log-file-exists](requirements-explained.md#a-log-file-exists "mention")
3. If you have not found one or if it contains no errors or warnings, go to [your-own-hud-icons.md](../../modding-guides/custom-icons-and-ui/your-own-hud-icons.md "mention")

### A log file exists

\-> If you can't find one, read on under [#the-file-only-has-warnings](requirements-explained.md#the-file-only-has-warnings "mention").

#### The file is empty

This means that your mod is **loaded**, but never **initialized**. Go to [#there-is-no-log-file-or-its-empty](requirements-explained.md#there-is-no-log-file-or-its-empty "mention")

#### The file has errors

Something is wrong with the mod itself. You can now go and [troubleshoot it](./#dealing-with-a-broken-mod).

#### The file only has warnings

Your mod is being loaded, so the dependencies are OK (if they aren't, the log file would tell you so).

Warnings in the log file don't necessarily mean that something is outright broken. But since you're here and your mod isn't working, that is probably the case. Proceed with [troubleshooting](./#dealing-with-a-broken-mod).

### There is no log file, or it's empty

The good news: the mod itself is not the problem.&#x20;

The bad news: you'll have to check its requirements.&#x20;

[Let's do that now](requirements-explained.md#level-2-the-requirements): read on under [#level-2-the-requirements](requirements-explained.md#level-2-the-requirements "mention")

## Level 2: The requirements

### Step 1: Finding the requirements

Open the mod's Nexus page and check the **Description** tab (the first one). You will see something like this:

<figure><img src="../../.gitbook/assets/dependencies_find_on_nexus.png" alt=""><figcaption><p>If you don't know if a mod is optional, it's most likely not.</p></figcaption></figure>

### Step 2: Re-do Step 1 for each requirement&#x20;

For each of the dependencies, repeat the following steps:

1. Check if it is **optional**.&#x20;
   * If there is a condition and you meet it (e.g. "if you are using Codeware" and you are using Codeware), consider it **not optional**.
2. If it's no optional, **install it**.
3. If you already have it installed, update it.

Now that you have the requirement installed, it's time to re-do [Level 1](requirements-explained.md#level-1-the-mod-itself), but do it with the **requirement**.

