# Vehicle Destruction

So, you've just spent a few weeks of your life pouring countless hours into a beautiful vehicle mod. Why not destroy it?

This tutorial will explain how destruction of lights, windows, and detachment of body parts works. This will let you add destruction of regular body parts to vanilla cars that don't have it, like the Caliburn, or make custom parts destructible.

## Theory

This entire tutorial will use the Caliburn as an example, but the steps should be adaptable to any other vanilla vehicle.

### TweakDB

<figure><img src="../../.gitbook/assets/Screenshot 2025-07-26 150242.png" alt=""><figcaption></figcaption></figure>

#### gridCell

The settings for the destruction or detachment of parts are governed by the TweakDB. The `gridCells` tell the game the rough placement of your `component` so that when that area of the car receives damage, the `component` will be affected. I don't really know how `gridCells` work exactly and how they're placed, but I understand them enough to make use of them. By looking through the TweakDB entries under the `destruction` dropdown, we'll find out which part of the car each `gridCell` relates to.

<figure><img src="../../.gitbook/assets/Screenshot 2025-07-26 111536.png" alt=""><figcaption></figcaption></figure>

For example, the above screenshot shows the `gridCells` for the `brake_light_left_01`. This tells us that `gridCell 0` is at the left rear corner of the car. `brake_light_right_01` uses `gridCell 1`, which, presumably, is the right rear corner of the car.

<figure><img src="../../.gitbook/assets/Screenshot 2025-07-26 111907.png" alt=""><figcaption></figcaption></figure>

A `component` can also be influenced by two `gridCells`. Here, the `license_plate` is influenced by `gridCell 0` and `gridCell 1`. Since the license plate is placed at the rear centre of the car, we can assume that two `gridCells` means the game extrapolates the middle distance between them to affect `components` placed there. This also lets us figure out where the other `gridCells` are placed.

<figure><img src="../../.gitbook/assets/Screenshot 2025-07-26 112415.png" alt=""><figcaption></figcaption></figure>

The front bumper uses `gridCell 6` and `gridCell 7`. The bumper is placed in the front centre of the car, so this probably means that those `gridCells` are placed at its left and right front corners. By going through the other components, the full picture becomes a bit more clear. The front left mirror uses `gridCell 4`, while the front right mirror uses `gridCell 5`. The left door uses `gridCell 2` and `gridCell 4`, while the right door uses `gridCell 3` and `gridCell 5`. This means the layout of `gridCells` probably looks something like this:

```
6 ┌──front──┐ 7
4 │         │ 5
2 │         │ 3
0 └──rear───┘ 1
```

#### component

`components` are identified by their `name` in the `.app` file. For `glass` and `lights`, only one `component` can be destroyed per TweakDB entry. `detachableParts` however can detach multiple parts, as is the case for the front bumper for example. There, both the bumper mesh itself and its shadow mesh are detached.

#### threshhold

`components` will be destroyed or detached after a certain `threshhold` of damage is reached. This `treshhold` is stored in Bits. `0.1` will not work, but `0.0999984741` will.

{% hint style="info" %}
An easy, but kinda hack-y method to quickly get those Bits is by using a `localTransform` array inside of your `.app` file. Just type `0.1` into the `X` field under `Position`, click into the next text field and `0.1` will be changed to `0.0999984741`.
{% endhint %}

#### effect

The effect used for the destruction of windows (glass shards falling down) is referenced in the TweakDB, but set up in the root `.ent`. These work the same way as the effects for the exhaust or the smoke effects when the vehicle is damaged. If your vehicle doesn't already have glass breaking effects—as is the case for the Caliburn—you can copy-paste them from another vehicle that does, for example the Porsche. More on that later.

### .app File

