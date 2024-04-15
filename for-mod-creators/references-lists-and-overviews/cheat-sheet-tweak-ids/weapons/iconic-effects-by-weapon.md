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



<table><thead><tr><th>BaseID</th><th>Iconic modifier</th><th width="352">Tweaks</th><th>Value</th></tr></thead><tbody><tr><td>Tsumetogi<br><a href="https://cyberpunk.fandom.com/wiki/Tsumetogi">Preset_Katana_Hiromi</a></td><td><em>Slightly increases Electrical damage and grants a small chance to apply Shock to the enemy. Non-standard attacks deal more damage.</em></td><td>BaseStats.ElectricResistance<br>BaseStats.ElectrocutedApplicationRate<br>BaseStats.DamagePerHit</td><td>Additive, 10f<br>Additive, 5f<br>Multiplier, 1.1f<br></td></tr><tr><td>Cocktail Stick<br><a href="https://cyberpunk.fandom.com/wiki/Cocktail_Stick">Preset_Katana_Cocktail</a></td><td><em>Looks like a toy, but its lethality is no joke. When Optical Camo is active, hitting an enemy causes Bleeding. Bleeding caused in this way lasts longer than usual.</em></td><td>BaseStats.BleedingApplicationRate<br>BaseStats.DamagePerHit</td><td>Additive, 10f<br>Multiplier, 0.9f</td></tr><tr><td>Jinchu-Maru<br><a href="https://cyberpunk.fandom.com/wiki/Jinchu-maru">Preset_Katana_Takemura</a></td><td><em>The last hit in a combo guarantees Crit damage. While Optical Camo is active, all hits are critical and allow you to leap toward your target. Increases damage against Elite enemies.</em></td><td>BaseStats.BonusDmgVsRaresAndElites</td><td>Additive, 10f</td></tr><tr><td>Satori<br><a href="https://cyberpunk.fandom.com/wiki/Satori">Preset_Katana_Saburo</a></td><td><em>Allows you to leap towards distant enemies. When Satori is sheathed, hold primary attack to perform a Quickdraw Attack that is guaranteed to inflict Bleeding. If the enemy is already affected by Bleeding from Nehan, Satori will cause hemorrhaging instead. Hemorrhaging drains enemy Health and regenerates yours.</em></td><td>BaseStats.BleedingApplicationRate<br>BaseStats.DamagePerHit<br>BaseStats.CanMeleeLeap</td><td>Additive, 10f<br>Multiplier, 0.9f<br>Additive, 1</td></tr><tr><td>Scalpel<br><a href="https://cyberpunk.fandom.com/wiki/Scalpel">Preset_Katana_Surgeon</a></td><td><em>While Sandevistan is active, increases Crit Chance by 50% and hits apply Bleeding.</em></td><td>BaseStats.ElectrocutedApplicationRate</td><td>Additive, 10f</td></tr><tr><td>Byakko<br><a href="https://cyberpunk.fandom.com/wiki/Byakko">Preset_Katana_Wakako</a></td><td><em>Byakko's perfect balancing allows you to leap towards an enemy with full force. Killing them allows you to temporarily perform a rapid combo of attacks.</em></td><td>BaseStats.Range<br>BaseStats.CanMeleeLeap<br>BaseStats.BleedingApplicationRate</td><td>Additive, 1f<br>Additive, 1<br>Additive, 10f</td></tr><tr><td>Errata<br><a href="https://cyberpunk.fandom.com/wiki/Errata">Preset_Katana_E3</a></td><td><em>Allows you to leap toward enemies. Attacking Burning enemies guarantees Crit Damage.</em></td><td>BaseStats.CanMeleeLeap<br>BaseStats.BurningApplicationRate<br>BaseStats.DamagePerHit</td><td>Additive, 1<br>Additive, 10f<br>Multiplier, 0.9f</td></tr><tr><td>Gwynbleidd<br><a href="https://cyberpunk.fandom.com/wiki/Gwynbleidd">Preset_Sword_Witcher</a></td><td><em>Deals extra damage against bosses. After killing enemies in rapid succession, all attacks are temporarily guaranteed Crit Hits. The effect refreshes after quickly killing another enemy. If your Health is critically low, all attacks are guaranteed Crit Hits regardless of kills.</em></td><td>BaseStats.BonusDamageAgainstBosses<br>BaseStats.Weight</td><td><br>Additive, 10f<br>Additive, 1.0f</td></tr><tr><td>Black Unicorn<br><a href="https://cyberpunk.fandom.com/wiki/Black_Unicorn">Preset_Katana_GoG</a></td><td><em>Crafted for perfect balance. Attack speed is not affected by Stamina.</em></td><td>BaseStats.CanIgnoreWeaponStaminaPenaties</td><td>Additive, 1f</td></tr></tbody></table>

