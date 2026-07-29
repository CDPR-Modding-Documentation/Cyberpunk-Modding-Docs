# Dynamic Materials: Multiple variables

## Summary

**Published:** July 2026 by [infraredbe](https://app.gitbook.com/u/dfK1cxIRwzL3lJEG2abtgCwtivm2 "mention")

This tutorial will teach you how to use variables in mesh appearances. It builds upon knowledge of [.](./ "mention"); start there if you haven't read it yet.

{% hint style="info" %}
You need ArchiveXL ≥ 1.27 for this (released in August 2026)
{% endhint %}

## Tutorial

Sometimes you may want to pass multiple, independent variables to your appearances to fine tune your materials. Let's say for example you wanted to use the `{gender}` substitution to load a different `mlmask` per gender, and `{color}` from your variants array to load a different `mlsetup`.

Starting from your `.yaml` definition, you still would define your colors as usual:

```
Items.my_cool_shirt_$(color):
  $instances:
    - { color: white }
    - { color: red }
  appearanceName: my_cool_shirt_!$(color)
  ...
```

Your appearance and root entity remain the same:

<figure><img src="../../../../.gitbook/assets/image (673).png" alt=""><figcaption><p>appearance</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/image (678).png" alt=""><figcaption><p>root entity</p></figcaption></figure>

Changes begin at the mesh entity. You can use `+` notation, similar to how [#parameters-variants-what](../archivexl-dynamic-conversion-guide.md#parameters-variants-what "mention") works, to allow you to reference each variable independently. Here, we are using `{variant.1}` to get the color from the `.yaml` definition, and `{gender}` substitution to get `m` or `w` for the player gender.

<figure><img src="../../../../.gitbook/assets/image (682).png" alt=""><figcaption><p>mesh entity</p></figcaption></figure>

In your `.mesh`, in your appearances you will define all combinations of that you expect to see (in our case, `white` and `red` with both `m` and `w`; we're also using the appearance expansion feature to avoid having to copy/paste chunkMaterials):

<figure><img src="../../../../.gitbook/assets/image (683).png" alt=""><figcaption><p>appearances of .mesh</p></figcaption></figure>

Finally the magic happens: in the materialBuffer of the `.mesh`, you can access each of your `+`-separated variables using `{material.1}`, `{material.2}`, etc.

<figure><img src="../../../../.gitbook/assets/image (684).png" alt=""><figcaption><p>materialBuffer of .mesh</p></figcaption></figure>

In this dynamic material, we are setting the MultilayerSetup to `mlsetup_color_whitem.mlsetup` or `mlsetup_color_red.mlsetup` depending on the item variant, and the MultilayerMask to `mlmask_m.mlmask` or `mlmask_w.mlmask` depending on the character gender.

This example is a bit contrived, but you can use this to creatively mix substitutions with your own variants to simplify your files and reduce duplication. This is especially useful if you, say, want to load different materials based on `{skin_color}` or `{hair_color}`, which have many different values.

