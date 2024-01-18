---
description: How suffixes and substitutions work
---

# ArchiveXL: Suffixes and Substitutions

Sometimes, you want to load different meshes/appearances under different circumstances. Before ArchiveXL 1.5, the only way to do that were suffixes — registering them in the `.yaml`, then adding one appearance for each variation in the root entity (so for 2 suffixes, you'd have 4 entries, for 3 suffixes, you'd have 8…).&#x20;

Since 1.5, psiberx has made it possible to use **conditionals** via [dynamic appearances](../../modding-guides/items-equipment/adding-new-items/archivexl-dynamic-variants.md), which require a lot less of an overhead. (Personally, I've gone from 96 entries in the root entity down to 9!)

But while the solution has changed (and improved), the problems remain and require handling.

#### Body genders

There are two body genders with different proportions, and you can't make them wear the same shirt (at least not without clipping). To solve that, you can do what CDPR did and have one variant per rig.

The suffix for the body is `Male` / `Female`, the ArchiveXL string substitution is `{gender}` and resolves to `m` or `w`.

#### Body types

ArchiveXL allows body modders to [register a custom body tag](archivexl-body-mods-and-refits.md), which can then be used for suffixes and for substitutions in dynamic variants. To learn more about this, check [archivexl-body-mods-and-refits.md](archivexl-body-mods-and-refits.md "mention").

{% hint style="info" %}
You can check the current foot state by running the following command from CET:

```
print(Game.GetScriptableSystemsContainer():Get("PuppetStateSystem"):GetBodyTypeSuffix(ItemID.new(), GetPlayer(), nil))
```
{% endhint %}

#### Camera modes

Sometimes, you need to hide parts of the item in first person. – for example helmets, since you don't want to have half a helmet floating in front of your face (unless you consider that immersive; most people don't).

{% hint style="info" %}
To hide an item in first person perspective, you can add the following tag to the root entity:

`EmptyAppearance:FPP`

or add an `&FPP` variant pointing at

`base\characters\appearances\player\items\empty_appearance.app` \
`default`
{% endhint %}

#### Arm states

The arm states represent the different cyberware. For example, since you can't hire the forearms for mantis blades, you can roll up the sleeves just for this. The definitions are:

| Cyberware           | Suffix                |                       |
| ------------------- | --------------------- | --------------------- |
| None                | `&BaseArms`           | `base_arms`           |
| Mantis Blades       | `&MantisBlades`       | `mantis_blades`       |
| Monowire            | `&Monowire`           | `monowire`            |
| Projectile Launcher | `&ProjectileLauncher` | `projectile_launcher` |

If the arm states aren't working as expected, check if the table above is outdated by comparing the names with the [source code](https://github.com/psiberx/cp2077-archive-xl/blob/027aab7139689ee8d14163682ab6d506fbccea2a/src/App/Extensions/PuppetState/System.cpp#L72).

{% hint style="info" %}
You can check the current foot state by running the following command from CET:

```
print(Game.GetScriptableSystemsContainer():Get("PuppetStateSystem"):GetArmsStateSuffix(ItemID.new(), GetPlayer(), nil))
```
{% endhint %}

#### Foot states

To achieve gender equality in regard to foot states, you need to use [Toggleable Feet](https://www.nexusmods.com/cyberpunk2077/mods/7049). The substitution key for dynamic appearances is `feet`.

<table><thead><tr><th width="187.33333333333331">Character</th><th>Footwear</th><th width="176">Suffix/Tag</th><th>Substitution: feet=</th></tr></thead><tbody><tr><td>Female</td><td>Unequipped</td><td><code>&#x26;Flat</code></td><td><code>flat</code></td></tr><tr><td>Female</td><td>Equipped (default)</td><td><code>&#x26;Lifted</code></td><td><code>lifted</code></td></tr><tr><td>Female</td><td>Equipped with <code>HighHeels</code> tag</td><td><code>&#x26;HighHeels</code></td><td><code>high_heels</code></td></tr><tr><td>Female</td><td>Equipped with <code>FlatShoes</code> tag</td><td><code>&#x26;FlatShoes</code></td><td><code>flat_shoes</code></td></tr><tr><td>Male</td><td>Any</td><td>(empty)</td><td></td></tr></tbody></table>

If the foot states aren't working as expected, check if the table above is outdated by comparing the names with the [source code](https://github.com/psiberx/cp2077-archive-xl/blob/027aab7139689ee8d14163682ab6d506fbccea2a/src/App/Extensions/PuppetState/System.cpp#L89).

{% hint style="info" %}
You can check the current foot state by running the following command from CET:

```
print(Game.GetScriptableSystemsContainer():Get("PuppetStateSystem"):GetFeetStateSuffix(ItemID.new(), GetPlayer(), nil))
```
{% endhint %}
