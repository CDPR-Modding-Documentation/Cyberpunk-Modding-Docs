---
description: How to manipulate existing PSMs, or create your own.
---

# Player State Machines

A basic state machine (that'll we'll refer to as `MyMod` in this guide) that you can start/stop as needed can be created by using [TweakXL](../../for-mod-creators-theory/core-mods-explained/tweakxl/) tweaks (all .tweak files in this guide) and [Redscript](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-McniwB8YOK2HnJ7SYg_/) classes.

The basic thing needed is your state machine being added to the definition list flats:

{% code title="stateMachine.tweak" %}
```fsharp
playerStateMachine {

	stateMachineListDefinitions += [ "playerStateMachineDefinitions.MyMod" ];
	stateMachineList_prePhysics += [ "MyMod" ];
}
```
{% endcode %}

{% hint style="info" %}
You can use `stateMachineList_postPhysics` instead if you'd like - only the `Crosshair` state machine uses this.
{% endhint %}

You'll also need to create a group like this:

{% code title="stateMachine.tweak" %}
```fsharp
playerStateMachine.MyMod {

	string typeName = "MyMod";
	string definitionName = "MyMod";
	bool default = false;
}
```
{% endcode %}

* `default` will tell the game whether or not to start the state machine automatically - in this case, we want to control when it starts and assign the owner manually, so we'll set it to false.

And the actual definition:

{% code title="stateMachine.tweak" %}
```fsharp
playerStateMachineDefinitions.MyMod {

	CName stateMachineBodyName = "gamestateMachineStateMachineBody";
	string name = "MyMod";
	string type = "MyMod";
	
	// the prefix used in your state definitions below
	string packageName = "playerStateMachineMyMod";
	
	// a list of all state tweak groups, without the package name
	string[] states = [
		"myModEnabled", 
		"myModDisabled"
	];
	
	string startingState = "myModDisabled";
}
```
{% endcode %}

### State Definitions

Finally, you'll need to add each of your states as groups (not a record - just a list of flats) - we'll start with the disabled state, since that's the initial state of the machine:

{% code title="stateMachine.tweak" %}
```fsharp
playerStateMachineMyMod.myModDisabled {

	CName affinity = "None";
	CName[] alias = [];
	
	// each of these controls whether the function is used
	bool hasEnterCondition = true;
	bool hasExitCondition = false;
	bool hasOnEnter = true;
	bool hasOnExit = false;
	bool hasOnUpdate = false;
	bool hasOnTick = false;
	float tickRate = 0.2;
	
	// these two arrays much match in length
	string[] transitionTo = [ 
		"myModEnabled"
	];
	string[] transitionCondition = [ 
		"=" // uses MyModDisabledDecisions.ToMyModEnabled()
	];
}
```
{% endcode %}

On the Redscript side, you can use two different classes to affect your state, a `Decisions` class, and an `Events` class, both of which are prefixed by your state's name with the first letter capitalized - the same modification is needed for any `To[stateName]()` (e.g. `ToMyModEnabled()`) functions:

{% code title="MyModStateMachine.reds" %}
```swift
public class MyModDisabledDecisions extends DefaultTransition {

  // both of these can optionally be defined
  protected func OnAttach(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Void { }
  protected func OnDetach(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Void { }
  
  // this function will only be called when a transitionTo state has a `=` in its condition
  public func ToMyModEnabled(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Bool {
    // implement custom logic here to determine when your machine should enter the myModEnabled state
    return false;
  }
  
  // this will be checked prior to the state being entered
  public func EnterCondition(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Bool {
    return true;
  }
}

public class MyModDisabledEvents extends DefaultTransition {
  // we don't need to have anything here
}
```
{% endcode %}

For the myModEnabled state, we'll have similar definitions:

