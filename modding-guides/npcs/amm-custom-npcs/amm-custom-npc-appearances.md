---
description: How to add appearances to existing NPCs (via AMM)
---

# AMM: Custom NPC appearances

## Summary

Created: Nov 27 2023 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
Last documented update: Jan 02 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This guide makes use of [archivexl-resource-patching.md](../../../for-mod-creators-theory/core-mods-explained/archivexl/archivexl-resource-patching.md "mention") to add appearances to an already-existing NPC.

The process for this mod is exactly like it is with [.](./ "mention"), just that instead of adding a new NPC, we tell AMM and ArchiveXL to add our appearances to an existing NPC.

{% hint style="danger" %}
Do **not** overwrite an NPC's original files! This will cause compatibility issues for every single modder out there, and risk breaking the NPC with every game update. (Some people had naked Judy on the phone in Phantom Liberty, which was wildly inappropriate for the context)
{% endhint %}

{% hint style="info" %}
You can check the [AMM Appearances for Takemura Goro](https://www.nexusmods.com/cyberpunk2077/mods/6111/) mod for a live example of this.
{% endhint %}

## The .lua file

After completing the custom NPC guide, you should have the following file in your project's [Resources](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#resources "mention") directory:

```
- bin
    - x64
        - plugins
            - cyber_engine_tweaks
                -mods
                    - AppearanceMenuMod
                        - Collabs
                            - Custom Appearances
                                - your_custom_file.lua
```

Open it in a text editor like [Notepad++](https://notepad-plus-plus.org/downloads/) and add the following line (check  [finding-files-amm-npcs.md](../../../for-mod-creators-theory/references-lists-and-overviews/people/finding-files-amm-npcs.md "mention") for a step-by-step guide on finding the correct entity ID):

```lua
  entity_id = "0xF43B2B48, 18",
```

<details>

<summary>Example .lua (<a href="https://www.nexusmods.com/cyberpunk2077/mods/6111/">Takemura's custom appearances</a>)</summary>

```lua
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

</details>

## The .xl file

### 1. Create the file

Directly in your project's [Resources](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/project-explorer#resources "mention") directory, create an empty text file called `your_project_name.archive.xl`, and open it in a text editor like [Notepad++](https://notepad-plus-plus.org/downloads/).&#x20;

Paste the following text (we'll adjust it together):

```yaml
resource:
  patch:  
    path\to\your\app_file.app:
      - base\characters\appearances\main_npc\goro_takemura.app 
    path\to\your\ent_file.ent:
      - base\quest\primary_characters\takemura.ent
```

{% hint style="info" %}
Do **not** change the indent (number of spaces at the beginning of each line). If that happens to you, check [#id-4.-optional-fixing-that-damn-indent](amm-custom-npc-appearances.md#id-4.-optional-fixing-that-damn-indent "mention")
{% endhint %}

### 2. Adjust the .app file path

1. Replace `path\to\your\app_file.app` with the **relative path** to your .app file (right-click it in Wolvenkit, then select `Copy Relative Path`)
2. Replace `base\characters\appearances\main_npc\goro_takemura.app` with the relative path to the NPC's original .app file. Check  [finding-files-amm-npcs.md](../../../for-mod-creators-theory/references-lists-and-overviews/people/finding-files-amm-npcs.md "mention") for how to find the .app.

This tells ArchiveXL to add all appearances from your .app file to the original NPC's file, making them available for the game.

### 3. Adjusting the .ent file path

* Replace `path\to\your\ent_file.ent` with the **relative path** to your .ent file (right-click it in Wolvenkit, then select `Copy Relative Path`)
* Replace base\quest\primary\_characters\takemura.ent with the relative path to the NPC's original .app file. Check  [finding-files-amm-npcs.md](../../../for-mod-creators-theory/references-lists-and-overviews/people/finding-files-amm-npcs.md "mention") for how to find the .app.

This tells ArchiveXL to add all appearances from your .ent file to the original NPC's file, making them available for the game.

### 4. Optional: Fixing that damn indent

If your custom appearances aren't working, run your .xl file through [yamllint](https://www.yamllint.com/) and fix any mistakes.



{% hint style="success" %}
That's it! You should now have more NPC appearances!
{% endhint %}

