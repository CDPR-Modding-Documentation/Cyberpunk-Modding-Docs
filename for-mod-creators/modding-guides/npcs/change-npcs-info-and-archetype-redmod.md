---
description: Changing NPC's info on scan and its archetype.
---

# Change NPC's info and archetype - REDMod

This tutorial will show you how to change NPC's info when scanning them including archetype using REDMod. Only thing that you will need is REDMod dlc which is free and any IDE that is capable of editing .json, i prefer Visual Studio Code.You can get REDMod [here](https://www.cyberpunk.net/en/modding-support).

## Preparation

When you've downloaded REDMod if you don't have "mods" folder create it in Cyberpunk 2077 folder inside inside "mods" folder create folder which will be called however you want, for this tutorial we will name ours "example mod".

{% hint style="danger" %}
**Very important!!!**

Inside \<foldersname> you will need to create info.json , without that mod will not be deployed!.You copy following template and paste it into your info.json

{% code overflow="wrap" %}
```json
{
  "name": "YOURMODNAME",
  "version": "1.0",
  "customSounds": []
}
```
{% endcode %}
{% endhint %}

## Copying files from REDMod and creating directory

First we need to find tweak files which we want to edit, in this tutorial we will edit Panam.Some main characters are considered as "secondarycharacters" like Judy, Dex, Alt, Hanako...Panam is defined in primarycharacters.tweak.You can copy it from `Cyberpunk 2077\tools\redmod\tweaks\base\gameplay\static_data\database\characters\npcs\records\quest\main_characters\`.

After you copy .tweak create an folder named "tweaks" in your  mod folder (where info.json is located).In tweaks folder create a directory which will lead to your .tweak file (it must be like original).You should end up with directory like this `example mod\tweaks\base\gameplay\static_data\database\characters\npcs\records\quest\main_characters`and in `main_characters` paste your "primarycharacters.tweak".

## Editing .tweak file

Open primarycharacters.tweak in your IDE and in this case we will search for keyword "Panam".First we will look into what is what.

fullDisplayName - function that shows name in scan\
displayName - function that shows name in dialogues and choices\
archetypeData - name tells you, archetype of npc

We don't need anything else because it's not the part of this tutorial.

{% hint style="danger" %}
You can't put random names because that will randomize NPC's placeholders and it will be like a generic npc's.This is also useful for someone who want randomize names.\
Names are defined with localization keys "LocKey#\<number>"
{% endhint %}

For Localization keys and archetypedata you basiclly need find them from other npc's and paste for your desired NPC.

### Finding faction values

If you want to change NPC's affiliation you will need to add a line with specific faction defined.Factions are located in `Cyberpunk 2077\tools\redmod\tweaks\base\gameplay\static_data\database\factions\factions.tweak`.The thing are you looking for is marked on image below.

<figure><img src="../../../.gitbook/assets/Screenshot_1.png" alt=""><figcaption><p>What you need to look for</p></figcaption></figure>

After you find how faction is defined head into your npc's .tweak file and copy the following command and paste it like it's shown on the image below `fk< Affiliation > affiliation = "Factions.FACTION_NAME_HERE";`

<figure><img src="../../../.gitbook/assets/Screenshot_2.png" alt=""><figcaption><p>Example</p></figcaption></figure>

## Results

That's, save your work, deploy your mod and hop in the game to see the results.

<figure><img src="../../../.gitbook/assets/Screenshot_3.png" alt=""><figcaption></figcaption></figure>

If you have any questions join us on [discord](https://discord.gg/Epkq79kd96).
