---
description: >-
  Attempt at pulling together the various bits of info in the discord history
  about
---

# NodeRefs

NodeRefs are kinda like bookmarks for nodes their defined in a section of the streaming sector and used to point things at each other. So for instance an elevator control panel uses a nodeRef to point to the elevator itself.

Following is pretty much a straight copy and paste of some of Psiberxs posts from the discord explaining stuff

### About NodeRefs

at runtime NodeRef is a compound hash calculated from a path.

Ffirst you have to register NodeRef using an _absolute path_ that starts with `$/` you should've seen such path in sectors, something like `$/03_night_city/c_watson/little_china/loc_megabuilding_a_prefab4KCU2IQ/loc_megabuilding_a_env_prefab7JTEUXY/megabuilding_a_environment_main_vs_mb_prefabZZTIINY/vs_apartment_floor_prefabW6EJ43Y/deco_prefabFKU4HJQ/megabuilding_vs_apartment1_prefab4ZYKDLY/mb_vs_apartment_env_arch_prefabT73KCQY/ceiling_fan_a_spinning_prefabIQCQMLQ` the hash is calculated for every part of the path and registered in the lookup table, it's not just a single hash function call you can always use the absolute path as a reference, but there's a more convenient way using # you can register a _global alias_, that can be used as a reference without knowing the original path for example, if you register `$/03_night_city/c_watson/little_china/#my_new_node`, then you can use just `#my_new_node` alias to refer this node the hash of the alias depends on the original path for example, `$/aaa/#my_new_node` and `$/bbb/#my_new_node` will register different hashes if you'll use the same global alias twice, the later instance will take precedence, i.e. will overwrite the previous alias in the lookup table so it's impossible to calculate NodeRef just from alias like `#my_new_node`, it can be done only knowing the absolute path used for registration

### &#x20;How to register NodeRefs&#x20;

every time engine parses any _absolute path_ it registers a NodeRef in the lookup table on this screenshot entry 6 will create a new NodeRef that can be used later entry 7 won't do anything![Image](https://media.discordapp.net/attachments/814064062815141909/1083409171325665390/image.png?ex=6741f2eb\&is=6740a16b\&hm=4ee98154adba9b8db84714a5100292d0ea6ebb4a1c9f8eae852941634c830894&=\&format=webp\&quality=lossless)



### How to link NodeRef to node instance

first of all you have to register NodeRef by adding it to `nodeRefs` then you have to fill the hash in `QuestPrefabRefHash` property, which is actually `globalNodeId` containing NodeRef hash (surprisingly it can be found in `metadata.json` from redmod, but not in runtime RTTI) ![Image](https://media.discordapp.net/attachments/814064062815141909/1083411084817481858/image.png?ex=6741f4b3\&is=6740a333\&hm=d81f479737c46da1e6a65259b2a6650ec7af37f08584925034b0958c7f8d5c80&=\&format=webp\&quality=lossless\&width=550\&height=187)
