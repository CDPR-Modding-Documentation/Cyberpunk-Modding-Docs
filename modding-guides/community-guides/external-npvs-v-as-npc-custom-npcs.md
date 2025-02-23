---
description: A subpage dedicated to custom NPCs
---

# External Community Guides: NPVs (V as NPC) - Custom NPCs

## Summary

**Last documented edit**: February 23 2025 by LadyLea

This page is dedicated to the process of creating custom NPCs via community guides and resources.&#x20;

{% hint style="info" %}
For the wiki version of this guide, see [here](../npcs/npv-v-as-custom-npc/).
{% endhint %}

## Guides

| Now to Create an NPV                                                                                                                                                                                                                                                                                                                                                                           | Creators                                                                                                                                                                                 |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [NPV Tutorial Series](https://www.youtube.com/watch?v=f9KWa_qJDUo\&list=PL2HshRoogFoEIZqk3jzZD8CvyIeOi3Sul\&index=3)                                                                                                                                                                                                                                                                           | <p>Youtube playlist </p><p>by Sh00kspeared</p>                                                                                                                                           |
| <p>How to <a href="https://docs.google.com/document/d/1omTh5B8z7MsYxIO6xzOEBqpm17tKxCCQgWqEbeFQXc8/">create an NPV</a> (Google Docs)<br>- resources on <a href="https://drive.google.com/drive/folders/1R-knopKMhHDZuokPKaTt0nIDArXcQdrb">Google Drive</a><br>- utility script for glb shapekeys on <a href="https://gist.github.com/manavortex/eb9a8692988e862e3304fea0fb492d03">gist</a></p> | <p>Google Drive &#x26; Google Document</p><p>by NoraLee </p><p>(How to manually swap V over an NPC)</p>                                                                                  |
| <p>WolvenKit: <a href="https://docs.google.com/document/d/1BYKf8e_Z45am9mBH9aoHQONXkKrKTOEJRMr7NNuZuCY/edit?usp=sharing">Create an NPV</a> <br>Contains a section on <a href="https://docs.google.com/document/d/1BYKf8e_Z45am9mBH9aoHQONXkKrKTOEJRMr7NNuZuCY/edit#heading=h.6akx9wl0al1o">facial animations</a></p>                                                                           | <p>Google Document</p><p>by<a href="https://next.nexusmods.com/profile/Silverlags/mods?gameId=3333"> Silverlags</a></p><p>(How to implement part 4+ of NoraLee's guide in WolvenKit)</p> |
| How to [customize an NPV](https://xbaebsae.jimdofree.com/cyberpunk-2077-guides/cp2077-more-npv-customisation/) via Tweak XL + [Photomode](https://www.nexusmods.com/cyberpunk2077/mods/18837)                                                                                                                                                                                                  | <p>Guide on Personal Website + Nexus Mods</p><p>by xbaebsae </p><p>(How to add custom behaviour, equipment, and translation strings + Photomode List)</p>                                |
| [Adding/editing appearances to Custom NPV/NPC on the custom framework in WolvenKit](https://youtu.be/f2VaiP1u_jE)                                                                                                                                                                                                                                                                              | <p>YouTube Video</p><p>by <a href="https://next.nexusmods.com/profile/CyberVesna/mods?gameId=3333">CyberVesna</a></p>                                                                    |

## Resources and Utilities

| Now to Create an NPV                                                                                                                                                                                   | Creators                                                                                   |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| <p>Website: NoraLee's <a href="https://noraleedoes.neocities.org/npv/npv_part_picker">NPV picker</a> </p><p>A (WIP) mapping between the character creator and appearance keys in the app/ent files</p> | <p>Resources on Personal Website </p><p>by NoraLee</p>                                     |
| Blender: [Python script to apply shapekeys](https://gist.github.com/manavortex/eb9a8692988e862e3304fea0fb492d03)                                                                                       | <p>Set up for use with NoraLee's glb files </p><p><em>(needs adjusting otherwise)</em></p> |

## Other relevant guides on this wiki

* [How to find items in the game files](../../for-mod-creators-theory/references-lists-and-overviews/equipment/spawn-codes-baseids-hashes.md#from-a-baseid-to-an-items-materials)
* [Changing NPC appearances](../npcs/appearances-change-the-looks/): How to swap out components in an .app file&#x20;

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
