---
description: How to add light components with AMM
---

# AMM: Light Components

## Summary

**Published**: Feb 09 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented edit**: Feb 11 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will show you how to add a light component to AMM props.

### Wait, this is not what I want!

For a quick overview on lights and their properties, check [cheat-sheet-lights.md](../../../references-lists-and-overviews/cheat-sheet-lights.md "mention") (currently WIP)

For an explanation about light, check [lights-explained.md](../../../files-and-what-they-do/lights-explained.md "mention") (currently WIP)

## Adding lights to AMM props

{% hint style="info" %}
You can learn more about effect components (e.g. how to remove or create effect spawns) on the [effect-components.md](../../../files-and-what-they-do/components/documented-components/effect-components.md "mention") page.
{% endhint %}

This is as easy as finding the right component, adding it to your prop (either in the [root entity](../../../files-and-what-they-do/entity-.ent-files/#root-entity) or in each appearance in the [.app file](../../../files-and-what-they-do/appearance-.app-files/#appearances)) and naming it **Light:**

<figure><img src="../../../../.gitbook/assets/amm_adding_lights.png" alt=""><figcaption><p>For a list of props to steal those components from, check <a data-mention href="../../../references-lists-and-overviews/cheat-sheet-lights.md">cheat-sheet-lights.md</a></p></figcaption></figure>

This enables the AMM light panel in the target tools.

{% hint style="warning" %}
Not all light components actually support colour and intensity changes. Candlelight, for example, does not.
{% endhint %}

## Placing your light components

Your lights will be anywhere relative to your prop. How can you position them relative to the actual object?

1. Add an Empty in Blender (Viewport, Hotkey: `Shift+A` -> Empty -> Plain Axes)
2. Move the empty to the position where you want your light to be
3. Switch to the Object tab and see its location transform:

<figure><img src="../../../../.gitbook/assets/blender_placing_light_components.png" alt=""><figcaption></figcaption></figure>

Now that you have the **relative position**, switch back to Wolvenkit: we need to add it to our `entSlotComponent`.

1. Open the `slots` array and select your first `entSlot`
2. Find the `relativePosition` property in the box on the right
3. Copy the values from the "Transform" field in Blender (Screenshot above) to the corresponding fields under `relativePosition` (screenshot below)

<figure><img src="../../../../.gitbook/assets/entSlotComponent (1).png" alt=""><figcaption><p>WolvenKit should cut off the <code>m</code> automatically.</p></figcaption></figure>

4. Save and see your effect changing positions!

{% hint style="info" %}
If your light doesn't seem to be in the right spot, try multiplying the value for z with -1
{% endhint %}
