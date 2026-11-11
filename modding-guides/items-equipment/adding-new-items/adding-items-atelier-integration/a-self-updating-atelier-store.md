---
description: How to never update Atelier stores again
---

# A self-updating Atelier store

## Summary

**Published:** Nov 11 2026 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Nov 11 2026 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will show you how to create a self-updating atelier store (and VendorsXL inventory). That's right, you can publish this once and then never have to touch it again!

## Requirements

You need a [Wolvenkit Project](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects), a text editor like [Notepad++](https://notepad-plus-plus.org/downloads/), and at least one item.

## Step 1: Create and edit a .yaml file

{% include "../../../../.gitbook/includes/yaml-editing-warning.md" %}



1. Select File -> New File -> TweakDB -> TweakXL File
2. Switch the project explorer to `Source` or `Resources` tab
3. Rename `untitled.yaml` to something like `_atelier_items.yaml`&#x20;
4. Open it in a text editor, then put the following content:

```yaml
YourCustomAtelierStore.Inventory:
  $type: array:String
  $value:
    - !append-once Items.Preset_Silverhand_3516
```

5. Adjust the first line to give it a custom name (e.g. `YourModderNameAtelierStore.Inventory`)
6. optional: pick a different base game item

This block is what makes your atelier store self-updating. You can add it to each of your mods, and add all items defined in that mod to the list, and they will show up in your store (and with your custom vendor).

### If you already have an atelier store

(If not, skip to [#step-2-the-atelier-store](a-self-updating-atelier-store.md#step-2-the-atelier-store "mention"))

1. Open the atelier store .reds with a text editor
2. Find the array of items inside the `event.AddStore` block. It is the third parameter after the opening `(` and looks like this (it can have linebreaks, too)

```
 ["Items.my_item_1", "Items.my_item_2"],
```

3. Move all these items into your .yaml file. Each entry must have its own line, like this:

```yaml
YourCustomAtelierStore.Inventory:
  $type: array:String
  $value:
    - !append-once Items.my_item_1
    - !append-once Items.my_item_2
```

We'll adjust the store in step 2.

## Step 2: The atelier store

If you don't have an atelier store yet, go to [Your own Atelier Store](https://app.gitbook.com/s/V8IFViBI9k2aiwNySH5C/modding-guides/items-equipment/adding-new-items/adding-items-atelier-integration "mention") until it sends you back here.

1. Open your atelier store in a text editor. You should now see something like this:

<pre class="language-swift"><code class="lang-swift"><strong>@addMethod(gameuiInGameMenuGameController)
</strong>protected cb func RegisterYOURNAMESStore(event: ref&#x3C;VirtualShopRegistration>) -> Bool {
  event.AddStore(
    n"YOURNAME",
    "Your Store Name",
    [            
      "Items.my_custom_shirt_redwhite",  	
      "Items.my_custom_shirt_redblack"
	  ],
	  [ 1	],
    r"tutorial/torso/my_custom_shirt/ops/atelier_icon.inkatlas",
    n"slot_01",
	  [ "Legendary" ]
  );
}
</code></pre>

We will now change this method to add the items from your list to the atelier store, and we will skip any items that do not exist. In the third line of your script directly before `event.AddStore(`, add the following:

<pre class="language-swift"><code class="lang-swift"><strong>  // this reads the list you defined in your yaml files  
</strong><strong>  let items: array&#x3C;String> = TweakDBInterface.GetStringArray(t"YourCustomAtelierStore.Inventory");
</strong>  // this list goes into your store
  let itemStrings: array&#x3C;String>;
  
  // for each item, we check if there is a valid record for the name
  // this will not be the case if the mod isn't installed
  for itemName in items {
    let tweakID = TDBID.Create(itemName);  
    let record = TweakDBInterface.GetItemRecord(tweakID);
    if IsDefined(record)
    {
      ArrayPush(itemStrings, itemName);
    } 
  }  
</code></pre>

We now have a list of all items that are actually installed inside the variable `itemStrings`.

Now, we'll change the atelier store to use this list instead of the hand-written one:

<pre class="language-swift"><code class="lang-swift"><strong> event.AddStore(
</strong>    n"YOURNAME",
    "Your Store Name",
    itemStrings,
	  [ 1	],
    r"tutorial/torso/my_custom_shirt/ops/atelier_icon.inkatlas",
    n"slot_01",
	  [ "Legendary" ]
  );
</code></pre>

## Step 3: VendorsXL

If you are using an [VendorsXL](https://www.nexusmods.com/cyberpunk2077/mods/19679) custom vendor, you can easily expand your script to accommodate this one as well. We're doing this by setting their inventory from the list of items we've generated:&#x20;

<pre class="language-swift"><code class="lang-swift"><strong>@addMethod(gameuiInGameMenuGameController)
</strong>protected cb func RegisterYOURNAMESStore(event: ref&#x3C;VirtualShopRegistration>) -> Bool {
  // this reads the list you defined in your yaml files  
  let items: array&#x3C;String> = TweakDBInterface.GetStringArray(t"YourCustomAtelierStore.Inventory");
  // this list goes into your store
  let itemStrings: array&#x3C;String>;
  // this is your vendor's inventory
  let validTweaks: array&#x3C;TweakDBID>;  
  
  // for each item, we check if there is a valid record for the name
  // this will not be the case if the mod isn't installed
  for itemName in items {
    let tweakID = TDBID.Create(itemName);  
    let record = TweakDBInterface.GetItemRecord(tweakID);
    if IsDefined(record)
    {
      ArrayPush(itemStrings, itemName);
      ArrayPush(validTweaks, tweakID);
    } 
  }  
  
  // read the vendor by name (you set this in your vendor's .yaml file)
  let vendor = TweakDBInterface.GetItemRecord(TDBID.Create("Character.tutorial_custom_vendor"));
  // check if the vendor is defined - if yes, set their inventory and update the record
  // If your vendor is in the same mod as your atelier store, you can remove the check.
  if IsDefined(vendor) {
    TweakDBManager.SetFlat(t"Character.tutorial_custom_vendor.items", validTweaks);
    TweakDBManager.UpdateRecord(t"Character.tutorial_custom_vendor");  
  }
  
  // now we can add the atelier store
  event.AddStore(
    n"YOURNAME",
    "Your Store Name",
    itemStrings,
	  [ 1	],
    r"tutorial/torso/my_custom_shirt/ops/atelier_icon.inkatlas",
    n"slot_01",
	  [ "Legendary" ]
  );
}
</code></pre>

## Step 4: Enjoy!

Bask in never having to update your atelier store (and vendor inventory) again, and take a moment to appreciate Buzzler, Ange(Berdragon)Vil and psiberx, who carried me through this script.
