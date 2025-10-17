# Changing Handling & Speed For Modded Vehicles

This guide is mainly intended for mod users who would like to learn how to change driving behaviour, but also adds info to the [Basic Car Modding Guide](https://wiki.redmodding.org/cyberpunk-2077).

Driving behaviour of each modded vehicle is defined in the `.yaml` file included with each car mod.

This `.yaml` file will be somewhere in `r6\tweaks\`. Some modders put their `.yaml` files in subfolders with their name or the name of the car whithin the `tweaks` folder. The `.yaml` file must be somewhere inside `r6\tweaks` though.

Some modders also use `.tweak` files to define the driving behaviour of their cars. This tutorial won't cover these, but the settings within those files use the same names and values as `.yaml` files. The files are formatted differently and the information presented here must be adapted to the specific format of `.tweak` files.

### Changing Speed

#### Manually

The engine setup is made up of different sets of values for each gear of the car. These sets of values are usually taken from one of the vanilla cars and then modified. The sets of values are added to the car within the `vehEngineData` section of the `.yaml`, which we'll now look at:

* Open the `.yaml` file of a modded car using a text editor like Notepad
* Search for `vehEngineData`
* This section might look like this:

```yaml
  vehEngineData:
    $base: Vehicle.VehicleEngineData_4_SuperSport
    gears:
      - !remove Vehicle.VehicleEngineData_4_SuperSport_inline0
      - !remove Vehicle.VehicleEngineData_4_SuperSport_inline1
      - !remove Vehicle.VehicleEngineData_4_SuperSport_inline2
      - !remove Vehicle.VehicleEngineData_4_SuperSport_inline3
      - !remove Vehicle.VehicleEngineData_4_SuperSport_inline4
      - !remove Vehicle.VehicleEngineData_4_SuperSport_inline5
      - !remove Vehicle.VehicleEngineData_4_SuperSport_inline6
      - !remove Vehicle.VehicleEngineData_4_SuperSport_inline7
      - !append yv_r8_gear_reverse
      - !append yv_r8_gear_1
      - !append yv_r8_gear_2
      - !append yv_r8_gear_3
      - !append yv_r8_gear_4
      - !append yv_r8_gear_5
      - !append yv_r8_gear_6
      - !append yv_r8_gear_7
```

* This car uses `Vehicle.VehicleEngineData_4_SuperSport` as the `$base` for its engine setup. This is the Rayfield Caliburn
* `Vehicle.VehicleEngineData_4_SuperSport` contains eight gears, `inline0` through `inline7`
* `inline0` is the reverse gear, `inline7` the seventh gear
* The vanilla gears are removed from the modded car in the lines start with `- !remove`
* Custom gears are added to the modded car in the lines that start with `- !append`
* The custom gears are defined further up in the `.yaml`
* Use the search function of your text editor to search for the name of each gear, for example `yv_r8_gear_7`
* It might look like this:

```yaml
yv_r8_gear_7:
  $base: Vehicle.VehicleEngineData_4_SuperSport_inline7
  maxEngineRPM: 9000
  maxSpeed: 45.75
  minEngineRPM: 4100
  minSpeed: 40.2000008
  torqueMultiplier: 0.205
```

* `yv_r8_gear_7:` is the "title" of the TweakDB entry for this gear
* It uses `Vehicle.VehicleEngineData_4_SuperSport_inline7` as its base, this is the seventh gear of the Rayfield Caliburn
* The most important values are `minSpeed`, `maxSpeed`, and `torqueMultiplier`
* `minSpeed` defines the minimum speed of each gear
* `maxSpeed` defines the maximum speed of each gear
* `torqueMultiplier` defines how quickly the car goes from `minSpeed` to `maxSpeed`
* Raising all three values across all gears makes the car go faster

{% hint style="info" %}
My explanations of each value might not be technically correct. I've arrived at this explanation by changing the values and seeing what happens in-game. Finding a gear setup that feels smooth across all gears requires a lot of trial and error.
{% endhint %}

You can also change these values live in game using [Whip Wizard](https://www.nexusmods.com/cyberpunk2077/mods/22810).

#### Vanilla Gear Setups

If you don't want to make an entire gear setup from scratch, you can also use an unmodified gear setup from one of the vanilla vehicles. Since we now know how the gear setup works, we can remove the custom setup of the modded car:

* Within the `vehEngineData` section of the `.yaml`, remove everything but the line that starts with `$base:`
* Feel free to stop here if you like the engine setup of the vanilla car that the modded one is based on
* If not, find the name of the TweakDB entry for a vanilla car
* [Download & install WolvenKit](https://wiki.redmodding.org/wolvenkit/getting-started/download)
* After starting the program, click on "Continue to editor" in the bottom left corner
* Open its Tweak Browser from the right sidebar and wait for it to load
* In the search field at the top, enter a keyword of the name of the car
* The names of the car within the TweakDB might not line up entirely with what's displayed in-game
* If all else fails, search for the car brand such as "Quadra"
* In the list on the left, scroll down until you see entries that start with `Vehicle.v_`
* In this example, we'll use the Porsche 911 Turbo
* In the list on the right, scroll down until you see `vehEngineData`
* Right click the `vehEngineData` entry and navigate to "TweakXL > Copy to Clipboard"
* Hold down Shift on your keyboard and "Copy to Clipboard" changes to "Copy Name to Clipboard"
* Click on "Copy Name to Clipboard"
* Now, back in the text editor, replace the name of the gear setup of the original car with the one you've copied.

For example:

```yaml
vehEngineData:
    $base: Vehicle.VehicleEngineData_4_SuperSport
```

Would be changed to:

```yaml
vehEngineData:
    $base: Vehicle.v_sport2_porsche_911turbo_inline0
```

<div data-full-width="true"><figure><img src="../../.gitbook/assets/Screenshot 2025-10-17 160639.png" alt=""><figcaption><p>Finding &#x26; copying the name of the engine setup for the Porsche 911 Turbo</p></figcaption></figure></div>

Here are some of the names for the gear setups of vanilla cars:

| Car name                      | Engine setup                                            |
| ----------------------------- | ------------------------------------------------------- |
| Archer Quartz "Bandit"        | `Vehicle.v_standard2_archer_quartz_nomad_inline11`      |
| Archer Quartz EC-T2 R660      | `Vehicle.v_standard2_archer_quartz_gt_inline12`         |
| Hozuki MH2                    | `Vehicle.v_standard2_mizutani_hozuki_sport_inline1`     |
| Mahir Supron FS3-T            | `Vehicle.v_standard25_mahir_supron_sport_inline9`       |
| Mizutani Hozuki "Hoseki"      | `Vehicle.v_standard2_mizutani_hozuki_sti_inline9`       |
| Mizutani Shion "Samum"        | `Vehicle.Shion_MZ1_Nomad_Engine`                        |
| Mizutani Shion MZ1            | `Vehicle.v_sport2_mizutani_shion_inline0`               |
| Quadra Turbo-R V-Tech         | `Vehicle.v_sport1_quadra_turbo_r_inline9`               |
| Quadra Type-66 640 TS         | `Vehicle.v_sport2_quadra_type66_inline5`                |
| Shion Bonewrecker             | `Vehicle.Shion_MZ1_Nomad_Engine`                        |
| Thorton Colby "Little Mule"   | `Vehicle.v_standard25_thorton_colby_nomad_inline5`      |
| Thorton Colby "Vulture"       | `Vehicle.v_standard25_thorton_colby_nomad_inline5`      |
| Thorton Colby CST40           | `Vehicle.v_standard2_thorton_colby_gt_inline4`          |
| Thorton Galena "Locust"       | `Vehicle.v_standard2_thorton_galena_nomad_inline5`      |
| Thorton Galena "Rattler"      | `Vehicle.VehicleEngineDataBobas`                        |
| Thorton Galena Gecko          | `Vehicle.v_standard2_thorton_galena_nomad_inline5`      |
| Villefort Deleon "Vindicator" | `Vehicle.v_sport2_villefort_deleon_vindicator_inline10` |

While the engine setups above are car specific, the game also features some generic engine setups:

```
Vehicle.VehicleEngineData_2_Default
Vehicle.VehicleEngineData_4_Base_Transaxle
Vehicle.VehicleEngineData_4_Default
Vehicle.VehicleEngineData_4_Muscle
Vehicle.VehicleEngineData_4_Regular_Base
Vehicle.VehicleEngineData_4_Regular_Large
Vehicle.VehicleEngineData_4_Regular_Large_SC
Vehicle.VehicleEngineData_4_Regular_Medium
Vehicle.VehicleEngineData_4_Regular_Small
Vehicle.VehicleEngineData_4_Regular_Small_Peaky
Vehicle.VehicleEngineData_4_Regular_Van
Vehicle.VehicleEngineData_4_Sport
Vehicle.VehicleEngineData_4_SportPlus
Vehicle.VehicleEngineData_4_Sport_SC
Vehicle.VehicleEngineData_4_Sport_Transaxle
Vehicle.VehicleEngineData_4_Sport_Transaxle_Turbo
Vehicle.VehicleEngineData_4_SuperSport
Vehicle.VehicleEngineData_4_Truck
Vehicle.VehicleEngineData_4_Truck_Nomad
Vehicle.VehicleEngineData_4_Utility
Vehicle.VehicleEngineData_4_Utility_Big
```

#### Changing handling

Similarly to the engine setup, handling also works by adding handling data from vanilla cars onto modded ones and then overriding that data. Handling is defined in the `vehDriveModelData` section of each `.yaml` file. Such a section might look like this:

```yaml
  vehDriveModelData:
   $base: Vehicle.VehicleDriveModelData_TurboR_VTech
   maxWheelTurnDeg: 55
   wheelTurnMaxAddPerSecond: 100
   wheelTurnMaxSubPerSecond: 140
   chassis_mass: 1200
   total_mass: 1200
   center_of_mass_offset: { x: 0.0, y: 0.0, z: -0.135 }
   wheelSetup:
    $base: Vehicle.v_sport1_rayfield_caliburn_inline1
    backPreset:
      $base: Vehicle.v_sport1_rayfield_caliburn_inline3
      frictionMulLateral: 1.28
      frictionMulLongitudinal: 1.28
      wheelsVerticalOffset: 0
    frontPreset:
      $base: Vehicle.v_sport1_rayfield_caliburn_inline2
      frictionMulLateral: 1.28
      frictionMulLongitudinal: 1.28
      wheelsVerticalOffset: 0
```

Here, the handling is copied from the Quadra Tubo-R VTech onto the modded car and then modified with custom values.

* The three lines that start with `$base:` work the same way as the engine setup. You can replace the vanilla cars used there with other vanilla cars by following the method outlined above.
* `maxWheelTurnDeg` is the highest angle that the front wheels can turn while steering
* `wheelTurnMaxAddPerSecond` is the speed at which the front wheels turn while steering
* `wheelTurnMaxSubPerSecondd` is the speed at which the front wheels return to their default rotation after steering
* All three settings:
  * Affect steering sensitivity
  * Decrease for lower sensitivity
  * Increase for higher sensitivity
* `frictionMulLateral` and `frictionMulLongitudinal` affect wheel grip
  * Decrease for more drift-y handling
  * Increase for more grip

{% hint style="info" %}
My explanations of each value might not be technically correct. I've arrived at this explanation by changing the values and seeing what happens in-game. Finding values that handle well requires a lot of trial and error.
{% endhint %}

<div data-full-width="true"><figure><img src="../../.gitbook/assets/Screenshot 2025-10-17 160301.png" alt=""><figcaption><p>Finding &#x26; copying the name of the handling data for the Quadra Turbo-R VTech</p></figcaption></figure></div>

Same as with the engine setup, you can also change these values live in game using [Whip Wizard](https://www.nexusmods.com/cyberpunk2077/mods/22810).