Since `detachableParts` will fly off when detached, they need to be controlled by the physics of the game. So, for a `detachablePart` to detach correctly, it needs to be an `entPhysicalMeshComponent` within the `.app` file of your vehicle. When flying off, the mesh will rotate around its origin. Therefore, the pivot point of your `.mesh` file should be placed at world origin (position `x: 0, y: 0, z: 0` in Blender). It'll then be moved to its proper position on the vehicle via the `localTransform` array in the `.app` file. This is basically the same as placing the bumpers or doors on a car, but instead of the `.rig` file, the values are transferred from Blender into the `.app` file. Windows also need to be `entPhysicalMeshComponents` to receive damage and break properly. These just disappear when broken and don't need to be placed using the `localTransform` array.

### .mesh File

As mentioned above, `detachableParts` and breakable windows need physics. These physics are influenced by the `collisionShapes` under the `parameters` dropdown inside of each `.mesh` file. For body parts, this affects the acceleration and speed at which the part flies off, depending on how much mass it has, and its rough shape. For windows, the `collisionShape` effectively means the hitbox, e.g. the area you need to hit when shooting the window with a gun for it to break. You can copy-paste the entire `meshMeshParamPhysics` entry from similar vanilla `.mesh` files into the ones of your vehicle. The `collisionShapes` for body parts should roughly match, but windows should be pretty accurate.

{% hint style="info" %}
To find `.mesh` files that might match, open the Asset Browser in WolvenKit and search for "v\_". Set the "Kind" filter to "mesh" and the "File Name" filter to whatever body part you're looking for, e.g. "window".
{% endhint %}

## Practice

### Windows

#### .mesh File

* Find a donor `.mesh` file for the hitbox of the windows of your vehicle as outlined above. The shape and position should match as closely as possible.
* Right click on it and choose "Open without adding to project"
* Open the `parameters` dropdown. You should see a `physicsData` entry of the type `meshMeshParamPhysics`. Right click it and select "Copy from Array/Buffer".
* Open the `parameters` dropdown inside the `.mesh` file of your car's window and delete any entries that might already be there.
* Right click the `parameters` dropdown and select "Paste Into Array/Buffer".

#### .app File

* Start by deleting window `components` of your car that aren't `entPhysicalMeshComponents`. We'll need to replace those.
* Open an `.app` file of a vanilla vehicle, and copy-paste all the `entPhysicalMeshComponents` for windows that are required for your car. Duplicate them, if necessary.
* change the `mesh DepotPath` and `meshAppearance` to match your `.mesh` file, and, if necessary edit the `ParentTransform`, reset the `ChunkMask`, and generate a new `CRUID`. The `name` can be arbitrary, we'll reference it in the `.yaml` file later.

#### .ent File

* Open the root `.ent` file of a vanilla car with breakable windows. We'll use the Porsche in this example.
* Navigate to `components > entSlotComponent FX_slots > slots`.
* Select all of the effects you need, right click them and select "Copy from Array/Buffer"
* Open the root `.ent` file of your vehicle and also navigate to `components > entSlotComponent FX_slots > slots`. The name of the `entSlotComponent` might be different. The `entSlotComponent` for the effects might also be in the `.app` file, as is the case for the Type 66 Avenger, for example.
* Right click the `slots` array and select "Paste Into Array/Buffer".
* Go back to the root `.ent` file of your donor car (the Porsche) and navigate to `components > entEffectSpawnerComponent cars_sports_fx > effectDescs`.
* select the `entEffectDescs` that match the `entSlotComponents` we've copied earlier. Copy-paste them into the `entEffectSpawnerComponent` inside the root `.ent` file of your vehicle similarly as we've done before.

#### .yaml File

Add a new TweakDB entry for destruction of a window in the `.yaml` file of your vehicle. You can copy-paste this one and adapt it to your vehicle:

```yaml
Vehicle.yv_lamborghini_murcielago_dest_window_left_secondary:
  $base: Vehicle.VehicleDestructionParamsCaliburn_inline14
  broken: None
  component: window_fl_b
  effect: damage_glass_fl_a
  isWindshield: False
  threshold: 0.100000001
  gridCells:
    - 2
    - 4
```

