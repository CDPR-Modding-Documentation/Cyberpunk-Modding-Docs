---
description: >-
  This guide will describe the steps necessary to add new native elevator, using
  Object Spawner
---

# Custom elevators

## Requirements

### Tools

* [Object Spawner](https://github.com/justarandomguyintheinternet/CP77_entSpawner/releases) (v.0.8. or newer)
* [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl) (1.20 or newer)
* [WolvenKit](https://github.com/WolvenKit/WolvenKit) (With latest version of Object Spawner import script)

### Knowledge

* You need to have a basic understanding of:
  * Working with WolvenKit
  * Using Object Spawner (Spawning things and [importing](https://github.com/justarandomguyintheinternet/CP77_entSpawner?tab=readme-ov-file#converting-to-standalone-axl-mod) into WolvenKit)

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
Make sure to spawn the elevator and floor terminals as `Device`(`Entity -> Device` in Object Spawner)
{% endhint %}

* For the elevator, we will use `base\gameplay\devices\elevators\megabuilding_elevator\megabuilding_lift_1.ent`
  * Spawn it as `Device`, and place it somewhere
* For the terminals we will use `base\gameplay\devices\elevators\terminals\elevator_floor_terminal_1.ent`
  * Spawn two of them as `Device`, and place one per stop

### Spawning Markers

* For the markers, select `Meta -> Static Marker`in Object Spawner
* Spawn two markers
* In order to properly position them, do as follows for each marker / floor:
  * Move the elevator device spawned earlier to the position you want it to stop in
  * Right-Click the position (Under the Transform header) of the elevator device, and select `Copy position and rotation`
  * Select one marker, right click its position field, and select \`Paste position and rotation\`
  * Now you will have moved the marker into the same spot as the elevator
  * Repeat for each marker / floor

## Assigning NodeRef's

* In order to link and reference all the spawned object, each one will need its own, **unique** NodeRef
* Expand the `World Node`header and fill the NodeRef field with a unique string

<figure><img src="../../.gitbook/assets/image (555).png" alt="" width="351"><figcaption><p>Example of assigning a NodeRef</p></figcaption></figure>

* In the end, we will have assigned 5 NodeRef's
* For example:
  * `$/terminal_top`, `$/terminal_bottom`, `$/marker_top`, `$/marker_bottom`, `$/elevator`

## Linking Devices

* Next we need to tell the elevator which floors it can use
* To do this, we will go to the `Device -> Device Connections` header of the elevator
*   Add one entry for each floor / terminal

    * Fill the device class name field (On the left), with the device class name of the terminal
      * In our case this would be `ElevatorFloorTerminalControllerPS`, which can also be found under the device header of the terminals
    * Fill the NodeRef field with the NodeRef of the terminal that you are linking
    * Keep in mind that the elevator will see the floors in the order in which you add them, so the first one in the list should be the lowest floor

    <figure><img src="../../.gitbook/assets/image (559).png" alt="" width="449"><figcaption><p>Example of the device connections for an elevator with two floors</p></figcaption></figure>

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

    <figure><img src="../../.gitbook/assets/image (558).png" alt="" width="510"><figcaption><p>Example data for a terminals ElevatorFloorSetup (<code>floorMarker</code>NodeRef gets turned into hash)</p></figcaption></figure>
*   Optionally change the elevator speed and inital starting floor by modifying:

    * `Entity Instance Data / LiftController / persistentState / liftSetup`



## Finishing up

* Let's recap what you should have now:
  * A elevator, spawned as `Device`, with its own NodeRef, and linked to both terminals (Make sure you use the terminals NodeRefs, not the markers)
  * Two terminals, spawned as `Device`, set to be persistent, with their own NodeRefs, and properly setup instance data (Linking them to the floor markers and with names)
  * Two static markers, each with their own NodeRef, positioned correctly
* Once you have all this, you are ready to export, and import into WKit using the Object Spawner import script
