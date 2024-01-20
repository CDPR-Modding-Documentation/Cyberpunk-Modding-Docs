# ArchiveXL: Tags

Tags are a way to tell Cyberpunk that an item has certain properties and should behave in a certain way. Thanks to ArchiveXL's extended tag system, you can for example force flat feet for female V, or un-hide hair from a head item.

{% hint style="warning" %}
Please keep in mind that you need to add those to the [.app file](../../files-and-what-they-do/appearance-.app-files.md)'s **appearance definition** rather than the root or mesh entity.&#x20;
{% endhint %}

### Base game tags

| Tag             | Effect                                                                      |
| --------------- | --------------------------------------------------------------------------- |
| `hide_H1`       | Hides an item in the `Head` slot.                                           |
| `hide_F1`       | Hides an item in the `Eyes` slot.                                           |
| `hide_T1`       | Hides an item in the `Chest` slot.                                          |
| `hide_T2`       | Hides an item in the `Torso` slot.                                          |
| `hide_L1`       | Hides an item in the `Legs` slot.                                           |
| `hide_S1`       | Hides an item in the `Feet` slot.                                           |
| `hide_T1part`   | Toggles the partial suffix (`&Full` →`&Part`) when applied to `Torso` item. |
| `hide_Hair`     | Hides hair.                                                                 |
| `hide_Genitals` | Hides genitals in uncensored mode and underware in censored mode.           |

### ArchiveXL tags

| Tag                 | Effect                                  |
| ------------------- | --------------------------------------- |
| `hide_Head`         | Hides head.                             |
| `hide_Torso`        | Hides the whole torso.                  |
| `hide_LowerAbdomen` | Hides lower abdomen.                    |
| `hide_UpperAbdomen` | Hides upper abdomen.                    |
| `hide_CollarBone`   | Hides collar bone area.                 |
| `hide_Arms`         | Hides arms.                             |
| `hide_Thighs`       | Hides thighs.                           |
| `hide_Calves`       | Hides calves.                           |
| `hide_Ankles`       | Hides ankles.                           |
| `hide_Feet`         | Hides feet.                             |
| `hide_Legs`         | Hides the whole legs.                   |
| `force_Hair`        | Forces visible hair for head items.     |
| `force_FlatFeet`    | Forces flat feet for female characters. |

### Hiding body parts: diagram

<div>

<figure><img src="../../../.gitbook/assets/archiveXl_bodyparts_cheatsheet_ref_ladylea_mV.png" alt=""><figcaption><p>male version - image by LadyLea</p></figcaption></figure>

 

<figure><img src="../../../.gitbook/assets/archiveXl_bodyparts_cheatsheet_ref_ladylea_fV.png" alt=""><figcaption><p>female version - image by LadyLea</p></figcaption></figure>

</div>

## Adding custom tags

If you want to add custom tags, you can do that **in your `.xl` file**. This is how you can for example un-hide hidden components, or hide components without making use of [partsOverrides](../../files-and-what-they-do/appearance-.app-files.md#partsoverrides):

```
overrides:
  tags:
    my_custom_unhiding_tag:
      my_hidden_component_name: {show: [0, 1, 2, 3]}
    my_HideSeamfix:
      t0_000_pma_base__full_seamfix: {hide: [0, 1, 2, 3]}
```

Simply add the tag to your appearance's tags array near the bottom of the individual entries.

<figure><img src="../../../.gitbook/assets/hiding_custom_tags.png" alt=""><figcaption></figcaption></figure>