* The name of the TweakDB entry can be arbitrary and is set as `Vehicle.yv_lamborghini_murcielago_dest_window_left_secondary` here. We'll reference it later.
* The `$base` has been taken from the Caliburn as seen in the screenshots above.
* I'm not sure what `broken` does. It might load an alternative appearance or `component` but I haven't looked into it. If you know more about it, please add the info here!
* `component` is the name of the `entPhysicalMeshComponent` of your window in the `.app` file
* `effect` is the name of the `entEffectDesc` for the `entEffectSpawnerComponent` entry in the root `.ent` file.
* I'm not too sure about `isWindshield` either, but I believe it causes the window to crack before it shatters (as seen on V's car during the Scav chase after The Rescue)
* `threshhold` and `gridCells` were explained above. The `threshhold` should be very low because it's glass. The `gridCells` here are the centre of the left side of the car.

Add the new TweakDB entry to your vehicle:

```yaml
Vehicle.yv_lamborghini_murcielago_black_glossy:
  $base: Vehicle.v_sport1_rayfield_caliburn_player
  displayName: yv_lamborghini_murcielago_black_glossy_local
  appearanceName: yv_lamborghini_murcielago_black_glossy
  destroyedAppearance: yv_lamborghini_murcielago_burnt
  destruction: 
    $base: Vehicle.VehicleDestructionParamsCaliburn
    glass:
      - !append Vehicle.yv_lamborghini_murcielago_dest_window_left_secondary
…
```

Your window should now break semi-correctly, depending on how accurate its hitbox is.

### Body Parts

#### .mesh File

* This works pretty much the same as it did for the windows as outlined above.
* As mentioned before, the shape of the donor `.mesh` file doesn't need to match as closely for body parts as for windows. The closer the better though, especially size and position.
* Inside the `parameters` array, you might also find `meshMeshParamDeformableShapesData`. As the name suggests, these `parameters` hold information about the deformation of the `.mesh` file when damaged. You probably don't need them, so feel free to delete them.
* Select the pivot point of your Object when correctly positioned on the vehicle in Blender and copy-paste its X, Y, and Z values into the `positions` array under the `localTransform` array inside the `.app` file of your vehicle.
* Move the pivot point of the Object to world origin, export it to `.glb` and import it into your `.mesh` file

{% hint style="info" %}
If you know more about `meshMeshParamDeformableShapesData`, please add the info to the Wiki.
{% endhint %}

#### .app File

* Works very similar to windows, except for the `localTransform` array, as outlined in the previous steps.

#### .yaml file

Start by adding a new TweakDB entry to the `.yaml` file of your vehicle. You can copy-paste the following and adapt it to your car:

```yaml
Vehicle.yv_lamborghini_murcielago_dest_spoiler:
  $base: Vehicle.VehicleDestructionParamsCaliburn_inline19
  name: Spoiler
  threshold: 0.5
  components:
    - spoiler
    - spoiler_shadow
  gridCells:
    - 0
    - 1
```

* The name of the TweakDB entry can be arbitrary and is set as `Vehicle.yv_lamborghini_murcielago_dest_spoiler` here. We'll reference it later.
* The `$base` has been taken from the Caliburn as seen in the screenshots above.
* I'm unsure about the `name` , I think it's just the name of the rule inside of the TweakDB? The other entries for the Caliburn are capitalised, too so I did the same here.
* `threshhold` has been explained above.
* `components:` lists all the `entPhysicalMeshComponents` inside of your `.app` file that should detach for this entry.
* `gridCells` were explained above. The `gridCells` chosen here are the rear centre of the car.

Add the new TweakDB entry to your vehicle:

```yaml
Vehicle.yv_lamborghini_murcielago_black_glossy:
  $base: Vehicle.v_sport1_rayfield_caliburn_player
  displayName: yv_lamborghini_murcielago_black_glossy_local
  appearanceName: yv_lamborghini_murcielago_black_glossy
  destroyedAppearance: yv_lamborghini_murcielago_burnt
  destruction: 
    $base: Vehicle.VehicleDestructionParamsCaliburn
    detachableParts:
      - !append Vehicle.yv_lamborghini_murcielago_dest_spoiler
…
```

