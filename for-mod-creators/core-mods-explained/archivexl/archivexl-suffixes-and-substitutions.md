---
description: How suffixes and substitutions work
---

# ArchiveXL: Suffixes and Substitutions

## Summary

**Published:** ??? by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Feb 18 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will teach you about conditional appearance switching in Cyberpunk and give you an overview of existing suffixes and substitutions.

{% hint style="info" %}
ArchiveXL did not invent suffixes. In fact, they are CDPR's solution to a problem, and they are annoying to use.&#x20;

psiberx has found ways to make this less painful. This page documents these ways.
{% endhint %}

### Wait, that's not what I want!

* For a hands-on guide to [adding-new-items](../../../modding-guides/items-equipment/adding-new-items/ "mention"), check the corresponding pages in the Modding Guides section
* Dynamic appearances have their own guide (see [archivexl-dynamic-variants](../../../modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants/ "mention"))
* There is an own page for [influencing-other-items.md](../../../modding-guides/items-equipment/influencing-other-items.md "mention")
* To conditionally hide items or parts of items, check [influencing-other-items.md](../../../modding-guides/items-equipment/influencing-other-items.md "mention") or [archivexl-tags.md](archivexl-tags.md "mention") (especially the section about [#root-entity-tags](archivexl-tags.md#root-entity-tags "mention"))

## Why are suffixes?

Sometimes, you want to load different meshes/appearances under different circumstances. Before ArchiveXL 1.5, the only way to do that were suffixes — registering them in the `.yaml`, then adding one appearance for each variation in the root entity (so for 2 suffixes, you'd have 4 entries, for 3 suffixes, you'd have 8…).&#x20;

{% hint style="warning" %}
Suffixes are **outdated**! Do yourself a favour and use [dynamic appearances](../../../modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants/)!
{% endhint %}

Since 1.5, psiberx has made it possible to use **conditionals** via [dynamic appearances](../../../modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants/), which require a lot less of an overhead. (Personally, I've gone from 96 entries in the root entity down to 9!)

But while the solution has changed (and improved), the problems remain and require handling.

{% hint style="info" %}
You can use **dynamic path substitution** in **clothing items**, or in any [#entgarmentskinnedmeshcomponent](../../../for-mod-creators-theory/files-and-what-they-do/components/documented-components/#entgarmentskinnedmeshcomponent "mention")s loaded via mesh.ent, as long as the depot path is set to `Soft`
{% endhint %}

### Body genders

There are two body genders with different proportions, and you can't make them wear the same shirt (at least not without clipping). To solve that, you can do what CDPR did and have one variant per rig.

The suffix for the body is `Male` / `Female`, the ArchiveXL string substitution is `{gender}` and resolves to `m` or `w`.

### Body types

ArchiveXL allows body modders to [register a custom body tag](../../../for-mod-creators-theory/core-mods-explained/archivexl/archivexl-body-mods-and-refits/), which can then be used for suffixes and for substitutions in dynamic variants. To learn more about this, check [archivexl-body-mods-and-refits](../../../for-mod-creators-theory/core-mods-explained/archivexl/archivexl-body-mods-and-refits/ "mention").

{% hint style="info" %}
You can check the current foot state by running the following command from CET:

```
print(Game.GetScriptableSystemsContainer():Get("PuppetStateSystem"):GetBodyTypeSuffix(ItemID.new(), GetPlayer(), nil))
```
{% endhint %}

### Camera modes

Sometimes, you need to hide parts of the item in first person. – for example helmets, since you don't want to have half a helmet floating in front of your face (unless you consider that immersive; most people don't).

<table><thead><tr><th>Camera mode</th><th width="116">Suffix</th><th>Substitution</th><th>Condition</th></tr></thead><tbody><tr><td>First Person Perspective</td><td><code>&#x26;FPP</code></td><td><code>fpp</code></td><td><code>&#x26;camera=fpp</code></td></tr><tr><td>Third Person Perspective</td><td><code>&#x26;TPP</code></td><td><code>tpp</code></td><td><code>&#x26;camera=tpp</code></td></tr></tbody></table>

### Arm states

The arm states represent the different cyberware. For example, since you can't hire the forearms for mantis blades, you can roll up the sleeves just for this. The definitions are:

| Cyberware           | Suffix                | Substitution          | Conditional                 |
| ------------------- | --------------------- | --------------------- | --------------------------- |
| None                | `&BaseArms`           | `base_arms`           | `&arms=base_arms`           |
| Mantis Blades       | `&MantisBlades`       | `mantis_blades`       | `&arms=mantis_blades`       |
| Monowire            | `&Monowire`           | `monowire`            | `&arms=monowire`            |
| Projectile Launcher | `&ProjectileLauncher` | `projectile_launcher` | `&arms=projectile_launcher` |

If the arm states aren't working as expected, check if the table above is outdated by comparing the names with the [source code](https://github.com/psiberx/cp2077-archive-xl/blob/027aab7139689ee8d14163682ab6d506fbccea2a/src/App/Extensions/PuppetState/System.cpp#L72).

{% hint style="info" %}
You can check the current foot state by running the following command from CET:

```
print(Game.GetScriptableSystemsContainer():Get("PuppetStateSystem"):GetArmsStateSuffix(ItemID.new(), GetPlayer(), nil))
```
{% endhint %}

#### Foot states

To achieve gender equality in regard to foot states, you need to use [Toggleable Feet](https://www.nexusmods.com/cyberpunk2077/mods/7049). The substitution key for dynamic appearances is `feet`.

{% hint style="warning" %}
Feet states for male-rigged V are not supported by the base game. You need to install either a body mod, or [Toggleable Feet](https://www.nexusmods.com/cyberpunk2077/mods/7049).
{% endhint %}

<table><thead><tr><th width="141.33333333333331">Character</th><th>Footwear</th><th width="176">Suffix/Tag</th><th>Substitution</th><th>Condition</th></tr></thead><tbody><tr><td>Female</td><td>Unequipped</td><td><code>&#x26;Flat</code></td><td><code>flat</code></td><td><code>&#x26;feet=flat</code></td></tr><tr><td>Female</td><td>Equipped (default)</td><td><code>&#x26;Lifted</code></td><td><code>lifted</code></td><td><code>&#x26;feet=lifted</code></td></tr><tr><td>Female</td><td>Equipped with <code>HighHeels</code> tag</td><td><code>&#x26;HighHeels</code></td><td><code>high_heels</code></td><td><code>&#x26;feet=high_heels</code></td></tr><tr><td>Female</td><td>Equipped with <code>FlatShoes</code> tag</td><td><code>&#x26;FlatShoes</code></td><td><code>flat_shoes</code></td><td><code>&#x26;feet=flat_shoes</code></td></tr><tr><td>Male</td><td>Any</td><td>(empty)</td><td></td><td></td></tr></tbody></table>

If the foot states aren't working as expected, check if the table above is outdated by comparing the names with the [source code](https://github.com/psiberx/cp2077-archive-xl/blob/027aab7139689ee8d14163682ab6d506fbccea2a/src/App/Extensions/PuppetState/System.cpp#L89).

{% hint style="info" %}
You can check the current foot state by running the following command from CET:

```
print(Game.GetScriptableSystemsContainer():Get("PuppetStateSystem"):GetFeetStateSuffix(ItemID.new(), GetPlayer(), nil))
```
{% endhint %}

## Conditions

Conditions are a feature of **dynamic appearances** . They can be used in two places:

#### In your .app file

Inside your `.app` file for `appearanceAppearanceDefinition.name`:&#x20;

<figure><img src="../../../.gitbook/assets/archivexl_conditions.png" alt=""><figcaption></figcaption></figure>

This lets you to select a different appearance based on body gender, camera state... (see the tables above).&#x20;

By using conditional appearances, you can still make use of `partsOverrides` to use [chunkmask hiding](../../../for-mod-creators-theory/files-and-what-they-do/file-formats/3d-objects-.mesh-files/submeshes-materials-and-chunks.md).

{% hint style="info" %}
For a hands-on example, see [archivexl-dynamic-conversion-guide.md](../../../for-mod-creators-theory/core-mods-explained/archivexl/archivexl-dynamic-conversion-guide.md "mention") -> [#step-2-the-.app](../../../for-mod-creators-theory/core-mods-explained/archivexl/archivexl-dynamic-conversion-guide.md#step-2-the-.app "mention")
{% endhint %}

#### In your mesh\_entity.ent file

Inside your `mesh_entity.ent` for `component.name`:

<figure><img src="../../../.gitbook/assets/archivexl_conversion_conditional_components.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
For a hands-on example, see [archivexl-dynamic-conversion-guide.md](../../../for-mod-creators-theory/core-mods-explained/archivexl/archivexl-dynamic-conversion-guide.md "mention") -> [#method-1-conditional-components](../../../for-mod-creators-theory/core-mods-explained/archivexl/archivexl-dynamic-conversion-guide.md#method-1-conditional-components "mention")
{% endhint %}

## Substitutions

Substitutions are a feature of **dynamic appearances** . They can only be used inside your `mesh_entity.ent`.

Substitutions allow ArchiveXL to **load a different mesh** based on different circumstances.

<figure><img src="../../../.gitbook/assets/archivexl_conversion_path_substitution.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
For a hands-on example, see [archivexl-dynamic-conversion-guide.md](../../../for-mod-creators-theory/core-mods-explained/archivexl/archivexl-dynamic-conversion-guide.md "mention") -> [#method-2-component-substitution](../../../for-mod-creators-theory/core-mods-explained/archivexl/archivexl-dynamic-conversion-guide.md#method-2-component-substitution "mention")
{% endhint %}

## Which suffixes exist?

{% hint style="warning" %}
Do yourself a favour and don't use suffixes! They are outdated - use [dynamic item additions](../../../for-mod-creators-theory/core-mods-explained/archivexl/#dynamic-appearances) instead.
{% endhint %}

For a list of active suffixes, check the tables above.

<table><thead><tr><th width="325">Suffix</th><th>Explanation</th></tr></thead><tbody><tr><td><code>itemsFactoryAppearanceSuffix.Gender</code></td><td>This item is gendered<br>When resolving the appearance name via <code>rootentity.ent</code>, the game will look for <code>appearanceName&#x26;Female</code> and <code>appearanceName&#x26;Male</code>.</td></tr><tr><td><code>itemsFactoryAppearanceSuffix.Camera</code></td><td>This item has special rules for first and third person camera<br>When resolving the appearance name via <code>rootentity.ent</code>, the game will look for <code>appearanceName&#x26;FPP</code> and <code>appearanceName&#x26;TPP</code>.</td></tr><tr><td><code>itemsFactoryAppearanceSuffix.Partial</code></td><td>If the current item has <code>hide_T1part</code> part and slot <code>OuterChest</code> is not hidden, will search <code>rootentity.ent</code> for<code>&#x26;Full</code> or <code>&#x26;Part</code></td></tr><tr><td><code>itemsFactoryAppearanceSuffix.HairType</code></td><td>Defines how your item will look if a certain hair type is loaded (e.g., hide the back half of a bandana for long hair).<br>When resolving the appearance name via <code>rootentity.ent</code>, the game will look for <code>&#x26;Short</code>, <code>&#x26;Long</code>, <code>&#x26;Dreads</code>, <code>&#x26;Buzz</code>, <code>&#x26;Bald</code></td></tr></tbody></table>

### Disabling Suffixes

You can disable suffixes by adding the following line to your .yaml entry:

```yaml
appearanceSuffixes: []
```

### Suffix load order

1. the base appearance (with no suffix)
2. the most specific suffix collection it can find

#### Example:&#x20;

V has a female body gender and you're in photo mode (third person camera). Your base appearance is called `appearance_`.

| full appearance name                                                                                                                    |                                                                      |
| --------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `appearance_`                                                                                                                           | Found first, then ignored because a more specific appearance exists. |
| <p><code>appearance_&#x26;Male</code><br><code>appearance_&#x26;Male&#x26;FPP</code><br><code>appearance_&#x26;Male&#x26;TPP</code></p> | Ignored: V's body gender isn't male                                  |
| `appearance_&Female`                                                                                                                    | ignored: a better match exists                                       |
| `appearance_&Female&FPP`                                                                                                                | ignored: you are not in first person camera                          |
| `appearance_&Female&TPP`                                                                                                                | best match! The game will use this one!                              |

## Which substitutions exist?

Since 1.8.0, ArchiveXL supports substitutions for [#dynamic-appearances](../../../for-mod-creators-theory/core-mods-explained/archivexl/#dynamic-appearances "mention"). You can use them in two places:&#x20;

* inside `mesh entity` components in the fields `name`, `depotPath` and `appearance`
* in the `.app` appearances for the field `name`

{% hint style="success" %}
For a tutorial about this, check [archivexl-dynamic-variants](../../../modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants/ "mention")

If you are a mod user and want to dynamically recolour an item, check the [recolours-and-refits](../../../modding-guides/items-equipment/recolours-and-refits/ "mention") guide -> sub-page Emissive -> [#switching-existing-colours](../../../modding-guides/items-equipment/recolours-and-refits/r-and-r-emissive.md#switching-existing-colours "mention")
{% endhint %}

Any placeholders will be **interpolated** at run-time (replaced with the correct value for your current state)!

If any of the placeholders aren't working the way you expect them, check if the table below is outdated by referring [directly to the source](https://github.com/psiberx/cp2077-archive-xl/blob/027aab7139689ee8d14163682ab6d506fbccea2a/src/App/Extensions/GarmentOverride/Dynamic.cpp#L29). (Please update the wiki if that happens!)

{% hint style="info" %}
Substitution will only become active if the property name starts with an asterisk (`*`).
{% endhint %}

| Placeholder    | Substitution                                                                                                                                                                    |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `{camera}`     | `fpp` or `tpp`                                                                                                                                                                  |
| `{gender}`     | `m` or `w`                                                                                                                                                                      |
| `{body}`       | `base_body` or body mod name in snake case                                                                                                                                      |
| `{arms}`       | `base_arms`, `mantis_blades`, `monowire`, `projectile_launcher`                                                                                                                 |
| `{feet}`       | `flat`, `lifted`, `high_heels`, `flat_shoes` (empty for mascV!)                                                                                                                 |
| `{sleeves}`    | `full`, `part`                                                                                                                                                                  |
| `{skin_color}` | [skin color name](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/#skin-tones-by-index) from customization, e.g. `03_senna`                    |
| `{hair_color}` | [hair color name](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/hair.md#colour-in-files-by-index) from customization. e.g. `black_liquorice` |



### Substitution load order

For [#dynamic-appearances](../../../for-mod-creators-theory/core-mods-explained/archivexl/#dynamic-appearances "mention"), you can conditionally switch out components or entire appearances **by name**. You can switch use any of the entries from [#which-substitutions-exist](archivexl-suffixes-and-substitutions.md#which-substitutions-exist "mention")

The order works as follows:

<table><thead><tr><th width="332.3333333333333">Appearance/Component</th><th width="67" align="center">Priority</th><th>Description</th></tr></thead><tbody><tr><td><code>my_item!variant&#x26;camera=tpp</code></td><td align="center">1</td><td>Has the highest priority because it requires a specific variant and one state condition.</td></tr><tr><td><code>my_item!variant</code></td><td align="center">2</td><td>Has second priority because it requires a specific variant.</td></tr><tr><td><code>my_item&#x26;gender=w&#x26;camera=tpp</code></td><td align="center">3</td><td>Has third priority because it has two state conditions.</td></tr><tr><td><code>my_item&#x26;camera=tpp</code></td><td align="center">4</td><td>Has fourth priority because it has one state condition.</td></tr><tr><td><code>my_item</code></td><td align="center">5</td><td>Has the lowest priority and will be used when no other elements match the criteria.</td></tr></tbody></table>
