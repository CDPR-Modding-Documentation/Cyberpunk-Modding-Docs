---
description: >-
  How dynamic appearances can use different meshes/submeshes in a single root
  entity file.
---

# Dynamic Appearances: fine-tuning visibility conditions

## Summary

**Published**: Sep 09 2024 by [Sumi](https://app.gitbook.com/u/7RcQS2blS1QZY9a7AwDx4GUHnsJ2 "mention")\
**Last documented edit:** Sep 09 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page is an extension of [ItemAdditions: Dynamic Appearances](./) and explains how to fine-tune item visibility conditions beyond the basic scope.

## Via root entity

You can use yaml instances to create different appearance names. These let you use different root entity entries which can point at different appearances in the .app file – letting you use `partsOverride` to show or hide different parts of your item!

Let's look at an example.

### Editing the .yaml

We're adding the `type` parameter to the custom t-shirt's definition array.

<pre class="language-yaml"><code class="lang-yaml"><strong>  $instances:
</strong>    - { type: sleeves, base_color: white, ribbons: red,  icon: 01 }
    - { type: nosleeves, base_color: black, ribbons: red,  icon: 02 }
</code></pre>

Since the `variants` only start after the exclamation mark, we can generate different appearance names:

before:

```yaml
appearanceName: root_entity_dynamic_appearance_!$(base_color)+$(ribbons)
```

after:

```yaml
appearanceName: root_entity_dynamic_appearance_$(type)_!$(base_color)+$(ribbons)
```

This will look up the following names in your root entity:

`root_entity_dynamic_appearance_sleeves_`&#x20;

`root_entity_dynamic_appearance_nosleeves_`

Then you would add the following entries to your `.app` file with the `name`s :

`root_entity_dynamic_appearance_sleeves_`&#x20;

`root_entity_dynamic_appearance_nosleeves_`

Now you have options. The next step will depend on your goals. In the `.app` file, you could use `partsOverrides` to hide different parts of the mesh for each appearance (like the sleeve submesh for the no-sleeve version. See [Chunkmasks: partially hiding meshes](../../../../for-mod-creators-theory/files-and-what-they-do/file-formats/3d-objects-.mesh-files/submeshes-materials-and-chunks.md#chunkmasks-partially-hiding-meshes)), or you could set `partsValues` to different `mesh.ent` files (like a standard and looser-fitting version).

## But wait, couldn't I accomplish this by doing \[x] instead?

Yes, probably. During your exploration of the wiki you will likely come across many different ways to create item variants. The benefit is that you don't have to manage as many root entity files, but it's just a matter of preference and what works best for your project.
