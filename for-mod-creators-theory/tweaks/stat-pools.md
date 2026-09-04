---
description: AKA drowning in stats and modifiers
---

# Stat Pools

## Summary

**Published:** September 04 by [Zhincore](https://app.gitbook.com/u/OsI9JXgCSSbt40hb327iBDif7Xv1 "mention")\
**Last documented edit:** September 04 by [Zhincore](https://app.gitbook.com/u/OsI9JXgCSSbt40hb327iBDif7Xv1 "mention")

Stat pool can be imagined like an "instance" of a stat. A stat can have minimum and maximum and a pool allows that stat to "charge" and "discharge" between those limits (and beyond if you want).

This page explains how they work and how they're defined.

## What is a stat pool?

Stat pool in game is a **numeric value attached to an entity** (player, npc, weapon, car, ...) which can change, for example persistent values like _health_, _stamina_, or _quick hack RAM memory_; or temporary values like _tech weapon charge_, or niche stuff like _"reinforcement phone call progress"_. So no, you cannot swim in a stat pool.

Stat pool is always attached to a stat which sets the pool's maximum value. For example `BaseStats.Health` sets how much health can an entity have, while `BaseStatPools.Health` remember how much it actually has at the moment (see image bellow). \
**For changing stats see** [stat-modifiers.md](stat-modifiers.md "mention") **page.**

<figure><img src="../../.gitbook/assets/Stat pools health diagram.png" alt=""><figcaption><p>Example of a stat pool, the maximum is set by the stat itself, but the current value can change during gameplay.</p></figcaption></figure>

## How is stat pool defined?

In TweakDB, stat pool is a record which references the parent stat, an enumName for use with the `StatPoolsSystem` and optionally regen, decay and initialValue:

{% code title="MyCustomHealthPool.yaml" overflow="wrap" %}
```yaml
BaseStatPools.MyCustomHealthPool:
    $type: gamedataStatPool
    
    enumName: Health
    stat: BaseStats.MyCustomHealth
    # Percentage of the max value that should the pool start with (between 0 and 100)
    initialValue: 100
    
    regen: BaseStatPools.MyCustomHealthPoolRegen
    decay: BaseStatPools.MyCustomHealthPoolDecay
```
{% endcode %}

**`enumName`** MUST be one of [`gamedataStatPoolType`](https://nativedb.red4ext.com/e/5923428624360168)'s values. **As of writing this, there is no easy way to use custom enum values for stat pools (they become `Invalid`).**

**`initialValue`** specifies how full the stat pool should be when created. 100 means 100% full, 50 half, 0 means the pool should start entirely empty and ready to regen/charge. The actual value depends on the value of the chosen stat.

{% hint style="warning" %}
**You cannot have multiple stat pools with the same enumName** on one entity! One would override the other.
{% endhint %}

With such defined stat pool you can either attach it to an entity via tweaks (e.g. add it to `statPools` array of a weapon) or with scripts ([StatPoolsSystem.RequestAddingStatPool](https://nativedb.red4ext.com/gameStatPoolsSystem#RequestAddingStatPool)). And then you can read it's value in [Prereqs](prereqs-customizable-conditions.md) or again [using scripts](https://nativedb.red4ext.com/gameStatPoolsSystem#GetStatPoolValue).

## Regeneration and decay modifiers

A special thing about stat pools is that their value can change automatically. For example Stamina **regenerates** while a person is resting and **decays** while sprinting. Those are the **two kinds of modifiers** a pool can have.&#x20;

A stat pool can have neither of those and the value can change using other ways (effector, scripts, ...). Modifiers can also be attached and changed for a pool during gameplay using scripts. It can also have multiple modifiers active at once using ExtraModifiers, however, CDPR seems to have never used those in scripts so beware.

Both kinds of modifiers are defined the same way in tweaks, here is a simple example of a record (they can be inlined, too):

{% code title="MyCustomHealthPool.yaml" overflow="wrap" %}
```yaml
BaseStatPools.MyCustomHealthPoolRegen:
  $type: gamedataPoolValueModifier_Record
  # Whether the modifier should act right away (togglable in scripts)
  enabled: true
  # Percentual range between which the modifier should be active
  rangeBegin: 0
  rangeEnd: 100
  # How much should the pool value change every second
  valuePerSec: 5
  # Seconds before the modifier starts acting when active
  startDelay: 0
  # Whether to stop acting and wait for `startDelay` if the stat pool changes 
  # by other means than this modifier
  delayOnChange: false
```
{% endcode %}

If we take Stamina again for example, it has delayOnChange = true and startDelay of 1 second, meaning if you dash during while the stamina bar was charging, it will stop for a second before resuming charging.

An advanced variant is the `MutablePoolValueModifier` which for each of these parameters adds a \*Mod(s) variant (e.g. `enabledMod`, `rangeBeginMods`, see TweakDB for reference). Those are references/inlines (or arrays of references/inlines) to [stat-modifiers.md](stat-modifiers.md "mention"). This way you can have a weapon attachment that makes the gun charge faster or cyberware that makes stamina regenerate instantly.
