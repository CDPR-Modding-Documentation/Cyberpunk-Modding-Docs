---
description: How to manipulate vendor inventories
---

# 💰 Changing vendor inventory

### Summary

**Published:** ??? by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Jan 28 2024 by [Sei Jax](https://app.gitbook.com/u/zYGdVaac39RTacR8mmEoIGU0WhD3 "mention")

{% hint style="info" %}
To find a list of all vendor IDs, check [cheat-sheet-vendor-ids.md](../../../references-lists-and-overviews/cheat-sheet-tweak-ids/cheat-sheet-vendor-ids.md "mention")
{% endhint %}

## How to do this:

Your mod will be one or multiple `.yaml` files under `r6/tweaks`. If you want to release your mod on Nexus, we recommend using [WolvenKit Projects](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects "mention") and creating the files under the [Resources](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#resources "mention") folder.

## Adding items to vendors

Courtesy of Neurolinked and psiberx. For more context, [read up on Discord](https://discord.com/channels/717692382849663036/953004282142163014/1175019512509235260).

Create the following tweak file (a yaml in `r6/tweaks/your_optional_subfolder`:

<pre class="language-yaml"><code class="lang-yaml"><strong>Vendors.pac_wwd_melee_01:                    # your vendor's tweak ID
</strong>  itemStock:                                 # their inventory
    - !append
      $type: VendorItem
      item: Items.YourItemBaseId             # your item's base ID
      quantity: [ Vendors.Always_Present ]   # how many of it?
    - !append
      $type: VendorItem
      item: Items.YourOtherItemBaseId
      quantity: [ Vendors.Always_Present ]
</code></pre>
