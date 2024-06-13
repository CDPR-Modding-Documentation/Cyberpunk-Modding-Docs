---
description: Put all your things in one spot, then use them as a template
---

# ArchiveXL: Resource patching

## Summary

**Published:** May 18 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** May 18 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

{% hint style="danger" %}
The example below uses **mesh materials** as an example, but these aren't even the tip of the iceberg. By using this technique, we can re-work everything, from CDPR's messed-up material paths up to the character creator.&#x20;

Until the more comprehensive knowledge drops, this guide will be a placeholder.
{% endhint %}

This page will eventually explain **resource patching**. For now, you can find a guide here on how to use it on a single isolated use case, which will already come in handy for clothing modders!

{% hint style="success" %}
For the most efficient way to define multiple materials, check out [archivexl-dynamic-materials.md](../../../modding-guides/textures-and-luts/archivexl-dynamic-materials.md "mention")!
{% endhint %}

## Why do I need this?

While [archivexl-body-mods-and-refits](archivexl-body-mods-and-refits/ "mention") has solved one problem, it introduced a new one. You now have a bunch of meshes inside your .archive, and you have to copy the materials across each of them.

## How do I use this?

Add the following lines to your `.xl` file:

```yaml
resource:
    patch:        
        tutorial\archive_xl\your_new_item\materials.mesh: # relative path to your material mesh
            - tutorial\archive_xl\your_new_item\pwa.mesh
            - tutorial\archive_xl\your_new_item\pma.mesh
```

And just like that, it will work.

## What else can I patch?

You can patch pretty much everything! Give it a try via `.xl` file.&#x20;

### Distributed patching: Scopes

Some things are scattered across multiple files — for example, there are different player entities for first and third person. Fortunately, ArchiveXL solves this problem in the cradle by defining patchable scopes. You can find examples on the github repository:

* the [player ent](https://github.com/psiberx/cp2077-archive-xl/blob/main/data/PlayerBaseScope.xl)
* [player customization (e.g. appearances)](https://github.com/psiberx/cp2077-archive-xl/blob/main/data/PlayerCustomizationScope.xl)

Use them like this:

```yaml
resource:
    patch:
        tutorial\archive_xl\player_patch.ent:
          - !include player.ent # or player_ma.ent / player_wa.ent
```

### Expanding scopes

If it becomes necessary, you can expand scopes and add your own files to them. For example:

```yaml
resource:
  scope:
    player_customization.app:
      - your_modder_name\patches\your_custom.app
```

{% hint style="danger" %}
You can't overwrite scopes, and you can't remove anything from them. Only appending is possible!
{% endhint %}
