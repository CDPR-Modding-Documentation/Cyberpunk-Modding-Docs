---
description: >-
  How to play custom sounds (effects, dialogue, music) from custom emitters,
  using Audioware, and without REDmod.
---

# Custom Sounds & Custom Emitters with Audioware

{% hint style="info" %}
Before getting started, it's important to note that all the information below (and much more) can be found on the [Audioware Wiki](https://cyb3rpsych0s1s.github.io/audioware). This is a very basic guide. At the time of publishing this, [Audioware](https://www.nexusmods.com/cyberpunk2077/mods/12001), by [Roms1383](https://next.nexusmods.com/profile/Roms1383), was in version 1.0.2. The guide has since been updated for [Audioware](https://www.nexusmods.com/cyberpunk2077/mods/12001) version 1.3.2. This guide was written by [Demon9ne](https://next.nexusmods.com/profile/Demon9ne).
{% endhint %}

{% hint style="warning" %}
Proceeding through the example below will require a basic familiarity with [Redscript](https://www.nexusmods.com/cyberpunk2077/mods/1511), and you will need to have [Audioware](https://www.nexusmods.com/cyberpunk2077/mods/12001) and its prerequisite mods ([Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780), etc.) installed.
{% endhint %}

## **Foundational Decisions (Concept, etc.)**

Perhaps you want radios to play a sound effect when they're switched off? Or citizens to spout angry dialogue at V when she steals their vehicle? Or vending machines to play music to entice you to purchase Night City's terrible mass-produced food or drink options?—You'll want to brainstorm your specific implementation before proceeding. If you're not sure if an idea is feasible, ask around on the modding Discord. Someone ought to know what method you can wrap to achieve your specific goal.

It's likelier, however, that you'll develop a mod that is wholly unrelated to audio, and want to spice it up afterward with some sound. Perhaps you've authored a new gun mod, and you'd like the gun to play a sound effect when it powers down? Or perhaps you'd like your new helmet mod to play a filtered breathing sound at intervals? Or perhaps you want your new jewelry mod to jingle on occasion. You'll find it beneficial to have a goal in mind at this point.

After you have a solid idea, you'll need sound files. You can find free sounds on the internet (perhaps [here](https://freesound.org/)) or [select a sound that's already present in the game](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/sound/finding-an-audio-file). The [Audioware Wiki](https://cyb3rpsych0s1s.github.io/audioware) has a list of sound formats that are compatible. (mp3, wav, ogg, flac, currently.)

{% hint style="success" %}
Don't forget to save the names of the sounds' creators, as well as their URLs. Always credit others' work, if you're going to use it.
{% endhint %}

In the basic example below, we'll register Cyberpunk's android entities to play sound effects, when they're struck. We'll call the mod **Android\_Malfunction**. It's good to have a unique mod title in mind right away, because in the next steps, we'll appropriately name files, folders, and so forth.

## **File Structure**

Your mod is going to have the following folder structure, wherein <mark style="color:green;">**YourMod**</mark> represents your mod's unique title (and perhaps your module's name, for consistency) and <mark style="color:green;">**SoundName**</mark> represents whatever you decide to name your sound(s):

Your sound files and your sound manifest (a .yml or .yaml file) will be located in: resources\r6\audioware\\<mark style="color:green;">**YourMod**</mark>\\

Your Redscript (.reds) file will be located in: resources\r6\scripts\\<mark style="color:green;">**YourMod**</mark>\\

That said, our list of files will be:

* resources\r6\audioware\Android\_Malfunction\\<mark style="color:green;">**SoundName**</mark>.mp3/.wav/.ogg/.flac
* resources\r6\audioware\Android\_Malfunction\Android\_Malfunction.yaml
* resources\r6\scripts\Android\_Malfunction\Android\_Malfunction.reds

## Audioware Manifest

Without further delay, here's the Audioware manifest we'll be using, containing five sound effects:

