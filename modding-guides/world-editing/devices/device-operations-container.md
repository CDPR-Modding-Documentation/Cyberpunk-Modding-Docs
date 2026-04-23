---
description: >-
  How to use DeviceOperationsContainer to trigger sound, VFX, animations, and
  component changes from device entity data, without any scripting.
---

# Device Operations Container

Every entity that extends `Device` has a built-in system for reacting to state changes and triggering effects: sound, VFX, animations, component toggles, all without writing a single line of Redscript. It's driven entirely by data you set up in the `.ent` file.

The system is called `DeviceOperationsContainer` and lives on the device's persistent state (PS) chunk. It hooks into `EvaluateBaseStateTriggers`, which is called automatically in `deviceBase.swift` whenever the device's state changes.

{% hint style="info" %}
This page documents a system that is still being actively explored by the modding community. The trigger and operation type tables are based on reading the decompiled game scripts rather than exhaustive in-game testing, so some types may behave differently than described or have undocumented requirements. If you find something that doesn't match, please update the page.
{% endhint %}

### Requirements

#### Tools

| Tool                                                | Notes                    |
| --------------------------------------------------- | ------------------------ |
| [WolvenKit](https://github.com/WolvenKit/WolvenKit) | For editing `.ent` files |

#### Knowledge

* Navigating the WolvenKit entity editor and working with chunks
* Basic understanding of how device entities are structured in CP2077
*   Familiarity with WWise event names if you are using `PlaySoundDeviceOperation`



    <div data-gb-custom-block data-tag="hint" data-style="info" class="hint hint-info"><p>Setting up the container is done entirely in the .ent file before packing — no in-game tools needed for that part. To actually place the device in the world you will need World Builder, or you can edit an existing device entity that is already present in a sector.</p></div>

### How It Works

The container holds two arrays:

* **`triggers[]`**: conditions that fire when something happens (state change, action, quest fact, player entering a volume, etc.)
* **`operations[]`**: named effects to execute when a trigger fires (play a sound, start a VFX, toggle a component, etc.)

When a trigger fires, it references an `operationName` CName. The container looks up a matching operation by name and runs it. The match is exact and case-sensitive; a single space in the name means the trigger fires but nothing happens.

If you want to trace this yourself, `deviceBase.swift` in the [adamsmasher/cyberpunk decompiled scripts](https://codeberg.org/adamsmasher/cyberpunk) (at `cyberpunk/devices/core/`) is where the `EvaluateBaseStateTriggers` call lives. The operation classes are in the `deviceOperations/` subdirectory alongside it.

{% hint style="warning" %}
`deviceOperationsSetup` must be placed on the **PS chunk** (e.g. `FanControllerPS`), not the root entity chunk. If you put it on the root, it will never be evaluated.
{% endhint %}

### &#x20;Trigger Types

| `$type`                          | Fires when...                                                                |
| -------------------------------- | ---------------------------------------------------------------------------- |
| `BaseStateOperationsTrigger`     | Device state changes to an `EDeviceStatus` value (ON/OFF/UNPOWERED/DISABLED) |
| `DeviceActionOperationsTrigger`  | A specific device action class is executed                                   |
| `FactOperationsTrigger`          | A quest fact changes to a specific value                                     |
| `TriggerVolumeOperationsTrigger` | Player or NPC enters or exits a trigger volume                               |
| `SensesOperationsTrigger`        | The entity is sensed (seen or heard)                                         |
| `HitOperationsTrigger`           | The entity takes damage below a health threshold                             |
| `FocusModeOperationsTrigger`     | Player enters or exits scanner mode                                          |
| `DoorStateOperationsTrigger`     | Door state changes (OPEN/CLOSED/LOCKED)                                      |
| `ActivatorOperationsTrigger`     | Entity initializes, fires once on load                                       |
| `CustomActionOperationsTriggers` | A custom-named action ID is triggered                                        |

### Operation Types

| `$type`                                 | What it does                                                        |
| --------------------------------------- | ------------------------------------------------------------------- |
| `PlaySoundDeviceOperation`              | Plays or stops a WWise audio event                                  |
| `PlayEffectDeviceOperation`             | Starts or stops a VFX particle effect                               |
| `PlayTransformAnimationDeviceOperation` | Plays, pauses, or resets a transform animation                      |
| `ToggleComponentsDeviceOperation`       | Enables or disables named components on the entity                  |
| `GenericDeviceOperation`                | Combination operation: VFX, SFX, component toggles, mesh appearance |
| `MeshAppearanceDeviceOperation`         | Switches the mesh appearance                                        |
| `FactsDeviceOperation`                  | Sets or modifies a quest fact value                                 |
| `StimDeviceOperation`                   | Broadcasts a distraction stimulus                                   |
| `ApplyStatusEffectDeviceOperation`      | Applies a status effect to nearby entities                          |
| `ApplyDamageDeviceOperation`            | Deals damage to nearby entities                                     |
| `SetMessageDeviceOperation`             | Sends a message to another device                                   |

For effect operations, `EEffectOperationType` values are `START`, `STOP`, and `BRAKE_LOOP` (lets a looping effect finish its current cycle before stopping).

### Example: Adding Sound to a Fan

The vanilla `Fan` class has no audio. `TurnOnDevice()` and `TurnOffDevice()` don't play anything. Here's how to fix that with `DeviceOperationsContainer`.

1. Open the `.ent` file in WolvenKit and find the `FanControllerPS` chunk. Locate `deviceOperationsSetup`; it will be `null`.

<figure><img src="../../../.gitbook/assets/device operations - null.png" alt="The FanControllerPS chunk in WolvenKit&#x27;s entity editor, with deviceOperationsSetup shown as null"><figcaption><p>The PS chunk is where the container lives. The root entity chunk will not work.</p></figcaption></figure>

2. Create a `DeviceOperationsContainer` with empty `operations[]` and `triggers[]` arrays.

<figure><img src="../../../.gitbook/assets/device operations - new.png" alt="A newly created DeviceOperationsContainer with both arrays collapsed and empty"><figcaption><p>Both arrays start empty. Operations go in first, then triggers that reference them by name.</p></figcaption></figure>

3. Add two operations:
   * `fan_sound_start`: `PlaySoundDeviceOperation` with `START` and your WWise event name
   * `fan_sound_stop`: `PlaySoundDeviceOperation` with `STOP` and the same event

<figure><img src="../../../.gitbook/assets/device operations - operations.png" alt="A filled-out PlaySoundDeviceOperation showing the operationName field, SFXs array, and EEffectOperationType set to START"><figcaption><p>The <code>operationName</code> field is what triggers reference. The SFXs array holds the WWise event name.</p></figcaption></figure>

4. Add two triggers:
   * `BaseStateOperationsTrigger` for state `ON`, referencing `fan_sound_start`
   * `BaseStateOperationsTrigger` for state `OFF`, referencing `fan_sound_stop`

<figure><img src="../../../.gitbook/assets/device operations - triggers.png" alt="A filled-out BaseStateOperationsTrigger showing the status field set to ON and the operationName matching the operation above"><figcaption><p>The <code>operationName</code> here must match the operation name exactly, including capitalisation.</p></figcaption></figure>

5. Make sure the entity has a `gameaudioSoundComponent`. It doesn't need an `audioName` set; it just needs to exist for `PlaySoundDeviceOperation` to have something to route through.

<figure><img src="../../../.gitbook/assets/device operations - gameaudiosound component.png" alt="The entity&#x27;s components list in WolvenKit showing a gameaudioSoundComponent entry"><figcaption><p>No audioName needed on the component itself. Its presence is enough.</p></figcaption></figure>

{% hint style="warning" %}
`operationName` is a CName. Any whitespace, including a trailing space, will cause silent failure. The trigger fires, no operation runs, and there's no error message.
{% endhint %}

### Common Mistakes

| Mistake                                      | What you'll see                | Fix                                              |
| -------------------------------------------- | ------------------------------ | ------------------------------------------------ |
| Space in `operationName`                     | Trigger fires, nothing happens | Check the name character by character            |
| Missing `gameaudioSoundComponent`            | No sound                       | Add the component to the entity                  |
| HandleID collision                           | WolvenKit import error         | Make sure all HandleIds in the buffer are unique |
| Container on entity root instead of PS chunk | Effects never fire             | Move `deviceOperationsSetup` to the PS chunk     |

### What You Can Do With This

Since any entity extending `Device` has access to this system, it opens up a lot of options without any scripting:

* **Ambient sound on any device**: computers, TVs, industrial machines
* **VFX tied to state**: sparks on power-on, smoke when disabled
* **Component visibility based on state**: show or hide mesh parts depending on whether the device is active
* **State-driven animations**: start and stop transform animations without Redscript
* **Chain reactions via quest facts**: `FactsDeviceOperation` sets a fact, which triggers `FactOperationsTrigger` on another device
* **Distraction stimuli**: `StimDeviceOperation` broadcasts when a device activates, useful for AI reactions
