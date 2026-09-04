---
description: gameTransformAnimatorComponent and gameRootTransformAnimatorComponent
---

# Transform Animator

## Summary

**Published**: Sep 09 2026 by [Akiway](https://github.com/Akiway)\
**Last documented edit:** Sep 09 2026 by [Akiway](https://github.com/Akiway)

This page explains how `gameTransformAnimatorComponent` works: what the component holds, how a clip is built out of tracks, what actually makes something move, and which classes ask it to play.

A transform animator is the engine's **data-driven** animation path. Instead of a baked `.anims` clip authored in a DCC and played through the animgraph, the motion is described by plain structs on the component: a distance, an angle, a duration, an easing curve. That makes it the only kind of animation in the game you can meaningfully retune without touching an art asset, every number is a field.

Doors, shutters, gates, road blocks, fans, movable props, computers, security gates, loot containers and metro cars all use it.

### Wait, that's not what I want!

* To play one from a device's state, action or a quest fact, see [Device Operations Container](../../../../modding-guides/world-editing/devices/device-operations-container.md)
* For the effect components a transform animation can spawn, see [Effect components](effect-components.md)

## Transform Animator components

### gameTransformAnimatorComponent

Extends `entIPlacedComponent`. This is the one you will meet on almost every device. Like any placed component it has its own `localTransform` and its own `parentTransform`, and it declares exactly one property of its own:

| Property     | Type                                     | Description                                 |
| ------------ | ---------------------------------------- | ------------------------------------------- |
| `animations` | `array:gameTransformAnimationDefinition` | Every clip this component knows how to play |

That is the whole component. Everything else on this page is the shape of that array.

### gameRootTransformAnimatorComponent

Extends `entIMoverComponent` and declares the identical `animations` array. The difference is the base class: a mover component has no `localTransform` and no `parentTransform` of its own, so nothing binds _to_ it the way things bind to the placed variant; it drives the entity's root instead. Use the placed variant unless you specifically want the whole entity to travel.

{% hint style="info" %}
Both variants are matched by class in tooling, and both are valid targets for the same events and the same device operation. If a guide says "the animator", either one will do.
{% endhint %}

## Anatomy of a clip

The nesting is four levels deep and every level has a job:

```
gameTransformAnimatorComponent
└── animations[]                          array of clips, each with a name
    └── gameTransformAnimationDefinition  the clip: name, loop, time scale
        └── timeline                      gameTransformAnimationTimeline
            └── items[]                   the tracks, all running in parallel
                └── gameTransformAnimationTrackItem
                    ├── startTime         when the track starts, in seconds
                    ├── duration          how long it runs, in seconds
                    └── impl              handle to what the track actually does
```

A **clip** is a named timeline. A **track** is a `startTime`, a `duration`, and one `impl` that does the work: move, rotate, spawn an effect, play a sound. Tracks in one timeline run **in parallel**, not in sequence a stock hinged door pairs a 1 second rotation with a 3 second falling-dust effect that starts at the same moment.

### gameTransformAnimationDefinition

| Property         | Type                             | Description                                                                                   |
| ---------------- | -------------------------------- | --------------------------------------------------------------------------------------------- |
| `name`           | `CName`                          | How the clip is asked for. This is the only handle anything has on it (see #who-plays-a-clip) |
| `timeline`       | `gameTransformAnimationTimeline` | The track list                                                                                |
| `timeScale`      | `Float`                          | Multiplies playback speed for the whole clip. A play event's own `timeScale` applies on top   |
| `timesToPlay`    | `Uint32`                         | Repeat count                                                                                  |
| `looping`        | `Bool`                           | Repeat forever                                                                                |
| `reverse`        | `Bool`                           | Play the timeline backwards                                                                   |
| `autoStart`      | `Bool`                           | Plays on attach, without waiting for anything to ask. Off on every shipped door               |
| `autoStartDelay` | `Float`                          | Seconds to wait before an `autoStart` clip begins                                             |

### gameTransformAnimationTrackItem

| Property    | Type                                         | Description                      |
| ----------- | -------------------------------------------- | -------------------------------- |
| `startTime` | `Float`                                      | Offset into the clip, in seconds |
| `duration`  | `Float`                                      | Length of this track, in seconds |
| `impl`      | `handle:gameTransformAnimationTrackItemImpl` | What the track does              |

{% hint style="warning" %}
`gameTransformAnimationTrackItemImpl` is **abstract**, and so are `gameTransformAnimation_Movement`, `gameTransformAnimation_Position` and `gameTransformAnimation_Rotation`. Creating a track always means picking a concrete class explicitly, and a handle left null is a null pointer the engine will walk.
{% endhint %}

## Track types

These are the concrete `impl` classes. The first four move things; the rest are timeline-anchored side effects.

| `$type`                                  | What it does                                                               |
| ---------------------------------------- | -------------------------------------------------------------------------- |
| `gameTransformAnimation_Move`            | Travels between two evaluated positions. Both stock sliding doors use this |
| `gameTransformAnimation_RotateOnAxis`    | Spins around one local axis. Both stock hinged clips use this              |
| `gameTransformAnimation_RotateFromTo`    | Quaternion to quaternion, for arcs the axis form cannot express            |
| `gameTransformAnimation_MoveOnSpline`    | Follows a placed `worldSplineNode`                                         |
| `gameTransformAnimation_SpawnEffect`     | Starts a named effect                                                      |
| `gameTransformAnimation_KillEffect`      | Stops an effect by tag                                                     |
| `gameTransformAnimation_BreakEffectLoop` | Lets a looping effect finish its cycle, then stops it                      |
| `gameTransformAnimation_PlaySound`       | Fires a WWise event at a point on the timeline                             |

### The motion tracks in detail

**`gameTransformAnimation_Move`**

| Property                  | Type                                     | Description               |
| ------------------------- | ---------------------------------------- | ------------------------- |
| `startPositionEvaluator`  | `handle:gameTransformAnimation_Position` | Where the motion begins   |
| `targetPositionEvaluator` | `handle:gameTransformAnimation_Position` | Where it ends             |
| `movement`                | `handle:gameTransformAnimation_Movement` | The curve between the two |

**`gameTransformAnimation_RotateOnAxis`**

| Property                | Type                                     | Description                                                                                          |
| ----------------------- | ---------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| `axis`                  | `X` / `Y` / `Z`                          | Local axis to spin around                                                                            |
| `numberOfFullRotations` | `Float`                                  | **Fractions of a turn**, not degrees: `0.25` is 90°, `0.5` is 180°, and the sign picks the direction |
| `startAngle`            | `Float`                                  | Zero on every shipped door; the unit is not established                                              |
| `reverseDirection`      | `Bool`                                   | Flips the direction                                                                                  |
| `movement`              | `handle:gameTransformAnimation_Movement` | The curve                                                                                            |

**`gameTransformAnimation_RotateFromTo`** takes `startRotationEvaluator` and `targetRotationEvaluator` (`handle:gameTransformAnimation_Rotation`) plus a `movement`.

**`gameTransformAnimation_MoveOnSpline`**

| Property       | Type                                     | Description                                       |
| -------------- | ---------------------------------------- | ------------------------------------------------- |
| `splineNode`   | `NodeRef`                                | The `worldSplineNode` to follow                   |
| `from` / `to`  | `Float`                                  | Normalised positions along the spline             |
| `rotationMode` | `Disabled` / `Yaw` / `PitchAndYaw`       | Whether the object turns to face along the spline |
| `movement`     | `handle:gameTransformAnimation_Movement` | The curve                                         |

### The effect and sound tracks

| Class                                    | Properties                                                          |
| ---------------------------------------- | ------------------------------------------------------------------- |
| `gameTransformAnimation_SpawnEffect`     | `effectName` (CName), `effectTag` (CName), `persistOnDetach` (Bool) |
| `gameTransformAnimation_KillEffect`      | `effectTag` (CName)                                                 |
| `gameTransformAnimation_BreakEffectLoop` | `effectTag` (CName)                                                 |
| `gameTransformAnimation_PlaySound`       | `soundName` (CName), `unique` (Bool)                                |

{% hint style="warning" %}
A `PlaySound` track fires its event and nothing ever stops it. Start a looping WWise event here and it runs until the entity is destroyed; there is no matching stop track. Use one-shot events, or drive the loop from a Device Operations Container instead, which has an explicit `STOP`.
{% endhint %}

### Position evaluators

A `_Move` track does not store a start and an end point, it stores two objects that _work out_ the start and the end point when the clip plays. That is what makes one clip reusable on a door wherever it happens to be standing.

| `$type`                                           | Properties                                      | Description                                                                             |
| ------------------------------------------------- | ----------------------------------------------- | --------------------------------------------------------------------------------------- |
| `gameTransformAnimation_Position_InitialPosition` | `offset` (Vector3), `offsetInWorldSpace` (Bool) | Wherever the component was when the clip began, plus an optional offset                 |
| `gameTransformAnimation_Position_LocalPosition`   | `position` (Vector3)                            | A position in the entity's own space. **This is the travel distance on a sliding door** |
| `gameTransformAnimation_Position_MarkerPosition`  | `markerNode` (NodeRef), `offset` (Vector3)      | A position taken from another node in the world                                         |

### Rotation evaluators

| `$type`                                           | Properties                                 |
| ------------------------------------------------- | ------------------------------------------ |
| `gameTransformAnimation_Rotation_InitialRotation` | _none_ (the rotation the clip started at)  |
| `gameTransformAnimation_Rotation_CurrentRotation` | `offset` (Quaternion)                      |
| `gameTransformAnimation_Rotation_LocalRotation`   | `rotation` (Quaternion)                    |
| `gameTransformAnimation_Rotation_MarkerRotation`  | `markerNode` (NodeRef), `offset` (Vector3) |

### Movement (the curve)

| `$type`                                              | Properties                    | Description                             |
| ---------------------------------------------------- | ----------------------------- | --------------------------------------- |
| `gameTransformAnimation_Movement_PredefinedFunction` | `function` (`EasingFunction`) | The normal choice: a named easing curve |
| `gameTransformAnimation_Movement_CurveSet`           | _none_                        | Declares no fields of its own           |
| `gameTransformAnimation_Movement_CustomCurve`        | `curve` (`curveData:Float`)   | Hand-authored curve data                |

`EasingFunction` is a struct of two enums, giving 3 × 11 = 33 usable curves:

* `easingType`: `EET_In`, `EET_Out`, `EET_InOut`; which end of the motion the curve applies to
* `transitionType`: `EET_Linear`, `EET_Sine`, `EET_Cubic`, `EET_Quad`, `EET_Quart`, `EET_Quint`, `EET_Expo`, `EET_Circ`, `EET_Back`, `EET_Bounce`, `EET_Elastic`

`EET_Linear` is linear at both ends regardless of the easing type. `EET_Back` overshoots and comes back; `EET_Elastic` and `EET_Bounce` are the springy ones. Everything else is a smoothing curve of increasing sharpness.

## An animator only moves itself

This is the single most important fact on the page.

**A transform animator drives its own transform and nothing else.** It does not know about meshes. A clip that rotates the animator 90° is completely invisible unless something on the entity is parented to that animator; and that parenting lives in the `.ent`, in the moving component's `parentTransform`:

```
entMeshComponent "Mesh2812"
└── parentTransform → entHardTransformBinding
                      └── bindName = "DoorTransformAnimator"   ← the animator's component name
```

`bindName` (inherited from `entIBinding`) holds the **name of the component to follow**. Anything bound this way inherits the animator's motion. Nothing else does.

{% hint style="danger" %}
CDPR ships a fully populated four-clip `DoorTransformAnimator` on **every** door, including doors where nothing is bound to it. The presence of a clip list tells you nothing about whether the door can move. Before you retune anything, check the meshes' `parentTransform`.
{% endhint %}

Measured on three shipped doors:

| Entity                       | `animationType` | Bound to the animator         |
| ---------------------------- | --------------- | ----------------------------- |
| `tech_hinged_door.ent`       | `TRANSFORM`     | `entMeshComponent "Mesh2812"` |
| `mall_shutter_w150_h250.ent` | `REGULAR`       | `entAnimatedComponent "anim"` |
| `double_door_simple_1.ent`   | `REGULAR`       | nothing                       |

The middle row is the interesting one: a door on the baked path whose animated component _is_ bound to the animator will start playing its transform clips the moment you switch it to `TRANSFORM`. The last row will simply stop animating.

## Who plays a clip

Nothing plays automatically unless `autoStart` is set. A clip is played by name, by one of four events:

| Event                              | Extra properties                                        | Effect                                                    |
| ---------------------------------- | ------------------------------------------------------- | --------------------------------------------------------- |
| `gameTransformAnimationPlayEvent`  | `timeScale`, `looping`, `timesPlayed`, `useEntitySetup` | Plays the clip. A negative `timeScale` plays it backwards |
| `gameTransformAnimationPauseEvent` | _none_                                                  | Freezes it where it is                                    |
| `gameTransformAnimationResetEvent` | (extends the play event)                                | Puts the transform back to the clip's start               |
| `gameTransformAnimationSkipEvent`  | `time`, `skipToEnd`, `forcePlay`                        | Jumps to a point, or straight to the end                  |

All four extend `gameTransformAnimationEvent`, whose only property is `animationName` , the `CName` that must match a clip's `name` exactly.

### Reserved clip names

Each device class hardcodes the names it will ask for. A clip named anything else on those entities is dead weight unless a device operation plays it.

| Class                                               | Clip names                                                                             | Notes                                                                         |
| --------------------------------------------------- | -------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `Door`                                              | `doorSlideHorizontally`, `doorSlideVertically`, `doorOpenHinged`, `doorOpenHingedBack` | Chosen by `doorOpeningType`, see below                                        |
| `Fan`                                               | `SPIN`                                                                                 | Looping; `timeScale` −1 runs it counter-clockwise; stopped with a pause event |
| `MovableDevice`                                     | `start`                                                                                |                                                                               |
| `BaseAnimatedDevice` (road blocks)                  | `opening`, `closing`                                                                   | `timeScale` is randomised 0.8–1.2 if the PS says so                           |
| `ActivatedDeviceTransformAnim`                      | `activate`, `deactivate`, `disable`                                                    |                                                                               |
| `Computer`                                          | `activate`, `deactivate`, `open`, `close`                                              |                                                                               |
| `SecurityGateLock`                                  | `lock`, `unlock`                                                                       |                                                                               |
| Loot containers, `ShardCaseContainer`               | `Open`                                                                                 | Reset with a reset event                                                      |
| Metro cars                                          | `PitchUp`, `PitchDown`                                                                 | Fired by the pitch adjustment tick                                            |
| `Switch`, `BasicDistractionDevice`, scanner control | author-defined                                                                         | The name comes from the PS, so you choose it                                  |
| **Any device**                                      | **any name**                                                                           | Via `PlayTransformAnimationDeviceOperation`                                   |

### Playing one from a Device Operations Container

`PlayTransformAnimationDeviceOperation` is the general-purpose way in, and the only way to reach a clip whose name is not on the list above. It holds an array of `STransformAnimationData`:

| Property        | Type                                | Description                           |
| --------------- | ----------------------------------- | ------------------------------------- |
| `animationName` | `CName`                             | The clip to act on                    |
| `operationType` | `PLAY` / `PAUSE` / `RESET` / `SKIP` | Which of the four events to queue     |
| `playData`      | `STransformAnimationPlayEventData`  | `timeScale`, `looping`, `timesPlayed` |
| `skipData`      | `STransformAnimationSkipEventData`  | Used when `operationType` is `SKIP`   |

That gives you state-driven motion with no scripting: any trigger the container supports can play a clip. See Device Operations Container.

## Doors specifically

Doors are where most people meet this component, and they add two enums on top of it.

`Door.animationType` (`EAnimationType`) picks the whole animation path:

| Value                 | What happens                                                                           |
| --------------------- | -------------------------------------------------------------------------------------- |
| `REGULAR`             | A baked `.anims` clip plays through the animgraph. **The transform clips are ignored** |
| `TRANSFORM`           | The transform animator plays. Closing replays the same clip with a negated `timeScale` |
| `TRANSFORM_TWO_SIDES` | As above, but the door picks a different clip depending on which side the player is on |
| `NONE`                | The door changes state but never moves                                                 |

`Door.doorOpeningType` (`EDoorOpeningType`) then picks which clip, via `GetProperTransformAnimName()`:

| `doorOpeningType`      | Clip played                                                                                                             |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `SLIDING_HORIZONTALLY` | `doorSlideHorizontally`                                                                                                 |
| `SLIDING_VERTICALLY`   | `doorSlideVertically`                                                                                                   |
| `HINGED`               | `doorOpenHinged`, or `doorOpenHingedBack` on a `TRANSFORM_TWO_SIDES` door when the player stands in the side-one volume |
| `GATE`                 | **nothing** (no case in the switch)                                                                                     |
| `HINGED_SIDE_ONE`      | **nothing**                                                                                                             |
| `HINGED_SIDE_TWO`      | **nothing**                                                                                                             |

{% hint style="warning" %}
The last three return `n"None"` on the transform path and play nothing at all. They are only meaningful on `REGULAR`, where the value is handed to the animgraph instead. Setting `GATE` on a `TRANSFORM` door is a silent failure.
{% endhint %}

One asymmetry worth knowing: the negated-`timeScale` replay on close is applied **only** when `animationType` is exactly `TRANSFORM`. On `TRANSFORM_TWO_SIDES`, `doorOpenHingedBack` is not reversed on close, so it has to be authored as a complete open-and-return motion rather than a one-way swing.

### openingSpeed vs doorOpeningTime

Two numbers on `DoorControllerPS.persistentState.doorProperties` look interchangeable and are not:

* **`openingSpeed`** is handed to the play event as its `timeScale`. It changes how fast the mesh moves and nothing else. A stored `0` is coerced to `1`.
* **`doorOpeningTime`** is what the _gameplay code_ waits on. `MoveDoor()` schedules the busy flag, the occluder re-enable and the player blocker from `GetOpeningTime()` alone; it never looks at the animation's real length.

{% hint style="danger" %}
Nothing derives one from the other. Double `openingSpeed` and the door visually opens in half the time while the invisible player blocker and the occluder stay up for the original duration; you get a door that looks open and cannot be walked through. Whenever you change one, change the other.
{% endhint %}

The animation's real length is `duration ÷ timeScale ÷ openingSpeed`, where `duration` is the motion track's duration and `timeScale` is the clip's own. Match `doorOpeningTime` to that.

### The baked path is a different system

If a door is `REGULAR`, none of the fields above do anything. Its motion comes from `entAnimatedComponent.animations.gameplay[].animSet`, an `.anims` file, and the travel distance lives inside the baked clip where no field can reach it.

That ref is an ordinary resource ref, so it _can_ be repointed, but two things have to hold:

1. **The rig must match.** `animSet` declares a rig, and an `.anims` built for another skeleton drives bones the door does not have. Folder is a bad proxy: `door_gate.anims` and `door_single.anims` sit in different folders and share `prop_base_skeleton.rig`, while `door_double.anims` and `door_single.anims` are siblings on different rigs.
2. **Every animation name must still be provided.** The animgraph asks for clips by name, so swapping a 19-animation set for a 1-animation set on the same rig loses everything the graph asks for.

Measured across all 24 shipped door `.anims` on 2.31: 15 distinct rigs, and only four groups with more than one member. In practice that leaves the shutters (`h150` / `h250` / `h400` / `h600`, all on `int_doors_002__shutters.rig`, all providing `open_slide_vertical` and differing only in roll-up distance) plus `door_gate.anims` → `door_single.anims`.

## Overriding an animator per instance

You do not have to edit the `.ent` to change one door in one place. `entEntityInstanceData` can carry a replacement `gameTransformAnimatorComponent` on a single `worldEntityNode`, and CDPR does exactly that: `base\worlds\03_night_city\_compiled\default\exterior_-14_34_1_0.streamingsector` overrides the animator on one `tech_hinged_door.ent` instance, changing the easing from `EET_InOut` to `EET_In` and flipping `doorOpenHinged.numberOfFullRotations` from `0.25` to `-0.25` so that one door swings the other way.

Overrides are applied additively, so a partial chunk works, you do not have to serialise the whole component. Entity chunks (`Door` itself, and therefore `animationType` and `doorOpeningType`) can be overridden the same way.

{% hint style="warning" %}
Instance data overrides components that **already exist**. It cannot add a `gameTransformAnimatorComponent` to an entity that ships without one (eg. `q113_sliding_wall.ent` is a `TRANSFORM` door with no animator at all ) and it cannot add a `parentTransform` binding to a mesh that lacks one. Both of those need a real `.ent` edit.
{% endhint %}

For doing this without WolvenKit, see Transform animations.

## Common mistakes

| Mistake                                                  | What you'll see                       | Fix                                                                  |
| -------------------------------------------------------- | ------------------------------------- | -------------------------------------------------------------------- |
| Nothing bound to the animator                            | Clip "plays", nothing moves           | Check `parentTransform` → `bindName` on the mesh, in the `.ent`      |
| `animationType` is `REGULAR`                             | Clips are ignored entirely            | Switch to `TRANSFORM`, but confirm the binding first                 |
| `doorOpeningType` is `GATE` / `HINGED_SIDE_ONE` / `_TWO` | Door state changes, no motion         | Use `SLIDING_HORIZONTALLY`, `SLIDING_VERTICALLY` or `HINGED`         |
| Clip name typo                                           | Nothing plays, no error               | Names are `CName`s and case-sensitive; whitespace counts             |
| Track created with the abstract base class               | Nothing plays, or a crash             | Pick a concrete `impl`, and fill `movement` and both evaluators      |
| Angle entered in degrees                                 | The door spins 90 times               | `numberOfFullRotations` is fractions of a turn: 90° is `0.25`        |
| `openingSpeed` changed alone                             | Door looks open but blocks the player | Set `doorOpeningTime` to the animation's real length                 |
| `TRANSFORM_TWO_SIDES` with no `doorOpenHingedBack`       | Door works from one side only         | Add the clip, authored as a full open-and-return motion              |
| Looping WWise event on a `PlaySound` track               | Sound never stops                     | Use a one-shot event, or drive it from a Device Operations Container |
