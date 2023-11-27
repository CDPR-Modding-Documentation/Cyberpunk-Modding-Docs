---
description: How to add appearances to existing NPCs (via AMM)
---

# AMM: Custom NPC appearances

{% hint style="warning" %}
Adding new appearances to an existing NPC requires you to **overwrite** that NPC's `.ent` file (As of November 2023, it is not possible to merge entity files).&#x20;

For that reason, it's recommended that you stick to [.](./ "mention"). This guide will only give you a very rough overview.
{% endhint %}

## The .lua file

In your project's [Resources](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#resources "mention") directory, create the following folder structure:

```
- bin
    - x64
        - plugins
            - cyber_engine_tweaks
                -mods
                    - AppearanceMenuMod
                        - Collabs
                            - Custom Appearances
```

In that folder, create `your_custom_file.lua`. (You can get a template project under [.](./ "mention")).&#x20;

The most important thing here is the `entity_id` - this is what tells AMM about the already existing file that you have modified.

As an example, look at the lua file I made for [Takemura's custom appearances](https://www.nexusmods.com/cyberpunk2077/mods/6111/) way back when:

```
return {
  -- Your beautiful name :)
  modder = "manavortex",

  -- This must be UNIQUE so be creative!
  -- NO SPACES OR SYMBOLS ALLOWED
  unique_identifier = "mana_Takemura_extra",

  -- You can find this using AMM's Swap tab
  -- and looking at the NPC
  entity_id = "0xF43B2B48, 18",

  -- Here you add a list of appearances you added
  -- It has to be the exact name you added
  -- to the entity file
  appearances = {    
	"goro_takemura_finale_white_shirt",
	"goro_takemura_saburo_bodyguard_shirt",
	
        "goro_takemura_kimono_pants", 
	"goro_takemura_kimono_hakama",
	"goro_takemura_haori_pants",
	"goro_takemura_haori_hakama",
  }
}
	
```

The rest of the process is pretty much like the other guide. Knowing what I know today, I probably would have created a custom entity for him in the first place, but since I chose to go down this road, I'm doomed to provide compatibility patches for the rest of eternity.&#x20;

Ah, well. There are worse fates.
