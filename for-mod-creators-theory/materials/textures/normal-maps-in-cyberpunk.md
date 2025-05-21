---
description: Technical details about normal maps
---

# Normal Maps in Cyberpunk

## Summary

Created: Feb 21 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
Last documented update: Feb 21 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page contains technical details about Cyberpunk's normal maps. You can find a detailed explanation video at the end of the page.

### Wait, this isn't what I want!

* Check [self-made-normal-maps](../../../modding-guides/textures-and-luts/self-made-normal-maps/ "mention") to make your own.

## DirectX normal maps

Cyberpunk uses **DirectX** normal maps (screenshot: left). You can read more details about this e.g. [here (external page)](https://www.texturecan.com/post/3/DirectX-vs-OpenGL-Normal-Map/).

{% hint style="info" %}
If your normal map is **inverted**, you can use Photoshop or [photopea](https://www.photopea.com/) to invert your **green channel**.
{% endhint %}

<figure><img src="../../../.gitbook/assets/image (580).png" alt=""><figcaption></figcaption></figure>

### Baking in Blender

If you're using Blender to bake normal maps, use +X, -Y, and +Z, like so:

<figure><img src="../../../.gitbook/assets/image (579).png" alt=""><figcaption><p>Note G is using -Y, not +Y as default</p></figcaption></figure>

## Video explanation

{% embed url="https://www.youtube.com/watch?v=HJcbd4fxi1U" %}
Video by jato
{% endembed %}