```
version: 1.0.0
sfx:
  Android_Malfunction_1:
    file: Electric_Hit.wav
    settings:
      volume: 1.0
  Android_Malfunction_2:
    file: Plague_Databurst.wav
    settings:
      volume: 0.5
  Android_Malfunction_3:
    file: Malfunctioning_Robot.wav
    settings:
      volume: 1.5
  Android_Malfunction_4:
    file: Computer_Breaking.wav
    settings:
      volume: 0.5
  Android_Malfunction_5:
    file: Electric_Zap.wav
    settings:
      volume: 1.5
```

The version line is required, and should be set to **1.0.0**. And we have a sound effects (**sfx**) section that lists the sounds we'll be using. We're specifying that they should be played at **1.0** (100%) volume, **0.5** (50%) volume, or **1.5** (150%) volume, depending on the sound. Everything is named very simply and everything is indented properly (spaces, not tabs; 2 per indent).

## Redscript

Our first line of code is always our module name:

```
module Android_Malfunction
```

Next, our imports, for relevant prerequisite mods:

```
import Codeware.*
import Audioware.*
```

We're going to "cheat" a bit here—for the sake of brevity and shorter code—and register the entities as emitters immediately before playing a sound effect. Audioware does allow this. We just have to make sure we aren't registering entities multiple times each.

And here's the function we'll wrap, to register our androids as emitters and play one of our sounds, when they are struck in combat—study it for a second before proceeding—because it has a problem that we'll address in the next step:

```
@wrapMethod(NPCPuppet)
protected cb func OnHit(evt: ref<gameHitEvent>) -> Bool {
	if this.IsAndroid() && !this.IsDead() {
		let game: GameInstance = GetGameInstance();
		let entityID: EntityID = this.GetEntityID();
		if EntityID.IsDefined(entityID) {
			let audioware: ref<AudioSystemExt> = GameInstance.GetAudioSystemExt(game);
			if !audioware.IsRegisteredEmitter(entityID, n"Android_Malfunction") {
				audioware.RegisterEmitter(entityID, n"Android_Malfunction", n"");
			};
			if  audioware.IsRegisteredEmitter(entityID, n"Android_Malfunction") {
				audioware.PlayOnEmitter(StringToName("Android_Malfunction_" + RandRange(1, 3)), entityID, n"Android_Malfunction");
			};
		};
	};
	return wrappedMethod(evt);
}
```

Did you notice the problem above?—Suppose an android is repeatedly hit, such as by a high fire-rate weapon?—Our resulting sound effects will immediately overlap one another and sound cacophonous. We need to alleviate that.

We'll do this using one of Redscript's greatest assets to audio modding: a callback. Our callback will take two variables: the **audioware** system and the android's **entityID**. We'll also be creating a field, to hold the **DelayID** of the callback, which we'll update, per callback. Here's all that:

```
@addField(NPCPuppet)
public static let lastAndroidHitSfxDelayID: DelayID;

public class AndroidHitSfxDelayCallback extends DelayCallback {
	let audioware: ref<AudioSystemExt>;
	let entityID: EntityID;
	public func Call() -> Void {
		this.audioware.PlayOnEmitter(StringToName("Android_Malfunction_" + RandRange(1, 6)), this.entityID, n"Android_Malfunction");
	}
}
```

Next, we have to modify the function we started with above, to execute the callback we just wrote. So let's update it, as follows:

