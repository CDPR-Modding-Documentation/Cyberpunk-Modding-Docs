---
description: How to hot reload things with RedHotTools
---

# RHT: Hot Reload

## Summary

**Published:** Aug 18 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented edit:** Aug 18 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page describes Red Hot Tools's **Hot Reload mechanism**.

## How it works

Although there is a CET overlay, Hot Reload is fully integrated with Wolvenkit and Visual Studio Code — you don't have to do anything except pushing the right button.

### The theory

As you know, Cyberpunk 2077 loads its mods from `archive/pc/mod`. While you run around in Night City, it will keep them open and use the files inside as it needs them.&#x20;

{% hint style="info" %}
As far as the game is concerned, the `.archive` files never change.&#x20;
{% endhint %}

By placing `.archive`s inside the `hot` folder, you put them under the control of RHT, which will add them to the game's internal pool of never-changing content:

<figure><img src="../../../.gitbook/assets/rht_hot_reload__file_system.png" alt=""><figcaption></figcaption></figure>

### But the folder is always empty!

That's because RHT moves the file into `mods` so that the game can pick it up. Don't worry, if your files disappear from `hot`, that means everything is working as intended.

### But my changes don't show up!

You may need to re-trigger the game's change detection. Here's how:

* Loading a save (always works)
* Unequipping and re-equipping the item you're modifying (usually works)

## Integrations

### Wolvenkit

Simply push the "Hot Reload" button in your toolbar:

<figure><img src="../../../.gitbook/assets/rht_hot_reload_wolvenkit.png" alt=""><figcaption></figcaption></figure>

### Visual Studio Code

{% hint style="info" %}
To be done
{% endhint %}



## The Cet overlay

### Archives

Here, you can manually trigger a reload. This should never be necessary.

<figure><img src="../../../.gitbook/assets/rht_hot_reload__archives.png" alt=""><figcaption></figcaption></figure>

### Scripts

Here, you can manually trigger a reload. This should never be necessary.

<figure><img src="../../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

### Tweaks

Here, you can manually trigger a reload. This should never be necessary.

<figure><img src="../../../.gitbook/assets/rht_hot_reload__tweaks.png" alt=""><figcaption></figcaption></figure>

