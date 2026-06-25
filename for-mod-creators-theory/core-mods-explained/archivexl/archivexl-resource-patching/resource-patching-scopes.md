---
description: How to use scopes for resource patching
---

# Resource Patching: Scopes

## Summary

**Created:** Jun 25 2026 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention") (from [.](./ "mention"))\
**Last documented update:** Jun 25 2026 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will show you how to use **scopes** for patching multiple files at the same time.

### Why would I need this?

When adding components to the player (e.g. custom cyberware), you would have to patch both the first person and the third person player entity.&#x20;

> Imagine you have a material library where you define metals that you re-use across all your mods, **and** you have a mod that defines its own materials.&#x20;
>
> Since you are patching every mesh **at least twice**, you'll absolutely forget including that new refit into the second (or third) list, and this will make at least one Nexus user cry.
>
> Scopes solve this problem.

{% hint style="danger" %}
You can't overwrite scopes, and you can't remove anything from them. Only appending is possible!
{% endhint %}

## Using an existing scope

ArchiveXL already defines a bunch of scopes, for example

* the [player ent](https://github.com/psiberx/cp2077-archive-xl/blob/main/bundle/source/resources/PlayerBaseScope.xl)
* [player customization (e.g. appearances)](https://github.com/psiberx/cp2077-archive-xl/blob/main/bundle/source/resources/PlayerCustomizationScope.xl)
* [photomode .ent files](https://github.com/psiberx/cp2077-archive-xl/blob/main/bundle/source/resources/PhotoModeScope.xl)

Instead of targeting individual files, you can simply target the scope:

<details>

<summary>Code example: Photo Mode Files (existing scope)</summary>

```yaml
photo_mode.character.altPoses:
  - !append-once PhotoModePoses.tutorial__my_example_pose
  - !append-once PhotoModePoses.tutorial__my_example_pose_2

# or via yaml anchor
photo_mode.character.altPoses: *AddPosesF
# This will add the list &AddPosesF to the list of photo_mode.character.altPoses
```

{% hint style="info" %}
Photo mode scopes were added in ArchiveXL version 1.19
{% endhint %}

</details>

## Adding new scopes

You don't have to rely on existing scopes, as you can also **define** them.

{% hint style="warning" %}
Make sure that your scope name is **unique**, or you might end up patching other peoples' items by accident.
{% endhint %}

Define a custom scope like this, then you can immediately use it:

```yaml
resource:
  scope:
    your_unique_username__torso_item.mesh:      
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__base_body__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__ebbwtfbbq_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__more_realistic_body__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__boobs_for_back_problems__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__there_is_too_many_of_them__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__when_will_it_stop__torso_item.mesh
  patch:
    tutorial\equipment\torso\my_torso_item\meshes\t1__materials.mesh:
      - your_unique_username__torso_item.mesh
    tutorial\material_library\metal\_metal_materials.mesh:
      - your_unique_username__torso_item.mesh
    tutorial\material_library\emissive\_glowey_materials.mesh:
      - your_unique_username__torso_item.mesh
 
```

Now you only have one list to manage instead of three.

<details>

<summary>Example: The same yaml without a scope</summary>

This is how our yaml would look without scopes (imagine this with 10 or 20 files):

```yaml
resource:
  patch:
    tutorial\equipment\torso\my_torso_item\meshes\t1__materials.mesh:
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__base_body__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__ebbwtfbbq_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__more_realistic_body__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__boobs_for_back_problems__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__there_is_too_many_of_them__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__when_will_it_stop__torso_item.mesh
    tutorial\material_library\metal\_metal_materials.mesh:
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__base_body__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__ebbwtfbbq_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__more_realistic_body__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__boobs_for_back_problems__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__there_is_too_many_of_them__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__when_will_it_stop__torso_item.mesh
    tutorial\material_library\emissive\_glowey_materials.mesh:
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__base_body__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__ebbwtfbbq_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__more_realistic_body__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__boobs_for_back_problems__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__there_is_too_many_of_them__torso_item.mesh
      - tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__when_will_it_stop__torso_item.mesh
```

</details>

## Expanding existing scopes

If it becomes necessary, you can expand scopes and add your own files to them. For example:

```yaml
resource:
  scope:
    player_customization.app:
      - your_modder_name\patches\your_custom.app
```

## Filtering scopes

You can't **remove** things from scopes, but you can filter them while you're using them:

```yaml
resource:
  patch:
    tutorial\equipment\torso\my_torso_item\meshes\t1__materials.mesh:
      - your_unique_username__torso_item.mesh
      - !exclude tutorial\equipment\torso\my_torso_item\meshes\t1_pwa__ebbwtfbbq_item.mesh
```

You can also `!exclude` entire scopes (if they are defined):

```yaml
resource:
  patch:
    tutorial\equipment\torso\my_torso_item\meshes\t1__materials.mesh:
      - your_unique_username__torso_item.mesh
      - !exclude your_unique_username__but_not_these_guys.mesh
```
