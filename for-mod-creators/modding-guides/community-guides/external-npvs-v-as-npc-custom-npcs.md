---
description: A subpage dedicated to custom NPCs
---

# external: NPVs (V as NPC) - custom NPCs

This page is dedicated to the process of creating custom NPCs via community guides and -resources.&#x20;

{% hint style="info" %}
For the wiki version of this guide, see [here](../npcs/npv-v-as-custom-npc/).
{% endhint %}

## Guides

|                                                                                                                                                                                                                                                                                                                                                                                                |                                                                               |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| <p>How to <a href="https://docs.google.com/document/d/1omTh5B8z7MsYxIO6xzOEBqpm17tKxCCQgWqEbeFQXc8/">create an NPV</a> (Google Docs)<br>- resources on <a href="https://drive.google.com/drive/folders/1R-knopKMhHDZuokPKaTt0nIDArXcQdrb">Google Drive</a><br>- utility script for glb shapekeys on <a href="https://gist.github.com/manavortex/eb9a8692988e862e3304fea0fb492d03">gist</a></p> | How to manually swap V over an NPC, by **NoraLee** (Google Docs/Drive)        |
| <p>WolvenKit: <a href="https://docs.google.com/document/d/1BYKf8e_Z45am9mBH9aoHQONXkKrKTOEJRMr7NNuZuCY/edit?usp=sharing">Create an NPV</a> (Google Docs)<br>Contains a section on <a href="https://docs.google.com/document/d/1BYKf8e_Z45am9mBH9aoHQONXkKrKTOEJRMr7NNuZuCY/edit#heading=h.6akx9wl0al1o">facial animations</a></p>                                                              | How to implement part 4+ of NoraLee's guide in WolvenKit (by nx#3390)         |
| How to [customize an NPV](https://xbaebsae.jimdofree.com/tutorials/cp2077-more-npv-customisation/) via Tweak XL                                                                                                                                                                                                                                                                                | how to add custom behaviour, equipment, and translation strings (by xbaebsae) |
| [Adding/editing appearances to Custom NPV/NPC on the custom framework in WolvenKit](https://youtu.be/f2VaiP1u\_jE)                                                                                                                                                                                                                                                                             | YouTube video by Vesna \[CyberVesna/Vesn4\_]                                  |

## Resources and Utilities

|                                                                                                                  |                                                                                        |
| ---------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| Website: NoraLee's [NPV picker](https://noraleedoes.neocities.org/npv/npv\_part\_picker)                         | A (WIP) mapping between the character creator and appearance keys in the app/ent files |
| Blender: [Python script to apply shapekeys](https://gist.github.com/manavortex/eb9a8692988e862e3304fea0fb492d03) | Set up for use with NoraLee's glb files _(needs adjusting otherwise)_                  |
|                                                                                                                  |                                                                                        |

## Other relevant guides on this wiki

* [How to find items in the game files](../../references-lists-and-overviews/equipment/spawn-codes-baseids-hashes.md#from-a-baseid-to-an-items-materials)
* [Changing NPC appearances](../npcs/appearances-change-the-looks.md): How to swap out components in an .app file&#x20;

## Other information

The base head that's used for NPV can be found under

```
base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\
base\characters\head\player_base_heads\player_male_average\h0_000_pma_c__basehead\
```

To export a head mesh with shape keys, you have to export the corresponding .morphtarget, e.g.

```
base\characters\head\player_base_heads\player_female_average\h0_000_pwa__morphs.morphtarget
```

As these are not named in a human-readable way, you'll want to apply them via [Blender script](https://gist.github.com/manavortex/eb9a8692988e862e3304fea0fb492d03).
