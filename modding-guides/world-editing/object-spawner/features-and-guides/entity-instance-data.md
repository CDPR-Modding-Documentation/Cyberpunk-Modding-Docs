---
description: >-
  This page quickly outlines what Entity Instance Data is, what it is used for
  and some basic examples
---

# Entity Instance Data

## What is it

* Entity Instance Data can be defined for any [Entity type node](../supported-nodes.md#entity)
* It is used to override properties of the entity and its components, on a instance basis
  * This means you can make changes to once specific instance of an entity, without changing all the other ones which use the same `.ent`

## What can it do

* It can change any component's properties, just like you would in WolvenKit
* Often this is used for:
  * Changing component size or offset
  * Changing the mesh a component uses
  * Changing behavior of e.g. Doors and other devices
  * Setting up devices such as elevators and FT points

{% hint style="success" %}
The sky is the limit, as you can change each components properties

It can be also very helpful for prototyping custom entities, as you get a realtime preview of the changes, for most properties
{% endhint %}

## Basic Example

* You can see it being used in the guides for [elevators](../../devices/custom-elevators.md), [FT points](../../devices/custom-fast-travel-points.md) and [security areas](../../devices/creating-security-areas.md)
* You can right-click any property or component to reset it back to default

<figure><img src="../../../../.gitbook/assets/OSInstanceData" alt=""><figcaption><p>Making a <strong>Green</strong> and <strong>Wide</strong> arcade machine</p></figcaption></figure>

## Smartframe Example

* This example will show you how to change the size and aspect ration of a smartframe
* First, spawn any of the smartframes as `Entity`, e.g. `base\gameplay\devices\frames\base\smart_frame_a.ent`
* You will need to change the dimensions in three places:
  * Frame mesh component
  * Screen mesh component
  * UI component
* Lets start with the mesh components:
  * The smartframe has two mesh components, find them by searching for `mesh` under the `Entity Instance Data` header
  * Expand them, and scroll down to locate the `visualScale`, then change the size there
* To Adjust the aspect ratio of the UI, find the component named `ui`
  * &#x20;Adjust the values under the `dimensions` header, to have the same ratio as the mesh scales

<figure><img src="../../../../.gitbook/assets/WBSmartFrameExample" alt=""><figcaption><p>First change the two mesh sizes, then adjust the UI size</p></figcaption></figure>
