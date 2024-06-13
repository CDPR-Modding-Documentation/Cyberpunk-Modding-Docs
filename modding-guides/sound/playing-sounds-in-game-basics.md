---
description: A Basic guide on the different ways to play a sound effect in-game
---

# Playing Sounds in-game : Basics

## Difficulty:

This is a very basic tutorial so you don't need much knowledge to do it successfully.

## Requirements:

* Wolven kit
* Any text editor capable of opening a big JSON file without crashing

That's about it.

## A quick introduction:

This tutorial presumes that you already have a mod project in WolvenKit and will not walk you through how to create one.

If you don't have **redscripts** in your project, you will need to add the following structure to your **resources** folder inside your mod folder:

```
r6/
├─ scripts/
│  ├─ your_script.reds
```

## Actually playing sounds:

There are 3 documented ways to play sounds using scripting. Two are linked to the event system and the third one is linked to a helper function:

### Using the event system:

#### &#x20;The first way:

```swift
let evt: ref<SoundPlayEvent> = new SoundPlayEvent();
evt.soundName = n"ono_v_effort_short";
player.QueueEvent(evt);
```

#### The second way:

```swift
let evt: ref<AudioEvent> = new AudioEvent();
evt.eventName = n"ono_v_effort_short";
player.QueueEvent(evt);
```

### Using the helper function:

```swift
GameObject.PlaySoundEvent(player, n"ono_v_effort_short");
```

If you try to run the script now it will most likely fail because you don't have the player object used to queue or play the event.

So how to get the player?

It's actually quite easy, once a save has been loaded, you can simply use:

```swift
let player: wref<PlayerPuppet> = GetPlayer(GetGameInstance())
```

You are not even obligated to get the player. You can use any `GameObject` capable of handling events in the event way and you can use any `GameObject` at all using the helper function. If it isn't valid, the `GameObject` method will use the game engine to play the sound. (It will not be spatialized this way)

## Playing any sounds that aren't V grunting:

If you did everything correctly, your sound should be played in the part of the script where you used it.

And now, you will probably want to play other sounds. Sounds played by the game are referenced using a `redIdentifier.` To find many of these identifiers for sounds, you will need to use WolvenKit and navigate to:

```
base/
├─ sound/
│  ├─ event/
│  │  ├─ event_metadata.json
```

You can then import it into your project, turn it into JSON and explore the JSON file to find all the tags, for example:&#x20;

```json
sq027_sc_08_panam_pours_drink
```

Use any of these IDs and experiment!

There is a lot of them so use string search to find them more quickly. You can also search for them in the `events` array for an easier search with tags.
