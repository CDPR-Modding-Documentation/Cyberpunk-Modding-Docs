---
description: How to make a custom projectiles for throwing weapons
---

# Throwing weapons: projectiles

## Summary

**Created by @manavortex**\
**Updated October 05 2023**

This page is a sub-page of [Adding Weapons](./) and tells you how to create a custom **projectile** for a throwing weapon.

To create a custom throwing weapon, check the parent guide and use knife as a base type.

{% hint style="info" %}
Everything but the yaml works exactly like adding regular items (with a [root](../../../../files-and-what-they-do/entity-.ent-files/#root-entity) or [mesh entity](../../../../files-and-what-they-do/entity-.ent-files/#mesh-component-entity-simple-entity), an [.app file](../../../../files-and-what-they-do/appearance-.app-files/#appearances) and your weapon's mesh). This example will use a root entity.
{% endhint %}

{% hint style="success" %}
This process is about as finicky as the one for weapon additions. Make sure to test your changes after each step.
{% endhint %}

## Step 0: the yaml

We now need to register our projectile. We already have a weapon, so let's define our projectile:

```yaml
KnifeAttacks.MyKnifeThrowAttackProjectile:
  $type: Attack_Projectile
  projectileTemplateName: my_new_weapon_projectile_name
```

Now, we need to tell our weapon about it. Add the following lines to its definition:

```yaml
Items.my_knife:
  # the rest of your weapon's definition
  projectileTemplateName: my_new_weapon_projectile_name
  useProjectileAppearance: true
  attacks: 
    - !append KnifeAttacks.MyKnifeThrowAttackProjectile
```

If your weapon wasn't throwable before, it is now — but the projectile is still invisible. Time to change that.

## Step 1: the entity file

{% hint style="warning" %}
A projectile needs an `.ent` file as the factory's entry point, not an `.app`.
{% endhint %}

You can find all projectile entities in `base\gameplay\projectiles`. &#x20;

{% hint style="danger" %}
Ignore anything that has `default` in its name.
{% endhint %}

There are two kinds of .ent files: the ones that support multiple appearances, and the ones that don't. You can tell them apart by opening them and checking the `appearances` array (the first entry in the list).&#x20;

Pick the right kind of entity for your weapon:

#### [Root entity](../../../../files-and-what-they-do/entity-.ent-files/#root-entity)

Use e.g. this entity file if you want to use multiple appearances:

```
base\gameplay\projectiles\knife\tanto_projectile.ent
```

#### [Mesh entity](../../../../files-and-what-they-do/entity-.ent-files/#mesh-component-entity-simple-entity)

Use e.g. this entity file if a single appearance is enough for you:

```
base\gameplay\projectiles\knife\knife_projectile.ent
```

Add the file to your project, then rename it and (if you have one) move it to your weapon's folder.

## Step 2: The factory

Now it's time to connect everything by registering the `projectileTemplateName` from your `.yaml` file in your factory.csv. As a reminder, this is the line we're talking about:

```yaml
KnifeAttacks.MyNewWeaponThrowAttackProjectile:
  projectileTemplateName: my_new_weapon_projectile_name
```

Make sure that the corresponding entry points at your **projectile's entity file** from [step 1](throwing-weapons-projectiles.md#step-1-the-entity-file).&#x20;

{% hint style="success" %}
Your factory should have two entries: one for the projectile, one for the weapon itself.
{% endhint %}

From now on, your projectile will no longer be invisible. If it is, try setting your factory path to one of the game's original projectile entities - debugging time.

## Step 3: the .app

{% hint style="info" %}
If you're using a mesh entity (with an empty `appearances` array), you can **skip this step**.
{% endhint %}

1. Expand the `appearances` array
2. Select any of the appearances
3. Check the appearanceResource's depot path
4. Add this file to your project
5. Rename it and move it to your custom folder.
6. Open your root entity. For all of the appearances, change the `appearanceResource` path to that of your `.app`.

## Step 4: The right mesh

{% hint style="info" %}
If you are using a mesh entity (without an `.app` file), that's where you will find the `component`s.  Skip step 1 on the list below.
{% endhint %}

1. Open your `.app` file . For each of the `appearance`s, do the following:
   1. Expand the `components` array
   2. For any components that have `Mesh` in their type name:
      1. Change the mesh `depotPath` to your weapon's custom mesh
      2. Change the `meshAppearance` to one of your weapon's appearances
   3. Open `resolvedDependencies` and replace the path to the original mesh with your own.

## Step 5: Test

If you did everything correctly, you should now have a custom projectile for thrown weapons.&#x20;

## Troubleshooting

For troubleshooting steps, please see the [.](./ "mention") page.
