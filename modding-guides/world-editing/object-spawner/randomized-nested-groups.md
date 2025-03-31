---
description: This page explains how to create RNGs
hidden: true
layout:
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: true
---

# Randomized Nested Groups

<figure><img src="../../../.gitbook/assets/WBRNGGIF" alt="" width="375"><figcaption><p>A complex RNG, containing multiple nested RNGs, realtime randomization</p></figcaption></figure>

## What are RNGs

* Randomized Nested Groups (RNGs) are a special type of group, which allow for it's content to be randomized
* They can be used just like normal groups, just that you get options allowing for control over when and how it's content are being spawned
* As the name says, they can be nested, allowing to create complex, reusable and randomized prefabs

## Why use them

* RNGs can make adding details to a build **significantly** faster, especially for things like clutter and trash
* While being randomized, they allow for rather fine control, such that the result still looks coherent
* RNGs can be easily shared, so if you make a nice selection of them, feel free to share them with others on e.g. Nexus
  * RNGs can just like normal groups be saved as prefab, [categorized, tagged and shared](ui-tabs-explained/tab-favorites-and-prefabs.md#creating-favorites-prefabs)

## Creating a RNG

* To create a new base RNG, simply click the "Dice" icon next to the `Add Group` button, then create the group

<figure><img src="../../../.gitbook/assets/WBRNGCreate" alt="" width="368"><figcaption><p>Enable the randomization using the dice button, then hit <code>Add Group</code> as usual</p></figcaption></figure>

* Now simply start by adding some elements to the RNG, e.g. some soda cans
* As you add new elements to the RNG (This can be single elements, but also groups or other RNGs), you will notice some of them being hidden due to the randomization

<figure><img src="../../../.gitbook/assets/WBRNGExample" alt="" width="375"><figcaption><p>A simple RNG containing some soda cans</p></figcaption></figure>

### RNG Settings

* To change the behavior of the RNG, select it, then expand the `Group Randmoization` header

<figure><img src="../../../.gitbook/assets/WBRNG_RNGSettings" alt="" width="446"><figcaption><p>RNG settings, either default per element spawning, or fixed amount spawning</p></figcaption></figure>

* Here you can also change the seed, or randomize it, this will re-randomize the RNG

{% hint style="success" %}
If you don't like how the RNG looks, simply randomize its seed using the button to its right
{% endhint %}

#### Randomization Modes

* There are two randomization modes:
  * Default:
    * Here, each contained element is spawned or not based on its own probability
  * Fixed:
    * Here, a fixed amount of the contained elements is spawned
    * You can either define a percentage (E.g. 75%), or a total amount (E.g. 2 elements should spawn)
    * In this mode, the individual probabilities of the contained elements are used to determine which are more likely to spawn

### RNG Child Settings

* Any element contained inside a RNG has its own settings
* Change them under the `Entry Randomization` header

<figure><img src="../../../.gitbook/assets/WBRNGEntrySettings" alt="" width="277"><figcaption><p>Individual elements settings, such as probability, randomized rotation and appearance</p></figcaption></figure>

* The `Spawning Probability` has a different effect based on the [randomization mode of the parent RNG](randomized-nested-groups.md#randomization-mode)
* Additionally, you can randomize the rotation of one axis
* For entities and meshes, you can also randomize the used appearance

{% hint style="success" %}
A RNG which is part of another RNG will have both the `Group Randomization` and the `Entry Randomization` headers

This is what makes RNGs very powerful, being able to nest RNGs inside RNGs
{% endhint %}

## Example

* In this example we will create RNG which consists of a vending machine, with some trash

### Base RNG

* Lets start by making a new RNG
* The main use of this "Root" RNG is so that we can quickly re-seed all the contained RNGs
* Since the root RNG does not need randomization, we will set it to fixed mode, and `100%`

<figure><img src="../../../.gitbook/assets/WBRNGBaseRNG" alt="" width="301"><figcaption><p> Our root RNG, so that we can easily refresh the seed of all contained RNGs at once</p></figcaption></figure>

### Vending Machine

* Lets add the vending machine `base\gameplay\devices\vending_machines\vending_machine_1.ent` to it, spawned as Entity
* Since it has loads of appearances, also enable randomization of apps

<figure><img src="../../../.gitbook/assets/WBRNGVending" alt="" width="288"><figcaption><p>Add the vending machine, and enable randomized appearances</p></figcaption></figure>

### Soda Single RNG

* Lets also make a simple RNG for soda cans, which we will re-use
* Make a new RNG, and put all the soda can meshes (Spawned as mesh) which you can find inside, all placed in the same position
  * Additionally also enable rotation randomization for each soda can mesh
* Now, set the soda RNGs mode to fixed, and the total amount to `1`
  * Now we have a RNG which spawns exactly one random soda can

<figure><img src="../../../.gitbook/assets/WBRNGSingleCan" alt="" width="345"><figcaption><p>Randomized single soda can mesh, using fixed mode</p></figcaption></figure>

### Soda Multiple RNG

* Lets take out single soda RNG and put three copies of it into yet another RNG
* I will leave this new "multi" RNGs settings at default, so each single soda RNG has a chance of 50% of spawning
  * This leaves us with a group of 3 randomized soda cans
* Now lets take this RNG, and put some copies into our root RNG, placed around the vending machine

<figure><img src="../../../.gitbook/assets/WBRNGMultiCans" alt="" width="342"><figcaption><p>Three of our single can RNGs placed into another RNG, left with default randomization rule</p></figcaption></figure>

### Cardboard RNG

* Lets make another RNG for some cardboards, we will add 3 cardboard meshes to it, and set each one to randomize its yaw rotation
* The RNG will be set to fixed mode, and configured to spawn 2 of our 3 cardboard meshes

<figure><img src="../../../.gitbook/assets/WBRNGCardboard" alt="" width="335"><figcaption><p>RNG spawning two out of three cardboard meshes with randomized rotation</p></figcaption></figure>

### Decals RNG

* Similar to the cardboard RNG, we will make another RNG containing some dirt and vomit decals
  * Once again, each decal is set to randomize its yaw rotation
* We will configure the RNG to spawn 75% of the decals

<figure><img src="../../../.gitbook/assets/WBRNGDecals" alt="" width="339"><figcaption><p>RNG which spawns 75% of the decals</p></figcaption></figure>

### Final result

* After adding some more RNGs for trashbags and a trashcan you get a final RNG that you can make a [favorite](ui-tabs-explained/tab-favorites-and-prefabs.md#creating-favorites-prefabs), to re-use it elsewhere
* Drop the attached JSON file into `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\entSpawner\data\favorite` if you just want the finished prefab

{% file src="../../../.gitbook/assets/Randomized_1742590803.json" %}