### Knives

<table><thead><tr><th width="137">BaseID</th><th width="124">Iconic modifier</th><th width="355">Tweaks</th><th>Value</th></tr></thead><tbody><tr><td>Stinger<br><a href="https://cyberpunk.fandom.com/wiki/Stinger">mq001_scorpions_knife</a></td><td><em>Attacks against poisoned enemies have a 100% chance to cause bleeding. Attacks against bleeding enemies have a 100% chance to cause poisoning.</em></td><td></td><td></td></tr><tr><td>Headhunter<br><a href="https://cyberpunk.fandom.com/wiki/Headhunter">Preset_Punk_Knife_Iconic</a></td><td><em>Marks enemy on hit. Attacking the enemy's head with any weapon deals 200% damage, returns the Headhunter and clears the mark.</em></td><td></td><td></td></tr><tr><td>Blue Fang<br><a href="https://cyberpunk.fandom.com/wiki/Blue_Fang">Preset_Neurotoxin_Knife_Iconic</a></td><td><em>Stuns the enemy on hit. Headshots stuns after 1 sec while other hits stun after 3 sec. Enemies outside combat state get stunned immediately.</em></td><td></td><td></td></tr><tr><td>Butcher's Cleaver<br><a href="https://cyberpunk.fandom.com/wiki/Butcher&#x27;s_Cleaver">Preset_Butchers_Knife_Iconic</a></td><td><em>Definition of "bloodthirsty." When your enemy is bleeding, the cleaver attacks faster and uses less stamina.</em></td><td></td><td></td></tr><tr><td>Nehan<br><a href="https://cyberpunk.fandom.com/wiki/Nehan">Preset_Tanto_Saburo</a></td><td><em>Thrown hits apply Bleeding. If the enemy is already affected by Bleeding from Satori, Nehan will cause hemorrhaging instead. Hemorrhaging drains enemy Health and regenerates yours.</em></td><td></td><td></td></tr><tr><td>Fang<br><a href="https://cyberpunk.fandom.com/wiki/Fang">Preset_Knife_Kurtz_1</a></td><td><em>Thrown hits cripples the target, enemy when thrown, preventing their escape. Continuing attacks in close combat increases damage</em></td><td></td><td></td></tr></tbody></table>

### Blunt

<table><thead><tr><th width="135">BaseID</th><th width="132">Iconic modifier</th><th width="352">Tweaks</th><th>Value</th></tr></thead><tbody><tr><td>Preset_Baseball_Bat_Denny</td><td></td><td></td><td></td></tr><tr><td>sq021_peter_pan_baton</td><td></td><td></td><td></td></tr><tr><td>Preset_Cane_Fingers</td><td></td><td></td><td></td></tr><tr><td>Preset_Dildo_Stout</td><td></td><td></td><td></td></tr><tr><td>Preset_Baton_Murphy</td><td></td><td></td><td></td></tr><tr><td>w_melee_boss_hammer</td><td></td><td></td><td></td></tr><tr><td>Preset_Crowbar_Bunker</td><td></td><td></td><td></td></tr><tr><td>Preset_VB_Axe</td><td></td><td></td><td></td></tr><tr><td>Preset_Shovel_Caretaker</td><td></td><td></td><td></td></tr></tbody></table>







