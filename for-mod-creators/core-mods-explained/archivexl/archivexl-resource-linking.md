# ArchiveXL: Resource linking

## Summary

**Published:** May 18 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** May 18 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

Starting with version 1.14, ArchiveXL allows you to create **resource symlinks**. This guide will teach you how to avoid duplicate meshes for dynamic substitution that way.

If you want to avoid duplicate material definitions, check [archivexl-resource-patching.md](archivexl-resource-patching.md "mention").

## Why do I need this?

While [archivexl-body-mods-and-refits](archivexl-body-mods-and-refits/ "mention") has solved one problem, it introduced a new one. If you want to use the preferred approach of **meth path substitution**, then you'll end up with a million duplicate files.



<figure><img src="../../../.gitbook/assets/image (332).png" alt="" width="184"><figcaption></figcaption></figure>

While [archivexl-resource-patching.md](archivexl-resource-patching.md "mention") will let you keep your materials in one spot, why would the **chest size** be relevant for a pair of socks?&#x20;

Rhetorical question, it's not. But body types don't care.

This is where linking comes in.



## Linking resources

Like most other things, you do this by adding a block to your `.xl` file. The example below will re-use the item for `rb` (Hyst's realistic butt) for both `ebbrb` and `ebbprb` (boobs in various states of push-uppery):

```yaml
resource:
  link:
    tutorial\archive_xl\my_item\l1_pwa_rb.mesh:
     - tutorial\archive_xl\my_item\l1_pwa_ebbprb.mesh
     - tutorial\archive_xl\my_item\l1_pwa_ebbrb.mesh
```

And just like that, we have one mesh instead of three.&#x20;

Now we can do away with the extra components and simply use body mod substitution — and anything duplicate can be linked.&#x20;

{% hint style="success" %}
You can now also give your `.mesh` files passive aggressive filenames and then use substitution to hook them up to the body mods. The possibilities are endless!
{% endhint %}
