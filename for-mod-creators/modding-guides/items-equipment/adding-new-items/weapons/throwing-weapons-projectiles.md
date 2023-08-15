---
description: How to make a custom projectiles for throwing weapons
---

# Throwing weapons: projectiles

This page is a sub-page of [Adding Weapons](./) and tells you how to create a custom **projectile** for a throwing weapon.

To create a custom throwing weapon, check the parent guide and use knife as a base type.

{% hint style="success" %}
Everything after the yaml works like adding regular items with a root entity, an appearance file and a mesh. We won't be using a mesh entity here.
{% endhint %}

## Step 1: the yaml

Add the following lines to your yaml:

```yaml
KnifeAttacks.MyKnifeThrowAttackProjectile:
  $type: Attack_Projectile
  projectileTemplateName: my_knife_projectile

Items.my_knife:
  $base: Items.Preset_Knife_Default
  appearanceResourceName: my_knife_appfile
  projectileTemplateName: my_knife_projectile
  attacks: [!append KnifeAttacks.MyKnifeThrowAttackProjectile]
```

## Step 2: the entity

You can find all projectile entities in `base\gameplay\projectiles\knife`. &#x20;

{% hint style="info" %}
`base\gameplay\projectiles\knife\tanto_projectile.ent` is a [root entity](../../../../files-and-what-they-do/entity-.ent-files.md#root-entity) with associated .app file, while `base\gameplay\projectiles\knife\knife_projectile.ent` is a [mesh entity](../../../../files-and-what-they-do/entity-.ent-files.md#mesh-component-entity-simple-entity) with the component directly included.&#x20;
{% endhint %}

Create a copy of the entity that you want, then connect it in your factory.

## Step 3: The factory

Finally, hook everything up by registering the appearanceResourceName from your .yaml file in your factory.csv. As a reminder, this is the line we're talking about:

```yaml
Items.my_knife:
  appearanceResourceName: my_knife_appfile
```

Make sure that the corresponding entry points at your projectile's entity file from step 3.&#x20;

## Step 4: The right mesh

In your entity or the linked .app file, make sure that you change all paths to the right mesh. (The mesh path is contained in `resolvedDependencies` and `inplaceResources` as well. TODO: Check if this is really necessary, then update the guide or tell mana, who couldn't be arsed to check herself)

## Step 5: Test

If you did everything correctly, you should now have a custom projectile for thrown weapons.&#x20;
