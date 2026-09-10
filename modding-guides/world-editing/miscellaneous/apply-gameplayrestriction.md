---
description: Stop the player from performing certain actions (e.g. drive, fast travel, etc)
---

# Apply GameplayRestriction

## Summary

`GameplayRestriction.*` is how the game switches off one thing the player can normally do: driving, sprinting, opening the menu, using the phone, drawing a weapon. If your quest needs V to stand still and listen, use one/some of these.

There are 100 of them in game version 2.31, counted after leaving out the `_inline` sub-records. This shows you how to apply one, and mentions specifically those that have been actually confirmed in game with a test. You can read the full list under [Reference: GameplayRestriction](../../../for-mod-creators-theory/references-lists-and-overviews/reference-gameplayrestriction.md)

{% hint style="warning" %}
The record names below are extracted from the game and they are all real. What each one _does_ has only been confirmed for a handful.
{% endhint %}

### Wait, this is not what I want!

* To block a device or an interaction instead, check out [Device operations container](../devices/device-operations-container.md)
* To look up record names for something else, check out [Browsing the tweak database](../../../for-mod-creators-theory/tweaks/tweaks/browsing-the-tweak-database.md)
* For what a TweakDB record is at all, check out [TweakDB: Game database](../../../for-mod-creators-theory/tweaks/tweaks/)

## Requirements

### Tools