Your body part should now detach when hitting the rear centre of the vehicle.

### Lights

#### .app File

Exterior lights on vanilla vehicles usually already have destruction enabled for the `vehicleLightComponents` themselves. If you need more light components and you duplicate a pre-existing one, it'll lose it's "connection" to it's TweakDB entry once renamed and won't break anymore. This is most likely the reason why custom light components on your vehicle don't break. Adding a new TweakDB entry will be explained in the next step. However, should you duplicate for example an interior light, which is not destructible by default, you also need to make sure `isDestructible` is set to `True` and `destructionEffect` is defined for the `vehicleLightComponent` in your `.app` file.

{% hint style="info" %}
For easy copy-pasting, here's a `destructionEffect`: `base\fx\vehicles\_damage\car_lamps\car_lamp_destroy_fx.effect`
{% endhint %}

#### .yaml File

Start by adding a new TweakDB entry to the `.yaml` file of your vehicle. You can copy-paste the following and adapt it to your car:

```yaml
Vehicle.yv_lamborghini_murcielago_dest_taillight_left:
  $base: Vehicle.VehicleDestructionParamsCaliburn_inline8
  component: position_light_left_03
  threshold: 0.100000001
  gridCells:
    - 0
```

* The name of the TweakDB entry can be arbitrary and is set as `Vehicle.yv_lamborghini_murcielago_dest_taillight_left` here.
* The `$base` has been taken from the Caliburn.
* `component` is the name of the `vehicleLightComponent` of your light in the `.app` file
* `threshhold` and `gridCells` were explained above. The `threshhold` should be very low here as well. The `gridCells` used for this light is the left rear corner of the vehicle.

Add the new TweakDB entry to your vehicle:

```yaml
Vehicle.yv_lamborghini_murcielago_black_glossy:
  $base: Vehicle.v_sport1_rayfield_caliburn_player
  displayName: yv_lamborghini_murcielago_black_glossy_local
  appearanceName: yv_lamborghini_murcielago_black_glossy
  destroyedAppearance: yv_lamborghini_murcielago_burnt
  destruction: 
    $base: Vehicle.VehicleDestructionParamsCaliburn
    lights:
      - !append Vehicle.yv_lamborghini_murcielago_dest_taillight_left
…
```

Your light now breaks when hitting the left rear corner of the vehicle.

### Final .yaml

And, for completeness sake, this is how the `.yaml` looks with all the TweakDB entries:

```yaml
Vehicle.yv_lamborghini_murcielago_dest_window_left_secondary:
  $base: Vehicle.VehicleDestructionParamsCaliburn_inline14
  broken: None
  component: window_fl_b
  effect: damage_glass_fl_a
  isWindshield: False
  threshold: 0.100000001
  gridCells:
    - 2
    - 4

Vehicle.yv_lamborghini_murcielago_dest_spoiler:
  $base: Vehicle.VehicleDestructionParamsCaliburn_inline19
  name: Spoiler
  threshold: 0.5
  components:
    - spoiler
    - spoiler_shadow
  gridCells:
    - 0
    - 1

Vehicle.yv_lamborghini_murcielago_dest_taillight_left:
  $base: Vehicle.VehicleDestructionParamsCaliburn_inline8
  component: position_light_left_03
  threshold: 0.100000001
  gridCells:
    - 0

Vehicle.yv_lamborghini_murcielago_black_glossy:
  $base: Vehicle.v_sport1_rayfield_caliburn_player
  displayName: yv_lamborghini_murcielago_black_glossy_local
  appearanceName: yv_lamborghini_murcielago_black_glossy
  destroyedAppearance: yv_lamborghini_murcielago_burnt
  destruction: 
    $base: Vehicle.VehicleDestructionParamsCaliburn
    glass:
      - !append Vehicle.yv_lamborghini_murcielago_dest_window_left_secondary
    detachableParts:
      - !append Vehicle.yv_lamborghini_murcielago_dest_spoiler
    lights:
      - !append Vehicle.yv_lamborghini_murcielago_dest_taillight_left
…
```
