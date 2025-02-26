---
description: // TODO
---

# Creating custom scenes

## Summary

{% include "../../.gitbook/includes/this-page-is-a-stub-if-yo....md" %}

One important thing from @mrbill61 on Discord: if you're building the scene from scratch, you must add `performerDebugSymbols` to the `debugSymbols` array. The rest of the elements in this array can remain empty. For actors, the debug symbol is calculated as `actorID * 256 + 1`, while for props, it is calculated as `propID * 256 + 2`. In most cases, the player actor has the highest `actorID`.

In Sections, actors are referenced by their `performerID`, but in `screenplayStore -> lines`, dialogues are linked to them using their `actorID`. Props, on the other hand, are typically referenced by `propID`, although they can be called by `performerID` for lookat events.

<figure><img src="../../.gitbook/assets/Scenes-performerDebugSymbols.png" alt=""><figcaption></figcaption></figure>
