---
description: What are Prereq_Record and what's their purpose in-game?
---

# Prereqs: customizable conditions

**Created:** May 07 2024 by [Rom's](https://app.gitbook.com/u/jXLBkkjNJXfY5zr8UWIFTnsRZjO2 "mention")\
**Last documented update:** May 07 2024 by [Rom's](https://app.gitbook.com/u/jXLBkkjNJXfY5zr8UWIFTnsRZjO2 "mention")

Prereqs is the mechanism used in the tweaks to express **conditions**, exactly as you would in code with:

```
if Equals(myVar, n"Something") {
    // do something ...
}
```

The primary reason prereqs exist is to allow you to **customize** a condition's values in tweaks. You could do this all in code, of course, but for "repetitive _yet not identical_" conditions it turns out being actually very convenient.

All prereqs are of type [IPrereq\_Record](https://nativedb.red4ext.com/c/7623065297800258) (or of any type that inherit from it).

Prereqs are typically used in conjunction with [Effector\_Record](https://nativedb.red4ext.com/c/4392698852048125), [StatusEffectAIData\_Record](https://nativedb.red4ext.com/c/3334929256584654), and some other types of tweak records. They contain the logic which decides whether e.g. the effector should be applied or not.

All [IPrereq\_Record](https://nativedb.red4ext.com/c/7623065297800258) work similarly to [Effector\_Record](https://nativedb.red4ext.com/c/4392698852048125): they have an associated class which **must** be defined in scripts (and you can also create your own). This class name is specified with the property `prereqClassName` (its **full** name, including the `module` where it lives) and **must** be of type [IScriptablePrereq](https://nativedb.red4ext.com/c/3063836190931757) (or any type that inherits from it).

In WolvenKit it looks like so:

<figure><img src="../../.gitbook/assets/Screenshot 2024-05-08 203328.png" alt=""><figcaption><p>WolvenKit 8.14.0</p></figcaption></figure>

In short the [IPrereq\_Record](https://nativedb.red4ext.com/c/7623065297800258) _holds the values_, while the [IScriptablePrereq](https://nativedb.red4ext.com/c/3063836190931757) _describes the logic_.

[IScriptablePrereq](https://nativedb.red4ext.com/c/3063836190931757) can also sometimes keeps (and caches) a **persistent** state of type [PrereqState](https://nativedb.red4ext.com/c/4778653919830534) (or any type inheriting from it). Internally it might e.g. listen to a [IBlackBoard](https://nativedb.red4ext.com/c/8726831841351071) and update the condition when a given value changes. It allows the game to keep listening to a condition for a short span of time, instead of constantly recreating and deleting the same Prereq over and over again. It's typically used for stats and skills checks.

For example, taking a random Prereq with state from WolvenKit:

<figure><img src="../../.gitbook/assets/Screenshot 2024-05-08 232837.png" alt=""><figcaption><p>WolvenKit 8.14.0</p></figcaption></figure>

Kindly note that there's not (always) an(y) indicator whether the Prereq comes with a state or is stateless, but you can check for it in [adamsmasher's sources](https://codeberg.org/adamsmasher/cyberpunk):

<figure><img src="../../.gitbook/assets/Screenshot 2024-05-08 204905.png" alt=""><figcaption><p>adamsmasher's - IPrereq</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2024-05-08 233913.png" alt=""><figcaption><p>adamsmasher's - PrereqState</p></figcaption></figure>
