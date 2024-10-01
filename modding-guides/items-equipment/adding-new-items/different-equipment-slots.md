---
description: How to determine the item type
---

# Different equipment slots

## Summary

**Created & Published:** June 10 2023 by **@manavortex**

This page is a part of the [Adding new items](./) guide and contains the steps necessary to create different equipment types.

For an overview of prefixes for the different component types, see here.

{% hint style="info" %}
TL;DR:

* Change `equipmentSlot` in the yaml (for options, see Step 1)
* Replace the `mesh_entity` (see Step 2)
* Replace the `.mesh` (e.g., instead of a shirt, find in-game shoes)
* Optional: [Port an external item](../../../for-mod-creators-theory/3d-modelling/porting-3d-objects-to-cyberpunk.md)
{% endhint %}

## Step 1: The .yaml

You define the item slot in your .yaml file by specifying the **root entry type** via a `$base` record. Base records come in many different types, some include intrinsic modifiers that add slight stat improvements to items, or add special sound to items. A complete page with clothing items, their intrinsic modifier, and their baseids can be found on the official Cyberpunk 2077 wiki's article for clothing [here](https://cyberpunk.fandom.com/wiki/Cyberpunk\_2077\_Clothing).

```yaml
Items.My_Custom_Shirt:                      << name of your item (the spawn code)
  $base: Items.Shirt
Items.My_Custom_Helmet:
  $base: Items.Helmet
# For items that should hide hair, use records with the "Hair" suffix.
Items.My_Custom_HelmetWithHair:
  $base: Items.HelmetHair
# For items that should have an intrinsic modifier, e.g. Armor
Items.My_Custom_HelmetWithArmor:
  $base: Items.Helmet_Intrinsic
# For feet items that use heels (clicky sound)
Items.MyCustom_Heels:
  $base: Items.FormalShoes
```

You can use the following base types:

| Slot        | Records                                                                                                                                                                                                                                                                                                                                 |
| ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Head        | <p>Helmet,</p><p>HelmetHair,</p><p>Helmet_Intrinsic,<br>HelmetHair_Intrinsic,</p><p>Helmet_EP1_Intrinsic_Armor,</p><p>Helmet_EP1_Intrinsic_Runner,</p><p>Helmet_EP1_Intrinsic_ExplosionDmg,</p><p>Helmet_EP1_Intrinsic_Zoom,</p><p>Hat,</p><p>Cap,</p><p>Scarf,</p><p>ScarfHair,</p><p>Balaclava,</p><p>Balaclava_Intrinsic</p>         |
| Face        | <p>Glasses, <br>Mask, <br>Mask_Intrinsic,<br>Visor,</p><p>Visor_Intrinsic_QH,</p><p>Visor_Intrinsic_Zoom,<br>Tech,<br>Tech_Intrinsic_Zoom</p>                                                                                                                                                                                           |
| Outer Torso | <p>Coat,<br>Coat_Intrinsic,<br>Dress,<br>FormalJacket,<br>FormalJacket_Intrinsic,<br>Jacket,<br>Jacket_Intrinsic_Armor,<br>Jumpsuit,<br>Jumpsuit_Intrinsic,</p><p>LooseShirt,<br>Vest,<br>Vest_Intrinsic_Armor,<br>Vest_Intrinsic_Reload,<br>Vest_EP1_Intrinsic_Armor,<br>Vest_EP1_Intrinsic_Grenade,<br>Vest_EP1_Intrinsic_Inhaler</p> |
| Inner Torso | <p>FormalShirt,</p><p>Shirt,<br>TankTop,</p><p>TightJumpsuit,<br>TightJumpsuit_Intrinsic,</p><p>TShirt,<br>Undershirt,<br>Undershirt_Intrinsic</p>                                                                                                                                                                                      |
| Legs        | <p>FormalPants,<br>Pants<br>Pants_Intrinsic_Armor,<br>Pants_Intrinsic_Carry,</p><p>Shorts,<br>Skirt</p>                                                                                                                                                                                                                                 |
| Feet        | <p>Boots,<br>Boots_Intrinsic,<br>CasualShoes,<br>FormalShoes</p>                                                                                                                                                                                                                                                                        |
| Special     | <p>Outfit,<br>Outfit_EP1</p>                                                                                                                                                                                                                                                                                                            |

{% hint style="info" %}
You can absolutely set up a shirt and then put `$base: Items.GenericHeadClothing` - V is the only person I know of who can wear their undies on their head without impairing their functionality.\
However, before you start abusing the system that way, you might want to look into [EquipmentEx](different-equipment-slots.md#step-1.5-equipmentex).
{% endhint %}

### Step 1.5: EquipmentEx

psiberx's mod EquipmentEx ([github](https://github.com/psiberx/cp2077-equipment-ex) | [nexus](https://www.nexusmods.com/cyberpunk2077/mods/6945)) adds a whole new wardrobe system, providing extra slots that CDPR forgot to include with the basegame. This feature requires the mod to be installed — without it, only the `$base` types from step 1 will be considered.

All you need to do is adding the last two lines to your .yaml:

<pre class="language-yaml"><code class="lang-yaml"><strong>Items.MyNecklace:
</strong>  $base: Items.GenericHeadClothing
  placementSlots: 
    - !append OutfitSlots.NecklaceShort
</code></pre>

{% hint style="info" %}
Find a full list of outfit slots in the [github readme](https://github.com/psiberx/cp2077-equipment-ex#outfit-slots).&#x20;
{% endhint %}

## Step 2: the entity file

Some item properties are defined in the file `mesh_entity.ent` via **components**. If you use the wrong kind of entity, you might end up with your shirt being a puddle around your feet, or [string cheese](../../../for-mod-creators-theory/3d-modelling/troubleshooting-your-mesh-edits.md#my-mesh-is-string-cheese-exploding-vertices-a-puddle-on-the-floor). To get around that, you need to make sure to pick a **file** that correspond's to your item's **body part.**&#x20;

You can find all entity files under `base\characters\garment\player_equipment:`

<figure><img src="../../../.gitbook/assets/archivexl_adding_items_mesh_entity_path.png" alt=""><figcaption><p>Pick any file from inside the correct folder.</p></figcaption></figure>

If you want to be super thorough, you can stick to the right gender&#x20;

{% hint style="info" %}
If you want to know more about components, check the [wiki page](../../../for-mod-creators-theory/files-and-what-they-do/components/). This is completely unnecessary for the purpose of this guide!
{% endhint %}

## (Optional) Step 3: Hide it in First Person

You can hide items most easily via [ArchiveXL tag](../../../for-mod-creators-theory/core-mods-explained/archivexl/#camera-modes). Check the linked page for how to do that.

## Footstep sounds

To find the correct tags for footstep sounds, check [archivexl-tags.md](../../../for-mod-creators/core-mods-explained/archivexl/archivexl-tags.md "mention") -> [#footsteps-setting-footwear-sounds](../../../for-mod-creators/core-mods-explained/archivexl/archivexl-tags.md#footsteps-setting-footwear-sounds "mention").