* [redscript](https://github.com/jac3km4/redscript) (every code sample here is redscript, and you need it to apply or remove a restriction)
* [RED4ext](https://github.com/WopsS/RED4ext) (redscript needs it)
* [TweakXL](https://github.com/psiberx/cp2077-tweak-xl) (only for the "ship your own copy" section)
* [Cyber Engine Tweaks](https://wiki.redmodding.org/cyber-engine-tweaks/) (optional, for inspecting records)
* A copy of the decompiled scripts, if you want to follow the game's own use of a record. Check out [Browsing the tweak database](../../../for-mod-creators-theory/tweaks/tweaks/browsing-the-tweak-database.md)

### Knowledge

* You need to have a basic understanding of:
  * Writing a `.reds` file and getting it to compile
  * Either a `ScriptableSystem` of your own or a `@wrapMethod` hook, so your code has somewhere to run from
  * TweakDB records, and writing a TweakXL `.yaml`
  * Quest facts, if your quest graph is what decides when the restriction is on

{% hint style="info" %}
Two redscript syntax appear in these docs. `t"Some.Record"` is a TweakDBID literal, which is how you name a TweakDB record. `n"some_name"` is a CName literal, which is how you name anything the engine identifies by name.
{% endhint %}

## Applying a GameplayRestriction

Every `GameplayRestriction.*` record is a `gamedataStatusEffect_Record`, so it carries the usual status effect fields: `duration`, `packages`, `gameplayTags`, `statusEffectType`, `maxStacks` and `savable`. You apply one to the player the same way you apply any status effect.

This example stops V getting into a vehicle, which is `VehicleNoInteraction`.&#x20;

Put it in a `ScriptableSystem` so it has somewhere to run from:

```swift
public class MyModSystem extends ScriptableSystem {

  private func GetPlayer() -> ref<GameObject> {
    return GameInstance.GetPlayerSystem(this.GetGameInstance())
      .GetLocalPlayerMainGameObject();
  }

  public func BlockVehicleEntry() -> Void {
    let player: ref<GameObject> = this.GetPlayer();
    if !IsDefined(player) {
      return;
    }
    StatusEffectHelper.ApplyStatusEffect(player,
      t"GameplayRestriction.VehicleNoInteraction");
  }

  public func AllowVehicleEntry() -> Void {
    let player: ref<GameObject> = this.GetPlayer();
    if !IsDefined(player) {
      return;
    }
    StatusEffectHelper.RemoveStatusEffect(player,
      t"GameplayRestriction.VehicleNoInteraction");
  }
}
```

Reach it from anywhere that has a `GameInstance`:

```swift
let sys: ref<MyModSystem> =
  GameInstance.GetScriptableSystemsContainer(game).Get(n"MyModSystem") as MyModSystem;
if IsDefined(sys) {
  sys.BlockVehicleEntry();
}
```

Check `IsDefined` on the player every time. During a load there are frames where the player object does not exist yet.

## Fast travel is different

Fast travel is not blocked with a status effect. The game keeps a list of named reasons fast travel is unavailable, and you add your own reason to that list:

```swift
FastTravelSystem.AddFastTravelLock(n"my_mod_call", game,
                                   t"GameplayRestriction.BlockFastTravel");

FastTravelSystem.RemoveFastTravelLock(n"my_mod_call", game,
                                      t"GameplayRestriction.BlockFastTravel");
```

Both are public statics on `FastTravelSystem`, both take `(reason: CName, game: GameInstance, opt statusEffectID: TweakDBID)`, and `IsFastTravelEnabled()` is true when the list is empty.

A lock can only be removed by the name that added it, and adding a name already on the list has no effect.

{% hint style="warning" %}
Always pass the third argument for safety. With the third parameter **your lock is gone after a save and reload**. Which is much safer and avoids you blocking fast travel forever if you forget to unlock it. The only downside is that you need to add back the lock if needed on load of a save. The `session-start` hook below explains how.

If you don't pass the third argument the lock survives in the player's save until something removes it by name. So if for any reason your "unlock" function is not called, the player will never use fast travel again.
{% endhint %}

`FastTravelSystem.RemoveAllFastTravelLocks(game)` also exists but it clears every mod's locks and the base game's, so don't use it to clean up after yourself.

## A restriction you forget about is permanent

{% hint style="danger" %}
A status effect with `savable` set is written into the player's save file. If your mod applies a restriction and then loses track of it, the player loses that control for the rest of that save.
{% endhint %}

`VehicleNoInteraction` behaves this way. Apply it, save, quit to desktop, relaunch, load, and V still cannot get into a car. Its `duration` is 0, so it never expires on its own either.

### Ship your own copy with saving turned off

`savable` is a field on the record, so base a copy on the one you want and switch it off. Put this in a `.yaml` under `<game>\r6\tweaks\`:

```yaml
GameplayRestriction.mymod_no_vehicle:
  $base: GameplayRestriction.VehicleNoInteraction
  savable: false
```

Then use `t"GameplayRestriction.mymod_no_vehicle"` instead of the base record, and nothing of yours ends up in anybody's save.

Your copy still blocks the desired effect because the game checks for a label on the effect, not for the record's name, and your copy inherits the label from the record you copied. The label here is `VehicleNoInteraction`, read with `StatusEffectSystem.ObjectHasStatusEffectWithTag` in `prereqs.swift`, which takes the "get in" prompt away, and in `quickSlotsManager.swift`, which removed the possibility to summon a veichle.

{% hint style="warning" %}
Confirm that the `savable` line actually applied! TweakXL allows to apply a record even when it rejects one property in it without in-game warning, so check `<game>\red4ext\logs\tweakxl.log` after launch. A rejected property is shown here.
{% endhint %}

### Clear your locks when a session starts

Your script's own memory does not survive a load and the saved effect does, so on the first pass of every session you have to issue a removal for anything your mod could be holding. Removing a restriction that is not applied does nothing and causes no problem.

Example hook:

```swift
public class MyModSystem extends ScriptableSystem {

  private func OnPlayerAttach(request: ref<PlayerAttachRequest>) -> Void {
    let game: GameInstance = request.owner.GetGame();
    let player: ref<GameObject> =
      GameInstance.GetPlayerSystem(game).GetLocalPlayerMainGameObject();
    if !IsDefined(player) {
      return;
    }
    // Use the id you actually apply: VehicleNoInteraction, or your own copy's id
    // if you made one in the section above.
    StatusEffectHelper.RemoveStatusEffect(player,
      t"GameplayRestriction.VehicleNoInteraction");
    FastTravelSystem.RemoveFastTravelLock(n"my_mod_call", game,
      t"GameplayRestriction.BlockFastTravel");

    // The fast travel lock did not survive the load, so put it back if your
    // quest still wants it. Derive that from a quest fact, because script
    // fields do not survive a load either.
    if GameInstance.GetQuestsSystem(game).GetFact(n"my_quest_blocking") > 0 {
      FastTravelSystem.AddFastTravelLock(n"my_mod_call", game,
        t"GameplayRestriction.BlockFastTravel");
    }
  }
}
```

Nothing helps a player who uninstalls your mod while a restriction is applied, because no script is left to lift it.

## Telling the player why

Some restrictions take the prompt away rather than refusing it, so the player gets no explanation and it looks like your mod is broken. `VehicleNoInteraction` is one of those.

Three ways to put a message on screen:

| Route                              | What the player sees                                      |
| ---------------------------------- | --------------------------------------------------------- |
| `UI_Notifications.OnscreenMessage` | Cyan, left of centre, small and low contrast              |
| `UI_Notifications.WarningMessage`  | Red with a warning sign, top of screen. Reads as an alarm |
| `UIInGameNotificationEvent`        | "ACTION BLOCKED", the game's own                          |

The third is what the game sends itself when a weapon restriction refuses an action, in `CheckWeaponAgainstGameplayRestrictions`:

```swift
public static func SayBlocked(game: GameInstance) -> Void {
  let evt: ref<UIInGameNotificationEvent> = new UIInGameNotificationEvent();
  evt.m_notificationType = UIInGameNotificationType.ActionRestriction;
  evt.m_overrideCurrentNotification = true;
  GameInstance.GetUISystem(game).QueueEvent(evt);
}
```

For your own wording you need one of the first two routes, which are the same call with a different blackboard variant:

```swift
public static func SayWhy(game: GameInstance, text: String) -> Void {
  let msg: SimpleScreenMessage;
  msg.isShown = true;
  msg.duration = 4.0;
  msg.message = text;
  msg.type = SimpleMessageType.Undefined;
  GameInstance.GetBlackboardSystem(game)
    .Get(GetAllBlackboardDefs().UI_Notifications)
    .SetVariant(GetAllBlackboardDefs().UI_Notifications.WarningMessage,
                ToVariant(msg), true);
}
```

Swap `WarningMessage` for `OnscreenMessage` to get the cyan one. Pass localized text through `GetLocalizedTextByKey` rather than a literal, so your message is translatable.

## Testing an unknown GameplayRestriction

**1. What does it stop?** Apply it, then try the control.

**2. Is it savable?** Apply it, save, quit to desktop, load, then list the player's effects. Anything still there is savable:

```swift
public static func DumpEffects(game: GameInstance) -> Void {
  let player: ref<GameObject> =
    GameInstance.GetPlayerSystem(game).GetLocalPlayerMainGameObject();
  if !IsDefined(player) {
    return;
  }
  let effects: array<ref<StatusEffect>> = StatusEffectHelper.GetAppliedEffects(player);
  let i: Int32 = 0;
  while i < ArraySize(effects) {
    LogChannel(n"DEBUG", TDBID.ToStringDEBUG(effects[i].GetRecord().GetID()));
    i += 1;
  }
}
```

`LogChannel(n"DEBUG", ...)` output lands in `red4ext`, in the redscript log.

**3. What does the player see?** If the prompt disappears with no message, it's probably best to ship a warning with custom message.

## List of GameplayRestriction

To see the full list of GameplayRestriction that you can apply, check [Reference: GameplayRestriction](../../../for-mod-creators-theory/references-lists-and-overviews/reference-gameplayrestriction.md)
