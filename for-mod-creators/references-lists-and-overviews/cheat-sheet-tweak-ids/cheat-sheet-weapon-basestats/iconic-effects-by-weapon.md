---
description: Weapon IDs and the tweaks they use
---

# Iconic effects by weapon

## Summary

**Created:** Apr 01 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Apr 01 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page collects tweak IDs (and their description) for iconic wepaons, grouped by weapon type

### Wait, this is not what I want!

* To learn what Tweaks are, check [tweaks](../../../tweaks/ "mention")
* To learn more about this, check [new-iconic-weapon-tutorial-for-dummies.md](../../../modding-guides/items-equipment/adding-new-items/weapons/new-iconic-weapon-tutorial-for-dummies.md "mention") ->[#step-12-making-an-iconic-mod-special-ability](../../../modding-guides/items-equipment/adding-new-items/weapons/new-iconic-weapon-tutorial-for-dummies.md#step-12-making-an-iconic-mod-special-ability "mention")
* To look up iconic modifiers, open `Cyberpunk 2077\tools\redmod\tweaks` and check\
  `base\gameplay\static_data\database\items\weapons\parts\iconic_mods.tweak`
* More intel on [#browsing-the-tweakdb](../../../tweaks/tweaks/#browsing-the-tweakdb "mention")

## Melee

### Swords - iconic mod abilities



| BaseID                                                                                                         | Iconic modifier                                                                                                                                                                                                                                                                                                           | Tweaks                                                                                                 | Value                                                        |
| -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------ |
| <p>Tsumetogi<br><a href="https://cyberpunk.fandom.com/wiki/Tsumetogi">Preset_Katana_Hiromi</a></p>             | _Slightly increases Electrical damage and grants a small chance to apply Shock to the enemy. Non-standard attacks deal more damage._                                                                                                                                                                                      | <p>BaseStats.ElectricResistance<br>BaseStats.ElectrocutedApplicationRate<br>BaseStats.DamagePerHit</p> | <p>Additive, 10f<br>Additive, 5f<br>Multiplier, 1.1f<br></p> |
| <p>Cocktail Stick<br><a href="https://cyberpunk.fandom.com/wiki/Cocktail_Stick">Preset_Katana_Cocktail</a></p> | _Looks like a toy, but its lethality is no joke. When Optical Camo is active, hitting an enemy causes Bleeding. Bleeding caused in this way lasts longer than usual._                                                                                                                                                     | <p>BaseStats.BleedingApplicationRate<br>BaseStats.DamagePerHit</p>                                     | <p>Additive, 10f<br>Multiplier, 0.9f</p>                     |
| <p>Jinchu-Maru<br><a href="https://cyberpunk.fandom.com/wiki/Jinchu-maru">Preset_Katana_Takemura</a></p>       | _The last hit in a combo guarantees Crit damage. While Optical Camo is active, all hits are critical and allow you to leap toward your target. Increases damage against Elite enemies._                                                                                                                                   | BaseStats.BonusDmgVsRaresAndElites                                                                     | Additive, 10f                                                |
| <p>Satori<br><a href="https://cyberpunk.fandom.com/wiki/Satori">Preset_Katana_Saburo</a></p>                   | _Allows you to leap towards distant enemies. When Satori is sheathed, hold primary attack to perform a Quickdraw Attack that is guaranteed to inflict Bleeding. If the enemy is already affected by Bleeding from Nehan, Satori will cause hemorrhaging instead. Hemorrhaging drains enemy Health and regenerates yours._ | <p>BaseStats.BleedingApplicationRate<br>BaseStats.DamagePerHit<br>BaseStats.CanMeleeLeap</p>           | <p>Additive, 10f<br>Multiplier, 0.9f<br>Additive, 1</p>      |
| <p>Scalpel<br><a href="https://cyberpunk.fandom.com/wiki/Scalpel">Preset_Katana_Surgeon</a></p>                | _While Sandevistan is active, increases Crit Chance by 50% and hits apply Bleeding._                                                                                                                                                                                                                                      | BaseStats.ElectrocutedApplicationRate                                                                  | Additive, 10f                                                |
| <p>Byakko<br><a href="https://cyberpunk.fandom.com/wiki/Byakko">Preset_Katana_Wakako</a></p>                   | _Byakko's perfect balancing allows you to leap towards an enemy with full force. Killing them allows you to temporarily perform a rapid combo of attacks._                                                                                                                                                                | <p>BaseStats.Range<br>BaseStats.CanMeleeLeap<br>BaseStats.BleedingApplicationRate</p>                  | <p>Additive, 1f<br>Additive, 1<br>Additive, 10f</p>          |
| <p>Errata<br><a href="https://cyberpunk.fandom.com/wiki/Errata">Preset_Katana_E3</a></p>                       | _Allows you to leap toward enemies. Attacking Burning enemies guarantees Crit Damage._                                                                                                                                                                                                                                    | <p>BaseStats.CanMeleeLeap<br>BaseStats.BurningApplicationRate<br>BaseStats.DamagePerHit</p>            | <p>Additive, 1<br>Additive, 10f<br>Multiplier, 0.9f</p>      |
| <p>Gwynbleidd<br><a href="https://cyberpunk.fandom.com/wiki/Gwynbleidd">Preset_Sword_Witcher</a></p>           | _Deals extra damage against bosses. After killing enemies in rapid succession, all attacks are temporarily guaranteed Crit Hits. The effect refreshes after quickly killing another enemy. If your Health is critically low, all attacks are guaranteed Crit Hits regardless of kills._                                   | <p>BaseStats.BonusDamageAgainstBosses<br>BaseStats.Weight</p>                                          | <p><br>Additive, 10f<br>Additive, 1.0f</p>                   |
| <p>Black Unicorn<br><a href="https://cyberpunk.fandom.com/wiki/Black_Unicorn">Preset_Katana_GoG</a></p>        | _Crafted for perfect balance. Attack speed is not affected by Stamina._                                                                                                                                                                                                                                                   | BaseStats.CanIgnoreWeaponStaminaPenaties                                                               | Additive, 1f                                                 |

### Knives

| BaseID                                                                                                                          | Iconic modifier                                                                                                                                                                      | Tweaks | Value |
| ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------ | ----- |
| <p>Stinger<br><a href="https://cyberpunk.fandom.com/wiki/Stinger">mq001_scorpions_knife</a></p>                                 | Attacks against poisoned enemies have a 100% chance to cause bleeding. Attacks against bleeding enemies have a 100% chance to cause poisoning.                                       |        |       |
| <p>Headhunter<br><a href="https://cyberpunk.fandom.com/wiki/Headhunter">Preset_Punk_Knife_Iconic</a></p>                        | Marks enemy on hit. Attacking the enemy's head with any weapon deals 200% damage, returns the Headhunter and clears the mark.                                                        |        |       |
| <p>Blue Fang<br><a href="https://cyberpunk.fandom.com/wiki/Blue_Fang">Preset_Neurotoxin_Knife_Iconic</a></p>                    | Stuns the enemy on hit. Headshots stuns after 1 sec while other hits stun after 3 sec. Enemies outside combat state get stunned immediately.                                         |        |       |
| <p>Butcher's Cleaver<br><a href="https://cyberpunk.fandom.com/wiki/Butcher&#x27;s_Cleaver">Preset_Butchers_Knife_Iconic</a></p> | Definition of "bloodthirsty." When your enemy is bleeding, the cleaver attacks faster and uses less stamina.                                                                         |        |       |
| <p>Nehan<br><a href="https://cyberpunk.fandom.com/wiki/Nehan">Preset_Tanto_Saburo</a></p>                                       | Thrown hits apply Bleeding. If the enemy is already affected by Bleeding from Satori, Nehan will cause hemorrhaging instead. Hemorrhaging drains enemy Health and regenerates yours. |        |       |
| <p>Fang<br><a href="https://cyberpunk.fandom.com/wiki/Fang">Preset_Knife_Kurtz_1</a></p>                                        | Thrown hits cripples the target, enemy when thrown, preventing their escape. Continuing attacks in close combat increases damage                                                     |        |       |

### Blunt

| BaseID                       |   | Tweaks | Value |
| ---------------------------- | - | ------ | ----- |
| Preset\_Baseball\_Bat\_Denny |   |        |       |
| sq021\_peter\_pan\_baton     |   |        |       |
| Preset\_Cane\_Fingers        |   |        |       |
| Preset\_Dildo\_Stout         |   |        |       |
| Preset\_Baton\_Murphy        |   |        |       |
| w\_melee\_boss\_hammer       |   |        |       |
| Preset\_Crowbar\_Bunker      |   |        |       |
| Preset\_VB\_Axe              |   |        |       |
| Preset\_Shovel\_Caretaker    |   |        |       |







