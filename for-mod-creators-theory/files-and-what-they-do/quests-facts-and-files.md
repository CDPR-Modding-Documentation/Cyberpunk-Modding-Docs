---
description: Theory on the quest system
---

# Quests: facts and files

## Summary

**Written & Published**: Dec 9 2023 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")                                                                                              **Last documented update**: Apr 7 2024 by **Deceptious**

{% hint style="info" %}
This is the theory page. If you want more hands-on advice, check the [quest](../../modding-guides/quest/ "mention") section under **Modding Guides.**
{% endhint %}

## What are quest facts?

Quest facts are just a value (signed integer) and a name (string).

Quest facts are chosen by the developer/designer/modder.

While you are moving through the world of Cyberpunk, the game will track your progress in your save game via these quest facts and their values.

## How do quest facts work?

Quest facts do not exist until they are explicitly set. Until they are set they are assumed to be 0.

Any/all quest facts can be 'read' at any point. They can then be tested against a set value \[<, <=, ==, >=, >] and this test can form a Pause or Condition. \[If they havent been set/defined yet they will return as 0.]

There is no strict naming convention, but typically quest related facts start with the quest code \[Ex: mq055\_... sq027\_...]

Facts that are used in a similar way will also have a similar naming sceme \[Ex: radio\_on, tv\_on; judy\_default\_on, panam\_default\_on]

{% hint style="danger" %}
Editing quest facts **might** solve your immediate problem, but will almost always cause additional problems much later in the game, which are impossible to predict. E.g., while you can fix the missing phone call right now, this might break an elevator during the final quest. (I am not making this up)
{% endhint %}

Cyberpunk's quest facts don't actually **do** anything, they simply store a value that can be checked later - it is this later check, and logic that is set to follow, that actually **does** something. For an example, check the box below.

<details>

<summary>Example</summary>

During the prologue, you can send Delamain to one of three locations. Your choice will be relevant three times, the first of those in the first 24 hours after the prologue:

* When deciding if you get a phone call from Mamá Welles that will trigger [**Heroes**](https://cyberpunk.fandom.com/wiki/Heroes)
* During the rooftop conversation in [**Gimme Danger**](https://cyberpunk.fandom.com/wiki/Gimme\_Danger), where it will unlock extra dialogue
* Close to one of the endings in [**Totalimmortal**](https://cyberpunk.fandom.com/wiki/Totalimmortal), where it will unlock an extra conversation

One would naively assume that we can unlock the extra dialogue by changing the quest fact. However, that is not the case: the later checks will consider other things as well.

</details>

## Which files are associated?

Quest facts are most often set and used in `.questphase` (and `.quest`) and `.scene` files. They can also be manipluated in scripts \[Ex: Changing cyberware at a Ripperdoc sets certain facts] and also [directly in the code](https://codeberg.org/adamsmasher/cyberpunk).

### Which quest facts influence each other?

None of them, they are independent entities. However they can, in some are cases, be compared to each other \[<, <=, ==, >=, >]

For a json dump of facts grouped by .quest, .questphase and .scene, follow this [Discord Link](https://discord.com/channels/717692382849663036/803201431657250857/1182394517551321180).
