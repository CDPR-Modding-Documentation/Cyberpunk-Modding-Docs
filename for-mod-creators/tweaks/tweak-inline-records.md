---
description: What's Inline8, and how do I change it?
---

# Tweak Inline Records

## Summary

**Created:** 22 May 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** 22 May 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

## What are inline records?

{% hint style="info" %}
**TL;DR:** The names are generated at compile-time with every patch, so the order may change. Don't use them, rather create a full copy.
{% endhint %}

Sometimes, you will come across records with names like `Items.Preset_Overture_River_inline0`. That tells us exactly nothing, so what are they?

As we have learned in [how-to-yaml-tweak-modding-basics.md](../modding-guides/tweakxl-changing-game-records/how-to-yaml-tweak-modding-basics.md "mention") -> [#records](../modding-guides/tweakxl-changing-game-records/how-to-yaml-tweak-modding-basics.md#records "mention"), it is possible to nest records like Russian dolls. Inline records are exactly that: nested records, which are not defined anywhere but in the context that uses them.

{% hint style="success" %}
[browsing-the-tweak-database.md](tweaks/browsing-the-tweak-database.md "mention")contains the full intel on how to find your way around.&#x20;
{% endhint %}

Let's take a quick look. This is the tweak as read from the Tweak DB:

<figure><img src="../../.gitbook/assets/overture_river_inline.png" alt=""><figcaption><p>The record's properties in <a data-mention href="tweaks/browsing-the-tweak-database.md#the-wolvenkit-tweak-browser">#the-wolvenkit-tweak-browser</a>. Screenshot kindly provided by Seberoth</p></figcaption></figure>

You can use Wolvenkit's [Tweak Browser](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser "mention") to take a look at the properties:

<figure><img src="../../.gitbook/assets/overture_river_inline_tweakbrowser.png" alt=""><figcaption></figcaption></figure>

If you want to use these effectors, you should define a copy in your yaml.

