# ArchiveXL: Resource linking

## Summary

**Published:** May 18 2024 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** May 18 2024 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

Starting with version 1.14, ArchiveXL allows you to create **resource symlinks**. This guide will teach you how to avoid duplicate meshes for dynamic substitution that way.

If you want to avoid duplicate material definitions, check [archivexl-resource-patching.md](archivexl-resource-patching.md "mention").

## Why do I need this?

While [archivexl-body-mods-and-refits](archivexl-body-mods-and-refits/ "mention") has solved one problem, it introduced a new one. If you want to use the preferred approach of [**mesh path substitution**](archivexl-dynamic-conversion-guide.md#method-2-component-substitution), you'll end up with a million duplicate files.



<figure><img src="../../../.gitbook/assets/image (421).png" alt="" width="184"><figcaption></figcaption></figure>

While [archivexl-resource-patching.md](archivexl-resource-patching.md "mention") will let you keep your materials in one spot, why would the **chest size** be relevant for a pair of socks? Rhetorical question, it's not. But body types don't care.

This is where **linking** comes in.

## Problem

You have a jacket, and you made a`big_boobs` refit for all fo the bodies with back problems:&#x20;

```
yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__big_boobs.mesh
```

However, thanks to [component stubstitution](archivexl-dynamic-conversion-guide.md#method-2-component-substitution), the game will still try to load the following:

```
yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__lush.mesh
yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__ebb.mesh
yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__ebbp.mesh
yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__ebbrb.mesh
yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__ebbprb.mesh
yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__angel.mesh
```

... and if it doesn't find them, it will fall back to `t2_084_pwa__base_body.mesh`, which will clip.

## Solution

The solution is as simple as it is brilliant: ArchiveXL can create **links**.

```yaml
resource:
  link:  
    yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__big_boobs.mesh:
      - yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__lush.mesh
      - yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__ebb.mesh
      - yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__ebbp.mesh
      - yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__ebbrb.mesh
      - yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__ebbprb.mesh
      - yourname\clothing\torso\your_jacket\meshes\t2_084_pwa__angel.mesh
```

When the game tries to read `t2_084_pwa__ebb.mesh`, ArchiveXL will gently but firmly take it by the hand and point it towards `t2_084_pwa__big_boobs.mesh` instead. And it will never even know.

Now we can do away with the extra components and simply use body mod substitution — and anything duplicate can be linked.&#x20;

{% hint style="success" %}
You can now also give your `.mesh` files passive aggressive filenames and then use substitution to hook them up to the body mods. The possibilities are endless!
{% endhint %}
