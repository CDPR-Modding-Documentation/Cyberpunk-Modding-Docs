---
description: A list of weapon damage effects, and how to apply them
---

# Cheat Sheet: Weapon damage effects

Apply the effects to an item like this:

```yaml
  statModifierGroups: 
    - !append-once Items.Base_Melee_Status_Effect_Application_Stats
    - !append-once Items.Base_Melee_Weapon_Damage_Type_Electric
    - !append-once Items.Base_Melee_Weapon_Damage_Type_Electric_Min_Max
    - !append-once Items.Base_Melee_Weapon_Damage_Type_Thermal
    - !append-once Items.Base_Melee_Weapon_Damage_Type_Thermal_Min_Max
```

## Weapon damage types

|                                                       |                                                      |
| ----------------------------------------------------- | ---------------------------------------------------- |
| Base\_Melee\_Status\_Effect\_Application\_Stats       | enables the application of status effects to enemies |
| Base\_Melee\_Weapon\_Damage\_Type\_Chemical           | Chemical damage                                      |
| Base\_Melee\_Weapon\_Damage\_Type\_Chemical\_Min\_Max | ???                                                  |
| Base\_Melee\_Weapon\_Damage\_Type\_Electric           | Electric damage                                      |
| Base\_Melee\_Weapon\_Damage\_Type\_Electric\_Min\_Max | ???                                                  |
| Base\_Melee\_Weapon\_Damage\_Type\_Physical           | Physical damage                                      |
| Base\_Melee\_Weapon\_Damage\_Type\_Physical\_Min\_Max | ???                                                  |
| Base\_Melee\_Weapon\_Damage\_Type\_Thermal            | Fire damage                                          |
| Base\_Melee\_Weapon\_Damage\_Type\_Thermal\_Min\_Max  | ???                                                  |

## Testing

To test the applied effects, you can use [AngeVil's script](https://app.gitbook.com/s/-McniwB8YOK2HnJ7SYg\_/references-and-examples/weapons#weapon-damage-debugging). Simply copy the code into a new file inside of [Cyberpunk 2077](../../../../for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory.md)`/r6/scripts/`, e.g. `debug_damage_types.reds`. After starting up the game and hitting people with your weapon, you can see the log output via CET.
