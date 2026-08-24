---
description: >-
  How to make one radio control any number of others, so the same station
  plays   from several points in the world and stays in sync, without any
  scripting.
icon: radio
---

# Syncing Multiple Radios

### Summary

**Published: 23/08/2026 by** [@Spuddeh](https://discord.com/users/124447344279158784)

**Last documented update: 23/08/2026 by** [@Spuddeh](https://discord.com/users/124447344279158784)

This guide shows you how to make one radio control any number of other radios placed elsewhere in the world. The player interacts with a single radio, and every other radio changes station with it, stays in sync, and turns on and off with it.

It is entirely data driven. There is no Redscript and no CET, and nothing here needs a line of code written.

It continues on from the [Device Operations Container](device-operations-container.md) guide, and reuses the same system.

### Requirements

* [**WolvenKit 8.14+**](https://github.com/WolvenKit/WolvenKit)
* [**World Builder**](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/world-editing/object-spawner)
* [**ArchiveXL**](../../../for-mod-creators-theory/core-mods-explained/archivexl/)
* A [Wolvenkit Project](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/usage/wolvenkit-projects)
* Knowledge of adding world objects with World Builder and merging them via ArchiveXL

### How it works

Three parts, and none of them are obvious on their own.

**A radio cannot control another radio.** There is no master radio class. The game has a master and slave system for devices, but the radio is not part of it, and the sound system that is part of it cannot be a radio.

{% hint style="info" %}
That sound system drives any number of speakers with no questphase at all, and plays the same fourteen stations. What it cannot give you is a real radio, with the prompt and the station list a player expects, which is what this guide builds. [Sound Systems and Speakers](sound-systems-and-speakers.md) covers that route.
{% endhint %}

**A device can set a quest fact when the player uses it.** That is the Device Operations Container. Pressing "Next Station" on the radio sets a fact you name to 1.

**A quest can run a device action on any device it can name.** A questphase can wait on that fact and send "Next Station" to as many other radios as you like.

The fact is the bridge between the two:

```
master radio  ->  player presses Next Station
              ->  device operation sets your fact to 1
questphase    ->  wakes on the fact
              ->  sends Next Station to every other radio
              ->  sets the fact back to 0, ready for the next press
```

The other radios run their **own** Next Station. You never tell them which station to play, only to step forward. Stepping together is what keeps them lined up.

### How to add this to you project

{% stepper %}
{% step %}
### 1. Add the radio entity to your project

In WolvenKit, open the **Asset Browser** tab. In the search box, type:

```
radio_1.ent
```

Find `base\gameplay\devices\home_appliances\radio_sets\radio_1.ent` in the results, right click it, and choose **Add to project**.

<figure><img src="../../../.gitbook/assets/syncing radios - 01 - asset browser search.png" alt="SCREENSHOT: WolvenKit Asset Browser with &#x22;radio_1.ent&#x22; typed in the search box, the result highlighted, right-click menu open showing &#x22;Add to project&#x22;"><figcaption><p><em>Finding the base game radio</em></p></figcaption></figure>

You now have a copy in your Project Explorer, under the same folder path.
{% endstep %}

{% step %}
### 2. Make your master and slave copies

You need two versions of this file. One the player uses, and one for all the others.

In the **Project Explorer**, right click your copy of `radio_1.ent` and choose **Copy**, then right click your mod folder and choose **Paste**. Do this twice, and rename the results:

```
yourmod\entities\radio_master.ent
yourmod\entities\radio_slave.ent
```

<figure><img src="../../../.gitbook/assets/syncing radios - 02 - master and slave copies.png" alt="SCREENSHOT: Project Explorer showing radio_master.ent and radio_slave.ent under a mod folder"><figcaption><p><em>The two entity files</em></p></figcaption></figure>

Use your own mod's folder name in place of `yourmod`. Everything in your archive should sit under a folder unique to you, or you will overwrite another mod's files.
{% endstep %}

{% step %}
### 3. Set the starting station on both files

Every radio has to agree on which station it starts on, or they will start on different ones and never line up.

Open `radio_master.ent` by double clicking it. In the tree on the left, expand:

```
components  ->  controller (RadioController)  ->  persistentState  ->  radioSetup
```

Set these two values:

```
randomizeStartingStation    false      (untick the checkbox)
startingStation             ATTITUDE_ROCK
```

<figure><img src="../../../.gitbook/assets/syncing radios - 03 - radio setup.png" alt="SCREENSHOT: WolvenKit .ent editor, radioSetup expanded, showing randomizeStartingStation unticked and startingStation set"><figcaption><p><em>The radio setup block</em></p></figcaption></figure>

`startingStation` is a dropdown, and the names in it are not the names players see. Here is what each one actually is:

<details>

<summary>List of stations by enum name</summary>

<table data-search="false"><thead><tr><th>startingStation</th><th>Station in game</th></tr></thead><tbody><tr><td><code>ATTITUDE_ROCK</code></td><td>107.3 Morro Rock Radio</td></tr><tr><td><code>AGGRO_INDUSTRIAL</code></td><td>89.3 Radio Vexelstrom</td></tr><tr><td><code>ELECTRO_INDUSTRIAL</code></td><td>92.9 Night FM</td></tr><tr><td><code>HIP_HOP</code></td><td>101.9 The Dirge</td></tr><tr><td><code>POP</code></td><td>98.7 Body Heat Radio</td></tr><tr><td><code>MINIMAL_TECHNO</code></td><td>95.2 Samizdat Radio</td></tr><tr><td><code>AGGRO_TECHNO</code></td><td>103.5 Radio PEBKAC</td></tr><tr><td><code>JAZZ</code></td><td>91.9 Royal Blue Radio</td></tr><tr><td><code>DOWNTEMPO</code></td><td>88.9 Pacific Dreams</td></tr><tr><td><code>LATINO</code></td><td>106.9 30 Principales</td></tr><tr><td><code>METAL</code></td><td>96.1 Ritual FM</td></tr><tr><td><code>GROWL</code></td><td>89.7 Growl FM</td></tr><tr><td><code>DARK_STAR</code></td><td>107.5 Dark Star</td></tr><tr><td><code>IMPULSE_FM</code></td><td>99.9 Impulse</td></tr></tbody></table>

</details>

{% hint style="info" %}
Pick whichever station you like, but **use the same one in both files.**
{% endhint %}

Now open `radio_slave.ent` and set the same two values.

{% hint style="warning" %}
**Leaving `randomizeStartingStation` on breaks the whole thing.** Each radio rolls its own random station on first load, so they all start somewhere different, and the resync in [step 9c](syncing-multiple-radios.md#id-9c.-the-power-chain) has nothing consistent to return them to.
{% endhint %}
{% endstep %}

{% step %}
### 4. Turn off the prompt on the slave

You only want the player to be able to interact with one radio. The others should have no prompt at all.

Still in `radio_slave.ent`, in the same `radioSetup` block, untick:

```
isInteractive     false
```

<figure><img src="../../../.gitbook/assets/syncing radios - 04 - interactive false.png" alt="SCREENSHOT: radioSetup block on the slave with isInteractive unticked"><figcaption><p><em>Only the master keeps its prompt</em></p></figcaption></figure>
{% endstep %}

{% step %}
### 5. Decide what the slaves look like (optional)

**By default a slave looks like an ordinary radio**, because it is one. It keeps all five of `radio_1.ent`'s appearances, and you pick which one you want on each placed node.

That is fine if you want radios dotted around the place. If you want something else, below are two options, and the controller does not care either way. Nothing in this step changes how the network behaves.

#### Option A: make them look like speakers

Open `radio_slave.ent`. In the tree, select **appearances**. Delete the five entries that are there, then add six new ones with the **+** button and fill each in:

| name                  | appearanceName | appearanceResource                                                         |
| --------------------- | -------------- | -------------------------------------------------------------------------- |
| `speaker_set_small`   | `set_small`    | `base\gameplay\devices\home_appliances\radio_sets\appearances\speaker.app` |
| `speaker_set_big`     | `set_big`      | same as above                                                              |
| `speaker_array_a`     | `array_a`      | same as above                                                              |
| `speaker_array_b`     | `array_b`      | same as above                                                              |
| `speaker_single`      | `single`       | same as above                                                              |
| `speaker_single_gold` | `single_gold`  | same as above                                                              |

Then set the file's **defaultAppearance** to `speaker_set_small` or whichever appearance you prefer.

<figure><img src="../../../.gitbook/assets/syncing radios - 05 - slave appearances.png" alt="SCREENSHOT: appearances array on the slave filled with the six speaker entries, defaultAppearance set to speaker_set_small"><figcaption><p><em>Speaker appearances on a radio entity</em></p></figcaption></figure>

These are the speaker models the base game uses, and each one brings its own mesh with it. You pick which of the six you want on each placed node, the same as with any other device.

#### Option B: make them invisible

If your scene already has speakers or other objects in it, and you only want the sound to come from them, delete the appearances and put nothing back.

Open `radio_slave.ent`, select **appearances**, and delete all five entries so the list is empty.

The radio still works. Everything that makes it a radio lives in its components, and only the model comes from the appearance.

Then place your invisible slaves at whatever object you want the sound to seem to come from.
{% endstep %}

{% step %}
### 6. Build the operations container on the master

This is the part that writes the fact when the player uses the radio. It goes on the **master only.**

Open `radio_master.ent` and navigate to:

```
components  ->  controller (RadioController)  ->  persistentState  ->  deviceOperationsSetup
```

It will be empty. Select it, and in the properties panel click the **Add Handle ( + )** button to create a **DeviceOperationsContainer**.

<figure><img src="../../../.gitbook/assets/syncing radios - 06 - operations container.png" alt="SCREENSHOT: deviceOperationsSetup empty, with the Add Handle button about to create a DeviceOperationsContainer"><figcaption><p><em>Creating the container</em></p></figcaption></figure>

Expand the container, you now have two empty arrays, `operations` and `triggers`.

#### 6a. Add the four operations

An **operation** is a thing the device does. Here, each one writes a number into a quest fact.

Select **operations**, click **Add Handle ( + )** four times, and set each new entry's type to **FactsDeviceOperation**. Then fill them in:

| operationName | facts\[0].factName    | factValue | operationType |
| ------------- | --------------------- | --------- | ------------- |
| `radio_next`  | `yourmod_radio_next`  | `1`       | `Set`         |
| `radio_prev`  | `yourmod_radio_prev`  | `1`       | `Set`         |
| `radio_on`    | `yourmod_radio_power` | `1`       | `Set`         |
| `radio_off`   | `yourmod_radio_power` | `0`       | `Set`         |

Each one needs a single entry in its `facts` array, added with **( + )**.

<figure><img src="../../../.gitbook/assets/syncing radios - 07 - operations.png" alt="SCREENSHOT: operations array expanded, one FactsDeviceOperation open showing operationName, factName, factValue and operationType"><figcaption><p><em>One operation, writing one fact</em></p></figcaption></figure>

`Set` writes the number exactly. The other option, `Add`, adds to whatever is already there, which you do not need here because the questphase clears each fact back to 0 as soon as it has acted on it.

Pick your own fact names. They are global and shared with every other mod, so put your mod's name in them.

#### 6b. Add the four triggers

A **trigger** is what makes an operation run. Each one names the operation it fires by its `operationName`.

Select **triggers** and click **+** four times.

The first two are type **DeviceActionOperationsTrigger**. These fire when the player performs an action on the device:

| triggerData.action | operationsToExecute\[0].operationName |
| ------------------ | ------------------------------------- |
| `NextStation`      | `radio_next`                          |
| `PreviousStation`  | `radio_prev`                          |

The `action` field is itself a type selector. Set it to `NextStation` on the first and `PreviousStation` on the second. Nothing inside it needs filling in, the type alone is what gets matched.

The last two are type **BaseStateOperationsTrigger**. These fire when the device turns on or off:

| triggerData.state | operationsToExecute\[0].operationName |
| ----------------- | ------------------------------------- |
| `ON`              | `radio_on`                            |
| `OFF`             | `radio_off`                           |

<figure><img src="../../../.gitbook/assets/syncing radios - 08 - triggers.png" alt="SCREENSHOT: triggers array expanded showing all four, one DeviceActionOperationsTrigger open with its action type and operationsToExecute entry"><figcaption><p><em>Four triggers, one per operation</em></p></figcaption></figure>

**`operationName` must match exactly.** It is case sensitive, and a stray space at either end means the trigger fires and nothing happens, with no error anywhere.

Save both files.
{% endstep %}

{% step %}
### 7. Make the entities spawnable in World Builder

World Builder lists paths it already knows about, and it does not know about your new files. There are two ways round that, and either is fine.

{% hint style="info" %}
**Install your mod before trying either.** World Builder is only handing the game a path, and the game still has to be able to load a file at it.
{% endhint %}

#### Option A: paste the path in

In World Builder's **Spawn New** tab, pick the **Device** category and type or paste the full path into the search box:

```
yourmod\entities\radio_master.ent
```

Nothing will match. Underneath the empty list you get **No match found...** and **Spawn "your path" anyways?** with a **Spawn** button. Click it and the device spawns.

Nothing checks the path first, so a typo spawns nothing and says nothing. If you get an empty group entry, check the spelling.

#### Option B: add them to the list

If you are going to place a lot of these, or you want them to show up like any other device, give World Builder a list to read.

Create a plain text file in your mod at this path:

```
bin\x64\plugins\cyber_engine_tweaks\mods\entSpawner\data\spawnables\entity\device\yourmod.txt
```

Put one line per entity in it:

```
RadioControllerPS yourmod\entities\radio_master.ent
RadioControllerPS yourmod\entities\radio_slave.ent
```

World Builder reads every `.txt` file in that folder, so the file name does not matter as long as it is unique to you.

{% hint style="info" %}
The `RadioControllerPS` at the front is optional. It is the controller class of the device, and World Builder uses it to fill in **Device Class Name** for you when you wire this device into another one's Device Connections. Nothing in this guide wires the radios that way, so you can leave it off. A bare path on its own line works.
{% endhint %}
{% endstep %}

{% step %}
### 8. Place the radios

Launch the game and open World Builder. Add a new group, then add your radios into it as **Device** nodes: one `radio_master.ent`, and one `radio_slave.ent` for every place you want sound coming from.

For **each** radio, open the **World Node** section and click the **generate** button beside the **Node Ref** field to give it a unique reference.

<figure><img src="../../../.gitbook/assets/syncing radios - 09 - node ref.png" alt="SCREENSHOT: World Builder device properties panel showing the Node Ref field with a generated ref and the Persistent checkbox ticked"><figcaption><p><em>Every radio needs a Node Ref</em></p></figcaption></figure>

**Leave Persistent unticked.** All it does is write the device's Instance Data into the `.psrep`, and these radios carry their settings in their `.ent` files instead, so there is nothing for it to write.

{% hint style="warning" %}
**A device with no Node Ref will not work.** They all end up sharing the same internal id, so they overwrite each other and only one survives.
{% endhint %}

{% hint style="info" %}
**Write down every Node Ref, the master's included.** They look like `$/mod/yourgroup/#yoursector_radio_slave`, and you need them exactly as they are in the next step.
{% endhint %}

The slaves are the targets in all three chains. The master is a target too, in the resync node in the power chain, because it has to be told to go back to the starting station along with everything else.

Export your group, then bring the exported sector into your project as normal.
{% endstep %}

{% step %}
### 9. Build the questphase

In WolvenKit, click **New File** at the top, or use the **File** menu. Pick **questQuestPhaseResource** from the list and name it `radio.questphase`.

The new file lands at the root of the Project Explorer. Make a `yourmod\quest` folder and drag it in, so it ends up at:

```
yourmod\quest\radio.questphase
```

{% hint style="info" %}
Where it ends up matters, because that path is what you register with ArchiveXL in [step 10](syncing-multiple-radios.md#id-10.-register-the-questphase).
{% endhint %}

Open it. You get an empty graph. Right click the canvas to add nodes.

**Add one `questInputNodeDefinition`** and make sure its `socketName` is `In1` (default). This is where the phase starts. Everything else hangs off it.

<figure><img src="../../../.gitbook/assets/syncing radios - 10 - quest input node.png" alt="SCREENSHOT: empty questphase graph with a single questInputNodeDefinition placed, showing socketName In1"><figcaption><p><em>The entry point</em></p></figcaption></figure>

You are going to build three chains off this one node. They are independent and all three start from it.

#### 9a. The next station chain

**Add a `questPauseConditionNodeDefinition`.** This waits until something is true. Set:

```
condition                       -> create a questFactsDBCondition
condition.type                  -> create a questVarComparison_ConditionType
condition.type.comparisonType      Greater
condition.type.factName            yourmod_radio_next
condition.type.value               0
```

<figure><img src="../../../.gitbook/assets/syncing radios - 11 - pause condition.png" alt="SCREENSHOT: pause condition node selected, properties panel showing the nested condition with factName and comparisonType"><figcaption><p><em>Waiting for the fact to change</em></p></figcaption></figure>

{% hint style="info" %}
Both of those you do have to pick yourself. Watch the second one: `questVarComparison_ConditionType` compares a fact against a **number**, which is what you want. Its neighbour in the list, `questVarVsVarComparison_ConditionType`, compares a fact against **another fact**.
{% endhint %}

**Add a `questInteractiveObjectManagerNodeDefinition`.** This is the node that presses the button on your other radios. Set:

```
type                            -> create a questDeviceManager_NodeType
type.params                     -> add one entry per slave radio
```

Fill in every entry the same way, changing only `objectRef`:

```
deviceAction              QuestNextStation
deviceControllerClass     RadioControllerPS
objectRef                 $/mod/yourgroup/#yoursector_radio_slave
slotName                  None
```

<figure><img src="../../../.gitbook/assets/syncing radios - 12 - object manager.png" alt="SCREENSHOT: object manager node with params expanded, two entries showing deviceAction, deviceControllerClass and objectRef"><figcaption><p><em>One node, every slave</em></p></figcaption></figure>

One node handles all of your slaves. Add as many entries to `params` as you have radios.

**Add a `questFactsDBManagerNodeDefinition`.** This resets the fact so the next button press is noticed. Its `type` already contains a `questSetVar_NodeType`, so just fill it in:

```
type.factName                yourmod_radio_next
type.setExactValue           true
type.value                   0
```

<figure><img src="../../../.gitbook/assets/syncing radios - 13 - facts manager.png" alt="SCREENSHOT: questFactsDBManagerNodeDefinition selected, properties panel showing type.factName, setExactValue ticked and value 0"><figcaption><p><em>Clearing the fact so the next press registers</em></p></figcaption></figure>

`setExactValue` means "write the number in `value` exactly". It does **not** mean "write 1".

**Now wire them up.** Drag from one node's output socket to the next node's input socket:

```
Input  ->  Pause  ->  ObjectManager  ->  FactsManager  ->  back to Pause
```

<figure><img src="../../../.gitbook/assets/syncing radios - 14 - next chain loop.png" alt="SCREENSHOT: the four nodes wired in a loop, with the connection from the facts manager back to the pause node highlighted"><figcaption><p><em>The loop back is what makes it repeat</em></p></figcaption></figure>

That last connection, from the facts manager back to the pause node, is what lets it work more than once. Without it the radio changes station once and never again.

#### 9b. The previous station chain

Exactly the same four nodes, with two changes:

```
pause condition factName      yourmod_radio_prev
deviceAction                  QuestPreviousStation
facts manager factName        yourmod_radio_prev
```

Wire it the same way, and connect it to the **same** input node. An input node's output can feed as many chains as you like.

#### 9c. The power chain

This one is shaped differently. On and off is a state, not a count, so nothing needs resetting. Instead it waits for one value, then the other, forever.

Five nodes:

```
questPauseConditionNodeDefinition
    factName  yourmod_radio_power   comparisonType  Equal   value  1

questInteractiveObjectManagerNodeDefinition
    deviceAction  ForceON               -> one param per slave

questInteractiveObjectManagerNodeDefinition
    deviceAction  QuestDefaultStation   -> one param per slave AND the master

questPauseConditionNodeDefinition
    factName  yourmod_radio_power   comparisonType  Equal   value  0

questInteractiveObjectManagerNodeDefinition
    deviceAction  ForceOFF              -> one param per slave
```

Wire them in order, then connect the last one back to the **first** pause node.

<figure><img src="../../../.gitbook/assets/syncing radios - 15 - power chain loop.png" alt="SCREENSHOT: the power chain, five nodes wired in a loop"><figcaption><p><em>Waiting for 1, then waiting for 0</em></p></figcaption></figure>

{% hint style="info" %}
The `QuestDefaultStation` node is the important one. It tells every radio, master included, to go back to the `startingStation` you set in [step 3](syncing-multiple-radios.md#id-3.-set-the-starting-station-on-both-files). That means **turning the master off and on again puts the whole network back in sync**, however far out of step it got.
{% endhint %}

{% hint style="warning" %}
Note that `deviceAction` here is `ForceON` and `ForceOFF`, not `QuestForceON` and `QuestForceOFF`. See [Common mistakes](syncing-multiple-radios.md#common-mistakes).
{% endhint %}

Save the file. All three chains together should look like this:

<figure><img src="../../../.gitbook/assets/syncing radios - 16 - full graph.png" alt="SCREENSHOT: the finished questphase graph, all twelve nodes, showing the input node feeding three separate chains"><figcaption><p><em>The finished graph: three loops off one input</em></p></figcaption></figure>

Twelve nodes in total: one input, three for next station, three for previous station, and five for power. The power chain is the long one because it has two pause nodes rather than one, and sends `QuestDefaultStation` as well as `ForceON`.

Nothing connects the chains to each other. They share only the input node, and each one loops back on itself.
{% endstep %}

{% step %}
### 10. Register the questphase

Your questphase will not load until you tell ArchiveXL about it. Open your mod's `.xl` file and add:

```
quest:
  phases:
    - path: yourmod\quest\radio.questphase
      parent: cyberpunk2077.quest
```

**Do not put this in the `.xl` that World Builder generates for you.** That file is rewritten from scratch every time you export a sector, so your quest block will disappear. Use a separate `.xl` that you maintain by hand.
{% endstep %}

{% step %}
### 11. Test it

Install your mod and load your save.

You should be able to walk up to the master radio, change station, and hear every other radio change with it.

If nothing happens, open the CET console and run this, swapping in your own fact name and keeping everything else as it is:

```
print(Game.GetQuestsSystem():GetFactStr("yourmod_radio_next"))
```

Press Next Station on the master, then run it again.

**If it reads 0**, either everything is working, or the radio never wrote the fact at all. Press the button twice quickly and check again. Still 0 means the master's operations container is not running.

**If it reads 1 or more**, the radio is writing the fact correctly and the questphase is the problem. Check your Node Refs against what World Builder actually generated.

{% hint style="info" %}
The console does not print return values on its own. A bare call shows nothing at all, which looks exactly like a fact of 0, so always wrap it in `print()`.
{% endhint %}
{% endstep %}
{% endstepper %}

### Common mistakes

<table data-search="false"><thead><tr><th>Mistake</th><th>What happens</th><th>Fix</th></tr></thead><tbody><tr><td>A space in <code>operationName</code>, <code>deviceAction</code> or a Node Ref</td><td>Silent failure, no error anywhere</td><td>These are matched exactly. Retype rather than pasting</td></tr><tr><td>Using <code>QuestForceON</code> instead of <code>ForceON</code></td><td>The power chain does nothing</td><td>The name you write is the action's internal name, which is not always its type name</td></tr><tr><td><code>deviceOperationsSetup</code> on the entity root</td><td>Never runs</td><td>It has to be on the <strong>PS chunk</strong>, under <code>persistentState</code></td></tr><tr><td>No Node Ref on a device</td><td>Only one radio works</td><td>Every device needs its own. </td></tr><tr><td>Quest block in the World Builder <code>.xl</code></td><td>Works once, breaks after your next export</td><td>Put it in an <code>.xl</code> you maintain by hand</td></tr><tr><td>The <code>.questphase</code> is not where the <code>.xl</code> says it is</td><td>Nothing happens at all, and the graph looks fine</td><td>New files land at the Project Explorer root. Check the file's real path matches the <code>path:</code> in your <code>.xl</code>, character for character</td></tr><tr><td>Different <code>startingStation</code> on master and slave</td><td>They resync to different stations</td><td>They must match exactly</td></tr><tr><td>Forgetting to rebuild the archive</td><td>Changes do not appear, everything looks fine</td><td>Pack your archive again after every edit</td></tr></tbody></table>

### Notes and limits

**Two very fast presses can count as one.** There is a brief moment between the questphase noticing the fact and resetting it. A press in that window is missed, and the slaves end up one station behind. Turning the master off and on again fixes it.

**Only fourteen stations can be a starting station.** `startingStation` is a fixed list, so the resync always returns the network to one of the base game stations.

{% hint style="info" %}
**A sound system has no resync to go wrong.** It pushes every change straight to its speakers, so they never drift apart. If you do not need a radio's own controls, [Sound Systems and Speakers](sound-systems-and-speakers.md) is the simpler build.
{% endhint %}
