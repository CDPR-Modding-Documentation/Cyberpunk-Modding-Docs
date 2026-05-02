---
description: >-
  This guide will describe the steps necessary to add a new native elevator,
  using World Builder
---

# Custom Elevators

## Requirements

### Tools

* [World Builder](https://github.com/justarandomguyintheinternet/CP77_entSpawner/releases) (0.8 or newer, or [Akiway's fork](https://github.com/Akiway/CP77_entSpawner/releases/latest) a.1.2.0 or newer)
* [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl) (1.20 or newer)
* [Codeware ](https://github.com/psiberx/cp2077-codeware/releases)(1.14.1 or newer)
* [WolvenKit](https://github.com/WolvenKit/WolvenKit) (With latest version of World Builder import script)

### Knowledge

* You need to have a basic understanding of:
  * Working with WolvenKit
  * Using World Builder (Spawning things and [importing](../object-spawner/exporting-from-object-spawner.md) into WolvenKit)



{% hint style="info" icon="code-branch" %}
[Akiway's fork of World Builder](https://github.com/Akiway/CP77_entSpawner/releases/latest) is a more advanced version that put the focus on **Quality of Life**.

The version **a.1.2.0** brings a new **Quick Elevator Setup** feature to help you create one in minutes, without the headache of searching in properties.
{% endhint %}

## Creating the elevator

{% tabs %}
{% tab title="Akiway's fork a.1.2.0 or newer" %}
## Quick Setup Elevator tutorial in video

{% embed url="https://www.youtube.com/watch?list=PL3AzCsUebgGMU-jRkt7eBAAYmJIhpHPgo&v=pwbwUzF0DUU" %}

## Quick Setup Elevator explained

### Spawning the elevator

1. In <mark style="color:purple;">Spawn New</mark> tab, search for an object of type <mark style="background-color:blue;">**Entity**</mark> and variant <mark style="background-color:blue;">**Device**</mark>.
2. Filter the results by <mark style="color:purple;">Device Class Name</mark> and select <mark style="background-color:blue;">**LiftControllerPS**</mark>.
3. Select the elevator you want, some of them have differents appearances.
4. Position the elevator where you want it to be.

### Setting the first floor

{% hint style="warning" icon="hashtag" %}
**A node reference is an unique identifier**, but **it is not a path**. <mark style="color:purple;">Auto-generation</mark> <i class="fa-rotate-exclamation" style="color:purple;">:rotate-exclamation:</i> uses the current group structure to create it. To avoid modding conflicts, you might want to set a custom value instead.

![](<../../../.gitbook/assets/image (267).png>)
{% endhint %}

In the elevator properties, click on the <mark style="color:purple;">Quick Elevator Setup</mark> button, a popup should appear :

<figure><img src="../../../.gitbook/assets/image (656).png" alt=""><figcaption></figcaption></figure>

1. Start by creating a unique [<mark style="color:purple;">node ref</mark>](#user-content-fn-1)[^1] <i class="fa-hashtag" style="color:purple;">:hashtag:</i> for the elevator, this can be done by clicking on the [<mark style="color:purple;">generate button</mark>](#user-content-fn-2)[^2] <i class="fa-rotate-exclamation" style="color:purple;">:rotate-exclamation:</i> on the right of the input.
2. Click on <mark style="color:purple;">+ Add Floor</mark> in the Floor Manager. Each floor contains at least a terminal and a ground marker.
   * The terminal allows the player to call the elevator, it is also needed to register the floor in the elevator memory.
   * The ground marker indicates where the elevator should move for this floor.
   * Both the terminal and the marker have a [<mark style="color:purple;">node ref</mark>](#user-content-fn-1)[^1] <i class="fa-hashtag" style="color:purple;">:hashtag:</i> that are [<mark style="color:purple;">auto-generated</mark>](#user-content-fn-2)[^2] <i class="fa-rotate-exclamation" style="color:purple;">:rotate-exclamation:</i> (customizable).
3. <i class="fa-language" style="color:purple;">:language:</i> Choose a floor name :&#x20;
   * You can use any [LocKey#](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/lockey-browser) value to have a translated text.
   * <mark style="background-color:blue;">**Localization suggestions**</mark> offers you a selection of already existing translations used for this exact purpose. \
     ![](<../../../.gitbook/assets/image (4).png>)
   * This input also accept direct text that won't be translated in other languages (not recommended).
4. <i class="fa-door-open" style="color:blue;">:door-open:</i> Select which door should open.\
   Each floor can open any elevator door (depending on the number of doors of the elevator you have chosen, elevators have between 1 and 3 doors).
5. _(Optional)_ <i class="fa-door-closed" style="color:blue;">:door-closed:</i> Add external doors.
   * These doors are meant to prevent the player from falling into the elevator shaft, they automatically open when the elevator is at the same floor and the player is nearby.
   * You can add as many external doors as you want.
   * External door also requires a [<mark style="color:purple;">node ref</mark>](#user-content-fn-1)[^1] <i class="fa-hashtag" style="color:purple;">:hashtag:</i> that is [<mark style="color:purple;">auto-generated</mark>](#user-content-fn-2)[^2] <i class="fa-rotate-exclamation" style="color:purple;">:rotate-exclamation:</i> by default (customizable).<br>

{% hint style="success" icon="door-open" %}
To help you visualizing which door you want to open, the elevator display **on-screen indicators with door numbers**. To see them, you can close the popup and look at the elevator.

<img src="../../../.gitbook/assets/image (2).png" alt="" data-size="original">
{% endhint %}

{% hint style="info" icon="door-closed" %}
Two externals doors are suggested, but if you wish to use another <mark style="background-color:blue;">**DoorControllerPS**</mark> device, you can do it. Check out this page for manual addition : [custom-elevator-doors.md](custom-elevator-doors.md "mention")
{% endhint %}

### Setting the next floors

Repeat the same process and then, outside of the Quick Elevator Setup popup, select the floor group (containing your terminal, marker and optional doors) and move it. Place it where you want your floor to be.

{% hint style="info" %}
The external doors and terminal are positioned approximately at door n°1, you may need to adjust their position independently per floor.

But keep in mind that the **ground marker and external doors should ideally stay at the same Z axis value** (to avoid elevation differences).
{% endhint %}

{% hint style="success" icon="arrows-to-circle" %}
If you have difficulties positionning your floor, you can directly use the elevator itself.

Place the elevator at the exact position you want it to arrive, and copy-paste its coordinates to the ground marker.
{% endhint %}
{% endtab %}

{% tab title="Official 0.8 or newer" %}
## Spawning nodes

### Overview

* In this guide, we will build a simple elevator with 2 floors
* For this we will need 3 device nodes:
  * An elevator object
  * Two elevator terminals
* Additionally, we will need two markers:
  * One per floor
  * These determine the position to which the elevator drives

### Spawning Devices

{% hint style="warning" %}
Make sure to spawn the elevator and floor terminals as `Device`(`Entity -> Device` in World Builder)
{% endhint %}

* For the elevator, we will use `base\gameplay\devices\elevators\megabuilding_elevator\megabuilding_lift_1.ent`
  * Spawn it as `Device`, and place it somewhere
* For the terminals we will use `base\gameplay\devices\elevators\terminals\elevator_floor_terminal_1.ent`
  * Spawn two of them as `Device`, and place one per stop

### Spawning Markers

* For the markers, select `Meta -> Static Marker`in World Builder
* Spawn two markers
* In order to properly position them, do as follows for each marker / floor:
  * Move the elevator device spawned earlier to the position you want it to stop in
  * Right-Click the position (Under the Transform header) of the elevator device, and select `Copy position and rotation`
  * Select one marker, right click its position field, and select \`Paste position and rotation\`
  * Now you will have moved the marker into the same spot as the elevator
  * Repeat for each marker / floor
* Make sure that once you are done setting up the markers, you move the elevator back to the position of the starting floor

{% hint style="warning" %}
Ensure that the "Primary Range" and "Secondary Range" (Found under the "World Node" header) of the marker nodes is higher than the one of the elevator device
{% endhint %}

## Assigning NodeRef's

* In order to link and reference all the spawned object, each one will need its own, **unique** NodeRef
* Expand the `World Node`header and fill the NodeRef field with a unique string

<figure><img src="../../../.gitbook/assets/image (564).png" alt="" width="351"><figcaption><p>Example of assigning a NodeRef</p></figcaption></figure>

* In the end, we will have assigned 5 NodeRef's
* For **example**:
  * `$/terminal_top`, `$/terminal_bottom`, `$/marker_top`, `$/marker_bottom`, `$/elevator`

{% hint style="warning" %}
Do not use the same NodeRef names as used in this guide, but choose your own unique ones instead.
{% endhint %}

## Linking Devices

* Next we need to tell the elevator which floors it can use
* To do this, we will go to the `Device -> Device Connections` header of the elevator
*   Add one entry for each floor / terminal

    * Fill the device class name field (On the left), with the device class name of the terminal
      * In our case this would be `ElevatorFloorTerminalControllerPS`, which can also be found under the device header of the terminals
    * Fill the NodeRef field with the NodeRef of the terminal that you are linking
    * Keep in mind that the elevator will see the floors in the order in which you add them, so the first one in the list should be the lowest floor

    <figure><img src="../../../.gitbook/assets/image (567).png" alt="" width="449"><figcaption><p>Example of the device connections for an elevator with two floors</p></figcaption></figure>

## Setting up persistency

* In order for the elevator to be fully functional, the terminals must be set to be persistent
* Do this by checking the `Persistent`checkbox of each terminal

## Setting up instance data

* In order for each terminal to know which floor marker to use, and what its name is supposed to be, we will use entity instance data
*   For each terminal, navigate to:

    * `Entity Instance Data / ElevatorFloorTerminalController / persistentState / elevatorFloorSetup`
    * In there, set `floorDisplayName`to the LocKey that you want to be used as name (E.g. `LocKey#49237`
    * Set `floorMarker`to the NodeRef of the floor's static marker (E.g. `$/marker_bottom`)
    * Optionally, use the checkboxes under `doorShouldOpenFrontLeftRight`to determine which doors of the elevator should open on this floor

    <figure><img src="../../../.gitbook/assets/image (566).png" alt="" width="510"><figcaption><p>Example data for a terminals ElevatorFloorSetup (<code>floorMarker</code>NodeRef gets turned into hash)</p></figcaption></figure>
* Optionally change the elevator speed and inital starting floor by modifying:
  * `Entity Instance Data / LiftController / persistentState / liftSetup`


{% endtab %}
{% endtabs %}

## Finishing up

* Let's recap what you should have now:
  * A elevator, spawned as `Device`, with its own NodeRef, and linked to both terminals (Make sure you use the terminals NodeRefs, not the markers)
  * Two terminals, spawned as `Device`, set to be persistent, with their own NodeRefs, and properly setup instance data (Linking them to the floor markers and with names)
  * Two static markers, each with their own NodeRef, positioned correctly
* Once you have all this, you are ready to [export](../object-spawner/exporting-from-object-spawner.md)
* [Import into WKit](../object-spawner/exporting-from-object-spawner.md)

{% hint style="warning" %}
You **must** import the result into WolvenKit and install your mod, in order for the elevator to be functional.

_World Builder preview is not fully functionnal due to hard limitations._
{% endhint %}

{% hint style="warning" %}
If you make changes to the elevator, make sure to use a fresh save game (One where the old elevator was not saved in) after having imported it into WolvenKit
{% endhint %}

[^1]: **A node reference is an unique identifier**, it is not a path.\
    To avoid modding conflicts, make sure to set a ref that follows a pattern of your own.\
    Example : `#/author/modName/group/#myObjectidentifier`

[^2]: <mark style="color:purple;">Auto-generation</mark> <i class="fa-rotate-exclamation" style="color:purple;">:rotate-exclamation:</i> uses the current group structure and element name to create a node ref. The reference unicity cannot be guaranteed with the other mods, so it is recommended to set a custom value.