```
@wrapMethod(NPCPuppet)
protected cb func OnHit(evt: ref<gameHitEvent>) -> Bool {
	if this.IsAndroid() && !this.IsDead() {
		let game: GameInstance = GetGameInstance();
		let entityID: EntityID = this.GetEntityID();
		if EntityID.IsDefined(entityID) {
			let audioware: ref<AudioSystemExt> = GameInstance.GetAudioSystemExt(game);
			if !audioware.IsRegisteredEmitter(entityID, n"Android_Malfunction") {
				audioware.RegisterEmitter(entityID, n"Android_Malfunction", n"");
			};
			if  audioware.IsRegisteredEmitter(entityID, n"Android_Malfunction") {
				let ds: ref<DelaySystem> = GameInstance.GetDelaySystem(game);
				if IsDefined(ds) {
					let callback: ref<AndroidHitSfxDelayCallback> = new AndroidHitSfxDelayCallback();
					callback.audioware	= audioware;
					callback.entityID	= entityID;
					this.lastAndroidHitSfxDelayID = ds.DelayCallback(callback, this.lastAndroidHitSfxDelayID == new DelayID() ? 0.0 : 0.75 + MaxF(0.0, ds.GetRemainingDelayTime(this.lastAndroidHitSfxDelayID)));
				};
			};
		};
	};
	return wrappedMethod(evt);
}
```

Not terribly different; not terribly difficult. You'll notice we're incrementing the callback's delay by **0.75** (seconds), each subsequent hit, while there's a callback ongoing—you can substitute any number there instead, based on factors of your choosing (such as what your sound effects sound like together, or their average lengths). For our purposes, we want our androids to sound like they're experiencing awful electronic destruction, but not _too much_, so this amount will do fine.

It's also worth noting here that you can _and should_ use 0.0 for a next-frame callback instead of DelayCallbackNextFrame(), which we do here when an android is hit for the first time.

Finally, let's have a look at the complete script:

```
module Android_Malfunction

import Codeware.*
import Audioware.*

@addField(NPCPuppet)
public static let lastAndroidHitSfxDelayID: DelayID;

public class AndroidHitSfxDelayCallback extends DelayCallback {
	let audioware: ref<AudioSystemExt>;
	let entityID: EntityID;
	public func Call() -> Void {
		this.audioware.PlayOnEmitter(StringToName("Android_Malfunction_" + RandRange(1, 6)), this.entityID, n"Android_Malfunction");
	}
}

@wrapMethod(NPCPuppet)
protected cb func OnHit(evt: ref<gameHitEvent>) -> Bool {
	if this.IsAndroid() && !this.IsDead() {
		let game: GameInstance = GetGameInstance();
		let entityID: EntityID = this.GetEntityID();
		if EntityID.IsDefined(entityID) {
			let audioware: ref<AudioSystemExt> = GameInstance.GetAudioSystemExt(game);
			if !audioware.IsRegisteredEmitter(entityID, n"Android_Malfunction") {
				audioware.RegisterEmitter(entityID, n"Android_Malfunction", n"");
			};
			if  audioware.IsRegisteredEmitter(entityID, n"Android_Malfunction") {
				let ds: ref<DelaySystem> = GameInstance.GetDelaySystem(game);
				if IsDefined(ds) {
					let callback: ref<AndroidHitSfxDelayCallback> = new AndroidHitSfxDelayCallback();
					callback.audioware	= audioware;
					callback.entityID	= entityID;
					this.lastAndroidHitSfxDelayID = ds.DelayCallback(callback, this.lastAndroidHitSfxDelayID == new DelayID() ? 0.0 : 0.75 + MaxF(0.0, ds.GetRemainingDelayTime(this.lastAndroidHitSfxDelayID)));
				};
			};
		};
	};
	return wrappedMethod(evt);
}

```

You can find the mod's complete files [here](https://www.nexusmods.com/cyberpunk2077/mods/16505), and play with it yourself, if you'd like.

And that's all there is to it, really, but again: you should familiarize yourself with the [Audioware Wiki](https://cyb3rpsych0s1s.github.io/audioware), and play around with the many options and settings made available to you.

The author, [Roms1383](https://next.nexusmods.com/profile/Roms1383), worked very hard on the mod for a very long time, so perhaps contact him with any feedback or feature requests you may have. It could improve things for many other authors.