{% code title="stateMachine.tweak" %}
```fsharp
playerStateMachineMyMod.myModEnabled {

	CName affinity = "None";
	CName[] alias = [];
	
	// each of these controls whether the function is used
	bool hasEnterCondition = false;
	bool hasExitCondition = false;
	bool hasOnEnter = true;
	bool hasOnExit = true;
	bool hasOnUpdate = true;
	bool hasOnTick = false;
	float tickRate = 0.2;
	
	// these two arrays much match in length
	string[] transitionTo = [ 
		"myModDisabled"
	];
	string[] transitionCondition = [ 
		"" // causes MyModDisabledDecisions.EnterCondition() to run continuously
	];
}
```
{% endcode %}

{% code title="MyModStateMachine.reds" %}
```swift
public class MyModEnabledDecisions extends DefaultTransition {

  // both of these can optionally be defined
  protected func OnAttach(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Void { }
  protected func OnDetach(const stateContext: ref<StateContext>, const scriptInterface: ref<StateGameScriptInterface>) -> Void { }
}

public class MyModEnabledEvents extends DefaultTransition {

  protected func OnEnter(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
    // do whatever you want here to set up the state
  }

  protected func OnUpdate(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
    // will run as often as it can
  }
  
  // you can also use an Ontick with a custom tickRate instead
  // protected func OnTick(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void { }
  
  protected func OnExit(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
    // clean-up whatever you did in this state
  }
}
```
{% endcode %}

{% hint style="info" %}
You can define parent classes like `MyModDecisions` (or `MyModTransition`) and `MyModEvents` (or `MyModEventsTransition`), from which the other state classes can be derived. Defining a common `OnEnter` in your `Events` class that prints `NameToString(this.GetStateName())` to the screen/a log can be useful to determine the state of your machine.
{% endhint %}

### How the state definitions work

In the tweak group, `transitionTo` is an array of the state names that it can transition to, and matches up with the `transitionCondition` array, which works a couple different ways:

{% columns %}
{% column %}
`transitionCondition` is `"="`&#x20;

Call a `To[stateName]()` method prior to attempting to transition - this is how the disabled-to-enabled transition is defined, and will be decided by `MyModDisabledDecisions`'s `ToMyModEnabled()`
{% endcolumn %}

{% column %}
`transitionCondition` is `""`

Immediately try transitioning to the state - this is how the enabled-to-disabled transition is defined, and will skip any `To[stateName]()` calls, and only check `MyModDisabledDecisions`'s `EnterCondition()`
{% endcolumn %}
{% endcolumns %}

{% hint style="info" %}
The `transitionCondition` can also specify a custom function like `"ShouldGo"`, which will call the state's `ShouldGo()` function instead of `To[stateName]()`.
{% endhint %}

Usually state machines prefer one method over the other, but in more complicated machines, a combination can be used.

#### Advanced Options

In your `Decisions` class, you can also use `this.EnableOnEnterCondition([true || false])` to turn on/off the EnterCondition checking of that state, which can reduce execution time for more expensive checks - the game will often use this with listeners on blackboard variables (setup in `OnAttach` & destructed in `OnDeatch`).

The `alias`  in the tweak group is a list of names that this state can also be referred to, and can then be used in the `transitionTo` list. This prevents you from having to list many states with the same transition conditions, and is useful for sub-state-machine definitions. See `allVehicleContexts` in the InputContext state machine for examples.

### Starting/Stopping the State Machine

Where you have access to the `player`, via `GetLocalPlayerControlledGameObject()` or some other method, you can start the state machine like this:

{% code title="MyMod.reds" %}
```swift
...      
      let stateMachine = new PSMAddOnDemandStateMachine();
      stateMachine.stateMachineName = n"MyMod";
      // you could also assign objects as the owner, like a vehicle
      // it can be referenced from the transition classes via scriptInterface.owner
      // the player is automatically assigned to scriptInterface.executionOwner
      // stateMachine.owner = vehicle;
      player.QueueEvent(stateMachine);
...
```
{% endcode %}

And stop it like this:

{% code title="MyMod.reds" %}
```swift
...
      let stateMachine = new PSMRemoveOnDemandStateMachine();
      stateMachine.stateMachineIdentifier.definitionName = n"MyMod";
      player.QueueEvent(stateMachine);
...
```
{% endcode %}
