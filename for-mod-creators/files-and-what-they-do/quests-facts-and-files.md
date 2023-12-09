---
description: Theory on the quest system
---

# Quests: facts and files

#### Summary

**Written by** [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Published: 09. 12. 2032**

{% hint style="info" %}
This is the theory page. If you want more hands-on advice, check the [quest](../modding-guides/quest/ "mention") section under [modding-guides](../modding-guides/ "mention").
{% endhint %}

## How does the quest system work?

While you are moving through the world of Cyberpunk, the game will track your progress in your save game. This is done via [quest facts](quests-facts-and-files.md#what-are-quest-facts).&#x20;

## Which files are associated?

Quest facts are defined in `.quest` or `.questphase` files. and accessed in `.scene` files or [directly in the code](https://codeberg.org/adamsmasher/cyberpunk).

## What are quest facts?

Quest facts are chosen by the quest creator. There is no naming convention or common structure that we have been able to identify.

{% hint style="danger" %}
Editing quest facts **might** solve your immediate problem, but will almost always cause additional problems much later in the game, which are impossible to predict. E.g., while you can fix the missing phone call right now, this might break an elevator during the final quest. (I am not making this up)
{% endhint %}

Cyberpunk is **stateful** - this means that your quest facts will only be checked at certain points in the game.  For an example, check the box below.

<details>

<summary>Example</summary>

During the prologue, you can send Delamain to one of three locations. Your choice will be relevant three times, the first of those in the first 24 hours after the prologue:

* When deciding if you get a phone call from Mamá Welles that will trigger [**Heroes**](https://cyberpunk.fandom.com/wiki/Heroes)
* During the rooftop conversation in [**Gimme Danger**](https://cyberpunk.fandom.com/wiki/Gimme\_Danger), where it will unlock extra dialogue
* Close to one of the endings in [**Totalimmortal**](https://cyberpunk.fandom.com/wiki/Totalimmortal), where it will unlock an extra conversation

One would naively assume that we can unlock the extra dialogue by changing the quest fact. However, that is not the case: the later checks will consider other things as well.

</details>

### Which quest facts influence each other?

Due to the [stateful nature of the game](quests-facts-and-files.md#what-are-quest-facts), potentially **all of them**. As of December 2023, there exists no good way to keep track of them.

For a json dump of facts grouped by .quest, .questphase and .scene, follow this [Discord Link](https://discord.com/channels/717692382849663036/803201431657250857/1182394517551321180).
