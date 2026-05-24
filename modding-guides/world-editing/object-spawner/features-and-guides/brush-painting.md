---
description: This page explains how to use the Brush paint mode
icon: paintbrush
---

# Brush painting

## Summary

Published: May 24 2026 by [Akiway](https://app.gitbook.com/u/2021vbDrMKZ0TbHeIx2wzPyAYtl2 "mention")\
Last documented edit: May 24 2026 by [Akiway](https://app.gitbook.com/u/2021vbDrMKZ0TbHeIx2wzPyAYtl2 "mention")

### What is it for?

Brush painting allows you to add elements randomly to an area using a brush tool.\
The randomization of its content can be configured in two ways :&#x20;

1. **The probabilities** : It defines how many of each element could appear at each stroke, it uses the existing features of [Randomized groups](randomized-nested-groups.md#creating-a-rng).
2. **The variations** : It is global to the brush tool and defines if randomization should also apply to the properties of the elements (size, rotation).

### Requirement

* [World Builder - Akiway's fork](https://github.com/Akiway/CP77_entSpawner/releases/latest) (a.1.3.0 or newer)

{% hint style="info" icon="code-branch" %}
[Akiway's fork of World Builder](https://github.com/Akiway/CP77_entSpawner/releases/latest) is a more advanced version that put the focus on **Quality of Life**.

The version **a.1.3.0** brings the new **Brush painting** feature.
{% endhint %}

## How to use

{% stepper %}
{% step %}
### Prepare the brush

You first need to determine what you want to paint. Start by creating a <mark style="color:purple;">randomized group</mark> <i class="fa-dice-five" style="color:purple;">:dice-five:</i>.

<div data-with-frame="true"><figure><img src="../../../../.gitbook/assets/image (680).png" alt=""><figcaption><p>Give a name and select "Randomized" as group type</p></figcaption></figure></div>

Then fill this group with elements you want to paint.

{% hint style="info" icon="dice-five" %}
_(Optional)_ In this group, you can define the probabilities of each item appearing on each stroke.\
For more details on how to configure a <mark style="color:purple;">randomized group</mark> <i class="fa-dice-five" style="color:purple;">:dice-five:</i>, see the dedicated page : [#creating-a-rng](randomized-nested-groups.md#creating-a-rng "mention")
{% endhint %}

{% hint style="success" icon="square-heart" %}
You can save it as a prefab in the context menu (RMB) of the <mark style="color:purple;">randomized group</mark> <i class="fa-dice-five" style="color:purple;">:dice-five:</i>.\
Your prefabs will then be located in Spawn New tab > [Favorite](../ui-tabs-explained/tab-favorites-and-prefabs.md). I invite you to create a "Brushes" category to group all your best brushes.
{% endhint %}
{% endstep %}

{% step %}
### Setting the brush

The brush is only available in [3D Editor mode](../3-d-editor-mode.md), so starts by enabling it in the [Spawned tab](../ui-tabs-explained/tab-spawned.md) then enable the <mark style="color:purple;">brush paint mode</mark> <i class="fa-paintbrush" style="color:purple;">:paintbrush:</i>.

<div data-with-frame="true"><figure><img src="../../../../.gitbook/assets/image (665).png" alt=""><figcaption><p>Action menu of Spawned hierarchy</p></figcaption></figure></div>

Settings are :&#x20;

* **Size** : radius of the brush circle.
* **Intensity** : quantity of strokes per second.
* **Rotation variations** : enabled axes will randomly change value for each element.
* **Scale variations** : each element will spawn with a scale value in-between the variation set.
* **Dot painting** : performance option, described below ([#dot-painting-option](brush-painting.md#dot-painting-option "mention")).

<div data-with-frame="true"><figure><img src="../../../../.gitbook/assets/image (666).png" alt=""><figcaption><p>Brush settings</p></figcaption></figure></div>

{% hint style="success" %}
The brush status has a tooltip that gives you info on it. Configuration issues are listed inside.

![](<../../../../.gitbook/assets/image (668).png>)
{% endhint %}
{% endstep %}

{% step %}
### Select the source and the target

At this point you should have a <mark style="color:purple;">randomized group</mark> <i class="fa-dice-five" style="color:purple;">:dice-five:</i> and the <mark style="color:purple;">brush paint mode</mark> <i class="fa-paintbrush" style="color:purple;">:paintbrush:</i> enabled.

You now need 2 things : **a source** (our brush with elements to spawn) and **a target** (the group that will contain your painted content, i.e. the final result).

To set the source, simply click on the <mark style="color:purple;">randomized group</mark> <i class="fa-dice-five" style="color:purple;">:dice-five:</i>, its hierarchy row should turn green.

To set the target, create a normal group and set it as the [<mark style="color:purple;">"Spawn New" group</mark>](#user-content-fn-1)[^1] <i class="fa-square-plus" style="color:purple;">:square-plus:</i>. To do it you can select your group and press <kbd>CTRL+N</kbd>, or use the group's context menu and select the corresponding option.

<div data-with-frame="true"><figure><img src="../../../../.gitbook/assets/image (669).png" alt=""><figcaption><p>Group's context menu action to set a target</p></figcaption></figure></div>
{% endstep %}

{% step %}
### Paint

If you've configured your brush correctly, its status should reflect it.

<div data-with-frame="true"><figure><img src="../../../../.gitbook/assets/image (670).png" alt=""><figcaption><p>Brush being ready to use</p></figcaption></figure></div>

When hovering the world with your cursor, a green circle should appear with a size indicator.

<figure><img src="../../../../.gitbook/assets/image (672).png" alt=""><figcaption><p>Green circle with brush radius indicator</p></figcaption></figure>

Left-click in the world to paint. You should see elements appear in your [<mark style="color:purple;">target group</mark>](#user-content-fn-1)[^1] <i class="fa-square-plus" style="color:purple;">:square-plus:</i> as well as in the world.

{% hint style="warning" %}
**The more you paint, the worse your performance will be.**

Loading and spawning a large number of elements during runtime consumes a lot of resources.\
The more elements your brush (source group) contains, the more it will generate with each brush stroke, and so the quicker performances will decrease.

If you need to **paint a lot of things while keeping great performances**, check out this section : [#dot-painting-option](brush-painting.md#dot-painting-option "mention").
{% endhint %}
{% endstep %}

{% step %}
### Finish

When satisfied, simply disable the <mark style="color:purple;">brush paint mode</mark> <i class="fa-paintbrush" style="color:purple;">:paintbrush:</i>.

If you need to add something more after, enable it again and go back to step 3 : [#select-the-source-and-the-target](brush-painting.md#select-the-source-and-the-target "mention").

<figure><img src="../../../../.gitbook/assets/image (674).png" alt=""><figcaption><p>Final result</p></figcaption></figure>
{% endstep %}
{% endstepper %}

### Dot painting option

If you encounter bad performances while painting, consider the <mark style="color:purple;">dot painting</mark> <i class="fa-grid-round" style="color:purple;">:grid-round:</i> option.

<figure><img src="../../../../.gitbook/assets/image (675).png" alt=""><figcaption><p>Dot painting option enabled</p></figcaption></figure>

Using this, painted items will be loaded but not spawned. Instead, a dot will appear on the screen at the exact same position to give you an instant feedback.

<figure><img src="../../../../.gitbook/assets/image (676).png" alt=""><figcaption><p>Painted elements as dots</p></figcaption></figure>

{% hint style="success" icon="palette" %}
Having trouble seeing the dots on the ground? You can change their color using the color picker (colored square) located to the right of the <mark style="color:purple;">dot painting</mark> <i class="fa-grid-round" style="color:purple;">:grid-round:</i> toggle.
{% endhint %}

Dots will disappear when you disable the <mark style="color:purple;">brush paint mode</mark> <i class="fa-paintbrush" style="color:purple;">:paintbrush:</i>.\
To view the final result, simply use the "<i class="fa-eye">:eye:</i> Show all children" option in the [<mark style="color:purple;">target group's</mark>](#user-content-fn-1)[^1] <i class="fa-square-plus" style="color:purple;">:square-plus:</i> context menu.

### Erasing

To erase, simply press <kbd>SHIFT</kbd> while painting, this will remove all elements located inside the brush circle.

In-world brush circle should turn red when you are in erase mod.

<figure><img src="../../../../.gitbook/assets/image (679).png" alt=""><figcaption><p>Red circle with eraser radius indicator</p></figcaption></figure>

{% hint style="success" %}
Don't worry about erasing unwanted content.\
The eraser only remove elements that are inside the [<mark style="color:purple;">target group</mark>](#user-content-fn-1)[^1] <i class="fa-square-plus" style="color:purple;">:square-plus:</i>, and it only removes the elements that are part of the brush (source group).

So any content placed outside of the brush won't get deleted. And if anything wrong happens anyway, you can always use the undo / redo actions, they work with the <mark style="color:purple;">brush paint mode</mark> <i class="fa-paintbrush" style="color:purple;">:paintbrush:</i>.
{% endhint %}

[^1]: The <mark style="color:purple;">target group</mark> <i class="fa-square-plus" style="color:purple;">:square-plus:</i> is the group used as destination for any newly added item.\
    \
    <i class="fa-check" style="color:$success;">:check:</i> <mark style="color:$success;">This applies to :</mark>&#x20;

    * Items spawned from the [Spawn New tab](../ui-tabs-explained/tab-spawn-new.md).
    * Favorites/prefab loaded from the [Favorites sub-tab](../ui-tabs-explained/tab-favorites-and-prefabs.md).
    * Repeated spawn using the 'R' shortcut while in [3D editor](../3-d-editor-mode.md).
    * Items generated in <mark style="color:purple;">brush paint mode</mark> <i class="fa-paintbrush" style="color:purple;">:paintbrush:</i>.

    <i class="fa-xmark" style="color:$danger;">:xmark:</i> <mark style="color:$danger;">This does not apply to :</mark>&#x20;

    * Duplicated element.
    * Groups loaded from the [Saved tab](../ui-tabs-explained/tab-saved.md).
