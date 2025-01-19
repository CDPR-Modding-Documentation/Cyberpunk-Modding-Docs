# Stat Modifiers

## Summary

**Published:** Jan 17 2025 by Apart\
**Last documented edit:** Jan 17 2025 by Apart

An explanation of the various kinds of stat modifiers and modifier types and how to use them.

{% hint style="info" %}
This guide uses the TweakXL-yaml language for item additions.
{% endhint %}

### Wait, this is not what I want!

* To see stat modifiers in action, check [creating-cyberware-using-tweakxl.md](creating-cyberware-using-tweakxl.md "mention") -> [#addendum-1-item-specific-entries-for-cyberdecks](creating-cyberware-using-tweakxl.md#addendum-1-item-specific-entries-for-cyberdecks "mention")

## What are Stat Modifiers

Stat modifiers allow you to adjust the stats of an object, whether it is the player or a piece of equipment. There are three main types of [stat modifier types](stat-modifiers.md#stat-modifier-types), but first we'll need to learn which [modifier types](stat-modifiers.md#modifier-types) exist, so we can effectively use stat modifiers.

{% hint style="info" %}
For a full list of available stats in Cyberpunk 2077, see [Cheat Sheet: Tweaks](../references-lists-and-overviews/cheat-sheet-tweak-ids/)
{% endhint %}

## Modifier Types

There are five types of modifiers, with the three most common ones being: [Additive](stat-modifiers.md#additive), [Multiplier](stat-modifiers.md#multiplier), and [AdditiveMultiplier](stat-modifiers.md#additivemultiplier). The remaining two, Count and Invalid, are not as common and rarely used.

### Additive

An additive modifier type "adds" to a stat. It is also possible to subtract using a negative value.

#### Example(s)

We have a weapon that has a base value (a) of 5% Crit Chance. We'd like to add another 5% Crit Chance (b), using the following formula: (a+b=10)

```yaml
$type: ConstantStatModifier
statType: BaseStats.CritChance
modifierType: Additive
value: 5.0
```

### Multiplier

A multiplier modifier "multiplies" a stat. A multiplier stat can also be used to reduce a stat to 0.

#### Example(s)

We have a weapon that has a base value (a) of 5% Crit Chance. We'd like to double our Crit Chance to 10%, using the following formula: (a\*b=10)

<pre class="language-yaml"><code class="lang-yaml"><strong>$type: ConstantStatModifier
</strong>statType: BaseStats.CritChance
modifierType: Multiplier
value: 2.0
</code></pre>

We have a weapon that has a base value (a) of 5% Crit Chance. We'd like to remove our Crit Chance by making it 0, using the following formula: (a\*b=0)

```yaml
$type: ConstantStatModifier
statType: BaseStats.CritChance
modifierType: Multiplier
value: 0.0
```

### AdditiveMultiplier

An additive multiplier "adds" something to a stat by "multiplying" it.&#x20;

#### Example(s)

We have a weapon that has a base value (a) of 100% Crit Damage. We'd like to add an additional 20% Crit Damage, using the following formula: (a+(a\*b)=120)

```yaml
$type: ConstantStatModifier
statType: BaseStats.CritDamage
modifierType: AdditiveMultiplier
value: 0.2
```

## Stat Modifier Types

### Constant Stat Modifiers

The stat modifier we've used in the previous step for our examples, a constant stat modifier, is the most commonly used type of stat modifier there is.&#x20;

#### Example(s)

A basic stat modifier that adds Crit Damage.

```yaml
$type: ConstantStatModifier
statType: BaseStats.CritDamage
modifierType: Additive
value: 100.0
```

### Combined Stat Modifiers

Combined stat modifiers take one stat, and use one other stat to change it, combining the two stats to influence an object. A combined stat modifier requires a modifier type, just like a constant stat modifier, but also requires a reference object (e.g. Player, Weapon, Owner or Root) and an operation symbol.

#### Example(s)

A combine stat modifier that increases Crit Chance by 2% for each quality level.

```yaml
$type: CombinedStatModifier
statType: BaseStats.CritDamage
modifierType: Additive
refStat: BaseStats.Quality
refObject: Root
opSymbol: "*"
value: 2.0
```

### Curve Stat Modifiers

Curve stat modifiers use a [curveset](../files-and-what-they-do/file-formats.md) file to adjust stats on an object. A curve stat modifier requires that you provide an id and a column, so that the game knows where to find the curve you want to use. The id is the curveset file's name without extension, and the column should refer to the curveSetEntry inside the curveset file.

#### Example(s)

First, a curveset is needed, that we will name _**crit\_chance\_curves**_ with a column named _**quality\_to\_crit\_chance**_ The point will be matched with the reference stat (refStat) of the tweak.

<table><thead><tr><th width="93" data-type="number">point</th><th data-type="number">value</th></tr></thead><tbody><tr><td>0</td><td>2</td></tr><tr><td>1</td><td>4</td></tr><tr><td>2</td><td>6</td></tr><tr><td>3</td><td>9</td></tr><tr><td>4</td><td>14</td></tr></tbody></table>

This curveset should lead to a 2% Crit Chance at Tier 1 (Common) quality, up to 14% at Tier 5 (Legendary) quality.

```yaml
$type: CurveStatModifier
statType: BaseStats.CritChance
modifierType: Additive
id: crit_chance_curves
column: quality_to_crit_chance
refStat: BaseStats.Quality
refObject: Root
```
