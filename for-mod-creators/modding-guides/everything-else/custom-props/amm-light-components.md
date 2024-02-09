---
description: How to add light components with AMM
---

# AMM light components

## Summary

Published: Feb 09 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
Last documented edit: Feb 09 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will show you how to add a light component to AMM props.

### Wait, this is not what I want!

For a quick overview on lights and their properties, check [cheat-sheet-lights.md](../../../references-lists-and-overviews/cheat-sheet-lights.md "mention") (currently WIP)

For an explanation about light, check [lights-explained.md](../../../files-and-what-they-do/lights-explained.md "mention") (currently WIP)

## Adding lights to AMM props

This is as easy as finding the right component, adding it to your prop (either in the [root entity](../../../files-and-what-they-do/entity-.ent-files/#root-entity) or in each appearance in the [.app file](../../../files-and-what-they-do/appearance-.app-files.md#appearances)) and naming it **Light:**

<figure><img src="../../../../.gitbook/assets/amm_adding_lights.png" alt=""><figcaption><p>For a list of props to steal those components from, check <a data-mention href="../../../references-lists-and-overviews/cheat-sheet-lights.md">cheat-sheet-lights.md</a></p></figcaption></figure>

This enables the AMM light panel in the target tools.

{% hint style="warning" %}
Not all light components actually support colour and intensity changes. Candlelight, for example, does not.
{% endhint %}
