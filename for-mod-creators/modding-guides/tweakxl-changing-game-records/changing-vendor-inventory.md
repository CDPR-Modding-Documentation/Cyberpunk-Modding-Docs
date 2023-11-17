---
description: How to manipulate vendor inventories
---

# Changing vendor inventory



## How to do this:

Your mod will be one or multiple `.yaml` files under `r6/tweaks`. If you want to release your mod on Nexus, we recommend using [WolvenKit Projects](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects "mention") and creating the files under the [Resources](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#resources "mention") folder.

## Adding items to vendors

Courtesy of Neurolinked and psiberx. For more context, [read up on Discord](https://discord.com/channels/717692382849663036/953004282142163014/1175019512509235260).

Create the following tweak file:

<pre class="language-yaml"><code class="lang-yaml"><strong>Vendors.pac_wwd_melee_01:                 # your vendor's tweak ID
</strong>  itemStock:                              # their inventory
    - !append { 
        item: Items.YourItemBaseId,       # your item's base ID
        quantity: [ Vendors.IsPresent ]   # how many of it?
      }      
    - !append { 
        item: Items.YourOtherItemBaseId, 
        quantity: [ Vendors.IsPresent ] 
      }
</code></pre>
