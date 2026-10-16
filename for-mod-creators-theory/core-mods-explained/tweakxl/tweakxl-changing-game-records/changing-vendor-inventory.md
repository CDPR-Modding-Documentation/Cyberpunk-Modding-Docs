---
description: How to manipulate vendor inventories
---

# Changing vendor inventory

### Summary

**Published:** ??? by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Oct 14 2026 by [Anthanael\_Xx](https://app.gitbook.com/u/ga1IpPZkPLQL15IJcONW3hdjxfQ2 "mention")

{% hint style="info" %}
To find a list of all vendor IDs, check [cheat-sheet-vendor-ids.md](../../../references-lists-and-overviews/cheat-sheet-tweak-ids/cheat-sheet-vendor-ids.md "mention")
{% endhint %}

## How to do this:

Your mod will be one or multiple `.yaml` files under `r6/tweaks`. If you want to release your mod on Nexus, we recommend using [WolvenKit Projects](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects "mention") and creating the files under the [WolvenKit Projects #Resources](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#resources "mention") folder.

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

## Overriding vendors inventories

Use WolvenKit's [Tweak Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/tweak-browser) to locate the vendor record (e.g., "Vendors.wat\_nid\_clothingshop\_01"). Right-click and select "Add TweakXL Override." A new .yaml file will appear; open it and delete all lines ending with "inline," then replace them with this:

```yaml
- $type: gamedataVendorItem_Record
      item: Items.YourItemBaseId           # your item's base ID
      generationPrereqs: []
      quantity:
        - Vendors.MediumQuantity
- $type: gamedataVendorItem_Record
      item: Items.YourOtherItemBaseId
      generationPrereqs: []
      quantity:
        - Vendors.MediumQuantity
```

{% hint style="warning" %}
In-game vendor inventories are generated, and cached, by the game on 24h intervals.\
So the changes applied won't be immediately evident, but can be produced/tested on demand by skipping 24h of in-game time.
{% endhint %}
