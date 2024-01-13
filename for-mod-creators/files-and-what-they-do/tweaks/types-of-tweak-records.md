---
description: Which kinds of tweak records exist? How are they defined? What do they mean?
---

# Types of tweak records

**Created:** Jan 13 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Jan 13 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

{% hint style="danger" %}
This page is a work in progress, as the tweak database is huge and barely-documented. If you have any information that needs to be in here, **please don't hesitate** to sign up as an editor and start contributing!
{% endhint %}

## Summary

This page lists types of tweak records with their properties and lists of occurrances in the wild. They are grouped by **type**, and&#x20;

Please keep entries in the following format (you can copy e.g. [#effector](types-of-tweak-records.md#effector "mention") below):

{% code title="Entry explanation" overflow="wrap" %}
```
Heading 1: Section - Group records by type(s)

Heading 2: Name of tweak type
A brief description of what it does, and a .tweak snippet (syntax: swift). 
If you know any guides or resources using this kind of tweak, add an info box with links.

Heading 3: Properties
A table: propertyName => explanation

Heading 3: Existing <name of tweak type>
A table with name of tweak type and a brief description of what it does
```
{% endcode %}

## Conditionals

### Condition

A wrapper of [#prereq](types-of-tweak-records.md#prereq "mention") with additional finetuning.

{% hint style="info" %}
For more information on this, check the [new-iconic-weapon-tutorial-for-dummies.md](../../modding-guides/items-equipment/adding-new-items/weapons/new-iconic-weapon-tutorial-for-dummies.md "mention") guide ([#creating-a-custom-condition](../../modding-guides/items-equipment/adding-new-items/weapons/new-iconic-weapon-tutorial-for-dummies.md#creating-a-custom-condition "mention"))
{% endhint %}

```swift
# Condition to check if attack type is ranged
Conditions.Is_Attack_Ranged:
  $type: gamedataHitPrereqCondition_Record
  invert: False
  onlyOncePerShot: True
  type: Prereqs.AttackType
  attackType: Ranged
```

#### Properties

<table><thead><tr><th width="270">Property name</th><th>Property explanation</th></tr></thead><tbody><tr><td><code>invert</code></td><td>trigger when the condition is <strong>not</strong> met?</td></tr><tr><td><code>onlyOncePerShot</code></td><td>Limit this to one procc per bullet?</td></tr><tr><td><code>type</code></td><td>A <a data-mention href="types-of-tweak-records.md#prereq">#prereq</a> — not the same as <code>$type</code>!</td></tr><tr><td><code>attackType</code></td><td>finetuning of <code>type</code></td></tr></tbody></table>

#### Existing conditions

<table><thead><tr><th width="355">Effector name</th><th>Effector explanation</th></tr></thead><tbody><tr><td><code>Perks.IsHitTargetAlive_inline2</code></td><td>Is the current target alive?</td></tr><tr><td><code>Perks.HitIsBodyPartHead_inline0</code></td><td>Is the current hit a headshot?</td></tr></tbody></table>

### Effector

An effector is the tweak version of an `if-condition`: it is using [#condition](types-of-tweak-records.md#condition "mention")s or [#prereq](types-of-tweak-records.md#prereq "mention")s before triggering its effect.&#x20;

<pre class="language-swift" data-title="mods_abilities.tweak"><code class="lang-swift">{
<strong>    prereqRecord = "Prereqs.ProcessHitTriggered";
</strong>    percentMult = 0.25f;
    unitThreshold = 10f;
} : MultiplyDamageWithVelocity, 
{
    prereqRecord = "Perks.IsHitQuickMelee";
    value = 1.5f;
} : MultiplyDamage
</code></pre>

{% hint style="info" %}
For more information on this, check the [new-iconic-weapon-tutorial-for-dummies.md](../../modding-guides/items-equipment/adding-new-items/weapons/new-iconic-weapon-tutorial-for-dummies.md "mention") guide:\
&#x20;[#wilsons-iconic-iron](../../modding-guides/items-equipment/adding-new-items/weapons/new-iconic-weapon-tutorial-for-dummies.md#wilsons-iconic-iron "mention")\
&#x20;[#designing-effectors](../../modding-guides/items-equipment/adding-new-items/weapons/new-iconic-weapon-tutorial-for-dummies.md#designing-effectors "mention")
{% endhint %}

#### Properties

<table><thead><tr><th width="270">Property name</th><th>Property explanation</th></tr></thead><tbody><tr><td><code>prereqRecord</code></td><td>a <a data-mention href="types-of-tweak-records.md#prereq">#prereq</a> to check if the effector should become active</td></tr><tr><td><code>unitThreshold</code></td><td>a lower bound for the condition</td></tr><tr><td><code>percentMult</code></td><td>for a multiplier: multiply by percentage (0.25 => 125%)</td></tr><tr><td><code>value</code></td><td>the numeric value (1.5 => 150%) </td></tr></tbody></table>

#### Existing effectors

<table><thead><tr><th width="327">Effector name</th><th>Effector explanation</th></tr></thead><tbody><tr><td><code>MultiplyDamageWithVelocity</code> </td><td>Will multiply damage by <code>percentMult</code> (if the velocity is > <code>unitThreshold</code>)</td></tr><tr><td><code>MultiplyDamage</code></td><td>Will multiply damage by <code>value</code></td></tr></tbody></table>

### Prereq

The prerequisite for e.g. an [#effector](types-of-tweak-records.md#effector "mention").&#x20;

{% hint style="info" %}
For more information on this, check the [new-iconic-weapon-tutorial-for-dummies.md](../../modding-guides/items-equipment/adding-new-items/weapons/new-iconic-weapon-tutorial-for-dummies.md "mention") guide ([#creating-a-custom-prereq](../../modding-guides/items-equipment/adding-new-items/weapons/new-iconic-weapon-tutorial-for-dummies.md#creating-a-custom-prereq "mention"))
{% endhint %}

#### Existing prereqs

<table><thead><tr><th width="327">Effector name</th><th>Effector explanation</th></tr></thead><tbody><tr><td><code>ProcessHitTriggered</code></td><td>Does the bullet hit anything?</td></tr><tr><td><code>IsHitQuickMelee</code> </td><td>is the current attack a quick melee attack?</td></tr></tbody></table>

