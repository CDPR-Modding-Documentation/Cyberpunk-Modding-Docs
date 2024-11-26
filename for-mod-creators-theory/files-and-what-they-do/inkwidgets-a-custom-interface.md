---
description: How to create a custom interface via inkwidgets and animate via inkanims
---

# Inkwidget: interface definition

## Summary

Created: ???\
Last documented update: Nov 26 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page lists theory information about interface elements. For more hands-on information, check [interface-modding.md](../../modding-guides/custom-icons-and-ui/interface-modding.md "mention").

## Inkwidgets: a custom interface

Inkwidgets are a mapping of widgets and effects onto a 2D plane.

The structure of inkwidget is a graph/tree with parent and children nodes.

### _Important elements of the inkwidget_

* anchor - This is treated as the center of the widget. It is what animations are centered, scaled, and rotated around.
* margin - This is what allows precise positioning of the widget by adding space in the corresponding direction. Can use negative numbers as values as well. Widget Preview in WolvenKit is useful when adjusting margin values.
* parentWidget - This should always point back to the parent. When you are creating or editing children, make sure to right-click the parent in WolvenKit and select 'Copy Handle', then right-click the child parentWidget and select 'Paste Handle'.
* effects - Enable certain effects that can be triggered from a corresponding .inkanim file. Note that overlaying two of the same effect on the same widget can cause flickering when rendered in game, even if the animation times are offset, so test in game when trying this. Effects must be triggered from a inkanimEffectInterpolator with the matching effectName and effectType in the inkanim file.
* renderTransform - Adds the ability to perform a scale, rotation, and shear to the widget. Without this, you would need multiple source graphics in different orientations/sizes, so using this is useful.
* textureAtlas - Full path to the inkatlas file that contains your image.
* texturePart - The name of the part of the graphic defined in the inkatlas file.
* visible - Shows or hides the widget. Useful when testing or aligning widgets in Widget Preview.

## Inkanims: apply animations to widgets in Inkwidgets

Each animation needs a definition (what kind of animation) and target (which widget animation applies to).

### _Important elements of inkanim definitions_

There are a set number of different animation types. Their names are mostly self-explanatory. In WolvenKit, use 'Create Handle' on a handleinkanimInterpolator to choose a animation.

* duration - The time in seconds that the animation should last.
* startDelay - Time in seconds from the beginning of the animation that this animation should trigger.
* startValue/endValue - Can be a single value if using something like a transparency animation (0 is transparent, 1 is opaque), or more values for example a 2D coordinate if using a translation animation.
* effectName - Must match with a named effect in the inkwidget file to trigger.
* effectType - Choose one of the available types of effects. Must match with the effect type defined in the inkwidget file.

The last definition are AdvertPauseEvents. These are the times in seconds from the start of the animation that the animated inkwidget can pause when moving out of animation range in game. Multiple of these can be defined to make it possible to pause at multiple points in the animation.

### _inkanim targets_

Can have any number of values, relating to the corresponding inkwidget file children nodes. Define these values, adding a new element in the array for each nested child as needed. For example, if you want to animate a widget that is nested in the first child, and the sixth child within the first child, then the target path would be 0 # 0, 1 # 5.

The definitions and targets are linked by their index in the array (e.g. first definition uses the first target, and so on). The last target doesn't have a path because it corresponds to the AdvertPauseEvent definition, but do not delete this as the inkanim should have the same number of targets as definitions.

Ensure that the total number of inkWidgetLibraryItems in the inkwidget file is the same as the total number sequences in the inkanim file - 1 (subtract one because Root inkWidgetLibraryItem is a given and not counted). Also, the order of the sequences in inkanim should be the same order of the inkWidgetLibraryItems in the inkwidget file.
